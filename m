Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABD303CAE;
	Thu, 16 Jul 2026 04:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174470; cv=fail; b=C3vrOxnydotAJkFP3svtDmrpgvvyXvKSxlGl2eLPrvXDAR2tarspjGJOZjJnjKWIbfe25m4PaU1TQTPrZxjEkmpQlqW06Hubzz2P5XSPVrvHs4LlEOi0eITZI8Hfa4jpXjEO3jaWVZJwntsMapGJQc8I6Xi1xitUtEuxcuQXwtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174470; c=relaxed/simple;
	bh=rOXNH+rJlSl60BOg6gOaQyFfal67aY5XsGf+uLn+so4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DxgFLgvKGTQhKE3dInewzYOxEgAbXzVa1EUF9G5ZNij7WFpsfbKA8F8baO2QJ4Pt2aAX1mxz5Ik0a8DTOd2qFRCwEOxCEBOMQlQD/DuZUjr7i1EKsxS7CGJTAA8dnuUPot/AY0+lphOLRouzW+JmJdUxfV79npXOBf+eV2McRHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aHT9wMB9; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aHT9wMB9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2snZjmVqxMTPyLMDQY505jJ8jheYSexVJjxB2f6wvrJJ99qriUdjarn/dmtgEP7v27wsqI9IsnF3l68JIoNpJUcLKQ9Mr6SVnSQdeTNBwe1VDT/u4m6SKTr9r1FBktbQrGnYSLporuj1cRRhSrxEb4Z9NbUxuhDJGDwkJLhvbpE+ozKgiKZVSMIPnlKm+ptWr2DrwuDZrUZIjXS/9jQEzrlgIfja4Og5Do2w/zEwSRuQie/hdA+4INcn+EQPG5Fe3jOIF/LxbElNhhu5mdheMLdzzIM9hfZzd1slxETWGhfglpgFKiMk0twh8pzKivKznpO97xibXB2OrwloAGfBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lkw3JwrxvHbs8v+ZeBpoOgwcCZbGF7uno+3CGIuesdg=;
 b=f0UfpgUALnC/SCEdsA9KrkIST2u1oMT2n1/+W2wioCTHwlYk1ML0w5MNLEQzwVngAoUBY5olZosUFfCj1yPKTS8VazuEHrFR3n2CpV2rvTvTvDkACUsO18aySdmRgJ1rWmnO8XDfh0lO/eIVKI/PxFqqWiSgW+ob897gvmRZj9IbLooM5Bh7TQBquv0F3I9/m5ndVRE3/qiHQxjyDsdTMqgjRlfK71EO50T2DtMVZmiz+ThaM71/FHyZZ9D4kjAa0B48JkLHjQl7S3jWCRN6Ts5Xfct/v6Pm1yzp3irO4r7atSst3EiPNd9fQK6iHWmWKqPOxHpSgyNQURjv56viPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lkw3JwrxvHbs8v+ZeBpoOgwcCZbGF7uno+3CGIuesdg=;
 b=aHT9wMB9DwsnDNX7GZWd/F2rSTSGKLrpZ1xv6NautcSh2K/W4asiIJbbeTalPFujFwUpRus49CryDRJUIGlHErzeruFhTNZ/SItHnxMdVgGfq9A2KCPqKl0b48A42yTzy40ALiUAc+0rVq+z73IShKfPGM3Ftm2VYwEujUrXflqZ14emvjS81emcmq6xJ7xnZ3arSDTdj0UITZ2B4IJnvgpBqrKGmvA9p9qO/Pb8QqC6/3AGW1q4e52fAOPWrHFqHVIzlmlKtCdGY0M+jZqRqjCWbS2UymiD/D14by+XYwmbfHVOG3U6OEuHGiXPF/fnL/X2M+BxYnlj5CvshY+tCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10103.eurprd04.prod.outlook.com (2603:10a6:800:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 04:01:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 04:01:03 +0000
Date: Wed, 15 Jul 2026 23:00:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
Message-ID: <alhXciS9G_bGB2re@SMW015318>
References: <20260714234609.902367-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714234609.902367-1-rosenp@gmail.com>
X-ClientProxiedBy: PH7PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:510:23d::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1ef264-202c-438a-af90-08dee2eeda95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VJ9h0CULDQ/LTcPaxQhOAXbn2G28hJswlsbv7vUttQ1fDKqNuZJjN5ovB+wGoCcPfvVSIWidIjROo2z0FfEwX5ANwZINymU/H83xPwIkuJctvYzrB5dxtBEw4buELAuXhWhgh1GIJmQE3zL/IT5+a1yRfycc1KdYeUmvsMOotG7ZFgBVpPLMua3LV0MMod5qxj48s45R8Xnwlo+HSekSrCbKSYnR9AeoBKQ+n4PhqJiQxY5wth5y40A0fLArRSOgkKkSZAClf+MJtsigRNgwpZlxU9jWBehkqEd4IZGgJSnBh9KHwrXdOPWucsB4f1+dlQT6NWB+q5JJvMYMllFcZuIJLU9BtS3R1Zsb8FM5EYaLyD3S9qNNLcRk+3fjDGMYr0Evi8O/jTwyWdl4eLPAhzYR9a5paWW4g8yjG5GUkHymm10wmoj0K+BqMkCYLOtbOLi3fXziXr1rSiooFAdbKGC3jqkJx99Gv/hIAhrdW4Koxy4k4z9J8c/wr8PZNf55xBIFp01U41nVc+cVMNRlbDUwzFr85dM9Z++Wh2wefHOO56SH6ZI+mpqVI5uUPlt1DncK6xOZMeiTUEtf8LHojXbHc+sYWGT9embd5zALzTNj9Dmsujl0IjQ/vKTvNXzgAShFD4dyK5pCzqB2sjVezbcJ3oCQ/62/qdlfo9HwXko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ASltFcymfwu8VO7vXNSMhcUjAnzVSotiQhn1LhzgRFQ+KLGwjyXoMZR2/KQx?=
 =?us-ascii?Q?3JIqFxCJL/ZEFMfBQhjH2jhxQy5OXI52+t/Dt4tjfzwsAqn627HO1RelGtIi?=
 =?us-ascii?Q?RW2CaaqN2cxdZ0ijwe1C3rTaVngEjlTkl8nHZ1SeiLubZg3iM3nc3oT2MKOM?=
 =?us-ascii?Q?E8hYLQP2Y5kkknsIXnxxTWowi/SUUYTSR/cc5+TqzeeQ5BPteGP8U1SbUQ5s?=
 =?us-ascii?Q?skXFeIc6xQxDAV6LfJ42krZv7fuw45jhLYKTTgk2+SaviZkCtC9FqhSgpAeQ?=
 =?us-ascii?Q?3RkXsu+0qpsP8+c8FW1SAT5uSEy5Mlw/p7BQYk6zjK1vysMQMD4W0K4B8SYl?=
 =?us-ascii?Q?TPlwOkwrau0x24SnOnXNi1xbt/r7Oc71BQqUC0PiJzNo/YPC/KY/9YtMte0d?=
 =?us-ascii?Q?mm0aUqjtiqTugX6esoM0326gDzZlbuVQDuMLjuDKB/TK6NT+ugHd67731S2I?=
 =?us-ascii?Q?s8fl5JgnpHEbEo2HpnS2jDNzd5i2IjaaFvEeTJmcqOZpcVacp01dIxYDF7rE?=
 =?us-ascii?Q?FrDVRZfZUDwbEXxOPu+3DulToWiYi7fGywQ+jbxEP6pxOedJqwEX06VU9uBL?=
 =?us-ascii?Q?BIPfFg8nhncuADpwF/go6mVCiZjIdPhhGFFuByVUQlT1NKOvONF7OysIFyY6?=
 =?us-ascii?Q?FA5v7R1HVoryqu4vYeV5Ob7rHLpwta09QKBR80a3lWdrO7ShCPClqpN19LEp?=
 =?us-ascii?Q?n/5HUcCkc0+BqiiZz93vulLYxfIK5ADrvo/3afMSOOnIY4aV7RLQcTECDVqg?=
 =?us-ascii?Q?dFPTrYIt7Qt0V4lfsdneEz/QBtV0ayZcyp4Q/r2olyT9x1rrJeMNEdaT2tYN?=
 =?us-ascii?Q?PdcXFZOspA0W4O1C3n119lWW6+NsHE6keOOH40RaAzmpqPWy1ZoJCYCRA5f3?=
 =?us-ascii?Q?qyMf7M+jAm3U1k/zxOF3qHYmJHKJ8xCEcCUjaniu6BgPer0hBjh0shBPEaAt?=
 =?us-ascii?Q?ra76Q1dFTAGtx5lpY8FtHso1zSua8aLcPtot4HcTvXh4EeCAlTm6ilfbOE9l?=
 =?us-ascii?Q?OD0+Fbm8/9hrfa8DV8pHUg1KbWtYV63QWJHpo7HCNGJdshtvtQSqsEp9sXfK?=
 =?us-ascii?Q?pa2gonHS9OKVyD7FwDk+OJkT7dD08mQbjRJepDBPMyD0zrHkDLVpoxsI4FwH?=
 =?us-ascii?Q?Nz//9RoTT/BTsuEHBKDh0UgIvBPLpoy3jlY7HRMtpeF2xGDDY7df09XtsP+p?=
 =?us-ascii?Q?t13y38+UHCzeH8NocKaON32Wv22GSlJfekw1t5sIx6v5qHaM//0IVgi1rA9y?=
 =?us-ascii?Q?ZdOr1VIF5P93sZpDUuFQhQoSfTmnli/hfDKy1EFhvkU7jvdJ/E33cuznKqAZ?=
 =?us-ascii?Q?Px6UgiZLCdoClwChTO7M7GfWi5T1dHpMXS5VArpLBX/6fw3lRv2lrf6ZMoOi?=
 =?us-ascii?Q?yNq0PyPFa95OHuI4aGa+TeGQBqjZjlKX2lkPURhbIfkToGIX6zZmIJ2PYxlR?=
 =?us-ascii?Q?QszmSBBWr1fdNX4GbKEtInr44kJ0QVklWqy4U2ABQJzvd9AhXjg6+4O8JvF7?=
 =?us-ascii?Q?VgojcqQtLNjjnkI8JIv38gjDp/s7Mb6P/VSbnKjWDJJtbiju6tNBCAhmyNEn?=
 =?us-ascii?Q?C5PG869QzvOoV7gYbEZfuOjRovHcC8aLbElaFAhEq1BN/szxeohaqhuhfFQI?=
 =?us-ascii?Q?TVbbTFEb05fzNZlVg5B+ljplqIx5aYkbfGHsXIKyrJAutU14GSDeZKT+yoi9?=
 =?us-ascii?Q?DhQZE5dw/D5ibu7X9xDtG6s2POLTzfUFJ3rOKWpnGgpzGS6UleaSmZGeKzLt?=
 =?us-ascii?Q?M804ESlCD+F5QGSOM/wh1jxGR5xfRMMcNGQg6Ha1aso5VLSHrh1q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1ef264-202c-438a-af90-08dee2eeda95
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 04:01:03.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqPg0fE9+M+eF0y252yX9PCw9pQsuVIbhj2LLe6gQWIqxT+ELA8IPjeVoS1D+l0zyvAHqI6oHsgTTP6ToJ+eI7v+1ejqTqLSXIAZB8/yc/EVdVpb++ysGozUEQIOMw6S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10103

On Tue, Jul 14, 2026 at 04:46:09PM -0700, Rosen Penev wrote:
> Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
> and devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
> the resource lookup, region reservation and mapping into one step and returns
> an ERR_PTR checked with IS_ERR()/PTR_ERR().
>
> Behaviorally equivalent with respect to region reservation: the driver
> already reserved the region, so the non-overlapping reg requirement was
> already satisfied. Drop the now-unused linux/of_address.h include.
>
> Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
> drivers/edac/fsl_ddr_edac.o compiles cleanly.
>
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/edac/fsl_ddr_edac.c | 30 ++++++------------------------
>  1 file changed, 6 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index b27dff96aeb6..ae1d54434e38 100644
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
> @@ -495,11 +494,15 @@ int fsl_mc_err_probe(struct platform_device *op)
>  	struct mem_ctl_info *mci;
>  	struct edac_mc_layer layers[2];
>  	struct fsl_mc_pdata *pdata;
> -	struct resource r;
> +	void __iomem *mc_vbase;
>  	u32 ecc_en_mask;
>  	u32 sdram_ctl;
>  	int res;
>
> +	mc_vbase = devm_platform_ioremap_resource(op, 0);
> +	if (IS_ERR(mc_vbase))
> +		return PTR_ERR(mc_vbase);
> +
>  	if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
>  		return -ENOMEM;
>
> @@ -531,28 +534,7 @@ int fsl_mc_err_probe(struct platform_device *op)
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
> --
> 2.55.0
>
>
