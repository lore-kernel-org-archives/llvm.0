Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A2733A9C4;
	Fri, 29 May 2026 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041262; cv=fail; b=Xcz57Iu+TGqBH+KzJCMXWm/PyjSFVAFtt3Qn8B6XZ1Mp9ohVw6gmohY+FDbTYjypNw4oAG8KtLgW/5BLjlXTYjCcaM9piAtBwHn2P13VSipWJ3z0RZTH0kDTqsBxNDFAhtjIfqDvxYgEIBu6MIH8/V383C0YdhI8eWu0yf03Dms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041262; c=relaxed/simple;
	bh=DXO0zdsm05pVT/790/TSkqvNe+cALr3ZOoOYnuhTSjg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=JRnwpjEDO63RmihVvWCaT1LYN/6KktCvBffQju3Ay4SE+lIE5k9YUn05W4kDoKacltow1pJqa747lFBGbDtl+Gt985RMr44Z1iT9MvDArs4wYeQO8S/J7tW2pMTNM0KnCntY4AJJUQHgSQZMqqXmD/saubMop+0Pa4j1654NXW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V1p37X1C; arc=fail smtp.client-ip=52.101.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V1p37X1C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffZPUkFwJLrWYVz8vSvSFlaG8+iEi08UqwWECjQc4Wdlv/GfPFMnUmocW+x5D5ruWUBksvWNYzZD2gJo9B1XlEt9ALnQqNe7katcZvkkjZz+VYoBA/pAhgTFsFHJuUpDIDX2INXVwReq566fsGN+E9tjp6fW0MNiHCEZSGjcOwGiNpcvE91ihIHOb+kkMHNOnsnAsSWMkFDB8/WScjtC1fDbsA5ZNnEeE9yxcJOlb3HfnYi7dk3vkCrNPt/YjpyySC2taPLdaIt+c5Gdu6qBZBNYuR/3gSSmZXmrKWX7RQrqetMShmT+mHsUvGTgDxoNF1Dq16ROl1kHpalqFEHJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF3HSL2WFDO+y0IQtqcdpjVRSCCnR8JnXSCC0zQB3Ig=;
 b=El9Bu2hQwvoac9iSB/2LxvjFWBlkl+KTI6yHBQRr2ztfRuanq3fqsB7AwCi+WkTsAaWNvJ1sH6hHCeuNj7K5nWzEdE3WjgoZHeQLx7wpW/pPUko2YwiH3TypnfVHD7A2rR8FNEDqEJFzw32gch0wVbnjMD/QO77pLGcn54z4/Wy7uv2vh3OjKFYfqLNuqVGlpXa1tL5eGfNJo31RRXNqivnMsFD+fw2a3TfmsndxqZ5EcLXH8orKW9WNaMVC2tQBllXXDh45BavSXC96StCj9xKgR9DD5kFzHSLhXZppelnqLLEoDAOVlbYmftW94fAxQkQLdN5SwYdFDI0zWzbqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CF3HSL2WFDO+y0IQtqcdpjVRSCCnR8JnXSCC0zQB3Ig=;
 b=V1p37X1ChSweu2qUN2olKQYbYY55wKIzD2y92mcekr0/TtXtH8yAUWw8/HwnnvjnEbuoBDv/mmy15Iyi4Nr0Fj5+rn2mY8rfW6llqTEk0Gp0SiAkvqNURFIj0NBypWodaBg0csEqLlQR/XuuZwfcpVRYccrnPU3JkPPY5j0AhCo4/AyDnDaCBZTtp4R0ClxkEB+JdpvXRN3xpGZMM/MbxO9Dm4nJLJvr321j462MAkCAqmsuNI1PM1tSNcokay46P+OOocUGv+227eTSGYiL1f1JePO6YTVpy3IYGysg0efoQQeWZJuLAmrcNe/Cqs3Yyt6KpKmCDybHsT/8Q3h0jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 07:54:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Fri, 29 May 2026
 07:54:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 16:54:11 +0900
Message-Id: <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
Cc: "kernel test robot" <lkp@intel.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [linux-next:master 3728/9137]
 samples/rust/rust_driver_auxiliary.o: warning: objtool:
 _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <202605291041.seNEWvLQ-lkp@intel.com>
 <ahkzosbjO4NdSyD8@google.com>
In-Reply-To: <ahkzosbjO4NdSyD8@google.com>
X-ClientProxiedBy: TYCP286CA0166.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: df4e149c-cbc2-4b0a-b029-08debd577a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lDn71mAsrfuxMqwxT/OF6N6bXZTSyyQ+Gjf+/4GNMHIyvFhobtcdq60TUiVV29slWu2sgz6xo0MFwK1bMJVzTZRzEX9Lyey0VVsc7ufYj7RuKkv7Uh51FRTzHF8SU5v2krW5xqdQ8eIP5spYGuv2I/AiRxznafCQTqBp+y1OcC3fLlFBx6fdf+YTduLcixiJwwwm55pEfdji1gPwnonRGDpxY4rRSYnYnATFZUb3wjJSmPnaPSSXWq1fW4KdqBCJFUdBM8zVh9upuYpeUYrRDq+B0ETlCPeh0mSqMziGoClplvhATDCHQVLaORAvWlSUwOyrb76D/GmNmH9LpglnbfBXEGzogVKVNgAsXkKQeNQdkftIhwo0tgfFILpsFKElc6g5EoEivvWv3ro7MYaLPZBD+jh2RVgspAhEOLUCzBjvpayIbJmO5vYXegjnIHhwx2AET47IXrIOr1bJ6nIVjARfK+yLz0QRMNT/jw5n8mpCldtZ1IkbMLuP/C1JhzHg2IuQHg5C1vtM02UmoZs0nVTz9kM8bggQ6ghqEngHAOi/0foYRRPTzz30fngOiaRNi9Gmz5ccWPCJRJfEs/H9A/5Cg+qKMi1vIrUTixMqvjpDqgfLX8+bfjy8cnWos+qmUKvp2rIWWJk3N07VkSZfSv2GLOeBQzTtSydrpEpLq7x/OI3uB677IRtgr0n7nOs5NF4l2TXSPSS0zvfajaj+ww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0NMZ2tmSVJLNnFHZDZVOEc2cCs1cFkvdzB5QzNRMkVSL0R2Z2tSRlozb1N6?=
 =?utf-8?B?MVE1WUJzWllYdDZmZE5hdXlwWVBwZWt4cUgyQ1lHaUw0TUVhTjJwaEtPVkRi?=
 =?utf-8?B?SXJ2SWxSaFNyc3p2WHc5VHFDUHVHTlo4ZldKU3d2N09ObnVWN0dKWFp3YUpJ?=
 =?utf-8?B?YitDZEtDNzJweFRSVzd6SlpWbWNlRGlhdWpHb0VyNmNtRGUzZmxQNXQ1d0dT?=
 =?utf-8?B?WVRLVXZrbCtGQTM2QXhib1c5U3pXRiszZmpESEQ0VTFhNUlVR2RWaXNVT1U4?=
 =?utf-8?B?bVpieXhPS1JETExCUnZ0YThQeVZneE10VUtxODFrUEVpM1o3QXVmY2RFcFJQ?=
 =?utf-8?B?eTZ3engwVDRUeXNseGZVdi9EajdkNisyR0xYK3NZT2Z2M2o4QUtSOXpJNEtC?=
 =?utf-8?B?SVVTdW9lRjVlZExia3FxdTk5dVRSUHJtN2lTTkl5QWNwWTdPTU5wdk4rdTl3?=
 =?utf-8?B?QXdKcDF4aXJDYTRIN013QXY1ZlUvNk5tN2R5Q09veG9XMWt5N2RIdE5XaHVw?=
 =?utf-8?B?NmRSZSswV1dUek1sdUFwZzdoVzVLVSs4a2xIOUl3eFVRMjJZNnk0cFFoL0xi?=
 =?utf-8?B?dXI3TTJGUWZ6SzJHTnBRTTI1VUV6SmkrMjgySGZ5UExlbUtkbFRiMkVhSnB3?=
 =?utf-8?B?bUxLY2tIdlZMZkozUkhFNzFoSHdyNGMvQ3lLbWRMV0tSTEUwbnFMQ0ZxZEdj?=
 =?utf-8?B?RER0QjhZeGFiaXJNc2JJYWhZMnRVWkxiTzhiMkVZeDArekY1V01YZ1dYWG4v?=
 =?utf-8?B?UjNYTkF4VGNpZndqeENZdUY1UjMva0Rqd3plaWpQZEI0b0M0dkFvenZNN1dI?=
 =?utf-8?B?SEVxL1hwYURLYmR3d21yWUVKd0tMTkgxOG1heU4xRHNFcm5ZeDY1VnpxaGNi?=
 =?utf-8?B?TitRRWFoSDZhMEptU01nUmltWXo1ZVlzNTBPa3BrR1d5a1ZpZERjaXdlWHM3?=
 =?utf-8?B?TEh2bUlDNnBBNHJMWHdPd2p2SGZETGZWSmNqTjVMVjl5QlRGZ3FUbitua1pL?=
 =?utf-8?B?bkdVY0hLc3FKN29TRW15eEF6TmZwWlRjbncxQTdZNEV5MENpb3pyMFRJZjYz?=
 =?utf-8?B?dFkxaDdEOXFlaUlVcnk2Ym5SRzJZbFYvWWtIVDA2dmRTZkZuWXZ5MFlHWkh4?=
 =?utf-8?B?dnd4Y0h3OFU5aG01N1B4MWd1VDhIdjF2MDc1TVI2blAwYUtQa0h6Unh6TFpZ?=
 =?utf-8?B?VFVGWVIyWUNZMGt1UG9PMFRqam5jVDZ0VnRvTk9YeFluL0FuODYxZmJMMFNj?=
 =?utf-8?B?SWJwQVc0RW9IZGtaWEwrN3pFajJBQWVxajE3TlMzQ0pCUy9UQytYVHBpekJl?=
 =?utf-8?B?Ym1xNFJjQzc0dWp4bWNoSUl6QjRHYUd3TnVsNXNaRXVxUGZYT0ROOHpzWGsv?=
 =?utf-8?B?Zzd4MDVBVnYzZndXSFM1ZFFIUDZ6U0EzYzBZaHNPVkxqb0JSTmNldzVqbUpV?=
 =?utf-8?B?NWVXck9JemwzeTBUV0lQYkhtVUNTVGJqZ2NXbDVqcE81bWJKckV2VXJNWExn?=
 =?utf-8?B?dkgvRmVzWTVGTlpHelhSb3kxWVhCSG4yN24rbWdiZUxaeGtJWTJBMzNvcjNq?=
 =?utf-8?B?YUpwVU9HU1NncitwQTFBaGNlNGZTM1p3STBvQmZaUlZLa2pvOXgvNDE4OGxv?=
 =?utf-8?B?b1ZmNzFRV3B3NVZZS0RlUWU0VjJTUSsvck1JNGF5RS9lQ2FHb3JZelBORUhL?=
 =?utf-8?B?QlBOcU1oT2FGWXNvOUR2YW1Fb1VRYmVsdVFMbkRjL00wanBNc1l6OXZWa1Zp?=
 =?utf-8?B?T1NJOGVKcmJKYk1tTXVvS2hGeHBVYXhORFJBMlpZOTU4OFpZWUhEVG9aYUF1?=
 =?utf-8?B?Mmx2VXgzUTk2NC9ybEN0Yml4MFpSYk1aM2JxWXgvLy9EdHJ3S09xSDhtNHBN?=
 =?utf-8?B?cXFWeVJDa29IbHdLYTFSeEtBRTQ0UlVzMEEzZG1PbTRFQlRTOEYyOUN0NThh?=
 =?utf-8?B?REROYlRhRWZWVXJ4ODlGeXdicG9ybjA0QWxLSTg0eGdNTi8wN0ZnVmNndEc3?=
 =?utf-8?B?azNOcm9hVUd2QVduaTNCem1sN2xYaDU0MUl2bm44N0VpTjBzcnkrN1FGb0Vk?=
 =?utf-8?B?am4rQmhxMXF6Ky9wUGxuQ1Y0MUZ6S0tuUFg2WEptODFRbFR6QWE2VUovbit3?=
 =?utf-8?B?Y1M0Mi8zWi83Ky9mTzVKald3d1Z5U0FKcllTamM4eEV2dDJRODRjY1lxb0U2?=
 =?utf-8?B?SWQyTlJ2cWl4VTFLUzBSdkQ0OWgwY2hGT1hoMkxodjloS0krTzFZK3BUeXll?=
 =?utf-8?B?ajY5eS82SXl1YzM1N3BuKzhxQi9xbFBjYnFrQWY3Y0U3M1daT3Zib2pKSUtR?=
 =?utf-8?B?b1NDemZLa2tRUnhaNjJFbnlDWTY0aHZ1TmxXNXdwbVZCV3Q1UXhzREY2U2dp?=
 =?utf-8?Q?cVePN2Vt0dqHHIW6zCQNsw3WQAYVMQicSNLsxiVxA1Zel?=
X-MS-Exchange-AntiSpam-MessageData-1: DXmac5qszeCHww==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4e149c-cbc2-4b0a-b029-08debd577a7b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:54:15.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCKZufEkTyb5jHLG+ai1t4Hw5ftbUCnCxbPyMXCHYfXObIkpsrwletIZa1M3FQdsv2tHomCMmddK7JE3H707iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7301

On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
> On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
>> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
>> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: auxil=
iary: add registration data to auxiliary devices
>> config: x86_64-randconfig-004-20260529 (https://download.01.org/0day-ci/=
archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f=
0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arch=
ive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
>>=20
>> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWvLQ-lk=
p@intel.com/
>>=20
>> All warnings (new ones prefixed by >>):
>>=20
>>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module_c=
tor+0xd: call without frame pointer save/setup
>>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module_d=
tor+0x1: call without frame pointer save/setup
>
> This one looks like this bug:
> https://github.com/rust-lang/rust/pull/156980

Does [1] work around the problem by any chance?

[1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d55@nvi=
dia.com/
