Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6409319873;
	Thu, 22 Jan 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769093784; cv=fail; b=iFDGWRJAFsxuLb6PFx7MFsseF6rieMtiNLCFQgWNn0vlUSAW6Z98NorL5/TIqlUGZENkvETB5ZxjktGBq7aOKeufetZah8bPvMV53kKT+1iFJD3UocJK5xOkPHLUgqsT4Ivctm/x+QR/uNnSAJu8RF7TMLpsmMnUDdkWEJMLUII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769093784; c=relaxed/simple;
	bh=bIhui9a9FNhHp8FqzVOE9BzOYnvEyxMq8ejWhVV4WX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvKOGfOZ7qDDWWcDMDA7YNOYhhsPy9GrjPWuuQSneZf97odh3xN0fUw+qCaqf6asullD+RVUwm/KIGQhZ2BbNZmWIPK7dl21yM1if2y3/oprdgl7NDFmOpHkObFiwLjRHi1Xp/DKXVYiDhp6Gs9dCLSEagcBTt8c4Gr3+XJHKJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cfumuUJL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=z9hGt3hy; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cfumuUJL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="z9hGt3hy"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MCfTL22926933;
	Thu, 22 Jan 2026 08:56:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DRd4EBDG/xeBNJbPIOagtgw7LuWg13v6aMgaASTF8tQ=; b=
	cfumuUJLw7po2wG2kXllX7DNcq58zIYLdVFHRWq+uvDWixWiUHFc0TDJWGo0HRL/
	gNDV715bDVWHZn6nlACtfZH/YHAE5TwYf5lKgfJfBlzvrI1Q40xoPmKJCrDj+TDG
	nuKxzBzR+2yVc5/xxiZ9eiinTRu4h362HrYwRFdtVSbQG6XVNRm6RqZFZ+VGznrU
	O3ZuYOlNu/DLhVjy6ZibXYTsYgmMBUrRVa0cuMhMvNxsIO1mfgKv6V/ub2dsvyyc
	yxJYl7mPVGQOMCmvEpIZ1RjUAXras+IEZhgmRFTD/xrdAv6ugmk7RUdgRW0CQfgf
	HMTe/DuIPujlT8vcdhCxnA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023092.outbound.protection.outlook.com [40.93.201.92])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4br7qjxdnv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 08:56:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7CmryxcUEXSlPD2mL3wYnTCZmHN6nb6j079bEchsUkVLoCzakIO3OApiQeRxFtGncu5mb4hFwNlBof+fMabNghvHsMSKnWKuQVt0z2u1pjy61xsjLAReM6+zjwETrgSi4Wbk6H1Mg3+abDwa8l0geJk5Kdq6sGwnx+UXZmn7STbgAV281fY3r8GJfoQZ1U2W6s8M5Y4yGeQJke7Go0OtoDXz1WSg8abFBPEwRtDMQ8X9ITyujSuhStE/5ATpCAOYfCNZO7N5OZvs1zyL+Eh2eL4W7wZHefE45i3SoVIssh9J2D8I/oGu/owVrTGNy4Iatf1NKuBXRQSGamNTxnKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRd4EBDG/xeBNJbPIOagtgw7LuWg13v6aMgaASTF8tQ=;
 b=AYnYvCOM59hOjDphE9Ut1f2NeHcgAIEGO81I9Sv1pFKzAUYrhH71vqN2+WFG5JWdj7D//Wfn3G+Gx0NNutaEi49UCYA8sMrs6f9OXW2u94oCEACa1JJktKI301wkd+9LKsG1nHCnEvYYq3nq6pWYs4Y5AcStARlrsrxyuFvpEOJCPnpTj2xgc6T385WEDVBri00knZ5XyXO3pU+JgwGru70w8bDBpLikmaspr0r0V/hIidwIVGH5hyOTNLn+dwxj53ZEZv3MXipa1wVaRryMBV4FnIaGpl8XLLgpXlMTCzOABoVq1PZgfENzMEZJwyqLKMFtYR3wNgN4g44GENol3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRd4EBDG/xeBNJbPIOagtgw7LuWg13v6aMgaASTF8tQ=;
 b=z9hGt3hyLbRSnswMMvo6u9nBho6Xqu3xhmPny6UjaNvda8VnM7wEr1WSc1iUbOAm55gDjsXAkQYVApjEMj9q9xyVHr5utfqXcuXBk7QN4PmCF40syalaKW7rEtzix4yytkdGnlz/Zm14ESoMqu83sCP7mKVKg2+DceljymDpxOU=
Received: from BL0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:91::27)
 by DM4PR19MB7262.namprd19.prod.outlook.com (2603:10b6:8:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 14:56:03 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::94) by BL0PR05CA0017.outlook.office365.com
 (2603:10b6:208:91::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 14:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Thu, 22 Jan 2026 14:56:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 32E3E406540;
	Thu, 22 Jan 2026 14:56:02 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 17831820249;
	Thu, 22 Jan 2026 14:56:02 +0000 (UTC)
Message-ID: <22b7a6b0-3abc-4e20-837d-da434111970e@opensource.cirrus.com>
Date: Thu, 22 Jan 2026 14:56:01 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ASoC: cs35l56: Add KUnit testing of
 cs35l56_set_fw_suffix()
To: kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20260121132243.1256019-6-rf@opensource.cirrus.com>
 <202601221843.kS9IMZ0E-lkp@intel.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <202601221843.kS9IMZ0E-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DM4PR19MB7262:EE_
X-MS-Office365-Filtering-Correlation-Id: b309aebc-c698-497f-ce62-08de59c65d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|13003099007|7053199007|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEZKSk9xQThoQUFRUEpqeU91MEMxZ0xOcnRMUkNjVmJtY0toODdRcWRFRE40?=
 =?utf-8?B?QVA5aEZxcDJTZXhkY28rbWRtVE9NbUNsYldVOFZDbjUrM1pUZkxVQ01nYXc2?=
 =?utf-8?B?T0U0ZXloZE9yZHBzdEE5d0NCNW5kSEdGNVkyMzNVMGE5S1ZOVEloUnUzcFVL?=
 =?utf-8?B?YVJPRlY2RnhpcmVaL1Y1aFAyVHZKTUZoK09EbTJhUVg3WkdBbXc0cVZJOVJI?=
 =?utf-8?B?d1NVZ2tMeEptbnZoZnNSRXNGNjBNcDNQOENSZndGbFJielhpc2dQWEhBalVW?=
 =?utf-8?B?cDA0ZWQreFY0RnZDdDBHSEduZTN6SFZxY0VJSCtBNFlZaHBnaUF0eldrKzZG?=
 =?utf-8?B?bGpzREtwdm00UEVHNXJQaW9sQWRjc3p5QUFDUHNxekJ6cXJaNDRHYVFpdW80?=
 =?utf-8?B?NFk4YXlxQm9XZ1JUcC83R1hnSHp3eXUyT3VZSCszMUNnYzBNUkZGellQWk5M?=
 =?utf-8?B?V29YQ3k4M3ZaUTFLSW9yb3pNd21DbC9QK0Vrc25za3kwS1ovdEY1YlJLVkhE?=
 =?utf-8?B?UkV2Z0VMai9DNmQvU2dnWldLVmc4V0t4Y3dMRXR6RVFjeHlUSzBLRzNUeFA0?=
 =?utf-8?B?akJvMktXSVlvS1pCMlBnVi9kUDh1R05EZmdITHd1YUx2UnRtUnRwRHROQXFy?=
 =?utf-8?B?ZFlaSU5VcEovOUlWVlMzbklkSy9zU2RERnJUNEdYcXkyK3p6NHJUMDNPbkM0?=
 =?utf-8?B?WXkyQldTWXBPQ1h0ZHY2Q2J5bVZKYUpuUGthd0xrajVBUnlobjBYV3Z6aWdy?=
 =?utf-8?B?QkhTeGsvUjBReDQ0aUFiVlQwbW5ZT2NWYzlOTDdIZVJJNFhKcGNYRFM2TkIz?=
 =?utf-8?B?VkcrVjNvSzZma3BCOXhZa2JnK05GRkZtYmZhSUZCVWErZFlldDZJTk5uOG1z?=
 =?utf-8?B?RCtKT2NVM1p1Z0daUEhFYzYwZFZ2T0FRWHFFRFNGMG9KZ3pEYTZ0a3JUTHNw?=
 =?utf-8?B?RzZIRDdnWFZ6VVI5MHlJVG00UENsQnRseVgwZHUzNEtNTXUvNnZCY2duN3No?=
 =?utf-8?B?UFYvVnhPNnVmMVRFMFB6bXZJVHVoejhmcFZveDdNOENWZSt1M1NrMWFLd3pn?=
 =?utf-8?B?RDNNY3Z0RERDemlUU3RWUVpiQ0ZEUkd1YVZRQU40Um03djNETjNWQWZRQTdp?=
 =?utf-8?B?VFc0c0lleFhYRlhNcWVWVzhMRGhGOXkrZmdlN3VaZkpiTWhRR29lRWZ5dy9G?=
 =?utf-8?B?MHQyM1pDRzJ2SVZGVEk3ZHhzUk1XYVJiT2dIRStYTThFSXRYUzlmNm1sRjdo?=
 =?utf-8?B?ampxeTR5T2ZzUlR6UE5iL3NHT0dpcDJxeFp5K290SGd5M3JxaVAycDBTQ2lO?=
 =?utf-8?B?M2RycGhyY3d4cjV0QklWOCtUbzR4RExsZDRhMTY0a1l4eGVhMXR3OWNUeGlU?=
 =?utf-8?B?NGZETHZkY1UwdWFHaVZNZTBmTy9pdkNNMENaKzNiL29uNGkzUkpYdHBBSlk2?=
 =?utf-8?B?QUFjamZTVFJWTTlTUm9MQ3M2ay9FUEdYTlVnVG9Jem5Tc21uK2pOYVQ3Y1E1?=
 =?utf-8?B?aUpBeW9ibDIwK0Q5TzV4eHdZR0hiOHBqYzdPc21lQ0UwcDNrSGVtTndPd0pq?=
 =?utf-8?B?V0VDNHpZL0syOHRPNnFtQTlzZGYxNzJxOGx1c1JEcTIwaDVrdkt1THBRUU9Y?=
 =?utf-8?B?L0xHdmFiNzZ5aU9wWW9LRGtDeElvU1JFb0JzenBDTWVvSTZ0cnhBVTBkbEYz?=
 =?utf-8?B?SlZHcVdNc1Uva21BL0JZZHhhTDhkWi9FVzFmWDZ5UmpCbmdBY1Nma0RFVEJq?=
 =?utf-8?B?OGVlT0E5WlJLTHMwNTUrY015cHZRZWZiNmlrOS9NOEN5ajVQVXJZQUlUVE1B?=
 =?utf-8?B?eWx2MlRTdTJQRTBzSWRPU0lseERNYWNiY010Vk1FQVlGd05lRDJVb3JVakJv?=
 =?utf-8?B?c0NFbW1pNkZiM1JJOWIyOU1Kd1RHSFpldVJPRzA1OEs0dDJ3MVFZTUVtcjM1?=
 =?utf-8?B?QmU0SVlmblpxS1pRRXkrdnZPajVhVU1ibzdIWWJRazZyaEV1WDNLNk90TWlq?=
 =?utf-8?B?dHlmdDRSZXpYaWNuYS90byswMHlkV05OcDhEbzk4bnFSVjYvSjJ0OWZkL01W?=
 =?utf-8?B?Smx2R0hKMHJGTWpmMkVtNWxLbURnZVkrV1ZSTml4MUg2ZXRKdzBFTlVieGRL?=
 =?utf-8?B?THgvUEtlcVVMWWVFSjJyallhdTROWGthOFIrNUI4bzdYVHF3UDB4RUIxdVY3?=
 =?utf-8?B?Mi9DblNHemIxZnNLNkdBeTdlcGZnZSt3UUpQdWZnR09vK2hzeSthOFF0NEJu?=
 =?utf-8?B?YTA1dHJyRXpMR2xFc0xOdHRZWWFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(13003099007)(7053199007)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:56:03.0320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b309aebc-c698-497f-ce62-08de59c65d07
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB7262
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDExMyBTYWx0ZWRfX6+yYYBoIQoFj
 pXoALVNTNRyLTsyHI4GpxvoOEi3HWM4B7clcxHRgAcagztHU5bU902IfNkjdP/dWzTEj1VAlL6L
 SQyslfa4HSqGqiQps+5ipdxDFAssPECJp5/A4F3nLpn4s1NCAxhzMcWc1jVgbNA2KzHnznxWefh
 pPvvilPbz1EzSGJ4IArMCQybqkEwk3AlT/7yo7CuaJt+jJ6Lcug+VJh2n8UXXqoulPJo6SIkTTN
 1uJyJRKi9PVdwe5p2pfdmFZXnCpXghJ+60PqX5hYQQY6moH3TKzVruQp4uj4lwrt0xWRsi6BqnD
 cpeBAzV7AEH3eMER9B6UNCNDCOZX/VnuxsFwLlOtb7sbCsdVsZ1rgkxJpG+hhe3uL+tjIDpkHYV
 vtQU4GgQ5dmR90khK1rb4LxnW5bKMMZkgIv8aNWevxYO5kZ6Y2sLngiVegKi1WLjTeUgeuN1x/r
 6zXgCF+VeOlsFTBa0kA==
X-Proofpoint-GUID: 1Jg3auqRrhE5aIhdC00l8BUcbgB9QXpw
X-Authority-Analysis: v=2.4 cv=GrRPO01C c=1 sm=1 tr=0 ts=69723a8a cx=c_pps
 a=Ta0D7379KrHwLEZKU6rhjg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=hsye5iHl473IEWifFgMA:9
 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: 1Jg3auqRrhE5aIhdC00l8BUcbgB9QXpw
X-Proofpoint-Spam-Reason: safe

On 22/01/2026 10:25 am, kernel test robot wrote:
> Hi Richard,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on broonie-sound/for-next]
> [also build test WARNING on linus/master v6.19-rc6 next-20260121]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/ASoC-cs-amp-lib-Support-Dell-SSIDExV2-UEFI-variable/20260121-220028
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20260121132243.1256019-6-rf%40opensource.cirrus.com
> patch subject: [PATCH 5/5] ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()
> config: arm64-randconfig-003-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221843.kS9IMZ0E-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221843.kS9IMZ0E-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601221843.kS9IMZ0E-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> WARNING: modpost: module snd-soc-cs35l56-test uses symbol cs35l56_set_fw_suffix from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
> 
Please reply to all people on a thread. And as a minimum include people
who were To: on the original patch email. Otherwise people who matter
won't see this report.
