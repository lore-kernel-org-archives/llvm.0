Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB183C27;
	Sun, 29 Jan 2023 23:53:34 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30TLoJB4007608;
	Sun, 29 Jan 2023 23:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=OzhLWbWDpk4a4nd6Ya8uBVlf0gQU3qKjOrOoN2g3/PQ=;
 b=3dKAloajmNS5h6W9/yiN8H3RUCwjybZ74EkAE1VJSwTT83DRIRMcD4p9PkrUvLvyO59Q
 /jOpmZWUP1hu93rn3oonMK3d6BGI8hJ/9UnDdz2IUo44+KoteClKFtBul3IO0ezncGmX
 OBBqfVf2+Ox8Bvef/Gtxx/kKsnDS6WmiBF8zhhrAi33qRM695Md8lgPuq/dqNP97q9F/
 YXZ5sw7fjZF9eyTdcdQwKkJS7nDy20oGqErXSVFZVYOPMVNUzimsFlbFkoR2xY99dvtY
 iuvw5JJ+UtOUNekWKaqFrRQvOm/+HA5c4eEfCdd1/zW71Z7OEyNe71U2ESHLmuaQH61A Lw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ncvp11scx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Jan 2023 23:53:21 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30TJKAwO008014;
	Sun, 29 Jan 2023 23:53:20 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3nct5a5uvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 29 Jan 2023 23:53:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRgiT/cWHNq9lOXcTFKgIAa4AktXJON8iMethxNRgeeXzek/XzGSMMnQx6hYn95Usdz5RnDJM3pBDex4RyEsuUlE7ra7UrDF6OVY73MbKknixICn4ZctGmuDXz2Ed8OowMfpAliJKAF3N9wA00lVXaoGRVmaqNcRkyr2eGqWYbSojCxg6Rv6LspAfLH8h9ccvxHmdU1QUQmzN8/mfNNSLNS+9rn111xX6/SvkEVNEke0qzDA6Umgr0qmTzu+arq++RHU0FBoSdaQCSUTxi1jwwFdNayyKRjycTy7DdyBg8PGA3azZKMsx76yjKm53WdUEOeZKAltvMQGS3f95gw7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzhLWbWDpk4a4nd6Ya8uBVlf0gQU3qKjOrOoN2g3/PQ=;
 b=D56LKjK6ABw/CwGFJB2EVFcc6B0VGFoC25s+ERXM1+RTQmo4+dfObt0ROY2wy+b200yLqu6Pmr3UcOAU8g6zNTt+nPve25plAsBvzIJBelWb1eqS5UIJh1jTYpDvXQ8QJfnz0zFKh/dTgwRb5ydpHkLSolgTrlELbgF3ZIHdz/lXz88p4Ihh6bQpJAeUglFqqOUf3zMkK5MkxRxm/bfLnKWSVNBsN4M9KrZbvBuAsszstquFRIrU7SbndPu+etF2colCIGzFGqCRwilnNQDRsCtl16tpIzJCr9g/rzK64foIYbWA9uqpognoOsOZTQ68Zh5epwehPaoO1iji6Z+/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzhLWbWDpk4a4nd6Ya8uBVlf0gQU3qKjOrOoN2g3/PQ=;
 b=sdyG22WKiP23zL1roYejeOJWLMd53+HHONPM0BLX4MAk7Fdvu4V6wdMHd1nLIcIPIBjvNSsO7XR1J0se29j8h10NLMq3NYIzI+tCmkqvA1sMctnCPh3BM1N4a/AWotdmyItQO+9UeLVhW6AMIUTe3Z9hBpLJFFpfGCeo7PkPuvk=
Received: from BY5PR10MB4196.namprd10.prod.outlook.com (2603:10b6:a03:20d::23)
 by SA1PR10MB5734.namprd10.prod.outlook.com (2603:10b6:806:23f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.20; Sun, 29 Jan
 2023 23:53:17 +0000
Received: from BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::3a1:b634:7903:9d14]) by BY5PR10MB4196.namprd10.prod.outlook.com
 ([fe80::3a1:b634:7903:9d14%9]) with mapi id 15.20.6064.019; Sun, 29 Jan 2023
 23:53:17 +0000
Date: Sun, 29 Jan 2023 15:53:14 -0800
From: Mike Kravetz <mike.kravetz@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 167/506] include/linux/hugetlb.h:1193:9:
 error: implicit declaration of function 'page_count' is invalid in C99
Message-ID: <Y9cG6jS279CcBHsF@monkey>
References: <202301282035.M6wJfQhs-lkp@intel.com>
 <20230129131123.416530fe0b73a45d44ab944f@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129131123.416530fe0b73a45d44ab944f@linux-foundation.org>
X-ClientProxiedBy: MW4PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:303:87::18) To BY5PR10MB4196.namprd10.prod.outlook.com
 (2603:10b6:a03:20d::23)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB4196:EE_|SA1PR10MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: 8139af8d-fd03-4764-b845-08db0253fe1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f3jG5DQa3yevhBsC89/U9ptasn30Qo/N64yPUIoQYHu035cC2qlijQYfSlzZBqtAdvnySSwCzma/rG9izFmQtZfLC3h3vIDqqJ9jtouDqZOlbCu0MkKo/uj+dDX6T/B07/feIyLB10Q054Z5DVmDMM+PUlIxadOYo2VyboqHgtJJedm0Yyds2KqJTeJlFF0q7PG0tevE2ClD1PFf5gqEyw4CK2SiJTUJHYSWJ+eu/brCeZwNLJ9xN8oCFbA4KXMxkLGabdHF1lCKBTTF5UtwLYma7gi+R4LnrZlk/PVD7T1hBPX/VAhYOubEAxfiwJMV2UMoWVs8ZJLU6qNeHXVdRMbPWcsh6h3xsm8HbbABbpvronhJxC3OR82AHTBfmYUzgtQwxn3YoxagKj/FewVSFC6UKP/6fQOeN5KXxgyfFVp7u+tlI/9wQRJmJV9/vTMyDwFBZJUNYvTAVgJ+6tG3Dya//8PRLLL8/ARHcklYlXMh6Aw7rUgJ8CaFC67i8O1O0+kSGI+wNVHMrCTgGbPn38ILy5XqgCvX3M9+EoNApnkgDOb2OzTHKGfo+zdNcusbDIYojDZJWaVjFtkIYmeVAdN7eIPCL24viSt6Uv82VZkCh98R4UzSajIjf+lNoCmOjQun4httbg5P7rSEyswKaaUbkSq6xai1WOULdp8hS1bdz/urc26V1YC3BO4QsEaA6tu/bPU+vK/IQ6PmnC2OCg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB4196.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199018)(44832011)(83380400001)(86362001)(38100700002)(33716001)(2906002)(53546011)(6506007)(26005)(186003)(6512007)(9686003)(478600001)(966005)(6486002)(6666004)(8676002)(6916009)(8936002)(66476007)(41300700001)(4326008)(66556008)(54906003)(5660300002)(66946007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BoS6zEkqQa3deDKI1HO1YAIQTL0hCBDYYGROh/vCfOlIwdbT5XDNvVL4IYkU?=
 =?us-ascii?Q?6XL2YANDBzhKDOOUrgj3qlXFEfoEGo7vT37DBeIAzfmiOYmHCdL/uYBBYjBQ?=
 =?us-ascii?Q?ddgogTvcYGP/XlxYI03tCDMq+kRlMgJnkuQoOYvObJwnISy/HiqjUbznlW/E?=
 =?us-ascii?Q?9erohWGByJ8sUN2+zQB3lhT9JkMDOdA1dhVlrojhipPiwjau30t+WDjZSKpY?=
 =?us-ascii?Q?2fKhSqyt+p4bd61FGsX93YNdu+2fnwD6hfNCSfo8+Yn1SqKinFvQ/QtpESAR?=
 =?us-ascii?Q?AuhEuX0G96SujILvSAf6axYs9BVsQMfbcug7/A2f3GHJoY+uTbHpXgTOix0r?=
 =?us-ascii?Q?IXhQv1IHD7GJaQuepBwCRVQZAuNoyUpjOJxpQcrqHA/gD2w4raHQK518uNK+?=
 =?us-ascii?Q?jgZzGjOdQ683V0Akq1/jn2k0ZbSJtO6rrRHj4Ns3lLXX7CSI6mlzJWNzoJdc?=
 =?us-ascii?Q?Zfcjjd8zB2CEGhgZBvRoWSrhCVi9sPC27wBBcCiketQNwfpiawkU1Zf5qj/R?=
 =?us-ascii?Q?w5xOTIORZfXLq1VC9SGDESxDY10bfZMZ1ze2gAg97DTebjDg5YDoqm+IFVf8?=
 =?us-ascii?Q?dSMFBjr4dqgiQB2SA4bT39wnu7+U6pPkfFbR1NXs2FKSR+0G5pApa+fV7qrr?=
 =?us-ascii?Q?jz2kZkN45Z8pzdPjPMbiGr65/SBzF9oQOVUKi0Hmi9xnK8IQbjD0EXcKOUbL?=
 =?us-ascii?Q?y6TTqQWnT69tXcvcVf9TH9QNqlnCM9qfnAvVwvubUap3Y1sBVohJg9rPud4D?=
 =?us-ascii?Q?5Mw0s1mcOkXPrIeNqJxU3/hg/3BtAvHGJLdUEA2MfsGeQvLoSYL1ZBv0OiA1?=
 =?us-ascii?Q?Pw/SVWYu8t+7fAAEEqnicc14Yr5ZRmQMOXvgWnxfqz+zWfeJEoDaL5pBnGw3?=
 =?us-ascii?Q?+VHmUIKUYO929swrpK0CiWwGrXIBOJ4VXPKIraXR5PXfMxwUiheixK1JYVCm?=
 =?us-ascii?Q?4u2WNi3YqJL4lwUwnIEF8UVYncjhOi6ieyJHRFxvAXgVH1cXMPA3yncBGE98?=
 =?us-ascii?Q?uNBe0a/Q1aLX4pajSCTQhWbAzv6MfiVmf+hTZ3TPx46568DVjT7OL0Ynchum?=
 =?us-ascii?Q?aTaTWpgLa3QcNNaYbZbIEqgvboxx82vyi9EgV2qyOxOet+vHm0CM+Ws7cLVW?=
 =?us-ascii?Q?WTrsEUgt8VJVFjp7KFQnPmc7OvTiPfPvve9m7YuTIw10p3drr3puoYGUZghI?=
 =?us-ascii?Q?CVO/CLT4OeW0zrHZJrM0pIUoLlFfmqPm9L/vMMhBaDBtlLQC5IDYbqCDhxei?=
 =?us-ascii?Q?2/pD2yv82nQsyzRGLj1wFIeCnEMSRMFktqqC8xPgNr4Y2N44IlggI/guoJq/?=
 =?us-ascii?Q?qJwKiVq6IQ+t8B/uIGvWSo9LhozP2JQf7Jsg88DTwCSOkI7frJayFY16mbyK?=
 =?us-ascii?Q?Hx6X1bmzpSx1OEefptlLIfvnJusWEO11A3gux7HbLIqgCdIs8GFwTa/pP++8?=
 =?us-ascii?Q?NJFE7DgXbxIaaPPQqpnK5yFVLQiWylkuD4gyWpHJbJSd10ZRbRcLyr7XZBRO?=
 =?us-ascii?Q?e3l1nLjkNIzFgjcfeBOLNt0Kb1D8fQrhmvS060DY9tAemFdoPUp4KWfXLoYu?=
 =?us-ascii?Q?Km20II9GGZD0McDwJnkKszmGVVB8iie00n9guWLUIFhLZbK8SncO8V3LPVF/?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LFnO2PZ2hpQHJrqUn0cfETpW5F6WeGrcMl3NRrW76rB3Snet7zD+oP9LB23Ixww5qhE6vUhwjDpApujxANZALOGBcC+yOwc7KWZJEBf52tYcSsLZ5l+fOvNYgoIZJnmeNtKPoMb5vS0sMtyfahxyVPQQ4+93xpx3crJRZpn5lwj3H+/e8zr5zMcDYlIMKSFdenUXgjocaAL+yIqG78CbojCwzD9wHcO3UjID8+47/fOR/G2XtnWVclDAAhZaMgOv/l7WOD23Rp5Xv2oSwgRsxYrykNWkKKXhO63eiDS8XpX8mVoHKnNTS1nf7L1DwlvthXKXo1Uw++2VDTgcfimDAh25ACtrslHVsoZ6g3Vwg8t7BRmzaFjgE9Ij+ElJZZ6n7nHywW/PUUjOitjEFTW77owj/spf9OXaKoLBvzMIramVv1uO40oXr0Kl1rx4RKIvvJZTA+7VbK+FdgqOKj+fBz8jQn/YsKz7x1Ym8xzdl7kOHrNZZ0RspX+u/JKQAxTxOLMQ7YAPGKKoscZYkPVdsKOYT+vMPF0fj9gLSrotNqNyejn2Btwqm1E1R56HSVgRk8blMv1oWx7nyCMUvt3m8LEXYrS4NFnjFrBvfvDfNF7pABLNG+HHq5gdr9mRv8SG705jOuxjPci4KNY5BhdPsVMAK/tnsMTFzH/rTflxvzyATlJZm4+G15J6p/TN1mnlVmIC0Czu05qvKFMjOWdBaF8HzbngTzz6IJQUH8rUDHxbEKUoXtI1N/FvsFeArJNp76AlP9hIgJbtRGjWirg19Uc3SHChEkZPEmnmZFsRLVt3Ym5MiA/xZkZ6lNU+cllBuRCnGFoYXTiWHedHZ+Cel5fyCEs9UgcXqir+bm45MRiRJYfRPDDTmmnOYopne6re
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8139af8d-fd03-4764-b845-08db0253fe1c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB4196.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 23:53:17.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMqmdG1OrKly/VM5hOMbs7CMC77vhQWTmI6oM8aOFj6h8msbzxzYOY8deXQyKb6PtvVw1cHCqPJPQLf9f1jCSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5734
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-29_13,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301290237
X-Proofpoint-GUID: 2msJqrH-SdIDCdryjr-QPX2L2nRbILIC
X-Proofpoint-ORIG-GUID: 2msJqrH-SdIDCdryjr-QPX2L2nRbILIC

On 01/29/23 13:11, Andrew Morton wrote:
> On Sat, 28 Jan 2023 20:55:08 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   ede43f2956cc25e387a5e225324104f22e715908
> > commit: 6c096b0425160233d2a8c3ec3f3d82dae5c37678 [167/506] mm: hugetlb: proc: check for hugetlb shared PMD in /proc/PID/smaps
> > config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230128/202301282035.M6wJfQhs-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=6c096b0425160233d2a8c3ec3f3d82dae5c37678
> >         git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
> >         git fetch --no-tags akpm-mm mm-unstable
> >         git checkout 6c096b0425160233d2a8c3ec3f3d82dae5c37678
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/infiniband/core/ drivers/net/ethernet/mellanox/mlx5/core/ fs/cifs/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > Note: the akpm-mm/mm-unstable HEAD ede43f2956cc25e387a5e225324104f22e715908 builds fine.
> >       It only hurts bisectability.
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from drivers/infiniband/core/umem_odp.c:41:
> > >> include/linux/hugetlb.h:1193:9: error: implicit declaration of function 'page_count' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
> >            return page_count(virt_to_page(pte)) > 1;
> >                   ^
> 
> Thanks.
> 
> I hesitate to include mm.h into hugetlb.h, but page_ref.h looks OK.
> 

I was a bit confused because linux/hugetlb.h already includes linux/mm.h
which includes linux/page_ref.h.  Have not yet looked into this more closely.
-- 
Mike Kravetz

> --- a/include/linux/hugetlb.h~mm-hugetlb-proc-check-for-hugetlb-shared-pmd-in-proc-pid-smaps-fix-2
> +++ a/include/linux/hugetlb.h
> @@ -7,6 +7,7 @@
>  #include <linux/fs.h>
>  #include <linux/hugetlb_inline.h>
>  #include <linux/cgroup.h>
> +#include <linux/page_ref.h>
>  #include <linux/list.h>
>  #include <linux/kref.h>
>  #include <linux/pgtable.h>
> _
> 
