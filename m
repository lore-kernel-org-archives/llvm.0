Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE4E385510
	for <llvm@lists.linux.dev>; Mon,  2 Feb 2026 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770053691; cv=fail; b=LUupEdaBTPWCEVfSnoaQl/mR3fwYB5HGk88Rrn42dWAhtMDuyrSFNl2rz0p3cZdklNdCoITD1f/qVFCjp9sTx+ybF9vb97/w6IAoIndY5D0dYz4Xz/slUShR2sImfAp9qSpqROkW2v7rmH0fFJkS9kx+Y8ywC2Ig9qLbxhgdrIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770053691; c=relaxed/simple;
	bh=iSgMhBm8uQolLFE2gzLj0iGEKPjqQos9euZuz2mNPHE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sU8FJIdFQzyDSjupmb4zmGuo25dLM4tdZTI/iOhKf1v3rDkz6NjIRy8iRPC6HomBww7tCz1/w2Ef1EKVzpXgjubyDrw8QaUpwkF4LyfUnKRXUj+GDNTdUKT1MuuyTHneFUFNkovZr0ba6roV5bLcVr8HrYdCRBMMDUC41j/1aAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GdtExkee; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pB5eSA/9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GdtExkee";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pB5eSA/9"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6128uPFc1383306;
	Mon, 2 Feb 2026 17:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=f0szo/RIpCBE41M0kbFNDN2O4NI5EIK8KDtHLqxgSjE=; b=
	GdtExkeetLJ6PdbkAZgtYNxtikl5Up2k2hmrA9WU8rLnCYtgIRWuR1UHn9kRXlGk
	OVilMJXi+xr3KlxzYMyKRcFsFCuGw8Pu9wbh29WNvZ7Io/koRPjJnE1jOYR3lPqy
	6EUG3RVwKNon54+m2FuxXxRb7PM2SKo+cYQNUWhIINzGAuQPJtVdkutResYb9eTn
	RS4baQzD64YqmzZDJ3JLhxVzLnlKFu8ZjBDrzlwmm5C9ZX2azisfOCRrmp0fRFuo
	YnWeVRDYQ3E1pDD+pznupe8zYk9A2jFg2p+efVd5ZTv+ikkhQi5pCnMANBBBxz3X
	y13H70KVfQCjR1b2hq3xcA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c1arhjmk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Feb 2026 17:34:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 612GeZD4025798;
	Mon, 2 Feb 2026 17:34:41 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010066.outbound.protection.outlook.com [52.101.193.66])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c1868q0e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Feb 2026 17:34:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWcEyNm+od3bTyTrYBgDgKMtU7hk1/8/OXrUfNpQnMiMoNpU2tGVBqG+RUXkCgF06Axm0ivI0igV/NY1+j6WMGPFq91QbHj9IyDresfW25ROb/kVkY2PpJzHU0l5AK3wyXsynV0nJzbpVBg/hkDGCURAHqyHFi4yOLF6BgQjfM5o+DCk5LkSiUPD4e0LiF79FuBkK6Ii+lo+XrFun7Q0pA7Yp0Qms+ZKB6Ey6AdrVPqgu6PLwYRUlXK8CHPy+GKhuX8YKqlFTWALq1anmH4L7uFnxo/NZRLDfGpb41LA1SEtp0GMLFvS2PtoLaS0OTj8s4MkPBag5eG6f4Vtung/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0szo/RIpCBE41M0kbFNDN2O4NI5EIK8KDtHLqxgSjE=;
 b=sS0YznYyfK3de4pW7cLZd62WQF+ejvlcL89e2ReN8aQJMMjHHVCWDmUSjiulEygXIH9qyWzOXbMS0wkGN4+5GBBiARYi8okEQ+BPFNBQ0cshHe5XfgUeORuyk8/DyUXQVu/+ZwsoVJrTg2IL4cwIApgYEMM53elR5M2xCi8so434Sz6lnfVG+z//25VUtolT/vTck204HhCasQDm04Jp/+s8Bps4cahSICUV+CzcGkP8IEB9J7/DG0xoBcf3zuaeeruyBcow6KOyIL2wwRH2RpTWZYOVIytj41Gmjw0VgD2T4qy9Y+M6xmyRCm2tfU1TyfPU8qeLFFxiIduG9fulmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0szo/RIpCBE41M0kbFNDN2O4NI5EIK8KDtHLqxgSjE=;
 b=pB5eSA/9hIQQC1ihqeJq/z0yfrnfiPIAkXSYWUGoULto8VNmiHWUON6JgVnM8HrXQTUb0pJkQ9eMyZQso+jRIog/HBG+AiCDeqLKWredgr6WRyHvlVv8OKcYkJAotm5VI6NpRcPrWxGzVOgZUSFLwdMbiB+sODzbjEyPkNVjn6o=
Received: from IA1PR10MB8212.namprd10.prod.outlook.com (2603:10b6:208:463::20)
 by DS4PR10MB997647.namprd10.prod.outlook.com (2603:10b6:8:31f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 17:34:37 +0000
Received: from IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a]) by IA1PR10MB8212.namprd10.prod.outlook.com
 ([fe80::ee8a:bd21:f1cb:c79a%3]) with mapi id 15.20.9499.005; Mon, 2 Feb 2026
 17:34:37 +0000
Message-ID: <fd1854c2-d3f1-4901-8b7d-c6ce944caf61@oracle.com>
Date: Mon, 2 Feb 2026 11:34:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs: avoid -Wtautological-constant-out-of-range-compare
 warning
To: Arnd Bergmann <arnd@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Zheng Yu <zheng.yu@northwestern.edu>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Aditya Dutt <duttaditya18@gmail.com>, Roman Smirnov <r.smirnov@omp.ru>,
        jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
References: <20260202094958.1232478-1-arnd@kernel.org>
From: Dave Kleikamp <dave.kleikamp@oracle.com>
Content-Language: en-US
In-Reply-To: <20260202094958.1232478-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::23) To IA1PR10MB8212.namprd10.prod.outlook.com
 (2603:10b6:208:463::20)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR10MB8212:EE_|DS4PR10MB997647:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cbda7a-a246-4cb2-f243-08de6281569b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVlHaXMra3F5ZjllZEkzM1Nsd3E3blo3dmRWMUJjYWZMOWJoWEJmcGhROWVJ?=
 =?utf-8?B?cUxsRjhLOUNWZVFFbmFTbk5hRisrSDNybFB1WGlVRGM2NXBIYWNyWFZ2ZTZE?=
 =?utf-8?B?bE1hQmNnK0RSa2tXOTUraWtxTVlNTHZ5LzFjc1M3RGJtaVJwQWV2emlGaHEy?=
 =?utf-8?B?WGJpdDFvM0dESWwybi9SNGNLQjU2LzBPMWlXSEVJMlJCZnBmbGpXaEc2UkVF?=
 =?utf-8?B?L21FeE1pSjA5aG1ReExacUhOQ2xjV0x0VitTd0tLdjRldWpJSFB3aHNQRHZR?=
 =?utf-8?B?ejdnejFPc0tsOTViQ1p5ZU9mOE9SRndIcjhhWGZpYXZCVWcxRVJXTWpUbE1L?=
 =?utf-8?B?UlJRc0xqMnkwTFRTRFM3YXo1QzVrc3FOSllMem1oc0o4TkJSK2JsSVRWeEJP?=
 =?utf-8?B?L2VlUWZ4ZWlyQWltQ1dUeitVUkFRZFJZb2E3UXErUE5jejY5MTZScUZVQ3A5?=
 =?utf-8?B?cHBqekt3WUtZNS9Oa0RaRnhIU0daSXpwNXdnMi9PNDhhb3JVZ1lDYWQrb2ht?=
 =?utf-8?B?ditQbUdxNWs2NGhpcUU0dlNWa0Iyd3ljZGZJRStvekhPU3M0Y0RmQ0luN1Zv?=
 =?utf-8?B?TjAvL1RxUklzUTVsYmMyWW93WG0za3lzQUlmWHFCUUVHQ1JoV1BVNXBEVWJN?=
 =?utf-8?B?TnNwaytTMUhnSXd3bnR5aEp5Z3psTVRoYU9ZLzJTWlBZNkE3MVRMdFJhaTd4?=
 =?utf-8?B?VDc3Y3lGdDhmYnZPMWRlbUZqcDdYR1BEVEtaN2o0MkIzSUtoSTlNRzRMU2NM?=
 =?utf-8?B?Rk96YlhGaTFoTUpJWi84KzJNcUl5QmYvOSszbjQ5WDhmeEJXSTk4MWRYaUNX?=
 =?utf-8?B?a3Z4cm9qWG12QklQNFpZKy9nV0g4WVM2SW1EaUF2ZWhwY1lFakM5R2JjM0d3?=
 =?utf-8?B?ZjV2dlJaWEFoM3l1ZHVnaXRPTEc3eEtyWE1kMDhpaTZjUlc3TTVxV2EvSTlq?=
 =?utf-8?B?aktZOGNlR0ZvaTVWcklncGJUbUwyQ082dFQ0cTd1SkxQQWlpNGxUa05adEhT?=
 =?utf-8?B?VFpGT1MzWUFhOWozWGlMcndWT0ZVaDJVSmIxVlc3U2ZqMEN4T0R6dVRWNWFn?=
 =?utf-8?B?VUk2aUo0dThucC9DN3ZEaDVoUVVvUjJyQmF1N3QzY3pyR2tzeEl3dndFRStM?=
 =?utf-8?B?Ny85dUFxb0FiNEhOSnZRNGc1c1hPZExSUGV3SThpd0FOOUNKcWQ2c3VUZ0NH?=
 =?utf-8?B?VDhYbXFsN1R1UUg3YkFOV1k2bzl3SUZydE5WYkdsVllTVUVVVEU0NmJCZmFk?=
 =?utf-8?B?MklFdUp2emJZUHhDMVlRM2ludjRmSFpJbFB6UWJYT05sR0V4M1h2TXYwWGg3?=
 =?utf-8?B?Z1RIMHVzMytYbEovMHV4Z0V2MzF3Qk95YU1GSldvby9hRkdrczBvRGp4TmZz?=
 =?utf-8?B?bnV4dzY4empSSXRUQjU5RSt6dXdQcEwxY2syVm1PU25qeUdxWHJSdldaN1BR?=
 =?utf-8?B?dUQvQnNPbFNTSDV1WGw0blhndWZraHNJeXZIWUhNQUJQSTYwbWpLK28zVjQ0?=
 =?utf-8?B?cDN4dkp3TFlock9CR2ZXT1h1b0RUbzYrOTlvREtMOEd2TEo3M1dQWnI2RTY3?=
 =?utf-8?B?dVB1WllKaXkwSEx3UUZFWlA1R1R5SmY4RjFiazFlaVNrOG9LRERoZnRYMEFp?=
 =?utf-8?B?dEswQmgyZVlUOFRMVTZNSFZVTHhkVVhSR0J6dVJIMStJdWNUSmp3bFRHcFVy?=
 =?utf-8?B?eUM3RXM3Y1JhRktnOHFkRmFHRE1TSTZEMDBJa0o2TjREMUlUanc4QTdHaVNQ?=
 =?utf-8?B?c0dkSVpLYXVDMExON0xMTEdKS1NveERWbndVR3FtTUhKWVdHcUtWMzRTR0RY?=
 =?utf-8?B?MnVWb09xNlZoR0xtRzRXbkk1QjVYZzBiakVIUElLaWxReXFzakJoTWNwaStY?=
 =?utf-8?B?N1RhWkgrdnNSMDdzTnZ1NVhIVW5tVDVXZDhIdmM3K3RNUVVHc09IanpON1hV?=
 =?utf-8?B?cE9TNllEQ3BqWGNjYTRiZDJKNjV5R29DTURBYzJiSkIxYW1JbkdjN2ozNnJV?=
 =?utf-8?B?M1NvM3dhbkJxSEFXV3dWUUJUeVNRVjFMSTFFSGpZYnFwcldGS05WbzNqYnN4?=
 =?utf-8?B?VGhGNDc1ZVRQNEdWZ2J3M1ZKUWFabnVLSGpIMUFhc3dQZ1pwK0lFcFFZK04r?=
 =?utf-8?Q?MxJk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB8212.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHUvNVpmSHdtR3hRTERxRUFsc2VkRW4yU0o4Z1FHNm91bm9nSy9VRW1NZ2pk?=
 =?utf-8?B?OE5Ra2hBd1FWMjNPY01oRGRsRExiNHQ4T1oxZ0hsaGNxS29WaEJLWXZjSlVs?=
 =?utf-8?B?WW9jZ0pndWhmaXZ4dHR3a0hidm5HOFVrUndtc2tVZkxtNzRhVXRyTVZ2QlFL?=
 =?utf-8?B?SVBaaHJGVjl1a1ZvMWl3QzJSdVVLMDFqV0laQkwzbWIyUW52bkFDaUdIalhr?=
 =?utf-8?B?QnZhQU1vclpBTGE3QnZ4VmlBSGNzMDdKNEN0eStXOGtOTmpURG5pTVJnTzFw?=
 =?utf-8?B?eVVFalp1MkU5Wklqa25URVZKWmJ3OXltalFOSFVLMEErRHJpaVhBTWJ5eERD?=
 =?utf-8?B?a3JNOTdQWFJSWWFQL1pjbWdQVXU5R29UeGJsT2lIdXBZODJmdGNydzRFcnRi?=
 =?utf-8?B?VlhYWjdzdlR5Y0Jvb1JwT3NkckpRSGI2eEJpSlJpZys0Zk8rTm5MYnZiL2hj?=
 =?utf-8?B?cjhYTFZwRmxHUjRSZkVLODRBMkJsRXRrWkRYaVNkb2dManZtQjU0dmV6R2tM?=
 =?utf-8?B?MVJtaWwrWW1wR00xaXpYdXkrS2hIWFNRd24xNEhtbGU1R2JXUUNjc0NBQkV0?=
 =?utf-8?B?cklydGRyUGVYZnFPOFprQzBlcmZGRnlGbTVqOGF1eVI3REVyOTNpMW1EeEJv?=
 =?utf-8?B?TW5nRy8wbXgyOFJGWXVPSld0TjBHMkNObnFUTVJoVWZEbm5nT3NzYUFJUG9L?=
 =?utf-8?B?NHdHanhNUnE3KzdYSTlSdHduaUJONVpYK0o4Z2pLSU1ZalRFTXg3dDEwalRZ?=
 =?utf-8?B?ckZkdk9VSFFXZGxRVkFNWmpJU2g1VW1zQ3ZmQjlFY2ZNc0o0cnpIMWpIYXRU?=
 =?utf-8?B?Ry9RQURuNnpCUmpRU2NVVW9nbEJEdFlwTzgvci81c1MyZFlvdzZuaUxDendM?=
 =?utf-8?B?UDc4aDkyVmQ3aFZPeithNmNuU25tNTdMcXUzZ0lrSUpvVFFiUVpTMDAzcnFn?=
 =?utf-8?B?eDFMaVVNaWFwY1B2QytLTFBjT3NDb0oxRisxTzhPbkg1U2xFbnI2bm51VC9O?=
 =?utf-8?B?djVWT0lva2MwY204dFVwK2M2eHBJKzBqTjNBNVdkc1JzeGdpcWpnYzA1MFU5?=
 =?utf-8?B?WHVTS0JuZG9uRW9STE1uc3QrMEo4d1d6UitLSk13YjZBUkNWQ29xSUhnSnla?=
 =?utf-8?B?QnNBdzNNWmJMRDlySzU3S3ZJM0xlc2JkZWU1Wm8vTWsweEJtUWRjUHhxNmJR?=
 =?utf-8?B?bHFIckwrYmpVV3YzWmZDNVNySkg5dkM0N0grcFJEdFBValExbW9jWVRRZENz?=
 =?utf-8?B?UlNNQUprZm51SVdkNGt1cU9tcVJxeVR5eEhzQ1RlZU1Pc3VUaDlFNDNUb0lh?=
 =?utf-8?B?ZHJYc3piUitOWDVyNjhWd0N5WE9pOG9tWnZuVmNWNnlkS3pvZjd3cngrQmxx?=
 =?utf-8?B?ZUVXQjhhTUpDQjkzZ2xGR2JaQ1N4UFJmWjkxcGh0SlU5ZkRUa1h5TmYzVU11?=
 =?utf-8?B?NXROSkFnS2VlMS9obDdlZU5OdW0wSHYxVjN1UkJoTVN5NnJiazJPbE50UWhV?=
 =?utf-8?B?WTZ4a09BMGJBQW4wUmxqTlRFY09GUUlmejN5RXNLOHNFaDlLalEyYjNRTEgy?=
 =?utf-8?B?ZS9zVFZ0UmI4eGRncnU2ZkdFMDI4cHRtQXJ4TkV0WFMwM0YydlpOQ1ZuUUlr?=
 =?utf-8?B?WTZYd1dkRDFRTk1jeW9mU1JLcjFyMzlhZkN5QllDRHJ4NWtCd0Z0REtpUzdT?=
 =?utf-8?B?MzZTbTFvcUNzbWE1RzJVZy9aenJKWE41dDg4ZVhtRGFodENJMlUzTTVZa3Fa?=
 =?utf-8?B?aWhrbUNiZktYZlMwNmtUb21sMVVMYTlVK3k5VUNNRFVwU3AvZURiVGZOa2xu?=
 =?utf-8?B?RnRFblIzdkZtSS9lLzRZRVhjY25DR2J6QmVUT3pvcWlaNEZSOVBVYXRiTFUx?=
 =?utf-8?B?SWIxb0MwL2tCVkZvVWd6Z2dRMm5BcVEvbGZwVVFtMWRSTkxXUDBTQnpsQW5U?=
 =?utf-8?B?VGN4a09hQW1yaENmcHYrZWVQWTRKUlUwcndHYzZSYmNpWDcwYzVIZDNIU3VX?=
 =?utf-8?B?SHFQOVFBMFNqQ21mOXQ5bnVYNytCczdBK3hTL1Z3a2kzT3RWbVl4QVd6em9M?=
 =?utf-8?B?a0NjMjNweEtIR1RPWFNQRG8rb2RHZDB4SzRNU3p4VGhmc0gwRWY4T2VVdVhC?=
 =?utf-8?B?NG5ZMDJFYVVyN2lJUXhZTUJDc3F4S3FsQWNJTWlpN1hWd0FxeXIvNUFrWjkr?=
 =?utf-8?B?OVRVUHQ1dXZJT3d2RTVBY0hUMHNldFp0MnVXR2x2ZlFTd3FtbVBONjZhbUFh?=
 =?utf-8?B?eGJ3TkVVOUQ0emMwQUE4VVRrTXVNTFpzejJLazhlM3U5Y1BISVZLeFl5NFNq?=
 =?utf-8?B?ODMzODdiWjJnaU4wZCthYXV1NHRSSzI0Nlh2YTRUOUhIbTliYWpGUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ddQskchAx1RIXVCeuIiy6dufl34QqM7eWH5RtealdjZWesLLnnOOjbmiG6KVXZfihS1J9WbfByp8Fd0kJTxCTg+dYCPXIbuHqdBKHNG4D2Si+ARcT6aEAj6ZQyFwyct0fFEndWg2rJTj204c6rpbmWGAHk4DRodiWFkdBleHr868RMH6tsS3rXRTFZxGdwSpWlhrh/AONyV9ecKG5npmKXKKkmV8RuItLXQTHMDnwEu2Vg4pcVFyA3Q1uvdlr4jSXL8Dvg3bK6c968IWCQ3h+xTBx/MLuPny1V/iIJzg3wA9AslN2opUdmIM9RWp/g0Lbyow6tQ+43eMaJ4BhyghEN6mNrzMJa8hULx4UEh/GiQxbenHCpT0FI+Sc9z6LUrjlCeDBnVLsYz31OaqG4TbCCY8h2nc4f5lngx/BKA0NLH+TSdY0HMU2Xj9Tz8MK7HXsJMQXcUjzQcbFaMoxNXDqTFEtfDC3nAnm/c+7tnBSM5p8vJ6/7lis7EUib/GVLgno02CXSN0/8ik/Q8o3Jf22H2KGcNDfJeE0iaGEXyGJ9me3VyLdxeQaV7Q2C+cNC4nhpW/zkIqj2ua2+ftpIJQvlOz1c16ULT4tZBJF/EJwGs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cbda7a-a246-4cb2-f243-08de6281569b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB8212.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 17:34:37.7904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DydVHDBpYDfCaxBKwyWsxezW9s5Cj5UgPuvPTxfoz6qwmayGrUZV9OaDoCauyrzefKuhaiGAg1uZy2gFSGbeDWZMOVe6YJuQHzB7us2i+Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997647
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602020139
X-Proofpoint-ORIG-GUID: XK_G97vmOsiVT1Mg9HcKB8p8gYBJeg00
X-Proofpoint-GUID: XK_G97vmOsiVT1Mg9HcKB8p8gYBJeg00
X-Authority-Analysis: v=2.4 cv=fdmgCkQF c=1 sm=1 tr=0 ts=6980e032 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WmfX0Ep4EwWLics8V8IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEzOCBTYWx0ZWRfX2rPn6SzZ1VTc
 WhpVsc3aKFPgZ1C59o72c7K30p0QlyqYX1tr3IXOKgiHxqRJYXHnEMn0Llrlu6SFeCWO4reGqLe
 IFXyDXNWwyELxtM5zkDv360dmhScSMGEMNlMgh92H7RglkjnthEj6MDpDJLToapZvIEx80ElP5Y
 jvju0A3UhcPBleC4sHYVz6xefUYOoPoYEaGLRaJVwyf5s2d4H2AiQtlDRqY5iVx/5RDLmvVzcGe
 UywsJDbbgVYS75OKBIV/ZVO6GAiHCMZfhCl5Zb+ZrpvimmQt/2IATakNgJg0Ou/jHMbayztE68B
 EooP3HOa2dKC0kMC0wwwwTb9MDc4ZnXpPdj8idzuz3ksmSGb0/KHqYI/LO3hQR4Em5yJB2rGG36
 JD8pCkzj4aXGkGQ2TLcEvR8ipiPsO7IWiSAzsz7Opg85topL6Y+0aN54HStZI4JrFbxxyDUQrtj
 knnCIQBdwBP+mpZK60w==

On 2/2/26 3:49AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A recent change for the range check started triggering a clang warning:
> 
> fs/jfs/jfs_dtree.c:2906:31: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>   2906 |                         if (stbl[i] < 0 || stbl[i] >= DTPAGEMAXSLOT) {
>        |                                            ~~~~~~~ ^  ~~~~~~~~~~~~~
> fs/jfs/jfs_dtree.c:3111:30: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>   3111 |                 if (stbl[0] < 0 || stbl[0] >= DTPAGEMAXSLOT) {
>        |                                    ~~~~~~~ ^  ~~~~~~~~~~~~~
> 
> Both the old and the new check were useless, but the previous version
> apparently did not lead to the warning.
> 
> Rephrase this again by adding a cast. The check is still always false,
> but the compiler shuts up about it.

I think it would be better to just drop the useless part of these tests.

Shaggy

> 
> Fixes: cafc6679824a ("jfs: replace hardcoded magic number with DTPAGEMAXSLOT constant")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   fs/jfs/jfs_dtree.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
> index 0ab83bb7bbdf..e3301e5fa037 100644
> --- a/fs/jfs/jfs_dtree.c
> +++ b/fs/jfs/jfs_dtree.c
> @@ -2903,7 +2903,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
>   		stbl = DT_GETSTBL(p);
>   
>   		for (i = index; i < p->header.nextindex; i++) {
> -			if (stbl[i] < 0 || stbl[i] >= DTPAGEMAXSLOT) {
> +			if (stbl[i] < 0 || (unsigned char)stbl[i] >= DTPAGEMAXSLOT) {
>   				jfs_err("JFS: Invalid stbl[%d] = %d for inode %ld, block = %lld",
>   					i, stbl[i], (long)ip->i_ino, (long long)bn);
>   				free_page(dirent_buf);
> @@ -3108,7 +3108,7 @@ static int dtReadFirst(struct inode *ip, struct btstack * btstack)
>   		/* get the leftmost entry */
>   		stbl = DT_GETSTBL(p);
>   
> -		if (stbl[0] < 0 || stbl[0] >= DTPAGEMAXSLOT) {
> +		if (stbl[0] < 0 || (unsigned char)stbl[0] >= DTPAGEMAXSLOT) {
>   			DT_PUTPAGE(mp);
>   			jfs_error(ip->i_sb, "stbl[0] out of bound\n");
>   			return -EIO;

