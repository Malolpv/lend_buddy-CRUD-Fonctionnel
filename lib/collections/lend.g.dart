// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lend.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLendCollection on Isar {
  IsarCollection<Lend> get lends => this.collection();
}

const LendSchema = CollectionSchema(
  name: r'Lend',
  id: 2523108231016707381,
  properties: {
    r'contact': PropertySchema(
      id: 0,
      name: r'contact',
      type: IsarType.string,
    ),
    r'endDate': PropertySchema(
      id: 1,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'isReturned': PropertySchema(
      id: 2,
      name: r'isReturned',
      type: IsarType.bool,
    ),
    r'startDate': PropertySchema(
      id: 3,
      name: r'startDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _lendEstimateSize,
  serialize: _lendSerialize,
  deserialize: _lendDeserialize,
  deserializeProp: _lendDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'item': LinkSchema(
      id: -3796657606570131198,
      name: r'item',
      target: r'Item',
      single: true,
    ),
    r'user': LinkSchema(
      id: 1305732435082319102,
      name: r'user',
      target: r'User',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _lendGetId,
  getLinks: _lendGetLinks,
  attach: _lendAttach,
  version: '3.0.5',
);

int _lendEstimateSize(
  Lend object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.contact;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _lendSerialize(
  Lend object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.contact);
  writer.writeDateTime(offsets[1], object.endDate);
  writer.writeBool(offsets[2], object.isReturned);
  writer.writeDateTime(offsets[3], object.startDate);
}

Lend _lendDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Lend();
  object.contact = reader.readStringOrNull(offsets[0]);
  object.endDate = reader.readDateTimeOrNull(offsets[1]);
  object.id = id;
  object.isReturned = reader.readBool(offsets[2]);
  object.startDate = reader.readDateTimeOrNull(offsets[3]);
  return object;
}

P _lendDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _lendGetId(Lend object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _lendGetLinks(Lend object) {
  return [object.item, object.user];
}

void _lendAttach(IsarCollection<dynamic> col, Id id, Lend object) {
  object.id = id;
  object.item.attach(col, col.isar.collection<Item>(), r'item', id);
  object.user.attach(col, col.isar.collection<User>(), r'user', id);
}

extension LendQueryWhereSort on QueryBuilder<Lend, Lend, QWhere> {
  QueryBuilder<Lend, Lend, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LendQueryWhere on QueryBuilder<Lend, Lend, QWhereClause> {
  QueryBuilder<Lend, Lend, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Lend, Lend, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Lend, Lend, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Lend, Lend, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LendQueryFilter on QueryBuilder<Lend, Lend, QFilterCondition> {
  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contact',
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contact',
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contact',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contact',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contact',
        value: '',
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> contactIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contact',
        value: '',
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> endDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> endDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endDate',
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> endDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> endDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> endDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> endDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> isReturnedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReturned',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> startDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> startDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startDate',
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> startDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> startDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> startDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> startDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LendQueryObject on QueryBuilder<Lend, Lend, QFilterCondition> {}

extension LendQueryLinks on QueryBuilder<Lend, Lend, QFilterCondition> {
  QueryBuilder<Lend, Lend, QAfterFilterCondition> item(FilterQuery<Item> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'item');
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> itemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'item', 0, true, 0, true);
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> user(FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<Lend, Lend, QAfterFilterCondition> userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }
}

extension LendQuerySortBy on QueryBuilder<Lend, Lend, QSortBy> {
  QueryBuilder<Lend, Lend, QAfterSortBy> sortByContact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contact', Sort.asc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> sortByContactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contact', Sort.desc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> sortByIsReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.asc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> sortByIsReturnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.desc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension LendQuerySortThenBy on QueryBuilder<Lend, Lend, QSortThenBy> {
  QueryBuilder<Lend, Lend, QAfterSortBy> thenByContact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contact', Sort.asc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> thenByContactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contact', Sort.desc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> thenByIsReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.asc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> thenByIsReturnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReturned', Sort.desc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<Lend, Lend, QAfterSortBy> thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }
}

extension LendQueryWhereDistinct on QueryBuilder<Lend, Lend, QDistinct> {
  QueryBuilder<Lend, Lend, QDistinct> distinctByContact(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contact', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Lend, Lend, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<Lend, Lend, QDistinct> distinctByIsReturned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReturned');
    });
  }

  QueryBuilder<Lend, Lend, QDistinct> distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }
}

extension LendQueryProperty on QueryBuilder<Lend, Lend, QQueryProperty> {
  QueryBuilder<Lend, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Lend, String?, QQueryOperations> contactProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contact');
    });
  }

  QueryBuilder<Lend, DateTime?, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<Lend, bool, QQueryOperations> isReturnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReturned');
    });
  }

  QueryBuilder<Lend, DateTime?, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }
}
