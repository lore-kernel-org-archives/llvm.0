Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93143634C;
	Fri, 31 Jul 2026 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510309; cv=fail; b=ihNyLpIqFeSf7mEBoSL3NuU2A7TJc0hymIPC7MsIUdqlrxieJOtdH0APm5dyMZEp6bfgEECbheZUmC/wkqUvTkPUnToj+9V052iSKEMM3eJcCTDYCIVeqCt8iDR73wobmC/33Argml7EZVA6POU2tsdyucLrFYdMngA4uEiiCdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510309; c=relaxed/simple;
	bh=ja4zadIMizEO/iSSAtxrWxmugN8pc42vhn5O3N7b32w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gLljIZKvDGwh9At05593ErLQelXdwjtYcLBgD16gGOqgi+1DPH1AAebSlvMcLjtzjDw8zACFzIS5bsjU4oEy0YnEXQL/EDF1WQ+4nySoxRt22Q+6rQaaHxe0/eoybJHfTXwM0RLNNWQrSMdo3ZOZTnfvBVxIMj8dboevfBTsMB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZL46lJoq; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZL46lJoq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJKqcNGB/jstoguct+Owpwpn+jrsqPk4ZFwB85wMY/KM4t2uUI5b1BgWPASDb4XMNj1lodIkQ8VZNEoGHKXl1IIvLHgNYEi+POeIG2+9wojcao7XuzsYbyTdetZnl/VbhzIpQotc3Rq6S1zF+ZJI6wVXwqOczwECR0TU6q3Oo3dcgBV7qvmToBOhkdxS0HReFZygodNoOUBDjRbyPNPALQCkAK/WN1rzoTOODus/it9iGwkLEhKgyn0OToJJMglkbfZ8hD+aN30wXZbC2XFQfRrkDYk3J+bqsWZkluB4K3llL10mO9C0VleGL2BaQJQCPZiaKTZQn+HXLaXcODuoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4hXI4ubeqcuJFz50myvY4kAVdoDpfClgYlnevqw8oA=;
 b=HnL3pVdAH8TjSXNR9HIYI/QXYv55w7EaGL/pAiy3k2TdX94kzqEEOdAp8dwe8WjKalyqGK9DqAxXko8d2TQaUMp3LftkB8WhZIUda95xpJeag/EmsFH6UAu79jxbiPxdNUAQrg5M5SPWtugBpozOhZUvweR1oFK4VpziME9F+i3KOHu1XP3Y2z7eJbJKThNAWF3csKWUDImDngvxr1BWkisPWPPBYID/JYTdTkYISKX6A2YwtMUj1iO1VhBUF9NBo9/wlN6F1VE/Gz39WAbzBdDJGZKGvjXiQKTRCHJBpeT0julQHtzOGvO0hiQIMBrWYbG2T/ZQNW/2VDIB23Qukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4hXI4ubeqcuJFz50myvY4kAVdoDpfClgYlnevqw8oA=;
 b=ZL46lJoq0m16E1xlvcF5BdAW89ki6BBsvT35n92rzICgLnpPy5okDDau6swXGfQdWOgzN2S6H0rScxhxJ+ynT2mJXC7Ap7s16/y38D/SwUrqxIkeTHG8b67Mzp7TMNdk7e9PpIe5sVrPwqtsFrkQqRRyb8AgXLNqCidCG/cJARfRoveMpzxtJoX2jk/JL/jSTT2QiONr8oJRwjXjCt0qKUCEkb1p7nxgezKadUWLPR2dUZBXHSuutjQexxxA6vEQrQradq+k2CbQag4X0JFUSmg97KfNDTwdstXRYwJMStoHmNEClOQxt2KX2UTRvg/IftA3A50iMiD+OHqqNtEa+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB10053.eurprd04.prod.outlook.com (2603:10a6:102:387::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 15:05:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 15:05:03 +0000
Date: Fri, 31 Jul 2026 10:04:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, York Sun <york.sun@nxp.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCHv2 1/3] EDAC/fsl_ddr: use devm_platform_ioremap_resource()
Message-ID: <amy5lCeSFyvmGixj@SMW015318>
References: <20260731012130.1212640-1-rosenp@gmail.com>
 <20260731012130.1212640-2-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731012130.1212640-2-rosenp@gmail.com>
X-ClientProxiedBy: PH0PR07CA0064.namprd07.prod.outlook.com
 (2603:10b6:510:f::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB10053:EE_
X-MS-Office365-Filtering-Correlation-Id: a8962819-75bf-4f8a-37aa-08deef151969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|19092799006|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q+4ebkF/1L+efTCDXTOy9BGeAlp0teFx1y7tZ7nY1zY+R+RPS6pu+2zVbSMLqAiKnw6yVayTGG7gU96EAVrZ3Gnr/NNn+0QARaxnKhthTRrul2mJnZH1U3wANghjsv4Z3As5lIVorCvGXwZibXoLHwD33gFqRk8utwhE4479tPvnoUrGJhTNr4RuxLGNrcF2QBemvJVPNIe1qA4Ne6MEZir/hIticOHGfG4S2Cevg9+eORMVkvIMQ42EDgjERSS3tWaev8dXr8Ust4OTW8xHo8vNscpxeZky8JjLWYMKLtiuvv5yugLpW7NW5wMFxxMhETbaIimO2uOM1KRyAlBdYhkJs+ipd2O0Czo+RIKSFtPfH1FEqUuP/Z1cbAr0SARALSBPfV+1ZvhWiDCRGXSn4oWYEb7DJYQi6EqTfA33PQo2MfkJIeBlwgBY6gEccS2/20sWdNAa5ZO4cgrGOnC8Qk2hFMLt0oyJHfpyWjSR3A0rUO8K+z56jcrCptSjGbZAvtMIV5u6GRbWkoc8VnUkCQiRDQOmAmL+4G74rD+6BI8cbOTlNdbAMFOR6knPkq8SzG1n57MCN5x3fr0meSFTTKsJoiNgVCpcgjoSK7ptMnPtSciMRzSOSBgs9jeyEZcI7xeZRldINxuMX3l2W0+zZCA/CdX5k1gbXSE/VsuTV6w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(19092799006)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qwskyfLBj2orL8ROJuZM2dDoLcz8Td5EA3o4bGO/h2doPOIU78Wl0+wkiam2?=
 =?us-ascii?Q?lVo/QTMjOWiOgKywhThDuHeYpgO/F+gbs/IjvHwFsahCQvXCOwHFyU9Ifmel?=
 =?us-ascii?Q?KKRy5e7V5b3gsi8HZre7urETi9LOVb3/qpqA/gTnMej6JPncw0UuLYLchyDi?=
 =?us-ascii?Q?XlaEJLkenRjxq5OzCenQ+HAorj6xXZSdTxc5P6CWeCV15w1QKG8nywQZFfY5?=
 =?us-ascii?Q?vySgN7xrZchzj5T72wEXrPutua0GahQg9dENf7UL5b3a/Xekd4nVlfz+R5zY?=
 =?us-ascii?Q?Cc0qDhXLZ5I6EPGjjMLCamV1T3GRNBKnH6ps0lE+FBhXbudIlDO9T3cY/ZrS?=
 =?us-ascii?Q?F4zv29hi5lXR4MrWF4DD9lg/O+WDvYHG2S2C51ylHyqNKPwciO+3i4/7fUPr?=
 =?us-ascii?Q?TuCuvHPNMp3xj5cq9Wxxbs+46pKe/mF4JUy7Gky2PpS4mxvd+LNIAT9aszK0?=
 =?us-ascii?Q?O3Q1CvnCL+ihPhPeow4zniNlLE3chSg3RNFtXG/IdrmQWCB4PyKgJp5rzhvE?=
 =?us-ascii?Q?yRK9VKmGAhcmaaXSH47eIOeyTXLryJgmo8DYFIlkLmJ6uqyxZVJGhiaiaQ1s?=
 =?us-ascii?Q?RPxm0JhqryW0i8Oj9xeK72o8MblucYVTgqIJApDfi7Wecg2yrOfcDsfBzy+D?=
 =?us-ascii?Q?sbleKmGD/NV5To+43PKzzJCXXsesZNZQXdzYfYGl5qWdE97os0S4eW/F4mKI?=
 =?us-ascii?Q?6lQKmpR0wpmCFYnn8QEvRXlE3H38t58+uXFAgsCPwljkDDOpvHMYUFXsUejB?=
 =?us-ascii?Q?HL+JIhdMxucc25AWD3zrMMyHoJEXP5HH+kheoVDqJS1Z+z4VGMLCtXYCR/UO?=
 =?us-ascii?Q?emQbke7s45OfPOd7RMgMbdjDszPxViI7mmWof0AFBEAiZ1cypkoAx4PiTrAf?=
 =?us-ascii?Q?OKO1/h10SE3iG6GXXOMjeJzSV3p2LN71DwIx/gmIWhGLVyttmYmcLa35cDyx?=
 =?us-ascii?Q?zaQb0fUmpLSpK3vevxkk0cxAMmIymIxERCRkLEbjLZOyTUnuekX7xIIMjvaG?=
 =?us-ascii?Q?QyCXTCef1GfyvhaC+Ndeax3x9Tvv1vSlIUUQloj2cPClsRMjrtGwKsZdspbj?=
 =?us-ascii?Q?w+h2IwgdWETXsGNbqi9CVg6itvwBwefmptLNDMg6qvaEkzUaC8r3qJenp+ol?=
 =?us-ascii?Q?5/aP4TFBF2datjdL/Ew+8FydJ0NHpIsp5azL5Nqxw09F+rmbKiGs473MK2Jk?=
 =?us-ascii?Q?ec1h9WcjhlBCVjQ8ydAFcnAR/hM3u+AHl3X66t/gg0ImLMTv8ZfenZWqnDYc?=
 =?us-ascii?Q?FO/mF3mRc13FdtcKjpGZ2cPe1//DuTfZW/JMJf3CmZL6r/T3O8OIgfKKFV2d?=
 =?us-ascii?Q?TQ0EGhHKiqNuUp1Mpgko+OsRS6tXGH8gS0mLx7z43Y5YqfrjYsLrl6aRVimT?=
 =?us-ascii?Q?sqUeeEbSRt7hLd3O4hnX0eVbcxrKGI9GNvc1q4rS+9f2jY9B6aVXOkDGq4yQ?=
 =?us-ascii?Q?HDy4vqfGgAAHbq5cGZKywWez9ynrFG8Be2iXdq+aiiVlCVyj1NwYOWkbSWqU?=
 =?us-ascii?Q?AAfGC0+fDu1uIj1rSLH9AVfFvusBvgnlFISrptBlLfi0kIX1yOuhz5qK/itG?=
 =?us-ascii?Q?C9kWF70FwbsbVVW3de8tFMV2jTz/FoME0u2SD1bFMQ6PoGIBmcE3nxmONiHQ?=
 =?us-ascii?Q?qqZtXo6vCLTBqpB1IrSbK/1U2u/0y3JDWOjRGG5+fbDYiTvYA1psH2oUG/o4?=
 =?us-ascii?Q?IF1JXfRq8JbmQt6y4v1udUiLVtg7I+eJkNTgsx9lvvH61wcaUknSofufsXGI?=
 =?us-ascii?Q?mu8LXj9TYqLRYUmDbaa1Q3lAtBlpJWqOG6nOehHumsl7xs5tfS2b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8962819-75bf-4f8a-37aa-08deef151969
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 15:05:03.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/6MrwF5B2pm508LfHKvPYdr9yKr9S15aDwZTQPjWVYdvPZonWs85G8jbQZXEM8uDFBMpkQgcKjWzKyEc2Ywpatmo6MBxMgt11mc+ZPZj5/zhI5ht9IDXXI5hLhF5Zwn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10053

On Thu, Jul 30, 2026 at 06:21:28PM -0700, Rosen Penev wrote:
> Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
> and devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
> the resource lookup, region reservation and mapping into one step and returns
> an ERR_PTR checked with IS_ERR()/PTR_ERR().
>
> Behaviorally equivalent with respect to region reservation: the driver
> already reserved the region, so the non-overlapping reg requirement was
> already satisfied. Drop the now-unused linux/of_address.h include.
>
> Remove devres stuff. Not needed. devm is already used.
>
> Fix a mistaken return code of -ENOMEM when PTR_ERR should be used.
>
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Need change log here.

You missed my review-by and tested-by tags. If you delete it by some reason
like big changes, you should said here explicit.

Frank

>  drivers/edac/fsl_ddr_edac.c | 39 +++++++------------------------------
>  1 file changed, 7 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index 2a545e5812e7..3745eec67335 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c
> @@ -22,7 +22,6 @@
>  #include <linux/gfp.h>
>
>  #include <linux/of.h>
> -#include <linux/of_address.h>
>  #include "edac_module.h"
>  #include "fsl_ddr_edac.h"
>
> @@ -495,13 +494,14 @@ int fsl_mc_err_probe(struct platform_device *op)
>  	struct mem_ctl_info *mci;
>  	struct edac_mc_layer layers[2];
>  	struct fsl_mc_pdata *pdata;
> -	struct resource r;
> +	void __iomem *mc_vbase;
>  	u32 ecc_en_mask;
>  	u32 sdram_ctl;
>  	int res;
>
> -	if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
> -		return -ENOMEM;
> +	mc_vbase = devm_platform_ioremap_resource(op, 0);
> +	if (IS_ERR(mc_vbase))
> +		return PTR_ERR(mc_vbase);
>
>  	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
>  	layers[0].size = 4;
> @@ -511,10 +511,8 @@ int fsl_mc_err_probe(struct platform_device *op)
>  	layers[1].is_virt_csrow = false;
>  	mci = edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
>  			    sizeof(*pdata));
> -	if (!mci) {
> -		devres_release_group(&op->dev, fsl_mc_err_probe);
> +	if (!mci)
>  		return -ENOMEM;
> -	}
>
>  	pdata = mci->pvt_info;
>  	pdata->name = "fsl_mc_err";
> @@ -531,33 +529,12 @@ int fsl_mc_err_probe(struct platform_device *op)
>  	 * Default is big endian.
>  	 */
>  	pdata->little_endian = of_property_read_bool(op->dev.of_node, "little-endian");
> -
> -	res = of_address_to_resource(op->dev.of_node, 0, &r);
> -	if (res) {
> -		pr_err("%s: Unable to get resource for MC err regs\n",
> -		       __func__);
> -		goto err;
> -	}
> -
> -	if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r),
> -				     pdata->name)) {
> -		pr_err("%s: Error while requesting mem region\n",
> -		       __func__);
> -		res = -EBUSY;
> -		goto err;
> -	}
> -
> -	pdata->mc_vbase = devm_ioremap(&op->dev, r.start, resource_size(&r));
> -	if (!pdata->mc_vbase) {
> -		pr_err("%s: Unable to setup MC err regs\n", __func__);
> -		res = -ENOMEM;
> -		goto err;
> -	}
> +	pdata->mc_vbase = mc_vbase;
>
>  	if (pdata->flag == TYPE_IMX9) {
>  		pdata->inject_vbase = devm_platform_ioremap_resource_byname(op, "inject");
>  		if (IS_ERR(pdata->inject_vbase)) {
> -			res = -ENOMEM;
> +			res = PTR_ERR(pdata->inject_vbase);
>  			goto err;
>  		}
>  	}
> @@ -637,7 +614,6 @@ int fsl_mc_err_probe(struct platform_device *op)
>  		       pdata->irq);
>  	}
>
> -	devres_remove_group(&op->dev, fsl_mc_err_probe);
>  	edac_dbg(3, "success\n");
>  	pr_info(EDAC_MOD_STR " MC err registered\n");
>
> @@ -646,7 +622,6 @@ int fsl_mc_err_probe(struct platform_device *op)
>  err2:
>  	edac_mc_del_mc(&op->dev);
>  err:
> -	devres_release_group(&op->dev, fsl_mc_err_probe);
>  	edac_mc_free(mci);
>  	return res;
>  }
> --
> 2.55.0
>
>
