package myCloset.restfullApi.dto.sign;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.*;

@ApiModel(value = "비밀번호 찾기")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FindPwRequest {

    @ApiModelProperty(value = "이메일", notes = "사용자를 식별할 이메일을 입력해주세요.", required = true, example = "hello@mail.com")
    @NotBlank(message = "{FindPwRequest.email.notBlank}")
    private String email;

    @ApiModelProperty(value = "아이디", notes = "사용자를 식별할 아이디를 입력해주세요.", required = true, example = "member1")
    @NotBlank(message = "{FindPwRequest.userId.notBlank}")
    private String userId;
}

