Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A2D7261A
	for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 02:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781059635; cv=fail; b=FZA7YYlGxNZ//NK9dc/VagYH8AP7921rJ3lX1F/BkgJAXVN1ciP/wC8/Zx2S249y6IKCa8fdNjTEq0sUaspq7IwRsRY4DuvcrVNlY/cLvzbndaIK4WY2JwwQ9bH8YdN4vM4+FSgHvLyjiWRDvVpHxlE8FNWdkOn7jtLbPPXIeFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781059635; c=relaxed/simple;
	bh=LOsWSsOM2AkrXJoAYfqH/TwfninOrg9JBCxvXQs4nM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bsA+iegNm7+xxOvRQ1St4w/GOsbvfEJB41HBj6hyjfwr8L9dOYAqgd2iwkI/qL7U5r4fAEzh/e/lPwZgwRY4j1N4hBWiy12aK08H9mvz8AYdQh6siAZwQiD1JUn/xU2vHkLv3RzUADhV6W/adBTSjoVj8GMfBPQ/pTAvewzYwWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wWfProsa; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wWfProsa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k55US6QZoGehiIxR+eTkMRAM6MTOVdiRQIIy5f8zPwLJws9EzE4A0tpmbdeCJqWBvcmBKiLNv7PgHp1EVh31rVef4Sp65or2FdLEr3ZOkkxpX1FZaHmvCtiNJbAovAmvtdWZZidvB0o6vSxnt8lvMayt7f5dos4C+eOqewHdCuOVhPw9LevTSYjsKcikpNOiqsdbV1HpaFS5QQuzbHV7XeRcpXijeGsYLXwoKjegFMMMSB4JrZ/x56w4zdeIasNXFrb6bQ1H6tZsprpvjrdIEcneuKDTjU29F6n9+ht/rRHEKugW3Y/kg+3Ux3YZodJhRUhzNwsCwdiMBCmjqcvndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eb+su4749vefTGRGMVqPuYfnXZ46ydCYl+j6Ij6YvZU=;
 b=t4ambrK+6ZPYZBq/1tkxAe2JnYIAkGTFrmiVBzVbDivvs4HSJpRD+x4tvVms9nPgT+eC4Frt5D5Uu1WyLjZLug5OCmxxIds8DzUyKyhlr2HGDnB066A9XwsyGDQpwK8/1EoCduUmLn0T4jy7x8hcWYwWxCGSYAupBsoPN/rJhCktJVlWHmEmkD8w/r5CiJ3G6IoNOOyrCYN/gU6NT0VGt9OpyyNeoI06tWZD8Qyv9USrfIUFNGTEOj/fmnrQCy87qvp/nugn79LNW72vG4QUnQZZutrgAuM4cXd/KNZOWfF3ZLbwfzYWvorcc3TZFWTE9TtTOleIwiiB+X8BoUDEZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eb+su4749vefTGRGMVqPuYfnXZ46ydCYl+j6Ij6YvZU=;
 b=wWfProsatH02K0Sph1ui+8VPJuV58VTn2jsPEv/qXVr3OYhOAqC3KxqdKfd7+iPe0D3g28SDzETv0YfHwFEBBWo/IJ2YmCKj8aprRwlwbjOZ8xk8zhhJOcTUCqMMviHn8Rw37WTkqQjKixUvNA8TuFF2ik+fazvjqBxPjpozhR68JlwhtMSSB8+Ax93FXQcs7qHobODn5oL6iZJMxqQEQxfjJtyJJBzCIeF16RVwK8ptFPvfnnBShGRA4dDrrbdelnoLMuNPsjJbfz9U2jxGRksN+JhB4P9SaF3qCwv0NkjqhhA3xmOH8kcxyTiTU1/i7LgldZmDwNWIbIfxS0PsLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VE1PR04MB7406.eurprd04.prod.outlook.com (2603:10a6:800:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 02:47:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 02:47:08 +0000
Date: Tue, 9 Jun 2026 21:46:51 -0500
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
Subject: Re: [PATCHv3 03/15] dmaengine: fsldma: halt DMA engine before
 freeing resources
Message-ID: <aijQGwzQpi8oTGIU@SMW015318>
References: <20260609221926.35538-1-rosenp@gmail.com>
 <20260609221926.35538-4-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609221926.35538-4-rosenp@gmail.com>
X-ClientProxiedBy: SN1PR12CA0060.namprd12.prod.outlook.com
 (2603:10b6:802:20::31) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VE1PR04MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: 6753c411-2592-41b6-d128-08dec69a908e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|366016|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Jp2KEZhf9DO5gpjXLPmKXyQpt0H5wHtZKlvg4yCq19nX1FpcwxU6aMUM1c4kQRN5vUimynJacstL1ZrCx0aZ29sKP/vF0SdjejAL3vkqsPLrPo2FgK0b0KHW2tYpPrB/AS7rJ3tD3G5j1GQGk+am7Pl2nC+p1H539TbhgIlPbfAHPHyQvLt72DZepVS8/9i/criCnpksaCXVuTs21YQgROhQBv0gE7Q9THgh6PWMunWxgqqRZCkMKJSYYgpfqlRq+qu+kOvwenV4xo0BYKkVKQRkIzauHzNFvgbLy5T190hoSaLY95XEtMA65rHi9/TvhjlXa7pVbqA5wUyIHfyEYH5aOl+O55oG6GcCPDCIHOQq/lEpdEbYw+oXVXwem5nTUMcD4g9lmjInJrC+fYRs7VS59c7TYvdzbRKrGQiU1HxYkd08MMiFlXvsLPl9kXAFcIscb7Jgv0//lPSxG19Uspp7xwfEqothAJFTWJ/ImLG899EMzMBsiAXw3Rh9CNj0otMNHP7YzD08SlPz4U6ccRQj94yOit/VEgvanUSKnXyP860fWxHAD81PEhkkQmpdsER55OFQr62EZTS2kL9Zvcfx1+U0qF/pvamY0A6BRzwT1XZn2/H56lNAdAS57cWKVymqJ2YW4SeVLHmFQiMlZ1EE7XH6Iz1+Qex154DRB0hk4rwY2nMF4im3htMpvKxH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fRdndRmq/bz9fHk8Z2PaQTkUH4DuuMhRg0i6DKBX6E+2ZnrNh6OzP/gz99vP?=
 =?us-ascii?Q?Qw7otiYPxQ5d3NskjwjVquIS/QblJ3cTsj25E3BTls/mTarAidQlI9e9d2f2?=
 =?us-ascii?Q?VRVEp7LWSUzxUHNxv7JRUeOHYB4WlzGGSNlZI+lPjAg645/+oYY/ieQDsGpu?=
 =?us-ascii?Q?B+JwucfIM4U93kUDnLmuiXYOL1qzGy2F1bfm/Ej9sCFqMypA3AV9kSKzyd03?=
 =?us-ascii?Q?6IgwKWUnRG0DSTGfdaJQggEWFliSdkEMqjc01okPzSg0WaYuroX76zShiwxF?=
 =?us-ascii?Q?i7/Rr+DSl/G4tnmUYKhMWZzoR4cUa5pU7drzkNfFf7arTFwWdy9+TiX/1l/A?=
 =?us-ascii?Q?7xQ1Gz6Rcn0E0UgBBciQaIwjgplKK8Z2OrmJ/dv30i22V2zV/c2f3beaP1UZ?=
 =?us-ascii?Q?tTp3aLaQFGVSWDVvvAICoqifjuG72OAwxIiHqXsqu8h8JvOghSMGTokK2O4P?=
 =?us-ascii?Q?LwOcTsSJTdwGJH22Q7kgtDVHbXWbAJE5fyWb/bMc3hNparcn6mNhW1LmG0ri?=
 =?us-ascii?Q?vUwssS29KiK2rO9kHaBHY2YnB0MuWEUKjByAs8U6X4QDDWpOaB0ffqheYXbM?=
 =?us-ascii?Q?aqFNmDHpJxI6icA9ZwMoNb8ZEuKvRZPbPkgCWM2IUkyIn8Jk+SGfJg9Ud2W+?=
 =?us-ascii?Q?wjq8g+OsyxKueTWaVSiP9WSOTv7ZL5upnMaesbv6o4dgqAb/mr/bSJ9mp75j?=
 =?us-ascii?Q?fALWpxchbpGCd4tbdYwycRG0yw7T38jDoFbpkOaG1aJCsOjhAqPJDtZIxpPq?=
 =?us-ascii?Q?jS2TfmpRezc09gZHPo+bCkj6aZQ5SxnwXjXV28WCYjZrksxQLqLur1toTVuh?=
 =?us-ascii?Q?3DNl0aghWK3J9gkbWeStgEoYidQ2wSYnTm7mlI00mXs7bj9xt0elowbNYBLE?=
 =?us-ascii?Q?Q3RkXdN/HFrvUKjuXZlIlZzCXLbSEzfJNFQn4/URAGBQhas+jN17xf44J+LK?=
 =?us-ascii?Q?eypZdZJg+wKCR1GTK4s/hjBf4ReNMJO885KKEHO1cDhfD7ngSEFbiq+SMJ5X?=
 =?us-ascii?Q?bPLKLIAELPVU8ukyyfzktz126546sWm9JCucAYC7083NGWwoKh4fNic9H6vH?=
 =?us-ascii?Q?gSqfR9R0B78JZpgwrSm9EkvPZewttTsvxfyyKUCZgd4Cu2TXiYk2A1GBaKjl?=
 =?us-ascii?Q?u0xfecZ6y8zUBDktP1lEDIQDfKq64Qsrr2Jp6PB6e+AWD5GyVOFP3itf/GoT?=
 =?us-ascii?Q?lx513SLO01DkcJ5SIhfjy+xgF0jamSYRD6tK6pD2EvWP6eWbU56sMmYb3knE?=
 =?us-ascii?Q?5fuoo7mYon1YwbqMUtKFSIuHtSGfI3OUTDEHOXZKbzJ36c445BsUt9JFBxNG?=
 =?us-ascii?Q?mwtb+3VP6WwLosFBGdUDSh7gsAVH63fqSE3FnYUEK3BTnDG3gXvk6LQUCu5m?=
 =?us-ascii?Q?IXfVwVsbUBdhhL1jncPQwQZlD3WFPQ/iXBG8qOJG3YQD9R8n+1zI0xR0R4FV?=
 =?us-ascii?Q?2rvgxes2JnP5yH1wLV3/LKmUeEfzJDzkgJi8Ca4iMR3lgXZlwrlRwrXM+k5R?=
 =?us-ascii?Q?f6Xr9ggr4VmXB32P79U4cOtE7RVPZre8d1FWR972U8ESe63Ez8bvvwTG6C9M?=
 =?us-ascii?Q?6f/SCj/9ERrZP2BEJOz/d28DXzbJPih89xW34W32M1XOJQSZx/G9PrDAaW+f?=
 =?us-ascii?Q?EfJHV1UiIIHMp7Z9YRI/zCutPvZ6xQcpEmKMad1tNPijpQxawPcjhC3Dujwv?=
 =?us-ascii?Q?k8/7MiUpQoqbycWgEtxmvRXWRBNpPcQgsnzYAC9m8TNzfM4sDM7dhkjtRBRO?=
 =?us-ascii?Q?p4vlao4DJsTV06BBd6oE9ePN0fNcY99hUMQ5w82ncfMFcmbI+dXt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6753c411-2592-41b6-d128-08dec69a908e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 02:47:08.8787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3+sC0Vm3b10nRv90Oc6W2614rNGRM0SFiW2bANhYoJGyN/TFkrwYv68ALPcZWsj6VxiWilEFbwM9BxRU1BkNpF8UllwkgCdxNWYoMM5nW53BlPItLOV7YBcgqw+vgAa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7406

On Tue, Jun 09, 2026 at 03:19:14PM -0700, Rosen Penev wrote:
> When a channel is released (fsl_dma_free_chan_resources) or the driver is
> unbound (fsl_dma_chan_remove), the descriptor pool and channel resources
> are freed without stopping the DMA hardware first.  An active transfer
> could continue executing in the background, fetching descriptors or
> writing data to physical memory pages that have already been freed.
>
> Fix by calling dma_halt() in both paths before cleaning up, matching
> the pattern already used in fsl_dma_device_terminate_all().
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsldma.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index 455d21d738de..1ba10d065278 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -748,6 +748,7 @@ static void fsl_dma_free_chan_resources(struct dma_chan *dchan)
>
>  	chan_dbg(chan, "free all channel resources\n");
>  	spin_lock_bh(&chan->desc_lock);
> +	dma_halt(chan);
>  	fsldma_cleanup_descriptors(chan);
>  	fsldma_free_desc_list(chan, &chan->ld_pending);
>  	fsldma_free_desc_list(chan, &chan->ld_running);
> @@ -1207,6 +1208,10 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
>
>  static void fsl_dma_chan_remove(struct fsldma_chan *chan)
>  {
> +	spin_lock_bh(&chan->desc_lock);
> +	dma_halt(chan);
> +	spin_unlock_bh(&chan->desc_lock);
> +
>  	tasklet_kill(&chan->tasklet);
>  	irq_dispose_mapping(chan->irq);
>  	list_del(&chan->common.device_node);
> --
> 2.54.0
>
