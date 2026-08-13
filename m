Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EB7196C7C
	for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 00:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786579918; cv=fail; b=k7+8Tm+Ds36tfh3vVZiI7v88ZdjZUyHpCW2bOrZ3TtC7vMPmbEqVBbbmxl1gNtUpQm82f6PTQQ0CeElGXzzrsD2xHisLbm3DDDUl81CWgt9o2vb4Cm/w2b+5+uAaC5MC9nwK5ksfn3FkeQfrCHXptO7k/1k0RzNufiA82rXwIT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786579918; c=relaxed/simple;
	bh=Bo/6JxakuUvt34h9u3R7vbrvHnb0txC97A6J4nGRek0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oEUT0Pe77J8kqdsxYXheALyFtxZdu9gccSvmKgoDlA/ToPc3MRUOEyuHrtVXga6e9rB4colCMBuN6R9MjXtmNbPY8HvXa8z9m4dSievJ9+fiZiVgVnKb0uPOgzh3jiOEBHpekpBaGVo251DyZyqe+gik8lDLDKbh06kPSA8Qb2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fgG20J2F; arc=fail smtp.client-ip=52.101.61.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fgG20J2F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLTecRBRjzYTr0v8Ttm08dcu5hgz9SzUTYYttl7Xaol5BcDwzFebgiWe2XuhPQ4E5GzmdZkv/3HhvkDtd08IJtzIRKEkN0jdwbJozK3qW12dtPomk81VEA7Lp968trXG34xoU/S324fnwGBWSLd8PnRr20R+NfYSh0Io+cHUlmV/nNPGC+xcAlj0eCQtuCB8JvcKJQuku3y17rECvak/TeDHck/mullUYStz84E4OpMk33DfEU3EJqHXz0bHmXIts2LbatEYfupN35MqsV2knwWQfMuR57Q6q5Tsh3bbLvaEqer5DLHpq38ERRTo7xGvkMhONI8vca8x+jUTLzwUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8Zmiwf+OzvEoIyI3x5by8ii0TOVxd1QIHhXJztQl50=;
 b=XDn5tQStx4OZEclYhYmktAhoD6eWxeiHB4mgiZUILCpw7h+jCwNNlR6nITkyWtRI/rV9DDlAEjwmtHjOPw+QHodNIdwK0K0DYKRp3RDW6tsFUvj3oCGSNPFu1xlf+dDjPdXdC6vmlmlVWZ0B0Flop2c8URUByjCwPqMxVMJu8chiaEHMN9KuMgfVtT5GrejwrF7ztO2Qkn5nB9yK5mS389fmRYj7mNzTcwxyBB3nA6FkYJdlIJ+KiYjdpsDDoWBk+2W9y1yJ05qrQg8SjTGHWNkHSHYM4T3BTYPpZZ84O15UUH4x91BUZFGd1OnYU70zaHG/pAixskD0Y8DhpJd99w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8Zmiwf+OzvEoIyI3x5by8ii0TOVxd1QIHhXJztQl50=;
 b=fgG20J2FVCWeU3tNwSZCEk0rHygXbdc3cKoLkdU1eL0iGCDU7mhwGOTickaJttg4Z+VirSShjCtvAiGjrhTAxaJoTMZVfzB1M4aqRBoZeTmi85OMHgG6cn85oWdbMtJC92p/KZe5a5JXKt3lL+IlElqY3Vz8/u37/FviLqwes63RkbGOpfmSITGNNj0Y5AQmynm9AAYtvvcZjBHeEu8geC46+0foYVgx7KsKpTDBP5shiu7DJ/7xh140DlxVAB8STkGO7ef+McRjYTBrUzZidgzAVZJ9ZF9Whxo1AXYn47PQugowrViDucvnMZwYTI0nkOiDKir6zQh3BVHuGear1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.13; Thu, 13 Aug 2026 00:11:49 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 00:11:49 +0000
Message-ID: <c22a898a-b185-4d75-bbb9-f8247fe63042@nvidia.com>
Date: Wed, 12 Aug 2026 17:11:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Docs: software-requirements.rst replace optional tag
 with footnotes
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
 <20260812122426.1636227-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260812122426.1636227-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: fe375857-1976-4d45-a468-08def8cf781e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3NgNPjta56hwsgeMCMZx15nrnokLrIGZlfgpGo+eXdvq0Iuep4SXZbqf9GPJQc0JzT5pNlX6wp614QX1i2pdFeCtiYdWwVcZ2i6ceq4iFsm1+nQf1viNEjaQVNlGbnAFqiRFMCze4gHYBubB9NRMenTDYG5Rr3Lj6UOl4itUlCFyh7fPyWxwBHqrPyjQYvkfysoXhI8ibaxRS4wRnbJsfWDOMJY8ChU++GqsKAqu0mi38ZjZeSOjKVncbmKqjQrzewykmXaefT1OjySvNNLvdSvrDmJzTFjtRGcjuZsIcul8YHGcgk2S3VsF4s1Wy3f5p5aqFuyzRrCMcotFX/qQNMswCyO+Mu+hLIsIMnJo5vV+hzzCyN3ZjVqppURlgNuLDnbBOLYqfqm3c2pUa/BBxos2/zy1RnDYutmTt/QfEu7VrSrlutg9X4c8uu7JGZKikcLyshGUIhxgbXNK+yPYGzK/G5M3NyfOiGBi0mVMc/mTuF4hXsn7TDRnnemtUxnj/sQ985UuFIDCbHmCZ98cRAEz4Yd03nnUuT8xVOBGohmP9Tud6MGktiwYW8C51ow+E1Wx7D3Y3ZlueXFBvh2MNM4kiHor3cSHbahP6pJ2+MgbUAH02VU/n6BbW4xyC4qJBPlrD9WxqIOKNDPdS7KPwCPMmkqtNL9l7tpmYubltWBAwNpqw2DXqI+Sohg9PTFuwKO+MVxCf6XcnggrXmjeiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW94SkdCUEFvTGpRRzRRR0U5M1V5TXMrMDN2TFp2Vytoa3J2dWxVclRVVGlH?=
 =?utf-8?B?SkZpdnFiYXBrZU1kazBNOU1UclFvQmFrUXBxUWRxWDQ1bEZwaVE5SkNqWVVH?=
 =?utf-8?B?WGdpcGVCbkdLbUx3UXcyRGpMOEphck1PMVl4Y1h5clRSUThRMjNZWjN2dzJ1?=
 =?utf-8?B?ZkhuVEs3WHNpUFJSSy9zQWRmcjFWdXNhZE1KNWo3MUhIYjJGdmtsRUhCU2dT?=
 =?utf-8?B?dUxQcFA5bWdNd0RpTEFvbXArb21nL290aVpuQ05YdmpMYlk5a3MyU0s1OW5o?=
 =?utf-8?B?WHdMdU12c3VkdVpNN1E2QXY0K3E0ejZWZUhmdWZEWmxyS1BOeTV6T003ams2?=
 =?utf-8?B?STFHa2FWbjZUcjZGM0pzSzZDbUVBMU9VSzFRcCtNc2VrdDIzRUc5L1JpUmUy?=
 =?utf-8?B?QnVaMGZ1RFByOWtpRGFBZFp0VzYwRDdwUkVicGtlVDZvSlIwdjBRWmFwdGI0?=
 =?utf-8?B?NGllNkx5SVJXcERmM1hmQ1hsZ05iZXdyd21kUzB4aGxCMXVGNHhjc1p2K0pj?=
 =?utf-8?B?bGVjQzNCRlVLVTR5dGN2dkYrK2NVT2ZRYmdCV3l4Uks5dnRLUlZucUdhR3Mv?=
 =?utf-8?B?MHJkK2liaEgwekcxQlI5dWhadW5JYlpYSllYd01nWmlBNzZtc2dLeUpCVGtx?=
 =?utf-8?B?eG14K2xaZXZWLytXbHF5WmpLTnl5Z094MUo5c1N5eXB5d3JReTJMdXp5ZkVj?=
 =?utf-8?B?VTN6cXM0Mkp1NXB0ZTliYms5OE83RS9mTGFzYTczeXdKVi9ybXdEeVR1dk02?=
 =?utf-8?B?WnVKeFZpRXVkMFFvK2Z3TStEZVhZVkFaRmNWQnN6MjB1cHQ4UkU1SDhvMG5W?=
 =?utf-8?B?NGRueW9CZ1lTRjNOMFJRMXQrSFhUZi9aMENXMmExNFJsV1VULytXRS84dUUx?=
 =?utf-8?B?TXpnNyswN25VYklZVGlYVXNRbHViVXhQaE1OdGtBakxBZ0tXcWNOSElMRFRE?=
 =?utf-8?B?d3dDYVpCMzAyMURVNTgwNkJuN0tiQlJBb1BJSEYwQUFibFF5N1FwNTZlUWpD?=
 =?utf-8?B?eFFYR1o0Sk9ZYXltYlp5SkRwN2NOY0JLTW1wTVBDTEE0blBHTE4rRDYzY05K?=
 =?utf-8?B?b3l1OGZqMWxzemhXYjE2ZTFVZWhCbmVpZ3J3ZEVXcGQ4SjBXeGYraDEzd3d5?=
 =?utf-8?B?a092UjEwZk54cmw1VGx1QU03UzZCM1F2NHMwUlZoMXZUeFpNL0kvcTZzVDRw?=
 =?utf-8?B?dE8razExNTVvU1FpaWRhWVBRQ2FpVU9ad1l6RUFxQWtJWE8wbEp1cUJKclNR?=
 =?utf-8?B?cDBzVFM2WER2VlpPZTV5VlVzeXUvUmgweTBYd0FNWUZkMTdIQkIzTCtBY1VH?=
 =?utf-8?B?TXFOL2tFL1Q0LzYrUTd0UG1UNmx3dTZ3SUNxNTJ6cGxHMDlCcEk1d3JsSXBL?=
 =?utf-8?B?NExPN1cwaFpEVEhBMzhyUkhhcGozSjFKcnN5dnlyK3pkNG1jSk1RK09QVlFo?=
 =?utf-8?B?M0JycC8yZ29sazlRU1krTzh4ZGQ1SHJIM05wU0l0azdMSWQ1bnJLZjJCbUls?=
 =?utf-8?B?a2FtdTFqV3FycGFSSVVEemNzNE5vcDlYSHZUSlNiMXR3QmJHVEVjeWxSRTVW?=
 =?utf-8?B?N1cvS3ZlL09sMlY5Z2R2bFd6OWduU1lxQVArTVUrdHdoSzNaM1p4a3NtMDMr?=
 =?utf-8?B?c1ZqbjJBemRZL2hlV1dKVmdjZU01T1dkckJCK3FYK3hEM1EremlndUcyMFpx?=
 =?utf-8?B?Y1h3R1ZmTytEaHMvRG1ZcExDMjF2Zk14OWxWSE1IN3h0QW9hTnZyYUg4UmZo?=
 =?utf-8?B?d3VFR1hlcnBDYzY1Sk0zOGMrV3dpbUU5ZGE1RmFNNldVYmRyQllyNnJNRVhz?=
 =?utf-8?B?bW9LSDdGR2EyWm1kZTJCeGRHT0htMHZvaWN6QXlZRytyUlhqWkZZek4yR3pW?=
 =?utf-8?B?dVhnaFhVSFFHTzk4K1RnTzZ4bDFEZUdyYWxocU9WUkZxSU4ydVd1ZjdlV0Jn?=
 =?utf-8?B?L3ZoaUJnMWF4ekRFZkE0bEMyOERkYzZFV21TbzJhSjVrcXUwN0pqNVRMWENT?=
 =?utf-8?B?dGxsV0ZJWko0S2ZjcUlKelVkZFcyVE1yblRUNDVhQ1N2VmhGRVkzaStuWS9j?=
 =?utf-8?B?Um9uSkdTejAvZG9QUlltbjJPZnpwTXNBUmJJL2REZFBsRDdRZFJzK0hQZGpY?=
 =?utf-8?B?bHZtOTE0YjkzTVdBTUVZWHdtcXRzbklzVUkwY2tNZTNlK0xJNE9VMEhxMUps?=
 =?utf-8?B?SWJhMng3UkpXTGVkNXErWkRkTzBJemwrSFdDM2k0NCt4STZ2Z1dNWTRNNk9n?=
 =?utf-8?B?ZnM2bDZoQ29ud1lDcEJSdTVsZzdsaW5CSlJpdkRNaGJjdDJ1N3hLMzhuYTh0?=
 =?utf-8?B?L3FsdEIxSkJRVHcrV1dXSVhFdWJCbUhLeGkvUGhTcTRqbEZyenpUQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe375857-1976-4d45-a468-08def8cf781e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 00:11:49.2226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+F84eefzk87Nl6cY2pQOdA0qjUbNC8ziopTFCdi5lqN1ZXdz9JD/PX83yGH4xOUrsolzdaa15SDfOtaXZyXng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240

On 8/12/26 5:24 AM, Manuel Ebner wrote:
...
> -.. [#f1] Sphinx is needed only to build the Kernel documentation
> +.. [#f1] bindgen is needed to generate Rust bindings
> +.. [#f2] Clang/LLVM is an alternative to GNU C (gcc)
> +.. [#f3] awk is needed with CONFIG_BUILTIN_MODULE_RANGES set
> +.. [#f4] gtags is there to generate tag files through ``make gtags``
> +.. [#f5] mkimage is used when building a Flat Image Tree (FIT)
> +.. [#f6] Rust is only required when enabled

Or maybe: 

   [#f6] Rust is only required when CONFIG_RUST=y

thanks,
-- 
John Hubbard

