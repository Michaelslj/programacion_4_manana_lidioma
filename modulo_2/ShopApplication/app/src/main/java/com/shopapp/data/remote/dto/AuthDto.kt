// data/remote/dto/AuthDto.kt
package com.shopapp.data.remote.dto

import com.google.gson.annotations.SerializedName

data class LoginRequest(
    val username: String,
    val password: String,
)

data class RegisterRequest(
    val username:  String,
    val email:     String,
    val password:  String,
    @SerializedName("password2") val password2: String,
)

data class TokenRefreshRequest(
    val refresh: String,
)

data class LogoutRequest(
    val refresh: String,
)

data class AuthResponseDto(
    val access:   String,
    val refresh:  String,
    @SerializedName("user_id")  val userId:  Int,
    val username: String,
    val email:    String,
    @SerializedName("is_staff") val isStaff: Boolean,
)

data class TokenRefreshResponseDto(
    val access:  String,
    val refresh: String?,   // con ROTATE_REFRESH_TOKENS=True también devuelve nuevo refresh
)


data class PasswordResetRequestDto(
    @SerializedName("email") val email: String,
)

data class PasswordResetConfirmDto(
    @SerializedName("uid")           val uid:          String,
    @SerializedName("token")         val token:        String,
    @SerializedName("new_password")  val newPassword:  String,
    @SerializedName("new_password2") val newPassword2: String,
)


data class MessageDto(
    @SerializedName("detail") val detail: String,
)