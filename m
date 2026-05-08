Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66AB40DFDE
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261815; cv=fail; b=hze+hQApTCBBp1ocpQpFvw9Yq10p0nV8up3hUNlCP6CxBX7fWYAOU+ujZ5xjbkSdrTtu3PQfT8DdjX/SurwrH4yxuop0ipEjUWg73qc3QNnFp1INtYdVkmaDAoJ15uQ0bjwXIw8Y8Nvtp7KMwNCrVvkup0Q4tx0xLuGJhxmzuck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261815; c=relaxed/simple;
	bh=K04tWJGrUDYWX/GCAkEIyISHgkWwElE051/vbX82sTk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htBXQPIi0y4l8Z6hPFtsPZqN+rr96uHZiDUQ6NwLNQF6VP+ZxIrGQqG6M4zYD159EdP+L4+U7vWGmDz+Rst8ZTyiDMxqtLHkqxFRI+ElVeZdLGKH1SP+6Ep2U6GEuZuN8Amv7wXfUkMhK7a7yRfjyxAnMs1d2pYeuqEpUOIzFfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pjDBKyLV; arc=fail smtp.client-ip=40.107.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pjDBKyLV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caxrLibuXVC7XcLNpeSenwaGJt+ypoh812s2p5SBC/uJv1C6j9T9l/U2qGAXqOelzJK1qit2scKI1wMhqRPHgWVeVjbQLIXUUtW8gy2WFTxMM+BLIoQNt0sFhgBewtiXX9R9DG9NnnoMZ0JJHa3Qu/01JjhzNHXv64GDJHlRW/Ihpv6E5nD3iwBbvZ1jtvUDTYXQaEjR3C+Iv1cRgIVOkb/yfX2vGiNph/WHO+HF4c4sBDyIQkCgFV1eIbIEl982Aoq9LTUvTiDRHvwOV49QFlCjZxg8N5xHaOgZWgsbogr9XgAokAEK6v52y2OeUYRFZiC2O8cuKE64MipSdVwsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrOXZPMPYV8TADU+xuV7sTn0R0u+MwAXrLWYpTb/HM0=;
 b=p23EjLlqpIdkkt182SAsZLJhfIua72dyqi6txHOpNw7kYIkiBUPsnaebG0f1K4uQerBkUfGYZ3vykXWpfqjnhA7bzBrzX4GgESWuce5iMmsTtjZwB6870y7thdjojsvQ7elM3rTvH1AlI5YW0/BEQJN83ndSZ5aCKqwT0ROtLtAMvnMGIn10SJZFKy4UXby6sHMc/aTsVizv15RdSa/jCW1gXIQPvaxx6YaZStDptlRgnRXtz/j73Gufv7FoXq4TRpduZWC+FDukinWp+BphGwHaMFcdq1YqSa2rL75OCcm+RcBf1dTpkXL09u4us9AO3ms4i+sBBxMTO65zCSmUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrOXZPMPYV8TADU+xuV7sTn0R0u+MwAXrLWYpTb/HM0=;
 b=pjDBKyLVtqNlmYGm4EmK6uHzbvzLkc6BvcuWYjKIu50bgtt1AyVkYs+FmV+QvqESJScBwCq3XYc51D/QOx+HiUHA0XnP/PYSCpfs6q2EZWiTNiwFfUT8iSykupWgpEr9g2d/mVrsN49C+gmq9hug824a8CJFtVTigPCr19jB78U=
Received: from CH5P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::28)
 by LV8PR10MB7799.namprd10.prod.outlook.com (2603:10b6:408:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Fri, 8 May
 2026 17:36:48 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::2b) by CH5P223CA0023.outlook.office365.com
 (2603:10b6:610:1f3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 17:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 17:36:46 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:36:43 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:36:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 12:36:43 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648Hahcj1858548;
	Fri, 8 May 2026 12:36:43 -0500
Date: Fri, 8 May 2026 12:36:43 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/11] soc: ti: knav_qmss: Fix __iomem annotations and
 __be32 type
Message-ID: <20260508173643.fwtulzz3fkvplsjl@gusty>
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-7-nm@ti.com>
 <d22c52dd-7bb0-46e1-8014-b470ec4f0c2f@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d22c52dd-7bb0-46e1-8014-b470ec4f0c2f@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|LV8PR10MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 661b93d1-01f1-4213-beaa-08dead2860af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	V1fPyLxhrx9PCvx7AwDBsXZ8yfEl4LNn5LFO9V+GQeWXTDqv8E45nCp4o95WlS9aZXa4GfKM7pmzEZ3A5Go38e72bGSO90F9XenVI4lunDTy7F7z9CRdt41/ONxL7r/vT14LEMIRhaRGWEBwqfFAm3TRf72saLIEUEyvWYqhaQFz3j4MXQpXNMLwrwWC2uL0R8etoZG68tkyfBt21964E8BqpiE2DRbeKg9zvZFLnnNPax4/iKXX2gkoP4Un5kVE7nXRs5JV4s9Fi3z7hnCWOFZYtltBgIKFHQCFOTtZdK91uz0Vy7BNUo9j9YyZbFYrj8GsVNW/OybELapSzP7Zao8yw8W8GsBEyMmHTVP1wgOgGEfzvKWbrzCnDIB9b5l9cnuHjuTe964Nx9a4boFZqlRX7u9zecO4PGa3fjidGTWntrJi22Bu3CDr/1cajvSaRCANg6rBwf1GVPD6t2DGwiVLfx64iGvKTG7I79yGPre5+/348K5emF8oh9MikyIpmO/Asp7gI0s9u24fD3BSzh+j6PfiQ7OVG0sYlu0RJAoUM2XBCv5kyuJpeGowTAowmKv64oIWs32m8va2ApH70n0Eqp0yKHWfg94XWiCX4yCYpHs2nsGKROs0x8QdPnPDn9TGRwBprtQUhFl+EDXoq9h8cUjSK6HSE2VjXnNwlGRnvEeRlrvwEdX9A89FFZ9fUvdeoaGTM0G/I9saeilh+B+buQ/kYo4HfgVetnRutqk=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4qMQvxzzATCzC4N8sksIz194aktuSToXAM6q33GQy/Nb0SALOXg4nLpnRcM4Iy3NRoWiPDSeFZX3MS4jCviv3z55DdhClycZLszTIDNVhw8I2JubDHNEkjtGcdW5ZEnDHl9r6ANHzVProD8M8adJT1PAXVi/Tfj3RLy54CeSgoXMV+QrBEwfEhTyHtA01dttfuDgX9ltrwEs6oVUwTuwgAxAuzRJmAVoImLwajYOb/Qau34SaHLstxQtiNyKrkM3YBu+nUcFYAgzYE87h6MeFnkzkxVyEzF6oy7WY7cA6DeixCLUOJTOhNiKmOp6IRtTDst4n5IA86BIeXeViBHX8IDcNhhTDC69dTlZFQ6Fg2DPZeTtV5c/aQa2uWc4Pf+/7xczBkLjcQk/kYQ8IXrpLva1J0c4wpg2NmaK7e2keREcsRzzBMu0cr6H8ZSZm4X1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:36:46.4756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 661b93d1-01f1-4213-beaa-08dead2860af
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7799

On 12:14-20260508, Andrew Davis wrote:
[...]
> >   	writel_relaxed(val, &pdsp->regs->control);
> >   	/* wait for command register to clear */
> > -	ret = knav_queue_pdsp_wait(pdsp->command, timeout, 0);
> > +	ret = knav_queue_pdsp_wait((u32 __iomem *)pdsp->command, timeout, 0);
> 
> Why not make `command`'s type `u32 __iomem *` instead of casting it when used?

pdsp->command is __iomem *, from what I see, from
devm_io_remap_resource(), writel/readl_relaxed and other usage where
void __iomem* is used with command, and arithmetic used across the code,
__iomem * is intentional, except for this case. i did think of making
knav_queue_pdsp_wait take iomem, but that'd weaken what the strict
checking of a single u32 reg access it does.. this approach looked the
better of the alternatives.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
