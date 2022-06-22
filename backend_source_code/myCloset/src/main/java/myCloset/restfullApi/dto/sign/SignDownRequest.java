package myCloset.restfullApi.dto.sign;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@ApiModel(value = "회원탈퇴 요청")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignDownRequest {
    @ApiModelProperty(value = "사용자 아이디", notes = "사용자 아이디를 알파벳과 숫자만으로 입력해주세요. 최대 30자리입니다.", required = true, example = "myId")
    @NotBlank(message = "{signDownRequest.userId.notBlank}")
    @Size(min=1, max=30, message = "{signDownRequest.userId.size}")
    @Pattern(regexp = "^[a-zA-Z0-9]*$", message = "{signDownRequest.userId.pattern}")
    private String userId;

    @ApiModelProperty(value = "비밀번호", notes = "사용자의 비밀번호를 입력해주세요.", required = true, example = "123456a!")
    @NotBlank(message = "{signDownRequest.password.notBlank}")
    private String password;
}