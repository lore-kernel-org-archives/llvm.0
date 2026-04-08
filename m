Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021072.outbound.protection.outlook.com [52.101.95.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC16C3BB9F3
	for <llvm@lists.linux.dev>; Wed,  8 Apr 2026 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649308; cv=fail; b=ERKIOXDSWx5a9ufxeD+gDOxxpEBmwT926CkCFzbXNiHf3EmKpYQ30GR6dRMRJLKfo9ZCp1R43O32kCQoia0bphZL/SiIVwnVtmrEtAXImZ41ZCAyn0xESt6uqiQ9ag8vV+Nb02LCRGAme1MeJH+ISj9fTyQsjyvf8KF4jtdPPlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649308; c=relaxed/simple;
	bh=XkuC6VBZmMSnNgNO4LlEkDe59IwKAVBnUdnJluLSFtQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HgI1g7i6DcyGlL0hdkFuO1LOwhR93hIUGZ9pZG7H5UEdVYZmKvx3ECXnELaeUTO8fCN73dVZCfdl75lv4R/VTSL4LUPoIoN5ZiLrks2s2bWZwu1PWV0l6scuprhzgehjXkQc6nRBZU0I2LMA3V4RVnwl10mFRVm4wawau1VAODk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cUYeWGjg; arc=fail smtp.client-ip=52.101.95.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cUYeWGjg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rLmTaUsi/cdhj+oZH8br6dK87wd6YG9G4USIhg4HFbydmG28XFSlNWdZ+580uN+m5UaZM+95iVgVmdBnsSe1QDtY/5R6wdR8f5OK90MW7htOfF8CcXna5m70q/7iNWUBkC7NRzK4PvHc4qK4UyPOWlw3838xwgav3Zmfmnvq/3v4mdcPssrEdy9wFs5jYcY0uOUV4ZjR4+YrFGL32fLuQpRFSQu5vCULDiMdmsSS6VnvUWsW1KM/pPNLKQl27KkGJc4cq6/Ftq7v9dhrGJZo8TC/Hg9495HP72jab3At7z3SjLigSYqV8J0wkEUW2AsaV7fcpR0TyTXwl666FLkK4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OTpNQMSyOyDmvMfiTdkVHanc1DZFMeTK0ThdeWMMg4=;
 b=IrfgbHc49r/u3Ht8NFzNfDJdL/AY9yJl4jj3xWknzUG4MtT9UtZ57JY+mvH/H59U5Ge0z0IRZ8tL+/3CBZ/TusoldevyMY+EfvNRN7qVKklfREFMR8ps1SUc2PJsnvxruQARYbS68JIEy+y9SlsUNK1g9R0AiBHCtWiC+w/CbcXGrzq+N2fFf2s9CsUr3wy4gycplLRVRvFHaq2epqliLpaGrgIR7juH8LeyYxcCgU8nOqwmyKnXvGVWWZjaDIThOffmHlnJ3l60xjH9n2vmU3wCCjj5g+TB1XvIce1xKYkz26kL/1l7WNiwfzXZGemLNnGja79hTN6RP5xmSXXt1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OTpNQMSyOyDmvMfiTdkVHanc1DZFMeTK0ThdeWMMg4=;
 b=cUYeWGjgXWjNKPz54N90tcOx/9zAycBxHChIvV/UWKzV2Itey2abraSaPNHTmPvhDv8LgRQMkSKOy0kfCoCnbigHpzTDee3Af5IQbQPNxn55j/i9O3aq4Z6I+nwV9IIsL6exXYO+yCgNUntX1WUJKaAdxWh6PiMfmreSlWt0Mn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5071.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:281::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.41; Wed, 8 Apr
 2026 11:55:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 11:55:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 12:55:01 +0100
Message-Id: <DHNR584V20Y7.3QTEI74LPKU0Z@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <kasan-dev@googlegroups.com>,
 <rust-for-linux@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: Re: [PATCH v3 0/2] rust: add support for Software Tag-Based KASAN
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Andrey Ryabinin"
 <ryabinin.a.a@gmail.com>, "Alexander Potapenko" <glider@google.com>,
 "Andrey Konovalov" <andreyknvl@gmail.com>, "Dmitry Vyukov"
 <dvyukov@google.com>, "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Miguel Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
X-ClientProxiedBy: LO2P265CA0406.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::34) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ae9fc0-71a9-4fae-128d-08de9565aaed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	cKaCV3XGMo3kFXdN//slFnhxV1UrXmZnyEwpR6eeQCWitX5Bc47Fb+BBnbsYsuKADAkkD4FVgLJE8J1SNLiAbqWlSlepRti+9ah/F/M/VTUnuGgpApTNqCh3PaFsQTQKKxcNgmWqS5x6s27c7iJqX7nt3ioQCLs5Oo9aEDYSXcfcRNu/69kFvXpWkKlaLLYCEfD9vUWW4SCbS7/0R9928DoHNJdulxWESWsSKSuKkWFzj9uSAPtwSu0N8NZS907ICDgxePCSGSrqyElmTV93PXPJAcfz7rvFWstYRKOaFFXec/y9XNFRTSeHl1YLXjXSjDsJVB8YKA8/mQHrq8euRkYBNYYjFNiZdZnNxOJFwllylGYIVckYci56oioTvkTzp9etKxDwGqE7Hr2o3R0KrJQKW6hbe1oiX7R0p/4GgkOpd5+K48Z9ACevgxc+DUetWHv43m7yKXCHiWQS7eiRe7KRamXn89OuTbmNKOJorFTTlbgt2IWucTJ2nACaiBg3BBHsoOBOUodPUoepO6+5OukruPbKid213lfJLaTnHXQhL2Zm1nTbAgrzvB9WTtwNJXKNppbkgnU4bAF17hs6M2q1Fb8SHQJKaG21E9der+IXCS6yVNFXRO5A//1ULQ8WztO5D9hCAkWUZXZLLe87DaPFjKYBXUPf3KXYGdcGOVDZiWr49rEe35KKbPkn5f33HKZL+Slpj+qDNiKiJT5k6kaw65AwPYyAcIvBkPx8jY2Eie5b8dApjbqQv96FAY4oaJxyuDQK/WNSONRCNLn1Hw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0hlZzBETGo1Wlh3RG9FeWNWVXJMeFZqRVpneTJDcHh6TFBmVFNGZ1J4elhK?=
 =?utf-8?B?SVloUEo0TVZyc2RneGJkVS9kUlNHa0x1cmNYOTNaWTJtQ0NRK3JGcSswaWJX?=
 =?utf-8?B?bXMzSTRybUFHQ005SkVjZnFFTFcrWm5iejAvajgrSzJ4eTZoNDh0ZG4vMTgz?=
 =?utf-8?B?a1kwU05aaERHZzZNZXc3Ti9qRGsyVVhqcjZoYkNFL0tZQ3FnTWhJWHFiYUU5?=
 =?utf-8?B?V3ZhdGU0TzMxSjBkT0E5ODRBTThWUnBnbXhvOW1aT2lBN1pSQlRlZVVsZXJY?=
 =?utf-8?B?VVRESmZKSElsSGFFSVNmQUxkdHY4UDhYRmR1NnpGTDNPN2hHcGxnNlRTYWtB?=
 =?utf-8?B?TnJqVmt1dk9XQnVjaWpBZWdJKzJsUmRLemdLNHhkRG9DSlp3VXhKZWhMbGIw?=
 =?utf-8?B?SXk3RktCZWg5U2ZYcHByVTB6Q09FYTBXTjExZGJ1V1RCaDgvVE80clJOTmpa?=
 =?utf-8?B?aGhoQlgrNVkyZERXelFlKzdaY3ZoZ1htODQ3akpHYzl0M3BieVpxZ3o0MkZX?=
 =?utf-8?B?YlNxRUVHbU1JVk1sS0VHa3I5SGNKMTRzc0czMVNncUh5VWRRK0E2MGVLbE5W?=
 =?utf-8?B?UEh0dFVmbEM3dHo2S3J1MTB4REdGUWdIbGRncXp4Q2luN0MwZHB3Mm96MFBx?=
 =?utf-8?B?ckN0QlpaRTgyUFdiRmlYOW1qY002K0JoQUljazYxNitTRkVNY1ZRUk5qT2FK?=
 =?utf-8?B?R2YzcTloSVFnUEdTZ2RwbHg1cUMrWUVFMUNyTUUrSkRPbnQvZTNqK1RnOHFi?=
 =?utf-8?B?eVUzME9oMS9hSGtHUTN3SUtQaE5iR3lTNm0xbEtMQmJlajRuYXArdnoyQVdS?=
 =?utf-8?B?YytTK29iWDNRRlJlK3hPR2Zta3Q5V2h1M3o4UnhDMjVvQ3J2ME9rb1NmT0Ru?=
 =?utf-8?B?VUNMTmhsRFBZQWpJMXl1bk9jR1NCa2tRN3BiNTNmblFZeTZrRnY5WlZQSXdZ?=
 =?utf-8?B?dWdmbEViWlE4SFV3bGhIY0FubkFod1JESDAxUWxkcUQxc1FzK3dlQnM5ak1V?=
 =?utf-8?B?QVpJMlN5ei9NN056ZmRtL2FBUXVoMXVaOG9abVhNSlBoUVE1Q2JLbE1qak5S?=
 =?utf-8?B?OStXbTJqbUNEL01xQ2E1M3oxR2ZEZUpkWWthalR1MjFYZkpVOWR6MVAwT2ZF?=
 =?utf-8?B?b2UvQWlZd0NnTUI4K0F5cmFra0VpYWh1bjJnUndIQnhxcmZyODBDOEU3QS8x?=
 =?utf-8?B?d2IrSjZQbVlyaS9wYWhvUk14R1B4bTFHM0JLeEhFTWM2ZjNrazVEcnd6OUpn?=
 =?utf-8?B?WkVKU2RzcnFiOUVZT0YxeVJLWVlZOUVSTmtWdURCckpaR3RsZUJRb3RheTM3?=
 =?utf-8?B?azZLVlpBUFFXREF3cFArbFdmaVlZYkNLVVl6MnZ1SEpSRzEyc0dGaHdUcjdI?=
 =?utf-8?B?WVJPTDhpd1FMMHcyemJpSVR2SlBWTDB6cmgxL1pOQjlQclVqZ3U2VnkvUkgv?=
 =?utf-8?B?bVMyaU81UTQwTG5jcDRzSjBoMkVzNTZRUEdXTVVJSnZQb0hYZlFIL04xemFP?=
 =?utf-8?B?dzJvV3k1TkFxR0EvdmdEVlVRUUhNbTNCREgxbnZGRHU5S3BaMFRzaTd0UUcy?=
 =?utf-8?B?bmtzZFBDTnRma2dBZFJSMmxMMjZCZkpNcFR2d1hqaG13Y1FVcnlLSy9HT3Fv?=
 =?utf-8?B?M0p6M1VpS2ZGRUVIMFNnalc2djl2bmNvaVZuM2trQkVQVjZveDUraW9DK2Zl?=
 =?utf-8?B?a2Q2UTJRTzZobTA5Wm9DRmxWYkhuUG1DT0dVcGxhQ0hPV3N0aERCVnk5RUh3?=
 =?utf-8?B?V2o0NHc4Y3hTSUpHRk1MWGVUdVhUQStOZUxZUjVuR2NOKzFNVkNMQldRYTR4?=
 =?utf-8?B?T2lvNFZaa0t0Ky9MNTdmYTBCaTZLU0lvQUdtY2Z6Q3RCZDdEeVl6eGRLSEJU?=
 =?utf-8?B?cDBPdVdHN1BMeUtRMVVqTGRVT3FaenlrNlJlVVZRVnpTeklFa0VkRVV0SE5r?=
 =?utf-8?B?c3E2VlBrd2ljOFF5R0lTVUNRVHpFU0hWS2xVV1hienBxc3hCQ2RSWDBNa2NT?=
 =?utf-8?B?eU14T0Jid1hPL3Vwd1poUHA1R1JDckJWVUhMMHRNSXprTnZPd0ZsVWRXbW9I?=
 =?utf-8?B?Q1RhN0ttOWpVeC9GUEJvZVlNYmo5SkxCcjlnTm5qNTlneUNyelZqN0l0aUtO?=
 =?utf-8?B?cUk0TUk4R0N5eG1DZnBDVnRhQTBkQWlFVVBUV0ZsanV5ZGRmVk5PQ3NKTFI1?=
 =?utf-8?B?WDA1T2djaW9BN3IwVFVkQ0laU2ZyUDV3OERROUlsdUVWV1lRWVdDb2Y5SitK?=
 =?utf-8?B?L2o2MmJYbnVqdWlxZHFVZmQ1Wll5Z2xUMTdhSlFCMjB2VGpkN2doZ1NmWk5r?=
 =?utf-8?B?Mng1a0FZRjVDcm1mczFoelgxK0hxRW1GcUphWnQrdDJiS2lGTEEzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ae9fc0-71a9-4fae-128d-08de9565aaed
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:55:02.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaX/QtUgHi8qo3esGBanHludMYh7ZHcMsQJ0Ukg/0FbsXFzDUo6jjcXnusR7iRNrHUiouCKXkbfcBEcbwrOKBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5071

On Wed Apr 8, 2026 at 9:32 AM BST, Alice Ryhl wrote:
> Please see the commit message of the last patch for details.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v3:
> - Disallow mixing kasan with gcc.
> - Link to v2: https://lore.kernel.org/r/20260331-kasan-rust-sw-tags-v2-1-=
f6765e3e1a2f@google.com
>
> Changes in v2:
> - Drop the first patch for -Zsanitizer-recover, and mention why in
>   commit message for remaining patch.
> - Pick up tags.
> - Link to v1: https://lore.kernel.org/r/20260325-kasan-rust-sw-tags-v1-0-=
7d3a765a72aa@google.com
>
> ---

Reviewed-by: Gary Guo <gary@garyguo.net>

> Alice Ryhl (2):
>       rust: kasan: KASAN+RUST requires clang
>       rust: kasan: add support for Software Tag-Based KASAN
>
>  init/Kconfig           | 3 ++-
>  scripts/Makefile.kasan | 2 --
>  2 files changed, 2 insertions(+), 3 deletions(-)
> ---
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> change-id: 20260325-kasan-rust-sw-tags-c5afff30e63a
>
> Best regards,

