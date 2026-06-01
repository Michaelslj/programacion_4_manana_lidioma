package com.shopapp.di

import com.shopapp.BuildConfig
import com.shopapp.data.local.TokenDataStore
import com.shopapp.data.remote.api.AuthApi
import com.shopapp.data.remote.api.CategoryApi
import com.shopapp.data.remote.api.OrderApi
import com.shopapp.data.remote.api.ProductApi
import com.shopapp.data.remote.api.UserApi
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import kotlinx.coroutines.runBlocking
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object NetworkModule {

    @Provides
    @Singleton
    fun provideOkHttpClient(
        tokenDataStore: TokenDataStore,
        authApiProvider: javax.inject.Provider<AuthApi> // Usamos Provider para evitar dependencia circular
    ): OkHttpClient {
        val logging = HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BODY
        }

        return OkHttpClient.Builder()
            .addInterceptor(logging)
            .addInterceptor { chain ->
                val token = runBlocking { tokenDataStore.getAccessToken() }
                val request = chain.request().newBuilder().apply {
                    if (token != null) {
                        addHeader("Authorization", "Bearer $token")
                    }
                }.build()
                chain.proceed(request)
            }
            .authenticator { _, response ->
                // Este bloque se ejecuta solo en errores 401
                synchronized(this) {
                    val refreshToken = runBlocking { tokenDataStore.getRefreshToken() }
                    if (refreshToken == null) return@authenticator null

                    // Intentar refrescar el token
                    val refreshResponse = runBlocking {
                        authApiProvider.get().refreshToken(
                            com.shopapp.data.remote.dto.TokenRefreshRequest(refreshToken)
                        )
                    }

                    if (refreshResponse.isSuccessful) {
                        val newTokens = refreshResponse.body()!!
                        runBlocking {
                            tokenDataStore.saveAccessToken(newTokens.access)
                            if (newTokens.refresh != null) {
                                tokenDataStore.saveTokens(newTokens.access, newTokens.refresh)
                            }
                        }
                        // Reintentar la petición original con el nuevo token
                        response.request.newBuilder()
                            .header("Authorization", "Bearer ${newTokens.access}")
                            .build()
                    } else {
                        // Si el refresh también falla, cerrar sesión
                        runBlocking { tokenDataStore.clearSession() }
                        null
                    }
                }
            }
            .build()
    }

    @Provides
    @Singleton
    fun provideRetrofit(okHttpClient: OkHttpClient): Retrofit {
        return Retrofit.Builder()
            .baseUrl(BuildConfig.API_BASE_URL)
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }

    @Provides
    @Singleton
    fun provideAuthApi(retrofit: Retrofit): AuthApi = retrofit.create(AuthApi::class.java)

    @Provides
    @Singleton
    fun provideCategoryApi(retrofit: Retrofit): CategoryApi = retrofit.create(CategoryApi::class.java)

    @Provides
    @Singleton
    fun provideProductApi(retrofit: Retrofit): ProductApi = retrofit.create(ProductApi::class.java)

    @Provides
    @Singleton
    fun provideOrderApi(retrofit: Retrofit): OrderApi = retrofit.create(OrderApi::class.java)

    @Provides
    @Singleton
    fun provideUserApi(retrofit: Retrofit): UserApi = retrofit.create(UserApi::class.java)
}
