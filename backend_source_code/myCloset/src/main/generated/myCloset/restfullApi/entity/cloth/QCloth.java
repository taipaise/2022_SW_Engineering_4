package myCloset.restfullApi.entity.cloth;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.processing.Generated;
import com.querydsl.core.types.Path;


/**
 * QCloth is a Querydsl query type for Cloth
 */
@Generated("com.querydsl.codegen.DefaultEntitySerializer")
public class QCloth extends EntityPathBase<Cloth> {

    private static final long serialVersionUID = -1572084584L;

    public static final QCloth cloth = new QCloth("cloth");

    public final StringPath featureCategory = createString("featureCategory");

    public final StringPath filePath = createString("filePath");

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath originName = createString("originName");

    public final StringPath seasonCategory = createString("seasonCategory");

    public final StringPath uniqueName = createString("uniqueName");

    public QCloth(String variable) {
        super(Cloth.class, forVariable(variable));
    }

    public QCloth(Path<? extends Cloth> path) {
        super(path.getType(), path.getMetadata());
    }

    public QCloth(PathMetadata metadata) {
        super(Cloth.class, metadata);
    }

}

