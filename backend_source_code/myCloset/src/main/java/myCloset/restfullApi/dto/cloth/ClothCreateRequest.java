package myCloset.restfullApi.dto.cloth;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;

@ApiModel(value = "옷 데이터 추가")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClothCreateRequest {

    @ApiModelProperty(value = "닉네임", notes = "닉네임을 입력해주세요", required = true, example = "애용하는 옷")
    @NotBlank(message = "{ClothCreateRequest.originName.NotBlank}")
    private String originName;

    @ApiModelProperty(value = "옷 종류", notes = "옷 종류를 입력해주세요", required = true, example = "상의")
    @NotBlank(message = "{ClothCreateRequest.featureCategory.NotBlank}")
    private String featureCategory;

    @ApiModelProperty(value = "옷을 입는 계절", notes = "옷을 입는 계절을 입력해주세요", required = true, example = "겨울")
    @NotBlank(message = "{ClothCreateRequest.seasonCategory.NotBlank}")
    private String seasonCategory;

    @ApiModelProperty(value = "옷 사진", notes = "옷의 사진을 입력해주세요", required = true)
    @NotBlank(message = "{ClothCreateRequest.image.NotBlank}")
    private MultipartFile image;
}
