Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011028.outbound.protection.outlook.com [40.93.194.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAFE3FE64F
	for <llvm@lists.linux.dev>; Fri,  8 May 2026 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268613; cv=fail; b=rOlJ08QDSB06M8AYNaqSERd0k9Dz3bt9i7i2e62D0l2ZfkiPDQ8cBnz9ayQJ6MTYJnG+I8S8HRpm1BHyeX1SjpLbm42xyLDjgqcC6WTuhOx5Dkm95tpEO78e+8+Nk95S4qaGllK/HkYhF/oQk7PRatWdTZC/0zIbbNUmfDDMTbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268613; c=relaxed/simple;
	bh=tLhgfVtER6MmH2lcuPjsNpnH7gA9+y7vW3ceB377R4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HMQs4/2MY0/AQaBKblCKLy7WwkWsYSzIbg9627ZJYf/OUspowIUFqkRhCk35Pi5Nj/Fkt87ZngV1n7eYRr+BA63Kdqb4nQc1JbnkhW57ycZMpb01hsfULer+PCTpfjGch3s82E5NF7Gv8ZEDCfliuyybarYv2CsL9ll0AT5l79g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QCVSFlhE; arc=fail smtp.client-ip=40.93.194.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QCVSFlhE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c42uy6Iu+GhMoTlqPZawuZndtv0Bncwpd117PCcxtnQtGoltnlHwQ6z0I6NR4QwYxj9avP6ZW0xuWbPNdNo2Jpo7hfViQIdFG6zJcYIIuiEevXCqyCSf67lELAgSBShM6XcNsiOhZhRj/8KJaiSNKwg6qC3Huo+BDkhiiwfpydAcx+z3ysoi/9U3yrYdXjJ2bLJnLuBvyzOHhh2AGZ7ak+n0jv4mOT6Ew4xB3rlDhH1qsGpGlD9noUViVXlWo4WUxuemNcU8CYz7tf3CjqoLYDfGfnRf76L5wYiACuhv1uWrtTe0ra06cw8g2Jwb23Eerq6cdyd3FEYpeFHcOQmyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TL0Ao6XQVPXJsnoYZXzcDG7cGaOWJMdi9mDgF7Hdq6E=;
 b=MHxi8GV7o0BF25F3QKm/aRhq45n1phgxRCJJ85GDHnElX5wKEVhPgxRyVWepIogDQeMsE7cSerFGdwdfNMuM27J7CP5gQQ24KkUbyRWJVr3Nnkl+FgHbGFRk7anr67rJ2yrVFrihXoMEBU3ZJ9rYHfhe2AJ9202LasUZQQTgAQCZbZ5JNf8hXUPptBluLKU3Z+YLHiSTcoqWZDtJDVB5vAZ06Ai73Jvl0LvmeslFS281V/dN4RO85s6blXfGD47jrX8POiNaotiTYfopbGp03M9Hx0ISatDk1f0B0geNHX2Jb+ef1TmLd8RLEAmZS4eIh4jNZ8JI2zlGQ/1RJ1OATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL0Ao6XQVPXJsnoYZXzcDG7cGaOWJMdi9mDgF7Hdq6E=;
 b=QCVSFlhE8v9rXIuZery4JcgJVAe6pS66o8lJ/XwQ7BHD7I/vRSZRC2emMTgrvnf52yoHmT7w4ov5TLaH9zr35yw+Ri1Qbkft96s/YQ1cZTw5Mn3yR9KSKe050xsDZ8R/SDfRDGp2cilAe/NrCMoAJv5/9ul9KfqEuhFDDPHHdnw=
Received: from PH0PR07CA0103.namprd07.prod.outlook.com (2603:10b6:510:4::18)
 by PH7PR10MB6988.namprd10.prod.outlook.com (2603:10b6:510:27d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 19:30:07 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:4:cafe::e8) by PH0PR07CA0103.outlook.office365.com
 (2603:10b6:510:4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.18 via Frontend Transport; Fri,
 8 May 2026 19:30:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Fri, 8 May 2026 19:30:06 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 14:30:04 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 14:30:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 14:30:04 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648JU3D22104762;
	Fri, 8 May 2026 14:30:03 -0500
Message-ID: <87a5bda8-9586-46db-bc3d-6161e517b180@ti.com>
Date: Fri, 8 May 2026 14:30:03 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] soc: ti: knav_qmss: Fix __iomem annotations and
 __be32 type
To: Nishanth Menon <nm@ti.com>
CC: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-7-nm@ti.com>
 <d22c52dd-7bb0-46e1-8014-b470ec4f0c2f@ti.com>
 <20260508173643.fwtulzz3fkvplsjl@gusty>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260508173643.fwtulzz3fkvplsjl@gusty>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|PH7PR10MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: f5479554-fea5-4499-b33f-08dead38360a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	66+y0YAmy9A01Qcovyc3LIMeE+SO0ASuOilwUyEvkGpq/9PhXCWmolmTgzthwsc6PjqcclyiDiUbouhrcNjUOpFIH0VVrM+H7y5sj0tMSb4aueG53nRdQaiSLNzJRXxUmxYMrSkC95EIWI/FaWPeIta0jBBaZna5maA+8wZcJPUGeP+hSa/V1Nd7S75gCc7/C0xrlCFtXn9EZu7FW5i8Ys5JLsJYqGp+vvDsvaE2u2CcDexVY0KGpREG1wbOy+yO4MncmV2U3Wvo2WvJ6Vf+Ic69c6KWlUAsuoP94fmm/wSBJNbDYJxSHHkAO1ethmTPH/mLNr0/ZMCq04bIDeaaLb+zPdRik6PuNCqRkL7ZL/NyNz90yTUG6GzlYzQFNkF0wybbU+WRuAG6kGCZxRtVNJ7arNFjE2pdpoun+oBGl5zkopudvvn9Iay+DXAbW3X1X3sKhlBWzgbLIm/sOwO8vZ8mK86CgLc4ujRLyWh45CU2NRKQT+iBrbCEmPpDTAXOscj8RbQtbneIngqrGSgtCp1ooa2KSX7azxQWfOkKK8yqweCu8n2bceAlIpC5DEBG+zqdQQm6pMzTcLqM0a+ppYaHV6qYM82T2B41NLYSgqIqRQfuX+UvI5BSbrhL6mAvKEQ0WHgT0m3YdnwUQ2pjA3xH2By5kwddK3NFUzmqM3svobcFldR2TDilpuug2prBvbyqKEf35sMtOS/lmTM5nzM9UWsSOp1dIV0x8KGuYsA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xhxSzQkHKUkPR9cNf7Qn0Gx2B0/18dEMO31WZWyoidgJ6BLRD/3HZS690ON/jsYBbXqdiHkdT2Wj7glt3rHMj4ofKBgKzrT4d4YFVzAZbL/uccbu0wHBQKNJV2RVVKE5ClpjzjnPpU54ux1gFRb9EWGbtOKLpxwLel3vBuWI4JFmvzDGb0+4cTI3dA3Db8zGkrzWhcpTKEDIrKGJOKG6duen4vCv0XBv7040GIKz3sJu0KRS7iUDqi/C2nwReW0LgzeyzFNrZ6HDFO4bXQngJ8ORxmy+ry7QAB6pYWG8SsjuAcOdPvwrv9dWmjE1sKvraSZxjHwgr52egrEu7t87sD3hBBa/g5dF6dwjb1RP1qgnjRD7IoQnTm29SlP/zNu+rsermIFnkbUQuVnbt4Q7ZscxA2DNVSLjDzKLJKqPYPbpWMSi5ibTr2p9s+W8kvyK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 19:30:06.8795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5479554-fea5-4499-b33f-08dead38360a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6988

On 5/8/26 12:36 PM, Nishanth Menon wrote:
> On 12:14-20260508, Andrew Davis wrote:
> [...]
>>>    	writel_relaxed(val, &pdsp->regs->control);
>>>    	/* wait for command register to clear */
>>> -	ret = knav_queue_pdsp_wait(pdsp->command, timeout, 0);
>>> +	ret = knav_queue_pdsp_wait((u32 __iomem *)pdsp->command, timeout, 0);
>>
>> Why not make `command`'s type `u32 __iomem *` instead of casting it when used?
> 
> pdsp->command is __iomem *, from what I see, from

It is a "void", should be "u32", that is why you are having to cast here,
not the iomem part.

Andrew

> devm_io_remap_resource(), writel/readl_relaxed and other usage where
> void __iomem* is used with command, and arithmetic used across the code,
> __iomem * is intentional, except for this case. i did think of making
> knav_queue_pdsp_wait take iomem, but that'd weaken what the strict
> checking of a single u32 reg access it does.. this approach looked the
> better of the alternatives.
> 

