Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8932E739;
	Thu, 15 Jan 2026 10:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768474547; cv=fail; b=uQ/QEbA59FQXtr7i0eGD60rqF9/BmIdIRbKli40M8UJgRFe4LsRW2orfY7Y60/Vw9jUT/o3+ztxvjo9ZJGf+xnSnw3FvejtfwxngH+kHSkc1dqe1xxSMcUAZ3uMU7OnLy+Mh3T3+bEs6H8NfLuKVinASwh3S1TMOASIS1hasgTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768474547; c=relaxed/simple;
	bh=HMXK4eYouXRF4HaMTiNmWhMdxeFAB3alK/uUQNiOEpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vvai29lH5B2mYyIDy9N3SNci627Eh1v4kpmk2oYOXdhYuZc1dTRDqWl3RS3afvudsFbbPnrHzHOOaChmDAryIX88frmVD3V30Q7ve6cMXARk9EGDoX73MGnsvSJ6/6sCulg34uyY+vnXjayh7vyqiLrmXS0ifoiya+VTs9kDcZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=c+/ffG+e; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KOy49GXo; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="c+/ffG+e";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KOy49GXo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5fBRc1686043;
	Thu, 15 Jan 2026 04:55:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=sPZI3aEfHIhV/cYYpb
	S1A8B8in2IKwvrsY5NtG1q6f4=; b=c+/ffG+eXtmSjLE40hesNCxvvMHcr1S7Xl
	gIErkPYk44GVjP3/DJrH8ow2xlPCOmeh+niAPO9KJRkmlKM39tUXYHDtvjE79L5f
	ZftWuUIR5iV0x0kjz/5gW7DHNAOpiqHwEkaBy09EjU97b+Yedn6OR9uyZtwCRwaJ
	CXCNz9Q3M6nSDaJHxlY/tUO+ynokgDjlCCjuJpV9BSBpoLhl8CvEUzbrrX5inu86
	XyAg5XOy9v15evqXlYppnpWE0GsJtagankP6tHIh+sH7gkfOGLHCen6lV/cO7dMR
	gybn+cgmkn+NDxn25TrRI8xNKaClntk0xUOo3/X78gxG0FTDzJkg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020141.outbound.protection.outlook.com [52.101.85.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n5qke-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 04:55:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBHMBKQ/qg7MrvI94uAlWd8RwFT+lUMqrMgfV74aq8pa1zmg/MjoEtzxHf9ix5rsQoCv4hKmiTLmIDwUOGkU4nppaotyqhBnd3IUCAmgWwobYjVFdP3qYCkCV6hsrhso5ij3cnPygv0ZZSzpDoUoLNQpymZq+wHwaCaL14yyY2aA3sgjIFyuq5gCUQOQfAHV38M/byrY0raZUiMxRsuG3zQ+3Q9JDvqzfNnyU1uVa8uVtDvv7YZn2rO1eaeGz2vrfMVzezmyTproqhE3WZO899/liweqsae20ZSS9zG8qKbfnTZv8FQMFqNWFxEi/5IeBbebI8EVMvcg0EKmCJR8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPZI3aEfHIhV/cYYpbS1A8B8in2IKwvrsY5NtG1q6f4=;
 b=Ee0bAVgCgRLxezX777otisoFYgDhoMSeWyJPCb9FUwRwixeKky1uYPi08GwFyt6H3YRMY+q/Lj795oMDzYEVCXzRrxOjTl917VNxLBChzymaQXj7dpwXQdu6WJvUiG8MSq8szQbFPj8he/+AmrAY8D2wM3C5f0lyt7+AqevHfMFiNmcw153qskA7K8zLAhsuOEKGkfZgx7b0zvcjV4u7udwRS9B54PPHDUNYf7QObavj+f2/MuV3b4zWJLGohe3JreF7V4EcWqbeehrXuJ7agZLc6JnvoWncEaeXWNRnFL2cUeJw4RH5dsnnsLCDyAwQxuzMYTJfI9aeZTJBUTs7sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPZI3aEfHIhV/cYYpbS1A8B8in2IKwvrsY5NtG1q6f4=;
 b=KOy49GXoEx9MLhhk8pq10LCaNWpp5Hl5+kcSeL5ij+KIqN2Q8PdO6qayFVnErSMNsQUuVco0fJVyZFsz/nWUpqW4cS/n9zeEsn1lDMaudIt8WimhczZigrntS5DxGTvpAgRDGNsXQdSfFpXW5yKKTbk9YyI9b/u5asbJGaHaBDI=
Received: from CH0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:b0::20)
 by LV2PR19MB997215.namprd19.prod.outlook.com (2603:10b6:408:37d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 10:55:30 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::cb) by CH0PR03CA0015.outlook.office365.com
 (2603:10b6:610:b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 10:55:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 15 Jan 2026 10:55:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BDF0940654F;
	Thu, 15 Jan 2026 10:55:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A074C820247;
	Thu, 15 Jan 2026 10:55:28 +0000 (UTC)
Date: Thu, 15 Jan 2026 10:55:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [linux-next:master 6348/6771]
 sound/soc/sdca/sdca_interrupts.c:212:34: error: no member named 'completion'
 in 'struct dev_pm_info'
Message-ID: <aWjHn6mO92D5xBtZ@opensource.cirrus.com>
References: <202601151803.XY7KryHC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601151803.XY7KryHC-lkp@intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|LV2PR19MB997215:EE_
X-MS-Office365-Filtering-Correlation-Id: 310264f8-bb49-4c53-7d82-08de5424995d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|13003099007|54012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Qf+VPj2TSQH9flYxR6X+zSgenp9xiSuHz6IKf4oqumaoD8kc/G9iEm7q/x2?=
 =?us-ascii?Q?tLwigaMRooKTvYsq6t4oGEpPeI8kaZkBQQs0QH4/STkNAzN6lCxI7vvu/EId?=
 =?us-ascii?Q?yyCYTpQC7tZkkf7t/2miWaCJLBocvDyaMZO7Df2KTgtEf6DgO+hrGzFmoRbO?=
 =?us-ascii?Q?ZoMr3g9LnQDRopZzZBFys0ZdC2VBuQoYkZCprR/KsJc5hA+ZqUWyuM7dy8wX?=
 =?us-ascii?Q?UH6vsNvOC9zpO6pldEXp+CpUR5zhL8uXYR6ALLPOsgfIVWe/Xten7xUnXaAT?=
 =?us-ascii?Q?s2NkXAG4CWqaHzGoD098dEZnhJiRSvrXwKge7lhNGFhf6tTWIhbqp30YXjQy?=
 =?us-ascii?Q?7XO6pCAmpgUog6MOfoawqGwoRzFDeF7s7JxR5nfQLPPPis0TgdIszud1JZCF?=
 =?us-ascii?Q?f95OUrCAkNmx3HdDdBya6GrIdCpjylto9xZtmUt10V95fq9XXM+bPMsxDFlK?=
 =?us-ascii?Q?yIVPKNjCquTFvalMA46WCFMTLgRe3D3jgK+jOeLU54HFlO+t1soZgi8Gp7VX?=
 =?us-ascii?Q?yG9nnDffeLcfUw+IEV/xr8JVUYcIJt8YA/oGoxCviB+LgZ+T9cYwU+zMT41B?=
 =?us-ascii?Q?0QYgs5LX2ZWNtJSLeDAWRoaMMzsaiQoTTJaIxM3+MI9iWip3N1WymygYKlmw?=
 =?us-ascii?Q?1UhBmMkDU2v1W6FltJmwzahHC0cOwOpjIyOi9Gh3YSBHWr1TniFiNLHxTXkk?=
 =?us-ascii?Q?9ofcn2xT+2UsVDeKDc01YVYrQ+ToYrpA1cTmOmMCk3szkyNmEJCBw+D1hCQ1?=
 =?us-ascii?Q?mK4Emgjx/GG+jzlwBUFWU4N0IpTkpRsiyw7fjzTVqZzvn6v1nu/h1UqhEnO3?=
 =?us-ascii?Q?grCX8P45TZ4HbUZL+UB1coFZhLbyYpxpaUw621KIE6Ye2xX9eUErQMxM3UL4?=
 =?us-ascii?Q?uEol/JBjCjx8+jFf1U7WD91ejckQMHZZP3tDwU8tdSYgyVsJiYn2TUePT5x3?=
 =?us-ascii?Q?yej7WpXSdghu4aRb40S29UTLNktxjdOIuDF8PhcMnLeNHY+uGi4qIe5/fUbL?=
 =?us-ascii?Q?wwmy8j/jhwCeIUdmlQrHJW1UXhmSHkRkc1vU2khkuStC8Zpya4MGATlZN0bO?=
 =?us-ascii?Q?cEjhi6f+qvOmkuTZBTyoI5P3SbioSadbItUZsky8r5n+FpZO4IyX/1CypLGn?=
 =?us-ascii?Q?7izunXl0qLszHmWBgTCd9UC3XhB4B6/LgoMrzuJe946vYhbRZyqI6RBKy9Ay?=
 =?us-ascii?Q?INBPKH5pDfDkTOumLMGoSOvmAGKgLXmU33l2otXe5MpbzFKtDl9MvomCkk1S?=
 =?us-ascii?Q?3uHq+vznBemw5nzXxSSGgg4TyDKuqv4ozKdC0bCxIEWkK9hmWJhXqiygOCpz?=
 =?us-ascii?Q?S9uAcf6V8QdpKgr3hvmYq/0Cpxru1lgaxbXGrBPS15DX/bvvRlA6DGNv1DcX?=
 =?us-ascii?Q?ImmQMRYHxLE2SWJ0r6K+Pb5TbxU/rjXHaq7ygb9UnvYbPZgHJxW2jx6loJPg?=
 =?us-ascii?Q?9Zje4eM0hDr27DoDtWPRu3mj8zXOwvOt1vxTJ9/Ifp9vuSnH3Q+gDpSKcpK+?=
 =?us-ascii?Q?lG81V5wgxaa3MXSBr/A7CcfXMeuL7F2oWsS7PFnqU1YIAXPXAI84UoGTHLkF?=
 =?us-ascii?Q?hWiCnwjoQwOWxBLTAmbx6VPorTlx2QCu8IkrRna4waKML7f0uUJ342dI3pg/?=
 =?us-ascii?Q?Sda3seQr4O/sVKXz+Z1QmzxYzS8uXxcBzboD2nTElgbi5kUruUIU6XdUnIwc?=
 =?us-ascii?Q?FhvYsQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(13003099007)(54012099003)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:55:29.8982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 310264f8-bb49-4c53-7d82-08de5424995d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB997215
X-Proofpoint-GUID: NM7l1sJ6YFSbDOUkO1I50vGg3-PjTjKk
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6968c7a5 cx=c_pps
 a=g/OBtAqTw1pRpVLcEUWRsQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=NEAV23lmAAAA:8 a=ga0zpQc42GD_o1WI5HAA:9 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3OSBTYWx0ZWRfXx0qeVg4U2qE/
 nuEzpxov5yYJHiiXTit7AWYCGTp2fRoRlvOubQwINq9UL0DzWmHECBygG7jMkNim0C7BxEb3Nzx
 gZGMaCCkwK/V9TcKihlps1bJC3jl8RNHl+Rdd8C4wkh86CLzfrYxMOVou1vjIcRZyiNhhMt5xR1
 mi+couEcFQl+RooJTUjI151wxlv6g6OGhm/ANmBYBzlEzsr6wA9rk3IumJWxDKoMd1y2tN673nA
 9SiRtod5/Xf3tyH4Y7KuF5vtaaX0DRAdQTzgP+37RLSHRCZL6Vie3iCDKLBNqylKbg2Ok/7U67R
 O21rnFxWeu0kXs2271xFMQMN3eX/TX21iGJjKcUtJ6JjsjA4Yulhb/l2Blfy1TH9yVVg+V+8euT
 wcy8T2cNrk48sXjcrrh4Z+8fTAFJAO8Y3db90ASOS4zlrg1O9LwYInbRj8qxGGM7u344eMQN9jd
 XEqwQX8wJXCQMpXljnA==
X-Proofpoint-ORIG-GUID: NM7l1sJ6YFSbDOUkO1I50vGg3-PjTjKk
X-Proofpoint-Spam-Reason: safe

On Thu, Jan 15, 2026 at 06:45:08PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9b7977f9e39b7768c70c2aa497f04e7569fd3e00
> commit: ffd7e8a101110cba86925a2906d925e0db7102f3 [6348/6771] ASoC: SDCA: Device boot into the system suspend process
> config: i386-randconfig-004-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151803.XY7KryHC-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151803.XY7KryHC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601151803.XY7KryHC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> sound/soc/sdca/sdca_interrupts.c:212:34: error: no member named 'completion' in 'struct dev_pm_info'
>      212 |         if (completion_done(&dev->power.completion)) {
>          |                              ~~~~~~~~~~ ^
>    sound/soc/sdca/sdca_interrupts.c:226:34: error: no member named 'completion' in 'struct dev_pm_info'
>      226 |         if (completion_done(&dev->power.completion))
>          |                              ~~~~~~~~~~ ^
>    2 errors generated.
> 
> 
> vim +212 sound/soc/sdca/sdca_interrupts.c
> 
>    200	
>    201	static irqreturn_t fdl_owner_handler(int irq, void *data)
>    202	{
>    203		struct sdca_interrupt *interrupt = data;
>    204		struct device *dev = interrupt->dev;
>    205		irqreturn_t irqret = IRQ_NONE;
>    206		int ret;
>    207	
>    208		/*
>    209		 * FDL has to run from the system resume handler, at which point
>    210		 * we can't wait for the pm runtime.
>    211		 */
>  > 212		if (completion_done(&dev->power.completion)) {

Yeah turns out this is conditional on CONFIG_PM_SLEEP, will do a
quick patch to fix this up.

Thanks,
Charles
