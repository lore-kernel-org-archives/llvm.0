Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A59C2C4;
	Thu,  6 Jul 2023 20:07:16 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366K42TM018445;
	Thu, 6 Jul 2023 20:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=AEJbrd61Xr+Z5EvOmUqC1YkEWUm8jtIywtefdoZbfOw=;
 b=NfOlpopBY6D0fl23p0i8oUFdo51gk8dXqCVHFQBAQxP9gF+BCWU0ApzcLR2rk8UODAc9
 fjpp4hveHplIGo2oPzqzduwonshBGdFAHc0K6EsLDfEAZGr8Yof8T/hiLu94rzK6gVmI
 qBXKYsxZbeRO9+4mmxaAmgJQt627erBcSpq4XIqt9R+0sZi0Txyy7Gcf4hKt3dFgQbDU
 miGJDrFI2etoFv6t9OZAkjdfIPIJ3RqFsD6GAh5l5OxXAjqURjcbIaNmLMMZpKkB/Wpe
 zGtIqs31mxOcJO63NJKHu1OJBymyeeR40vXVhi6ULLhgToDmY+uJ6k2VIuHwkaIKu/cg zA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp3vy8259-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 20:07:08 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366IS9sH024442;
	Thu, 6 Jul 2023 20:07:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak81fcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 20:07:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyoZNeIxba2hlCdJs2ZXiAnwv8WXVo/Yh6PnPxYG/ioQ7f22AArO+HOryWE9b3VAvdXED/2qTQ4TNCVcTqq77cptpNjU9IMSu+53+MH/XmOEHHP8FIwMQtnpNOzKWQ5/M7Fke0JFlbNwLc/XH4bTvEaamrWDP+Xu1UuTUnPIB5fKRfG4g3NCa915YgVGQECEwoqPocdbMB8zOF85FYVG2eSjs/MV/d2jb1dnAL21X5tubzMrJKhocnhVsAgnrNVGSzOuMMLPo7Sq70xcEs9VS0bUogpL5tnfThmFQNhbqfszQsK1drb25McWp2ZgEsJbrdGoSzBlVc6cuJDFuYgbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEJbrd61Xr+Z5EvOmUqC1YkEWUm8jtIywtefdoZbfOw=;
 b=kK6/3JjO94jHYJR57JdtYkMiVr1d2mRsJwx7B9UoCSkr/awtVrJDYx7g2HVGtBqQJsXLm3H1hkbBjai6LOjsZ3Awh/htB3RQx0KEgTDMBANWIB6cbOwKQsP19x1eYdwP4aXp3XJ3vzTFDuaHX4Gj2Z4jbw5Nt1W5rwLhqauwQEPwO2jkEL06ZPjlXB0A6J/u2dvV+NCNhDFpZuum3PC1iIjcYAB9GTOejy5qByK9SgxeH+AEMY8FjRR6mH90tHoEhmeLMvNL4wgILqmfoEIfajHmBoqOMxvN0esyngRHE2MjZ3u4ewqWWOQ8QGg8MNGcWU+GFwlnVD2CmatqPyIIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEJbrd61Xr+Z5EvOmUqC1YkEWUm8jtIywtefdoZbfOw=;
 b=AzedhPIZ8CnycI0xaIQ4iaVLbkL8R7iE8lZsgeDVT5le7PIJ2xumwVGCrc4xuoMGoTwpO8QyCFjYhJgnCAdQU+sRM27/GY62GLo2tfRFneCywM0+YZCSFzITfVmDReBJ6plAmmZCitHu3z/lsFSRnC32DB1j69Xy+cF38SXfM8g=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SJ0PR10MB5834.namprd10.prod.outlook.com (2603:10b6:a03:3ee::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Thu, 6 Jul
 2023 20:07:04 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 20:07:04 +0000
Message-ID: <55d13fdd-90c1-9f19-2283-a9167cf67a17@oracle.com>
Date: Thu, 6 Jul 2023 15:07:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [akpm-mm:mm-nonmm-unstable 9/19] kernel/kexec.c:33:16: error:
 call to undeclared function 'phys_to_boot_phys'; ISO C99 and later do not
 support implicit function declarations
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
References: <202307060910.qHHF6BKp-lkp@intel.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <202307060910.qHHF6BKp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::25) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SJ0PR10MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a874c90-ece8-44ea-34e9-08db7e5c916f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z78E4Gzb/axQOAlXDJcL1bUINy1b4MLNS4h7u6sUJMl5mQGINwl8yXH9EduNz2SkOqxs7IlhBoEC08T1vCstiAw26DaiSBuLu2vE+NjGfrLJNSnK6XTLNMVshjmkJ+Ur6Xc5ru9MNuaBi0ILku8NDw+QesIOvSc9OVD01fDpoFp/rK6/pSxkMegQl0xzTVH3ODhHmhDqRNCdSwSueBv+q+51rPZvm2metdebbJN8d8i299muaG7PT79viDxnpHoqA/bo3Gy/AncMJyoKv/eMJTjN2+7aoX61poy7B6DvlVgS2CIHD9WFIn9HK0cTnt7ZPqacH1DbM2hV7gAiMEFoIai6lIg8x9Jq66TwY5RUlKhkA8/BbdMOAY+dePBrEIz7EkS76MvXFW7BIDAnd8sn9FoovKJXLqW3S9k1+oazW/+mO0sRkNq/4EfUVWIkAuQ3CwpKzX8eMcPdZ0uZSNSI7M2XGnZIKtYVBT82W8vv4DDxoQMq2gSPRvHnPlEoBOkl+nON4Tqjw7H3PtZoAT7z/ulEOR9GtDe+KHe8+5hZlhWYV55GrKxHdHU2wnfbFtuNiY4hbyF3ef1y0Vrcb3GxKme+X2yjsEvj8nV5UKqpycUULyDPAgQu1YYhKfqu+WxzL/HgnbGLjeJfnBpItS/f3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(6666004)(2906002)(38100700002)(30864003)(6486002)(8936002)(54906003)(8676002)(36756003)(41300700001)(5660300002)(478600001)(66946007)(53546011)(26005)(6916009)(66556008)(66476007)(86362001)(6512007)(6506007)(186003)(4326008)(31686004)(316002)(966005)(31696002)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0ZUZTRKL3lKOXB3YUpuTUtIbHE3YkQ4dTdnWWFoYTErSkZwUmdQb1pCRWZk?=
 =?utf-8?B?VHJXZlJsQWRRblN3Zkx5ekdQOENOclVha2hNTzRpeXlmTFFUc0g0VnJaWTBJ?=
 =?utf-8?B?Yk04ZFJ2eHhiVkZVdlNmeUtsenQ3ajMvdjV2QzZFazBTK2N1N2U0dlo2bFI3?=
 =?utf-8?B?aFcvejhZVGRYbTVkeCtQVldCd2FvRURzeENxYS8vT1VsbDNVM1NJVWZ6Ty83?=
 =?utf-8?B?d2tHUnA5MjFMTmljWkZaNUMwSHJoYVVRelNhQlRhSDRJYy9UWlE1YTNVRGxL?=
 =?utf-8?B?bGRqMFhFYlliSkRqcWlWbjFQdVRxNlA4akhwbWlOcDBDMDhtR0piQVdxTzhu?=
 =?utf-8?B?K1JtTVZaK05IbVpJOVNmYnZGS2IvblR5WUpwR2cvSTNLMk9mRGN3WVhEeGpt?=
 =?utf-8?B?ZEJyMU9aTVNPNW00Tmc1YkpTMHIzZk90dXZibmhhRFhUbXlZbjBubmFkTjU3?=
 =?utf-8?B?UVVWc3k0MkIra0J4bWJwNERweUZVUE9LWTNlTy96M2ovTGZ2aVJLS3VZUWo0?=
 =?utf-8?B?dm4wczNnTWpGOWtBZ0RveUZkME5XcHZVMWp3aStxVDFmTU9yNGZFcytNTlFm?=
 =?utf-8?B?QmY0dTFYbjBFbUFzZ2MwR0pSdzJ5NC9zb1RMNUdQcmlnaWRCQkNGUzdSYlAx?=
 =?utf-8?B?ajBPOWg1UnFZbGlvMW1ZUS9wazMzL1lNbnh5Um1Ic2ovdUhjeWE0OFBDc0or?=
 =?utf-8?B?MVo2MEk0Z05NVXBFM1RLTXlsYlBrdkd0L1Q4eTlmVWNiU3ZqZ3RJNGxvaERO?=
 =?utf-8?B?NVYwbEZCbDcxenRYcTZRbjlEcCt3cTlBYU9aSVJrLy9ET0R1TktMOUZUc3J3?=
 =?utf-8?B?Ly9La2l1ZVByQ2VHdWpkQjVXdUlLREc3djhXRmpkUEVPMC85Uk82ajBmNUht?=
 =?utf-8?B?NHpUTEZiby80S3UxbklXT082bkEzR3dnK2ZTR2wwb0o4aEN2M24vdGRnNThD?=
 =?utf-8?B?aW1kMzlNMmM4TEFkemxCSmllZ0JFTVEyblBrSzdiTzMrSHVENGhEdEdwbDh3?=
 =?utf-8?B?dU9wVVhQU055WmhGOTRna1lrcDVROEZZeHMrRzhZZVFEa1F5WjFXYkZaVUlj?=
 =?utf-8?B?ZEUyYW9PQ0ZVaVlwd3EyR0dFUW5RVUkvdGFiVnpqSFJjUDZpVENwU2lncG9O?=
 =?utf-8?B?SGEwaEpyYktkZndpQTEvSlZ5NVppdWVzQVNab0UvcCtZL3IrR3N3SkljR3Zx?=
 =?utf-8?B?bFJaTVp3Ykw2TjFkaEhEbElMSXc5TjVUSmFFNVZ6ajVTU3JWajhSckhkNlJ6?=
 =?utf-8?B?dVNGcU9PZ3hFOEhrRHhvWFBxZnBlcG5za3puUXJsOGp0Nk5UZlRDWHpyY3BJ?=
 =?utf-8?B?QTMweW9YTUhIWmFuUXQ4MzlwT3hlVkh5N1FSMHpqeS9wUWxCMDlWQWQ2RWJ2?=
 =?utf-8?B?NkdtcFFxM0tsUGlJNmE5ZHpTTFhhNGtKVWtrT0RWS1FHTGxUUStHWGJUcW5I?=
 =?utf-8?B?WW9Yc2RqNzRQTTJoNE9mdjlCN2c0cDFaeHFhbW9oRldia3VpTytCK3VoWjlV?=
 =?utf-8?B?UlNzc01DWktPV05RRlFxeW9sZ1hlWnpnak90OGRZLytIL25FNkkxcGhHd3Nx?=
 =?utf-8?B?MytqSWxtbnYrWUtSTmd3WGNaQWVIb3pwSmthTy8rSHB1TDRWMkw5WDIzRVlF?=
 =?utf-8?B?OEVPRmYwUHB6bXkyQlFOQkl6cUFSNExwOHJjTGFRd0JXRlFOV0l0WndKL1U4?=
 =?utf-8?B?US9JQWs1TTBhMlJLT2d5QlJkb3JoZTgvNW1yNTBHdHhWUmcrQXlHTDZRMk1r?=
 =?utf-8?B?Q2tNYm1kQWhlUnB4eENyTFlYSmRzMnIvZWhlZlp0WmJKWlRya3BYdUpHWTdk?=
 =?utf-8?B?ckVNcm4rdnNiUFhTU0NqdDBlTVlHd0J4cENaTGcyMDEvSUJtOTd0eVhYOHIr?=
 =?utf-8?B?aTkwU25VbGpKSDRZMDNuOG0rWFVSQnFpYWdzZXJCa2JZbFpXMnI3dWVEYVow?=
 =?utf-8?B?aXhmYWVZZ3VyaHhZQ0poNFJIbXF3YVIzTndteDc0Z3lQZ3hvWS9hRU9iWkpi?=
 =?utf-8?B?Q3JrUi82ajhoRUg0WlpXWUlMZ1FNV1dvQXA3NDlFUTYzd201Rk5jcVVBNCtR?=
 =?utf-8?B?UGJuOE5YZEVkTnhXeG1hQlpTaHVFUUF1cTM5dG1pNUg3Y3NCT0o5emFRZ2hJ?=
 =?utf-8?B?amlNMEY5dmUyV0FPQW5MSjR4bndvL0FOTDZlSnlpUHZhZ1djYktJcmJoRlFD?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	kb3fxgEydyuVkVTnhLgW2SZnFWNTuRfeG+qajDmSpOEe+b4nH99ZDx/zP+jiWtVqroo+hB4papLCIcQ7plfx1G0wAVVJpPe6j9f2S2J9a9rU9r/jiLLn5n7hVndcv74mfVqpDYn0D90bFf4Las9zNZvABWLivjwS+hjV9PZ1t4UMxIHmEnLK/zexAg0xfoOZzxkusUpeCWZ6kjL8Gu7pXGPL9Y1i9Q44FyOoEArMlPGVoQ+2Wag3JpN1NDmIO887nuHNhSwPfSzsJA0emj+RtqU34cAIGb80gUnqAsQ9ov95ydh5yw0c/6VonUElFC6kCVc4MzO0xkqI1zI5RlFRztSvVe8fC7gzbpDGrg4ZJNJhKx34KM+f5jku6h7NSTKT+J2ijSHmnnJKQIUSdAIVWwiLfXJy5wL6jFVUkPhH9HqxcOArkCj2Mhza8AjRQWY+qep0dL4iHco+FJR+31UwOeYKfQxOZg6sYDyf+pabLqkT3yTEfDLZixBYD+bBw6USCEAtMNzbgZtzVrd143vGLpSTIXbCjf84ITMCm3mZ5umwFPfosz2X1thWdDPrwHGUf5TD80KwyCN70KfJiWvbvYUNkigHQ4+BNh3hrwApZgKABb6OZDxDiDxVcfWzsPCRbjJ8F9poO3UAzGIEqYp3tIrllJ2Zjnd0Jb8Lka/O7smAzL7uP5Oxqpm/RKVOAdlYfXbqP4SCYP6LQEY6MJYcjgXAeiO/6x+hdZvgE8H0appesMpkpdSSPyToTNV9pVHIRO7CKfCXmHAPJz4eQ1tdQh7xUUs4iYXI+hQ4AaXuLH0HwGuETvH+zdQJu2LHHMTQHerv0gmSSTNgkHOUSvWrkgqxQ6vzZE5nZbNrdUbYlgSMkTQycX0vkkzGqaXtw9/P
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a874c90-ece8-44ea-34e9-08db7e5c916f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 20:07:04.6889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KC4K4lW7z9O/qPLDBIC45qQO677MkhwlkeAbdpcjW4LO+F4wufq8A6TXosXLkh5HaHdhAK9kBfUXaGHS5VqeHYmkqWbz2AaQTu+0msGxwLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5834
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307060177
X-Proofpoint-ORIG-GUID: nwvqnAR2y3P3G9l5919efwG3tOx3PDyk
X-Proofpoint-GUID: nwvqnAR2y3P3G9l5919efwG3tOx3PDyk



On 7/5/23 20:05, kernel test robot wrote:
> Hi Eric,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   dafc95d811f426078ef86cbbbb995055280e415e
> commit: e92bee18ff7a05e2f59f4135d10067dcefb3e861 [9/19] arm/kexec: refactor for kernel/Kconfig.kexec
> config: arm-randconfig-r046-20230706 (https://download.01.org/0day-ci/archive/20230706/202307060910.qHHF6BKp-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060910.qHHF6BKp-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307060910.qHHF6BKp-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):

In this situation:

#
# Kexec and crash features
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC=y
CONFIG_CRASH_DUMP=y
# end of Kexec and crash features

and CONFIG_KEXEC_CORE is missing. I've added it to CRASH_DUMP in my v5, that combined with
Arnd's 'depends on ARCH_SUPPORTS_KEXEC' should close this hole.

eric

> 
>>> kernel/kexec.c:33:16: error: call to undeclared function 'phys_to_boot_phys'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>        33 |                 if ((entry < phys_to_boot_phys(crashk_res.start)) ||
>           |                              ^
>>> kernel/kexec.c:43:7: error: incomplete definition of type 'struct kimage'
>        43 |         image->start = entry;
>           |         ~~~~~^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>     kernel/kexec.c:44:7: error: incomplete definition of type 'struct kimage'
>        44 |         image->nr_segments = nr_segments;
>           |         ~~~~~^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>>> kernel/kexec.c:45:55: error: invalid application of 'sizeof' to an incomplete type 'struct kexec_segment'
>        45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
>           |                                                              ^~~~~~~~~~~
>     include/linux/fortify-string.h:693:53: note: expanded from macro 'memcpy'
>       693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>           |                                                     ^
>     include/linux/fortify-string.h:636:41: note: expanded from macro '__fortify_memcpy_chk'
>       636 |         const size_t __fortify_size = (size_t)(size);                   \
>           |                                                ^~~~
>     include/linux/syscalls.h:20:8: note: forward declaration of 'struct kexec_segment'
>        20 | struct kexec_segment;
>           |        ^
>     kernel/kexec.c:45:14: error: incomplete definition of type 'struct kimage'
>        45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
>           |                ~~~~~^
>     include/linux/fortify-string.h:694:17: note: expanded from macro 'memcpy'
>       694 |                 __struct_size(p), __struct_size(q),                     \
>           |                               ^
>     include/linux/fortify-string.h:96:56: note: expanded from macro '__struct_size'
>        96 | #define __struct_size(p)        __builtin_dynamic_object_size(p, 0)
>           |                                                               ^
>     include/linux/fortify-string.h:637:27: note: expanded from macro '__fortify_memcpy_chk'
>       637 |         const size_t __p_size = (p_size);                               \
>           |                                  ^~~~~~
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>     kernel/kexec.c:45:14: error: incomplete definition of type 'struct kimage'
>        45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
>           |                ~~~~~^
>     include/linux/fortify-string.h:695:17: note: expanded from macro 'memcpy'
>       695 |                 __member_size(p), __member_size(q),                     \
>           |                               ^
>     include/linux/fortify-string.h:97:56: note: expanded from macro '__member_size'
>        97 | #define __member_size(p)        __builtin_dynamic_object_size(p, 1)
>           |                                                               ^
>     include/linux/fortify-string.h:639:33: note: expanded from macro '__fortify_memcpy_chk'
>       639 |         const size_t __p_size_field = (p_size_field);                   \
>           |                                        ^~~~~~~~~~~~
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>     kernel/kexec.c:45:14: error: incomplete definition of type 'struct kimage'
>        45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
>           |                ~~~~~^
>     include/linux/fortify-string.h:693:47: note: expanded from macro 'memcpy'
>       693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>           |                                               ^
>     include/linux/fortify-string.h:648:20: note: expanded from macro '__fortify_memcpy_chk'
>       648 |         __underlying_##op(p, q, __fortify_size);                        \
>           |                           ^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>     kernel/kexec.c:49:8: error: incomplete definition of type 'struct kimage'
>        49 |                 image->control_page = crashk_res.start;
>           |                 ~~~~~^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>     kernel/kexec.c:50:8: error: incomplete definition of type 'struct kimage'
>        50 |                 image->type = KEXEC_TYPE_CRASH;
>           |                 ~~~~~^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>>> kernel/kexec.c:50:17: error: use of undeclared identifier 'KEXEC_TYPE_CRASH'
>        50 |                 image->type = KEXEC_TYPE_CRASH;
>           |                               ^
>     kernel/kexec.c:63:7: error: incomplete definition of type 'struct kimage'
>        63 |         image->control_code_page = kimage_alloc_control_pages(image,
>           |         ~~~~~^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>>> kernel/kexec.c:63:29: error: call to undeclared function 'kimage_alloc_control_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>        63 |         image->control_code_page = kimage_alloc_control_pages(image,
>           |                                    ^
>>> kernel/kexec.c:64:19: error: use of undeclared identifier 'KEXEC_CONTROL_PAGE_SIZE'
>        64 |                                            get_order(KEXEC_CONTROL_PAGE_SIZE));
>           |                                                      ^
>     kernel/kexec.c:65:12: error: incomplete definition of type 'struct kimage'
>        65 |         if (!image->control_code_page) {
>           |              ~~~~~^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>     kernel/kexec.c:71:8: error: incomplete definition of type 'struct kimage'
>        71 |                 image->swap_page = kimage_alloc_control_pages(image, 0);
>           |                 ~~~~~^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>     kernel/kexec.c:72:13: error: incomplete definition of type 'struct kimage'
>        72 |                 if (!image->swap_page) {
>           |                      ~~~~~^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>     kernel/kexec.c:81:30: error: incomplete definition of type 'struct kimage'
>        81 |         kimage_free_page_list(&image->control_pages);
>           |                                ~~~~~^
>     kernel/kexec_internal.h:7:8: note: forward declaration of 'struct kimage'
>         7 | struct kimage *do_kimage_alloc_init(void);
>           |        ^
>>> kernel/kexec.c:103:17: error: use of undeclared identifier 'kexec_crash_image'; did you mean 'kexec_crash_loaded'?
>       103 |                 dest_image = &kexec_crash_image;
>           |                               ^~~~~~~~~~~~~~~~~
>           |                               kexec_crash_loaded
>     include/linux/kexec.h:499:19: note: 'kexec_crash_loaded' declared here
>       499 | static inline int kexec_crash_loaded(void) { return 0; }
>           |                   ^
>     kernel/kexec.c:104:7: error: use of undeclared identifier 'kexec_crash_image'; did you mean 'kexec_crash_loaded'?
>       104 |                 if (kexec_crash_image)
>           |                     ^~~~~~~~~~~~~~~~~
>           |                     kexec_crash_loaded
>     include/linux/kexec.h:499:19: note: 'kexec_crash_loaded' declared here
>       499 | static inline int kexec_crash_loaded(void) { return 0; }
>           |                   ^
>     fatal error: too many errors emitted, stopping now [-ferror-limit=]
>     20 errors generated.
> --
>>> arch/arm/kernel/machine_kexec.c:33:34: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
>        33 | int machine_kexec_prepare(struct kimage *image)
>           |                                  ^
>>> arch/arm/kernel/machine_kexec.c:39:7: error: incomplete definition of type 'struct kimage'
>        39 |         image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
>           |         ~~~~~^
>     arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
>        33 | int machine_kexec_prepare(struct kimage *image)
>           |                                  ^
>     arch/arm/kernel/machine_kexec.c:39:31: error: incomplete definition of type 'struct kimage'
>        39 |         image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
>           |                                 ~~~~~^
>     arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
>        33 | int machine_kexec_prepare(struct kimage *image)
>           |                                  ^
>>> arch/arm/kernel/machine_kexec.c:39:41: error: use of undeclared identifier 'KEXEC_ARM_ZIMAGE_OFFSET'
>        39 |         image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
>           |                                                ^
>>> arch/arm/kernel/machine_kexec.c:40:12: error: use of undeclared identifier 'KEXEC_ARM_ATAGS_OFFSET'
>        40 |                                      + KEXEC_ARM_ATAGS_OFFSET;
>           |                                        ^
>     arch/arm/kernel/machine_kexec.c:55:23: error: incomplete definition of type 'struct kimage'
>        55 |         for (i = 0; i < image->nr_segments; i++) {
>           |                         ~~~~~^
>     arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
>        33 | int machine_kexec_prepare(struct kimage *image)
>           |                                  ^
>     arch/arm/kernel/machine_kexec.c:56:27: error: incomplete definition of type 'struct kimage'
>        56 |                 current_segment = &image->segment[i];
>           |                                    ~~~~~^
>     arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
>        33 | int machine_kexec_prepare(struct kimage *image)
>           |                                  ^
>>> arch/arm/kernel/machine_kexec.c:58:63: error: incomplete definition of type 'struct kexec_segment'
>        58 |                 if (!memblock_is_region_memory(idmap_to_phys(current_segment->mem),
>           |                                                              ~~~~~~~~~~~~~~~^
>     arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
>        35 |         struct kexec_segment *current_segment;
>           |                ^
>     arch/arm/kernel/machine_kexec.c:59:28: error: incomplete definition of type 'struct kexec_segment'
>        59 |                                                current_segment->memsz))
>           |                                                ~~~~~~~~~~~~~~~^
>     arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
>        35 |         struct kexec_segment *current_segment;
>           |                ^
>     arch/arm/kernel/machine_kexec.c:62:50: error: incomplete definition of type 'struct kexec_segment'
>        62 |                 err = get_user(header, (__be32*)current_segment->buf);
>           |                                                 ~~~~~~~~~~~~~~~^
>     arch/arm/include/asm/uaccess.h:229:38: note: expanded from macro 'get_user'
>       229 | #define get_user(x, p)  __get_user(x, p)
>           |                                       ^
>     arch/arm/include/asm/uaccess.h:258:23: note: expanded from macro '__get_user'
>       258 |         __get_user_err((x), (ptr), __gu_err, TUSER());                  \
>           |                              ^~~
>     arch/arm/include/asm/uaccess.h:264:44: note: expanded from macro '__get_user_err'
>       264 |         unsigned long __gu_addr = (unsigned long)(ptr);                 \
>           |                                                   ^~~
>     arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
>        35 |         struct kexec_segment *current_segment;
>           |                ^
>     arch/arm/kernel/machine_kexec.c:62:50: error: incomplete definition of type 'struct kexec_segment'
>        62 |                 err = get_user(header, (__be32*)current_segment->buf);
>           |                                                 ~~~~~~~~~~~~~~~^
>     arch/arm/include/asm/uaccess.h:229:38: note: expanded from macro 'get_user'
>       229 | #define get_user(x, p)  __get_user(x, p)
>           |                                       ^
>     arch/arm/include/asm/uaccess.h:258:23: note: expanded from macro '__get_user'
>       258 |         __get_user_err((x), (ptr), __gu_err, TUSER());                  \
>           |                              ^~~
>     arch/arm/include/asm/uaccess.h:270:19: note: expanded from macro '__get_user_err'
>       270 |         switch (sizeof(*(ptr))) {                                       \
>           |                          ^~~
>     arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
>        35 |         struct kexec_segment *current_segment;
>           |                ^
>     arch/arm/kernel/machine_kexec.c:62:50: error: incomplete definition of type 'struct kexec_segment'
>        62 |                 err = get_user(header, (__be32*)current_segment->buf);
>           |                                                 ~~~~~~~~~~~~~~~^
>     arch/arm/include/asm/uaccess.h:229:38: note: expanded from macro 'get_user'
>       229 | #define get_user(x, p)  __get_user(x, p)
>           |                                       ^
>     arch/arm/include/asm/uaccess.h:258:23: note: expanded from macro '__get_user'
>       258 |         __get_user_err((x), (ptr), __gu_err, TUSER());                  \
>           |                              ^~~
>     arch/arm/include/asm/uaccess.h:277:22: note: expanded from macro '__get_user_err'
>       277 |         (x) = (__typeof__(*(ptr)))__gu_val;                             \
>           |                             ^~~
>     arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
>        35 |         struct kexec_segment *current_segment;
>           |                ^
>     arch/arm/kernel/machine_kexec.c:67:9: error: incomplete definition of type 'struct kimage'
>        67 |                         image->arch.kernel_r2 = current_segment->mem;
>           |                         ~~~~~^
>     arch/arm/kernel/machine_kexec.c:33:34: note: forward declaration of 'struct kimage'
>        33 | int machine_kexec_prepare(struct kimage *image)
>           |                                  ^
>     arch/arm/kernel/machine_kexec.c:67:43: error: incomplete definition of type 'struct kexec_segment'
>        67 |                         image->arch.kernel_r2 = current_segment->mem;
>           |                                                 ~~~~~~~~~~~~~~~^
>     arch/arm/kernel/machine_kexec.c:35:9: note: forward declaration of 'struct kexec_segment'
>        35 |         struct kexec_segment *current_segment;
>           |                ^
>>> arch/arm/kernel/machine_kexec.c:33:5: warning: no previous prototype for function 'machine_kexec_prepare' [-Wmissing-prototypes]
>        33 | int machine_kexec_prepare(struct kimage *image)
>           |     ^
>     arch/arm/kernel/machine_kexec.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>        33 | int machine_kexec_prepare(struct kimage *image)
>           | ^
>           | static
>     arch/arm/kernel/machine_kexec.c:72:35: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
>        72 | void machine_kexec_cleanup(struct kimage *image)
>           |                                   ^
>>> arch/arm/kernel/machine_kexec.c:72:6: warning: no previous prototype for function 'machine_kexec_cleanup' [-Wmissing-prototypes]
>        72 | void machine_kexec_cleanup(struct kimage *image)
>           |      ^
>     arch/arm/kernel/machine_kexec.c:72:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>        72 | void machine_kexec_cleanup(struct kimage *image)
>           | ^
>           | static
>>> arch/arm/kernel/machine_kexec.c:82:2: error: call to undeclared function 'crash_setup_regs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>        82 |         crash_setup_regs(&regs, get_irq_regs());
>           |         ^
>>> arch/arm/kernel/machine_kexec.c:85:2: error: call to undeclared function 'crash_save_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>        85 |         crash_save_cpu(&regs, smp_processor_id());
>           |         ^
>     arch/arm/kernel/machine_kexec.c:146:2: error: call to undeclared function 'crash_save_cpu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       146 |         crash_save_cpu(regs, smp_processor_id());
>           |         ^
>     arch/arm/kernel/machine_kexec.c:152:27: warning: declaration of 'struct kimage' will not be visible outside of this function [-Wvisibility]
>       152 | void machine_kexec(struct kimage *image)
>           |                           ^
>     arch/arm/kernel/machine_kexec.c:167:19: error: incomplete definition of type 'struct kimage'
>       167 |         page_list = image->head & PAGE_MASK;
>           |                     ~~~~~^
>     arch/arm/kernel/machine_kexec.c:152:27: note: forward declaration of 'struct kimage'
>       152 | void machine_kexec(struct kimage *image)
>           |                           ^
>     arch/arm/kernel/machine_kexec.c:169:41: error: incomplete definition of type 'struct kimage'
>       169 |         reboot_code_buffer = page_address(image->control_code_page);
>           |                                           ~~~~~^
>     include/linux/mm.h:2144:48: note: expanded from macro 'page_address'
>      2144 | #define page_address(page) lowmem_page_address(page)
>           |                                                ^~~~
>     arch/arm/kernel/machine_kexec.c:152:27: note: forward declaration of 'struct kimage'
>       152 | void machine_kexec(struct kimage *image)
>           |                           ^
>     arch/arm/kernel/machine_kexec.c:177:35: error: incomplete definition of type 'struct kimage'
>       177 |         data->kexec_start_address = image->start;
>           |                                     ~~~~~^
>     arch/arm/kernel/machine_kexec.c:152:27: note: forward declaration of 'struct kimage'
>       152 | void machine_kexec(struct kimage *image)
>           |                           ^
>     fatal error: too many errors emitted, stopping now [-ferror-limit=]
>     5 warnings and 20 errors generated.
> --
>>> arch/arm/kernel/setup.c:1034:49: error: use of undeclared identifier 'SECTION_SIZE'
>      1034 |                 start = memblock_phys_alloc_range(crash_size, SECTION_SIZE,
>           |                                                               ^
>     1 error generated.
> 
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for KEXEC
>     Depends on [n]: ARCH_SUPPORTS_KEXEC [=n]
>     Selected by [y]:
>     - CRASH_DUMP [=y] && ARCH_SUPPORTS_CRASH_DUMP [=y]
> 
> 
> vim +/phys_to_boot_phys +33 kernel/kexec.c
> 
> a43cac0d9dc207 Dave Young         2015-09-09   21
> 255aedd90e3e80 Vivek Goyal        2014-08-08   22  static int kimage_alloc_init(struct kimage **rimage, unsigned long entry,
> 72414d3f1d22fc Maneesh Soni       2005-06-25   23  			     unsigned long nr_segments,
> 5d700a0fd71ded Arnd Bergmann      2021-09-08   24  			     struct kexec_segment *segments,
> 255aedd90e3e80 Vivek Goyal        2014-08-08   25  			     unsigned long flags)
> dc009d92435f99 Eric W. Biederman  2005-06-25   26  {
> 255aedd90e3e80 Vivek Goyal        2014-08-08   27  	int ret;
> dc009d92435f99 Eric W. Biederman  2005-06-25   28  	struct kimage *image;
> 255aedd90e3e80 Vivek Goyal        2014-08-08   29  	bool kexec_on_panic = flags & KEXEC_ON_CRASH;
> 255aedd90e3e80 Vivek Goyal        2014-08-08   30
> 255aedd90e3e80 Vivek Goyal        2014-08-08   31  	if (kexec_on_panic) {
> 255aedd90e3e80 Vivek Goyal        2014-08-08   32  		/* Verify we have a valid entry point */
> 43546d8669d62d Russell King       2016-08-02  @33  		if ((entry < phys_to_boot_phys(crashk_res.start)) ||
> 43546d8669d62d Russell King       2016-08-02   34  		    (entry > phys_to_boot_phys(crashk_res.end)))
> 255aedd90e3e80 Vivek Goyal        2014-08-08   35  			return -EADDRNOTAVAIL;
> 255aedd90e3e80 Vivek Goyal        2014-08-08   36  	}
> dc009d92435f99 Eric W. Biederman  2005-06-25   37
> dc009d92435f99 Eric W. Biederman  2005-06-25   38  	/* Allocate and initialize a controlling structure */
> dabe78628dd886 Vivek Goyal        2014-08-08   39  	image = do_kimage_alloc_init();
> dabe78628dd886 Vivek Goyal        2014-08-08   40  	if (!image)
> dabe78628dd886 Vivek Goyal        2014-08-08   41  		return -ENOMEM;
> dabe78628dd886 Vivek Goyal        2014-08-08   42
> dabe78628dd886 Vivek Goyal        2014-08-08  @43  	image->start = entry;
> 5d700a0fd71ded Arnd Bergmann      2021-09-08  @44  	image->nr_segments = nr_segments;
> 5d700a0fd71ded Arnd Bergmann      2021-09-08  @45  	memcpy(image->segment, segments, nr_segments * sizeof(*segments));
> dabe78628dd886 Vivek Goyal        2014-08-08   46
> 255aedd90e3e80 Vivek Goyal        2014-08-08   47  	if (kexec_on_panic) {
> cdf4b3fa03bab1 Xunlei Pang        2016-01-20   48  		/* Enable special crash kernel control page alloc policy. */
> 255aedd90e3e80 Vivek Goyal        2014-08-08   49  		image->control_page = crashk_res.start;
> 255aedd90e3e80 Vivek Goyal        2014-08-08  @50  		image->type = KEXEC_TYPE_CRASH;
> 255aedd90e3e80 Vivek Goyal        2014-08-08   51  	}
> 255aedd90e3e80 Vivek Goyal        2014-08-08   52
> cdf4b3fa03bab1 Xunlei Pang        2016-01-20   53  	ret = sanity_check_segment_list(image);
> cdf4b3fa03bab1 Xunlei Pang        2016-01-20   54  	if (ret)
> cdf4b3fa03bab1 Xunlei Pang        2016-01-20   55  		goto out_free_image;
> cdf4b3fa03bab1 Xunlei Pang        2016-01-20   56
> dc009d92435f99 Eric W. Biederman  2005-06-25   57  	/*
> dc009d92435f99 Eric W. Biederman  2005-06-25   58  	 * Find a location for the control code buffer, and add it
> dc009d92435f99 Eric W. Biederman  2005-06-25   59  	 * the vector of segments so that it's pages will also be
> dc009d92435f99 Eric W. Biederman  2005-06-25   60  	 * counted as destination pages.
> dc009d92435f99 Eric W. Biederman  2005-06-25   61  	 */
> 255aedd90e3e80 Vivek Goyal        2014-08-08   62  	ret = -ENOMEM;
> dc009d92435f99 Eric W. Biederman  2005-06-25  @63  	image->control_code_page = kimage_alloc_control_pages(image,
> 163f6876f5c3ff Huang Ying         2008-08-15  @64  					   get_order(KEXEC_CONTROL_PAGE_SIZE));
> dc009d92435f99 Eric W. Biederman  2005-06-25   65  	if (!image->control_code_page) {
> e1bebcf41ed0aa Fabian Frederick   2014-06-06   66  		pr_err("Could not allocate control_code_buffer\n");
> 2965faa5e03d1e Dave Young         2015-09-09   67  		goto out_free_image;
> dc009d92435f99 Eric W. Biederman  2005-06-25   68  	}
> dd5f726076cc76 Vivek Goyal        2014-08-08   69
> 2965faa5e03d1e Dave Young         2015-09-09   70  	if (!kexec_on_panic) {
> 2965faa5e03d1e Dave Young         2015-09-09   71  		image->swap_page = kimage_alloc_control_pages(image, 0);
> 2965faa5e03d1e Dave Young         2015-09-09   72  		if (!image->swap_page) {
> 2965faa5e03d1e Dave Young         2015-09-09   73  			pr_err("Could not allocate swap buffer\n");
> 2965faa5e03d1e Dave Young         2015-09-09   74  			goto out_free_control_pages;
> dc009d92435f99 Eric W. Biederman  2005-06-25   75  		}
> dc009d92435f99 Eric W. Biederman  2005-06-25   76  	}
> 72414d3f1d22fc Maneesh Soni       2005-06-25   77
> 2965faa5e03d1e Dave Young         2015-09-09   78  	*rimage = image;
> 2965faa5e03d1e Dave Young         2015-09-09   79  	return 0;
> 2965faa5e03d1e Dave Young         2015-09-09   80  out_free_control_pages:
> 2965faa5e03d1e Dave Young         2015-09-09  @81  	kimage_free_page_list(&image->control_pages);
> 2965faa5e03d1e Dave Young         2015-09-09   82  out_free_image:
> 2965faa5e03d1e Dave Young         2015-09-09   83  	kfree(image);
> 2965faa5e03d1e Dave Young         2015-09-09   84  	return ret;
> dc009d92435f99 Eric W. Biederman  2005-06-25   85  }
> dc009d92435f99 Eric W. Biederman  2005-06-25   86
> 0eea08678ebe9f Minfei Huang       2016-05-23   87  static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
> 5d700a0fd71ded Arnd Bergmann      2021-09-08   88  		struct kexec_segment *segments, unsigned long flags)
> 0eea08678ebe9f Minfei Huang       2016-05-23   89  {
> 0eea08678ebe9f Minfei Huang       2016-05-23   90  	struct kimage **dest_image, *image;
> 0eea08678ebe9f Minfei Huang       2016-05-23   91  	unsigned long i;
> 0eea08678ebe9f Minfei Huang       2016-05-23   92  	int ret;
> 0eea08678ebe9f Minfei Huang       2016-05-23   93
> 4b692e86161935 Arnd Bergmann      2021-09-08   94  	/*
> 4b692e86161935 Arnd Bergmann      2021-09-08   95  	 * Because we write directly to the reserved memory region when loading
> 05c6257433b721 Valentin Schneider 2022-06-30   96  	 * crash kernels we need a serialization here to prevent multiple crash
> 05c6257433b721 Valentin Schneider 2022-06-30   97  	 * kernels from attempting to load simultaneously.
> 4b692e86161935 Arnd Bergmann      2021-09-08   98  	 */
> 05c6257433b721 Valentin Schneider 2022-06-30   99  	if (!kexec_trylock())
> 4b692e86161935 Arnd Bergmann      2021-09-08  100  		return -EBUSY;
> 4b692e86161935 Arnd Bergmann      2021-09-08  101
> 0eea08678ebe9f Minfei Huang       2016-05-23  102  	if (flags & KEXEC_ON_CRASH) {
> 0eea08678ebe9f Minfei Huang       2016-05-23 @103  		dest_image = &kexec_crash_image;
> 0eea08678ebe9f Minfei Huang       2016-05-23  104  		if (kexec_crash_image)
> 0eea08678ebe9f Minfei Huang       2016-05-23  105  			arch_kexec_unprotect_crashkres();
> 0eea08678ebe9f Minfei Huang       2016-05-23  106  	} else {
> 0eea08678ebe9f Minfei Huang       2016-05-23  107  		dest_image = &kexec_image;
> 0eea08678ebe9f Minfei Huang       2016-05-23  108  	}
> 0eea08678ebe9f Minfei Huang       2016-05-23  109
> 0eea08678ebe9f Minfei Huang       2016-05-23  110  	if (nr_segments == 0) {
> 0eea08678ebe9f Minfei Huang       2016-05-23  111  		/* Uninstall image */
> 0eea08678ebe9f Minfei Huang       2016-05-23  112  		kimage_free(xchg(dest_image, NULL));
> 4b692e86161935 Arnd Bergmann      2021-09-08  113  		ret = 0;
> 4b692e86161935 Arnd Bergmann      2021-09-08  114  		goto out_unlock;
> 0eea08678ebe9f Minfei Huang       2016-05-23  115  	}
> 0eea08678ebe9f Minfei Huang       2016-05-23  116  	if (flags & KEXEC_ON_CRASH) {
> 0eea08678ebe9f Minfei Huang       2016-05-23  117  		/*
> 0eea08678ebe9f Minfei Huang       2016-05-23  118  		 * Loading another kernel to switch to if this one
> 0eea08678ebe9f Minfei Huang       2016-05-23  119  		 * crashes.  Free any current crash dump kernel before
> 0eea08678ebe9f Minfei Huang       2016-05-23  120  		 * we corrupt it.
> 0eea08678ebe9f Minfei Huang       2016-05-23  121  		 */
> 0eea08678ebe9f Minfei Huang       2016-05-23  122  		kimage_free(xchg(&kexec_crash_image, NULL));
> 0eea08678ebe9f Minfei Huang       2016-05-23  123  	}
> 0eea08678ebe9f Minfei Huang       2016-05-23  124
> 0eea08678ebe9f Minfei Huang       2016-05-23  125  	ret = kimage_alloc_init(&image, entry, nr_segments, segments, flags);
> 0eea08678ebe9f Minfei Huang       2016-05-23  126  	if (ret)
> 4b692e86161935 Arnd Bergmann      2021-09-08  127  		goto out_unlock;
> 0eea08678ebe9f Minfei Huang       2016-05-23  128
> 0eea08678ebe9f Minfei Huang       2016-05-23  129  	if (flags & KEXEC_PRESERVE_CONTEXT)
> 0eea08678ebe9f Minfei Huang       2016-05-23  130  		image->preserve_context = 1;
> 0eea08678ebe9f Minfei Huang       2016-05-23  131
> 0eea08678ebe9f Minfei Huang       2016-05-23  132  	ret = machine_kexec_prepare(image);
> 0eea08678ebe9f Minfei Huang       2016-05-23  133  	if (ret)
> 0eea08678ebe9f Minfei Huang       2016-05-23  134  		goto out;
> 0eea08678ebe9f Minfei Huang       2016-05-23  135
> 1229384f5b856d Xunlei Pang        2017-07-12  136  	/*
> 1229384f5b856d Xunlei Pang        2017-07-12  137  	 * Some architecture(like S390) may touch the crash memory before
> 1229384f5b856d Xunlei Pang        2017-07-12  138  	 * machine_kexec_prepare(), we must copy vmcoreinfo data after it.
> 1229384f5b856d Xunlei Pang        2017-07-12  139  	 */
> 1229384f5b856d Xunlei Pang        2017-07-12  140  	ret = kimage_crash_copy_vmcoreinfo(image);
> 1229384f5b856d Xunlei Pang        2017-07-12  141  	if (ret)
> 1229384f5b856d Xunlei Pang        2017-07-12  142  		goto out;
> 1229384f5b856d Xunlei Pang        2017-07-12  143
> 0eea08678ebe9f Minfei Huang       2016-05-23  144  	for (i = 0; i < nr_segments; i++) {
> 0eea08678ebe9f Minfei Huang       2016-05-23  145  		ret = kimage_load_segment(image, &image->segment[i]);
> 0eea08678ebe9f Minfei Huang       2016-05-23  146  		if (ret)
> 0eea08678ebe9f Minfei Huang       2016-05-23  147  			goto out;
> 0eea08678ebe9f Minfei Huang       2016-05-23  148  	}
> 0eea08678ebe9f Minfei Huang       2016-05-23  149
> 0eea08678ebe9f Minfei Huang       2016-05-23  150  	kimage_terminate(image);
> 0eea08678ebe9f Minfei Huang       2016-05-23  151
> de68e4daea9084 Pavel Tatashin     2019-12-04  152  	ret = machine_kexec_post_load(image);
> de68e4daea9084 Pavel Tatashin     2019-12-04  153  	if (ret)
> de68e4daea9084 Pavel Tatashin     2019-12-04  154  		goto out;
> de68e4daea9084 Pavel Tatashin     2019-12-04  155
> 0eea08678ebe9f Minfei Huang       2016-05-23  156  	/* Install the new kernel and uninstall the old */
> 0eea08678ebe9f Minfei Huang       2016-05-23  157  	image = xchg(dest_image, image);
> 0eea08678ebe9f Minfei Huang       2016-05-23  158
> 0eea08678ebe9f Minfei Huang       2016-05-23  159  out:
> 0eea08678ebe9f Minfei Huang       2016-05-23  160  	if ((flags & KEXEC_ON_CRASH) && kexec_crash_image)
> 0eea08678ebe9f Minfei Huang       2016-05-23  161  		arch_kexec_protect_crashkres();
> 0eea08678ebe9f Minfei Huang       2016-05-23  162
> 0eea08678ebe9f Minfei Huang       2016-05-23  163  	kimage_free(image);
> 4b692e86161935 Arnd Bergmann      2021-09-08  164  out_unlock:
> 05c6257433b721 Valentin Schneider 2022-06-30  165  	kexec_unlock();
> 0eea08678ebe9f Minfei Huang       2016-05-23  166  	return ret;
> 0eea08678ebe9f Minfei Huang       2016-05-23  167  }
> 0eea08678ebe9f Minfei Huang       2016-05-23  168
> 
> :::::: The code at line 33 was first introduced by commit
> :::::: 43546d8669d62d75fa69ca9a45d2f586665f56bd kexec: allow architectures to override boot mapping
> 
> :::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> 
