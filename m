Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC381172F;
	Fri, 11 Aug 2023 17:16:56 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37BDYSBj014685;
	Fri, 11 Aug 2023 17:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=3MwlEjg1qvmxMKAfe8bpx7bIF8Hs+FcGrBZ98BAEgf0=;
 b=tXOnKGom84+aIHSojopUniJbD6etemWqHBSKk4Elm+j1CdpFvsRF2t2ozxQ6PMq6WQ1r
 RiDcpI4D9pX8lKiaagM+dMdHC5drURzwiaiyBdF7goeafCxzarzDZqRkHaukI1eVPcbb
 gRFJQpMU7qCLNP14E3Na5vRBtXJ0kr78mHbEqw6UpG698Euz7uKPeplcT5kNOqP7pldM
 UTxQOpkQuzZTmfjIfeNlW1wQ2wFiKQsvoK0AjidME71QYatNMDXsDrKhiVV7Sgugaxne
 rL7VaCsDCrIBNUMNWPOzeFYcEdBvihkk76w+Ww/l9smzbSxwUblbOWwCEwHtca1QI23X ww== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sd8y3sgpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Aug 2023 17:16:48 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37BGQ50Y033428;
	Fri, 11 Aug 2023 17:16:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3s9cvam7w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Aug 2023 17:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoXTWgxlsocrxWLGdomBgT3+aDaLfIl0amTMVw5Y+BWq8SmdTtMQbBrmRsWSQQt6CqeJClfRXKDGkMeJ+iOhfqhJ9qVZOjvLBbgqGq9eKEQCTZ1IqUpUBAQ7UdTveSYQEpAaVHVizr75EwPnRzBXLEM+KeHXQNJheRcgEiVLwTAnYDhwXeDXMehIyuRrMZ75UVrUQB3MVlJpssgpT6qFM/zzGk/LK8mdhfVS3hwgfNu/4hZqCGvs0rw6ZKAzp2+RWeBDaEmja5pEsuK0rgURe2H8akLSCgkCY1hE2CqV2GUdiPAF5WvZFZDJs+myfHjhP8dp7XgFYMdw11Hg67sy4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MwlEjg1qvmxMKAfe8bpx7bIF8Hs+FcGrBZ98BAEgf0=;
 b=a3BSf6ka2HzkQDG0GSaJYNBxpPZPndYqDrIe02W8LiVud29vJNn20j98+AIoglLmU3OSJuXsoNYrDvrS/4E0SK8P+/cisXKLEeL0nbf59l+VKyqoVauPebZJ8oQ8DSmB/OD2l9VcJqZsH7wVDgEox9n6UeUxxJPPQfR3aC9iR/ZFd6IPNnlB5baVplVLdWxdWV6l+zRF/CyiJu03SMDB50e8OYnTBGdnR439WCZY6BQFWhH27r90UW1q4o7h3+v4kAPdk9H++Xjho342aHqcVK1JizLmiiau16Xs9+S3bOAexweY9b4XkniZiXf4dRi5S2OZdtkcFM4TagSnYBZIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MwlEjg1qvmxMKAfe8bpx7bIF8Hs+FcGrBZ98BAEgf0=;
 b=O+/lvH+vsOnrefW58+r2R8E9XdAUUOBAPz9V4e+CD7XyoefX2IXQpNuCNvR54ncUA1dlaWSUl9RzPylxDwWKCnFaNw7fXQKJOvupz+8GYnw0IXI9IQSaBqLojv/kvMe+VmWcqz/XJW2hzaXeoukssS0fDfJe30Ha46CFtnbc9vc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by IA0PR10MB6867.namprd10.prod.outlook.com (2603:10b6:208:433::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 17:16:45 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::be4f:55e6:89c5:4f57]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::be4f:55e6:89c5:4f57%4]) with mapi id 15.20.6678.020; Fri, 11 Aug 2023
 17:16:45 +0000
Message-ID: <879d4a39-c88c-71c8-3651-edc26d34f29e@oracle.com>
Date: Fri, 11 Aug 2023 12:16:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [akpm-mm:mm-nonmm-unstable 56/78] kernel/crash_core.c:331:16:
 error: incomplete definition of type 'struct crash_mem'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>
References: <202308111736.VWdS2xfs-lkp@intel.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <202308111736.VWdS2xfs-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|IA0PR10MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b63370-b97e-4536-af19-08db9a8ebd08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lOPq29CJM4yu+douA2RxLLr+snA2C4nWnNuNjoD1hKcalJiDu8WMT0RNC2CY6tnjUySl0TKiSqNGVThFIVch9kMpAdvNMrbWBMvesjlXy8a4v1bQicaw1kbRuKe0avr6S5bGEJ7nFNuo0WfUmd684hKUaUyDEpfNReIUOtMAUeXehzmNku3IGslSN3hWcYXqRpk1Tq/5nmcMPF3svV8oV3i0BDaUEgG+/fOClWs35VJVmLJ1+ZmsKEVOl/N7wTdXDM6wIeSvUoORVOgMFUdFZRnXraNr2THngqIPUaz+KH0tn0OucsucjCKVz1VSHAgXdxKZuxfor/m5cEAaFLUnWJkrG8ViNShWDgh8xTfF0I0B/YzWtXct5kBkYw6QQ5CqhsBJJKr99grc2bk6WYVjpEgmcMuG4dQrX1YxbHPI6MUxxCFgVvpa9FEo7J2GCeqvaM3Rwe+X0gUTRNqq0OwdRziI6mmtE7g0OXUFrpHSkYe3if8uBI7trmpI/Fbi5/JwNhO7Tr6J9diqOqP2AZv/qJT7eIlGbm8MzvF3oEOdLitfqC94l6togdNzy4l0qZIMED3fGGNPRC2QWy84R9JHEGHYTiUiIylX9gA86RpCUbVk8igql703eYi1c4lLuZLjwboAT0FKoBFQg4BgEPYiP76VdRrzf3iCHOT/N5SVoqI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(186006)(1800799006)(451199021)(4326008)(6512007)(31686004)(54906003)(478600001)(966005)(6916009)(66946007)(66556008)(66476007)(316002)(6486002)(5660300002)(6666004)(41300700001)(8936002)(6506007)(26005)(53546011)(86362001)(31696002)(8676002)(36756003)(2616005)(30864003)(38100700002)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cW9abFh6T0lKd0hEVjhTeUdVUW11RGgvdjkyWngyc29adWQ1S25McUpiNjFB?=
 =?utf-8?B?VDZUZHY2R2NKR2hrdnJXRlFueVZaWFNRZWZPSUR0bzJjbGlxeE5DbEhtaVNs?=
 =?utf-8?B?U0hWbVk4MGY2YVJYQW5IVGxkR0dwQVM5c1g0SDltaWR6QTBZUFJmcHpSN1JP?=
 =?utf-8?B?SHZyMmJqTFZydzBsdFRjQ3VtaG04cDd3WHFTRmhHam8xR3pCUVpkN3R3YWNr?=
 =?utf-8?B?K0ZMU1l5TUdRWkJFM0k1TEg4eUZxM2FZVCtBb3pkbERRaFI2VStkb3BOVDFj?=
 =?utf-8?B?WFh0ZXBaVUZsalZMRlBrMnAwSTlJY2dERU1jb0Y2dHJKem5TU1ExaHk5cURa?=
 =?utf-8?B?NFhQcHlOYjNBZ0JtbWhueVh0UlU1MXpLb1FVOGx3TG1QTVJRcnZmellpOEZL?=
 =?utf-8?B?ajd0S1U4ZWI0Sm1zRTloTHdUeW9PVFZtY0M2NC9pN25yZGdPL1B5eVB6T1BP?=
 =?utf-8?B?ZWRRSjU0SDVUTWdZSDdTYVZ4eTVIc2tvZWNzWDBwOWhNNlBURk5INVNpVW81?=
 =?utf-8?B?RlcyRU1pVlNUa2xGRlByODVIWGptWkJabGJ0MG5SeDZZaE80cTJWM2JBMUNI?=
 =?utf-8?B?TkxCU0FWZVFYcGNuODFyaTlxV0RSVUQ4MEM3WlY5aXZqdFFELzdsSHIvYVJz?=
 =?utf-8?B?eHNObVFvaFhiWjE4WWhOUlhOY2Z0UGxXN2ZEK2E4M1RPenlPck1wNFZObjNh?=
 =?utf-8?B?Q20zbm1GdVkyTG10SWJwdDJycDhERjlFUmc5YjRwbjA3dEJ2dmtKVWlZMmhm?=
 =?utf-8?B?ZXZoTnRKV1FjVXlKeGI0TitDMmFHbW94cFBTZ1NlYVZuMk5sM3RDd1IwSTFj?=
 =?utf-8?B?U0NDM3dYWndoNHFRazczR0lqRFhlQmdrOTExVDBxS0lPRGxqU2E5RlhNdDNy?=
 =?utf-8?B?SmdiMHczZCtZK0UrL3ZoQUUrUG85RWZXZ0ZPMUJrd3NmZUdBengxbkNRMUVs?=
 =?utf-8?B?RWVXaE00bHNnYWlKaEZtbm9oaEZ5cmZwNjlUdzZqM0lzcmEyRkpHd2JvMFpx?=
 =?utf-8?B?K29MUS9wVnFZWnUzZDlHV3hqK21SRXc4K1dCZFlKYVZDQ3RkSDd0dE1Yb0wx?=
 =?utf-8?B?M0pRSmtManlKeklxcytBWm1ycE41SWVQU1MzNEdIRXZGV0w2L21mSUxVb1g0?=
 =?utf-8?B?M2JnOXp0NytoUjhWalpscEpDbWV2R2NkMjFzRDlFMWZ1R0JpYjducGJIRTB1?=
 =?utf-8?B?bFJZaUF5TjQxNmlUdTV0RW1xd1NGV0R3VkVsVzhDdWZYUzR4R2VLeVY4UEhX?=
 =?utf-8?B?TW1FeHFycFRwUkluYXkrOTJYV0d2a3kwMmxGUDBFaDNwb0RqVDQ2ai9pMlJS?=
 =?utf-8?B?YUMvV0Y1dUVzNjAyK0hCbjVrZHJlWmdoaFZuMjNYdW5CeXZhTit2SkZPanZ3?=
 =?utf-8?B?K2t2aXkvZmRFa3c1em5tZldUOWVpYUN3RVEzalp0WjNhVjhsU3MzZDlYbVlE?=
 =?utf-8?B?UnlQaHJqT2dhbXZoVEJrQnFtOXhXTGd3Tmc4UXhYNDdGTjV5SnZuQ1hjZ3Qr?=
 =?utf-8?B?WVlCNGhrNHBlbllRb0ZLN3JwT0FuR3dvbnE2QWtqNmVjR3hXMVRwRVdxdEFS?=
 =?utf-8?B?Ym9PemZZeEEvbzh1Z1JVb0JNV2pQV2N5RG44RHh5U1FSd3JBMjUwVUpOZElS?=
 =?utf-8?B?RUJRL1d6UC85aFpta3FJRVk0RWRoU2dqZmViWEg3YWRLaUFGNHlmUTJnU3d2?=
 =?utf-8?B?VzJ6QWxPeENjTyswUzdUUVhaRU1FbGlJSDh0NkRUbE9SRm11bnY0VnBDZDNq?=
 =?utf-8?B?RDZtLzZodkRWMks1TlBqSHpFbDB1RVpTclhrWDdwWkdRQXNZRVNYbnR6cEpO?=
 =?utf-8?B?Q2Z3bDh4TmJIc1JPaUlOZUhXVzZmNk9tc1RpN0UzYVpjVTVENGxSUC9OcDk4?=
 =?utf-8?B?YTJOWXZpbkxucnJMMmlLdTk4WVdYQlRIamEwTUFEQWdKZFgrMHN5RzJlOXg1?=
 =?utf-8?B?WThsV0ZFQStWUGU0MlBXOEtqSTczdFhBMFZld2xGcVZwZFpNQk9wUTMrUHJk?=
 =?utf-8?B?RTZxY2FVa1ZIUEpJWFdVU0N1eWVNaUFGMUg3bUVyUXRuMmVJVWRZTU9qL2Jo?=
 =?utf-8?B?Wnhza2c0TXZzM2RrYkhSRG1uczEvOFhkT0trQXlDd1pRQlhsT0RHam9uMGwr?=
 =?utf-8?B?VFhWbVd6ZFRnVExrTngrcnE5K0VJTGdxQkJKa1MrVDZMMmtLaWJXTGpUNXZB?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7ErdoKa4LtUPjfyFPAPMEWiGy7feuolFRsult5+hztWoQQ8/YLjkGgmpEBKnyolTlZDYXPiipgzgMkyKNiAs3rVXxa+RE6RJxvFdPfHn2VKOyeKrqslUGfQ83sOKKy0vDwdqT8vR1OuB92mNr3qhv9Iu2AWZ5J3etoa0e7riBnsEv3dgic1hatuv4f/U3wpdjFaeO+1AoWjTAyRleMxEM9ZvVFMkPF9OoYKyY8SZEtsqfhd7F0CFRJGZf8ZxB5XoJgZdumSXU5qVYDftSt/ePB2u4qU2qVC214FZrsvL/BmI5M0PZPB1INbbyivdZh1Y9z59B+4U3C2q+gho97wYKg3JYCiIMFXRAT+kUSsygx+MevEzeMbqJrFveCyQ/TYK5ZUpdUeNHJBw2CySD3EbY8hxgYmP7TuPPRcTq4fVu1LEJwIzD8Uw8cRH8UmZsa01oXJdK/zKxBGGQ2l+AgqyEV5WA57RpD0kILV9uy9+nmMiLY4feUnLQmvC9lsLNpDu2YyGO7dsT20PG35IFQrV7Qv+Ztd3+DW60qUMcETmTmHpmz41CQ0IGql5xnvumvJKdlUpV9TpYHbUq3/kSq+0yxc+zSBLDzcn8e9YFsskKW4lMokbwm9jGIa4D58MNZQGTflJaJpOEhSqpX8iDsZ4jC2fYakojeL++EUvmSfkzyztRRD53HAjCPPl2PKktGPV659mxnbY5skftWsB1HRlDizC7C4NMkuTK2AnyackXyvsVB14DvzYmG4h8VzmU80HkQrZ9CxdQGOIJbOXejbXwxkI1WajP1eF98uICi4PySLmg1JS6Mvwx/ZWAX2OZB/qI0r41GfCMSlpLaKer1nrYsmHf2qogQBnGnd0O+5+I3pJ4tK3D3EtUgRnfTObDyVg1RM2sINsau3mcegsm18iBg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b63370-b97e-4536-af19-08db9a8ebd08
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 17:16:45.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DM6KuOfAc9nlABITzHD8NXpLFqowx1nMGeCI3Jnj+Q+SgUN+pPSyJXoBHjRkgV7+kYpVEXO6jDHQu+2fBVjguPidyACCY9BrOfPljWtMzEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6867
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_09,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308110158
X-Proofpoint-GUID: F23blXIu4QzZ3JFZhEotH3gCmTMmjT_m
X-Proofpoint-ORIG-GUID: F23blXIu4QzZ3JFZhEotH3gCmTMmjT_m

The build problem has been reproduced and solved in v27. Specifically the builds that fail are 
because only PROC_KCORE has been set, which only enables CRASH_CORE by itself. I had to move a few 
items to obtain the needed visibility.

"[PATCH v27 0/8] crash: Kernel handling of CPU and memory hot un/plug"
https://lore.kernel.org/lkml/20230811170642.6696-1-eric.devolder@oracle.com/

In addition, I've spot tested/built a few other architectures and do not encounter build errors.

Thanks!
eric

On 8/11/23 04:10, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   0f6b2c125ce19074c1086a70119b02dd30b089a4
> commit: 3f1eba00ee9d93b66f1859d40537befe44ceb1cd [56/78] crash: move a few code bits to setup support of crash hotplug
> config: x86_64-buildonly-randconfig-r003-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111736.VWdS2xfs-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111736.VWdS2xfs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308111736.VWdS2xfs-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     kernel/crash_core.c:318:40: warning: declaration of 'struct crash_mem' will not be visible outside of this function [-Wvisibility]
>     int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>                                            ^
>>> kernel/crash_core.c:331:16: error: incomplete definition of type 'struct crash_mem'
>             nr_phdr += mem->nr_ranges;
>                        ~~~^
>     kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
>     int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>                                            ^
>>> kernel/crash_core.c:343:25: error: use of undeclared identifier 'ELF_CORE_HEADER_ALIGN'
>             elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
>                                    ^
>>> kernel/crash_core.c:343:25: error: use of undeclared identifier 'ELF_CORE_HEADER_ALIGN'
>     kernel/crash_core.c:393:21: error: incomplete definition of type 'struct crash_mem'
>             for (i = 0; i < mem->nr_ranges; i++) {
>                             ~~~^
>     kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
>     int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>                                            ^
>     kernel/crash_core.c:394:15: error: incomplete definition of type 'struct crash_mem'
>                     mstart = mem->ranges[i].start;
>                              ~~~^
>     kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
>     int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>                                            ^
>     kernel/crash_core.c:395:13: error: incomplete definition of type 'struct crash_mem'
>                     mend = mem->ranges[i].end;
>                            ~~~^
>     kernel/crash_core.c:318:40: note: forward declaration of 'struct crash_mem'
>     int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>                                            ^
>     kernel/crash_core.c:318:5: warning: no previous prototype for function 'crash_prepare_elf64_headers' [-Wmissing-prototypes]
>     int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>         ^
>     kernel/crash_core.c:318:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>     ^
>     static
>     kernel/crash_core.c:417:36: warning: declaration of 'struct crash_mem' will not be visible outside of this function [-Wvisibility]
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:424:21: error: incomplete definition of type 'struct crash_mem'
>             for (i = 0; i < mem->nr_ranges; i++) {
>                             ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:425:14: error: incomplete definition of type 'struct crash_mem'
>                     start = mem->ranges[i].start;
>                             ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:426:12: error: incomplete definition of type 'struct crash_mem'
>                     end = mem->ranges[i].end;
>                           ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:441:7: error: incomplete definition of type 'struct crash_mem'
>                             mem->ranges[i].start = 0;
>                             ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:442:7: error: incomplete definition of type 'struct crash_mem'
>                             mem->ranges[i].end = 0;
>                             ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:443:15: error: incomplete definition of type 'struct crash_mem'
>                             if (i < mem->nr_ranges - 1) {
>                                     ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:445:24: error: incomplete definition of type 'struct crash_mem'
>                                     for (j = i; j < mem->nr_ranges - 1; j++) {
>                                                     ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:446:9: error: incomplete definition of type 'struct crash_mem'
>                                             mem->ranges[j].start =
>                                             ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:447:10: error: incomplete definition of type 'struct crash_mem'
>                                                     mem->ranges[j+1].start;
>                                                     ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:448:9: error: incomplete definition of type 'struct crash_mem'
>                                             mem->ranges[j].end =
>                                             ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:449:11: error: incomplete definition of type 'struct crash_mem'
>                                                             mem->ranges[j+1].end;
>                                                             ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
>     kernel/crash_core.c:458:8: error: incomplete definition of type 'struct crash_mem'
>                                     mem->nr_ranges--;
>                                     ~~~^
>     kernel/crash_core.c:417:36: note: forward declaration of 'struct crash_mem'
>     int crash_exclude_mem_range(struct crash_mem *mem,
>                                        ^
> 
> 
> vim +331 kernel/crash_core.c
> 
>     317	
>   > 318	int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>     319				  void **addr, unsigned long *sz)
>     320	{
>     321		Elf64_Ehdr *ehdr;
>     322		Elf64_Phdr *phdr;
>     323		unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
>     324		unsigned char *buf;
>     325		unsigned int cpu, i;
>     326		unsigned long long notes_addr;
>     327		unsigned long mstart, mend;
>     328	
>     329		/* extra phdr for vmcoreinfo ELF note */
>     330		nr_phdr = nr_cpus + 1;
>   > 331		nr_phdr += mem->nr_ranges;
>     332	
>     333		/*
>     334		 * kexec-tools creates an extra PT_LOAD phdr for kernel text mapping
>     335		 * area (for example, ffffffff80000000 - ffffffffa0000000 on x86_64).
>     336		 * I think this is required by tools like gdb. So same physical
>     337		 * memory will be mapped in two ELF headers. One will contain kernel
>     338		 * text virtual addresses and other will have __va(physical) addresses.
>     339		 */
>     340	
>     341		nr_phdr++;
>     342		elf_sz = sizeof(Elf64_Ehdr) + nr_phdr * sizeof(Elf64_Phdr);
>   > 343		elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
>     344	
>     345		buf = vzalloc(elf_sz);
>     346		if (!buf)
>     347			return -ENOMEM;
>     348	
>     349		ehdr = (Elf64_Ehdr *)buf;
>     350		phdr = (Elf64_Phdr *)(ehdr + 1);
>     351		memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
>     352		ehdr->e_ident[EI_CLASS] = ELFCLASS64;
>     353		ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
>     354		ehdr->e_ident[EI_VERSION] = EV_CURRENT;
>     355		ehdr->e_ident[EI_OSABI] = ELF_OSABI;
>     356		memset(ehdr->e_ident + EI_PAD, 0, EI_NIDENT - EI_PAD);
>     357		ehdr->e_type = ET_CORE;
>     358		ehdr->e_machine = ELF_ARCH;
>     359		ehdr->e_version = EV_CURRENT;
>     360		ehdr->e_phoff = sizeof(Elf64_Ehdr);
>     361		ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>     362		ehdr->e_phentsize = sizeof(Elf64_Phdr);
>     363	
>     364		/* Prepare one phdr of type PT_NOTE for each present CPU */
>     365		for_each_present_cpu(cpu) {
>     366			phdr->p_type = PT_NOTE;
>     367			notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
>     368			phdr->p_offset = phdr->p_paddr = notes_addr;
>     369			phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
>     370			(ehdr->e_phnum)++;
>     371			phdr++;
>     372		}
>     373	
>     374		/* Prepare one PT_NOTE header for vmcoreinfo */
>     375		phdr->p_type = PT_NOTE;
>     376		phdr->p_offset = phdr->p_paddr = paddr_vmcoreinfo_note();
>     377		phdr->p_filesz = phdr->p_memsz = VMCOREINFO_NOTE_SIZE;
>     378		(ehdr->e_phnum)++;
>     379		phdr++;
>     380	
>     381		/* Prepare PT_LOAD type program header for kernel text region */
>     382		if (need_kernel_map) {
>     383			phdr->p_type = PT_LOAD;
>     384			phdr->p_flags = PF_R|PF_W|PF_X;
>     385			phdr->p_vaddr = (unsigned long) _text;
>     386			phdr->p_filesz = phdr->p_memsz = _end - _text;
>     387			phdr->p_offset = phdr->p_paddr = __pa_symbol(_text);
>     388			ehdr->e_phnum++;
>     389			phdr++;
>     390		}
>     391	
>     392		/* Go through all the ranges in mem->ranges[] and prepare phdr */
>     393		for (i = 0; i < mem->nr_ranges; i++) {
>     394			mstart = mem->ranges[i].start;
>     395			mend = mem->ranges[i].end;
>     396	
>     397			phdr->p_type = PT_LOAD;
>     398			phdr->p_flags = PF_R|PF_W|PF_X;
>     399			phdr->p_offset  = mstart;
>     400	
>     401			phdr->p_paddr = mstart;
>     402			phdr->p_vaddr = (unsigned long) __va(mstart);
>     403			phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
>     404			phdr->p_align = 0;
>     405			ehdr->e_phnum++;
>     406			pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
>     407				phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
>     408				ehdr->e_phnum, phdr->p_offset);
>     409			phdr++;
>     410		}
>     411	
>     412		*addr = buf;
>     413		*sz = elf_sz;
>     414		return 0;
>     415	}
>     416	
> 
