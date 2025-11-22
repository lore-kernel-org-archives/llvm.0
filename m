Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010013.outbound.protection.outlook.com [52.101.201.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A576189F43;
	Sat, 22 Nov 2025 02:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763777588; cv=fail; b=Y64KtPLW7qOsghTWD+7x9bTrddXQfV7j4+e5J3Sx11sMJVN8xoOobE6E3dq9YT4pnwXTt8PtCtcdeF55SefWDNEefM48C10al8l8+yEuL9HHtlLckSJojoa/Ts5QO1pIlu5jpF9tyQU2HEBHX0mbyftJt+N/0IApai3wnYKAKTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763777588; c=relaxed/simple;
	bh=FM6To0UH5vGdKPcuTWH7sNZNBtwQvKCC5Uf255SVuLQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=eGaXaU7fSS4lQcOzFnyXF7rTNxxsdCu6FmAZ0BrRdU6nr/enrFJf5E62uG4aEU4v24vgWBqe3gLmC6z8TIPINqKBrbBT0/2n01h2Jk0tx/ZI0VbsTI3u4dIEz7KTQ4/r9aCWb4H0tEEjGaKhi+x+u7GaWwRF1/+64yELvhRt1BU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c7QnSHy3; arc=fail smtp.client-ip=52.101.201.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c7QnSHy3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYphoNLRjoqmthfmvSR5iOjck6+BSQtxy+emnO1cZ018ANIZPTSmQRYKeaM6qnpwY1rt0gzS0iLsigVjaEVOiLZSH4GChcJOIYqQFJb9QfhHsda9MZsgAt4AXoVGKsVlrbSWkzgOtWbEqwvgq7ycDXSO+Wa+2eIO4qKlCQXig0kSQYUflSr9TeyeogMZNY3Q7GOIXsP+fVVOaSjlWoX7fKpoEtbOPavhHiFaMSeGz0Ic2gOoms8UPm5gAwv/z4XNFiFa0eCg6iMy8dmq2t6MeTLW2KRftFDiQSH935df/BmChsM6CoK9/N9lDp0yL0FvKLXpdOOF40oIX/Y+WoM35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gA04uZ5TKfzSSM5MDfTxmAypnQdH+SZz1Et67dK9W4g=;
 b=MGj5sSFbtEFJdCfaf9wOZzi+ckpxtO4JQJbpE2PxfUawSlCVGTkC2XIriWpSmY1/sK4uKiLZx4qqdSyhTiEZswpecYAH5auOheaxurQmNdKdjLVeWCJFq062CCXcLe+Xl613EYqA+kPcF4MkpdF/jfkBG2zzlWH4wOYZ7oEW9lOGWYHqpgWZwGHD8c8541g46aLPF2l8nFNBa8k1fCm5/nG8VMp3idZJcLpbQLtfPtCVy2tHpHPFcGhIoyXW/vFsIQcxqu+XSxg7aztgNm2wYf3k0d7RfoYuTFLeqYdYlPU60GKVT0dF42NInDbbtjo/vrgcJGfV40aKzJjaHMbpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gA04uZ5TKfzSSM5MDfTxmAypnQdH+SZz1Et67dK9W4g=;
 b=c7QnSHy3qikI0B9rZ1NqxlolDPcx2gt1MfCthCZl5UYubogf8SDw5+m0QB5hYSAKyqRXDoXjvX5GOvrox57Ub2DAe9gnM+LQhIqu7AnkaXsTqQ5Etvb9kHWSm93E91dVUJLjq6u/0IKlYqpUTiy9IcU8BUJbyCwnvOVnfCDWmRK/iv1+Z6SapjH+dO33Bi1+rkd56KbwalBlY9fgZ/42PnUyRN3VMEiapT6Kmut56hhbsASp+fvx6NJ+HhBcAd+QAdsqnsURXUfhBGcGLlLayAfdRvX+VmARhNj4pSts2Mcus/BaAIdA8WONJ73b/BijMoj+e2CNHp+zj+cIb5zhsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9456.namprd12.prod.outlook.com (2603:10b6:610:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 02:12:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 02:12:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 22 Nov 2025 11:12:51 +0900
Message-Id: <DEEUYUOAEZU3.1J1HM2YQ10EX1@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Miguel Ojeda" <ojeda@kernel.org>, "kernel test robot"
 <lkp@intel.com>, <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <202511210055.RUsFNku1-lkp@intel.com>
 <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com> <aSAr-aA2U26lr3iI@google.com>
 <DEEEZRYSYSS0.28PPK371D100F@nvidia.com> <aSBy3HQ9Z-h2LbB8@google.com>
 <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net>
 <DEEH8WPYR4KA.1WUYP0D5F9TYA@nvidia.com>
 <CANiq72kqX8Ua7NFHUwLBW1Gpb-Ewh2wHnWmXH6SUQBUyrrSdbg@mail.gmail.com>
In-Reply-To: <CANiq72kqX8Ua7NFHUwLBW1Gpb-Ewh2wHnWmXH6SUQBUyrrSdbg@mail.gmail.com>
X-ClientProxiedBy: TY4PR01CA0104.jpnprd01.prod.outlook.com
 (2603:1096:405:378::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d93b74-6bfc-4da1-428c-08de296ca74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWtOQ1RVY3YweU1ORzZiL2FOMVVCZ3hqeGlzS1h3MUlLdU1TU2pkaCs3MmJq?=
 =?utf-8?B?TmtFY0dPOFJtcDlZNlNnTGNnR1lDbkhaMlhrOStkZlFNNWVoUEYvMUZjeDYy?=
 =?utf-8?B?Um84bWlEL2VOT253VG8rTHdiaGE4MFFheSsrZWFGRExKeTkvaVJNT3ZCeHR6?=
 =?utf-8?B?azgxYlpoYjA3cFBQUDVsN2gvSng0U2FhejMvRG9PNVVFUVdWT0tvWE0vQ0Ix?=
 =?utf-8?B?SFdnTHQzVC9tZDF0VUtpQlp1WDNqcUd4MGhSd21qaTZ5Ly9tWTFtOG5LMW1p?=
 =?utf-8?B?UTVCKytSREQ0YkJqeGdTbjdiWEo2UmNxL0dFcDY3cnJtVVlpRTIyWmVYMWVn?=
 =?utf-8?B?OFVlUE9jOTJnbWMzZEZqeXhVOU45VUZyMkdZUjB3R0dHbCtyVVpRLzdFNWtS?=
 =?utf-8?B?SEZCdXpmZXdvSi9HT2NYRFNjYXB3eTllbXlUam54RGtFalV3QXhUZG5VUDZj?=
 =?utf-8?B?K0lXZFVJbVlESXc5ZUpuaG9PSlZDNmNaaTBqc1ZQSmtJRk5DVnl4YS95bEEy?=
 =?utf-8?B?ZXVaTDh3ZG5Yc3RCbWl1MHVadWdJWEg3MGt2MmZKWXRsdmQ3eTQ2VWJIQVNQ?=
 =?utf-8?B?eFlERWFoZWM5YU5nRHczM0oyZEo4M2tpMGJkMmNYampQNkMrSmpMcStJbVdx?=
 =?utf-8?B?d2RrODBGcU5xUnVWbXExN0FZaG9iaUJYYzJoTWRUamRYR1d0Z0ZEVHRITy80?=
 =?utf-8?B?VGYvdTJ6K1d0b2Q1VHk0Vjh3NVpacFhRc3VFNTEwTXplbzB2MG9CUHB3SDF5?=
 =?utf-8?B?R0tSNEl6Y2RxVDhCY0tGWjZMM093bnhscnhKcHdZSnBPK0F5ODVpajVwTEJR?=
 =?utf-8?B?ekNheFlnSUx1RWNQczd6MFFjMFRMdzVyK1NYN0p3dzlTKzZ0T2x6UUV4Nmhn?=
 =?utf-8?B?dmtwSHlyZGdxdjFyS1Awdm1McitGcnh2SGQ3ckNIR2t0N2E2WGc4cVRVYlRv?=
 =?utf-8?B?R3N1WTZ3NVlJTHRzU1BzcGR1ME1qRTNKZmJtSStML1ptNVV4a1V3MGF1cWVB?=
 =?utf-8?B?aFBORUtaSzNRNjA0aUFTZFZSdk5lQ2tHbFNJVXZ5T1NrS3MvL00xa0ZWN2FO?=
 =?utf-8?B?dzRvbjRXNmNzdkZIMFlQMU9UZG5TOTdXd3FxRzgydHlCeGpFOFZvZFdwbStS?=
 =?utf-8?B?c1ZFNDJ1bkJVYnJ4dlRwQnJlY3pKV0pPbTVIOU1RZjFLZHlYVnpMYyt0ZnlE?=
 =?utf-8?B?NndwNnpaN3IwTGpQTXgwY0p5OXlzYmVZTWFQOVRVNFZpMGpCQnNlSStXc2Vn?=
 =?utf-8?B?V2d1OUdQalBrREZ0MGFQaEl1a0RIRThLSHpSVStGNURnMkRXL0NzdkFTUEFG?=
 =?utf-8?B?OFJtc3l0Y0VEZ1RIZGVRRU12ckN3TlQzWFJGeWg5S1JUeGdCQWpyU2NPdXpR?=
 =?utf-8?B?eTBCVEJpd1JHL0gzeXBNU3Y1RS9BMkpLMUdOVmo2eVQ2ZXdQeG5tZDhBT1FB?=
 =?utf-8?B?MGdDSURKeUJGTzloOTc0amVMMDREdlJSeTNibW5zV01hdk5HS3F4Vjc5VXVY?=
 =?utf-8?B?Tk4ycWxNaWpZajgvYmdRbmxhSGFmRHRXcC91alVEdFJxaVNITGlJSjRRR1RV?=
 =?utf-8?B?OG9uOW90YXpzNVNES1RzVmpIYlFJZUZaS2wyV0xJSC9mS1hYTW1sTXhGVFF1?=
 =?utf-8?B?YUppa085bUVGMkNsM295MmdWYkVjTXh3bEtrdVF4aC9UWXB0RDVlT0NVK2dX?=
 =?utf-8?B?cndrWjVnd2l2VGxNbE4xdHJvS0FvL2d6WWgza1doendxREQzL0NHV1lUY1VV?=
 =?utf-8?B?SXRidjFiUVNIcjVaWU9KYmhFME85YXQyaDNzblNRMVN2OTk4MldoQUxMUXY4?=
 =?utf-8?B?VCsvZklkK3RuM0JueVN0WXljclgzOUZ4Ym5jdzRBZHg0UlFYYm9VblBjUDJH?=
 =?utf-8?B?ekdja2RzSUxrS1ZtWVlaa3VwcGtEc0cwL0J4RFAvRzdPVWIrT2lFMmFLTUxF?=
 =?utf-8?Q?WHHxcD8YRsDKkJaNlwv2p1DP1XLWo0me?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXV0TEdJOGN4VUVQaXlzaE5EeWl0VnZRTGdLU2kreUIvR1NsWDBTdkh4cEhI?=
 =?utf-8?B?dURNOXJlYVE5V09FeXZlK3EwL1hRUXFsc0RqZ3YwZDBtaVp5VFpwc0k2bU5q?=
 =?utf-8?B?aURVbnRESnpGVDY1YUVNdXoxNk82eVMrdUQ1NVpkUUhQeHQzRW0wRnNIaXJF?=
 =?utf-8?B?NXNQQ1VqVnpPcDV4RUh0WXR3VC9hVDNnS0QydmZCZ0FlakYrMk5FVHpZNEhH?=
 =?utf-8?B?ZHlsdXZEcy81ZHFZbmR0N2F3dEVBZnVPZTd4N1ZvaXJKN2FNcjZCbW8rc20r?=
 =?utf-8?B?VnpkdXhubFZwTGNldEtHVUJLUDZ4eTA0R2pKbXZMOFVOMHhRdStma3R5bmVT?=
 =?utf-8?B?Y0dHc3NVd1NRV3BZU202SnhDVUlJQUZ4czVUOWZRSjI3cWFIUVJ0M3paWGtN?=
 =?utf-8?B?Z1VaR01jOWFINmltSVpuQzJaK0NHL1B6TkUzVFNIZ0txdTBKeHAzNlZ5U21V?=
 =?utf-8?B?S3QvQUQ0c0xWeGhYczgzVFp5OHQrVVdDL3g2TDBTeGdsUkFrUzYrOWZIOXh6?=
 =?utf-8?B?Nzh3bnJ6MHpMbG5QcG0xQ0JKbTFrbkVjWFdONVBrMmhsRndaMmp5NkIxb1VI?=
 =?utf-8?B?b0RKeWppZE9MK2hBSWxXRzM5V1hZWG1QTkVJUyt1T0g3OVdWS0VRWDJlUCtq?=
 =?utf-8?B?OEdDOW5mZjRiMXo1a2FiUWZneHlDak1YV05nWHRCVllBaFpGSXV2bjQ2aHZB?=
 =?utf-8?B?UnBrN0w3blN2QUk0ZW1COVRlalhuRW1CWTRCUUNEOFYwT3I3WnA3djNSKzFZ?=
 =?utf-8?B?N3FKWFRUT0NNaXlXSjRXaHIzRmRDQlc3eUFaT04yYjR3bDhJbEsvUkVheHJl?=
 =?utf-8?B?NkI1S0p0L0FkNjVVcVhFdk8yNlBtVHYzQWN2SDdMOGI4NmE1TzNiNFlnMFc2?=
 =?utf-8?B?UUxoMmpUTEVsSEZZV1ByaGNBdlFaRHRseWhJUFRzUDZuS1loRE5MOU5rYUpY?=
 =?utf-8?B?clF4dTlCNEQ0OWREang5ZVJRTTNKZnZhUE9DcDJndUNMd0dWUUh3bis1a0s3?=
 =?utf-8?B?TVhxdFJUQnVmWVdONjJ5UzcyTHNYbnVYOTdJeUdaY3hEUDF6ZFZYWHkxT2ZD?=
 =?utf-8?B?SkxXNTF4b2lIQXZ4czUxVHBVL1Bqb1JuOGkrYmdMeGMxUFNvbDBOQjRxRVlk?=
 =?utf-8?B?UWVwbmRxR0hzZ1hRUWNBUEpwSkhxVldJSDc4eHdIUml3clNySVY1MGZwT2h6?=
 =?utf-8?B?RzVLRk9tVkYreDhGTm9vcXZ1aENFck5SWUdmenNUUURmNTNVMUQxTEpiSHl2?=
 =?utf-8?B?TVU1bXRpM09zTUVtU2RMc0hIcFJyUEYvLy9TbE1mQVd5dDU1SUpqTklmSVZp?=
 =?utf-8?B?dlA3TVowVmMyenBQVVRzajNmVjlsZHZwUmVrNkYwUkltVHg2UmtlQ2p4NTRE?=
 =?utf-8?B?ZkhlVFhJZm4wbXB1cWlxOEZuRFAyVmRuRTR2UnU5ZzUzVDRJbnR1SU85ZVNs?=
 =?utf-8?B?Qzl0czN0L1N1RitTQ1JraVlPUU9rL3hVdU1ndEozeVlmWUdHVDFpNmNoMzRQ?=
 =?utf-8?B?eTREMnk3NndpdENLWWNQekVyc0p0YXIwQWxNTnk1OStPVjNkOUh1SjUxeEp6?=
 =?utf-8?B?dVJpanJxVHJQS3FQbjFNYll3d05idU5PRzNTMUxXbmw4bEFvYXA0RHF1NmZ1?=
 =?utf-8?B?dC9VTlZQZUh4dnRiL3lhTS9seGY5eUdDSjZYdVh2YmU0eFllWDRWbG1rRUZx?=
 =?utf-8?B?RUkzWEU5Rkw0VG9hTXlFQ25nZy85S0MyYTdxbktpQ1AwVk9ybVZGU1VvNFBv?=
 =?utf-8?B?MjVMcGpnZXVMWUkyQ3Jqdy95Wlp5eUlReWVmaHByNXBTNFRJV3lQTnFkWkFt?=
 =?utf-8?B?YlNwWEVFcnl0VjZHd0tJWFQ1MW5zWkxzcityWCttOU5BOEh2Z3ArZm4vdlEz?=
 =?utf-8?B?S2JLcHB4aCtiem1kMjY5R09OVjFKZDlJSXlsblNTNjF4ZDZxbDdkZkdzNGoy?=
 =?utf-8?B?QVYvMTZ1T1Z0VHc2MEE0b2VuMGJPS2ZwaDJ3QktMOXdpNXkzWTc2S0xWajVo?=
 =?utf-8?B?ZldYT1IzdC9NdzA2NzJ6TmFTWFFOSnlEdnJZV2YwcjF2NkdNNFJ3S1JGY2hM?=
 =?utf-8?B?MXJSUThHUDlmWmNMMnVpRUFJOExaNWtudHR2SnowRGYrclpmRzQ2V0ZVaG9X?=
 =?utf-8?B?d0RFL01kQjZZUy9lTWRQYnFpRjgyTFo5MGI4SVI4WUNnWkhlOEFGbUhUOE54?=
 =?utf-8?Q?CKwxwAkQWaShG5BSUcd9DkbJDGrldRcoIkXIhwNqi6Gl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d93b74-6bfc-4da1-428c-08de296ca74c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 02:12:57.5516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKodgPXGe/493kmau+FiMBJ6TVWhM3Kst/ipeKdknDHU8gbXO3UyU/GzQ3Ph/e+0Wkb3qydFdywAOOBvN10OnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9456

On Sat Nov 22, 2025 at 12:30 AM JST, Miguel Ojeda wrote:
> On Fri, Nov 21, 2025 at 4:27=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>>     CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>>
>> I don't know whether this "CC" setting also affects Rust, but assuming
>> it does, we can very well imagine that at least one of
>> `from_expr`/`fits_within` does not get inlined, causing the compiler to
>> not be able to satisfy the `build_assert`.
>>
>> If that's true, then this is an oversight of mine rather than a
>> fundamental problem, and could affect all architectures. I'll try to
>> reproduce the issue locally to test this theory.
>
> Yes, it does affect Rust, i.e. we use the same levels for both.
>
> Would `inline(always)` work?

I've repro'd the issue locally using the very helpful script mentioned
in the report, and confirmed that `#[inline(always)]` fixes the problem!

Preparing a patch. :)
