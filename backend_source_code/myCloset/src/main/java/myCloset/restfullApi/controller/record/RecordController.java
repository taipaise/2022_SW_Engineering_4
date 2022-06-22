package myCloset.restfullApi.controller.record;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import myCloset.restfullApi.dto.record.RecordCreateRequest;
import myCloset.restfullApi.dto.record.RecordUpdateRequest;
import myCloset.restfullApi.dto.response.Response;
import myCloset.restfullApi.service.record.RecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;


@Api(value = "Record Controller", tags = "Record")
@RestController
@RequiredArgsConstructor
public class RecordController {

    private final RecordService recordService;

    @ApiOperation(value = "레코드 데이터 추가", notes = "레코드 데이터를 추가한다")
    @PostMapping("/api/record")
    @ResponseStatus(HttpStatus.CREATED)
    public Response create(@Valid @ModelAttribute RecordCreateRequest req) {
        return Response.success(recordService.save(req));
    }

    @ApiOperation(value = "모든 레코드 데이터 조회", notes = "모든 레코드 데이터를 조회한다")
    @GetMapping("/api/record")
    @ResponseStatus(HttpStatus.OK)
    public Response readAll() {
        return Response.success(recordService.findAll());
    }

    @ApiOperation(value = "레코드 데이터 수정", notes = "레코드 데이터를 수정한다")
    @PutMapping("/api/record")
    @ResponseStatus(HttpStatus.CREATED)
    public Response update(@Valid @ModelAttribute RecordUpdateRequest req) {
        return Response.success(recordService.update(req));
    }

    @ApiOperation(value = "레코드 데이터 삭제", notes = "레코드 데이터를 삭제한다")
    @DeleteMapping("/api/record")
    @ResponseStatus(HttpStatus.OK)
    public Response delete(Long id) {
        recordService.delete(id);
        return Response.success();
    }

}
