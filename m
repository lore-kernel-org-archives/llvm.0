Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF880337B87;
	Fri, 29 May 2026 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042757; cv=fail; b=kfpBCMSeA8NZOezh2mxt+p9VcrOtiWXtyWN110KAQ7/jP+/I89A+6vCow0GDrhDkM6OSDlss+Ojii1Yl3LaO2dZ9E/j4thQeR+PY6wN4//92YHsXOmRvkvX7mawUQcsNOo0hFA7L8xtmZ1qFdkoRH1lP6bPI0iem+MMoRkR7H4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042757; c=relaxed/simple;
	bh=Wi0n+aBwqB5NTIcbBQi83hq/B7zFLjSE0JGC3nEHtpU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=jsiNwkbqsGeuLm3u8gWz3mqdzO2gyVnh2l9bh4AHHjSBpefrjssjE9csFbxaKKd0tyNEe9J99VWftT49tqFXk2XiskWam5fxbJ/mHq0gyMusEK9jFwKrZqUhMMSlUBKwxbq5OsZQQrbwiR3elVejTYUtbZoBSh/ijz1ZCO4nh4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZfVeSOSh; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZfVeSOSh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLuHeIhPYmSoSimlROWTHfbLY96BERUIXwRvOsYT9oiLmLUszT/LilH38AVHm0Q1SDlZr9ERKPQGUAZ9yO7XJJrw76kiNXC7Dy28AuMARlM8dxOgtZfLCRuaSC7YfPE7YqdoP20iL5la8Om1cL5XJJYjBY7nAcgAdIR312cOHns28Pe56qFbdPd7K/KW5EnCP04Wp5mLmFfmNFCE5j2iVzSP01gjYqL4QGuyLuCK8K3zPDGKKryCuprVF5O71Rkctebb1qKML0xpu6N5LbXukROZ3qv0IRJSbfcsl/3w389dJynuuhbUh9QimgVXSO/xaXnCKBNX3Bt90jT/2PvwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAgFNi/56Nv3g3g2eV9q3L5B3VlGH4bFs8PSt0/lqnU=;
 b=PdFwNGmy8M8+rcz+sa39k6EZgnkWYHRLAOv2kZefWL795FsRzXV0CC0UaQfSh3Eb3/WonyU4X3CUbSw4+BDXWMkDsyz4QilLiJ4nhNXEl0A4NuAtMPLiSMoN0NhPOe34yM3zVdeDumFtGpcejRwAC1qI9fWRFXe0N+fXOfFB5xkBsO2jDFvwzZr9Q4FWcGQeYsyAeZmGKk25Vff7p+U5GjqKbNLeEibZyfR+bBmcAvglMeE398iKv9uk2Xdmt9w5XBjgrahm7HSwpjbVaZ+bki45YhT8B13yC8+sujSpGtLJ4ey2xMLotkrA/qNUlGEjSjch5o4z2NoB7nXH3xQe3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAgFNi/56Nv3g3g2eV9q3L5B3VlGH4bFs8PSt0/lqnU=;
 b=ZfVeSOShOPRyiO+2uropNmWYsFHGqdlx3cE6JCfpydI8lKEYQhGPxUqpYJQtRHqQyHpEFXZCqw6E5WdRr1OoHdDWtEOJHzUHRAPIKfUYsc4wiKoS6/4aq/bZlmAOrI73Ss5vzKVGhoZbWx5Ble13OF+iaQFrwvcrAKRI5mn/prDymi4182a2RmKV2cPNaobrwFQeqRapIMCUSPbhnxrD77MdrAInxxZTe7tSztEONDl+tEKpFQ36hgAo8OWUJAbSBUnDvXyDJ1ySLeYe/7Op4qJBV43/+qVb0pB28OJdcnKxvlMnj0RaQ8ql2mLrh77XhsuJ1Qvz0jeGSkhfwOKBmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9800.namprd12.prod.outlook.com (2603:10b6:8:2b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 08:19:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Fri, 29 May 2026
 08:19:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 17:19:06 +0900
Message-Id: <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
Cc: "kernel test robot" <lkp@intel.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [linux-next:master 3728/9137]
 samples/rust/rust_driver_auxiliary.o: warning: objtool:
 _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <202605291041.seNEWvLQ-lkp@intel.com>
 <ahkzosbjO4NdSyD8@google.com> <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
 <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
In-Reply-To: <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
X-ClientProxiedBy: OS7PR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:604:24c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9800:EE_
X-MS-Office365-Filtering-Correlation-Id: fb253987-b910-4768-7032-08debd5af653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	6g04tVwhqoKYq61imq36QA0GUtG0ZLb5qYJyj8VPiPCZomM+g3w3c+SlK3MssiEYbgEsPEC05bVLmFxk6JJC6ehxgBrkDWX1LocDf8cENjBQwGsZcaC9UVKQ/rdNQ6GddB0PwEDMvXg1gwEqMHAiqdykI7gOuL7+OxvZ5iqLZxG0OM1mTZhNsSfiH2loC5SOQPIERNgGqcTTvsZcl7hI/ezxmm77UP1cs+PzUPoTxIx2XsBVvdEhosie5e/hE05EiY5LVt7AcCd6suzdUH6KDlzsDnAClOj3cKVtHS7Ak5eXQqB/L4yaW35brhSFJetFQ90+bSE/rixnVQjKKNL5R1fYkEpbpneIdU2ZMQX26tlt0LV8bFy49z7xOLN0EW65dqJAm8d1Fbt46K+l9iuC8gSVo11cmXoJNz5HVtHfXfRArahzPnJum3YiAaWXvu9jdK6HwTcUh342AzWpbYsiYTlkh0vdSCXaRiBigz7FVw46lfXXWKuF74tyEkMtcdLj/cyrk83nHXW0CHkTns7co3FnlJD9rwku0D63mSprMTV8iaHrMjpht/dGyWHNDHjpAqzbwPLdnuq39PklrjgBR2UYUrr86hsAMPeJ8luLN3J36eKddhtGt02zMzL/rPz9vFqEapSqPTBrTysQ1Cv3geLp/2BlthrzB5LZFtC3Q5ywwCrskJKbuGro5EcolwjsIAYtDsc/b9QUKmG/YfZ0uA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzB5RUZXK2hOVkhNMUVQVFJIQm5DZXcwVWs2K0JweDh2YkZpVW5QTExYS0Qz?=
 =?utf-8?B?SDhuNnA1d1RxUkZYb052ZldNNGlaendIMTdCNENRVzdwak5wSDZpWkN3c3RN?=
 =?utf-8?B?RmJ2MXlPRlBBYmhadHkzcUROb2pob0hqNHVIQ0lSME1hWnZRTXVsWVZwR0dC?=
 =?utf-8?B?MnczN09RSGlPVDFEUTQvSmQrN3cwZS9WSE5KalhINzlQQ2dhUktvaDBDRnQv?=
 =?utf-8?B?M01CcFR3WTc5aWNDb0ViUndLWDBPNXV6TWxOanhIZmRSOE85SjRIbVFMSFZK?=
 =?utf-8?B?Y0VhSkpQNTFyZ2s2OEJTU3lLYWo3aHhrVU0wTktZdFNMTkdNblUzSGNkM0hJ?=
 =?utf-8?B?Q0JMcjF0alZFWW5nd3A3cE9SM0ZaeVZBSVB4c3c0cXVLRkROY3hhY28xQUY4?=
 =?utf-8?B?dXdtMXM4THBoWmtIa1d1U2E3emNCaHBBcE9BN3Q0UlVpN25Hd0xXTEI3UTF1?=
 =?utf-8?B?RC9XVFRmYXgrR1Z3MmpWN3hKb3hlMTlxSXhpVERmTjZaUi9VeURDUTVQQWwx?=
 =?utf-8?B?VVlpN2JNRTlrNW50ZXVyMGUwMjJreGlhb0pYQmVhNXFSY2lGZTlsUEtEQ01j?=
 =?utf-8?B?K0RWbUZSSDZ5bkE0WDVLZDZWSStIaVlTYzFHNnIvdFNWVGxPRWIrazZDWVQ4?=
 =?utf-8?B?bk9Oc2dvd2NxNjNpVTRUc1BDK09Xb1NJRlREZHU5OGFEaVIzSnFCZmR4bDJr?=
 =?utf-8?B?Z1RmRlIzWGgxOTVRR2JjNjRvT2ZPeWtyWDdoUEt0TlBEYkd4ZzQrMnkrMGFT?=
 =?utf-8?B?WlBML1dTS3FPSExocGU2Tk53a2FWUVdOWlhqM2RXeEpNNFV3UUdZQ094NEJR?=
 =?utf-8?B?UWlIcXRKemFpeUpBZS91dHFVbS9lR21QVFBRNmFtcjh5Y0hjR3h1N09HTFA0?=
 =?utf-8?B?V0x5d2RCVmkzN3g3cFRmckIzNWlwMTNoK1VUcFpMKzNZVndveDBDRWhCckVi?=
 =?utf-8?B?OG1JL1FoUGd6c1U2elVrOFF2d3BxaHdTait2Q0g5QWJvNU5NenEyNG5nRDBp?=
 =?utf-8?B?cTZzMGxXT2xTUXVKQ29yQ29CSHVpcVpWMThKMDExVHF6Mm5qUWEybEJ0bDEv?=
 =?utf-8?B?ZWVqaXQ3RG54RW1wZVNrMWlXSWJ6YTdQSmcrV29uK04yQ0xFZmd0b0ZkVXMw?=
 =?utf-8?B?d2FNYUwyckt5T1BqT3ZtY2NleXlraGhWbS9QaXJ5NnYxNEh1V05GOTREaE5N?=
 =?utf-8?B?UWEwclJSVjBGKzRPdUxJZVArSUxSTU0xdm1XVFptN1hVWmlMSnBnbUtKUTI5?=
 =?utf-8?B?M1ZQcUpXT2QzYmlGRGJZUmFwcjl2RWwweUhaS2svaEo3emJCVVNsdEtHYlJR?=
 =?utf-8?B?VHI1UVIxM1F0alBCY2FCbmpBeXZUTWJXMDJrYnBDNEN3K0c1WnN5OGtxTXc5?=
 =?utf-8?B?OGU2SnkrVVBHNXBXTEkwUVFOblRWMFVJOUw2K0tXN1JhZ1RlVXpyQmlWbXYx?=
 =?utf-8?B?YVFPSk5aWmtNeXhtVU5ad0lOTnZwUGJXc0duSU1hVHp6UW9ZZ3h0aXZuVWY1?=
 =?utf-8?B?MS92RXR6UTBoaU9TZUpPTUh4cDFuTWE3VE9iZjQxZWlLQncwd0tWdkduZmFN?=
 =?utf-8?B?Z1d5SWMxMm9ja3RyVzV2RkVodFhYWmIrYjQ5cXpJbEErL2xacHM3ay8ybzFz?=
 =?utf-8?B?Nzd0czdjUjQ0eDltWmtGNFFuSUpCNWpHMTVGRUhmUWZESWVzUDB4amxKaEEy?=
 =?utf-8?B?ejV0V2RYektDVnJYam5SS1dSemJNUGpiVVJ0b1MremloUmZJUzZuYTRPeTh3?=
 =?utf-8?B?SElyWTVYVnBZUjdDVTZTM1p3ZkRKdmJsakpseXkzYnZ5a3V6S3NzcEk4TFlr?=
 =?utf-8?B?YzFiMW1kMkNwOG5BNHA2RUYwYkgxWHlRUnA5QVp1QzI1dDhpaFRBSG5LMGhl?=
 =?utf-8?B?QWphbXZWVHZIcVdTL29Qc1I2NU4vYysyMXcvSzF4TytQbTBLRHhkWHV1RVlj?=
 =?utf-8?B?ZURyUURwYUJ2ajJQeGsreWZZKzRyc3dXNkJNd3lPUEVUazZzWEhHeEVkREJK?=
 =?utf-8?B?Qm45RW1WQW9MaDdRRmRRZ1hDRHdXVHVZRmhTbWc3ZGI0SXRMeDRROGxoa1pp?=
 =?utf-8?B?UThpaGRlcVB6cFhkaXhmUGlOdGovTGZrVEozVkNucjhSNmRQN0g1ZG1lK0Ix?=
 =?utf-8?B?b1lIcnUzU0QrT3QwQWRxVjVTWEQzdzlLcndPUjFtMEtZbFdxYjV6Y0NSeWpy?=
 =?utf-8?B?cDNkQnZpUFJ1eHhGK0VOZDl4eEpTVFhYVjByYUtqTDk5Q0pIYTBaYmMxWnNh?=
 =?utf-8?B?MEV6Rm1IVzZuVUZ5eUdUVDFSelNZcEdIcmozUk9qUUQrblpPN2JMTzk0Vm1K?=
 =?utf-8?B?L0JSejZlbGMvMjBuY1gvSXVSMHVUQXpzRFcrc1daQ2dIbGZsenRvN2MzZWR3?=
 =?utf-8?Q?C9Uudfolqir4ipOkLxUgLFE3M4+ZW2eZnGQuRJubcdnUl?=
X-MS-Exchange-AntiSpam-MessageData-1: lXVtSNxamp6HHQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb253987-b910-4768-7032-08debd5af653
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 08:19:11.4679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHnWLCFQcmKCo1LO0QI8tKfT/MnmEGFbblGbN/dhRnmkU70t9zxcqQeAjOMPbE/ZOfFAI6XTBQU6xgbq0WgIgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9800

On Fri May 29, 2026 at 5:00 PM JST, Alice Ryhl wrote:
> On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
>> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
>> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
>> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
>> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: au=
xiliary: add registration data to auxiliary devices
>> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0day-=
ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
>> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project =
87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
>> >>
>> >> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
>> >> the same patch/commit), kindly add following tags
>> >> | Reported-by: kernel test robot <lkp@intel.com>
>> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWvLQ=
-lkp@intel.com/
>> >>
>> >> All warnings (new ones prefixed by >>):
>> >>
>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.modul=
e_ctor+0xd: call without frame pointer save/setup
>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.modul=
e_dtor+0x1: call without frame pointer save/setup
>> >
>> > This one looks like this bug:
>> > https://github.com/rust-lang/rust/pull/156980
>>
>> Does [1] work around the problem by any chance?
>>
>> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d55@=
nvidia.com/
>
> The asan.module_ctor error? I don't see how it would work around that.

I was referring to this error on the report:

_RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9=
_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNt=
CseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocEINtCs=
57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5Error=
INtNtB3y_10___internal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11InPlac=
eInitB1L_E8pin_initB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3newNtNt=
BX_7convert10InfallibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name too l=
ong, can't create __pfx_ symbol

As this patch might help shorten the symbol.
