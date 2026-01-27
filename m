Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1490346AF0
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512859; cv=fail; b=iXb2eSnw4RMSZe1cxofIGlfUlCuGreETIDJFdh9opUbi88LOBBbjwpzQO1s68wRdgfIRQXKKZfBrB2yfnVp2tXKxDBvJ1azS9lxgr1Z4lXufZwf9jJ6c4TMGSYCWY9WSYkEqREw5ru3un0/GQaLxGMAGjogGXPBSqcO8xXlz31Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512859; c=relaxed/simple;
	bh=wa6h3yPNIQC/V2uqGYetD5ACe2QF8KP2ojosSyMhDFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g+zAgSwSg+mjCvgIprsXU18F1judz/799CxOpBUZNLZdyJiIAYDV2ay8OAr3cX97+lYtPxtTsNGmyacAk0eCB7L8JUGyjU3aoumZEOu7g/tuYV5vmoVxFmnGirHiJcmlIxd1M92XE9/RJ49lSf+h8kUVBa+pL3AHeUif9bZUcgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qc2V0avN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CzYRpYFv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qc2V0avN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CzYRpYFv"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBEL9u3922778;
	Tue, 27 Jan 2026 11:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=rFFJ/jC4DexPp3y5Ma78Hj8+SA5k7LM5OPmcsYNgQpo=; b=
	Qc2V0avNHqF1abz9xIP1XBCLpP8GQeTuxLmhdJiEH7Rc++bCW3mVsGVol445AI9F
	wW7GvpVr2VslousKz8PZxgpNmqFwRI9YItZBMcIEbQmlK9Hx1obb313EaCqCEauB
	LiECvYVm1USswGKrGDbeOn9cZIwLdsa/Ioyrcg/5taycP31DOKj5TQrZqOphi5XN
	vdZ5p8eGXGWW91+QF7B4kUnV0ArORYpBuEFiZxOkjo7OQIoybK5VYT8Sjl/dVWwZ
	W3GSi5xsE3e/4Rvn8iTnLiDumrxDbMy+KRkqSd+IFSd6WDuCmM4Iu5ObaBW+GYxP
	AS79LumetWqiI+QYsSrACQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvmgbuu57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 11:20:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RAXdEQ010007;
	Tue, 27 Jan 2026 11:20:37 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh99m2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 11:20:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSe2EFI1faF/v03kB+RwVTEw4G2sgEGIUM5fWkbu6xC3EsLGI5lGs0v63s9LpY48hwh/YKYUDUKeUPvc0124NK7FQAB6tyokb81LM+TTbbbfESq3+vZqzzWckjxNuFn7qrD3o4U3VJu8iYx+ExF9d6BDu2mhxqwPHg9W2yCFVTiQBlUsZeO11iOjIyVKC/CasX5M6FIHmYZcyy5Ciwhf/t+h2nhad5GgQLFT9rMAKadbkXs7hy6fU2ABtEegn8gCMUrIW8GtfRCveHs08AvMMuc2Kvs79MXD5bF+ROZp7slV3we6Ue3nSsmMJIWZpODasq+bY513Fjnl3wOt0q+xbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFFJ/jC4DexPp3y5Ma78Hj8+SA5k7LM5OPmcsYNgQpo=;
 b=hR/u75Rzfmn3gy37cok5D0UOcMO0yddWk5RrhVAaIl5LIrKok6gxsraqfTWDWE29RoarPJkpFOwVjM64hznZ5rOxaKrBOTUTPqCZw8889+Wl0Eo49cpyXapFMBPUJEDYpb9lU0OLCfRJyUKQgas/zW2xQqL2bMN0YittRrdYZnWWaFUCS/JisOrCKvIIO2IESgEzwSGj23gBQOfN/+3nGEPa9NwlvKnbCZEuKizdUzIW1NdCLiKJjLjYvcRXHkeWju4zhGdUlun2yQF7Z8r68KZoVVsry4ImcQ+TCcROs8fquGXRlEDE6dmL2hx2WZhFXu+1irz/UvVJMLtxaE4VPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFFJ/jC4DexPp3y5Ma78Hj8+SA5k7LM5OPmcsYNgQpo=;
 b=CzYRpYFvGtBLlJHzDBpmAlR832rtKUPxs8+GP61vDG5DnauUp1rezEVBAq2/YAyngtfBqftal6jJT5go4jwflQekiKgw4NnMCq+6UFGj75gOYhzaSL4Ur8ZI1hHK6E339n4ap2ooIcWIoFgOXOXMMf7s5xfnIQmW3dDKKQmWP4U=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SJ5PPF07759F8B1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::787) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 11:20:32 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Tue, 27 Jan 2026
 11:20:32 +0000
Date: Tue, 27 Jan 2026 11:20:30 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
        Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        kernel test robot <oliver.sang@intel.com>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>
Subject: Re: [PATCH tip/locking/core] tools: Update context analysis macros
 in compiler_types.h
Message-ID: <d4f92f9a-eeb1-48c1-a693-fae2de9dc8ae@lucifer.local>
References: <20260127111428.3747328-1-elver@google.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127111428.3747328-1-elver@google.com>
X-ClientProxiedBy: LO4P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::17) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SJ5PPF07759F8B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a741ca8-39d2-47b1-a37e-08de5d961586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2grWGZoYk5iUGxsMmZoVW80U3Y3VEwyUWo2WjRBYnU0cFExWWF4TjdZTzA4?=
 =?utf-8?B?TzZYc1o2RjdiRHlCQ0o3Qm14OFNtb1dlVmlaM1R3WWhjdjNkQUJlK2dKSy9M?=
 =?utf-8?B?NWV1U3Vyc0hzcFFmQUh3UElCQnlXMTVZQWtyVDlHVE1XaDVVMVBhMVA1M0Iw?=
 =?utf-8?B?amlOK1RnZXRCditBcEVzWlhXY3FHVWRDOGVTQTNHUDJrZkt2T3IvVU9PcUsw?=
 =?utf-8?B?Z3p5KzdqeVF6QXlkcFFxWkFCL2s4UlJYdlIwdml3QzcrdUNnaXlrNHRtaHhE?=
 =?utf-8?B?RytXM3NNcS9rc1ZIT3hpT3RteEYwUUorQVh6aUhCRjZGTVFjVzUzcnVsZEk2?=
 =?utf-8?B?WUJ0QXZ0WVMwNFQ0NGsxbEo5d0VWQWRPVVFlV3o5UTd5cUhtRTFHWTI5M0li?=
 =?utf-8?B?T3M1RjRuZUZSVXd5N0JtMk1qc2xGT2V0ZGp5MWpNZWdGVGowN2hEaUFiQWVr?=
 =?utf-8?B?N09vRmFxaVBiS1ByVkVDeHlTREhlek5xajdWTWJNdW1QcndSdjA3dGVZWUVR?=
 =?utf-8?B?cDFsank3enVBUWFYUGNrNXh3ZnNvRjNDY1NWekwxbzQ4cmRya29VZklITzJ2?=
 =?utf-8?B?YllpN3NzY0QvSGdaVkRMSTVQMEh0YWVaQ2RNU1NzeW5XQkZEZG96RWpWNHVX?=
 =?utf-8?B?VGtUczBiaG1RQUFVZXRWUC9KSkFvbUZYOTh5dXlWZTZVNjl5SDZRWis0UVAz?=
 =?utf-8?B?MkUzSkFDRUtCdFlTZW9MQThwcDVNYmY5THd0bkwyS1gybkxZM3pBRXdOUDI5?=
 =?utf-8?B?eWdMcUU3c2hMb2xuNlU4dnhkcExwV0JZdHQrYXEya1J6emRmeEJ4bUIxQTNu?=
 =?utf-8?B?RWk4VC95RHFKYlVOMGx2c2lJdXFvc04vMXhsZDF2MEM2WEFzUDZUY2IvTlhn?=
 =?utf-8?B?Ukh0MUJYdUg0NUUxNFg3T1YwWmp1NWRUUlBwbjJhaVZGY0NpVDY2UkJSMXdy?=
 =?utf-8?B?ZDJ1MFJqMThDendFajJ1VXYwc0E5cnpsdWo3bXZIT2RVcW41SnU3MnVEZURM?=
 =?utf-8?B?MlNBKzluc25ENzlmSHVyNWQ3NmpndDZwdVo5YnZySitsYU8velJZSVZDYWY5?=
 =?utf-8?B?V3BxN3RMT1l0ZWtpN01ua3hpMVl2WHBIUWtDbVo1eStCMFp5V0dHRFBuREc3?=
 =?utf-8?B?UlBZRDVsTUszUnA3YXZxR2d5dDU5SFFmRXJSRFNBMHprWEd1MXh3NlNVQ0ln?=
 =?utf-8?B?bE1BbzVpdmVYMHlYdlM1YWZJbFkzd2o3VkdKeDJMODNBV3U4VWJaSEZ6Nk5t?=
 =?utf-8?B?cUQzZXBFMzBOQm4zVlF0TndVNks2Tjk0Um1qSmdjWTNlWTZLK0JBbXNIei8z?=
 =?utf-8?B?MnZSMjkvSnFqSmRvSFlkV1dKcUpDUXAzOVJrWUsyNmtVVjNMa25UUXhucHBj?=
 =?utf-8?B?dXRtNG9ZOW01NGRwd0sySkpVcGlUSUI2WW1JUWNsR0phU1FPRnNjRzA0dUVi?=
 =?utf-8?B?dnV4SmxDanBtWElSek9ZSzdhSlhHdXVwb3BhS05BcmN2OEtkWUM2S0FKZTBt?=
 =?utf-8?B?ZmxSZXVncENla0F3blc2a1ZiMjNoMENCODk0dk1zNU90REoyS29aQUdnODV5?=
 =?utf-8?B?UlBNL1g5NVE4dGcxZTNaTEJJZ3BjVDYvanhZMU8xTnRDZWdXbEZzcVRMY01o?=
 =?utf-8?B?ZG1mYUhzVGppaE1MdHI3Ri93ZEZkUU5rbHFKTDVWcDRnUnE3dmlFVzArL1Br?=
 =?utf-8?B?ZENMV1Z4OUJ0Sm0ybHp1QWxtNEM5elUwSWpOOTVxazNjOG8xRHNzcGdSa2E1?=
 =?utf-8?B?akM1MG5IU0hTdjA2SFJ1MjAyV0RlNnVUcmp3Ym5sZ04zOWJzTXdhL21ZMzZl?=
 =?utf-8?B?Qk12NW9TVUVqQU15bDRLQndIVDVMVm5IL2pCMndsMk5vR1JnUHpuSW83Yjdr?=
 =?utf-8?B?RWNnNUM3cDZvODByckYvM1g0a0pTMGZCczV6cTVaZWlOUXpBZTZqZDBSNzVF?=
 =?utf-8?B?T29JT0twbEJDQ3Vaa2tWWTdWbzhMU2sybmZWMDQ3RkVJdldXdUVpMitnTG9u?=
 =?utf-8?B?SUp4V01lV3NPZk9RWm1tNzFXQ0FYam9jdDRpd2Z0RDd6aXlFeUdaNWZ0STIw?=
 =?utf-8?B?K1hjVEZ4NGFLUDNXemVyWHU2eWNKOGVHVjRucnVUU3NYZTZ2RDdSNFNmTUxn?=
 =?utf-8?Q?SONY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTAzYUxGRUNGM1R3RGhEdE9VM0xKVjgrZVQ2UHhVWS9TZ2NrdnBwWlR2ajR3?=
 =?utf-8?B?M0c4WkV0SVhVS3Q3amFCK0N6VGkxa0Z4aFhnK3FSLzFMVWg4b3p4T1lYU0c2?=
 =?utf-8?B?eDJzU2lYS2lMTTVnWkhxTmR2MXViWGNiL1RSeEdIV1BhWkxzY25YeWRKc1JM?=
 =?utf-8?B?ZnNycW53Y1ZzMElpVkw2S3RwM1pMVWloMGU0NW1DOXAxWDM0enJQTEJiNDhR?=
 =?utf-8?B?K1VqbXVFZndFeE1iaW9rdjk5VUkxajdqKzJhWUNTTmx2RUNNd0MvdmRJbTZp?=
 =?utf-8?B?bWc4Yk10NmRmZXJRZGw1MkNDZlJvQUI5WFBlaWVhY1lqV2s0UHgzQjd5Qnhl?=
 =?utf-8?B?ajhwbUpLSmsrQm9RaHFoZzMwRWZVZDhHdUtTWndXMnoveExWQXZrUjJJSnRo?=
 =?utf-8?B?bGdSTXFKZi9BR3FETHNCNjdNRUxKUit1eEZvK0RvNThMa0l2em4wZHlDWmhX?=
 =?utf-8?B?SzRkdFNZZG1JakNCbTR5UERmWmxTRUpDKzljYzRlLzM0bFVnR2ljU0V3ZVVF?=
 =?utf-8?B?VXZVUk5TaytvelZpcWJ0cE9Lb0txNkxudVY4V1ZMaTdkd3l5ZG0wT0F1dXRJ?=
 =?utf-8?B?ckJIQlZ3MUFBRmxhb2JvWXpSblpySDFETnhmN3oyOVZQcGRMUTZKLzZKQXEv?=
 =?utf-8?B?Nk1Ub3ZjUHBZWkxodHNneDBiN3ZLTnBjenhaQ3FTcHJ0SlhZK3RBUm1TWXVk?=
 =?utf-8?B?NDBFRFVqOE1QQWpPUFljaGNKdVhTWU1QZ0hQZUV3dVFiRUkrK2xWSkpmQ3R3?=
 =?utf-8?B?RTdvTjRXMm1aSkIzb2tPQU5IVFlscStibmgwUnpsN0Jla0V2OWdSL1hiMys2?=
 =?utf-8?B?RE9sU0lWN3Nkd1ZTWFFnME1CRCtENENzQWdVMk5NZHdOQ2EybVdvaTA2N3Vv?=
 =?utf-8?B?MW9HQWUrYWNYSlRSRDhia2VqbUNuRjM0bkxreFB4TGx4aFVyQ3daUGRFM2dm?=
 =?utf-8?B?QTBqOCtHS3NIWDFkU3FLeHBadVZZNnJmdkZSN0tSUXNyeUZscng5SmZKWGJK?=
 =?utf-8?B?WW1PNmpjcGZkRjBqL0R4VlJYQTR0MGk3aURyUWs1WnYxVEFLR2s2bnUyVG4v?=
 =?utf-8?B?TzdnYTgrZVcxd2c3WFV4eXBkcHgyZHc3UWZ5THZLb2NlMnMreXAzY1l2M1Uz?=
 =?utf-8?B?MUxmZUl3ZFJjbTBpRXEyOER0SEpXRnJzOU50SW9UbTcyRXhKNzBXM1kvVGV3?=
 =?utf-8?B?WHFoa2I3UzMzNnFxMlVWSHRMSFBKSFVCTFJTU1l3Wks2M0dlRFQ4eUwyM0xU?=
 =?utf-8?B?WE8vU3h0UkMvb28ybFZjNUpOb3FkQmNTK1lmb1Nva1NUZG5NeFZ5czF2WUJq?=
 =?utf-8?B?SjVhaXllN3N1U0NnS2VPUThLTXJuZ3NPaTVUSVRRNXRVcXBEdGt5VlpyTElj?=
 =?utf-8?B?MmVBRTY5UVJlK2hRbTBrK1lydEdCVmkrTkVMYVRKOVYzbFd0Y3hVaG9RVGxZ?=
 =?utf-8?B?UlpNSkJWQStNdEQzUGIxelRNZmFDMHd0eWFPMlNFOElnSVJUVVpveDdTVEg3?=
 =?utf-8?B?RE9ScFkvZDMrd2Z0QmhldDZzbVdmK2k4RXhJWnlrZXF0SzhoendTV3pyeGMx?=
 =?utf-8?B?cGVGbHVRbElhcS9zd3lYN0phRWR2VS8rWDU2WW1JWUY2WWJzMFZ3OGZmbUZB?=
 =?utf-8?B?NGdDOThYbHpWZFYxMm10VFdtSC9saHA0c3BDbGRIT0ptT0NtcTlxWC9veENq?=
 =?utf-8?B?dXpRYkhHamQxSUZ1OUNZaCtBaUdLV2RZeVQ4TDJSd0JYcDlOV0RyV3M4cWU3?=
 =?utf-8?B?K0s3UmRCbVdoSXJHQ2dOa2pzd1BDNW8rYkNQdUlJYnBHNVFVU3ZXY05neGpZ?=
 =?utf-8?B?Y2EyZ3RMNm9tMmxxUEthZDZpbUNLeFQvOStPVGhiZXB4R29oYVVyYTMrUHQ1?=
 =?utf-8?B?cStidnBaNi9pZk53VTArQ2NabGJyOGxFZ3pqckI2NkRpdXRWMTNOUlVnaFJm?=
 =?utf-8?B?SDRmekVoU2xSaTFRME0vemZrcWhPWkorR2k4MlV4TUExelFZaWMrN1ZtYzk4?=
 =?utf-8?B?NHNsenZLMG9NQ3lwdTJWdE1JVTB4REpNbmRscDJsVnNpOVpybjF3MldUdHdo?=
 =?utf-8?B?ekdTR1lQWmVYWFNYR0tYWkpXcnk4NFc5Sk4vRmxJc29iajNsNXl6UE1WTm1S?=
 =?utf-8?B?VHRaaUxLK1g0YTY1MFhEaTF6cVFjdzJobU1OVHBRUXl2SHlQaVd0OW9BUFMy?=
 =?utf-8?B?MlkzTkIrdS9vcUFKcHhaWGVTRG5hK3dkODJCMzBxZEdrYmtoYzZqM0lWaThv?=
 =?utf-8?B?c2orT09CT3FzNVRlMEtiU1RxYjRNM2hSdUJ2RHJYaHZEU1FJL2ZXbCt3RURj?=
 =?utf-8?B?b3Y2c05mcWtucmxTYWtaVm5PSVFXc3Y1aWs3NlFMNWl0SU1sQnFIQWJ5aG82?=
 =?utf-8?Q?RztXAa3cedtLX7Ok=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MDUg2UPS5uMqP2Zr/xEfKj6nZUnd/HTV7ZVQE4ZYkTuVms/Rn9+0EWzg2UMxqvNdIq5sBsfKp+hOtgLcftLz5JHW1QEHHdTj2o2/+dtUJPzQ++TQpfVWTpK+Os4N8KL7B8a8aSMo8GrsizFzxm09VZXEbhqsq0bUxJS7CpgMPNRS6Fy8h0Ch/U3WLepLw6E3cQUdzMSAOOz+qgdUFLQhgwWHz5RKgsZeXUaosUCwtOO3xUKxw7PL3Ft4pOdujd43o79tYbQJfn2luTaBqUKZx4gYmxw+dST8F73bkFQEMlx7a/kidt/2E5S9u0EslF9gQ9BBgQ3yS1dofeVK2R4cG/tEoJoudU/XnpqR57jEEUuPzCCpgxM6zjkZ2Pw+IpMfdk4w3LVA+SvUM5b169sDW+Z5vcPIvPMq5Rc5ZDAjjuXCjrcBYKkU7Ds3eJ9aOSSr1hQjG7s3jASq+CkKW6csz3zH87ZdUrEu4enLmDCGp0nfv/M21N8zZ2hB9s6TogYZwpoLl8tY8hdUQhJaeCOdDSVu8y7j5Eenc6c8sxjCfQeBzFGIx+rSSSpTpOl9FNd9z2SjBzJ12sT/ewHa7lRzvE023Z4kC8YcxZ76zWYSNpE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a741ca8-39d2-47b1-a37e-08de5d961586
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:20:32.1782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndviCVjhU1CRMybIp3F92uYBtldKfqnR3QrP5spdoGOyqUl55yVnCtYwa4Cy7+xlA5Mo40A+WqzD/IH3iK4uTF75GsTOCULgo8ORwrxIGIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF07759F8B1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270092
X-Proofpoint-ORIG-GUID: hMLgAICkCvpPXVLUOZ-tLv1qKUs2oAaN
X-Proofpoint-GUID: hMLgAICkCvpPXVLUOZ-tLv1qKUs2oAaN
X-Authority-Analysis: v=2.4 cv=AqfjHe9P c=1 sm=1 tr=0 ts=69789f85 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=1XWaLZrsAAAA:8 a=yPCof4ZbAAAA:8
 a=U72l75ai4ruoYjKqGJwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MyBTYWx0ZWRfX2UP6hnQMpBQs
 en5iFy6nMp6h977wHr4VzyjQjhVRLNsek/fQ1M+INdBtVBibJL7ii7sLg2wt0KbW5Fr3vFQWBN/
 7wXeAA7mYCNZTbKzlTanO2qsJSLZJQkyKqAusGf+CUwvvL8mgohCy+WiwQ9k7rZeDwYLFozP8GU
 hXM2hrfjSlwGJpjwKVm5ZzRKZm0Du65SiIME+v50J40GlqX1NkXSD+B2nOlN9BFXxetg2L3fYe8
 v7TNvZI+31Go7DdRz8cbkdM14X7OH2LVW6yjsdSRlECjv3TMotwj1voJlDSHmGmnWp1TqbY7lCw
 YlWz+eZ28xYXRffsFdLsaropa+m0p+shNiQrkuf+8oeSxRvFe4QLZhLvK6W1iOJcpCp5nbQJz3E
 ca7c3dejT8FTCbygTbUGUNNjC9mLQudaSNXVhDXZukIWZhTL7SZMS+dlTXXw/yFyiktjgaK8gEw
 ETvtqNcBlAwXDenOFOQ==

On Tue, Jan 27, 2026 at 12:12:06PM +0100, Marco Elver wrote:
> In sync with the main kernel headers, include a stub version of
> compiler-context-analysis.h in tools/include/linux/compiler_types.h and
> remove the sparse context tracking definitions.
>
> Since tools/ headers are generally self-contained, provide a standalone
> tools/include/linux/compiler-context-analysis.h with no-op stubs for now. Also
> clean up redundant stubs in tools/testing/shared/linux/kernel.h that are now
> redundant.
>
> This fixes build errors in tools/testing/radix-tree/ where headers from
> include/linux/ (like cleanup.h) are used directly and expect these
> macros to be defined:
>
> | cc -I../shared -I. -I../../include -I../../arch/x86/include -I../../../lib -g -Og -Wall -D_LGPL_SOURCE -fsanitize=address -fsanitize=undefined    -c -o radix-tree.o radix-tree.c
> | In file included from ../shared/linux/cleanup.h:2,
> |                  from ../shared/linux/../../../../include/linux/idr.h:18,
> |                  from ../shared/linux/idr.h:5,
> |                  from radix-tree.c:18:
> | ../shared/linux/../../../../include/linux/idr.h: In function ‘class_idr_alloc_destructor’:
> | ../shared/linux/../../../../include/linux/cleanup.h:283:9: error: expected declaration specifiers before ‘__no_context_analysis’
> |   283 |         __no_context_analysis                                           \
> |       |         ^~~~~~~~~~~~~~~~~~~~~
>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202601261546.d7ae2447-lkp@intel.com
> Signed-off-by: Marco Elver <elver@google.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>

Thanks, I tested it locally and it fixes the issue for both radix-trees and the
vma userland tests, so feel free to add:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Tested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Cheers, Lorenzo

> ---
>  .../include/linux/compiler-context-analysis.h | 42 +++++++++++++++++++
>  tools/include/linux/compiler_types.h          | 16 +------
>  tools/testing/shared/linux/kernel.h           |  4 --
>  3 files changed, 43 insertions(+), 19 deletions(-)
>  create mode 100644 tools/include/linux/compiler-context-analysis.h
>
> diff --git a/tools/include/linux/compiler-context-analysis.h b/tools/include/linux/compiler-context-analysis.h
> new file mode 100644
> index 000000000000..13a9115e9e58
> --- /dev/null
> +++ b/tools/include/linux/compiler-context-analysis.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _TOOLS_LINUX_COMPILER_CONTEXT_ANALYSIS_H
> +#define _TOOLS_LINUX_COMPILER_CONTEXT_ANALYSIS_H
> +
> +/*
> + * Macros and attributes for compiler-based static context analysis.
> + * No-op stubs for tools.
> + */
> +
> +#define __guarded_by(...)
> +#define __pt_guarded_by(...)
> +
> +#define context_lock_struct(name, ...)	struct __VA_ARGS__ name
> +
> +#define __no_context_analysis
> +#define __context_unsafe(comment)
> +#define context_unsafe(...)		({ __VA_ARGS__; })
> +#define context_unsafe_alias(p)
> +#define disable_context_analysis()
> +#define enable_context_analysis()
> +
> +#define __must_hold(...)
> +#define __must_not_hold(...)
> +#define __acquires(...)
> +#define __cond_acquires(ret, x)
> +#define __releases(...)
> +#define __acquire(x)			(void)0
> +#define __release(x)			(void)0
> +
> +#define __must_hold_shared(...)
> +#define __acquires_shared(...)
> +#define __cond_acquires_shared(ret, x)
> +#define __releases_shared(...)
> +#define __acquire_shared(x)		(void)0
> +#define __release_shared(x)		(void)0
> +
> +#define __acquire_ret(call, expr)	(call)
> +#define __acquire_shared_ret(call, expr) (call)
> +#define __acquires_ret
> +#define __acquires_shared_ret
> +
> +#endif /* _TOOLS_LINUX_COMPILER_CONTEXT_ANALYSIS_H */
> diff --git a/tools/include/linux/compiler_types.h b/tools/include/linux/compiler_types.h
> index 067a5b4e0f7b..14e420467eee 100644
> --- a/tools/include/linux/compiler_types.h
> +++ b/tools/include/linux/compiler_types.h
> @@ -13,21 +13,7 @@
>  #define __has_builtin(x) (0)
>  #endif
>
> -#ifdef __CHECKER__
> -/* context/locking */
> -# define __must_hold(x)	__attribute__((context(x,1,1)))
> -# define __acquires(x)	__attribute__((context(x,0,1)))
> -# define __releases(x)	__attribute__((context(x,1,0)))
> -# define __acquire(x)	__context__(x,1)
> -# define __release(x)	__context__(x,-1)
> -#else /* __CHECKER__ */
> -/* context/locking */
> -# define __must_hold(x)
> -# define __acquires(x)
> -# define __releases(x)
> -# define __acquire(x)	(void)0
> -# define __release(x)	(void)0
> -#endif /* __CHECKER__ */
> +#include <linux/compiler-context-analysis.h>
>
>  /* Compiler specific macros. */
>  #ifdef __GNUC__
> diff --git a/tools/testing/shared/linux/kernel.h b/tools/testing/shared/linux/kernel.h
> index c0a2bb785b92..dc2b4ccfb185 100644
> --- a/tools/testing/shared/linux/kernel.h
> +++ b/tools/testing/shared/linux/kernel.h
> @@ -21,9 +21,5 @@
>  #define schedule()
>  #define PAGE_SHIFT	12
>
> -#define __acquires(x)
> -#define __releases(x)
> -#define __must_hold(x)
> -
>  #define EXPORT_PER_CPU_SYMBOL_GPL(x)
>  #endif /* _KERNEL_H */
> --
> 2.52.0.457.g6b5491de43-goog
