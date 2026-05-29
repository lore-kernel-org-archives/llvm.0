Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010021.outbound.protection.outlook.com [52.101.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8412B3438A4;
	Fri, 29 May 2026 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065779; cv=fail; b=E1WXXj6cMs8uJRBkrbyoJxkUE/MAsewTch2BFo+vZzZf4PYDfZwNgV2ybUrl99yvGt+3EoMqbPCTnZOo0e3OE7kxW1cY3w0Cnxl9Fh4kCLFwu9G7rDjMwKzJ4vceZG2a2eEU+ZsR1E6Q+oeq4YDORjTiMwlyXqOtf5xL7Dl65xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065779; c=relaxed/simple;
	bh=nCru1lyos63WevEzF0NTxPU/6OAB+ChWEUXn9gU5428=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LjaZENx/+A1RG9w/zVMK9l2ItpnhOnA52u6TdxKonx/EMw9+hqSjj0SAKXWojKlp1hpLZLLhE4x9rXdrqav5I3HJyV24+XKA5Nt5ORkpm1YW7slXEOvLPKTkAmSZE7NJXiEj8qPQBnsrfIOtOrBf0Qcc5r9GoEq1qcjKnYxj9nM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EHZcVggr; arc=fail smtp.client-ip=52.101.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EHZcVggr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwkIWq8hZXvoUNIYBAz3Fa0meHBFPeDdRjyTFDPK++j5Y9q1t39zmR4D1Xx02Wq0XzgBklYhuS4b5kzAc5VMKIytVOQaYJDUaA+bxzZHblvwCK/vKErAaTbOCdpSOFdtlH4WjUVQSthOSeCxx01+HiTb2eivQwucXsVOUBbJUExyYz6wKkhaIcygjXFRhfhoOiRTW0LMEJGB3PZxdSGtgJV6MdQK/ud5cmluCLxRwEDb6WRZ/vvNuYBCY3EU9+FwIglOrGPBsBa8YV6B76fQUMyDi2skelasP/s3wZ6qNmEM4O71LO1XeC62B2MXvPTEWf/rw3+T1j4RQCAm/NxvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OuHfkcJLzvckChbDiNvEP5TnyRShCei2+6iqu+PS/w=;
 b=xL/IRElu8i0hvFsknofCh2R4RmCeF78XduF10zD6dpV+bhfW7ZhVr7TJihtQ8IJigkAO0eSSPzI+AKMmtWf57eeTo2chWv/K5WfS20vmJowYlc9OqMcfX+gugopMJ9HTpIwm3s9mj4j2KY1Cq1lrnbBWkgjzuQ68+H/q/M6VUq9lORg1U+ubK3vAu+1B2cRXM7EnvZR2imZlZG6Lc0k+WnIuS+gUgWnXUSU4gt2Yr3RvmN+OE4zu7Mzsm24i6yXFwe1IiP+my2pttITASZSPRgqS86wyIvogi50wIfcRtkHlsdvRy4H9K283+BqQ0S5DmNPuWfm89HFnPSFqnFgkpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OuHfkcJLzvckChbDiNvEP5TnyRShCei2+6iqu+PS/w=;
 b=EHZcVggrDmaXCLLaZPdNEzOUDGAY6OLqvhNw70JUkSslxyEXT4yvgCwazbQsXgeqTtTUbkI4iAEJRmcY3fPTOpSxP1SL5Zqq88hSpWGhCNJjDIpEhhqPJHht3XAcMy0KPB5pyvmXLCCydRV7U+4C+0nRaEXC9Tsfzw48HwTbeck0m8oTU6al4FBtXXQntHURceusiYwNkqVNHeUHr0BPafonD0NtmgmKEP8vFEmpD4/E3NHJLc3blEGHKParcEcjEdz9vTi2KyB73m6s8kbWLpal4hjVzETSdXacGn0zhddmclOKiY019hPJ558iVKZxH1RFP2bTPKhiXMxYzT3Ztg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 14:42:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 14:42:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 23:42:42 +0900
Message-Id: <DIV8NE4MBOCF.1DGBV11QPIDQT@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "kernel test robot"
 <lkp@intel.com>, "Danilo Krummrich" <dakr@kernel.org>,
 <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [linux-next:master 3728/9137]
 samples/rust/rust_driver_auxiliary.o: warning: objtool:
 _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <202605291041.seNEWvLQ-lkp@intel.com>
 <ahkzosbjO4NdSyD8@google.com> <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
 <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
 <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
 <DIV5H9S8ZN2L.234ZKX4RBF6BO@garyguo.net>
 <DIV6O6TSXRU9.2RAEFRRAGX4EM@nvidia.com>
 <DIV7510GLW8P.1KP88LYA360IC@garyguo.net>
In-Reply-To: <DIV7510GLW8P.1KP88LYA360IC@garyguo.net>
X-ClientProxiedBy: TY6PR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: 910c34b0-4091-41fd-c5aa-08debd908c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|13003099007|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	K34ByD0byJ9yk/BZeEPz1qvq1W9ZpXkCaygpkiF+22tqSqccaz09dNtShphQqE5hfJjUtH5x1eYqGEwOd3mMmRmTdfheiPbXjgXo2jo3LBEHwD038RojwX+qaNi3irjZyAi3vcek4EJ8j9U+l+1Z9Z0J0GiEFTALU4pqmq2trfrQr+DwPFPccwJL8yC9qqLpYIrPFhRSrU4XLKIzgBBMwcOIuk6I8fNILerHt9SsYtvg2HPbf09ZRTjZCYwEBkfBgt+CTQMTjWic4YgU83yHs5owk8SqEEXgw7s8XAoAzwkFNY/UYkJ5eV2sjKUB8gtFU0FT0sUyuYlW4HG06Dp+L4hC/E4zZj+fyo1p1ZixfKGWnxzUa80g9Km7mbzSjqk4YqYeXNIP+0R2djYwdUsdnmOjdTK+LKygyYsGnedO+rtNcNhJj/Ns83v1atNsf9ImkTQ4DofksorPJ421SvWJ3Vig257U0N2xqhlVYJYxbkGd2FjoHSQuL6uyaepeY9NELQI/cJ5mp412ukJwUESnocgdIbOUARtIq8JyeIXlTKPbrO7893LCXLLU0aKSfwdJl4NcMZXZOAhHy+RgfpLVFL3Bmn8IpFNGrVbQWuY7o8p1qJuBCvaxUdmVNxi1Rozfi04Vmfcu1yzbXIhCnTJxY5eHr4ar8lk0YIsdaLOyudf3hbqb6qXUxAXpD2k3hTpdpOLis/N7+f9NUh2iPX6Dxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(13003099007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG9VQ04xT2NuU09aTzBmQ2dpZHVHRmgyNndDNWxUcEJuWndxdGNDaUFpYVNE?=
 =?utf-8?B?ZUx3TXFEdE90MldCbnQvY2pRSmllbHFRbU5DWk9YL2s3MmFXck1CQVNpK0FE?=
 =?utf-8?B?UnRqTkkweUFzNmNRdEE4TFRoYjdMYjFPcWYyeG5nOVZEQzJLaEZGRjEweGxE?=
 =?utf-8?B?cjFLam10TStia2dNcUhxTm9nMGJGZ1R1S2JmSzU1YWdRTnFpOWdIbFpudVpi?=
 =?utf-8?B?TnRpVEtTSjhOdDQ2V0dCL1BqaE45dmRkamZwTmlYRktiMVBRcy9sR3pJSkp1?=
 =?utf-8?B?QnprYmM5WHRkV3IwQWE0T2dnWFBpd1k1RmRVUEdISGRPT1A2dEw4Qi92cjBs?=
 =?utf-8?B?aDMvK08rZm5hdHRUNGx0T0Z4blVpTXZqdk1hbElkY0I5OS9tZWhJYjd4c3pr?=
 =?utf-8?B?elZnL0tDaWx0WDM5ZnpNazR5QzdDN25ra3VzK28wSm44RzVrcjBTSzhPUVdy?=
 =?utf-8?B?LzdHT2pmb1Nsekw5eGxWMVZ4Q1RSVDV0d2lsTXNJVzNIdWIzWFhFdDBScmNk?=
 =?utf-8?B?eFJMK1ZmYUVQZ29xOXpJQzdSYmVqK3c2Y09XWFVORlY0aWlNT09rSE1peXlJ?=
 =?utf-8?B?UmthNTdrL2kxSmV5NnFWc1l2OVRaTzNNYk1CMmZoK2ZPY1JjY3Vzei9lenJE?=
 =?utf-8?B?MFhvdW9uNGpja2tPWXVWaDlqSklnSENpVG02aWlKTnR2RmI0cTgrc3YwWVNu?=
 =?utf-8?B?MVFnM1VydlhwUzJ0ZXZSTm5USXlSUEdQa3l1NGNNRFY2RmJPNEVxTjJqd1BF?=
 =?utf-8?B?ZkZjZVpKTFh2YVJ6S1czK0R1UktMaDNiKzRxL3ZxOHdQR3A0UFU2WGRtRFRJ?=
 =?utf-8?B?Nm9vN0p5bzBRVkxHczdxL1RER3N0OEd4Nk5TOVJCUXV2eUt0NEFIRjlQWlYv?=
 =?utf-8?B?Z3FnYXNwY29INXRqeEhhQzNjTWtsQ0xneWpMSXBjMC8vM3lobS8wRmtZdUli?=
 =?utf-8?B?OUpEeXc2UjRQVW1QQzlXY1NQSnFuc2JYMjM1eFBNSDk2SGpuM0JjTGo4eFQr?=
 =?utf-8?B?eERuOXlxRTFXNWtnY0haamlYdHdrRDhxN0NtZHArajExV2Jnazg1ekNxNmlr?=
 =?utf-8?B?Z2RBeHNIeGJyM25iblpJZE9WWUZpcjd5Qlc4QUtCdW1HSU5KNzJ2eW9LUDlE?=
 =?utf-8?B?eEIxY3NmWStkSWhNVWJoNVpNUkdGV2Z6V0toYklESGtuMUd2aHlFMVIwY3hj?=
 =?utf-8?B?Tzg0V0l0bCs5dGZYUHhWMDYwK1FNL2JXSVROMnQ1Z2tEZTBkQW1jVEJBT3Y0?=
 =?utf-8?B?ZVM1c0xwckVHaTJnbEVpSWNqTmNuaVNramZNa0JvR081V3p2cVo3Nm1IVkQr?=
 =?utf-8?B?V2kzWGNXN05SOW1xT0E4MXFscjZmUi9od0VPTzZJNWdINWN2cU1lMEk3Wk5v?=
 =?utf-8?B?QTViVkJ5VlNObk83a0NscjZ2N2M4YzBvUnQ3Wml1SmNPbUUwTGNRbmYySUZR?=
 =?utf-8?B?a0lNTUxHQ0hETVphZU1JODIxNzVUSE53UmZYQWdTNkJsVVI1NXdzU01aVzdQ?=
 =?utf-8?B?ZG5aalhLc0dFTzRtbUE5ZnBBVUY5NDZueHZZamhRWlhITEk2RUt5T0RtaE9B?=
 =?utf-8?B?TmhZTk9QTk1LN1V5bnlpR013ek5FZWJ6NDg1YU1ZNG5CdXBENDNROVJRVzBv?=
 =?utf-8?B?SGtRelNIOUp3cFdwMTVCTXY0SlZxMzhaRkYwMGc0QWVOUFZObS9hQ0VCTGZn?=
 =?utf-8?B?emJnYlVMQUVBRCtyN1V2TmJkZXNPVitsQ2tmaVBmRHJXWEp6RGtETmZtVkVw?=
 =?utf-8?B?Z3NYcHFDSUVhZ2tFVHVBKzVkeVVmT3I3Skk3NW90VGtzNnZGZE5nQ2NDNGts?=
 =?utf-8?B?S0dFcTlZMUpZTlIxUUx3REZoNHV3SjMwcVhxQnFTamZOeGE2WHdMZFhFY2Ur?=
 =?utf-8?B?Vk5jbnFoTy80UFF2a3FidTRodjFsOUdCZ0wxQ2RVR1VvNm5PUjFiemtKMXhr?=
 =?utf-8?B?Mkx4cUVRalQrdFpzUXdXV20wMldxRGUxanJjMWJrMkpjOGJkMUNWUzdQRkN4?=
 =?utf-8?B?NXpaUEl1QURPdFhORGQyUjI1UWxmR2FvZ0p6M1hnUStKMkFrdnJpVjhLK0VE?=
 =?utf-8?B?bnNYckxZejhtcGwwL1ZWeXN1aUJJWUJyVk9ldU9FNE0zZ1dqcDYvbGcxdmpN?=
 =?utf-8?B?NVpFS1d4cENyUHUrY3NLUWlWSWRHQW1qb05HNldvQklCdHBEZitDdTFwdW5G?=
 =?utf-8?B?Ym1OWFlJOHFhTW1RR05HUmZqbFQ0UUJKb0Q2UzB4cWVhZ3QvYnR5cmFEaFht?=
 =?utf-8?B?QWdKQ1M1eXNwVjV5RTFSY1YxVTVQeHl4YjJwczFIQXVJUXRzbis1UnQyUE8y?=
 =?utf-8?B?clhyZGpEZi84S3hQYVZkbGFtYnBycDFPS0htbkZOT1Ezbm9EV25VbVdka1cw?=
 =?utf-8?Q?2CkiRPtXP88J+u1oatqqyrfOYkkdyJI7ViBJIN9OP8c8H?=
X-MS-Exchange-AntiSpam-MessageData-1: Na7I26++tq9TsA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910c34b0-4091-41fd-c5aa-08debd908c42
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:42:46.1910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/fS6RtVzK1cAIS4M0X4aPo5waLTSRE07Z95DC1PTDaKNTuZF+dvwNA4Y2FZCajqNFmy7M53eyrAOIEop6EgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5615

On Fri May 29, 2026 at 10:31 PM JST, Gary Guo wrote:
> On Fri May 29, 2026 at 2:09 PM BST, Alexandre Courbot wrote:
>> On Fri May 29, 2026 at 9:13 PM JST, Gary Guo wrote:
>>> On Fri May 29, 2026 at 9:19 AM BST, Alexandre Courbot wrote:
>>>> On Fri May 29, 2026 at 5:00 PM JST, Alice Ryhl wrote:
>>>>> On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@n=
vidia.com> wrote:
>>>>>>
>>>>>> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
>>>>>> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
>>>>>> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linu=
x-next.git master
>>>>>> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
>>>>>> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust=
: auxiliary: add registration data to auxiliary devices
>>>>>> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0=
day-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
>>>
>>> Ah, OPTIMIZE_FOR_SIZE build, it's always this...
>>>
>>>>>> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-proj=
ect 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>>>>>> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>>>>>> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-=
ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
>>>>>> >>
>>>>>> >> If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
>>>>>> >> the same patch/commit), kindly add following tags
>>>>>> >> | Reported-by: kernel test robot <lkp@intel.com>
>>>>>> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNE=
WvLQ-lkp@intel.com/
>>>>>> >>
>>>>>> >> All warnings (new ones prefixed by >>):
>>>>>> >>
>>>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.m=
odule_ctor+0xd: call without frame pointer save/setup
>>>>>> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.m=
odule_dtor+0x1: call without frame pointer save/setup
>>>>>> >
>>>>>> > This one looks like this bug:
>>>>>> > https://github.com/rust-lang/rust/pull/156980
>>>>>>
>>>>>> Does [1] work around the problem by any chance?
>>>>>>
>>>>>> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556=
d55@nvidia.com/
>>>>>
>>>>> The asan.module_ctor error? I don't see how it would work around that=
.
>>>>
>>>> I was referring to this error on the report:
>>>>
>>>> _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRia=
bPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationD=
ataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocE=
INtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5=
ErrorINtNtB3y_10___internal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11I=
nPlaceInitB1L_E8pin_initB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3ne=
wNtNtBX_7convert10InfallibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name =
too long, can't create __pfx_ symbol
>>>>
>>>> As this patch might help shorten the symbol.
>>>
>>> https://lore.kernel.org/rust-for-linux/20260527-pin-init-sync-v1-5-e203=
35ed2501@garyguo.net/
>>> would also help a bit with this, although I'm not sure if is sufficient=
.
>>>
>>> Also, regarding your patch; do you need `#[inline(always)]` or is `#[in=
line]`
>>> sufficient? Inlining shouldn't be forced unless there's a good justific=
ation.
>>
>> If the code is not inlined, we risk a build failure - pretty similarly
>> to the link errors of `build_assert!`. I'd say that justifies using
>> `#[inline(always)]` here, but maybe we should also add a comment
>> explaining why we do so.
>
> I think for long symbol names it's a very difference argument. There're m=
any ways to
> create complex types that can lead to those. With this logic every generi=
c code
> needs to be `#[inline(always)]`, which obviously is not what we want.

I have tried to just `#[inline]` the problematic methods in [1] and at
least on my local config this results in a successful build. I can try
that for the next revision.

[1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d55@nvi=
dia.com/
