Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013037.outbound.protection.outlook.com [40.107.162.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F962DC32E
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781191926; cv=fail; b=XeRh+ZLdV864jGE4q2UW/L3HFb/LGmMpnKcBzKhjVHUcV1W4LVEgpclv3bsGsJP5GCQ7O5377oFenpkkEDs/DN5eYGt6x1clqaXcCLRJLTjMWZCI2F66fqEO+vK7A9pCPIBjJKLCouBMRXOzNLCk/phjNrmvSiIifW/aBEJbEg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781191926; c=relaxed/simple;
	bh=6RPO5K6SKCXL1Vvkvk4qQg4nFFHc+dE7I0IOZ/447T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u8K5QB7LnnMkHk5Mv3xNaQvZJ6dgkng8EazMG8y+GnQPUX4x9NSR/DU5GpZ41MLoJAZ+q9FchF6AypHz4fEh9YOu1P1+6sYSShEgGshn5qvfWmQA9Oe7UBO6giH9VCLkzTXk/pXtXd8UZJvcU67gJDEPT5qpMV3hqS5I61iyaB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QK3oj6x4; arc=fail smtp.client-ip=40.107.162.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QK3oj6x4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/lK9NdWrw1R0vZzihaEhzGjkNFbUF3EHJ07BnOQs9zDTZzQyJDf40JAPgHj1UlKBTFUHtiWT4DFrN8p3yb2hgJD4W9QHReaXfB187V8O9fhNI+RFNpN1AJcqSJ0END8OJMlL9cZGbn5t/sKunXynqF7XDiO++X6Q2ZF0bRxDi3CcpUzFT3t1sNPJ8fUsHdZ5JqVofb3S4tGK2UtY23g0qhZBZl/PeMKpDx9a8ljMQhgebCwLObpE4FlEmfa2i1BWNF+jIoLFd6J+oZOP8IEfe+HluhMpS8f9swc19X+tW1Lt2CoHYxFo8PhuBTunYjve3LmoPyMUenWhPcCneAFgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NA5d8oJDNEBR+sOU0bFUvx44ALHrtD8utG6jShtPEyU=;
 b=p3NtSMxvdE7tGcVV0yTfDB/B0NHNnVRz0Jd9rA3zPXJr56LARBMFcGXWNG8SupHzZNhyUZ2e8UA3dJwcFXMt/nlog0AEj3YdW9IWR9z/wyX4N8ALOW9sgbyULloBjX1exLJH/BOk01rzXi55/n299Q1D0ajEOek7Y43NFN6jMRgwCfoNe+P+dRQUQXZNEUbzv09Kk2aYlAvEGLeMGQmysSwy/EnNTnvoAfCOWUvk5inPp3e1DaF7sEE0jluT2gWpMDREEDI8XYHtagyAuc9mcsAkS7WqmNMuoTS+/+j9eSmShD8Nnvuxcd4Sf8JE0vPl2DC7v1WmCJGw6p8aO6CpJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NA5d8oJDNEBR+sOU0bFUvx44ALHrtD8utG6jShtPEyU=;
 b=QK3oj6x4Uud8v4l9rx1OO0vxKdoaLUc8cDjyq1Rjgv3QpCgwISVRH8Tuk9OZTPiOu7HoA6Ojp6I2jN9Th8wRb3eqtTGMC9Kl5UtIYk+8QR1H0IVVdgNQ5qG0vFEd1dPtq7Q7fivzhfea27GyUfqbt7pWvqWSxhalDgwsCDOvWfsyqGj/P9+jtGrFKjluKZ3W8yINzDXduQyS6ImlRvUNJ7EmUzfHgC4UVmoMujVEiqQAxNgNn3zvBN4RjKI7G8OAzWuW5k8zBCgkShS9PsN75VIRYdQMP03B1fCysffWOM+T2pHWkV5+95PwWHBwOwgxUPBt3WHYCtZc7+FazQtN+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11008.eurprd04.prod.outlook.com (2603:10a6:10:58d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 15:32:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 15:32:01 +0000
Date: Thu, 11 Jun 2026 11:31:54 -0400
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
Subject: Re: [PATCHv4 07/15] dmaengine: fsldma: fix request_irqs unwind
 freeing unregistered IRQ
Message-ID: <airU6sebf0urWxeN@lizhi-Precision-Tower-5810>
References: <20260611035245.13439-1-rosenp@gmail.com>
 <20260611035245.13439-8-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611035245.13439-8-rosenp@gmail.com>
X-ClientProxiedBy: SN7PR04CA0238.namprd04.prod.outlook.com
 (2603:10b6:806:127::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11008:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c47cbcd-739c-4ac0-e87e-08dec7ce950a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|19092799006|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t97fteB222X4S4n0DKxJtRRZSlkALvRWfBX+xBD73dVeBJGK2geKy6hxHs0nUnlYhZqP1u3krrKx21MctV7/YhjXz68nTIjBj26rpoV8E6bctKGHyhBzrGZYEhLTM46OTB6z7pKbDuIi9WBEewcGewUN4eWtHtCKwrx6L4Wni6KJXNxa0Mnbx6axEClfC1L4Tm4JMkYuoeEHPdKTlnSGgo1W9DkpdmxmsjJI9yVzXuHzJWsrH1tOOK9TayCNeKGYtKk4fCCAhRUN0YBMyfveawOSpVzRO+d0ukQj5pjGAA6YRhycF+lAezsliD52bZbE1DEVepwd4dOB0el296CCyKNFQB+2/76OGHLit1vY86i46jfdSNovpCsikU1qzd+/FwkxlgKxCQtChPCs/wGgyPSNK4KyZgjNHY0DwE3CZh7NFq9KKRmLUIumWOFLgddwQTqphiItskXB9niWmNYbQKY7FZR0ajQPYRxrnrYq0X/ehqJA2EHoKy85VloApS3osUIryIClJ+uPjd9Ul4gvVEahZxi49QRYRwBw4oroPzSQrm7k2HoFn6jKcFKwVPVCQkDQjfblPBIjClyqUALMnbxq/3dvfGWcS95vSFm8d4lVkp5gF+dy+qo1aVkPp9tj2TGL9rGAz09Uqw71oMv8Hba6Z3LMj0pGQVrwEP+yDORY5kyvXeT5T3I1bWsAA3bB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(19092799006)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yAPJZpjrCth7EW6segmm6rA4RcqR0YvyZYJOSHi/0d66ZfT6vcTwNz2flWRk?=
 =?us-ascii?Q?+5SAi+MGi4RtBOHJEPAlkbaO4UUskZgsrYZkLsF4bfh9WfLB+pNdQSAgfEGn?=
 =?us-ascii?Q?R/rEDp/wNob+lEs01jPSeiZx8P/ERzEyP5xoeAWNOe6OPZG+MSaCFk1e8mDC?=
 =?us-ascii?Q?Sx24CtH7B1dlovQOLW545scFmRy8w6XMd93kG7fbWNg8Wo0/vfNle5/GDy+U?=
 =?us-ascii?Q?XJM9K1K32f2kG6OrB/onRWPaZ22mna/gDTF3M8JtpNOVhW5Eyn7MACRhUKDG?=
 =?us-ascii?Q?o9EZaA2v/fD8CUJcTYpVtqUFAYepnkskXkpsEhGehU3UcF688shyikyxvhP6?=
 =?us-ascii?Q?7xb0lEFcGoSmk+VbD7DVKFW55+T+J7SQGhnhvrHoOYFuxJC9qanQVvkg0/id?=
 =?us-ascii?Q?wFq+v/jw3NbwwwGiqM7u+LGNsW+DMKAfZ8tx61o40h+TxN+gQxWeOVgQMK0K?=
 =?us-ascii?Q?2FVIcQzR8oY4lU+c/uVt6WnyOYyYKB60bZpSC72vezIXCvlOBjgNrhb9GFW/?=
 =?us-ascii?Q?cumKG77m3goiNMC5Te92HnTuXSrAe6gGh7OnqXpYWuVbDnb0Wr3VsN13zV/K?=
 =?us-ascii?Q?bhsdzcX/BdFDiDWcsYZjY9VsTvsMLIc1GsPoO4x+DqZzezDm0ledVWppZQcg?=
 =?us-ascii?Q?tx7c4G0SB+U35nLwwwJgXjN+uiq/3lI9wRkll2szrlABtZSA4CFdYiH1q+1C?=
 =?us-ascii?Q?VtEPNpJtIRW0v2K3vivJv/uSIEVMrk11HhshjSBRpJhl8IC377B9SPhj8tCD?=
 =?us-ascii?Q?mnZq8+Xe3bhq7o6sO8okszNe1HVOB0hvCEgl10qqIACWB2wdnsS4k0kDpp3Q?=
 =?us-ascii?Q?EpZdEwqvIH7M+1aVR83EORvD2MpppzC/M3F5UOqxUm6qY7LoahPpTY19hjMj?=
 =?us-ascii?Q?kNw80eMudjnlJqXvHQKf3gEkgGlGWuwxfvg1k+bMe/ZurXpJ6LSioOBoN5hc?=
 =?us-ascii?Q?BPax6imaRlOkh4o6EkiAPXwZVAZwbTZsKV7xzJDpOcO9JrT4wYLDiqtoZmM/?=
 =?us-ascii?Q?2MJsWjC1Do7GqpJNtctB6Rg+uW/cI0HOcZMa1EMNbbOIsphQVy9PEqWP5CuT?=
 =?us-ascii?Q?8v522S8YbTSM9kgpKG60JvtChIJT28K4SKTV4IQZEKTTm0cdWmjSaD1aZ0zT?=
 =?us-ascii?Q?WPCTXSnSqHRWjpsNROkM8w2jAbHhd5CA81LRLRghubY1WqoVCQGu8SN7hLau?=
 =?us-ascii?Q?m5xzEN3CTqtk8frPyURl+h/bt6aeDFc6T0IFlZXLMXncOwxxp+ULIRlZ+DNq?=
 =?us-ascii?Q?cW4kCADnW3sjOojw6Ar+u3Rc8Ujf4RggIX4p744wFfepnE8djXYehCNp+2f+?=
 =?us-ascii?Q?WTM/dtrLhQeNzIPnBimphGZlerNihkEVewLb06010x1ST03oUbRdpBS1sUCW?=
 =?us-ascii?Q?is1yqnQgQmZ0pFI1ioDaAteuTXicyP39y4rlCI2XxMG7AvbKYn8y2MCMOz7l?=
 =?us-ascii?Q?spOOZzxxw6fkVMwy8hfi4xXn+tyjepuGRhiW/TaHH7tqbdrwBcIQMtrau8/A?=
 =?us-ascii?Q?Z86Sn9H3+3GBGi1X+lMNp/wgl7jbw2wAH37HSnWXydiTe0+wUl4cNHgbQf20?=
 =?us-ascii?Q?IGPaeqeW1A2I65ZEI4Gy4VQhW35a4G+vzap4QVS8ZOevtO8U5Ubg0zLsN2j+?=
 =?us-ascii?Q?tdT03l+JAZ9Vq5DVtMhufkqAUgNDP57SFSUGNWjowuCBKmqqF86/NWC6C6CK?=
 =?us-ascii?Q?3BRVGTdelXpU9HjvFhCbHVakwftjeYQ32jipZfnDDSGEizupUBx3pB6To/Sf?=
 =?us-ascii?Q?/2ESpjTHNn9B/Bod4t3qvbl1kkyuSjc/16GyCCE3+v1yawgoK++g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c47cbcd-739c-4ac0-e87e-08dec7ce950a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 15:32:01.3402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EQ0YGi8yaxMLFUwmsA/zVP49xSrXmr0f0/TymY7twPLnk0r7KRxIECYMPRoAZvK54+Nes4HeOiOuDA2OPbJ3mOLtDjqmkMRczILptPuyQNPAKnnSrp9VZaE2QBdPM+5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11008

On Wed, Jun 10, 2026 at 08:52:37PM -0700, Rosen Penev wrote:
> When fsldma_request_irqs() fails on a per-channel IRQ, the unwind
> loop starts at the current index i, which calls free_irq() on the
> IRQ that request_irq() just failed to register.  Decrement i before
> the loop to skip the failed channel.
>
> Bug introduced by commit 586f54672b33 ("dmaengine: fsldma: convert
> to platform_get_irq_optional()").
>

fix tag here

Frank
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/dma/fsldma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 4475d50a94f5..c04a7fbd2ed0 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -1088,7 +1088,7 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
>  	return 0;
>
>  out_unwind:
> -	for (/* none */; i >= 0; i--) {
> +	for (i--; i >= 0; i--) {
>  		chan = fdev->chan[i];
>  		if (!chan)
>  			continue;
> --
> 2.54.0
>
