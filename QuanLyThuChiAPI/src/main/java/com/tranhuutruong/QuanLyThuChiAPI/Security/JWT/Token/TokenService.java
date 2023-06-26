//package com.tranhuutruong.QuanLyThuChiAPI.Security.JWT.Token;
//
//import com.tranhuutruong.QuanLyThuChiAPI.Repository.User.TokenRepository;
//
//public class TokenService {
//    private final TokenRepository tokenRepository;
//
//    public TokenService(TokenRepository tokenRepository) {
//        this.tokenRepository = tokenRepository;
//    }
//
//    public boolean isValidToken(String jti) {
//        return tokenRepository.findByToken_id(jti) != null;
//    }
//}
