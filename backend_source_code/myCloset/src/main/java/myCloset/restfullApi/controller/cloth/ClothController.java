package myCloset.restfullApi.controller.cloth;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import myCloset.restfullApi.dto.cloth.ClothCreateRequest;
import myCloset.restfullApi.dto.cloth.ClothUpdateRequest;
import myCloset.restfullApi.dto.response.Response;
import myCloset.restfullApi.service.cloth.ClothService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Api(value = "Cloth Controller", tags = "Post")
@RestController
@RequiredArgsConstructor
@Slf4j
public class ClothController {

    private final ClothService clothService;
    
    @ApiOperation(value = "옷 데이터 추가", notes = "옷 데이터를 추가한다")
    @PostMapping("/api/cloth")
    @ResponseStatus(HttpStatus.CREATED)
    public Response create(@Valid @ModelAttribute ClothCreateRequest req) {
        return Response.success(clothService.save(req));
    }

    @ApiOperation(value = "모든 옷 데이터 조회", notes = "모든 옷 데이터를 조회한다(cloth VO 반환)")
    @GetMapping("/api/cloth")
    @ResponseStatus(HttpStatus.OK)
    public Response readAll() {
        return Response.success(clothService.findAll());
    }

    @ApiOperation(value = "옷 데이터 수정", notes = "옷 데이터를 수정한다(nickname, feature, season 변경)")
    @PutMapping("/api/cloth")
    @ResponseStatus(HttpStatus.CREATED)
    public Response update(@Valid @ModelAttribute ClothUpdateRequest req) {
        return Response.success(clothService.update(req));
    }

    @ApiOperation(value = "옷 데이터 삭제", notes = "옷 데이터를 삭제한다")
    @DeleteMapping("/api/cloth")
    @ResponseStatus(HttpStatus.OK)
    public Response delete(Long id) {
        clothService.delete(id);
        return Response.success();
    }
}
