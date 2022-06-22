package myCloset.restfullApi.entity.record;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QRecord is a Querydsl query type for Record
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QRecord extends EntityPathBase<Record> {

    private static final long serialVersionUID = 1927665568L;

    public static final QRecord record = new QRecord("record");

    public final ListPath<myCloset.restfullApi.entity.cloth.Cloth, myCloset.restfullApi.entity.cloth.QCloth> clothes = this.<myCloset.restfullApi.entity.cloth.Cloth, myCloset.restfullApi.entity.cloth.QCloth>createList("clothes", myCloset.restfullApi.entity.cloth.Cloth.class, myCloset.restfullApi.entity.cloth.QCloth.class, PathInits.DIRECT2);

    public final StringPath comment = createString("comment");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final DatePath<java.time.LocalDate> localDate = createDate("localDate", java.time.LocalDate.class);

    public final NumberPath<Integer> rating = createNumber("rating", Integer.class);

    public QRecord(String variable) {
        super(Record.class, forVariable(variable));
    }

    public QRecord(Path<? extends Record> path) {
        super(path.getType(), path.getMetadata());
    }

    public QRecord(PathMetadata metadata) {
        super(Record.class, metadata);
    }

}

