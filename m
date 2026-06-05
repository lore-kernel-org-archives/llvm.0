Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47363E1216
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780699564; cv=fail; b=T61+NO1EFyG97SaJaD77NTH9jkQ6pMH15UR5pqDzrSE+BXX1gcXiJYqwTGq0lzq9XVlITWjKAObe5uhu6zXojZ8pnc1QUmhqPQayor9H3AXuuHFLyrAIedZl9xTB+QboaeF5on1Joyn4MK8US9i3muvOxs88lnzaPIyHa5WrtY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780699564; c=relaxed/simple;
	bh=zz20a0qr+LmiKxdxz9Dm7S0sproy1DLPNEYBEvfYQB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qVDZqky34m6FfUifIC6TBsz3hXKEcA+bmKo+97aShdXzwFkU55g/uVLMySIDord/aZscNgJ/JbdZ6UhXgA+f/xPTIu4m54MTxYlswLsgCG/iIugmPRc+xtJc7IDKsg2N9jKy6Qa9iTyvptFDqi6xJ+32/slm+Qoma6kbAJTkye4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Oz2U/PRL; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Oz2U/PRL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RskioeM2e8bdDeVuMyDRdY0a6XVMDhQv7rYti0tJW2GyJKel32rkzZWjE98cS5PwpKCsnQxR9hUDrPTODA/+HLtl8CiiUCcpTjNVyI+8YiXxQ3AXcnLGfH2NryNNN8wKbeYdt1zplJEheCWnaLYPpaCf+92bsZMJKZjBw7ijeO4Z5SQq2TApUrolKzrTLz8bYMjbnw84wc+3rSbn/M9OPwiPIbEJo/GBIyTpEslJA+oKwS0Gx/RzxX/iTgIS97ubUoYUWUdhdnqT5VrkLr507YE7IRhHgfktq5Q9F4GoQDWUUNSx07GNmzOalWV/k1IiSQ35CzHL9SjBrLp7cBu7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzD8p+ZP9oH4tn8n7RoXC0+U3KcdSRMTDqRB3hhFLic=;
 b=v5Ow0Tl4fn/2XOgGn2GkVLKQ38Pt+nJ2lgwfaJ+DaMMwmn0VG48Re8x0E/5EJ7g7HUyRXgZzV4YfHTjwqf2tgNKejxFKX9MaBpR5pLrnS9mFYIPP/YPZa7PVBBtVREQzC6cmzg5qOWuCSYWZas/FPQb4YjUn3GvP4Uk2IIi87Zub7TvQ9L9tLyE5pu55SB2uigP1Woqpe9xe4SlqCJ884Hvds5Q9FyVU7H4wHJ2JBb3K4NZKWqgAZnCYDdzSxXY57irFHBFCjSNmQvNAGiq/CGCkBJWjvV3/wVidvH7Hf3qsDAotQQ0/KmL218Aeo7Ns33Ex2dGjiMD+VL6BF5MZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzD8p+ZP9oH4tn8n7RoXC0+U3KcdSRMTDqRB3hhFLic=;
 b=Oz2U/PRL+ij9JuSZNT/AXSWfP61HA4qbFsnzXQlknAChScnlYg4XN/LTAD1y3kd6hzMIiT0sQW3Lc8FAPxKRCWBYJ4KyYos9Xfq1lPIGAyqUsOkTVLSbzjfWcm6VPWipomyE1L5ErtJhlrtu0vzxTBgjXjq8sGEq8771aRlOmYOqCidAQVjAogn1hCRqXZiISsZM1sI5hGx/eQrZEKYqTXvkxsT+eWhBz+bjaz3kFu9ZNvAGTNk7U/4DcW6dvSwzKCF0KcCy2pUwbILerV0Biq4l5jn7H3aRzLqQm9Beb1ffs+3Dw6BV+qFcx70MsLx8p8XcmeppLhh9/LrNS/iG6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7257.eurprd04.prod.outlook.com (2603:10a6:102:93::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 22:45:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 22:45:59 +0000
Date: Fri, 5 Jun 2026 17:45:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:FREESCALE DMA DRIVER" <linuxppc-dev@lists.ozlabs.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH 06/10] dmaengine: fsldma: convert channel allocation to
 devm_kzalloc
Message-ID: <aiNRnj8YJoZhCeAJ@SMW015318>
References: <20260605220134.43295-1-rosenp@gmail.com>
 <20260605220134.43295-7-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605220134.43295-7-rosenp@gmail.com>
X-ClientProxiedBy: PH7P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc950d5-cb41-4987-71bb-08dec3543683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|19092799006|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ao5WTxejsyjuhDPREnRC+J/axyn78A1LlzydKtJso11y5/VSGr+3/M+jstMHCwtO+ruHMUBYZMiSHNbnMFQUZcPr+d9NLg0/gCPeY4dEmVuGK8e+JiP/CNX5Cgta3upqpIpV6w85v5zd0TEr2g8Zg7WoRJUHRY8t1yeNQpmNyvV/MLpG+EuFbf5cTaoXeus4aclb4sC/Xm9h7sSsdesLGlq7tCEej42YrphQtZCakoM6UvyIRg7SrsXSUlQJ0H8Yq8G69JO16v6E3C8yXhSCcYLA+BCoOi9hrI4X2vny8HILcBov4zpkg8RTzS77kB3tjKITjNKxA4P8W52GaOFZaGBogN/rICbfk4/k3SshTz/hbedzVFYuffeX1U6U7sPrnG1ecNuYpxedJJPiq0oPhnBo4oZIKC0jb9I3M31aAGzqrR1HBwssAHlkRrbiAJ3tAAIQkDDxwvlF+yVtp9q+bjVgFP1hi4KCy3b2qCOGe9vTXgFJHcQ0NCQjqZkKHSrMV8D8yEp7wjQnv9XKOAEqMN+z44JSqOmmyElV2WzTRBqslus+EHyKfXUJNMZ78On+MsuCLCc1Oyt7wUH5pGYoFnj/+6Xfvxp3lpVL9FV4KliHZrVJlzLN8tozcr8dF6njlRSdVoaN/RyfZy1+4bX1J9qww8CY5W1Tgj1M1i0cs6nWvQsHOXlTC+VENyBFoDo8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(19092799006)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1DWOt/+yu8WOipbj0nuzypl/VanpYJDUazzwNDHVERmmjDILNPQW1heGDiIM?=
 =?us-ascii?Q?Q1EkFDknk7Y6CPsvxoqFB4wTefks2Xy4rbNXC/7KCSEw8WS+jf7ROp5EWQCL?=
 =?us-ascii?Q?zu6KfrMrTx7v5jmYlJ6MF50XVlBpgNDG4U8fMZNKWu6hVjJ7a6I+YHgPYKe4?=
 =?us-ascii?Q?QfGqjZswV8jwLPpfZqCEJzbDzlBSWij1u7NNaRNmCXNlHkPRLzWABgw8sBYv?=
 =?us-ascii?Q?7Db7wTt+rhdwKG4L8m7fZgkxKT3Kq3i0x1yXWnKGbqKXaNhobQ2oAtcy9JrI?=
 =?us-ascii?Q?kIQUA5DJBDsk/rnqG6T5VIpr+eUfRnb09R77VSmoNHU5Yy7wm63d8GfYw/5j?=
 =?us-ascii?Q?hORZ0tCy826p1UgqRAK3ZNexsKJnizWcYnehKHzOShfH74z1GTkm9gdGpNzP?=
 =?us-ascii?Q?BykEemc0G3LOk/LB8VVf585vTOGWWGTq5FwFUPm6AwcgLcgHg0KqZLp/QCMb?=
 =?us-ascii?Q?oCmgmJyCZ7j99c1lACQlFbEF/gYX32GDES7sF0E2aP5EnrER3MzGAR6RFT8f?=
 =?us-ascii?Q?Bu5QGHyQk/Obg6tUupMSZ+UFoDJBE96ZijGEKTJ6RYvCr59B8NRst+4QyHRg?=
 =?us-ascii?Q?SdEdQgrTUZZMJyWXICE8z+1bgRC5ItH75c9LFYR3qkhwArBSbbs8clfHtu9s?=
 =?us-ascii?Q?jEbhHMn8Mc5H2wCuoa+3OaGqvUSA13fTp+w5LxXhfUz7a06OBDx1vJHBsWk9?=
 =?us-ascii?Q?ga3ckd0g7TQUasQEolKAo5fyUN/QCLVnyulreu8DIYT/F6JLfwRE5PZQF3zH?=
 =?us-ascii?Q?Xi3vcN6pQA2iDkNCO3YbrxDwtk9/dHNmdeM6R+SEEOkdlcsDAv7V+dGHPsBz?=
 =?us-ascii?Q?6sXg6Nxpq76+Jr21J+qvCFPOcQvIV9Hk1xP9ywQDGwwlxkubuVglU87ZrwpP?=
 =?us-ascii?Q?h6SnyGTjoU7+X7KRXVz6YDbILm+BHKbAXytKr3veB24tqd2A0YmL0JZlfukq?=
 =?us-ascii?Q?5UDxNa5selg3m/YGgaEJJK9heS9FzqXGgf76Wx0uoEI8YBXgC7WYhGM5yKK5?=
 =?us-ascii?Q?2Q9lFOCKqdq7mymsfZrPfjvMjijZzUKUKKbN8XcHq7fS16Ch0dIlgwZl/tCT?=
 =?us-ascii?Q?u4xUr0jLUAEY+/Xo0qLklRMA2EfQ9NtWrxs7sigcW/HEN7E+rSZPT4QHJ+7D?=
 =?us-ascii?Q?WHEVgWdUe9tFQcBGkr9FB8ViZt/+fEUF+jkMEO8EpFLIp5DdMebOeVXUXGoS?=
 =?us-ascii?Q?jmcPHvNYYuhdZoIiq555/jA1Ah6ZwYUz9EeP4YeGOaU2ILAD+fl+nA3+i1c9?=
 =?us-ascii?Q?JXN2hRE1njzOKfkvqKxX2j7KIPX9Z8AxuTI8+KCUI6GtAV9paQjnxY7njLj+?=
 =?us-ascii?Q?yvRQDA8GSyo7e2ptNso/bCKZtrhLcpnCkGAehQx99zhLIqXe9tSr/5hhzbsK?=
 =?us-ascii?Q?ITS3HMchHJ11V+/L8TQBFoAEGMBnq1CBpj1dS8RmsFHVrhF45nWn7Pbjgduh?=
 =?us-ascii?Q?JKueMasEn1ZG9Mmczx3tUzT+TQfHmV1kZCI8tLRRLHntuEprDikbmuL21zzX?=
 =?us-ascii?Q?Nn3rRx3B2Y9Luyg5VUTH+1ocFcia6aC8EE0PaDz1q+5SyuvlDsqX0SfvimNN?=
 =?us-ascii?Q?54AlBBp4BJjJU+hgMs0/p2VFd0SJuRdWEMhNMpiRZiTYocoUaPI30g5hs90k?=
 =?us-ascii?Q?buNUYX2UB17/EQGbVZspK6T+Pg9fHt6U8kNmst2VNYSryxvLvvAuimoGgLmT?=
 =?us-ascii?Q?BkCZNk3GfWF+ZavCnQOB1kYj9BDMWjMjllraLxSjPBuurBnV36wDrTH8tIDb?=
 =?us-ascii?Q?p5KZbjvansmdcSNFuMWUjrzxJWThQPQFXo4rff20J9U+/NzqOhkY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc950d5-cb41-4987-71bb-08dec3543683
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 22:45:59.6035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZJ0W4Wr4qMhj2B0Qcly1jI+vLW9JEqWoRCKvgiGxn1Zl4DuR6E9wdcqNyz8+PATsZOMvIrz8W7kWviJtTgtEVN+D9sJliLuS4Y/iCGaLBEjIwGcc77BCVQgRJKp9O1l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7257

On Fri, Jun 05, 2026 at 03:01:30PM -0700, Rosen Penev wrote:
>
> Convert fsl_dma_chan_probe from kzalloc_obj to devm_kzalloc, tying
> the channel lifetime to the parent DMA device. This removes the

Nit: Remove kfree(chan) in ..

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> need for kfree(chan) in both the probe error path and the remove
> function.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/fsldma.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 2a6a247761a4..ee6e595c2972 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -1111,11 +1111,9 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
>         int err;
>
>         /* alloc channel */
> -       chan = kzalloc_obj(*chan);
> -       if (!chan) {
> -               err = -ENOMEM;
> -               goto out_return;
> -       }
> +       chan = devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
> +       if (!chan)
> +               return -ENOMEM;
>
>         /* ioremap registers for use */
>         chan->regs = of_iomap(node, 0);
> @@ -1197,9 +1195,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
>
>  out_iounmap_regs:
>         iounmap(chan->regs);
> -out_free_chan:
> -       kfree(chan);
> -out_return:
>         return err;
>  }
>
> @@ -1208,7 +1203,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
>         tasklet_kill(&chan->tasklet);
>         list_del(&chan->common.device_node);
>         iounmap(chan->regs);
> -       kfree(chan);
>  }
>
>  static int fsldma_of_probe(struct platform_device *op)
> --
> 2.54.0
>
