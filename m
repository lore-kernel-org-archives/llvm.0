Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.121
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792501967;
	b=HvmgSRbsfCKGp/LYP/MFMvYD/TaxbF7ogtwOB9MgyGK5z4H5myrM3/tP41CXEW89D9pb
	 9XIy1+9+htagL6e+cY2x4lX1xOu4jh34PGuwDYFhWvnxB73X8qIhcl997lwCDQFgZOJTD
	 VjmQYDSkxsu9Bu40/1VX/lG+NbGYUhDiJlQWP8s4i1qaYePpmYKHjFy8+B8qeD2DBFt+Q
	 PvPdM06u7P1qDInTaJYslizofXT2aWuBnXUWE4bc0kyBQZUfdJdOtsevqTnrjD9ZLXx56
	 KPsvnXFTLy3hKQE2DMqShAwrS0oPAx6wtub0dYnbPYEK/oGkeFmf32ZEcAJu4NhbGLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501967;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=i65EpPEjINB/w0Pga3qYp1N+9qsiYa6wzbVYpUOOjHs=;
	b=iSmvN3/xL+cLCLeIuQ3MjJTzdgoVjCngmpruMVQT6BHPs6SoXjjiI3K5SOW5C8qHZuem
	 SOhjJqPXetul/VV0gy9j1BPzU6lqtJiXEZzMDaLlUSZ4KOn4gDxtHk3M8nmNMVzJRhHqT
	 aXsjRB/fmpCP0JnBg4xIpwwIeZmKTGX5D2s03Q3lr0Eaxh4Fb/uGj89vYvK5tQ0kkouM7
	 cLPIrIGtOW5c8dpmBTmLtT0WTU35Zr8EhYG7NI5Lp/0W9Ga4Guu6EBD81/oab5ERAGi10
	 Rp83ElHHlxSY2rFYsL+HbzIhTgRG99YZdOiWXf+yf8v5ZayPjbgrvXVuK2klVN20aiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=rqFKbAIb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.101.121
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022121.outbound.protection.outlook.com [52.101.101.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69084606A319
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 13:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69084606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=rqFKbAIb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfeWrGk5v69PRVOHV/Ae0RXKhlkrTDKmBxgqyGNjx9QfO+6wf7C/H9sPSm8R8p2GX70wmihc13AnV1apUTvrXS9ZhR5lSyaOSAYuP0ZL6FYOPUZvdv5DKhBzvVd22jrJFMsOg2kzluBRxXEyEFrrSQDDsB57jSRYsVSazf/8nyfz00yMb4FhlzN9OIcca476F0X0GNbasI8jWDnjiEUkwdEHuJTsu06YioR0JDvgqD+zW2JPFKm348btlgzyDWy0NRusp5FGhliVcbhnSCk/k8fuIs8d0UTFpnFpVwoZ4BOFJtfbPXwpONluMdzA+z1ZQXxO+QJiXtYnO1Z0jGdDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i65EpPEjINB/w0Pga3qYp1N+9qsiYa6wzbVYpUOOjHs=;
 b=UvId8zOmUzy4iS57rDU/YLXOtzj3URmjTYHWoX27Rl2npisfQgexh6LgOV5H0zA+aJmDtbd9XJoOBLcVHAkMYdZY7bkw1qW4cX77/Kz7NLlr1/IRvG2C995UplBgwLklko8Kb0fe38nUSUfSXQbn7qrbpvayqw/T1qG2kQL7tIU4BPQOss2JlUcFMl88HgeXrjDhqJxmbHpa//jWMJCgb3ER3RCpG2MZfXiiuRzfUpVOx/GV/VIGi4Q/oMIpAQW3CA4+07bwmGASSnhkTS/ZHBXLkpXdk20Th03Kve5tZyMWIpVQiUdOge5Pj+9hBel/nyEXfI/0/I/i24gYEHGamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i65EpPEjINB/w0Pga3qYp1N+9qsiYa6wzbVYpUOOjHs=;
 b=rqFKbAIb75ml6vttNxETGQ0NvcqsHVRXSrdD0vOZ/0vs8D6ejDX1BbiW9ogZfFpeLrkRHb9VjlmrOU2vmaVikBVQjm90onrR37QqqK5+SuVF/4voNXE6HQYpyqcSGpEnLB019hd61Nechm4DZyHLaGq9UimYBtYZSPoQoHOI+o4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6830.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.20; Tue, 20 Oct
 2026 13:12:42 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 13:12:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 14:12:41 +0100
Message-Id: <DM9OWX055OGW.V0IQRYW38QX7@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <rust-for-linux@vger.kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>
Subject: Re: [PATCH v3 1/2] rust: std_vendor: add `likely()`, `unlikely()`
 and `cold_path()`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261016162446.121509-1-ojeda@kernel.org>
In-Reply-To: <20261016162446.121509-1-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0452.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5c620a-2455-4b72-8558-08df2eabd2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10070799003|261009223027099003|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M4imvoLBuzRVA+A4W8jHk1KaxvX0/142aJ89imt8qbrMWf/S4AgljapnQ2TPMkNHVTO/ua1iMlBgVkGpJtC/g/VpO5VZkCRhVqhAFYcIwa0iOn3bpyjjoxI+RH/wnZMPfLSmEBacMQrlZr/Aohhyqbm6Ly5Kd8A84wpGvlShqlRBzAsdIdMy9vTKfd5USuzTg149AzfjIWTW7Tc22o/yy7EOABRaVl1bWRNYDF6wRfPtcUHc/UP76d/E6JLyUtYAlF9iIbMyWPg+TUbcLRUZxguFX+Fjq/hSn6zFgcnuz0md8HzWdDXSJNdAT4BdXB1rxzkGxZkq3C2HvXRLzsnCiZi2w/AnV+l/gnhETtVFMRwlz0jzEORH+CLiWybNkZbFXiF1kuPtMcjmlsUcpcG3SB//Yy3rtxXDd35kz+l3lEsElDf/sTxJVa+dYIduHZbIfOezwXKRnGiQaxQHg6D6MIv4C4w+4isorqqcORdfDKfv6+LLkXgn/jBsQRg/HLAy3Cvqdq8GNs/zzDLM/TBQqQq6/0YtCcGKP7Gq0ozdsKmpkyTlbmr8ZGvTvhkaUCi1TrmRRFRA90WSxGtqaNr574zVD/OSVneuhprcRGKxSU5Um6HhPi/AjISNTmSJRPLc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10070799003)(261009223027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGY0VzhHNUR3NkhsaXhHMEkwd2Z0aW1MMEtKakRpWlp3M0FtMkRxMnpBNUFH?=
 =?utf-8?B?QUFBRmY3QnJHVlVPWmQ1WmlNV3ljZDlCN0VOU2hLcVhzUDhsbTdET0NUMDNz?=
 =?utf-8?B?dW9ST3pMODBQWnZBVEd3Z0pncXNhYnlDYVdZeFFhYjhaa3kvTm5JYlRjRXBS?=
 =?utf-8?B?aUU2dE5zdTA1ZkFFcEVNRjNQUDNJOFphWVhLRmo3d0NrWWU3d0hqR0dLcXlq?=
 =?utf-8?B?enhHZDJPOXYzN1ZNb0JQM3ZFRDhIeHJuUVIvR3MvbzhuZkhQeHRGbEs5L1Nt?=
 =?utf-8?B?U1dtUTVtSDJJQWtoekx2OWY4NkRnTGdJaS9QZS9LL1QwRkhQU3hWVUNERmZW?=
 =?utf-8?B?azgzYkRhOXYvQjBITFhiZDNoaU15WGlvbDRrUVcvRzdsakF3UnIrNisvRXJR?=
 =?utf-8?B?QXJzTm5nZytsME9GMkFLODhCYnZYZ3hpd0JPMWJ3ZGpMV2tZeENBWFJEUW8w?=
 =?utf-8?B?WUxBcTBZVGpNYkZ6bmJjbm9UM3QrQTVPaUZVYkp1ME9WUldkSi84WmplRVJK?=
 =?utf-8?B?b3BPV1cwemJtc0sxeE1EaDMwWFBxT2ZndW5LNUphWFlob2hISG9kZU9lKzZG?=
 =?utf-8?B?RWhrR2RGamI4VkdUdkpXRDdOSm4yUE90c2E3T2l5QnZJRnNjWU9sdlQvMmEy?=
 =?utf-8?B?YkRRRm8vR3g5LzVjOEdUWk5NWGxKYkVPbkVmaXJPUSt2QVdiN3ZFUEpKMU5D?=
 =?utf-8?B?aXlldTBYK0dYd0RRQk9lNlc1dk5Xb1ZiUGg4UGlhQ09sbkdxeEY3VEdna3k1?=
 =?utf-8?B?eFhIOWdMTkVYUzNmV0p6ZDFwT25GUG5iMEFYenVZSHRlKzFpeFA0WFB1Rms2?=
 =?utf-8?B?bU04emZ3QmhmRTBrMzR0QzgzaU1Ldm0zdjBRbnVrQVNseDBEdEQva2YrNkty?=
 =?utf-8?B?dFhlaE5KUW5wK2JqU3ZsRS9talFxUmw3Uit1c0JnOFZSemxzNlREU2xIeWsw?=
 =?utf-8?B?anlURDdRQ0kxQUpvM0U3QXNuNDYvZW9nU0ttOW5TcHVSY0tBSkxLWmpWN0Zv?=
 =?utf-8?B?T3h2RHZwRnVla1NKbGRyV1hQdHlXVEFtNDFEaUNGNkswTHpQQ0lFZXZPMTdR?=
 =?utf-8?B?cFY1eE4weGx4MFo5NTJnaUlnaGZ1c3hyTnZEbGI0cGJzcXJCeENyRk9IbEtQ?=
 =?utf-8?B?bDlKT0Z6TTRkT3pocDBXZUxSTGxSY2lnbVpQUm4zUVdWZWNXdWhYcG5mOVNS?=
 =?utf-8?B?dkdQSHRaRmVvN3JZaldZV0xLemJPYUszVzdMcDlyUU9rdjZpRnJKMllMU0lD?=
 =?utf-8?B?N0JuMDQvbm1yL0NOWFRRSkV1UjhiU0h3K2gzLzB0TkdRNmc0Z3I0Z0Z5Zjhq?=
 =?utf-8?B?NElncENVZzBxekczbkNSYkcrZmk0WGdEYUdMWG5RckMxTmswbjZFOTQxMGZM?=
 =?utf-8?B?cHVSRS9oKzQzSzFGS0Fta1AwT3lCMmg1dWZPQTRIVmFsSDcrakcycVJweCtv?=
 =?utf-8?B?ZHk1anF5UC9waWR6VVMrelBIalFsTkU3QmVVaENqdHpZVG5HZVFBMU0yVGxn?=
 =?utf-8?B?K2F5OW91MmI5Zk5RL05Wb0VqaS9UakF0cEMzUjN5TldOdy9XeVhNRWIvbTZG?=
 =?utf-8?B?OVE0c2l5cjhRN2xxK2Uva1J5R2tLRTZwZERIVUxhbkxpb1dIUWw3bFJjUFoy?=
 =?utf-8?B?ZVJoSmdFeHBja1lkMDZpQ3BkVXFNSXArY00zVE9EMklseElmR2FpalVQUmhC?=
 =?utf-8?B?aW9QekVJK3ZBamNiN29vNGhZVUt2dFRjRXlJVW00MzA3WmR3M2ZIQ0dSdXRI?=
 =?utf-8?B?TFo2SnJQUm8zcE44NGM3dWRFSldvNG1lQkhBSitldGlqeUU4bUF5VUpOQzNE?=
 =?utf-8?B?dGhGNXhxRWNSUndyY2ZoWmdrcjYyNjM0cEV6VCs2MmIrU0VkanlmTzVSeWt2?=
 =?utf-8?B?L1U5czNzOWYrVksvMy9aR3BnY2t2bm9Lakh0dnFGOWFwcXVhclRPbG1DSURF?=
 =?utf-8?B?UHU3KzJhTlpYSkw2TFpGcTNmT2tmMkVCRndWSnJJQVVqU1FoT3VOcERRVjVR?=
 =?utf-8?B?aGxhSnVHenNVWHkxaHEzUnl2dFA3SDY4ZTVpekhyN1Q0Y2YxTXV6K2M0WlRV?=
 =?utf-8?B?Um1VZG5qRUJxbmFObCtLOE40NHN6OG0ybzZZUVRJd1ZMc2JxRnJ2UjNwd2Q5?=
 =?utf-8?B?Z1NqemNFalNheHEyVFREOERaU1pzOXRBMDRjcVQ4NDR4N3I4THcyakNnZ1Rw?=
 =?utf-8?B?VDB2RnBkUDFLUXhVeng3aXVRS0Fpa0JCL1I2L1piYlpMeTBaQWEwcmttZlkv?=
 =?utf-8?B?SkZMRkY5M3VLMFVxeFJXLzkvcFczUi9YQWV5SVJmV3IzWmN1aERPZmpRLzdC?=
 =?utf-8?B?SnMyclRhV1FFZW1zQmR5cUhTelg5UkV2cnR1VWROeG1UOGlkc1hidz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5c620a-2455-4b72-8558-08df2eabd2ab
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:12:42.0134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR9AMaPPl7/7TUbQueFHs0F9Dsgmsx8O7AZBjpt8//9HoJatxjQUsfTE3OxyaL1HTxqud33EiXaj0bY1Qy8a5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6830

On Fri Oct 16, 2026 at 5:24 PM BST, Miguel Ojeda wrote:
> `{un,}likely()` are commonly used macros on the C side -- there are
> more than 25k occurrences in the tree. Rust is likely going to provide
> functions (not macros) for the same purpose: `core::hint::{un,}likely()`.
> Currently they are unstable under `feature(likely_unlikely)` [1].
>=20
> For instance, given:
>=20
>     fn f1(a: i32) -> i32 {
>         if a < 0 {
>             return 123;
>         }
>=20
>         42
>     }
>=20
>     fn f2(a: i32) -> i32 {
>         if likely(a < 0) {
>             return 124;
>         }
>=20
>         42
>     }
>=20
>     fn f3(a: i32) -> i32 {
>         if unlikely(a < 0) {
>             return 125;
>         }
>=20
>         42
>     }
>=20
> LLVM emits code equivalent to the one it would for similar C functions:
>=20
>     f1:
>             test   %edi,%edi
>             mov    $0x7b,%ecx
>             mov    $0x2a,%eax
>             cmovs  %ecx,%eax
>             ret
>=20
>     f2:
>             mov    $0x7c,%eax
>             test   %edi,%edi
>         /-- jns    <f2+0xa>
>         |   ret
>         \-> mov    $0x2a,%eax
>             ret
>=20
>     f3:
>             mov    $0x2a,%eax
>             test   %edi,%edi
>         /-- js     <f3+0xa>
>         |   ret
>         \-> mov    $0x7d,%eax
>             ret
>=20
> Thus vendor (essentially) the `core` library code to provide the same
> API (so that we may use `core`'s directly in the future).
>=20
> We do so by implementing `{un,}likely()` like `core`'s `intrinsics` do
> (to save a layer) and based on calling our own `cold_path()` instead of
> using `core`'s (which is stable since 1.95.0 [2][3]).
>=20
> It turns out that simply using `#[cold]` to emulate `cold_path()`,
> suggested by Gary [4], works in the cases I tested across all supported
> versions so far, so we can avoid the complexity of having one more Kconfi=
g
> and conditionally enabling the feature in callers (since `cold_path()`
> was added in Rust 1.86.0 [5]).
>=20
> We could optionally call `cold_path()` for Rust >=3D 1.86.0 within our ow=
n
> `cold_path()`, but it seems that it is not needed, and anyway since Rust
> 1.98.0 `cold_path()` is itself `#[cold]` so that it works even if the
> MIR inliner can't inline it [6].
>=20
> Even if we find that it is not optimal in some cases, it can be improved,
> and meanwhile we will have the means to annotate these cases already.
>=20
> Apart from that, the only differences with `core`'s version are the
> usual changes (`pr_*!` calls and their `\n`, imports, attributes, lint
> cleanup), plus a fix for a polarity typo (I sent a fix upstream [7])
> and removal of unneeded code documentation.
>=20
> In addition, add them to the prelude (inlined, so that the documentation
> is rendered at least there, until we can use `core`'s).
>=20
> Link: https://github.com/rust-lang/rust/issues/151619 [1]
> Link: https://github.com/rust-lang/rust/issues/136873 [2]
> Link: https://github.com/rust-lang/rust/pull/151576 [3]
> Link: https://lore.kernel.org/rust-for-linux/DGA6GUR58QJ7.1XZZ0P4VZNW86@g=
aryguo.net/ [4]
> Link: https://github.com/rust-lang/rust/pull/133695 [5]
> Link: https://github.com/rust-lang/rust/pull/156863 [6]
> Link: https://github.com/rust-lang/rust/pull/164374 [7]
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> v3: I used Gary's `#[cold]` suggestion, and thus removed the Kconfig.
> I rebased and made sure the code is up to date with `core`, tested a
> bunch of things, compared again with C and the assembly generated, found
> a strange behavior on Clang I will report separately, a polarity typo in
> `core` (fixed here) and inlined the docs in the prelude to get it
> rendered somewhere until we bump the MSRV. I think the potential issue
> I found in v2's discussion may have been with `-Os`, but it happens the
> same way with `core`'s, so it does not matter.
>=20
> Alice, Gary: I removed your Reviewed-by's just in case. It is pretty
> similar to last time, but the commit message is reworded, and the commit
> is simpler.
>=20
>  rust/kernel/prelude.rs    |   7 ++
>  rust/kernel/std_vendor.rs | 136 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 143 insertions(+)

