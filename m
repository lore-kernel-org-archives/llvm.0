Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488F84AD7F2
	for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276686; cv=fail; b=u8P2n0r2jIYGOeZhy2JZkOqKhO1zaHerPgX4DObOG7MMIaNbdts8tK1L0MNQmNvWmLd4hnpFzsz4gsJQD8C4I44v8e8EGG3LoVgT9BmvrJrTkTUPQ+uGCpEdlfCx/0DhHGhQ3ZGb9OEwPj4crwrfSKT42GdPMn6VylEl8oyRoh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276686; c=relaxed/simple;
	bh=jhUbEJtn/pcZYyUTMj+HqAfslhuR8Z0dZg7aE90uUAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kFXqWvvqyzgPXsJrp6+cnh4MPEjs6NHuXGQM5OraOACLtDjPBNqoDuE66/HrhiaoUYnDzHHr1miEjhivfolwT9SUe5IaQmH7Rf+vHFWjmFgJTENKq0FCtbmBlxzd+uUmhLy+j0Y5FbwBh8rswMkId0oDPjJWin8KpAqMCJFW2F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eL54m/vA; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eL54m/vA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qR6DIw2XteDyMHRf8jryMYKHIiIEsIp1lr/4EOYA952hb8j6X2vewVU7fpomXr3Uf8L3JlC5EMn6U4IX5l0+krHMGnlBCRqQXdpAWR1XoeSYU8Ocobfr4/x5gUkKBwf/ByuvMk0xXHKXuxfLXu7TKhaQK1q+qlXdC8RuZApERN4ZP7U8+jA3vo9HyQcHDamS6LzVo+t6T6JBajz6M8W0YuxpYiqukSgV3qO5+0ceZCL0r269/8aQNIfi628ftI/1PlFBnJQUNxGyQAejvLW6v/bWRLqcAb20M5xA9Qi1dK4TMBpXpW5uZYEjOWXtJtWFxKVMJKAhq/t1jtBvkLzPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt0PsZ7gQH/hSyRUYDCTU1WdQ4zs8d8qbJINi6aM608=;
 b=GUJ00gZgeIbLixg4jcARCbx5sWKMHELf/ofa8nHCwC0o/MPQ5z3dIFIchYiG2aMBCHjC4g9ml+mni4Hf8/Lkz2bS8sdmp9FFy9g/Pe6qzNQTZ5xc/R+/Jyp5TYFqYq4+iHc8jJyeC0PcxdEhaG3E9ftHnswok9WS+QmN3TU2Ji6eUiuNnkeHnTJxKLEXzBnLkHRrgrc/Nyz4TqdG5FwxPkB2KDhHMQlh+6Ru2uQ+kycLyCmiriDaTVBDQHmMtGNdOJuxwJSbn3k6ZlPiNTWgHRXA5QWTCEoiVcLQgxYjiLvM7IiZyn13tXlOB6V7y43B0ricIzX7CgNTl6+Fbb9O6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt0PsZ7gQH/hSyRUYDCTU1WdQ4zs8d8qbJINi6aM608=;
 b=eL54m/vAtKneqrTaPkxDrG0Ytxap9KSixTknElyejfxwc+fSdMaqhTXYgO94EyW2QgjC/7ObxqIDLn2Xiwe6Bsft05Ve0mltJphlZg0bj4GXq9QFTpU/DvabgPOvO5CWFjKwWAR4H6YtzDGj4vmA7nnt8H21hAmZuUqJt/3k3JZorwOnrGx2jvg8GjOJUJECUai6Nc7SbHyQIsDcxRhLJu1WHQ/zHiTpDOCWqn/RF5OeoQlJJPqOrFB9OLJPDqwNDqOYGAR6rlfYZK8vBMPXfgjW8Xop+EVG2Hd+W789aY/x+r0q0xBfumbaWghiWwT60fKtntsmnqKNV2qxAX0wlQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB11417.eurprd04.prod.outlook.com (2603:10a6:20b:6c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 19:04:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 19:04:37 +0000
Date: Thu, 24 Sep 2026 15:04:29 -0400
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
Subject: Re: [PATCH] dmaengine: mv_xor: use devm_platform_ioremap_resource()
Message-ID: <arV0PT10meJEfeim@lizhi-Precision-Tower-5810>
References: <20260714002803.1414307-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714002803.1414307-1-rosenp@gmail.com>
X-ClientProxiedBy: CYXPR02CA0002.namprd02.prod.outlook.com
 (2603:10b6:930:cf::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB11417:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5391bb-d3ae-4a9a-8ad4-08df1a6eade9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|366016|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Jo08olFKobOrr7/hCGVS9PpgRZEi+7IR1qiltynKex5OmoV2vQiisuPxjDK9NQG67clYZL06bZ2nwktEq0PMwi7M5wpN2RhHbxYf11bDtTqxJv1qDhwcGT6yQQafQ5NjcAIh9EjuGHj6Z01xCQsyt/bxY0G+vXV4chCg1LTdTzQ5bJwVfR6lf6+D31ZBM5zo/b6a9N8lAc+kuTgnQN+v2sRSx/bqTpTSE9tF6rAKLH0Qc+zbv9BugOGPaDdQ9FboXtnjRF9syCqCSi6mMeJKR16PhzWk/vcu7lRLghMCaG5k/trxuOgtlr1g1aEvFSUS6twuL8jz682ZOVq09yE2svG1LDhJvkpvD+Lwff14QpdnpYlLxTI5jeBn9GhQSGZoizK49AGUPudoMwoceNzqmmowILhH+nO1yO/losdx23aert2anX/7GwhEHn6LatogQzivOKjXmm+jnGyTRPWNmVOfY8HIGOah9Zi2M3wul9fh/Khj60VLkzy49/mXsViIlEJv9Z1CIHDLljwWp4hGMKoJi4AXYSARiuc1teU6w3OhZduIB+dmRK6gYyZfGXkp+IoCnsK97YTx3F5VAWVw+wNGYnfbo5eO4EYYRDzaKFyQa3K9fh8MDlbavVux+rfYjY7/8XxGLhxfW6zZI66nB7eoVBSaFOn4/sjFEQk/DpU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OuTPNQa4rL2j7OjgzJedonKaWshmsKmL13XXKLw1DHs1KiDFvberpkQ9q4GC?=
 =?us-ascii?Q?5gh4/t4RvmC20SgIYLpVXMbdLjktBp3xnHrPnYdNuHSMOqppxegQcraK++eI?=
 =?us-ascii?Q?aaR2THCQ+FryaKtESqc/dw44bktODzolPeRLqBMek/ZOUY3+5Moz4fb9b1Kc?=
 =?us-ascii?Q?XHd2IoTJi6N+4tU3ljAiA8mtjS/SUY0s45B4f8k3pY0XqVt+7rOxneECUoX0?=
 =?us-ascii?Q?xr2g/XoP2naReHrO4LTvX44rFHhn+PXgG9WLlaQrQ2DkWlAxe4Y76/QxUZuk?=
 =?us-ascii?Q?k+RcniQKLI7JesbfPpuVSyS2VQk0kbHE5yQvt1hgbUFtTGZP9jnSgSck+aAK?=
 =?us-ascii?Q?wRcIiaIeSI39iRf3qybk6iT3rt1Q0PyrUtDeaVhWgmYzmYCdsHuqDpuRXnyq?=
 =?us-ascii?Q?m4u4YS4KySDakCk27FOGJU1Ws5qXLotsA2EZGfrGXFPZezJt+pJ3BbLp4qzM?=
 =?us-ascii?Q?rGQAnCGmKVu/7QpC47VbrZgo8Tlz6h7rED5IOeBJpYg41K3lzGtArJgv81DR?=
 =?us-ascii?Q?Mc816rcLtXU0geOhEAdnrj9KtvCQJvSayJLTpchGEjAoZBUz0qyg9AGNAwvz?=
 =?us-ascii?Q?m8LNXiD6dC6MxEDskj6TPJjj8HsA6oF8lhkd5CXJGTPn9urVxpgRxh7TSrh0?=
 =?us-ascii?Q?126betDs9NkBBuZYtnDz6cmk7PO33kzQPslKbidc7ZGD3Z0Zl+NwcAc4EiYJ?=
 =?us-ascii?Q?H0SfpYRixFmTjHivisNsJWOtBA3NncPHjSgEYOOZFaWCshj3pPUOap8Mh4BY?=
 =?us-ascii?Q?YMEI6CZECPxLynYmwHPgtp6Q7PKW4CKAliVc6pM78CPR/VoywT30lJZhSvNS?=
 =?us-ascii?Q?QB6V+FFfSiNuVt+EfY5ERKWb+JhmJBeuVga3+z0SeuMRlsMWUuUReOQ+CNgh?=
 =?us-ascii?Q?ZDJ/vZAlnXLgwpXVr8ohwJgOFEZ8Gb19Rz9A2XsTz9nhT9Z3fsh5xCKY2ef9?=
 =?us-ascii?Q?7lgWZE+qvb7Sa7ki5/0vkHCSJ5mwK/i2XN0h1CIQx3GESircEb2QWXkBwYKU?=
 =?us-ascii?Q?Tc/t+BlWA0rbQcblYcnXkeK4nol9GK8PhnnFBMWJaGESQCtnz2V0NElCoJso?=
 =?us-ascii?Q?iiWL0fHoPhBarAXiNjvcdAc7YQbH8/+IYrsPqIzoi7/Jjzum/hYM1HPympLK?=
 =?us-ascii?Q?XNvnioAkWccDPA5F3+GQ5gJbQe2pkp7nZ0/C02bs/+K+6geAq5A8HMXzXzBC?=
 =?us-ascii?Q?SzS4j6La1DCWQx/TbBYidhhQJ7aWNVzrUN4H32E7hNhIcxVqiIVQ31r0q1I3?=
 =?us-ascii?Q?ql3pyu8G7V/rlsZRGAUwdAHo5Q9FCVSVP2FCONXiBzhkbKjaNtzyOAhkrz7k?=
 =?us-ascii?Q?5fVz+09q4PZQQlDFBPZDL6ybrKxAhW2REaHZwu7MLoh39JFSdXJOmYvM6NkF?=
 =?us-ascii?Q?7DvKhbgfS+pE26otkz4csfHArp8jPaUPPSS7srmm2Whvs2MqR8PEQwY2xrAS?=
 =?us-ascii?Q?4QejK6r8RWDsvVpHoGhZduw4UZuSAyglkZ/hskjSruSFV10Fj5vUIgfe/oI+?=
 =?us-ascii?Q?PccgV+2/eI6kg2N1Y1CZRAKukACyaNhywAxbGALemDblGImLSy2yVXzNm8zN?=
 =?us-ascii?Q?XLY2+k4+jUaAkGBuCh+/9IJ/TLK3RjFC8tlbdwkteQxYnefaMFMi9YtLQR5g?=
 =?us-ascii?Q?fDVq5A3UDZyDJ11JuErKSPk3n8636rUSW/JRh3ctVXiCvgN/O32bHNgP6Nfx?=
 =?us-ascii?Q?9dUzqxLDU6DtnY2oWUyBCECdK2SDf5+ZJ6gXrerIwtC65FMOvk4M/iI+Tjec?=
 =?us-ascii?Q?T9Hjsf+FYdv6vXgmyTp6d1QhE7PSY7+9OGw+xi+evLrFNhd/YZLh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5391bb-d3ae-4a9a-8ad4-08df1a6eade9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 19:04:37.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KptI8dtktRoKVLjUKFLwykCvSfX4fDR/f0JwFi3zL8Of47vHRqA9XmIGoqb7WOXrJynhv4PIizpEmGqj3a3SFMyflGQO/rBRuEhcCwD8qIxAo5cNB63NnnWgQrI9q8tH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11417

On Mon, Jul 13, 2026 at 05:28:03PM -0700, Rosen Penev wrote:
> Replace the two open-coded platform_get_resource() plus devm_ioremap()
> sequences with devm_platform_ioremap_resource() for the low and high XOR
> register windows. This folds the resource lookup and mapping into a
> single call and returns an ERR_PTR on failure, checked with IS_ERR() and
> propagated via PTR_ERR().
>
> devm_platform_ioremap_resource() reserves the region via
> devm_request_mem_region(), which requires non-overlapping reg ranges. All
> XOR nodes in the Marvell DTS describe two distinct 0x100 register windows
> that do not overlap each other, and sibling XOR nodes interleave without
> overlapping, so the newly-reserving mapping introduces no region
> conflict.
>
> Built for ARM (defconfig + CONFIG_MV_XOR) with LLVM=1;
> drivers/dma/mv_xor.o compiles cleanly.

Nit: suppose pass build is neccesary steps before post patch. So needn't
mention it commit message.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/mv_xor.c | 23 ++++++-----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> index 25ed61f1b089..fe2e6b9ec185 100644
> --- a/drivers/dma/mv_xor.c
> +++ b/drivers/dma/mv_xor.c
> @@ -1309,7 +1309,6 @@ static int mv_xor_probe(struct platform_device *pdev)
>  	const struct mbus_dram_target_info *dram;
>  	struct mv_xor_device *xordev;
>  	struct mv_xor_platform_data *pdata = dev_get_platdata(&pdev->dev);
> -	struct resource *res;
>  	unsigned int max_engines, max_channels;
>  	int i, ret;
>
> @@ -1319,23 +1318,13 @@ static int mv_xor_probe(struct platform_device *pdev)
>  	if (!xordev)
>  		return -ENOMEM;
>
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENODEV;
> +	xordev->xor_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(xordev->xor_base))
> +		return PTR_ERR(xordev->xor_base);
>
> -	xordev->xor_base = devm_ioremap(&pdev->dev, res->start,
> -					resource_size(res));
> -	if (!xordev->xor_base)
> -		return -EBUSY;
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (!res)
> -		return -ENODEV;
> -
> -	xordev->xor_high_base = devm_ioremap(&pdev->dev, res->start,
> -					     resource_size(res));
> -	if (!xordev->xor_high_base)
> -		return -EBUSY;
> +	xordev->xor_high_base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(xordev->xor_high_base))
> +		return PTR_ERR(xordev->xor_high_base);
>
>  	platform_set_drvdata(pdev, xordev);
>
> --
> 2.55.0
>
