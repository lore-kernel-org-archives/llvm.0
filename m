Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E3435A87;
	Fri, 31 Jul 2026 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509318; cv=fail; b=DS3YtjXTN8qRrat8EC708YFhfSCDV/v3wUnr8iOv4SC0NVnNTCr4tLI1NuAHnu2VCogHXNRo684EN6ARs7XnqWYrZtMijhHhgk3gkwhIk9VgU4l3vwiPyK5mvCELTT0AnBAioAgcPDmby5LYjlrTusRH0qJaN0ayXZVVZyztsDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509318; c=relaxed/simple;
	bh=/2Qn2YfX+apL9LqAxdNlQA420x0SWjYvCbwUr2qeSUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NBusvhYm/fEw5cWGVSXma8nlU1VMwoeFLZJ9G7oWI8ujX1TxQT+EFW9aUCT71oNdjLjdypZpEJiiHmz0hWB6WGHq/eyBYPGYA/G8dVK+Bm1fKZOgSJmNlzrW14wxfqpMDzZQHnypMgH4UVicgRW3Zzr4qX54q4g2zgkSNeb3qa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dr//mMig; arc=fail smtp.client-ip=52.101.69.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dr//mMig"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpVBEb5n5Y/tYRBbURsTns4SfsJFnvodK8MxKMgZutELpiIvBxAcgQhkhHqvM0wAuKnxINaKEB1inoiRQ6qtMUZIdraD9/D/8XZ3O9x63IWvkPL1shcYcxntx2x5bWUknU14zcyAD9MimkmQ9hWv3xEbYGwl8vNQxnEiDy3YVLAsoNYIjLKUrhpBaQGHRlg5oV6q3rFk3BgIBloSbLt+rueGFy/e9/H7SHs5mp1LnN1dw60R6bivMy0OxqWwSgu0n1eEh5nnmI7kQsTYapxG1Whu6EJfW/S6oCD4tB3d/UnlCmXxKBQpILsMFJLIHY6A7zXYcuPkR24ljybO0iQdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJ6aSFpLMG2xJ3L58y8fGVdC9qOUt1Xk9Sbbs3cgKaQ=;
 b=Gd9vRiazUm9oZDEaqEAdtNevCojwPL/N//o6/Vs8Ald4MbMV0+G38IG83pUo9weuGdm/L7mrXmr6p9vaRoeUobhlJN5r/X79Jf703+0ncBQK6DtlxObUehG6qXt+yHiM7eXMDwZjbVPGRK6fJKScrEbYSWHBuSpBOgTnX3rYXG6S4g43QA2jfin5O/LOSmv+bbVgz0XSTISQNDspbNs5ceuOXC4lngmiNb8EvdROOWxvOETJExpW6OoFCI10Vs0Kd39rxjLe0gdPMOLenBe0Hg0OLXORepPp0bP9vDBM9tOhwp+GJJUl+YeaDvwWFeUOH8sMGmFe78HojpwK1iuGzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ6aSFpLMG2xJ3L58y8fGVdC9qOUt1Xk9Sbbs3cgKaQ=;
 b=Dr//mMigeCjDsZTYG7MfA1qO4spmgOPCly9fxEhnySHeJTzeNdfWSvIWnvBBQO9NPIsgu1mEUyZdfGCtyczvU3/nBhc9tH8oA7IGVYN+yNvH1GLjrM2D8402z6nCYBrG5oKlVytNP4nuydEovh7cZGtpdim74za1FJ/dydLS68FjpOPB0XFQukSPK7fAHcis8TBS4XPBk8i66GQjFF9sfifde1HYw04Ogevj7iJA5QVg+dR8hIL1kvlfHcjhQuxmMJP+p1Ui+WnoEg0Hvyf8MXPNj9mj73TN5FNVDw+dB1MFtn4vm0od1pp47YObwaI5/mKkXv16c4ctjMhlPPrYLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9107.eurprd04.prod.outlook.com (2603:10a6:102:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 14:48:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 14:48:34 +0000
Date: Fri, 31 Jul 2026 09:48:25 -0500
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
Subject: Re: [PATCHv2 2/3] EDAC/fsl_ddr: use non devm for request_irq()
Message-ID: <amy1ubRWGB7_rViV@SMW015318>
References: <20260731012130.1212640-1-rosenp@gmail.com>
 <20260731012130.1212640-3-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731012130.1212640-3-rosenp@gmail.com>
X-ClientProxiedBy: PH1PEPF00013306.namprd07.prod.outlook.com
 (2603:10b6:518:1::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: e68bb9fa-f014-421a-02a8-08deef12cba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|1800799024|366016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Gs4pztHlrCvrfy/TGGYIncjFd9MrDk6SRgkbIhWNNowPXymFNc0rEeaLQYC9PuvRX/G7ukjfZJqRA+GsZrVZXTyWhdzSzhtJnw8h6he8YFvOXPcKoeNgQ7QctKqLcvmVAZud219hHjW5hykMmAMoQL7/HyCLmIQa6CRYpfKn4GsvAWuCZapoJjE1hKTOTjDRggIJR1rcV/NbrFynfJu+CsQJNj2aDflWrzWKV8guQm2XNkm5UJXl3uKrYX1Gi1idy0bphJyqhpmetxO5mgejjbzA/pNvVRc4E2UtbqbEDKOe+va2MR6x+UT9kdBEYuf4y0dTdXuNLfmYCznYKGMN95WQEHN+CtSxkImQpizXh+KIzu9MvpdyPsmapyt82Gf0SJDK4CI4PZvhaRltr3ZNhETbB2o1m4dFjT+rdAwk9Bx73DWseboZEzqqok4ExKFUqsxJ1v3q9jtHbF0e+4MFjtFWVVC8GdFVffCOBFsTib9iULW3ygv+eRprDtkAViTQT1L1c/jLlnC9jgzVujcIbP8C9ClUBAxE8V7QTh7h9DsgZd3c+oAhnsUzr8gJ+tIfO/KwrS6poGGmnUOOSCq+duFrIG6s4V6rvl9t9ssAFVnxeeApZDFisuv+c6cBcWVHCZgHB6PFLXby3xEGQg5jcIgMHybCmwq5Jn1Ot02xNcg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BUeaZR2ylJqVRSrhvVLi4f2OLvJlPF3Ae6L7VB4Ty0DhBhOP2urEuxnEVQvO?=
 =?us-ascii?Q?pnn1aj5XX5Ty95yNbVuyi/ToCisJ6nEctcjbpwkCQrg6GfqCak/9Auyq0K+Z?=
 =?us-ascii?Q?OqrTwNOOqn6iz2pBZ26iJUhFaWWqZhzVDt3bT6miQx+W3HRJ2Zr46AV35irK?=
 =?us-ascii?Q?J0HuIc7XnVAvzCqLXWvfF3b2E5IdsGlR2CZjyiNvjpGT1wbpZebkVmIUe/Fx?=
 =?us-ascii?Q?o3YQRlil8F3VCAcLW/5Gim3MMF3Ea7naToMk67aDjud+DVlSRQDR8vwh08xR?=
 =?us-ascii?Q?myVEETJBlMmeqff+R54g5srmLJdyTCwsjFXe6Ku8XgZPmgSMXN0c+LKMOO3U?=
 =?us-ascii?Q?xb4VBB8INXCHB2IBBMAmvZWwmbt1vAtcUduAIePiTmk1gJMq9I/oIt0RzEVE?=
 =?us-ascii?Q?39v1a4qI4fY+unHFHa7odf9bfeBUcF/H6pEp47KLcBJf37z5P8PiCgeOBtg1?=
 =?us-ascii?Q?pzl3N6JCZWZcDta+h6xHrRU4qGlS/5kqemMxPrCDDub9ZqzHOsKDgdoJNL73?=
 =?us-ascii?Q?0naJkZn5xyenT/mkOAG5Zri6/c2Z0VxMCB9q62jfqvgvwR0FxCzyx8m6EzUV?=
 =?us-ascii?Q?j313Fgk/0h5O6RFxuq8Q3P3ofx6uDAMPXp+zVfVWM5pk7sdUas1jhdh8OqmI?=
 =?us-ascii?Q?hqDoKBpMskiHyHEzDi7+ZUn5ibsCmAjPolQDSnK2GewfYgmOpbg6H3QIo0n6?=
 =?us-ascii?Q?xdbIcSnRV7QF8z9zSg3apil+IWaZw+bbfPmBCXD7tv/XgGIOfPrdOjXOeldf?=
 =?us-ascii?Q?RdFe4hsOchx2xNIBqJUSE7iQHiRoNOXd6dzXeVRz5D0sWudgQAnxRKBOXuGk?=
 =?us-ascii?Q?KVOA55UCS25b/8sgpr4MItaglarIGm3PmjYXDkye6Itc3DWWTn5cdXsv90I+?=
 =?us-ascii?Q?e8IG+GhGGL3k3TmqrqNbWG32X9Lx2X4JSQNPxcZCVq4j1NVe3syAb6IxaJXQ?=
 =?us-ascii?Q?yirEINGUHNhBgjTrZUminkXYTJL4fbUptOpzX29UZfX9TewSyNZxNA4hNP+Y?=
 =?us-ascii?Q?gG8VAGBliBYZSG4ijhn3/dF7PNRVZhhSRBLjLnbXkVb1nOURytIYhGcDYITQ?=
 =?us-ascii?Q?h+Uko1/ATgZQ1eHqBWY5Z5VfDe+g7WNFDjMDsTMuHFur9gxHDgASJdxuxUvb?=
 =?us-ascii?Q?09VWYKRn0GP4T8xsb3NerN6Td1RcdDE+5g3tSQ11+uTVSauGmv3zZkyYefVj?=
 =?us-ascii?Q?zV3lPacOg+D9zo6T8eBJEA/ySz6gHyHW2hBXBnjQbHHIjJFt7rhrsF1Bw2Cb?=
 =?us-ascii?Q?2YNLWIGjE6U3PoDFGdnPeEhGBjq4fgKjf0hLn5miyCk4046GMStBc2o95Y8k?=
 =?us-ascii?Q?pQQOMllS2NN2vKOp1biiOZKfvlMk1ByfX0vjHzwW6GCJp4ieV9FeB27VtPNg?=
 =?us-ascii?Q?l6iHnIz4vCuByKcel/I/dUdb4tV/qJHB9FaHLgNLVg9gWvNwKSDI+iWwdlta?=
 =?us-ascii?Q?LgQNP4BjAR4HQOs5xFS8Ah/26TdC12dCnRbt31XiLr89BuyuzmmuJMrEEB2M?=
 =?us-ascii?Q?uSR6uwh/rKUQrshAfJt8YzvMDG7LLbUbDj+1vpAwhAgQXmDj5F6d4DY4Ho8S?=
 =?us-ascii?Q?fve2+EI2y6/AR2lTQYrdLmZ8fBq+hq8fOTYdrxN2xGbWGFkhc0SBz5WCsDIT?=
 =?us-ascii?Q?01cqrqMhGXrJmMrdw+puI9ySzk85y9J91hztK2cuzYJ9yRUyPc4sHwprqgzs?=
 =?us-ascii?Q?RpjCmBAjvudH/O0kRFoSDJgX98/6FES1dXGuo5iutKFY4r/fDEHtHab6Q+ra?=
 =?us-ascii?Q?kPMMGpS4Yk7ZbtQCYZkc9yhnDNo0+K52pZOn3bdhQ6/YsuVUkt3d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68bb9fa-f014-421a-02a8-08deef12cba5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:48:33.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmauIjpVbKi5sSc13blphXPE28lziiiG+xOK2lava5kzqEGa8iuBN8umV12Gm1xJITGO8Zx+gqBqQQUatGGxwLfL99v42W3RMMFGt7Y1GuBJbjXfnCkdCHtPo79nCfPj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9107

On Thu, Jul 30, 2026 at 06:21:29PM -0700, Rosen Penev wrote:
> We need to tear down the irq before edac_mc_free() to avoid a use after
> free on teardown as request_irq uses mci as dev_id.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/edac/fsl_ddr_edac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index 3745eec67335..c505fb268474 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c
> @@ -599,7 +599,7 @@ int fsl_mc_err_probe(struct platform_device *op)
>
>  		/* register interrupts */
>  		pdata->irq = platform_get_irq(op, 0);
> -		res = devm_request_irq(&op->dev, pdata->irq,
> +		res = request_irq(pdata->irq,
>  				       fsl_mc_isr,
>  				       IRQF_SHARED,
>  				       "[EDAC] MC err", mci);
> @@ -635,6 +635,7 @@ void fsl_mc_err_remove(struct platform_device *op)
>
>  	if (edac_op_state == EDAC_OPSTATE_INT) {
>  		ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> +		free_irq(pdata->irq, mci);

I asked at v1.

it already disable hardware irq request,

synchronize_irq() should be enought to make sure finish current irq handle.

Frank

>  	}
>
>  	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> --
> 2.55.0
>
>
