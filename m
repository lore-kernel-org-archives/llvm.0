Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A611CA82;
	Tue, 23 Apr 2024 05:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713848805; cv=fail; b=hJLrFou417Uy3MZLsnCWKF01goECHUEPiab4+vWNG6vGm0gCnDYufpJ9nrv/d8uKGcLcc5GBL7D+Lf2F/BBHxBZIF77GwpGMac8XEXHKkSLcZU+rnc59NILqP90gkd5AHOgSYYOSYb5kYx38ZrKa0RZg1H/asCsbv354tW+93gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713848805; c=relaxed/simple;
	bh=mdmt+MKdg063ID4F0MJAb7bS7ihNYrSx8VxbACUjbIs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MONIcvt8Py1fcMYClVMbf8zzx2pBC01wdgusUh4492HyJUCAi/mcnwPcld1zdzlejQNCgjQf+jVrVHALeQgQu4L0l77tQ6ZgM3IAEv0NIcHICNmJURFF4v70hpggaR5KOv4N+5b8gMTcODGudX0YgSNvq7Uz+gT+nqMlZ3oRJAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G5ArTOuZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eEZQ7/26; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G5ArTOuZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eEZQ7/26"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43N4k774014570;
	Tue, 23 Apr 2024 05:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=7a9hLNH6LPBPoLD+br5AyQfllQVzFmfVz1BBg1HUkRc=;
 b=G5ArTOuZku9DFf0OFeokh+eXB/8g0lLCIWBNxF8yusqaMLtb5xFlJUVk5nMIjzmc9+TU
 Zs/EagK3JICl1DX0C8hluD/KQfYRI6zoOz28Pz5f/ZVyE+dSY/crNT43oG1aS1x0ICBt
 T7ZhxdzZL7mExf112gKASIDvNNHDv4eb93slOlZBpuPPjfDDSJkPNALRkFoRrGIw2tCq
 6S3iPVDJtTDwKC1tmFHnUdr6d3Fh5M5F1vX2/yjuZUGHjQwLQATJRvNClDUGeDochnjG
 P9TwtimcV8QB/5/1giwY72qCc4r3AUNHXtP2yjWQAQO/OuoOvu+MdjI2nbwmOlgaRjwG mg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm68vcewp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Apr 2024 05:06:37 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43N4IlPB040684;
	Tue, 23 Apr 2024 05:06:36 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xm456nggy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Apr 2024 05:06:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBAEs0ZUdZ1f/bN4buUDiJigXeY8BAQTU08K/nGPHY/mpBj9seZtkqKxoDpQhBx/ItT9yNUfb2IiqfSglXrVshTWyQrDnm1zhfR5n6RC3vcjECQZjlKTUtL5rA4OulcByoRPm/3fTclnTZ5pZqLag6Ge0qmgF3KzR6kOWIIQhNgCPM9iV0jBggb9GYDFyvbA/lOVrXjGvV48dJVP7H2P9x7VA78woV8ZeZt8e1Pz/vCnd6q3m2RNrTX4pNYiOKI1IR2nQgN4/gOLam3PBAh2zkGIxSmRgui1P/0ip39nycipivhCOL+0rBY7CPLYRBp7Le/15zgaxT4hZJchenYBQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a9hLNH6LPBPoLD+br5AyQfllQVzFmfVz1BBg1HUkRc=;
 b=dsfuULQ3BhQJEvR6RGiQJZJCcA1elXGBTxyG07v0KcoDPgzR/oTjxyCdjRSLZs92d8hUltZ9zds3TEd/DO35h0U4c3khHcWQPZC78nNmaSJ1dBXyTk0NOAjc23TDXCEIXaYKQ8HHdt/P/W16q08e4f7cZjdEIlf/sQYKv8E549AYUxFO+BuEppP4zBEQdIr66S2evdH6qmJxNZ0QT8fFLW7VF74pbkGSMoo43zAXyZEyM5NKk2hBUIiS9a0+jZq4Dd1QzfOm84bU8mhYKCFHAxhiYU2WTZCt9nmrYx1haIO677NSFByh7hRx8D16iDo5GardIhu/OzqC+ZE8PKWxPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7a9hLNH6LPBPoLD+br5AyQfllQVzFmfVz1BBg1HUkRc=;
 b=eEZQ7/267hAaVoy+GUZANra7mOv+nSBBX9tGtpFwsNCmrwpORxvmXZDDzfn0ET9qGgi1k4b8JSe54UYIKtZx/d29rBa2Z92P9M3K4zAZd7kLb/T46dJlGNt8kjSiPFP60+catpPq/x8QSKHnZwJRKvxJn81mDR87orPkYmLB4T4=
Received: from PH7PR10MB6379.namprd10.prod.outlook.com (2603:10b6:510:1a9::15)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 05:06:33 +0000
Received: from PH7PR10MB6379.namprd10.prod.outlook.com
 ([fe80::de1f:84ac:fe86:2865]) by PH7PR10MB6379.namprd10.prod.outlook.com
 ([fe80::de1f:84ac:fe86:2865%6]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 05:06:33 +0000
Message-ID: <f8629dfd-642c-4f1a-929d-ebe04d8f49ea@oracle.com>
Date: Mon, 22 Apr 2024 22:06:13 -0700
User-Agent: Mozilla Thunderbird
Subject: [vbabka-slab:slab/for-next 11/12] mm/slub.c:3256:14: error: call to
 undeclared function 'node_nr_objs'; ISO C99 and later do not support implicit
 function declarations
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
References: <202404231035.P6HbfrHW-lkp@intel.com>
Content-Language: en-US
From: Jianfeng Wang <jianfeng.w.wang@oracle.com>
In-Reply-To: <202404231035.P6HbfrHW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:208:160::17) To PH7PR10MB6379.namprd10.prod.outlook.com
 (2603:10b6:510:1a9::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR10MB6379:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: bb892e4e-c508-4587-e681-08dc635324bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YnNtbmJCUjlhZmZzYThNd2ptdis3cU1WcGM4TEhqd0JObzJTQWlONGZhY283?=
 =?utf-8?B?aWJFenUvbVd4cVVHdjYxVVhzNkNuYW1hV29xejdnV0xweVF2Ymk1NU5Wb3Nq?=
 =?utf-8?B?Zi9Rb25FbW8yYXdhenFJSWlsMFV2WllJbldvUENTWUducVYvK0kyL0tyMVNE?=
 =?utf-8?B?UllIV1FCWE02Y2h1SEgrSFA1bUROcEhneVpES2hKNW04TUdmaGI1dXVRL2Rl?=
 =?utf-8?B?RkhEOVVpZ25ESDI3YkErWGIzbjJ1UTVFUWlYUEdyMVlpY3RBUTBBblM2dndr?=
 =?utf-8?B?RmgyMjI3YUFlSEF2MVR5NTVnUVgwWXV3YUV0Z3NNY3h3SE1uc1p6WVkzaHZ1?=
 =?utf-8?B?OVBVM25kYTFSQ0VIQXg1MG1wRzVwZHlCTklBNGZjK2d1QUlWMThqQ2djc3hW?=
 =?utf-8?B?MXBDNDlpK1piSXFINVVaaXRVdWgwK3FWTmNwR1dTVWpwd29Xd2sxL2FJVHhI?=
 =?utf-8?B?QTRDM2s1VlpBSFdoaXVXTVZMVU12OGM5clZPZVdIbG4rVnRqL2R4eU1ZeUFu?=
 =?utf-8?B?SThUempkdUxuZWFraXEwc2hnRVlJUGJJMncxeWV4S3ZDOUZ4RTE2ZUw5ckI3?=
 =?utf-8?B?V2NxU1Y1SDhrTTBMOEczSWlHVFM3R1hCR21ZMzRhWWY4RzZsN1hmV244WTlX?=
 =?utf-8?B?dFdoU25zbEVHc3U2S0hML0hHOVdQaHBJU3I2ZDRCeVdCZm5wcGx3a3VoSVB4?=
 =?utf-8?B?NDlFejNMcDJzelJ6ckdmRTZsU3d2WU5JQTJUcTIxUktmT2VpcmZvclIvbmU2?=
 =?utf-8?B?VFZpeVNWK28rZjJHZVJPMnArT3RBVm1Mc3FabFg2VEtSQ3ArUzIvQTAxQ3Rr?=
 =?utf-8?B?ZWUxMUpMdGNaSDJHL0FkSWxiL3VjZm8zYmxtUkxNZnB4anNEYkRVSmluZll0?=
 =?utf-8?B?QzBqaVBKdWlqTnpkODBRVjZlWGF1ZUd1a2wyeG1vN093TktVdnVQdVNxdlhR?=
 =?utf-8?B?bzVqckFHdkZRejB6MUpPdmlqNFZjVzhWeElvQWNwS3ZFY2ZLQXZUVnVrN2JL?=
 =?utf-8?B?REJRV1RFeStZSjlTZW9nL1lFN3VuV1FUdkM0dnhJck4zbmYyRlZZaDU1Wks4?=
 =?utf-8?B?c0ZIUjJQSHFvT2V2aW0wL0w3QUdKL3pZSU1qSmVNTHg1ejRnd3k3WTJmZldh?=
 =?utf-8?B?b2RJb3dVNkx6dHkwVGE3WjZUVUgzNElGZFJrc2xZS3JVL2xaMm9kMUhScDBv?=
 =?utf-8?B?aDMwdkpwalJwT2VLcUo1dDN3SjN4aXFNV0IyY2gxZmszclFaZWQ4R0RPTGtq?=
 =?utf-8?B?cC9GU1Y2OVFsRElUM2JIV2ZPWUkvUmVrNFdpYXBOZlA4aHpvWkM2ZG95N2lq?=
 =?utf-8?B?Y01ONWIzTjlRTkdQblVLcVQ0Uy9nbU9JOEJDSWFxVW5BUGJleE9vZzRVbmtT?=
 =?utf-8?B?eTJicXFiQkFiS2pPUEZrZnFkM1VuejQyVEpiWDB6SHRndlBwYXhQc01uVjlU?=
 =?utf-8?B?OWVqYm8rS1RYakR6YWpDbTZPazd1QkJDSG0wRzFDcFZoeUxTWU9RTFhuSTVy?=
 =?utf-8?B?eWlrS04xaXplZTRZM1JBcXlvdGdRN2tJRDNWbCtJazVYaWJtSXNtbm1DS0Fm?=
 =?utf-8?B?WGxXSmd3MVdXaTdLOEdkZXhqV05FdnBGTzRMdUdoSlRqbTMzVHdvRWNGYTBx?=
 =?utf-8?Q?vmI5Wx0PqVy/tihiFP0Hrl3Dv8Wu4oPYY+ZudWtpuMKc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR10MB6379.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnJubzAzT3Q2ei8vTHpzYlRSMWxRdThaZlFMRXBnR3Jta0N1ZkJydWJnclNy?=
 =?utf-8?B?L0E2TkJtVGlVQ2huY0UxTzd5YUprYURyejNZbGxZMVpqOWRYbFloQnZFOEdO?=
 =?utf-8?B?YnV3SWZ1Q29FTkpKRHM1NDBOU040WHBrVnRzN3ZkOG5VSWQ2ZE1GcUVpVDBU?=
 =?utf-8?B?WHhJbjNacFdwYjJkcmR6WGF6NThKZkNNSkhpTjJvTGlHbG1mM3dhTkttNTZr?=
 =?utf-8?B?cUljVzFwbnBDUXhHYURYVllMOXF2QkV1V0JmMGVXTXNQN2dySjd6MTZROWcv?=
 =?utf-8?B?aDUwMkU0RHhZRFcyTCtwZkVKYzJxZkdkRVdlcE9vSzBKNldUODlNVjFtMTN5?=
 =?utf-8?B?QSszRmtQOE9lTHNlZHdBdERzd2pQMUM4U0oxcGlHQ1AzZGFjWmRFUzh1SDVu?=
 =?utf-8?B?U1FUVnhpMU9tRFJoQXg1OHBpOXNHZXY1by8xU20ybXNyMGZwRzdudVVwelIv?=
 =?utf-8?B?dWwwZkxVSXVTTHNPRlNxNlFON3dDblltbFhWaklLclZnRDVVaGRBZTZvZU8x?=
 =?utf-8?B?eisxam1HbTJkazJnSTdvWG1pUWViejVMUE56ZTQ1Ung4ZlkzTEZLL3hRMVB0?=
 =?utf-8?B?dndiZzFvNjYrb1doYnNXQ21GRWtvQmlFUFNEUDhXT1lZQXNCY2lxMEJRK2Jx?=
 =?utf-8?B?L0JIZFlMbndQc3BSUHFOTGpDMSsyRTZYTlo0ZUFKanBFNXhxUWp4dUpsSm45?=
 =?utf-8?B?ZG9IaXQwT1laaU1oL3VLQTdJeXNLQithSm9MTFZja1o2eEVrT3Q2VTBVZUtQ?=
 =?utf-8?B?VFpKUllhVnMxWFFLNzgrMTNLNE84Ni9hOFJuM0V2TVlMdTl1UURyZ0k5bGJG?=
 =?utf-8?B?WHRtUFB5WnRpNUl5WjJ2eE90U1Y1OHNzWDBEZjFXeUVUSEMzTERYOTYyWnJ0?=
 =?utf-8?B?TWdnTzQybkh1QWtmREZqMUFCL1Q5NURvU3NvRW1jZmdrRCtHei9RNXFGcm40?=
 =?utf-8?B?SGMxOGc2Vm83dk5pTkJnWnhDTjF1REhWTGRxckJUU1M2Q0RGVGpqRXhlOHhJ?=
 =?utf-8?B?bkZMUElUZitXVXpwMm1ob0NZYmo5NkVCdjhiRW1ndDgxSzZDS3JlYTgzTC8z?=
 =?utf-8?B?Tk95RWVyOVpZdkpjMjl5bHpkK0FSZk0rdkFyL2hiWTNBRStVZ0VIeEhnTVRT?=
 =?utf-8?B?akt0KytWWkJsVUhSUmsxODgwdEpYeTFFUldiblJvWFovSFhnNzIvaVN3cW9Z?=
 =?utf-8?B?TjRqV0pLS0s2SmszZXFlMzJPQVB2aDFSeGdwRlpoMmhEZ2x1MlJORGxNMEll?=
 =?utf-8?B?MTN6c3NrQjZpNDdwbmpDdGo2NEFYdlQ3ekdLeWhCZ0liVnRybldUK0xXcjRB?=
 =?utf-8?B?azNUWFpuQXpVVkJCY0lMc3NVTmV2Wm1vcjBnWHlXbmg0eWU5QW5lbklZUmZM?=
 =?utf-8?B?UzIxampESkp6VGg0bWFDRVp4MkhPcDVQaElNVVpqN1c5YXhxelhQUlk0UURC?=
 =?utf-8?B?WFRldWNPUFdJV1Nwa2dZclNnc1YwUERXYnFBMStIbGhITUJKdGR5Mm9xOTJV?=
 =?utf-8?B?Q2k1RmJEUVo5K1UyM2YwWjV1Um0rREZrVVFpWk5HWEwrZTJ5Y1VmcjBqOVRB?=
 =?utf-8?B?T2YrNHpIR0MzV0xhcnVkN3NDazcwS3RsTGNLK2Y0aFR1Y2EyeVJqbjVDZGFU?=
 =?utf-8?B?RXJKUkFPWm1xdWVpMUE2dDU4MkJXQ3hxSGdENmJ1cWtMbWZQMjZ5eVVSUFY2?=
 =?utf-8?B?Slp3REZwZnIzckVkbDJkdm1WcEdoM1VWcTZ2TENpbW9yQ1lVayt2ZWZhNHFD?=
 =?utf-8?B?ZFNENjhybGtIS1BoL0t5Z1lMYzVMZ3RFVVRlWHBTLzFCenBVUEp6VEUwSU1T?=
 =?utf-8?B?RW9tNzdjek9rMWxIQmgvcGdwM25td0l2Y1MwM05IRDZrNDlvMVZNeEpqTHcr?=
 =?utf-8?B?ZVdHY3F5dXNkWUV1OUp5MTV2Y1V5bEhlUHJlYy9BNEFrMC9YK0lvZXVhQXp1?=
 =?utf-8?B?VFRlMWxncG1TZkFNbXNjcFpEVVBrTUlNWG55U0RXNUMrdmUyY2JzT3JoK1Fa?=
 =?utf-8?B?dEFWVHdiY1pMa0tXb0RqVUxsZXVIdkZQSTNGemo1RkNONUtPR1NOVFpvOGZY?=
 =?utf-8?B?RHNzbUl2bGVRelRBVGNpVFdMYWcvQy8wV3hLaXozaFRWM3lzcER6U0tzSHhi?=
 =?utf-8?B?T0JjNldDUkRhZnBzNjBNNklzWmwzYXVOa2N4VTNocy9Wa2FzZ3B1RU5oV3Jp?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Pado9bkaGNriJepKA9lkh/fM1ZNTHjUkHHXSysa0y4wSBg/sjCaU6FcF48j2Zm1WM7EJK2BZKpbKOxJNZ/ndrDh70XtDQ+A4//Mbgv0lUiy6Bh1t8ZQx9M5SpZ7BMktW/IZZ8zlAHPGukp2MCT7FZEKLAoCub9LqzthnL38g2xKR1Zm9vwH38EbT3/38MnijaiEonobiMdmZw6K2E5vff8d/gId4Nu/vdoHNCvP0am2bMp1t2Z60tr5IzqBqyWTEBmWosSDbHoTW8U2THUMA+/eYje17DWgugYHVRzzXcifs4PRNmJnYVvAVfW1mzKB4M8feYgDAtvRUpQzV0xZg/ujfnXgvVIoL/aYcFbhOltRwaKSomEroIKS+500zlPKuvy/fz64MEL+xCRheJJqWb0YOAUUlTyKuUaT+rBLY4YpyVFfe/9jJXLHxeINyPIq30dvEdUEhi2B4GkFBgTGmUImEmMBs+rimL9gN/xO8agGpSYaLvGF1c5fRJzbWGq2MRn+oeIgB08fbhgHZjr7ZL2ayag/AqfgxVR2Za9Us9ShAshPFDHtHiODmGXFX7ayCm5s+AyfnCvu8cEiyzAGTJ0RLJLy9uc7tRysTK1+cFuA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb892e4e-c508-4587-e681-08dc635324bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6379.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 05:06:33.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1aKUeVH+3td03ZYq+1/ryLfHf7DTOOxD+BiaiN/9gK5wu/ndBf2AV8uGfhXW3JuiA6XPWNrw7UkMrJWqt7eE4bsFO1PObYTWVFSU0/JW2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_03,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404230014
X-Proofpoint-GUID: 1jVkFXPoFZ_PS_ndvKqaJF46fDH87pFp
X-Proofpoint-ORIG-GUID: 1jVkFXPoFZ_PS_ndvKqaJF46fDH87pFp


On 4/22/24 7:21 PM, kernel test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git sla=
b/for-next
> head:   b6f00c4ef02065161c09fdf560e492cfbb1fec0a
> commit: 1c5610f451be71ca2f8b9c6b86ef4712aeed6437 [11/12] slub: introduce =
count_partial_free_approx()
> config: arm-mps2_defconfig (https://urldefense.com/v3/__https://download.=
01.org/0day-ci/archive/20240423/202404231035.P6HbfrHW-lkp@intel.com/config_=
_;!!ACWV5N9M2RV99hQ!OME34mL_ADYQENhnXxNwsh7RcI01QQqhK9FJsBEMMQaQVDaJM3wclQX=
94a6zSFnvxan0Qx-_wzC34V4$ )
> compiler: clang version 19.0.0git (https://urldefense.com/v3/__https://gi=
thub.com/llvm/llvm-project__;!!ACWV5N9M2RV99hQ!OME34mL_ADYQENhnXxNwsh7RcI01=
QQqhK9FJsBEMMQaQVDaJM3wclQX94a6zSFnvxan0Qx-_bxtcvFE$  5ef5eb66fb428aaf61fb5=
1b709f065c069c11242)
> reproduce (this is a W=3D1 build): (https://urldefense.com/v3/__https://d=
ownload.01.org/0day-ci/archive/20240423/202404231035.P6HbfrHW-lkp@intel.com=
/reproduce__;!!ACWV5N9M2RV99hQ!OME34mL_ADYQENhnXxNwsh7RcI01QQqhK9FJsBEMMQaQ=
VDaJM3wclQX94a6zSFnvxan0Qx-_K2OZqIs$ )
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-a=
ll/202404231035.P6HbfrHW-lkp@intel.com/__;!!ACWV5N9M2RV99hQ!OME34mL_ADYQENh=
nXxNwsh7RcI01QQqhK9FJsBEMMQaQVDaJM3wclQX94a6zSFnvxan0Qx-_gVX_avo$=20
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from mm/slub.c:13:
>    In file included from include/linux/mm.h:2208:
>    include/linux/vmstat.h:522:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>>> mm/slub.c:3256:14: error: call to undeclared function 'node_nr_objs'; I=
SO C99 and later do not support implicit function declarations [-Wimplicit-=
function-declaration]
>     3256 |                 x =3D min(x, node_nr_objs(n));
>          |                            ^
>    mm/slub.c:3256:14: note: did you mean 'node_nr_slabs'?

I'm sorry that I didn't catch this when I submitted.
For the v3 patchset, I placed this new function under
"#if defined(CONFIG_SLUB_DEBUG) || defined(SLAB_SUPPORTS_SYSFS)".
However, this causes problems: (1) node_nr_objs() is defined under
CONFIG_SLUB_DEBUG; (2) count_partial_free_approx() is only used under
CONFIG_SLUB_DEBUG. So, if CONFIG_SLUB_DEBUG is not set and
SLAB_SUPPORTS_SYSFS is set, the compilation will fail.

I've submitted a v4 that moves count_partial_free_approx() under
CONFIG_SLUB_DEBUG only, as it is not used in sysfs. Only the first patch is=
 modified.

Here is the link:
https://lore.kernel.org/linux-mm/20240423045554.15045-1-jianfeng.w.wang@ora=
cle.com/T/#t

>    mm/slub.c:1862:29: note: 'node_nr_slabs' declared here
>     1862 | static inline unsigned long node_nr_slabs(struct kmem_cache_no=
de *n)
>          |                             ^
>>> mm/slub.c:3256:7: error: static assertion failed due to requirement '__=
builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((u=
nsigned long)(-1)) < (unsigned long)1)) * 0L)) : (int *)8))), (((unsigned l=
ong)(-1)) < (unsigned long)1), 0) =3D=3D __builtin_choose_expr((sizeof(int)=
 =3D=3D sizeof (*(8 ? ((void *)((long)((((int)(-1)) < (int)1)) * 0L)) : (in=
t *)8))), (((int)(-1)) < (int)1), 0) || __builtin_choose_expr((sizeof(int) =
=3D=3D sizeof (*(8 ? ((void *)((long)((((unsigned long)(-1)) < (unsigned lo=
ng)1)) * 0L)) : (int *)8))), (((unsigned long)(-1)) < (unsigned long)1), 0)=
 =3D=3D __builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void *)((=
long)((((int)(-1)) < (int)1)) * 0L)) : (int *)8))), (((int)(-1)) < (int)1),=
 0) || (__builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((void *)((=
long)(x) * 0L)) : (int *)8))) && __builtin_choose_expr((sizeof(int) =3D=3D =
sizeof (*(8 ? ((void *)((long)((((unsigned long)(-1)) < (unsigned long)1)) =
* 0L)) : (int *)8))), (((unsigned long)(-1)) < (unsigned long)1), 0), x, -1=
) >=3D 0) || (__builtin_choose_expr((sizeof(int) =3D=3D sizeof (*(8 ? ((voi=
d *)((long)(node_nr_objs(n)) * 0L)) : (int *)8))) && __builtin_choose_expr(=
(sizeof(int) =3D=3D sizeof (*(8 ? ((void *)((long)((((int)(-1)) < (int)1)) =
* 0L)) : (int *)8))), (((int)(-1)) < (int)1), 0), node_nr_objs(n), -1) >=3D=
 0)': min(x, node_nr_objs(n)) signedness error, fix types or consider umin(=
) before min_t()
>     3256 |                 x =3D min(x, node_nr_objs(n));
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:85:19: note: expanded from macro 'min'
>       85 | #define min(x, y)       __careful_cmp(min, x, y)
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:58:3: note: expanded from macro '__careful_cmp'
>       58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQU=
E_ID(__y)))
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>    include/linux/minmax.h:51:16: note: expanded from macro '__cmp_once'
>       51 |         static_assert(__types_ok(x, y),                 \
>          |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       52 |                 #op "(" #x ", " #y ") signedness error, fix ty=
pes or consider u" #op "() before " #op "_t()"); \
>          |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/minmax.h:31:2: note: expanded from macro '__is_signed'
>       31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(ty=
peof(x))),        \
>          |         ^
>    include/linux/build_bug.h:77:50: note: expanded from macro 'static_ass=
ert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_=
ARGS__, #expr)
>          |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~=
~~~~~~~~~~~~~~
>    include/linux/build_bug.h:78:56: note: expanded from macro '__static_a=
ssert'
>       78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, m=
sg)
>          |                                                        ^~~~
>    1 warning and 2 errors generated.
>=20
>=20
> vim +/node_nr_objs +3256 mm/slub.c
>=20
>   3226=09
>   3227	static unsigned long count_partial_free_approx(struct kmem_cache_n=
ode *n)
>   3228	{
>   3229		unsigned long flags;
>   3230		unsigned long x =3D 0;
>   3231		struct slab *slab;
>   3232=09
>   3233		spin_lock_irqsave(&n->list_lock, flags);
>   3234		if (n->nr_partial <=3D MAX_PARTIAL_TO_SCAN) {
>   3235			list_for_each_entry(slab, &n->partial, slab_list)
>   3236				x +=3D slab->objects - slab->inuse;
>   3237		} else {
>   3238			/*
>   3239			 * For a long list, approximate the total count of objects in
>   3240			 * it to meet the limit on the number of slabs to scan.
>   3241			 * Scan from both the list's head and tail for better accuracy.
>   3242			 */
>   3243			unsigned long scanned =3D 0;
>   3244=09
>   3245			list_for_each_entry(slab, &n->partial, slab_list) {
>   3246				x +=3D slab->objects - slab->inuse;
>   3247				if (++scanned =3D=3D MAX_PARTIAL_TO_SCAN / 2)
>   3248					break;
>   3249			}
>   3250			list_for_each_entry_reverse(slab, &n->partial, slab_list) {
>   3251				x +=3D slab->objects - slab->inuse;
>   3252				if (++scanned =3D=3D MAX_PARTIAL_TO_SCAN)
>   3253					break;
>   3254			}
>   3255			x =3D mult_frac(x, n->nr_partial, scanned);
>> 3256			x =3D min(x, node_nr_objs(n));
>   3257		}
>   3258		spin_unlock_irqrestore(&n->list_lock, flags);
>   3259		return x;
>   3260	}
>   3261=09
>=20
