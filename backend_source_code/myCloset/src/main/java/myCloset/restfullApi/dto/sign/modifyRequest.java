package myCloset.restfullApi.dto.sign;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.*;

@ApiModel(value = "회원정보수정")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class modifyRequest {

    @ApiModelProperty(value = "이메일", notes = "사용자를 식별할 이메일을 입력해주세요.", required = true, example = "hello@mail.com")
    @NotBlank(message = "{modifyRequest.email.notBlank}")
    private String email;

    @ApiModelProperty(value = "닉네임", notes = "변경할 닉네임을 입력해주세요.", required = true, example = "나는말하는감자")
    @NotBlank(message = "{modifyRequest.nickname.notBlank}")
    private String nickname;

    @ApiModelProperty(value = "비밀번호", notes = "변경할 비밀번호를 입력해주세요.", required = true, example = "나는말하는감자")
    @NotBlank(message = "{modifyRequest.password.notBlank}")
    private String password;
}

