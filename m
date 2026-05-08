Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010044.outbound.protection.outlook.com [52.101.193.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE9536166F
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 17:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778260473; cv=fail; b=WXQqGTSYtZxjWBh8b1cN+rAmM/RRv9miez7A1QEU/Pwgu3iUo0UYwE42uDFcXGYj46376LeUi3PjD3IU7kKp1zjIvUH4YnaNfNo0fBhlbM4pPaayTrr37XCfB1zxkx7WNbszZqQFqg9wyTnhcilUPvKJUruHTFA0u/S2aATysws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778260473; c=relaxed/simple;
	bh=jEjKbuE2e/gX+6FlmqTdpDd8/shgpF3Hd1u7TmbV+2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=olIub240JOFMqumRLZxAoXvwhZ5OraU2cm71SfQ8jEXjmVEHXHwvq7ELoD5wLv34G2gLcV9stOBFXvJNYcu8tuUccPAA/gJ/q33D4U51KjSU8kUoUyVyoCcr+cCnoQbu1tgRBnex5f/MQeyfY/ayMuxRVGyrV+jheSP0/Ro9wAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AKu/gxkf; arc=fail smtp.client-ip=52.101.193.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AKu/gxkf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNXYjBQZQ8TaXijkLwOncMsVaG+QAdN+FzWUjmEFlF8/QEHYHAesC1Ee2Ok19jBp2wFFtV0spFRDNGiFQQEyPLJVvYpcAFQN4Bp2+eWeROdfGREon/+nVUVyGDNBemHuDrSHF9wh1NYSI3ruTofZQk0aZkH61DH3dhLrAdRfMriEH3J/NqAaGY9XzeNKUMpK0RqKTGLrpvmCQr5RoB3CwHXwj+CahlxvkCS6fzeVLZ0SEzkgb0VjLxkjAECZ42a4IUOzCUIPBpKYySNW7Dh7UOZs6AyPS/bzTuS7BpU5PALYmuUbKmpZzKEZ5NUCVdc4I50BmlrtWPxgEz26xHfKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xEDzvW7twQ9LyePH8wWLgUfW+M2Lc40j3ex/ugwIK0=;
 b=XuivFDKjQpt1uRl3HRy2BpZ4kVgyFB4bT8QyraLU2qlE9HPBTH1E9ZzrCiAk0YuMtvjautXqNIsH9vVCD/Og5kPhAEFEux4f1lUm+nsBq7XoBEc20pRDPuA9tS1e/anKd3RlZ1LCDKvKYLPt760jjWJWDe9QkUxJ1HS2e2Oo+X1uE2iljn3+2ycT5vP1yaQBZsCehUrpVREobWM9d2ULdD/hXn5KmdcHyv3UzA3BwCe5NlpztHSpEqGo2gV/PtpIgbA8smEThKlLfxvg++d4Giq6SNbwP4OKuq9K0+GdZvxlLVbTrNmg2pqKqVoh5XPO3ljxsA49mLhM9kj+8uDYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xEDzvW7twQ9LyePH8wWLgUfW+M2Lc40j3ex/ugwIK0=;
 b=AKu/gxkfjTFnYKWcXNUJvS0Mkd0aYgGCq4bkvT867fWwGH9CaPh4shA43xeG5nLz8gi1rqhgyCmuJS4gZuy5G9d33c8KBtgszBFuiHwwSg8RyVDWKPoLS4FFBsPq/2oay4aUW/anZLlVP94grHFgMsWphrBN8dYfEfLtU8hRH8w=
Received: from DSSP221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::15) by
 DS0PR10MB7089.namprd10.prod.outlook.com (2603:10b6:8:142::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Fri, 8 May 2026 17:14:27 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:8:3d5:cafe::3f) by DSSP221CA0003.outlook.office365.com
 (2603:10b6:8:3d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 17:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 17:14:26 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:14:18 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:14:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 12:14:18 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648HEHsg2139059;
	Fri, 8 May 2026 12:14:17 -0500
Message-ID: <d22c52dd-7bb0-46e1-8014-b470ec4f0c2f@ti.com>
Date: Fri, 8 May 2026 12:14:17 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] soc: ti: knav_qmss: Fix __iomem annotations and
 __be32 type
To: Nishanth Menon <nm@ti.com>, Justin Stitt <justinstitt@google.com>, "Bill
 Wendling" <morbo@google.com>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-7-nm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260508153211.3688277-7-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|DS0PR10MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ed91b2-d10d-4f65-8188-08dead254207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uE3zHepnqOnqUZpAOQBH/19vDFI49SJ237buMKGQS3SQLC3iZJDITixVn6MiqK/f4lf6RITifR+EbNK38/fBwTifeK/RIVA0XPPvB+DINna9zuWhEff8+xwrKLFfo9tV2gkW3/PVINJN3hs06QqGK1Cr688I+WPhHldjDLU3Aj2T/DoWbtP1qBSrtwG9iMzZEYog7hAF8ciQu3JYg6bqoB48/4t99vCbWOvfe1Hi/4c4EEFIS3/poe7a6dJidwhGwBxuEl2hRQE0zVBghKgxVptWvE6KGPaiXm/frnsBdOUNad1MQSsJYiCY3dehEYLkWpYDkA26WIaTwECH/nPWHHIRengADd0JhPSkaKNObtPpP7mmohJGb0IktmaD6GOgwuITPt+p/7oDY8no54xlpDkrGPGAcI0N70Klq46Z1mTabND64+RCLeIUjXxXrhAR41YtqIhtWTRFZYiV1+vmD1sGJNFfr0AdllbM4q/AiyiQ136r2CmI79sCuzCqPWZ7VzL4/tQiBlbPqLS414GbNMX1A9MXCblDP8SdhZR5VN9/RMQygYCb+vtMkLJbLRcKjY0eyN3yPXtq9Z+sSCLWTj56CTVd0m+9fjofN9ZpJxiX0AV7YOMHEg64m4eYfFfHYm0OaK/jfkNC40IBWdRv9JV5Q1M4sW32E6lWBRF6mxZjKMe4IyZ5PuXAm1YksHLMag3WYFiylgGGE4cVpqAonvylFJMdcRXIGRNjP8H2TVM=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/YH7H3wWq0n1XdYwUewplfrv2Uy8E0D9mvlcpyG1B6aFV7Nulc/FboHNHjXzmTMWUJX1BJ+MAifT4HwWPPSFFB61cEQQ8NSjdH1Y9SyE8Va75D/zhkh2CNDo49cZ3djNJpnSI1MensCmEknbIx48ZxURTKRUXrNkMw85CfHtsyUaEzYLG1ek1I3B6fLV6GH6deYyl0xuQ35wQaiWygJZW+RL6MXP980e48T5ZAPn0kxqsNs/R6njket5/05SuiWxMkRxxq1gEXqUmGW3P3OJdhHUjytoF5nuken7iuTU5BNd68BaRRilA3AORrytHQPxPsfNyUkPip5vlkOp02MM/aD3DksP5HjBhxNKrBu0fwF0HVLnOtsTs8kU7w9p9mPFLB7G5WppZ4jSF9yqAdgTyIDY1WtvokWvi/FOLxaC0BXAgAisuSP0EZ7vWattTAr6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:14:26.5399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ed91b2-d10d-4f65-8188-08dead254207
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7089

On 5/8/26 10:32 AM, Nishanth Menon wrote:
> Fix several address-space and type annotation issues reported by sparse:
> 
> - Fix knav_queue_pdsp_wait() declaration: correct the parameter
>    annotation from 'u32 * __iomem' (pointer-in-iomem-space) to
>    'u32 __iomem *' (pointer-to-iomem); use 'unsigned int' for the
>    timeout parameter instead of bare 'unsigned'; fix the continuation-
>    line alignment. Cast the void __iomem * argument at the call site
>    that passes pdsp->command.
> - Use IOMEM_ERR_PTR() in knav_queue_map_reg() instead of ERR_PTR() when
>    returning an error as void __iomem * to avoid 'different address
>    spaces' warnings.
> - Annotate the firmware data array as 'const __be32 *' instead of
>    'u32 *', as be32_to_cpu() requires __be32 input.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>   drivers/soc/ti/knav_qmss_queue.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index 50072e9dea37..412b91344d20 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -477,8 +477,8 @@ static int knav_queue_debug_show(struct seq_file *s, void *v)
>   
>   DEFINE_SHOW_ATTRIBUTE(knav_queue_debug);
>   
> -static inline int knav_queue_pdsp_wait(u32 * __iomem addr, unsigned timeout,
> -					u32 flags)
> +static inline int knav_queue_pdsp_wait(u32 __iomem *addr, unsigned int timeout,
> +				       u32 flags)
>   {
>   	unsigned long end;
>   	u32 val = 0;
> @@ -1368,7 +1368,7 @@ static void __iomem *knav_queue_map_reg(struct knav_device *kdev,
>   	if (ret) {
>   		dev_err(kdev->dev, "Can't translate of node(%pOFn) address for index(%d)\n",
>   			node, index);
> -		return ERR_PTR(ret);
> +		return IOMEM_ERR_PTR(ret);
>   	}
>   
>   	regs = devm_ioremap_resource(kdev->dev, &res);
> @@ -1556,7 +1556,7 @@ static int knav_queue_load_pdsp(struct knav_device *kdev,
>   	int i, ret, fwlen;
>   	const struct firmware *fw;
>   	bool found = false;
> -	u32 *fwdata;
> +	const __be32 *fwdata;
>   
>   	for (i = 0; i < ARRAY_SIZE(knav_acc_firmwares); i++) {
>   		if (knav_acc_firmwares[i]) {
> @@ -1580,7 +1580,7 @@ static int knav_queue_load_pdsp(struct knav_device *kdev,
>   
>   	writel_relaxed(pdsp->id + 1, pdsp->command + 0x18);
>   	/* download the firmware */
> -	fwdata = (u32 *)fw->data;
> +	fwdata = (const __be32 *)fw->data;
>   	fwlen = (fw->size + sizeof(u32) - 1) / sizeof(u32);
>   	for (i = 0; i < fwlen; i++)
>   		writel_relaxed(be32_to_cpu(fwdata[i]), pdsp->iram + i);
> @@ -1610,7 +1610,7 @@ static int knav_queue_start_pdsp(struct knav_device *kdev,
>   	writel_relaxed(val, &pdsp->regs->control);
>   
>   	/* wait for command register to clear */
> -	ret = knav_queue_pdsp_wait(pdsp->command, timeout, 0);
> +	ret = knav_queue_pdsp_wait((u32 __iomem *)pdsp->command, timeout, 0);

Why not make `command`'s type `u32 __iomem *` instead of casting it when used?

Andrew

>   	if (ret < 0) {
>   		dev_err(kdev->dev,
>   			"timed out on pdsp %s command register wait\n",

