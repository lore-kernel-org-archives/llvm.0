Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020104.outbound.protection.outlook.com [52.101.196.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB45363082
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787159; cv=fail; b=XB8Sr1WQpvLtex6/WsoKzPeGmXC1O9xt1lC6taXU6EFpfcacMrUueJZ3pDtc+WZPZATpAgpKZSXy5R1hoFtuvUzKhWyroc97wP8b0A/JCtkzrpBYuLtpllIJmE0IQIh7O2fwIxEBN2b4U0MFUMXt7zs/v9eP/6n7wyZuj46jhxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787159; c=relaxed/simple;
	bh=a4UiRRwzff9m4s28OrOUwMyJQS6wSRYeDPgId+bFtpo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=K2Jw4W0jIxVvruYx1Ffnrd66R6PQI7byGb2izWvbZviCypc6aEqoNDzgyFplg5pzJYUXbXMws92vTSWowXU69TPPPklp4dM09U0dwiMZJMVDVjFpBxIjBuE0dL7NqXK8eDrpM4y9lbWRL3RVJSe3uUrQtfONEETAD+syFWE/LoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ABnUG1Rc; arc=fail smtp.client-ip=52.101.196.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ABnUG1Rc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4+rdGXFK6CAzc899VaEj8lN3NxZoeBghyXOlw0LbDHVtg2HYpgkr6gJQgrICCQmyHd5PoEUruyulqnTT7D4jlHxSbJRCbdlqtBx0AyDPOnz+XKmwLmUJALTK2/i07HfvpWhnW/4BxhqZ04bXrR6ee1Iyv0Yz+F1YprSJ/kOG4sZK0zWONHZoXGqAeZ1n39LatrlxzJLP0S2FkfHXQBHmP6V+jYa7S9DjkxU9npuPy/vUB3IAMcqy20MKrN4JeUQ7K/kixAKlwOa+zqBN2AxOQkAkNF7G8y2u+FeeoiXPpgnY01h76jOSI9cypcjYh44KoHPKq8AVkVFlQQxLuMpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0julLZ7tKJ2MEQ0902+jspcQ86kMmOcspp99WjqdFy0=;
 b=X6jJKU8MM7i5b2mjrv4bMno7Tr52/sVy1P0yNOUF4gsqZ4mVq4grdX6ntd+5qvNVZ38QmbhgIMwFT5+HvaFuSzOkoCBY+GfOX6S55yI5N1TIRg3LA67D6Q47YjLyqJ4+ZiVQW6i2LPSdP/gCvx3zF4aFrgDgLwp3S4S42/BZBcAku3fQThR9+ho5vKXCyLX6Ay6l1Ppsi6Y5kqPpbiYV2Kk7SZljBwZfml/cFSDyZzps4Eq6n8aBgIhOItnv42PbfeOqeV1utBUeOxRzVBytBj1TdOmRaPtRS3OQMNwMEZ5Cya3RJYU7fwLeph21wQNn/sg9vx3ESQbs19x3NghuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0julLZ7tKJ2MEQ0902+jspcQ86kMmOcspp99WjqdFy0=;
 b=ABnUG1RcHmybVCw/nXh2+d/k6hegBNWjHXTuN65FBTWfdG8kPxSGbVh5g5TTEYzgo4u6KYidAPElkMOD/TL5Bgabd2M+Y26ARJkR/WSJ84yMtCvoWwqjbQsa4Kw2twNiPn+xqqovp+5s/ilTya72VI4XImA6SI2zoQETWN7BBUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8484.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 15:59:12 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 15:59:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:59:11 +0100
Message-Id: <DHYYH903GZVW.EU2UKXD2ET0S@garyguo.net>
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
From: "Gary Guo" <gary@garyguo.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>, "Mukesh Kumar Chaurasiya"
 <mkchauras@gmail.com>
Cc: <maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
 <chleroy@kernel.org>, <peterz@infradead.org>, <jpoimboe@kernel.org>,
 <jbaron@akamai.com>, <aliceryhl@google.com>, <rostedt@goodmis.org>,
 <ardb@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <nathan@kernel.org>, <nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
 <justinstitt@google.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com> <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
In-Reply-To: <aedQ629D0x-5KuKw@luna>
X-ClientProxiedBy: LO2P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::26) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d4acdd-5b37-4cd4-3125-08de9fbeee18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|10070799003|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wZazh4E2eFWJWsPEd8uvGaxNZ48Oe5/xWX/11J4e6oAE3UhqcmJKAUEXATGtnph/txFM14olLiM0MyP4Ukvwaaf9cbZjrPrrC8YBaZiV7FzEqmT30JWhvAItWwhyUExVb9jpHab+hxqgvAx5wlJ+tXBVm6xEYYePa+cfuVOttM7eBcrTsUS+ix2t/zgdCwSjAo7HssxngUycETggiY57jH1n8FrVQvLRljYnpaR1sjRCQKgKqcmrUTQjUaYIgzN4GnWbsK8RIrsKLU88QRAfvI6KV3eak7vGvQWiT8M/AVAspv/3TU1hPyIVUI5Q0hI6pW3xB/r8+0Inc9+sp6zMrHX6ez6a3Z1wXdLWTBy4ywe7wEMPS5OOzc1gLR+aBTP3fFqEIhP2A6sJIQwMREkk4bPjEtYgWlh91nKz7UjciZ9avHnk7RNkYpSSwQgU7yHo08XZHeo2W7TLb96Ao78/IXCiOa3Dmu3qP51Z5/gteiI6H9Hlruc8WHMzkvQuGcLPioFQsDkY3lA7eYoWnEmd+K/vmEJDbE4niM3SXJsbY8aMW/FFrdE2khbgdPviUbpAqc8b8t1XkSLu7/iZUCc/L7bv7L9gBA/21+6lJy70rQqZQfr52WZ6GdTYyooZGDoooBJxZ72jAuI9UtqFMoVkaFPbXyiNYCncSCsiGw2AHB+DY6+hXY6bJOK5aOhIV7ytXM9bWLCNfWvy2Shi5hEgDsNsSmNJnRURyeUFEcNYTec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(10070799003)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDcwSWF1OGg5bDQ4bmZaV1Z5aFZyUTdROWw3UGZVVjUyZzE5MlduSTJRK1Jm?=
 =?utf-8?B?T21IdVUwamNsa0tJVVdPUmJnWXB3c0sxTXV3OUFWZ0ZzMXpkSlhZRlNFdjYr?=
 =?utf-8?B?VnVoWjFTVkJDdVovUXl6a3gwN3NObm1yQVB4b1pyS2thN3B2dFRxNXl2QXlj?=
 =?utf-8?B?STJxMDFBb1JpMUpBM21oV0lWRUxXb1hQOEVNWVVCZXRJNWkwUlpWL0NjSkd5?=
 =?utf-8?B?V0hWUVdTcTJxR1R1ZnBzbzc0RFlQTXYwbURyejFhMzBrdS9RV0NuQzFjZDIz?=
 =?utf-8?B?WnlDbXdXODBiTzNHT1c3bWZrNDk2dDY4K21DY2hhUlgvYUYwZFdodXRHamtU?=
 =?utf-8?B?c1JtYmJ5WExDdEZNakFrdVdGL3FZSituZ3VYcjFoT1NUY2lrRFczOWdzS2o4?=
 =?utf-8?B?bkY0YnlpcmxhSFdWamYwUlFrakY4NnpQcy90QXpucFFvMzVYQXJMNHhlR3Jn?=
 =?utf-8?B?UWViNFB4Q1hOdHEyN3ZrMW1sNklCRXFXL3JQQnFhMGd4RjVFQzE2dHlQRmU2?=
 =?utf-8?B?U2xmbW5VV2IxbDJnSWhHQ0pWMVptTy8ycnFaU1U4eit6Ni9Fci9WelFaVTRp?=
 =?utf-8?B?eHJpRU5aM0JwUmM2MGEyeXdrRGpMYUVIS0RlSEJzUGEvZTB2eENqSWVoQkUr?=
 =?utf-8?B?eDVGaW9HUThhTEFGLzc1bWZEbUJzalJjd0tRZVk1R3V6R2JKcmRPUmxESkN4?=
 =?utf-8?B?L0tYNVJYZW0rYkpzQ0NRZkttZklLL3RRV29JSFF4QnlqNmpQT2trSE9hOElM?=
 =?utf-8?B?VUd6a2RQMVJvWG80SkFZVFJvai9DSmhscWdYVlBXSTMvRGZOUXlkbEhyY0tH?=
 =?utf-8?B?aTE2Y3UwZ1hrM0VLSTJhUWluTVNNanVGRnRTbnFOZ2RoMFFzb1E5aVYwemh5?=
 =?utf-8?B?T21LVE5DL2tmTVhyaW16U3REYU5ScVVYeWNBYjFJc0V2KzdVQzkxY0YvY0lZ?=
 =?utf-8?B?UEUxRHVjYUYzQ1B0NkFXc2lUejN1ZkFudUd4QVFTYnlqMzlidnU5L3RuVi84?=
 =?utf-8?B?Z3EyVEdLWmN0QnNpRE5VaTcvb1hCeTJQb2IzZ3NZZ0Vrc21BN1MzdXF5MFlB?=
 =?utf-8?B?czF4T3Q5dnJGbjJtZGFEVjhjdUhLRzVyNkQ1amJxdUcvNWlOSDNOSHRKUkg1?=
 =?utf-8?B?R1hhQjE1T2cwaVJsbFJub1RoQjZXTXhtSTMyTmh3TWJUd1c3RkozMC9nVkhz?=
 =?utf-8?B?RFlUS3d6MElCcmdRdDJyWm1GVjVXY1VGM1JVQkNxb3lrTkgyTUlJeG5kWWpB?=
 =?utf-8?B?c05kNGcwOWlvM0RGRXlXenFjUEowZ2JOdU9xZlZvd0pRZHBBY2Z1TTlMbU9C?=
 =?utf-8?B?b0psYTJ4c3gxR0lvRUR2M3I0UE5kV3NvcHZ0WitYOHUwdjZ6S2dMN2QwOVhO?=
 =?utf-8?B?QUpYWEUzVUhkU3pESVNmaS9pTHFQVVR0YVFpTE5VZklPU3ZkcWpGWWdnMjVQ?=
 =?utf-8?B?a3JOTkdWaUpCNk1wK0xHME1VMnpCV3hqWTlzc2FDQTEvdHFiUFdscTMzMCtS?=
 =?utf-8?B?MWJZNGV4WW9RWEk0eDBZd2xYWk4zbEIveG94MUlXUnB2VzVVWnNQanZ4WjNO?=
 =?utf-8?B?WktPcU1wWUNVZ01WdGRPZ2NIUXp5RUhUcFpjeEJicWhjeGduYlJ4Y2kvazlI?=
 =?utf-8?B?UFZ6WTRnQktzUzJGMDFEY1pFbFdJbmlXOW5jblQ4dzNuRGhMdWRxUlQxQloy?=
 =?utf-8?B?aTJWSjNCM056R2c2b2tIZXloSUkzTFlDR2tYZDZ0UTFJM2grR1FybCttOWJ5?=
 =?utf-8?B?b000d3lWRTRNdUhvanVuZHRRV1VoRVJBaEZEeUtZazN5diszMUpmSTVNelhy?=
 =?utf-8?B?TmJ5cUhhYXV4dWk2VWpPdkZ0MnBEZG1OZWk3M0U1endHdFdMV3kraGRESTZv?=
 =?utf-8?B?ZVJ5MjZFanNBYnZmNC9XaDhGbGk4WkJFLzcwbmtrL0w4YTBocmZ1bWFqSUZz?=
 =?utf-8?B?bjl3OVJhMDBSNG40QUg0dTNnK21HNkpHMURkM3Fib0xHQWl3UjIzSStOYjdi?=
 =?utf-8?B?UXExbkFUQmtDQWhFcHRiQTltelRrSDhGOFIyblFLcis4NlJaRDBwRFBzNktp?=
 =?utf-8?B?VkkyaW9mVUJGcmYranRkc0RrVjY3UHRMU0FYM1BrK0tyZ3JYcWhQOG9HZCsy?=
 =?utf-8?B?T1NjL1VlNlV4djU2V1dycm1JWjNQZUNvMmNwZVFrZG50QzNlcTVMSkU0RkNW?=
 =?utf-8?B?K01ZQ3lxTDFMRmhjWGhETGNNZ0FSS2VuWjlnMkVUTStQSlJuTEttSGRTU25E?=
 =?utf-8?B?SzQrb2xXV1RtNW4wN0FCWWI3UFpKYXVrM00vOXBoNjB1WXdpbjMra1JyREs3?=
 =?utf-8?B?Yk42UlBDVktlZW1obXRxNDI5dGNZUWJzZkVta3BpdUhvN05rRUdkdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d4acdd-5b37-4cd4-3125-08de9fbeee18
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 15:59:12.1066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbOSvs1/cIDBFQcjEjEG0qv6RK2r9IK8JVIT3jYxzYZiCo3SXzEleu9JsreY9w+6TsAE20U9wXvGk5uhDz4dpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8484

On Tue Apr 21, 2026 at 11:26 AM BST, Link Mauve wrote:
> From 2c0a3ec3da6fa1f0151225c05159f7a812317d32 Mon Sep 17 00:00:00 2001
> From: Link Mauve <linkmauve@linkmauve.fr>
> Date: Fri, 10 Apr 2026 13:51:24 +0200
> Subject: [PATCH 3/3] XXX: Workaround for __udivdi3() and __umoddi3()
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> The core crate currently depends on these two functions for i64/u64/
> i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t use t=
hat in
> the kernel so let=E2=80=99s panic if they are ever called.
> ---
>  rust/exports.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/rust/exports.c b/rust/exports.c
> index 587f0e776aba..5f1cdf13882e 100644
> --- a/rust/exports.c
> +++ b/rust/exports.c
> @@ -12,6 +12,7 @@
>   */
> =20
>  #include <linux/export.h>
> +#include <linux/panic.h>
> =20
>  #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sy=
m)
> =20
> @@ -20,6 +21,14 @@
>  #include "exports_bindings_generated.h"
>  #include "exports_kernel_generated.h"
> =20
> +void __udivdi3(void) {
> +	panic("__udivdi3() called but shouldn=E2=80=99t be made available on th=
is architecture!\n");
> +}
> +
> +void __umoddi3(void) {
> +	panic("__umoddi3() called but shouldn=E2=80=99t be made available on th=
is architecture!\n");
> +}
> +

This should be added to compiler_builtins.rs and gated for PPC32.

Best,
Gary

>  // For modules using `rust/build_error.rs`.
>  #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
>  EXPORT_SYMBOL_RUST_GPL(rust_build_error);

