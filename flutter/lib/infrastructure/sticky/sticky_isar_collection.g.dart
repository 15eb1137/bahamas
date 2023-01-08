// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticky_isar_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetStickyIsarCollectionCollection on Isar {
  IsarCollection<StickyIsarCollection> get stickies => this.collection();
}

const StickyIsarCollectionSchema = CollectionSchema(
  name: r'StickyIsarCollection',
  id: -4717164967558034878,
  properties: {
    r'color': PropertySchema(
      id: 0,
      name: r'color',
      type: IsarType.long,
    ),
    r'fontSize': PropertySchema(
      id: 1,
      name: r'fontSize',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.string,
    ),
    r'lastEdit': PropertySchema(
      id: 3,
      name: r'lastEdit',
      type: IsarType.dateTime,
    ),
    r'text': PropertySchema(
      id: 4,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _stickyIsarCollectionEstimateSize,
  serialize: _stickyIsarCollectionSerialize,
  deserialize: _stickyIsarCollectionDeserialize,
  deserializeProp: _stickyIsarCollectionDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'lastEdit': IndexSchema(
      id: -8278629512490753625,
      name: r'lastEdit',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastEdit',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _stickyIsarCollectionGetId,
  getLinks: _stickyIsarCollectionGetLinks,
  attach: _stickyIsarCollectionAttach,
  version: '3.0.5',
);

int _stickyIsarCollectionEstimateSize(
  StickyIsarCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.text.length * 3;
  return bytesCount;
}

void _stickyIsarCollectionSerialize(
  StickyIsarCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.color);
  writer.writeLong(offsets[1], object.fontSize);
  writer.writeString(offsets[2], object.id);
  writer.writeDateTime(offsets[3], object.lastEdit);
  writer.writeString(offsets[4], object.text);
}

StickyIsarCollection _stickyIsarCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StickyIsarCollection();
  object.color = reader.readLong(offsets[0]);
  object.fontSize = reader.readLong(offsets[1]);
  object.id = reader.readString(offsets[2]);
  object.lastEdit = reader.readDateTime(offsets[3]);
  object.text = reader.readString(offsets[4]);
  return object;
}

P _stickyIsarCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _stickyIsarCollectionGetId(StickyIsarCollection object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _stickyIsarCollectionGetLinks(
    StickyIsarCollection object) {
  return [];
}

void _stickyIsarCollectionAttach(
    IsarCollection<dynamic> col, Id id, StickyIsarCollection object) {}

extension StickyIsarCollectionQueryWhereSort
    on QueryBuilder<StickyIsarCollection, StickyIsarCollection, QWhere> {
  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhere>
      anyLastEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastEdit'),
      );
    });
  }
}

extension StickyIsarCollectionQueryWhere
    on QueryBuilder<StickyIsarCollection, StickyIsarCollection, QWhereClause> {
  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      lastEditEqualTo(DateTime lastEdit) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastEdit',
        value: [lastEdit],
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      lastEditNotEqualTo(DateTime lastEdit) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastEdit',
              lower: [],
              upper: [lastEdit],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastEdit',
              lower: [lastEdit],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastEdit',
              lower: [lastEdit],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastEdit',
              lower: [],
              upper: [lastEdit],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      lastEditGreaterThan(
    DateTime lastEdit, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastEdit',
        lower: [lastEdit],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      lastEditLessThan(
    DateTime lastEdit, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastEdit',
        lower: [],
        upper: [lastEdit],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterWhereClause>
      lastEditBetween(
    DateTime lowerLastEdit,
    DateTime upperLastEdit, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastEdit',
        lower: [lowerLastEdit],
        includeLower: includeLower,
        upper: [upperLastEdit],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StickyIsarCollectionQueryFilter on QueryBuilder<StickyIsarCollection,
    StickyIsarCollection, QFilterCondition> {
  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> colorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> colorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> colorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'color',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> colorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'color',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> fontSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontSize',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> fontSizeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontSize',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> fontSizeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontSize',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> fontSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
          QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
          QAfterFilterCondition>
      idMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> lastEditEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastEdit',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> lastEditGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastEdit',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> lastEditLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastEdit',
        value: value,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> lastEditBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastEdit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
          QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
          QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection,
      QAfterFilterCondition> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }
}

extension StickyIsarCollectionQueryObject on QueryBuilder<StickyIsarCollection,
    StickyIsarCollection, QFilterCondition> {}

extension StickyIsarCollectionQueryLinks on QueryBuilder<StickyIsarCollection,
    StickyIsarCollection, QFilterCondition> {}

extension StickyIsarCollectionQuerySortBy
    on QueryBuilder<StickyIsarCollection, StickyIsarCollection, QSortBy> {
  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortByFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.desc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortByLastEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEdit', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortByLastEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEdit', Sort.desc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension StickyIsarCollectionQuerySortThenBy
    on QueryBuilder<StickyIsarCollection, StickyIsarCollection, QSortThenBy> {
  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.desc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByLastEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEdit', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByLastEditDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEdit', Sort.desc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QAfterSortBy>
      thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }
}

extension StickyIsarCollectionQueryWhereDistinct
    on QueryBuilder<StickyIsarCollection, StickyIsarCollection, QDistinct> {
  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QDistinct>
      distinctByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color');
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QDistinct>
      distinctByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontSize');
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QDistinct>
      distinctById({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QDistinct>
      distinctByLastEdit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastEdit');
    });
  }

  QueryBuilder<StickyIsarCollection, StickyIsarCollection, QDistinct>
      distinctByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }
}

extension StickyIsarCollectionQueryProperty on QueryBuilder<
    StickyIsarCollection, StickyIsarCollection, QQueryProperty> {
  QueryBuilder<StickyIsarCollection, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<StickyIsarCollection, int, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<StickyIsarCollection, int, QQueryOperations> fontSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontSize');
    });
  }

  QueryBuilder<StickyIsarCollection, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StickyIsarCollection, DateTime, QQueryOperations>
      lastEditProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastEdit');
    });
  }

  QueryBuilder<StickyIsarCollection, String, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }
}
