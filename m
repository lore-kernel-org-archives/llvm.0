Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013010.outbound.protection.outlook.com [40.107.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B234FF7B;
	Fri, 21 Nov 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732517; cv=fail; b=u+iolZc6l27IzX8ikHcdBFcYoanvhP+psQSfI2xBmbNzSz9moBwJns/fMPOULoGSpROD0ndAcc/q3T4UV25qjPN993cAzCIZk6pRX+pETTd3rjvFo+41mQ+um5vpGf79Jum6G60pj+OHodtYaPFET2TU4V8PQbtoHjoD0PoVZQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732517; c=relaxed/simple;
	bh=ifcSykSnppjDvHG0i7bvxREbmt+lsmtFtMh0YE/nky0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=elwFbIQWplIu2XUOdobSxUZ1IF2hP87pZ24WTMXCCvD5rYkY5kHw+zfOjlARiip9TiLjRCOH25gxl85Gwj3VpZhy3rPZAB70QSr8/kuoShU0lw2MK9rM553YxVTM6vcua4hXvx8I017g/04Aa3IMKvAku+rIQH/LoSrbWksikIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IJ7SvJZC; arc=fail smtp.client-ip=40.107.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IJ7SvJZC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3+d5umpTtTHPFwW86RRPlznGG/LVKxEzePg9hyTM7fWWtvb2EPX8HRwAbb2EVoMvlQuPPrMpcPy+hfqZX72O1i0c5W4B2/dezahdplxgwMeI1g2opjF/svBEzrxCvuhFq79o1HgMeOnyrKwg/FLUhxJeLLEy/s0AZTa5OwEx8Hxx83xEW1XBNH26LsSOl1+8Ojlaj9i/hPHD/ggqmalZxnlrUPxmlbGnLZmPHNvIFKIrFz4NVpOKE8FOjZ2ko2y9dPDBbzXuxDYO9zVCkjFbP4oMvGPjeWJqu697RP+mkVCkAlbNrjxSexhP8WU82W00O4Mqiu+pDNPR980pdpGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sgpvt3zaw1t6STO4y/DoXz0fWj5/Sa8SoE7nk+hyJ/w=;
 b=mI/ffA011vWH/h3MuDk7vrwBR5pigOkRl/nX8QzSpV8KS/wkeOxl5lwAohRXWAfrX4TqutA0wRMpcVhqbataOKoNdDGLxcohhlazP+AZNtqwnCYNKq5ZR+/XQKVE0XXEca7TIcJWrMYGdtLpk53Gh2BGNlmk2/HhV3AX6SZm+nudwWWScX73bxSFw5qe/fIocfCnZqsCd05z7NW40QxS+sJHUFahYFE6BAp+4SvoCLoWLl8EmnwCVLE/uLKgpfl4MbDJsGHdGAwkTjEPiaGy2f4aJ/lBYvpkycPQ0iDo8Nrm0ktBXNm495b3Kb+6cqXwMMai/EbTtF8qlZH6WB7zyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sgpvt3zaw1t6STO4y/DoXz0fWj5/Sa8SoE7nk+hyJ/w=;
 b=IJ7SvJZCAgSjNro19tEw/mJF00TISbOtI1GKWK3rvL7lxgoeSDcBC6vV4MOalnwMjtlPy+XFr8IE5o+PGalqcAHqlIYgnU3cHMQyHVNcMBEI0IWxVxE4P8jdwOZLEaX7lN7M9za5p95ImIiNUTYseeJEFFy2plGVQqXaaySJyOt/wNRX9ZiPC6Ws595KPK9sAEtbtFHSEHHce6oroLsb9Ys5upV0E7q1cWPDaplB4lxDfu2Gl7TJ8SEAbyK0JVk+DavqNM/8zygLqc8pAWdeDO+mEtjbkAEG+8CcUX0JCkQumLsbN9bL3RKmCFpkOtze7XQ026KDcAoSi+8DjiTdCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 13:41:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 13:41:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Nov 2025 22:41:46 +0900
Message-Id: <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
Cc: "kernel test robot" <lkp@intel.com>, <llvm@lists.linux.dev>,
 <oe-kbuild-all@lists.linux.dev>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <202511210055.RUsFNku1-lkp@intel.com>
 <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com> <aSAr-aA2U26lr3iI@google.com>
In-Reply-To: <aSAr-aA2U26lr3iI@google.com>
X-ClientProxiedBy: TYCPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 2379e3e6-1b3e-4e4d-732c-08de2903b8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXRmYjJjYUc1azBmWGVlQmZWaGNiM2dJbmsrQWpOU2ZLNkRJNmZJUlI5N1NP?=
 =?utf-8?B?QWYwcG10dGwyWGxsRlFwVHBxUytacnNOeDI0eXgzYXZSdjVxdmlOcFYrdlNJ?=
 =?utf-8?B?c3loUnBHakJ3NFhQUmpNbWk0b0pyNDJYdmZudVQzR3JqNksyNENjQXZ5R0Q0?=
 =?utf-8?B?N0xUQ0lSMmdtZjJjU1JId3E5QkhEM2VQRGJtbmhnODNQUHRET3FFYXdCRlc3?=
 =?utf-8?B?NHR2dlZsYWNqSlp3WXlPT3A3eHFmTmt1RzRxb3FJYmhDa0hCYjY5RkkxMTFL?=
 =?utf-8?B?Ylo1U1FsOFVJTlRnSDdjNEhkdWliZHViUmt4cC9aMkQzSnlNV0FUbjcyeHMx?=
 =?utf-8?B?aGJHVXUvRnFaMFhuemQ2MTl6bzVtcldsWG1KbXY3dHM4cG4xc3FFTEFuK0lO?=
 =?utf-8?B?SU5pVmZITUEvUkdGQ2hwUTlFdVRWWW1PNms0WmdkRiszQmxjTm1WSzcrN2pl?=
 =?utf-8?B?NVI1UXNzYUNGS3BoeGF5NG9mbkpMaTgvcmJUcDY2L1hyK1d4V2FXSEpUM3VD?=
 =?utf-8?B?RXowemlGaG5Jb3I5MktoSWJyWFNBUHd3a25KUXN2WlN1MVI5TlpWQWYxcVZz?=
 =?utf-8?B?aW4yQ1FtZ0tSNFVMMGxlcVRiblo0VGVIUjl4OTlyK2UwZlI3Uk1pNGlhTDZX?=
 =?utf-8?B?bU5LQWt6L0QwWWp0YURxejF5NG5xQ3hxczNKWU45aktHdWZseHg1a3BEKzBi?=
 =?utf-8?B?TUxvWjdyYXh2bGZLZEExK3BNZXhpdTRjRGdpcGZONUs2NVd0YmhMb3ZjYzRk?=
 =?utf-8?B?dE1qeU9hOXd1K0hqS1V2MVdGTjE0cnpCR0xBdlVlVEl6bDQ2b2dHR3NrWFRr?=
 =?utf-8?B?eTVwR0Q4UktQRGJ3aVI4bXFXeS9SQlRjZzJydXE3cFlGSCtVUkRjbzVOOTJk?=
 =?utf-8?B?eDR5R2hGcTVVYXFZYm9nVy9MeTQ4bXFhRk1kRjFrQkhWTTg3Vm9qMHp3Z0ll?=
 =?utf-8?B?TFdPR0IzKzBPanJoVCtkcGlTSURMdTV0WUxySEs2NVdRc1N4YmdvbDkzOFBm?=
 =?utf-8?B?c0pWUDYxcGdLVGkrMXhMbkxSOVZWYkhoMk1RTm42WU5DeXhFcG8xWFkrMlcr?=
 =?utf-8?B?TXhDQ2hxbG9xc0lEN3lvV0xyZnpVakhwQzBuRDRxbXMreUREbW9YVTBDUXpZ?=
 =?utf-8?B?NTBkejkzSjJyNkRNSXBYL2RlWEViOFZ6cHAzSmlMRjBEN1doNzZaN283WGRx?=
 =?utf-8?B?eWdOamV3T0FsTU1LMm9kQmJtMlNuSEFETXJjNW1YeUsxbnlvaXhxQk0vbzNw?=
 =?utf-8?B?bzM3WmNKSDBLVHJkRjA4Zk56aisrdzZRdk9OYnpMSVB0UjNtVXRJUzdjL2RR?=
 =?utf-8?B?bnNFRGZxUzlXMFdnejVtSmRJV3dsekowMEhoMkptSU5YRmc1eGc4WHFDaFhh?=
 =?utf-8?B?VnpoVThteXZvQW93b0xKQ2trTGZkWjM5UWt4cmdMblF4czVrdkh4dlk4b09N?=
 =?utf-8?B?dmNwUktQempqKzdPSDlqMTNBeGZydG1wbmd2cHlHNlVxSWpQRGxOWjNPeDBI?=
 =?utf-8?B?SWNoRjlpS0pmSnFqUlI2MnNDeWtmRmQwOHd6bjk0eDVPSnAvTTdwRlZ2cXI2?=
 =?utf-8?B?a043WGdKczZMaGFKQ1BRckJYSmxUdXVIWHRqVjE1NWtiS1V4MVVoRTR5VWg5?=
 =?utf-8?B?SWR4eDRUNXlubjkxaGhYM1MwaGpnSkdpSXg2YUc3SS8xTjF5dk1ZRE54MFZ6?=
 =?utf-8?B?cGxBMll2djJldEh5eGptbmp0M2lLM3JWcm1heVJJU1FwVm1zZFlXR0hkNUNw?=
 =?utf-8?B?RmZwK0IvcDdYMmlNYkR0RGFPNElPYVR4SVk1bkZjRm9jeFJtOWl1S05ycVg3?=
 =?utf-8?B?bUhkYXJhVk8xaUdkZDhEdm1XTExrZFA5azE3OGNVQkdqTGdHL1pFd2FrVUEr?=
 =?utf-8?B?R1VmTnRKREFJT044NzkvODY4dGlaeVRJY24vemp4TDNwUkoyVVo5a2N5RExP?=
 =?utf-8?B?UlF2TVptak05QktWV0hxd1Vidmd6MWgzSnNJTWZmYWVtSTlUOFBwZjZxTWZT?=
 =?utf-8?B?VWdKcmVlZU5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjU2blViTkVTTlZkZDE5dHhmeHU0dmhuaExTRnVsd2dvWWhDVzVPcFRNQjBN?=
 =?utf-8?B?VWZsMFFKM2k5UTM4akRHY29oekNYL3JTUmZlTS9JekZuTTRYZ3hGVDF2emFT?=
 =?utf-8?B?alM3OHJQa1ZaZFA0eFdOTFFyQlRra1RaK2dkQnZja3lpZnAzOTkySTRJdlEx?=
 =?utf-8?B?aHRBbHloeitCOUZwUUZEMUxydEVsUEl3b21yOEwvVm5adEszMVUrSk9qSFZH?=
 =?utf-8?B?cjFrWHE5bnU3SFpyM1hsVXlLNEMzcnBZZWk4Y3lhTy9PZTN2VGdRbnRjMmh0?=
 =?utf-8?B?MkxzY2NBNVpZRFBJbFNIVHIxVHkrK21EZWJPcSt3aVM1Ym9yV1ZUTXN1WEN4?=
 =?utf-8?B?Y2ZzSmZNRW4yQWhqZkR0SlpZQXlKVTZWckdmVFZMcHRrYU80MS9Bamdkd21H?=
 =?utf-8?B?MWtoLzRuTXcwMEZZNi9sNzRBcmFhWTYvQktLNmNEMWovdlU0NWxqcGFzdFp0?=
 =?utf-8?B?UlpBdXo3cTFSdmt3SGJSUEJ4RVdKZVpTamdvbURPaWdCc25XaUVaN1VqeGtQ?=
 =?utf-8?B?T1NaTDVSbS91RXg2NjduNkl4MCtLN1FNNFd2cUR3MTl4dHNoM2k1SGlHZkNP?=
 =?utf-8?B?R1dON1BqWGx2Zmk5NTJ1S0RzUWcvOFp2aWNnTEd5WXBIWXd5Ky9UVVFmRWlL?=
 =?utf-8?B?UFI5OEFGK1NZeHB4Nlk5YktONHc1TmJJYzY3eHNCU1FnT3g1NXhhUVp0T0wy?=
 =?utf-8?B?dzFrTnhNT2lOZTlLRTBSNnZNMDNTWm4wS3ZXbFRNSVk4U0ZTR1A1ZFpaOUVz?=
 =?utf-8?B?YVI1d0NaK045eHNHZXc2OW9rcHFvN3NkY2h0bHlWMnVyUnZLZVRsNTU5UGN6?=
 =?utf-8?B?U0dzWXlsM2RYTWdQL2c3K1J2eFNNL2VKeXYxOVAvblVQb0tydG1NbEl0Mlps?=
 =?utf-8?B?MmdvNkllVTJWSHl4RndJenhjTlh5RmpCTFlGY0tkeGM5ZVZYbVRCYTlMaDgv?=
 =?utf-8?B?blFUd05aVGl1VHowWVNCVUNsQXpBTnRVUXRKTmJJNjRaQ1ZJN3pBR3RrVWVy?=
 =?utf-8?B?bS9FWHRkUDByRkMyQm5MdTVobVAwK2psOXZFcTRYVTRES0ptaXdJUVNOak05?=
 =?utf-8?B?UlZzRERXZHUzUWp0dHVNaTgvTURmdlVkWDdVOEFzV0R2eldHSEdUYWNQM0Rr?=
 =?utf-8?B?S3czeUxWMUI1Z2FLMHc4VHV3a3FjalF1OHhzUW1oMVQ5aURtTTdCZmQ2TVQ2?=
 =?utf-8?B?VXB2QnVCZ3N5OHB5b2U3UXVNeU9PVTVDUWR0bExNdUUzM2JWWUZZM0ZhblFX?=
 =?utf-8?B?Z3pzeTR4R0xacEgrSG1hN1pUUmhiYXVxZHg1Q1pzSjliOVVxVWFFOStMOVNR?=
 =?utf-8?B?L05lRFBHYnlSSzJjWEZwNFM3QnN5eTFDckNpcngyMzdhYmJianVJOFN1ZW5I?=
 =?utf-8?B?a0hXYUZmZVdzZVB2OGpISlQ1OWtwTDN4U2xSS3NYWFZIb0s2K1AwWUI3WEJH?=
 =?utf-8?B?RGpYSjJ3TFZ2SjEwNmo2SjJXSFRJY3lvU3hvWFFIRHlmeTFRUnNYby9VZm9i?=
 =?utf-8?B?RWg2WTdWamhJMGdoVWpIdmxqSXB2MlpoSDdWMEZjRFY1ZDBRTVlLamZVNlBo?=
 =?utf-8?B?MDU0bjNNRUhBM1A4YmdHN0RBbEV4SS8xWXBqY2FUMlkyVGszVm9Tb2o1Mzl3?=
 =?utf-8?B?RFVJWmg5cC94d0JDWXpXcUlkQ1hZbHloNGR2MmpSMnEwTy94dGc3c3hLblhl?=
 =?utf-8?B?Sm4vanNmOWZpVkdHb2JmY1VobEN6c09uWTV1NTlBVVpOSFZiWkNFSVRZYWVL?=
 =?utf-8?B?djJXaHhFeUtqMEh6T2d1OEdqNDZINlNlWTVjbmczMGQ2REF6ajZidllIUmJP?=
 =?utf-8?B?ZVVQM01ZSmlNWDZQMk9tOFY5cTlZdytFWTRNWjhjVG94SXlpK3pJY0ZkNFVj?=
 =?utf-8?B?aW0wajlkZEZZWFIva0hjV0VRbUJYT2tTdU9VM01kQlg5emQ0K0JnK2daSXhi?=
 =?utf-8?B?MTlvcTI2MDVaQnhZVGQ3a2NaNmJiVU5aQ2lEZTBKWDRpR2tTajErMTFPb25r?=
 =?utf-8?B?T0xTbFRJaHQyV3ZxMTZUalI1TW5ON0hBa1ZYbUNxbXAxM3ZrdDJhTFBpQkFD?=
 =?utf-8?B?M09QdWZrYzZmb1lTRHI3eUxqNUdPaTRLdjBwVzYzZ1dTSktaeHU4bGplTW9m?=
 =?utf-8?B?OWE1OHB3Nk10eFR1K1A4bkswMDZhSFJDci9BR1hUaVJlbTF1L3VXcGJUYjdZ?=
 =?utf-8?Q?XCmJkSIydXP9xiZH3oOKAZ9JM/2Xghj6Xnj+aEVgEM9k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2379e3e6-1b3e-4e4d-732c-08de2903b8dc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:41:50.1087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0Sor//rZ93QNxVIeoBxd5QXx/LiL70g6T2Q9M2SUanSwdDj8J+WOi9hn1uK75JD+3VrWUVsVklIDtB8mDqOPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904

On Fri Nov 21, 2025 at 6:08 PM JST, Alice Ryhl wrote:
> On Fri, Nov 21, 2025 at 03:13:16PM +0900, Alexandre Courbot wrote:
>> On Fri Nov 21, 2025 at 1:41 AM JST, kernel test robot wrote:
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
>> > head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
>> > commit: 01e345e82ec3a5a7edeb9fa0dcb7fd4b0e5c534e [9676/10599] rust: nu=
m: add Bounded integer wrapping type
>> > config: loongarch-randconfig-6002-20251120 (https://download.01.org/0d=
ay-ci/archive/20251121/202511210055.RUsFNku1-lkp@intel.com/config)
>> > compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3=
b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20251121/202511210055.RUsFNku1-lkp@intel.com/reproduce)
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511210055.RUsFNku1-=
lkp@intel.com/
>> >
>> > All errors (new ones prefixed by >>):
>> >
>> >>> ld.lld: error: undefined symbol: rust_build_error
>> >    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:8=
3)
>> >    >>>               rust/doctests_kernel_generated.o:(<kernel::num::b=
ounded::Bounded<u8, 1>>::from_expr) in archive vmlinux.a
>> >    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:8=
3)
>> >    >>>               rust/doctests_kernel_generated.o:(<kernel::num::b=
ounded::Bounded<u32, 4>>::from_expr) in archive vmlinux.a
>> >    >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:8=
3)
>> >    >>>               rust/doctests_kernel_generated.o:(<kernel::num::b=
ounded::Bounded<u16, 8>>::from_expr) in archive vmlinux.a
>>=20
>> Mmm, I don't like this. The expressions that are failing are extremely
>> simple, for instance:
>>=20
>>     Bounded::<u8, 1>::from_expr(1)
>>=20
>> So if the compiler is unable to assess that this won't fail, this might
>> be a deal-breaker for `from_expr` and we might need to remove it. :(
>>=20
>> This would also mean a lot more runtime checks when working with
>> bitfields and registers. Or can we assume that this is a compiler
>> problem on this particular architecture?
>
> Yeah, it sounds like from_expr() isn't going to work.

It would be a pity but we can replace `from_expr` with an unsafe
`new_unchecked` for these cases where the caller is absolutely sure of
their input. I have tried on bitfield/Nova and the result is not too
bad.

Still, this is a bummer - it is much better to have the compiler
validate safety properties than relying on a SAFETY comment.

I notice that loongarch is a Tier 2 Rust platform, but I suppose that's
not an excuse to let it not build? ^_^;

If I had to bet I'd wager that in this case the "shift left then back
right" technique to check the bounds is not working well. I will try to
find an alternative, but meanwhile we should probably remove
`from_expr`. I will send a patch to that effect unless told otherwise.
