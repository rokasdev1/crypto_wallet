// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ethereum_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EthereumTransactionImpl _$$EthereumTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$EthereumTransactionImpl(
      from: json['from'] as String,
      to: json['to'] as String,
      value: json['value'] as String?,
      nonce: json['nonce'] as String?,
      gasPrice: json['gasPrice'] as String?,
      maxFeePerGas: json['maxFeePerGas'] as String?,
      maxPriorityFeePerGas: json['maxPriorityFeePerGas'] as String?,
      gas: json['gas'] as String?,
      gasLimit: json['gasLimit'] as String?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$EthereumTransactionImplToJson(
        _$EthereumTransactionImpl instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'value': instance.value,
      'nonce': instance.nonce,
      'gasPrice': instance.gasPrice,
      'maxFeePerGas': instance.maxFeePerGas,
      'maxPriorityFeePerGas': instance.maxPriorityFeePerGas,
      'gas': instance.gas,
      'gasLimit': instance.gasLimit,
      'data': instance.data,
    };
