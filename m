Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A5D3B4417
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975138; cv=fail; b=XlLNDIHV6hKtSODbqHhf2W+vE8jWnHKRraS8lkMS7PT9aHJ8trizwJPeaA5Y6fGNrheOhI/uqbwuoo0Z0GBDoFPSHjZb8yd70eQYV1+UiJh+AYQAn2ea8sikv2teDXhHp9sUnAItGB+10GMiJ9IeO5Mhs0gsyToZifGDgtGdOjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975138; c=relaxed/simple;
	bh=QmIwAPW2HpKw0rWXQ0PU8vcnpYomSNIfpbLO2KubmLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AD8Ept6Gc0A0A5S1PQRg/DIxVilwcZY9Lc/M/dK8znH8fpjkYLyegZqEeNXQGifYvoRNAzjeUPAQHpsFOZ/TcZIA4OmLgqFZSSiKsndSMuHGkdHO0+fxBy6J3H0nCKlhbkAEQ/KBLAYT3/Yie6q4u1j9VAGoOxJH40oX+Ebh9Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tSN6NXdn; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tSN6NXdn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc8EAGUBZqaFE6tSrn6rVodD/L+08NkGHCwp3ilK/9WbM1r57uqNQRLrlqSKXln0UbjnKa7ieLkKQzA98Q/O8EoJiqnxJ6goRrFPt3HvknqSN/yKWjpZNsO/YyiapcKkuvgNIj01v00vpwN6NJQmxNzT0glaFwPOPZ62ofPsaijwV8r+1DgEgFmRFi49tY2X6ss6aHiGNchm8wpXMrw3RLzR8Ud39DX4+AE8psReU6TCbnt7774Tg3grpEhnTtNcXF0EngluxvKB42QOohJg7JtJpC67dE98NZh+1v0hYUT4PjiGfBKYMaEZlU6AboD1zXPfCV3BBaTi1ZwNa/nbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N+hA1WSk1Utk/DQrG8kzSglI9KMh+12k6xq0HIUKts=;
 b=SolPKW2vp65Ngz68H0DkTgWRvjlgp0m6vle1E9f4jxtCZO/CQvHATI4V8p4jG6T7r8KGZumErLD8Ujsua/qLpPbnE2ve/V7zeFl5D5uR/X36oquwfRkWTI/D0ZGxvfx3eScjr+zys7VNNgug9QHaPsCG7HFZ+6Qq62GL0AtowYYbRWPYmaBYjcIKT/eFVdy/TgCbd3X/JBMETAfdo37cPCdh5fEVQ+PH/E/ygn+wYFicCGNkonMVX191pSxV4/psE6QsE6AMwkO0SewbaH7FFkCY3JpZa/A6x7S6QeejCrTzcFSwgEL+ROmRra563n+3IARNEb+SWmxfLvtsxPkz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N+hA1WSk1Utk/DQrG8kzSglI9KMh+12k6xq0HIUKts=;
 b=tSN6NXdnlZoPm9FBP9BSYFr+xxPg3xdIzalwlmgpowG7yjgr+g6q3Wr6MCMkk2DIoERXr3t+gmeaVY8zMh3fjyeqt5SXpht9vukWLMjHaSV7k5MJX616WNsr2vp2PxKqdJpH/gkhhs7XX73f0tuT2lkMnS5fOYkBIT4ThRV0T09a97ItaSuB4SfJc8IiGCwCU/d3QsZNNpVXr2Raj2QSujrrH0DDurzyg2iJ+JaSfRj6rnHaTuvrLBTrNDPyJqS2yaTKiqjcDNjpHAfyIHxSK8Ny/OXCDlPJjSN2kzE9HLgaw+uXD8KjowuU+TEvLvPtZbsjWhGdoE58NDO+sy5yiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11399.eurprd04.prod.outlook.com (2603:10a6:150:2b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 13:58:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 13:58:53 +0000
Date: Mon, 17 Aug 2026 08:58:42 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] dmaengine: bestcomm: ata: drop unused inc local
Message-ID: <aoMTkukPXAD03CD1@SMW015318>
References: <20260817015747.136689-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817015747.136689-1-rosenp@gmail.com>
X-ClientProxiedBy: PH8P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11399:EE_
X-MS-Office365-Filtering-Correlation-Id: 76810fcf-7004-46be-98e8-08defc67ac32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xasgTZxC2X0bieh32n0mC7jHrwBuDpizmkAKTJQr8s32bmZIu9zxmBHjYtaV/5OCKK8ueE6ImmJoKg833nNEeZmoRTmheeuys3sksuNDzjLFHYxwu1PMk5+reO7dev3u5Ui884cOPr7MbMqX1myujvptPa6N9gAXzkGJPDqCqgnnOH9njdGeDhKvHET0rnrN/+KBb2TZLLALcBAlt/rG+1epoyEypaOEglKe2Nm8NByxxpLkQVlS6owggZxxn2sUMKQhDFtwsVdrHKQ58rn9dU2fPrZBluHe3HclhGx7RdhWKMYHKY2ahy/yRvAkd/01C+iTMFKXqjM8OpgUgO7Hx4IcAnQcuTvKojeGhms/mH07+4huIJH/b1pXRIWHUIcxGxYr6byWAn9NkAguJ+s87zeFHxEG1S5+57FKqDeCTtdqsCI6PVLG2yIbEU/MTAGfQe/RxkuyTRl9QVX4yEgIZcgKk5sfJ78w6oUgVOBJb5U38dDkqeHHU2Bn1htCm2WAb9XaxGNdE7fFzR6H/eK2Mkzc3vSjxPfjFdJnEan4+vQ0EjZPlGihQHifIDiJp3dZfdYZSEJNBFBPac4MTRjR+nhnYd4e0Iw24JJKRsZvNG/XugtHMmLUBpvE2KW3rutMkoQvEYLzq2bfYJx0AWkZCIlPopRB1KtOjdQHzxkJLs4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R4/oFxpFyMsSh6KjWlV1GI/GiRRc6M8JDG0C2dO4wRbr3tBQxnfQQwpqHGhs?=
 =?us-ascii?Q?tmocC5lXktVKiH2m1DT1Xdbd46BvPHz/G4WowYA3Awvig6MRk6f5+N0vNZTu?=
 =?us-ascii?Q?YQ8GOEW+5g0DcL9qT9rlZoJg+mtv0e7EcVDfVYRkHeQANt5IcqGM8WyYoBSC?=
 =?us-ascii?Q?bNSzaTNAePCF0dh59d3s/dKNdtaR6vH50hebbOPKnHQkjuVDT7Dp2SRWDg2h?=
 =?us-ascii?Q?BgLaYWvI0FIBMI1G9W1RPM51b79YELa1tCXtWV5rDwzZZ9ke/fyhWNrntgS/?=
 =?us-ascii?Q?7HN/7X742Vs8hJwDhQ4yDwC4vtPIjtzHjYuigZ3GUKqXteGJqPo0uM26Eyy3?=
 =?us-ascii?Q?jjYBJV1nTMvazJMj9Nw5ESHYpKKrmxctfMfsIijgK23FJzUUByRYfCvc/knR?=
 =?us-ascii?Q?0DxVh2Rqz2Y2i1FrTvMEkETQIziB3Wq1mRcrYH4rinMQo/cxbKmHAbl38HWA?=
 =?us-ascii?Q?gxDyPNU+FRG6H5NvApR3tZqkX0TGjD023B8qD8HWCqzCdF5i28q2pzzNRI7o?=
 =?us-ascii?Q?spHkcSnvakMIBRrk2KvApkiJ0w/FaehfyzuLPU0po0c4uD24hoMzwEH+IShc?=
 =?us-ascii?Q?VGE64JTQokE4QdKfvI+QKgPPv0nALm4Boz5TK8c6Nb7g0QPKLkZ4wJuOVMLP?=
 =?us-ascii?Q?cANqSmVDgRPzbzI/wTK44plkdcx0xkOdRX5yN97sUSBHluQSTBL4on4vlMOl?=
 =?us-ascii?Q?kT5KrjjFizkW7X8kuYeeCAYTyf1wiVE9KaETeCPX9T2+23uqmSODmqrQeq0p?=
 =?us-ascii?Q?8fvss1OtdbsYSFiRSUhT3hQVswSWrR6WBGtjcZiJckGqqHsJzIZwULvetqxA?=
 =?us-ascii?Q?ry0jSxFlnA2G2RuCFF8zRqkodyVGmKxL7JK00jd1JHn/YJp1pqrLvw16P1we?=
 =?us-ascii?Q?JrqCHwsf2PO4rUP6Beb1TWbkD3aXk2Wy+keUO4/qVGpyxaehkfBucaXavDJl?=
 =?us-ascii?Q?mZrkwWeyTskR6zaXNE5+QaKp72I/C1E9t+SHSgcMjPmTlhgaLwEcTIah3okl?=
 =?us-ascii?Q?YAIwq2oHB2iGShumtY6wN4gKklfkGgmvfkf8r9vph6qXOQZS+Z/wAZS/FZcq?=
 =?us-ascii?Q?EVO6xRooLXZbArwC16Yj3iHhh989WD7xLtlteHMav4UEKcve7HvFEeCWGt01?=
 =?us-ascii?Q?i0FI0sleCijvDTC/vs4obsraJ5etiUTgYRfitZNskGDr7n2peu6Csvb40WRu?=
 =?us-ascii?Q?ezI+kp84Og0J802tIVRtUlaGv0n+yvnJslQ4RYCsphDW/gr1LoUIfvzEplkE?=
 =?us-ascii?Q?A52ejuyX3UXvNzV2SEQzKGy2yuw8O64g7O8kFxN/e5duoKFy1IApKRGuUyC6?=
 =?us-ascii?Q?/RjOb7ed8YoUvkfIXQ2ibMp1RaR3DZCYe92SCSsOOMcxyS+xMwOc22b8wuXH?=
 =?us-ascii?Q?EMqJbjoVr6pjn1VyEJ+nUdurETupZo+AtwcP1U08G8AY0zv+2gDXSWijYJn3?=
 =?us-ascii?Q?yx86frAyPfxdq/PKNWl1o8xHtsloDHBXRuskxwZ6EQAH6yArFQTp7wxKvEoG?=
 =?us-ascii?Q?Bgb7YLUW6I+4A9Xg9UVl+Rtyn2abkr0ZfwJBdEHlxfAgLNJEmrUoaOQIezP5?=
 =?us-ascii?Q?vdJztNz9R6KQkJj0Be7dmc7rjyA6nun1lHD4VZGlrVSv+k4IkIHtnS2W9j6Y?=
 =?us-ascii?Q?pCsRbyKfENyjnwFlo/6WLcaKJRypQKgH06IcUWP/rZ5pJuVhsgahmTc27N+G?=
 =?us-ascii?Q?9lH/1FKdXSIYd8/PSTLz9m6Dg8Ia54wYQw9tXwvkqxRwdOk4Q/W6OisAMw63?=
 =?us-ascii?Q?iz8MAAWJ4L/FhHG7vjVJYNj4mkPgJT+wY/d8HSSy29DolD3x/8CH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76810fcf-7004-46be-98e8-08defc67ac32
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 13:58:53.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhbcwnzXYvfzUp7A7vuo6SvWItthc6StqQMJSQgvPkkKlhw/RBij7M0Gd0RQXIb72GJW7umubICeNIHCbqDI/9RgpMFmIipmalrXZapR25lpxD5J5TDXGhEAq47CM1Md
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11399

On Sun, Aug 16, 2026 at 06:57:47PM -0700, Rosen Penev wrote:
> bcom_ata_init() declared and assigned a struct bcom_ata_inc *inc that
> was never read, tripping clang -Wunused-but-set-variable:
>
>   drivers/dma/bestcomm/ata.c:58:23: error: variable 'inc' set but not
>   used [-Werror,-Wunused-but-set-variable]
>      58 |         struct bcom_ata_inc *inc;
>         |                              ^
>
> Drop the declaration and the bcom_task_inc() call that fed it.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/bestcomm/ata.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/dma/bestcomm/ata.c b/drivers/dma/bestcomm/ata.c
> index 502a45d76adc..40126f3f189e 100644
> --- a/drivers/dma/bestcomm/ata.c
> +++ b/drivers/dma/bestcomm/ata.c
> @@ -55,7 +55,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
>  {
>  	struct bcom_task *tsk;
>  	struct bcom_ata_var *var;
> -	struct bcom_ata_inc *inc;
>
>  	/* Prefetch breaks ATA DMA.  Turn it off for ATA DMA */
>  	bcom_disable_prefetch();
> @@ -69,7 +68,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
>  	bcom_ata_reset_bd(tsk);
>
>  	var = (struct bcom_ata_var *) bcom_task_var(tsk->tasknum);
> -	inc = (struct bcom_ata_inc *) bcom_task_inc(tsk->tasknum);
>
>  	if (bcom_load_image(tsk->tasknum, bcom_ata_task)) {
>  		bcom_task_free(tsk);
> --
> 2.55.0
>
