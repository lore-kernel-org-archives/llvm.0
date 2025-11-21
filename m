Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462523242C0;
	Fri, 21 Nov 2025 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738876; cv=fail; b=gJmoS258XYq4OpYgElDpQXtAVvZgeCGSCHx/MnE6jEetgiM0EwkjapDVFqHCfcFr7JCXdzByiTUGRXulFPV/7RVgSJ641bfL/PebVu3Av9nl8IrxuzAodq7KGKoEowvUg9/loSN1+hT+N3F4M2BYrB3cb1zp0DA9Do44/JMx3No=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738876; c=relaxed/simple;
	bh=ASJO6AIFrxJrLXx8kxwtRqMkwdZmKb5fbhNARhcnvNg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dOMq2d4KKsjSldFAh04eSMgAI80jl/SbWAK/wYXGcABpug3w/Ir9JVxhz/G73C9GwbH16+RMFAxIYg3pqbqeO9/kKoEgZwpghgRM0I+fgwGiITeJ+OZwoM8Wy4xFWaCwTO93UQm0e9OWDJz0UC7tK4TY1H3RmY6fUZUm0NzI27o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AU7mvG5i; arc=fail smtp.client-ip=52.101.48.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AU7mvG5i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbT491Zww9WqdDI183zAD9jd4BfnOgNbMOcH61gZPR1lsvB9T0IrOkkCHBPRc07v4GPDKGFJ0in0dliScWqyZw9J34BEN+9TRjtzk8ZKT2v4oAeV9bvVkG2ijAUKyKGQQ6V7dB6VnhIhrpMlXSITswug6OmsculQ+/fQ8SW77s1wxmOlfdIuaU5um2yHehbPXc+fOyFiRZIxXmgCjMPwVBaCK+Akydw00VvzMIG/sGjQxpwVa3eka2d3x3p8IprvPeFnPezVearsYEw5vM00gYMBErhfrz9SneL8BFx45ZeXkWA4mE/scCaSTC/yiVyUp71ETfNhnTUAs1D3AhE4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0546sp+Noh16FCaBjYFJ7neIuqsDYUVqGsSJWDkMM8o=;
 b=U85QA5748Wc6kwcUAzh6VgNAEm69iCnL54Vv/TFNFuWbORkW9FFA/injOtCoLzXD3aXJeYHkgx+1lhmyQnc16QAHQVghetfi1SKLsWv7HGds17CgSgtNcFeOmAz7f/k5sT4C/OlpysUqJYaTNH8b2EIIWGLFX8AmoNpwG/issLSasoAQ9NxzVrKAN9UfgN5gkAZFQ/kHaAQai610YBubIT+bwGLSbVmmPwUlSSFu5l7/4EJpTEFx8tA1zP77S7xnQ24iV9q/egtBqEwm3okvLL3MkX8wbSkEg7otlz4puicWL/VKtzLDJebqylLQ+63TQ1pV1dgAxBj869M8eMONPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0546sp+Noh16FCaBjYFJ7neIuqsDYUVqGsSJWDkMM8o=;
 b=AU7mvG5iL2w1gEdvAkBK+Mr80qjYx03xeARkHuBI27vaEWQFKPIxSKQYVEGcms3Oq+a4uVxpa6/QjuQ8LT7BruJPDPAPjNco1HK4/5o4uEIzPRCCxhsxjSCjNcKr24Ed1wQhiNI62O09ToRmOFjM3XzTVFRwKlEesKvFxAp23GtC+MXbMNXPCEuptpeP4I3xPx4zmduiqLW380vjWRE8UZ+TznRdUD8teJIS2KPKTo1suhHEz9G2LferS7uoQamW1IibVAe/4yBfAU0b6x2mrQSXZH4GiRu6KOh0GpuN03UoA39dTGHTh5isFRxNgRGrXTMnaVwXrVs4bp5WaGDgRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9662.namprd12.prod.outlook.com (2603:10b6:8:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:27:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 15:27:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 22 Nov 2025 00:27:44 +0900
Message-Id: <DEEH8WPYR4KA.1WUYP0D5F9TYA@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Trevor Gross" <tmgross@umich.edu>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "kernel
 test robot" <lkp@intel.com>, <llvm@lists.linux.dev>,
 <oe-kbuild-all@lists.linux.dev>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <202511210055.RUsFNku1-lkp@intel.com>
 <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com> <aSAr-aA2U26lr3iI@google.com>
 <DEEEZRYSYSS0.28PPK371D100F@nvidia.com> <aSBy3HQ9Z-h2LbB8@google.com>
 <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net>
In-Reply-To: <20251121143008.2f5acc33.gary@garyguo.net>
X-ClientProxiedBy: TY4PR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:379::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9e7a82-1653-4c43-fa62-08de291286e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3JRUjlGMlNrNUhyS1NEdmZiclJabVVFNm9acTlJenFVcjBhSGlmUVh2TkhK?=
 =?utf-8?B?UlMyRCtHT1Y1UGV2V3ZBeDVYWDY2c0N6R3dOSGxBTDd4aHp1dUd2TlAwTkgw?=
 =?utf-8?B?UjM4YmJqUHV6WnVLV1U3MUJFWHJRb1g1ZlZmeU4wT0x5TkE2c0xoTGw3N3pR?=
 =?utf-8?B?L3U5bXNoa240UHdYTG50RjlEQmJJa24wMkJ1bmROQlhOQlp1TzNQUCs4d2pK?=
 =?utf-8?B?UGhwdDl3TFFBSWJCY0FadWZFSDIxZGIyZ1RhRG1ST1RlcVBKQk11YlRaSHJI?=
 =?utf-8?B?a1lDcGNBNzQ1WHBhRlp6aVVRRFhpc2VoenQ3T1B3YmFGZHQ0amdwK0dnSWtX?=
 =?utf-8?B?YXI3R05xdFkzU2tLUDYwSkxkS1ZLWlA2M3lCcG5QUlIxRTBiRVhMNlUyL2ll?=
 =?utf-8?B?YytQbFpZM3ZlRmh0VXV0RnRQZ0FMaTBram1QRC9zc3JaUkxzL1BCQkxtcytF?=
 =?utf-8?B?YmwxWXV6ajRXdWJmRFNSUzhyUVBwdkhBMG4yemNIa3hTYjMzVlhUVXJJa242?=
 =?utf-8?B?VURuSXdqUkxJTjhvbWtzQWVUODZDV1dJbStRcEVEcFhyTzRwL3RjMG9NaThJ?=
 =?utf-8?B?bzRqWk9jTEd3alhLRWZLZ3pnRUk5TlhVNmJVT0JjM2FiWm9OU2laYlQxUjZH?=
 =?utf-8?B?ZnNpLzM4U2ZHZW9TaXVDR0ZtYzc1VUFSdXJaaUNQOEdibkhMZFNLNjRDZHky?=
 =?utf-8?B?cWkxc0t2WmRtMENiK0RJVTZGbWxvQ0lHczhGKzZZZ1VsY0R0MHJEeFYrZms4?=
 =?utf-8?B?U29tTHNBOStDSnZwUkRjc3l5WjJoR2tmNW1PREljL1loRFVnZVVJd054Y0Z2?=
 =?utf-8?B?b09OOHYvVjVNMWZVNDVueGw5RDdpU21JdDVscS9VS1pTOFovQkI4K0ZTMEl5?=
 =?utf-8?B?REg5Zmx0YU50NUg4cjczVWRpWElKbzBQc2tuZ1VsRDlpMHllWElNcUN1LzZB?=
 =?utf-8?B?Unl5ams5a214QUZXYjFkVG14RGQxN0ZvdGl1c0VtYWlhZDJwbnNoRCtCc1Y5?=
 =?utf-8?B?Q1prakhVZ2xSQXVVMzVSbXVJYmpCVTVVcG9yQ3ZydHlsTTRrWHc5RTBRNTh1?=
 =?utf-8?B?Wm96emFBeFJoU0EvZU9Fa1ZSdzlzZFpmVUc3c1h1RGxLVC9sNkFEbWhEUzlE?=
 =?utf-8?B?emdiejBDK1UwbncyWlpZRloxaTJrL1l5SzczemZVYmphbzlhRmJMWUhKV1c4?=
 =?utf-8?B?OGM2Y0g1b2U0QUsycFU5M0xvckFQUkRSc0RSV1J0K2ZzWU01M0FzOXNMbmdw?=
 =?utf-8?B?YnUxZUIrSDZNUEJpaklhalBrekZoY2JxVE5GaWxxMkpPSXpjVDFQS204YzJJ?=
 =?utf-8?B?emhKbm9zS25kamJiVFhTS210b1g4Q09HRWFIL2c0R2ZQVnlDdDV2Rm9aaVU1?=
 =?utf-8?B?SVZONTQ1SFZmVHNMeFZDTERycHFGcHliMXVkcmZ2Y1RtVDhZSEhEMFUwYUdG?=
 =?utf-8?B?NWVnbTBlaXdNWXF0YWd1ZU45NUtqYXhNRW9WV1VPc0N2cFQvMjFha1l1Ymxi?=
 =?utf-8?B?ZzdodW52V0Ruckl1SU10bldwYTlCOTgwQ3YrN29obmVJNWNZdXA5cHVTQ29T?=
 =?utf-8?B?OXR4SkhrZjdmL3l5UnpMbDNjQ0ZnS0N4ZzMyR3NJekkwZHIvNGtTQTZvZ2pL?=
 =?utf-8?B?QmVxeWNpRmhOcnVORHkzSjJOSnNDWTlyKzB1TVhkZ3VWN0I3TTFBSlNSNVJS?=
 =?utf-8?B?WXJhRVRJNzlYNnhSUDdvQnVCWG5JOENCVXVKZDVpTnE5K2lzRmZ0bjlvTExK?=
 =?utf-8?B?TFNQY2tmRHQvQ2xQZUJXcU5CV1M1ajJ1a0FBMUx5aHlweGRtNy94WmI1SFc5?=
 =?utf-8?B?VWJ2OW1mS0ppR0VnZ2pxbWJDUW5oZThIQzlDVEZ2Ullkd0tHVXkxZkdJQ3p1?=
 =?utf-8?B?dWp1aXVYSEQ1MHRoVkRSU1pTcjkxaXR4R1NrR3g0eWlzdDJ5OWdkNkpRc2l2?=
 =?utf-8?Q?b9zWKsyAA9F2K01WA4KJnjVCVJpi87qV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akNIWUNYUXFoSEx4L1JTQlJ4L2p1dXJra2VQNzVxVS9xQVJtbGRrRC9NUWZt?=
 =?utf-8?B?U0p1eE1FYWxZeVVsRm1YYmV3SVBNQzFNVVkxYXlTQ3NjeFZ2UXhETWpFOGZQ?=
 =?utf-8?B?QVk0ekpra0NxUy94KzQ4eThJY2YwMHdCSEFRS0cwWDE0MU5Vd2Z3TjAyUnhQ?=
 =?utf-8?B?cUF4NFJZT3grRGUrUlRaeE54Vk9UM3ByRUEyRFlJaHpDZ1lJZEdnTkMvcDFq?=
 =?utf-8?B?SThTblhpMHQ3bmRneUtTbktJMEVScnZTa0tJaGF2OTFJSWZyZHIxcWFJMlBU?=
 =?utf-8?B?RW1lU0JtWkU1UmlmMXBnY2c1c3ZZaDh2VVNIYmhFNEJTWmFuU2JackNrZHZa?=
 =?utf-8?B?OWJxR0RKUHkrNENsUVEzdGduL2NVeFJEcGZDRG9zalZUdTVjYUlodERWN1NX?=
 =?utf-8?B?Vk40QUpHbDNqb2FDN3IzWnVUdExWOWY4Q1lkOTBpRzA0N291amd0SDZObkRm?=
 =?utf-8?B?NGlBVEpjYkpxNTNiWEhUNzdxWXlvbjVXSzB3NmpKQm04eGlLRWJkb08zdDc2?=
 =?utf-8?B?aW5tejlkaVhqYk1vbVd0NWU2TkNMVWFjaDB3RGR1ZDV3VXVkckxRbmFkN00v?=
 =?utf-8?B?aEZiR2Zuak1JT1ZUbFYvb3FCSklEUlVPd2FEbVlMWU9rOFB3YVJsUzNPdzFj?=
 =?utf-8?B?dlVFVmNEdjlmdzNuMzZYM1hielYwTkFpQjdzZTdPNjJMaVIvcW1FVWtXOEJa?=
 =?utf-8?B?Z0hzbDMwcHdlUjJHbmlMN2FHUDI0SnRlV0F6Ym14aFNSdFczWHM4RExidWZl?=
 =?utf-8?B?ZFhzZ1lqR1YrNzljdjJ2eWRIL1djTUZxQXl0T0V0bkptYnVtamVxSzB1MnIw?=
 =?utf-8?B?MmRjb0xGNU1kdGJGQXFVbEdjNm40TW9yc01nc0M0S0RVMCtFR2tFQjZCblZr?=
 =?utf-8?B?R3VvNFkvYXhZbGtVL2hOVjFnakdCOFh0RTJ3NVpyNk1qMUlqTWoxQTEyMWZO?=
 =?utf-8?B?Y3RPV1RablVteEdhNENXR3NXaHp5QjBPbHN6VXBOVThHMGxVdW5tTDQ2RDEw?=
 =?utf-8?B?SlYrbTIxU25rUjJ4QjdybU9uYzZBVW5BM0c1RWM5YTN3UWhGL2VIMS9ab2Iy?=
 =?utf-8?B?Z0w4RTRYRWNrc3pzd0x4T0pEZ0YvdnQxRTh3dkVISVViR2MyR1A0S1RVYmti?=
 =?utf-8?B?a3hPdDNzeDMxVnBZTmhXSXBHSjFiME9UZXlUZ21xdEtiaUpZUGxZc3plWnRR?=
 =?utf-8?B?SXpxRm1MWG9NeWl2SkdPNnpCYXlaRlJ5Sk5tSExQdHlaQ2t2REZKTGtCaFFp?=
 =?utf-8?B?aDIrdjZMUVhTUzI1YndLRGZaUFY5RjhxQjB0b2k3MWJ1WENzN2UvbmtVNlRE?=
 =?utf-8?B?VEMwbjZqczZBVVdTaFVwUitlM3lJTXN5STd6NUdhbnJJeElWR3pVeDU0Z2Ri?=
 =?utf-8?B?OGlvMlQwRkNFblN1S0VoQmF2QXhSWnJldHRkVU1lMnp1TDJOcThsQ0M0cnlx?=
 =?utf-8?B?QXF0U0dFRmNPbEtKUU4wU0gxdmY4dzNDdVZSbmRleCtEV1k1NmRqVk5GRmlJ?=
 =?utf-8?B?MkhHcnN1SEpQbm9mUUtSS1dnN1J5THRoSzQrYXBBdXBFMDdjZ1Fwb0lqbXRo?=
 =?utf-8?B?VS9Id1lkRXFhYmZ5NjlLT2YvSkdNdzU2ZmE1ZitBZUIxSUQvY1hsdW0zZ0tV?=
 =?utf-8?B?Zll4clhvSkZvQnRjWTUyQjE3Mmhjb3ZJRlhVNFlyU0RRaXVON1dyNEZVL2dQ?=
 =?utf-8?B?ekUvdzBUSDlQdWpJdFpramw4a1dmajNUbHBqMDRXMW5tVENNajA3SEkyRXNR?=
 =?utf-8?B?QW9NRTlMd0hsRXdUeE53SDJMc1hJSTV1RFVKN3dJdCtOVTlzQ0JpeFdJOUk3?=
 =?utf-8?B?SnZDdkxBN0VxeTlYVG1qUmQ5Y0krSElHZndFUllZV2RQZ1p6QXNtMGRHR0xS?=
 =?utf-8?B?UkIxSEhPcmdGQndTL3hSOTJsQlZSd0dMaEZPTnFJSkpwc3RtM1JEWUs4U3VW?=
 =?utf-8?B?V25jTEVTMFlhbTNsLzZ6Y3hmWmFieTVOTjluc1hrRHpkbEhZN2s1V1V5OUth?=
 =?utf-8?B?YU9OQXhxcEtmVyt5S1ZjL0xtZll1S0tOaE1kaERodk8xNGhvc29Hdm9zSXYx?=
 =?utf-8?B?eTVPQmg5M2JpYXJMRUZZTlNObkNBWWJtdWdiNWRRZmtTVmJWNGVRY0ZpZ1dl?=
 =?utf-8?B?WjRtS1hvS2s5ZnA4QU8yTUpJS0lyK0s5ZnVLQmhiaksxK1BlZUFqVVZLVG1F?=
 =?utf-8?Q?QgdaqjB10oXtd3cl2RcvxcQSR6eLNnn0zSyOr2Q9B8O0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9e7a82-1653-4c43-fa62-08de291286e1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:27:48.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHgtUlDEORX6wv+6iRQbqjO9nY8kFwSEkr3cvoZ2y7mx9d3VvPOC4+NT24x0MjlSFyynda0B9y+xLb+JQpjmjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9662

On Fri Nov 21, 2025 at 11:30 PM JST, Gary Guo wrote:
> On Fri, 21 Nov 2025 15:21:45 +0100
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>
>> On Fri, Nov 21, 2025 at 3:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
>> >
>> > This kind of thing is why I keep saying build_error() is too fragile t=
o
>> > be used at all. =20
>
> The case here I think is a perfectly fine use case of `build_error` as
> it's completely by-value and does involve references. If compiler can't
> figure out, it's either a compiler bug or a source bug.
>
>> Adding `unsafe` blocks for things that should be able to be statically
>> known isn't great.
>>=20
>> `build_assert!` is just too useful, so it is best to try to understand
>> what can be done, or find an equivalent solution. Gary et al. may have
>> some input here.
>
> I'd argue that these build issues actually helps us catch missed
> optimisations opportunities :)
>
> For this particular issue, I noticed that none of the functions
> involved here (`from_expr` and `fits_within`) are marked as `#[inline]`.
> I suspect after marking them as inline this case should be resolved.

The failing config features this setting:

    CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy

I don't know whether this "CC" setting also affects Rust, but assuming
it does, we can very well imagine that at least one of
`from_expr`/`fits_within` does not get inlined, causing the compiler to
not be able to satisfy the `build_assert`.

If that's true, then this is an oversight of mine rather than a
fundamental problem, and could affect all architectures. I'll try to
reproduce the issue locally to test this theory.
