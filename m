Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E8E2C3757
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781192407; cv=fail; b=tkAty6oFthbldCe7n7LRcx8HsFQMXTJ1lHXwYwtGWzj3Q0Xxd6AkuLspQsUeKNPPZq3h6zRprKGnIiKdJPessGu0XNEJT5Xx19XnwADgCvBqIialr/Ox6Db9Q7FTZTY9tlEqipxUJSRJ44lexBP7o7v3doNE9sUIzf142aI9QUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781192407; c=relaxed/simple;
	bh=P+wWRDKs68xY+CWmmW5dE14M1Uw5WjHPR/Vxm7AOb8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lYkKdX8U6Xg7lrdpTE8JO8X1NS0+atlJ1Nwg4+plasmEuQ7srTVI0XK/Ng6OU4JsbTPWnycKGKTHCJ4BE02qUPB/AClLwU6Qhgdt1VH2J9Na4UkvdEn0SdU/bvgEOduVzmd+MlmjT4QvKSv99w2TsrzhdY5tMb2GJtx9pZMANjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jo0DVOPC; arc=fail smtp.client-ip=52.101.65.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jo0DVOPC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukjM7gSc3QeAmA13JozvFfZMDjKRttFoME7EKiS8QFE3bmyYIVvUtsHT8WVr3sfjxultaaWEl2S2aJeNSiKJ6NCMLw4+VHcm3X5MTzda5ImE8qiz/1YRe2m9ggjbwfc3IjfguM1F/0db5vXOD52s5C5fIyD+fwXJM0996oVFXJLT/fdqwTCU5on++AcoD0W0C3byvR8kqWAz2tHTmKrAI3eRsOqPxxc+lgcgAgeRD55SfZejzL6hcOlZvaBomCTo47DS4HdqGzdOFyqd7ZOEdYQg6Ch2ov7slMXyytu+sSFKcMR5ihs8xKy4kha2ZGAZgjtM57UUQUdZORYc3xRq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bj14F+MYokAQpFS72iFFBtuTGQpUkyeKwPxqEV3MQYI=;
 b=FbPYvcXMQ4QSahyiHtk2sZk11RX7mEvk/AEBoyVmrf8/NSvjc0KmXNcnQsBxfmAX1VqYuP0TEM4RAfuelAAEF/l8AhRMeYauwGRnHddTMFs1r0Aenmge6Lbv0rHqvfQ23s1Yo5XBhw7AltxIEDQkhs3Q92u3aoTu7LPsACucYnG3NooWM7kQVMkQHdYsDghoyX2E1hcF4MFM+/jMLdAEWccf0vcsF9Z1kLYwjjzYEwscWUs/+pTBsWmWDg6M9gnvy1xQ06z2uk4s+j75snl+gEFp6OArIE8wjRN/tf5HZobYE6zLDBLW6pTF097t8mmUWMVDtw70JsbiB25+288mgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj14F+MYokAQpFS72iFFBtuTGQpUkyeKwPxqEV3MQYI=;
 b=jo0DVOPCIsxgciok7bpeQEOYF6cDlD8qcDiTVSujuSNc9aFYUwu50LZaUiEvDnLpz9Gv72PgGbUChgVWp/n1eJ70anlSdF7yTNxpP5YfOkJEB6wsxLOvpxB6voslL6YDSwf0x0r0oEHqXVbg+EHRyBXIIGi4R11HMfLbnEu7V2dTerpgUnlV1xGbICBgImZebqqh8rwqBg3gIY1HBuwzq3l7KrbIIn1JimNx/nZfWrW3j7EPJ1eyALv38OxIcRMl6KG6tzFmq9KRPx98C33d0Ukmj0k+cuD/mgCO6364lmoXynwHPyNJicNTdT4HcGKh0xXPNfelqUlQofF9EJqR1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10616.eurprd04.prod.outlook.com (2603:10a6:800:263::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Thu, 11 Jun
 2026 15:40:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 15:40:01 +0000
Date: Thu, 11 Jun 2026 11:39:53 -0400
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
Subject: Re: [PATCHv4 13/15] dmaengine: fsldma: replace irq_of_parse_and_map
 with of_irq_get
Message-ID: <airWyfl-kqZOMvOA@lizhi-Precision-Tower-5810>
References: <20260611035245.13439-1-rosenp@gmail.com>
 <20260611035245.13439-14-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611035245.13439-14-rosenp@gmail.com>
X-ClientProxiedBy: PH8PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de60ace-231c-418a-79a5-08dec7cfb350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|7416014|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iylGxPGmrjmIUHlfL/H1FcefdE6lDey2zrpXXa1kDKEFf19oTsrFfsGo4KkjOjJU/gOeEsLeCZGno7BZuCKfO9TZtZu7Fu5u2oMmwc5esMQ5DiI88qXu7afRNOxptwzbsKuBLcj+F7tQOO1iVDsvPcV/5CA6A+mzW9Aee+th0msaGCE3cojMhdw+WETTelyAn0xeQsTi+8dK+GnH7g0n/cNw35MuuVTXR+76Y1eH+igbZz0q/REO8VUYgZUO1yNjzmBwCiiNc/CoPzoRRdgrAioU/tS9jkeGcPUZQO5C2jRb+mX59lZSID21bTUtmtIMEhAZcSYsQ568llkjImsPnI3uoYw7UpsT2l/798zCu2UVoYkwBt9EBmxhxf1OZ4THFoFpP/yZUf/X4wprznHLNjxZ+VoS67ei8T6ZhAjb27VpXHq3TsZqbyyaxDMy0ehi5xdJGxWGr2rgw6lYsYW3xwbQ2zk27USVPMzDGVOowBhdBi2i7XE6+ooSw8XyYT8w1gqdhC5+U7nWf+LFF4Kc9LnCcBoNVgane8Maj1JzG6bo3dItusDJWSEpxeQKOx4bmBsp5I2oP26HHJe+x/Qxx9hceDZGq/3oLmQOwL54BrLBP5MQ4Xb9lIaXmdaUMLotLLXo36xml4tLCk7K9A8KltKtNJVko+B5BwVJGcPlsTIMMnV4Iz+eNwzw1RFCoY9T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(7416014)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LUu4Y+VxcGIMfwATKGglSCHiPmZoWLKeHdCtE4NRrKbDh1NH/DPnelgutT3K?=
 =?us-ascii?Q?JaYw7zi24Sx1hfopVTS/5z20ZOuTb/5mnnm8tFuL/IANVLEojd06Znzv81wD?=
 =?us-ascii?Q?vX6nVrQmRMg7J+ZdShJ4D4kclAYuXS1xo+3gmc5fl5KT098TpgxtojBrAMZQ?=
 =?us-ascii?Q?0vw+YqfDC+MVs0IeDxr+o4TMmktQtjwPOGZnxokqbUU8fyoLmeN0gI1oDXLW?=
 =?us-ascii?Q?UGIVWyYdeDgwvqei1LiarGF9E+ReR8veGywhfgq+oaGXkWRN0au0XM57KgLI?=
 =?us-ascii?Q?IWnOy6F2c8DXvHrdVbN+nf8bD2yJAb5fwC80YmOX5R6+YQ0YEqyJUBMXyCMg?=
 =?us-ascii?Q?KylFlzznBDdbTz8Nea0xa+Sd6z5vYHvnSGOajQKLyi7GbUF/N0vLc/pzeBTH?=
 =?us-ascii?Q?KkEi7vxg3JlqstK1gEH4mt/XXhUKFF1DRB7H7Jj2wIxwilAQHfKbg6uDE06C?=
 =?us-ascii?Q?2CjdP98IctcYm1/xH0EFjhx2d8ub341PIuo9G+1irhxtUQbPl7F4/Eyd+JZO?=
 =?us-ascii?Q?h0umrTgMIwisx4Y+UcKDGdGX7YOyY566/Sehcf2Sf+WBZn32GFLMtjWqm0o1?=
 =?us-ascii?Q?/z/cxSyB9g1GZzZQhdAPk0ZhzLyOf3YiF+Eix3QqAEYKVso2+K276KeVdPLe?=
 =?us-ascii?Q?QNVjJ/IoKrX5iQBZJGrgRMK11hMGAbBn/zifoujIoFPrrUiAQn9DwnUyxUmU?=
 =?us-ascii?Q?VB6BUKkWMtzhXfAV9LmrtRk9uUE0NBbyy0fNFRga9Mw8z+0zaWGf54lgBtlk?=
 =?us-ascii?Q?aMQv75upFCRKgxS7KBpT/uACUEXMdmu/boN+KwWHia0zgOHfdyup8ehleKXM?=
 =?us-ascii?Q?slKo/LiK4J8V4H1MVVH4jh2rl8QXHvjOvYMSV8A+f7UvhunHtn2cjzSBaAPC?=
 =?us-ascii?Q?0GbLN6BJb6mqeDfsRv4xA/YhXeGqZ9c153INExAoUzWZM1Xy/ZYj+yLN7fHr?=
 =?us-ascii?Q?usZh+/bmiyXUFNFIOvflhExUzog/GWNMN/VE6Fre2VTE+V65intHiG1BwQ7i?=
 =?us-ascii?Q?T0mLyZriQSzyV+xqm29fQguDdtnbecZkKxFM2r9zTcuqUNBflb7sswbilCnX?=
 =?us-ascii?Q?WvKujAeHbfSNPApSFqGhsIAYVgljfHdCqoVGmLkkHMl8iReBHtUMAy4Znlp3?=
 =?us-ascii?Q?Gc8o4/+zBask6XuOgR7mQ8V8Sgcpbko1GeKPHIQM5WlpAElWuFVO43Rwbgko?=
 =?us-ascii?Q?lF/jXzuOnGkOF6jDb0Lw0v+Q/bZ54ab4kryKI0JyHg9sMs43XwG/y5MXvzmI?=
 =?us-ascii?Q?A29A9QsxMlv0GbYIse60s/RE5a9X4hDVQC9D1EsMtFMNFzrKdU9XlGLklAZ7?=
 =?us-ascii?Q?FnbyJiSuas8ZGeKy50NLCTEUF3PGfQLbghMSiXjpJGwTFhkZ2vNkonQ2zlTN?=
 =?us-ascii?Q?YxoT2z8ZvYhtuoYjIpeFylxoKJ9TVrEFmKwSxhseKY4MuAxFbvcmaHq5hQK3?=
 =?us-ascii?Q?F2HTbT4EQlUOcgKr9wMYcIm7b7hZNTjmcOR1PRljsnDj2wM7m5AdXBVRVO8e?=
 =?us-ascii?Q?A2qJe9M7JD2e1fgannuYUNYnKJOyVT8HL+wkywcrUbw5u8EFherf5NOQW7PU?=
 =?us-ascii?Q?erjAEvgWNglUb1jBCL8F0uuFwP99Ds/R/+5cPih+Bu2Fyc8db+XpiVpv9rd4?=
 =?us-ascii?Q?Tf+g4d6Bkcp27U9UJDK/MoD/wQSl7dEerrYk+tYI8enXQwl/tWkg909bzdwU?=
 =?us-ascii?Q?NWdVnMls1Fyub+jP3AGu0BKXzTmIo7RBOXw+if/4mRwqIQsvGeidB+Wb2ag/?=
 =?us-ascii?Q?y65WcI7v/gwuSvl0pG1WBrYFgWkKYWyV1/nLgoY9gwPD4OAdOLbK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de60ace-231c-418a-79a5-08dec7cfb350
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 15:40:01.5281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zU077syS8HW/c8vg6ncTP335tCZfQGvh+TaHavppQv8we5zhQ/6w7fr3K6NgS1TYg1q+yNxvMN+dxAv3ZWy/FasH0gZzm/V6F5n1MNrjjXDhlXNBR5p1lPExjqyziN0n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10616

On Wed, Jun 10, 2026 at 08:52:43PM -0700, Rosen Penev wrote:
> Use of_irq_get() which returns a negative error code on failure
> instead of silently returning 0. Split the IRQ validation check
> in fsldma_request_irqs to handle three cases:
>
>   - chan->irq < 0: propagate the error (e.g. -EPROBE_DEFER)
>   - chan->irq == 0: IRQ not found, return -ENODEV
>   - chan->irq > 0: valid IRQ, proceed
>
> The fsldma_free_irqs() function's !chan->irq check is unchanged
> since both 0 and negative values mean no IRQ to free.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/fsldma.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> index dc70a6bf5723..0ee3d719ae95 100644
> --- a/drivers/dma/fsldma.c
> +++ b/drivers/dma/fsldma.c
> @@ -1070,6 +1070,12 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
>  		if (!chan)
>  			continue;
>
> +		if (chan->irq < 0) {
> +			if (chan->irq != -EPROBE_DEFER)
> +				chan_err(chan, "interrupts property missing in device tree\n");
> +			ret = chan->irq;
> +			goto out_unwind;
> +		}
>  		if (!chan->irq) {
>  			chan_err(chan, "interrupts property missing in device tree\n");
>  			ret = -ENODEV;
> @@ -1093,7 +1099,7 @@ static int fsldma_request_irqs(struct fsldma_device *fdev)
>  		if (!chan)
>  			continue;
>
> -		if (!chan->irq)
> +		if (chan->irq <= 0)
>  			continue;
>
>  		free_irq(chan->irq, chan);
> @@ -1178,7 +1184,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
>  	dma_cookie_init(&chan->common);
>
>  	/* find the IRQ line, if it exists in the device tree */
> -	chan->irq = irq_of_parse_and_map(node, 0);
> +	chan->irq = of_irq_get(node, 0);
>
>  	/* Add the channel to DMA device channel list */
>  	list_add_tail(&chan->common.device_node, &fdev->common.channels);
> --
> 2.54.0
>
