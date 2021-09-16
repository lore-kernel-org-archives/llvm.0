Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5133FC3
	for <llvm@lists.linux.dev>; Thu, 16 Sep 2021 15:07:45 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GEk2b5009091;
	Thu, 16 Sep 2021 15:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=koCUOMuf6cmvR5Oi/fg6uh6p/JWhnZ7V9ZjewVZ4S7c=;
 b=0AwgQzfNxnqKRMwkJyP9fFv1ZFpFo9FEMTnuNXYl5IFNW1vQLxfP2aWs1Y8Jx3EFuG2K
 AXmqPfEeGhKI3t/FOYDNHrszBhGero/BMwLC7D+iVXREJs9YCLvsxA+9G53WOgZudNxV
 U6d1IRJptHpCf4Sh3JCJk7Km31W4GbgV1nBQ5D29PFvKmfERCr5ewktvTkfK1c069K99
 w6P6ubnUYrOgO3XsDXvlSZhgGvzxBlGbKRy2vbuWJ8QsG+BPIcs8UxaM/vvy2BTR0A8i
 0agj1RlIQerHbKNd/aIFI31MyNHeFvRr5YjO7r+ZIxCE+itX5hvmbL0uduTB//13EIM5 sA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=koCUOMuf6cmvR5Oi/fg6uh6p/JWhnZ7V9ZjewVZ4S7c=;
 b=NtMn7oRrezcUMFFEpcV3yG4r9+2+5uNqStaCDlp8x8F1gKyQHgyqypiznTEXBHBCotkV
 uMETxHWMzfRQPKoUI0lLyQlqOgZUyXBBhMP+fcNXwvupecXOVYf+rDIf8RVomtZzp8n7
 mkRSS7Ry32EpYJiPOiQEZkQMY3f2sDbomNt9shUhN2DqAvJGdl04pZHlR0aHo1pZQ/8C
 pvqnLxNPsMnoAwX7JYyj03qi6oeet/prwFNddbbwvpr1NcfEj/FbWD2/wZZSYAslaIDr
 BJfDGCfPbdDmqvvY2Sr/bKZcXTWsUzv0b16b1SiGQNsddUgq9If20xTY6zvORnTpHstD vQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3b3s74jqrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Sep 2021 15:07:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18GEtIiO000823;
	Thu, 16 Sep 2021 15:07:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by userp3030.oracle.com with ESMTP id 3b0hjycncc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Sep 2021 15:07:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5Jmn+RgMHczOIL7D750RA6I/I+noswZbASztwXEfnoEzCA7adU2X5GN2JO13Go1ePJlKQEdHLuwwq5FUwnnY2qCVty1fFKRKxCdPHNALO9ubJ7vDRPgNNarZ++SfJX4k741idpIb/RT2PNk03tZu/JgGKDdot8Av/oq1jZUUsoBz+LqJW337cxAx+kaNW9Ch4iRmj5PFZ+/Mjgasxg7YNs4WhGSAgDIByI/yD4hUmJVmOMIHmxzvtdKVvzBS3NrJyZpW6q3cxXuTxeWSV6ksttjcZdUBpBGfddieIcN09xEXy/qiQThXvSi1BgenkbZoKwj9SgeO9GJsUqlVhxLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=koCUOMuf6cmvR5Oi/fg6uh6p/JWhnZ7V9ZjewVZ4S7c=;
 b=V+rnucyriG9JmpdFhyj2iL659GgkBKgmyMoVOpJ2ymlwJ8L18p/4+w1eVPoZVYkKth07ah9ZLIxYGxe/KUbkBKJ+zDMG0XbFGn0O7FBss1iZRodnaDxYc4sXR6Dgz6JtgWpFdEcvAgQWqTP7k36qBvxeCb4Ahh2dgHkJKjBVeePwPYRuybg7lXGl0boWDOSckM7g601cINxWclrvVqyQ//zbk9GhPPK/vXrPVWmxi19/7CKedc9C1P1MPrB+who3L3cLZsrDKMZI63/0UYqq9dL/Dm+7vgWVyECdVnhS/zD09nbcz0K9IO8neTADll95ZY0awbhvx5jC9X7t7eXaNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koCUOMuf6cmvR5Oi/fg6uh6p/JWhnZ7V9ZjewVZ4S7c=;
 b=hZgGT6q18R2OfT4m3sv5iy08dKm0dCQqMeZhkg6HGYbc6feMZGK+wkHElB3jGFp/RRZ4H2rABPxG7ZbqeBLTG+tuVK9EztMJDKAah6gDBJvMcouastWtfBzQOCiPCa2ALkQb5kVsPumiFm7MKM5kPxMBjQxZUz1tIizvxAsS0VQ=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (20.182.130.24) by
 CO1PR10MB4500.namprd10.prod.outlook.com (20.182.138.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Thu, 16 Sep 2021 15:07:25 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::f091:1dd2:38a8:e986%6]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 15:07:25 +0000
Subject: Re: [PATCH RESEND v2 3/3] lib, stackdepot: Add helper to print stack
 entries into buffer.
To: kernel test robot <lkp@intel.com>, vbabka@suse.cz, geert@linux-m68k.org,
        akpm@linux-foundation.org, ryabinin.a.a@gmail.com, glider@google.com,
        andreyknvl@gmail.com, dvyukov@google.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
References: <20210915175321.3472770-4-imran.f.khan@oracle.com>
 <202109162023.62zhNLls-lkp@intel.com>
From: imran.f.khan@oracle.com
Message-ID: <c86765b6-8971-6438-e802-dd85772608fb@oracle.com>
Date: Fri, 17 Sep 2021 01:07:16 +1000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <202109162023.62zhNLls-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SYAPR01CA0032.ausprd01.prod.outlook.com (2603:10c6:1:1::20)
 To CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from [192.168.0.2] (110.33.47.182) by SYAPR01CA0032.ausprd01.prod.outlook.com (2603:10c6:1:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 15:07:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 437bd3e2-c7f8-42c2-1f93-08d97923b16d
X-MS-TrafficTypeDiagnostic: CO1PR10MB4500:
X-Microsoft-Antispam-PRVS: 
	<CO1PR10MB4500806567507D2283997CB6B0DC9@CO1PR10MB4500.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+QkbhvDK8/ttqfJpRBxIdZ0veEgkBRJYxNPCmoVeOMODkBJyHZB1TUEoc0qGxM/17fZfBZwfYPfotOFggZZ5am22VMqeOTqEqxZ1Xwp94WZ8WfrxgOU7TTcUjtf+yBUeEyqa/s0TRr7OR9BCkdwsCk5v3o7wXleOfhdiG7kpg99SAUAOoh4siBxRrt3zVEKu3WCPppdgJmRpGME0GwjDMi4ThCsAb9m9cl1fPA7j4bDUlM68RCKt4Ap/sjark7mmh4PjtFEgDNaT3ReVT9tqqSrS4GKlBVC0Qs1VkMbr4dNzNt+I6ieQp+AtuyFgJqclJ2oeIqUq316TmJaio7yrvemnPzLmWvjTA17igytDIG/Ynr80o/kh18BCFRm/IGIYfjAuRxaxb7nRDTOuofY2OU3RamhzU8wohvG35Ye0EOSfACEBAp/q/QeW2NKNFEV5i+J6CMl3YoI5siWtDO2kG+kUbbKFkpPVxOpj7UQDjywU3YeGDiVu6XCig8b+OW9039Pq6jnXuDLFAdYv2DUxelFNuOg9Xod6gHtuguvJUrc31KjXxTHLziUKW3FlGquNn3qvFCrL84qRnASrt99md62cQXtIsImMAWGuZIqHfIz+Sm4RXhS6SX6V6TpIyD0q7UYGpRSPqtjDv0H4kKkYNMNXJaz8KKCwwegtjjg1Sw7GYg0QMR3DID8VJdfXGvRyeMBgBXtoH9+yyTbCzt4B5TdgxfsbEFxDUJQYIPE0UtdZzExGEWTc90JAtO3KjVlhkdNXKolxYbaF5L/eXVhENk2rlTobkXqjixHKuhQLVGTNyV9x2Vp3S3ocYyQJUDzwFc0oLBZR0NbEXg3jOodAfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4468.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(346002)(376002)(39860400002)(478600001)(966005)(83380400001)(8936002)(2906002)(4326008)(8676002)(6486002)(38100700002)(9686003)(7416002)(316002)(16576012)(2616005)(26005)(956004)(53546011)(921005)(36756003)(66556008)(5660300002)(86362001)(31696002)(66946007)(66476007)(31686004)(6666004)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?Windows-1252?Q?T/oo9sgtjroB24PmOzp3FTMHiUnjVqbzOWTY2TxGGDuHzMVxF6U2aXkz?=
 =?Windows-1252?Q?LBoH/H84LJO1ZKgG2blfIYo9dJ1kN7yJkP7kUa8OP+WIlsbZhBwPuDt7?=
 =?Windows-1252?Q?pNgcrrIlS77Ws1UlqUqsM2szvh3S6GeWEWmwUrO7f7gXdkUX7LTkQbkv?=
 =?Windows-1252?Q?YMzB6SK/RhXQBw+uP0wDBCygHnnj42efZ9z0s/HA5ZtEs4JhJIoau8xn?=
 =?Windows-1252?Q?fasePaP6jYLQJQN6g1VbePoe0a0j0062crzhQFcHLcVvSpKo1KR0btpm?=
 =?Windows-1252?Q?b6S5edrew44UnI8kixbfL7R3NWI+7ddCQdMt/wSIsu8eSggzgqhoipSE?=
 =?Windows-1252?Q?rZdE1eQoXz3Kl/RUuv7bhH4OUrMu3hUzp69Oe1jtrIGdzIDOFlJPZbAe?=
 =?Windows-1252?Q?Di3PVlVnoAia+HLH4Y6EJUk5u/HoyurtIiHVyEsTw+yRFb0wOJiD/el6?=
 =?Windows-1252?Q?lZhzPtH6iVoLFBxhQgy7yIp0rcQLObMRoKvbXNTQxFlUbRnoa8wPEuIS?=
 =?Windows-1252?Q?r93IHxHJrzjj8Y9a8NCK8P7CbhO+0BWghXOY6vmMRiSaZbsjGs/2zBfC?=
 =?Windows-1252?Q?aSOyrbIkVZdO8Bf3/eDrH7rAfoE/vA2m90cqX4Lv8Q8a7Wdc5roNcsMc?=
 =?Windows-1252?Q?fg46D4Bzl+OZEMYYA2HCy5XMR8R6RYdTvu1R5ybREgwYyUWycG5l+ple?=
 =?Windows-1252?Q?WQs87SW+XJ1awfyaVWBkLwDE8mQoUQS6VgemBx32kj33737bY/g8KPhf?=
 =?Windows-1252?Q?P53xZLZTRGKACy41tSTzP9+4eidrk7gP5v9C52wZqL6KRdiTE1jEkgy3?=
 =?Windows-1252?Q?MpQ+0w8UVVQHWa78uLokmwpBiBXEmLtGVl5TmoquvoavvUVeVB9UmzZJ?=
 =?Windows-1252?Q?yQx2qO9rFF5ARxBa2CYSe66npbssrs46+Jv3ZACEcL/ncVKTGosJD2sS?=
 =?Windows-1252?Q?bWMiGhMLjfiELy3trb4m7BLI3PRWe3obJn4R07Gbu758Fop2zVX22SOj?=
 =?Windows-1252?Q?oYtGt1HBR649s7UE/OeZHZ8BLJ+7PcQ9YdZr7cwmeSsNXx8aj47wVfVS?=
 =?Windows-1252?Q?07q0NBunrFJJ71q0hvlmRXQAtSrVZYwXF8bPyiCbG/r3kBPkD83izpnW?=
 =?Windows-1252?Q?wSD+If10hMYijbcQtfhikHhYUlS9EO5NpHW3b4NycmiE+n1qrGMP2yUS?=
 =?Windows-1252?Q?h167ZzFYPDKmmeD7mUhQsEY9whq5AGcMREaim0CWcxyaP3suMrUXj43Y?=
 =?Windows-1252?Q?PDwqKunF8WGQQkgGJ2EOZD3fbm+8+7DwRua4R6yh4V+JvrA4S6GbxHAK?=
 =?Windows-1252?Q?3dcy0796qmskqZ7VjUodJ5f+bHc0skZaljtzBCkThBI5520DX38VjUU9?=
 =?Windows-1252?Q?R/doDDCdVcXfJUWmkKjfE117dusYWy8wRqawr4/wFWOz7UfxzY7Dy4GI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437bd3e2-c7f8-42c2-1f93-08d97923b16d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 15:07:25.8504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lK0pJeuNtIlSNeODOS+PZ22CzaJhqfs77GyGAAkeSTmokfkIOSHVPZRnC5PcjxpdN7gLjmaTdnNhHGrVqPXNzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4500
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10109 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160094
X-Proofpoint-ORIG-GUID: VDP-CK3cGw6b_thU7OY540qDyVHu8uPz
X-Proofpoint-GUID: VDP-CK3cGw6b_thU7OY540qDyVHu8uPz

Hi,

On 16/9/21 10:56 pm, kernel test robot wrote:
> Hi Imran,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on drm-intel/for-linux-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://urldefense.com/v3/__https://git-scm.com/docs/git-format-patch__;!!ACWV5N9M2RV99hQ!ZgH7pHrcDP0Zs9Uq1xBK5egXd0EEHO-U04nQ0t2s5Hu1XT_h4Pj3h55Q6CS4G75yKA$ ]
> 
> url:    https://urldefense.com/v3/__https://github.com/0day-ci/linux/commits/Imran-Khan/lib-stackdepot-check-stackdepot-handle-before-accessing-slabs/20210916-015617__;!!ACWV5N9M2RV99hQ!ZgH7pHrcDP0Zs9Uq1xBK5egXd0EEHO-U04nQ0t2s5Hu1XT_h4Pj3h55Q6CTQWVl4Fg$
> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> config: hexagon-buildonly-randconfig-r006-20210916 (attached as .config)
> compiler: clang version 14.0.0 (https://urldefense.com/v3/__https://github.com/llvm/llvm-project__;!!ACWV5N9M2RV99hQ!ZgH7pHrcDP0Zs9Uq1xBK5egXd0EEHO-U04nQ0t2s5Hu1XT_h4Pj3h55Q6CRjvtK2Pg$  c8b3d7d6d6de37af68b2f379d0e37304f78e115f)
> reproduce (this is a W=1 build):
>          wget https://urldefense.com/v3/__https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross__;!!ACWV5N9M2RV99hQ!ZgH7pHrcDP0Zs9Uq1xBK5egXd0EEHO-U04nQ0t2s5Hu1XT_h4Pj3h55Q6CSQGX0obw$  -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://urldefense.com/v3/__https://github.com/0day-ci/linux/commit/c457fdf0bd4d68953ccf968b9570d149ec178602__;!!ACWV5N9M2RV99hQ!ZgH7pHrcDP0Zs9Uq1xBK5egXd0EEHO-U04nQ0t2s5Hu1XT_h4Pj3h55Q6CQitEM8yg$
>          git remote add linux-review https://urldefense.com/v3/__https://github.com/0day-ci/linux__;!!ACWV5N9M2RV99hQ!ZgH7pHrcDP0Zs9Uq1xBK5egXd0EEHO-U04nQ0t2s5Hu1XT_h4Pj3h55Q6CRApg1BIA$
>          git fetch --no-tags linux-review Imran-Khan/lib-stackdepot-check-stackdepot-handle-before-accessing-slabs/20210916-015617
>          git checkout c457fdf0bd4d68953ccf968b9570d149ec178602
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> ERROR: modpost: "__raw_writesl" [drivers/i3c/master/dw-i3c-master.ko] undefined!
> ERROR: modpost: "__raw_readsl" [drivers/i3c/master/dw-i3c-master.ko] undefined!
>>> ERROR: modpost: "stack_depot_snprint" [drivers/gpu/drm/drm_kms_helper.ko] undefined!
> 
I got this error reported earlier [1] by another CI build system. I have 
fixed this now and have sent a v3 [2] of the patchset. v3 contains fix 
for this build error.

[1] https://patchwork.freedesktop.org/series/94696/#rev2
[2] 
https://lore.kernel.org/lkml/20210916133535.3592491-1-imran.f.khan@oracle.com/

Thanks
  -- Imran
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://urldefense.com/v3/__https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org__;!!ACWV5N9M2RV99hQ!ZgH7pHrcDP0Zs9Uq1xBK5egXd0EEHO-U04nQ0t2s5Hu1XT_h4Pj3h55Q6CSBYjBtkg$
> 
