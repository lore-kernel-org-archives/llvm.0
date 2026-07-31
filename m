Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3144B3EDABA;
	Fri, 31 Jul 2026 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509848; cv=fail; b=a7EJtQTeoNXbVipYE8Al5+ojpzDKi8TeFtXPS/TR4NAcAKhSLUroChLKZ45It5S0l7mj/9RaWeA3BCxxT+vQJcold4uLHSnPUSNpUgkvADx2gw9DaGRMAM2gb9/dCLrLhYHMD/uV4W8zsTY69BNOR9puIdnpRHsJfqiQXKScCJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509848; c=relaxed/simple;
	bh=v36piVpC0wdwGrDDFMyajFEgJZ9WxfhkBQXvYBqnO0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QDC0D0eBEEWrW2omx1ueLeJ38uZ6KzqGW4a0t+Ol7miK+GHryMyNCkEAz1FKyEv5Mc/1y5VE8ce/Io+9P9GsYkqNgjRrehITh80l2bfQLYa3ZksKPQF0c9rpIeX/1CE6wT89iRJKFc7f8O+DHPFnW/CzTWl6I4kyaBKjpnZtgEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XKRboGYh; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XKRboGYh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Havo+NQdCWTeUKABxfooylyChtj7rp4p2swKiEH88MLnlAFQ2Rd+tc3j23Y2sTMbS31Cub2YrZOH+hl6C9uRSQoZ0sd0ignQf51TzCw6stOa2dZaDTw4miWUvLa5SEsFNr4ii5vUWrRU4589I6qvtKeKP6iF2pULTshXAYI7NyWLZMOH1sYSNNErp0D207IH7UDp2UL/E47i5Ep7273i/dFysyHYemn3k2NGwJmGwCrUwwNdmtMWYhr48HLTNOZh5BzSNmezuoYZiNB8AahywM0kNb9WlsR64uOthKGOli9u/EgXHqrvAYxyU7Qg9aCkCNIvqn9OsXycs0HiA3RvwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfj2Y37wagE5VlVR6K/WwiwnxLweChd78pSd/7JnzwI=;
 b=oNUfZT7huDL22XsL5KtXK7IsZW7zTYwwhWSWG7ZuhXGntR92p02mZujFWm6efwRzXMwdNM1Y9/jz5Yj/sMco6U/uMpzoWpMpS7+BKltZ9NF451KueRxdyjut4VyzhdF7s7zLklihrM0MaTj33VK7uZV3gU1Py0azb5jikGY2U+vcri97WGnMxTK6xO6LPh50L5VNy1sfZtjXnW6cdrBKEQZdtrZY7D/3G7kddqcZTklgXwNUf1j8CiHfmIGo8AK+3no5A6UhQILN0PEwNFwpghi/UESfLK6VuY2rcTYaldEDYeUlOMbTUva6Zg/6Y5X51oN8TEWI7ajcdtsdZfhu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfj2Y37wagE5VlVR6K/WwiwnxLweChd78pSd/7JnzwI=;
 b=XKRboGYh7Smg59kX47ejoGkLqBW2UdY4BzFIWdUd7tmVv0Xzv6JR4NVxsADB68Jow3sddoAj/lEsaJRJQ0VNE5apCBY6ihlb2TWuc+ytNqaYuM2DIo9hsIP1yplYxezxwlmJspbfagTflVkCgVqv7mL3MWeib1xNMDj3/8pbi8VEtLflYJEb/6pm4H0xvE//TK3oFbiFZptl986ES//+pY9zU1uiObKTxOmdXSJSIxfFKYnPbuSKfVZhKkwuKf/DwEBxIt1UCvY84hSi7DUxtXShRLLLDw14vysPrqEF3rT76a1HAmraE25tXqkzx7ksxForYb1iGpEzEAk/WVN7Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB10053.eurprd04.prod.outlook.com (2603:10a6:102:387::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 14:57:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 14:57:23 +0000
Date: Fri, 31 Jul 2026 09:57:15 -0500
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
Subject: Re: [PATCHv2 3/3] EDAC/fsl_ddr: restore MC error registers on probe
 failure
Message-ID: <amy3yueMqBFVCz3T@SMW015318>
References: <20260731012130.1212640-1-rosenp@gmail.com>
 <20260731012130.1212640-4-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731012130.1212640-4-rosenp@gmail.com>
X-ClientProxiedBy: SA1P222CA0111.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB10053:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b70b8a4-6c6d-4f87-56a1-08deef140735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|19092799006|6133799003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8ZifEcMdJK5b/W53MZVe3c+4SNrCfcOOJB1DwjomEOxF/nSzsICBppUR1hDcglWi4BCq+g+R6cpco/XdmDV0H/FpqOHUAaK4uBI9B+2BqdcR33BIvmT0qc11Zq9wM9ppu950fxd0A4husDGMoKEkLj5n8W7/W94HKAwGXYo840vjHAdGHO2mFb2/sDx2bLXRnBqMPW1XDW5i3GHjfs5dtynzuk8D4FBEYW8zEG2QoXB/v9ilYec9/exdITO/ezKxrg50d5kC+D8pEjF44Y+nQoA2QlgEz2qMFXNvmQ8oEsL9O9XgoHvNoXxrPR34LiYD1tnI383+rEHvxBP1OlArqPy1M0Kb0KHEQ5wyk3j9Zn9rDVBa/N1MDgKF1UcIVf8D+DmA3i7OMcM2Ktmp+BBf6aV6pGJlK8tuJVgt6jnYnl5PJbs9pM7rqzalkr759C24dzLXGOUXLXeGaC8gAB71A3NvhHp7/r8T1lFKBehKLW3Xq1QRp25pTBB3/rbeChgMIBnQ27PpoQwJl7+jwSw8ke7Pu+jI+bcR4cvZiBVUQLVgP3YrzRYklEdPFBfy1e6+Gm7oqfwL3ZOySN+6fcD1GL3czDRIzsJA0JNP4ON1Jk2Rm/3IKbLrEBXwNpqQhhh0jsBhuTIpv/tZBQQe+m3P+vNRtiJCpD7QQA34oPXGuyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(19092799006)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2zgm7bSc0K4PojjsGXdStjJCo9r9WkmWjpuMDMpSTSCM1vSPLe4upoA2ZpC/?=
 =?us-ascii?Q?YX8mk6w3+/zLCxcQc2J8P79pty/rnkcqQWxTmNFjd7iDD3TpTM22q44G0CcQ?=
 =?us-ascii?Q?rhpbypqtH2B/04Jji1nWoXnRYjujdjfhKiuXBE8THTqEIfYFoSTwYu1Vdf6O?=
 =?us-ascii?Q?iTOh2CYjXUpJ+yKIjrGOqUwm+Z6FSihV7Rzziv76RtbXNOyKN1rCpU4vTyzG?=
 =?us-ascii?Q?+TyGWrcsXk3eZVe6iS4oEpxGoTKnRLP2xOzeSozWfJ1g/ahjQ8iPsOP7HjME?=
 =?us-ascii?Q?exgTcS8nGKc2cIKpCNG+gN+Af+unetvFW3VbaA+CJT1xNY4EWJrBoy1rTiU3?=
 =?us-ascii?Q?X38QyKRFQCdBDkYIkDGdZdaqj3hxvEhwug7WzVD5UdUVfwmlc2o9J1DnQUxI?=
 =?us-ascii?Q?G8Y03zZcsHKVxE4CLAysRp8VIhma0WT1yW9GHX3RLSaCIkrJ467waVvvOzRJ?=
 =?us-ascii?Q?PsuNSUY/sqdNolZ3Zy2wwjFnaCy8gYV6HpudIHWiHOF+/wvIR0YNoyNLd8dz?=
 =?us-ascii?Q?FAvFTgbspgq5EDeC91n2oA3qAYQONujV7Immc7bMXw7e4rvZS3T0LZhMPsFA?=
 =?us-ascii?Q?gth8P4Z462ydq8+vxZ+AIpt4VPd9z3JuJJwVi540G9On2S3/0Y8Q+ohGdqHD?=
 =?us-ascii?Q?G7d/uMVQZwwip2K5EokH7WsCLlSMRDsXWwnS69byz7Id6V6SyFCGbMFVZUFB?=
 =?us-ascii?Q?BH56bb6DXTEbD/4SpqsN7AX3te9v+yJzpqNvrZ0W9J8LRhzphmUr71m3DhEE?=
 =?us-ascii?Q?CT/nb4hpIdZVYn18YGSdc/RPdIkfN1wiWyN/fhxPzRUCEIjKhfzCTKemhtUQ?=
 =?us-ascii?Q?0jb3OMqIKop69nDI2zlJ/nEGGsFP2qo0x1y1fDAvqWz+hqRocFeAmuTgRmn3?=
 =?us-ascii?Q?7ONQECzomHvYQ46+QTA1841VM7IXT+U0+WZXNhVtrJbcXAWPrrCxKWQSzWU/?=
 =?us-ascii?Q?i1z32B7CludsEuJsLcI3AL3gNUIPy8BDqFD3iDE8ODzNQHdEczgnMToD5ffF?=
 =?us-ascii?Q?4Ip0Bzub1yWUl91zD/tak47w270Fm3FzvaiQo8877CTk3h3Ie/klTlXW+kRl?=
 =?us-ascii?Q?ZuoPvrO+3bFQTay7JBS4fAeV3KpANgjEwA9DjLfP/fPIuqsYBajFZXzTde+Z?=
 =?us-ascii?Q?6CRl4mPQpJJTZ8/gAoC/aROSzXD/+oQDhShbLJBKpnLqQaXUl6Laxr+eyo5c?=
 =?us-ascii?Q?/vauF7ONGX/JMQWk/kgUTpYcniCaIMyinNlo5OAZZEgCLdSXqIxXlmBsMY7q?=
 =?us-ascii?Q?hnFA86NjIa6pCe5KRBKpqVawsmJSefe1WkkFiDVDvpd6X+c7mrQ1A1VwgNst?=
 =?us-ascii?Q?I5YJdfeSbdlvh8sK2OUKbghSQQrKwaWHGMg/UXuos5J85Wwa4DU1nit3K8LA?=
 =?us-ascii?Q?X111Aew+eW0LaDFz+da9eF4Pnz+TlJ92+CP/d2pQnioVZTibIiOrlNMFKfbQ?=
 =?us-ascii?Q?ijwl772n48CwdOl3GXI4ID8SqeoZdH1YYZzyDjY8sG2/fokb/jXrya5STkTX?=
 =?us-ascii?Q?6PZ/ih7ehQFS0eUDBIcwWEF31LmJMjwwtHERGFN2pasJ66kQSiEsKjSTly35?=
 =?us-ascii?Q?mYx2CQ6WQPdIrbbvoQtSWdvMYozjYvJ+CqlQxuF0gBjnB91HVjgk8ls8wO8Q?=
 =?us-ascii?Q?jG+L2lBFiB7vAs4JbAF7cUKcT1vYRO18OiulyDz+4GfPnKOXUWdv815tCz0/?=
 =?us-ascii?Q?LxkiRuA0pnxryB+W5oh/UdLtbVh1lyhdBR3+4Y3HM+zAKkfpw9DR84fHRBex?=
 =?us-ascii?Q?iIEwOUJo9uhNv/RGHWySns7sYwBFXvWHxXpbPGL9+AaKxbrnhk4I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b70b8a4-6c6d-4f87-56a1-08deef140735
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:57:23.4304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: noVU/Bp/Kb7/Js94+YlR1KAB1qmkEpJz2/3Ka4GLHQP3ASTVIw3nJwauY40YUMcOFy6ROB7NdhoWxHQZBGL1BTnuge+H2w2MD/VGWUmAm5dt+9Se75sIqVVmsG/m54pK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10053

On Thu, Jul 30, 2026 at 06:21:30PM -0700, Rosen Penev wrote:
> fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
> mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
> initialization step fails and jumps to the err/err2 labels, the cleanup
> only frees driver memory and does not restore these hardware registers.
>
> This leaves the memory controller configured to generate interrupts while
> no handler is successfully registered, which can cause an unhandled
> interrupt storm on the shared IRQ line. Restore FSL_MC_ERR_DISABLE,
> FSL_MC_ERR_INT_EN and the SBE threshold in both error paths.
>
> Do not pre-initialize orig_ddr_err_disable/orig_ddr_err_sbe to 0; the
> err path must only restore registers that were actually modified.
> Split the error labels so early failures (before the first hardware
> write at line ~~580) jump to err_free, which does cleanup without
> touching hardware registers. Save orig_ddr_err_sbe alongside
> orig_ddr_err_disable so the err label correctly restores both
> registers, avoiding stale bootloader state clobbers.
>
> Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
> drivers/edac/fsl_ddr_edac.o compiles cleanly.

You can put this after ---, this is redunctant, every patch must pass
build.

Frank
>
> Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85xx")
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/edac/fsl_ddr_edac.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index c505fb268474..139277c4e2f0 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c
> @@ -577,23 +577,22 @@ int fsl_mc_err_probe(struct platform_device *op)
>  	pdata->orig_ddr_err_disable = ddr_in32(pdata, FSL_MC_ERR_DISABLE);
>  	ddr_out32(pdata, FSL_MC_ERR_DISABLE, 0);
>
> +	/* store the original SBE threshold */
> +	pdata->orig_ddr_err_sbe = ddr_in32(pdata, FSL_MC_ERR_SBE) & 0xff0000;
> +
>  	/* clear all error bits */
>  	ddr_out32(pdata, FSL_MC_ERR_DETECT, ~0);
>
>  	res = edac_mc_add_mc_with_groups(mci, fsl_ddr_dev_groups);
>  	if (res) {
>  		edac_dbg(3, "failed edac_mc_add_mc()\n");
> -		goto err;
> +		goto err1;
>  	}
>
>  	if (edac_op_state == EDAC_OPSTATE_INT) {
>  		ddr_out32(pdata, FSL_MC_ERR_INT_EN,
>  			  DDR_EIE_MBEE | DDR_EIE_SBEE);
>
> -		/* store the original error management threshold */
> -		pdata->orig_ddr_err_sbe = ddr_in32(pdata,
> -						   FSL_MC_ERR_SBE) & 0xff0000;
> -
>  		/* set threshold to 1 error per interrupt */
>  		ddr_out32(pdata, FSL_MC_ERR_SBE, 0x10000);
>
> @@ -621,6 +620,11 @@ int fsl_mc_err_probe(struct platform_device *op)
>
>  err2:
>  	edac_mc_del_mc(&op->dev);
> +	ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> +err1:
> +	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> +		  pdata->orig_ddr_err_disable);
> +	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
>  err:
>  	edac_mc_free(mci);
>  	return res;
> --
> 2.55.0
>
>
