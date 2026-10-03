Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A165E4399C4;
	Sat,  3 Oct 2026 15:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791040449; cv=fail; b=LQCIeQ068FmHhAF4i3XHL+Y91WgUQ0TloGdBBM/54L/ACCO2EnQx1DI4ms/ecv0mF/1oj5baSbMtUuBpIJ6hfVkIH2MaOy+ig9Qsed1/mFiy5ccpmwLlc8l17yb4smI8uvxUvNc70s0Fcg84n3xqlF3BeJ50vazkeo7O8h2IN20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791040449; c=relaxed/simple;
	bh=v142A/9UJ6pZzO1PYYi8kHGldA/Nl7dUjKPIxumsKM8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TC8Jtz3JEczdAgrFZdq1UWFfuvYJb2BuXZpbZ+jYnBOAG82uNKJ4ybtFQnMzKon0tiN3S88i1d9mQ5HIHtB2OiWuH1ByzGNJxW6Ujag+ImVcZ+Pobgsri+fNTbB12fNnwf2B+Kcg6qWtr++QVhYMutgyIYwslfOlIQrLZsBv4tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FX0UpycH; arc=fail smtp.client-ip=52.101.48.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FX0UpycH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyHP2tPoOXL7K27Kr2R27hqF+vIvQ1yOJSYeqh+SlxoxgUA55sGMh1KMgDkcKCRU4f7MAHl1N9s6Ijrt/jFZhyWM8/881O70Acx6aWmhEHQabTvVE/2B6o7xV64eBBPvxAmm+sAM2whpibedpc3CbReT7resDo4bBNXbym8swUEALyy4GsC3uOFvD7M3seJmDKl1ahECFsylrkVliMINqU9OnpfeROpHtaSDz4vLI+bpiFRCkbHZIPUTmmQFxntUXXEO3IqzFzpHgI9StrC1wGhWJhhYijm8l7Ne8DovMyXF67/LLx6kC3bpwngsm1XAX+Yx1UepM09AmcjA2oE5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSO9ndy5ZJWB3FAq+nUnyIZ2ehkpZVXBAAYSlwePXQ4=;
 b=hZb9iGOqvQAYriwaGRKDnyNWWm1OIaYM4ubfie52wbGA1DEUki3T0JbWvcIF90SQjv2pyz93w2wIR5okDs/RlhKukC+UWlgD4wQhnCu6LalWu8nJ68RYtKWlFOPDGEpXLF4fZwEKbay3uadxVE0bF0QEFQQmd26oyeO7j5RF5pOtGtXSov84FUCRw7ExTYd2OCvUSSM2ni1xNjGpw6xqFhVI/vMmZ1C4gJtGjjdlGk91RdEHnPFt1kFyeFYFC0am//8D3BdmDmbh+OBWaU7x26zbnzBTF/daDZWSsbZiZIpVe5QAAXGd7BsvmFH/QN+SAItP86/sj9of8FPp7PdqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSO9ndy5ZJWB3FAq+nUnyIZ2ehkpZVXBAAYSlwePXQ4=;
 b=FX0UpycHyiCEqfy/1CWvMD9k9uANlC7TKgHEr07bYvSNm9LlNS7wk0/omSNlx51d5ulFYNUU1bocyapYUOehD0k+QchKavs8QDy81KDv0l0OaFeNj7bqNzWq6CVpZpbdcABc9m1+VAM0haDls0FfWaYJio2Iazjj4N34cAsF3ZL7LZY8V6EjEhVm3CW83nB5fNoWoQkZKg1Fgb2QJCPmA1lttwQcH116Rr+7ESJ77+t3gFJJl2gdlXk5ipUJw3UQj90nIHNa3fPigDkl7zPo2CmL558yE3FzlOIMjoGEKVcXdh2vy1HojBsnw9rjvExRECR5YMcvraDZubKTrut8Eg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Sat, 3 Oct
 2026 15:14:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0472.015; Sat, 3 Oct 2026
 15:14:02 +0000
Message-ID: <220704b7-c361-43da-bb67-3c19bfedc82e@nvidia.com>
Date: Sat, 3 Oct 2026 17:13:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 13730/14185] warning: unused import: `Spec`
To: Alexandre Courbot <acourbot@nvidia.com>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202610031630.JOlyp48X-lkp@intel.com>
 <DLVATA7ILWLB.27BB2BXCREDOT@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DLVATA7ILWLB.27BB2BXCREDOT@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e279f3c-883d-44f2-9821-08df2160f548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wvZuOpoh9pE8jHGvioALCg4lc0uYY2NsQn69iltjlulmX9udLTrjItjG6kKyoL3t8cRRY2v0NruBrHr+sVhP/o0XMZF1kfiuRFp0/D+6J40RwCfThb+rLvun7iDQB0QF5qDerBsIcKqTadSFr8rqrOfJQ+ntd+v8PF8C5LYVCnGR9l9vLYWXkojq69w+vxsJayU/a2BqTE8MZiO/nvvbquk9VwQ2P49kA7lge/IqOVxRcotP58Ciu+q51650pOJ1/s53zU/E+TW1R/PXkZCN0jtTYN6pzvZU8NC3EB2ILcgcW/8t+YCYLsLOU1+bSIwhuGLewavmkpzsqvu1VVHS4c9E2LxZNeWDbFT6erNH3I3jkV60zJxiEOkKOdc0BEDsGHER/T3eKhB/neGYmqS1I05dkHFopHV2DiAr99zYKdGDIj6HPt/kebPkHTU1xp9RfYw5qPTbnmHJaDCdJ9cZ18t6LgQCksdd5CapUFvgNUpGxy/+STHlZVlpfs7rwbNdrM4tHU8/kfAvg63D4vE2/opSkgqUWU+CZ0/AQC6VxRPm5xQBwt5EoTTvj7jgPaie02o0qBJ8uMnzXrQrewwqAvwsc3Dr9gkLaUY0cOpq5fmmWHeNUtBa0U0Hljv9qSc7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWRiQXNLd0NoV0cwYVJwRXNjQUVUaHFWR3RoMlNwUEwzdVhBUHljdGRXVnhQ?=
 =?utf-8?B?bEZobkt0cGRtL2tzTXByemRMWFJ5TCtkUm1qOTJEVnlMdjB6anNFREdua1hE?=
 =?utf-8?B?anF6Wkt0WjJOWWpZbHd4djJaS09rMVpBaUY2ekRvZStCQ0VIZjNsM2ZjYitw?=
 =?utf-8?B?bnFoTUxYL2U0eTdzcThHQUx6S2g1Q0VQOFB0cjlnWWdPOTBmMzRiazlDTTBL?=
 =?utf-8?B?SUZPcDYxcmxhMWFVS1NOOEpYQ3JJQ0duMHZ5b0Fycmdiay9wZ3ZEdUNXRjZ4?=
 =?utf-8?B?UE9GVWw5REFEdDluc0ZYZFYrMHkwY0ZoclByWk9iN095aTRZVVlGTENwT0JL?=
 =?utf-8?B?OHNuZHlDaFo5OXhNeFR3RWVsU0R5UnNsTkR4L04wRjFRN1lNUWQ0VHRpSXpm?=
 =?utf-8?B?YUU1RWlYS0d6N1l3TzVvTjQrdnpDbUJGYXJXK0pyV2U0Tk5JajY0eHc5Ui9F?=
 =?utf-8?B?bDZPR2VQU1kzb0x2Q1FmTUYvK1l2TkR5L1RqY0xabG5vS3h0Qk5rR0IvQS9U?=
 =?utf-8?B?NnlYOGxhSWN4QlQ4UCtMWWhqRWRlSjFISVUxYUN5OXFRNngxYjBna1JleUtL?=
 =?utf-8?B?T2tLRXhWVExIaW4yY0ZoK1BLU05Rak5neEtKMm5RNFJMaU5STG1EQXVMRWpB?=
 =?utf-8?B?NzhVR0laalZJWEpaczZrSTB5QTkyT0xrNEdjYjZaNjlZWEU0d2JqemxYSkwv?=
 =?utf-8?B?WTVBNnV4dVltRXUyN3Y3ZDFEVmR1Ym9WVzd5czNrM2RzdG5hZFU4a3ZuQi85?=
 =?utf-8?B?R0ZmbVJaWlVGQXNRcFI1KzEvOHFtejcyVkowb1lSU0V0ZTg2aTlhSGdaMHly?=
 =?utf-8?B?N2dpNnEzUHNvLyt1TFlydE9FVmtKRlc2SW93eXB0U1NlTjhBUkZmLzlzeVUr?=
 =?utf-8?B?aDZrekN3dkJ0aDU0NUJPVElMaStUQ0tXTlhhMTdpY3R6eVV4SXdjaGpOZExH?=
 =?utf-8?B?L0RHQ0tkZ0o0MTBST0NmOHpwaFlOVjYyZXVKTFRVWUJiWHBGUVJWU2ZTelgw?=
 =?utf-8?B?Q1lGcno2clNVSURJczFqMkYvbDJsc0Vmd2QydHVjbkVYTHcwZlE2SDVKUTEx?=
 =?utf-8?B?WUpvR3BQdVJHS0NEaVRCWUEwc0YyZDU4USszaEhINXk3Qjk4RUp2clNUTi94?=
 =?utf-8?B?S09ycUFWRzE4RmlIMUIrdzQ5NHRzcGVDQUloTGlPa1FXTmttY3p6RFlvOFY3?=
 =?utf-8?B?TkJNMmtTRTV2NzF6Q1N3MVdBb0V2Tk84N1UzbFVVaWRvRUViOSt2WitOTVYr?=
 =?utf-8?B?U2ZldDRBOUVyUDluTjIySHR3TUIwZVVyVlVhNUIwcG1hZ1pZSW43dTY0eVJ4?=
 =?utf-8?B?QUtXbk0wQUJnUkhtWXBRL2dweFpHUllXWTVQK3pYTWI2TldvdVRXNndZWHFE?=
 =?utf-8?B?aDVFU0tvTVV6dXQyUDdGRFNhMlBJK2xXdkZPQ2U2NWpkanIrdTNpSjRNQlow?=
 =?utf-8?B?YUN1b3RuWHhzYzh6bStBdTNadXpwVkVtQmo5aHhXVjRMbTZRQmsyeVQrd0tW?=
 =?utf-8?B?THhOcVNQam9zK1pxSmhwUlYwaFhqSmZCQzZiYmRyTVE3ZmJLS0VTamJyWHc4?=
 =?utf-8?B?MFlrOHBUOWMveHFQV1JIQnlmb0JvVGFaUHlOanV2SGxHd2libXNaVGFXTm9k?=
 =?utf-8?B?dmFiclBCTmVxZHRrRlM5Qmo0QVlaSm8velBVTURmeFJ6Y0xuMzFhYUczOFJU?=
 =?utf-8?B?Y05Kd1NMSlBEb3VURnBPN1VSQ2JvbERuTVY2RHpVbzF6SzBpSmJHbzUra3g2?=
 =?utf-8?B?UmRxUThVbU9TRFR2YkR3L21xcjg1QmFrckVSYXlUTDQ2NmpUMGY2a1pFSEhh?=
 =?utf-8?B?Vk95Mnd4a2FpVjlqNCtxQVBPdkg1VVlwRmIranlEdXorMFMxakl3NDRwclhr?=
 =?utf-8?B?RmlsMFlXcEk4T2pod3VUcUJLQUs5MFlCcmtieHJxS0tEZ1JsdEJSRkkvQmg4?=
 =?utf-8?B?K1UwOHg4bXZlLzB6Q3NHZlovNCtRV0Jia0ZRVnFVVXlzcWVSMi93dW8yVGhT?=
 =?utf-8?B?R3ZCSWVlaVE1Yy9wSW9iSmxDTHN4Yzc4OE9xZ0pjRmdJaDI4Qm0zU1RCNGZZ?=
 =?utf-8?B?OVNGWWRKNTRkbkx6YU1FRVJNWVU4OTU0Q0hwdGNtSS9jL1Q4NC9BenAyaVZE?=
 =?utf-8?B?TnB6ekpjaFJTRVgvTXNrUU1SMzNSYk41blRRa2xLNjUxTTdqeGRiSm9TMjVn?=
 =?utf-8?B?bE1TZlNmM3pvV0JLZHNuSnByR0RPSU1ZTWVkZ3pOTVRiZndVR1hmNUY2cVZi?=
 =?utf-8?B?UW5UNGgzaEU2eU0wWU5zRUF1YXkwdjZyVndHQ3VVMHZ2YzRnaTZpZWt5cWVV?=
 =?utf-8?B?d1FTN2lDSTd1c3FQbEJNeiszK2xlK3g1eExCYnJvVGZPVXVTc2M2Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e279f3c-883d-44f2-9821-08df2160f548
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 15:14:02.7027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ouPqTo91tYuMgWzf09LG6q7q/LDTm3ja8CTu9AbYblu3T3W+/MoqNZfGhxdreOZQ1oO05ovUk0ShFCJPy6/YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617

On 10/3/26 5:12 PM, Alexandre Courbot wrote:
> On Sun Oct 4, 2026 at 12:09 AM JST, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   f0406245cb9855e6318335a8a223551354291a46
>> commit: 9cb3f5d56e81fd97a82ef361b210bc2322daaaa7 [13730/14185] gpu: nova-core: add an interrupt delivery self-test
>> config: um-randconfig-2000-20261003 (https://download.01.org/0day-ci/archive/20261003/202610031630.JOlyp48X-lkp@intel.com/config)
>> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
>> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610031630.JOlyp48X-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202610031630.JOlyp48X-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> warning: unused import: `Spec`
>>    --> drivers/gpu/nova-core/driver.rs:29:9
>>    |
>>    29 |         Spec, //
>>    |         ^^^^
>>    |
>>    = note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by default
> 
> Mmm, this indeed can happen when `CONFIG_NOVA_CORE_SELFTESTS` is not
> set. We should not import the symbol and instead fully qualify it on its
> use site. I'll send a patch to fix this.


Oh thanks for jumping on this, I was just starting to work through
it when you answered it already. :)


thanks,
-- 
John Hubbard

