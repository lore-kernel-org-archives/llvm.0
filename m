Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491B07C
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 02:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654653725; x=1686189725;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=DCz3vPOnQJRI5MdSveMOfJ3iyRO8316Wl5sjXL+dx0g=;
  b=jyGreS4r2WQX/xrYy/IfrK1uJXQMSG/DJ/CQU6+nwPcZxHlVIA6B6V3X
   K20DUGwNZSmYywByLFnEVYwcT2SvEJAPxUKHEQyTg7ZSAJTRwCeuNSLsx
   v9uHYElcU4U/KH7bdzfkRzZ8IOwZSTBYUQ3RYctz7v0NyJBVpRikTcUE2
   ma26p8MQQV+PXpXBQOWog0gyDebI+4uqZzq2gfGT5Aq+wfcb6GWM+Ji6c
   2m5UZ/8Uwca8xHzMzEfCMl32itEFV518OYLWGdZJtxtXNoqGoi7O7Yy4X
   rGrquODxPQRhANhaBHUKwd/tAjDIq1d96qIQvxkTSSedYfLwwMzPJABFA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="275549664"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="275549664"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 19:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="907386826"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2022 19:02:04 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 19:02:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 19:02:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 19:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIow4lpXhYGRcCiQXwbhDTx/Hi2jaIxxsGZX+iVUbzQbR3RkR47eFtcz4P6V35pC8FmRwez4uqBz5oZpMheV+CS4plwtYbKg/VoE1MK7NDDPV5PndNI5LsbwFRz/4/AWV2aVHPIX3IvXToedp8KwNeL+b8R9bzDjvRAGE9mQWxT5M1XteJ+cFIIoVd4icf2PUEKJtD+m5UYyHZbyR4rrzNyijwadSfJmGvxdPIlmiqOfETW6tQNhVvV5gdvtFVpnbyZtlEiudgrzYlYbp/ChA+HwCgrXvkFyjDA5cP35zpt9640kQiXsJryL0JZ7kfWQLsjrPtrZVY3gu/nyRYze+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhfsyn/+Mqp+qCACz2WqpfwwzDnc0fdDwDteg+9cVmQ=;
 b=czM8GnCqzPqd1Ly97pvVLikt8tMXAFw5R/4yG1URInA/fPAxYXuWyqsuVEvloacKs0hlwqmAZuqgIKAIAZrVQ060WrV8vIjV74rCFCt2SyZ/gcFjTbqhO7wmbb8nC3p21m9wfg917Qo/5IifzPevHYGSZderX3byG9if5f12XKLjV06fFey8XcX4uCY13MbqW+MEi1wtme8JByv6XQ9qcle6jYGEWf+ssMqulm/nZvveZ3WxLq8MqDGfNqKP4GHSf9sABGhhdMKQo7OHmWPF38oEaSTHUYipv2/kqwKzFtk66jacHyH+CkWguRxi0Q6AKo5pTGNkYvtn4cAg6MqQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 by DM6PR11MB3995.namprd11.prod.outlook.com (2603:10b6:5:6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Wed, 8 Jun 2022 02:01:49 +0000
Received: from MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::1169:fc9:c1ef:248e]) by MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::1169:fc9:c1ef:248e%8]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 02:01:48 +0000
Message-ID: <f6069ff2-4560-94ac-9577-0895624ec5d3@intel.com>
Date: Wed, 8 Jun 2022 10:01:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 08/10] vmscan: Add check_move_unevictable_folios()
References: <202206071410.ZIdrc0xR-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202206071410.ZIdrc0xR-lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202206071410.ZIdrc0xR-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To MW4PR11MB5933.namprd11.prod.outlook.com
 (2603:10b6:303:16a::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ae7d1d8-b7bd-4b85-1aa1-08da48f2d908
X-MS-TrafficTypeDiagnostic: DM6PR11MB3995:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3995DC8E2CF8DEFF32DAB26DFBA49@DM6PR11MB3995.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XQXJT2OR35LH2iX1CRGqesRfLXOkycMkk5Tjxp4avofF4f1cnAJ306u5bnPITKZLQlx1sjb7vqLV0NdD0kSa9IuBALBqzHddNJOfH9g8/CYcqCJlqKv26ILZrV4gWAX8b7FKCS/l0e/sx14EXxGxozM7ERXiawbHJtWhjYGbvcBmMk9/w56L+dipnuNcCbZ3qllxOtUwa2t1ZxdKrDwR20ZRi5wOWnlQDInQfpn0xEuI+ZPPTLpvoEYLkbdU4KydbxxWyMXhSmWeSPJEDJ9atBz+M6+PoB8J8P3g+f2wqF5ldebX+MdbtnTQoQW/f4TW65eqtQMAA8nzemEsIjCjy4B/z7L8PsXG9PmyouQ/zGaZEhoaDsISpeUpBvk1F67IrSOkC2zAg6s6nKXvoRyvMLK7UGFcKXNAWvfxm4cA8wsSczJ2u2/Jn1SAdE2hzhNmi7assWnN4vezGAofdM+zcH+JU/cbf5AvL+GEokp5bitJ9qsFnzaMaVwKkkrVtYAh7RFIZ8OMxZ1LRzOdTWh1j8QtlZjNjyi/t7gsqsb/vbQV5sofwCf4sFb0CepE1LElFS1sFhSZP385VeNwGwat7bV0V7PkepXDIUh5fAafvR+Bg3mlkfpWUKtgN/onq8YVMo6o5Up1gV4IRWnM8dAIgYRd435UfEPyljkx8lWFbTIRcUMxVltVBYehDJegkejPX49wEaxjRFvPGBe85q9ZY+4s+C/sZx2CzqmJj9sA8z4x3Q4SdOGrA0I2jPzxgajIqdEbBVn7YisIrfcMIRIsc55t0JM0X0zH1S7X3fHYf+ZGjV85uSnAC7A8BDZ1nBlUaAxG+uYj9nclp2UwC5Cv7KTyw3W2YS3lxYpVdNFf4xI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5933.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31696002)(66946007)(38100700002)(86362001)(2906002)(316002)(8676002)(4326008)(66556008)(66476007)(82960400001)(8936002)(6916009)(2616005)(186003)(6666004)(6486002)(966005)(83380400001)(508600001)(26005)(6512007)(6506007)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkU1bVdMd21UOCt2T1VXRGZyaGpVdXFaUmorVzg3S2pPcWU3OXo1cGhLa3cv?=
 =?utf-8?B?anp5djIrdFZ1UjJvcEtDdzhVSWxnU2MyWmxYWWQ2ZnFVSkR4bm93ZjNDQ1dm?=
 =?utf-8?B?b09QejRXc3R5b3E5WWNtTjl6alQvcFdTZkQvN3VIK3NaSzkwU01wbENuNHBo?=
 =?utf-8?B?RVJqNk1XdWVyTzFHNFZNMWMyaFVmaTl5dUV2NHpoQ3plWU9wTkhuVVV0bE9o?=
 =?utf-8?B?N1hzcGsxL2RBZGpNcjBOMmtXVEhJdUtsTkYzb09FRWtPVWpZYTVDVEE2MDcv?=
 =?utf-8?B?aURTV1J2QWg5VkR0UGtOdjZxdkpTUVNuU1c4bVlzWS95SGpteXRrT1Eva3p2?=
 =?utf-8?B?Ry9yWmEvbWhxZzVFaDBrYklIYUF3UE03dm9YRS9PMWJvaHhYOGllckxSRk1K?=
 =?utf-8?B?Z2pJeUxhbElHTS9GaFZwdkFnQ3VQWGE1d0ZwdTZNSFM4RXp6b1lPbE54QUVz?=
 =?utf-8?B?TGJNWFhHYm9GNkx6QW1lVkRSU3UvNDNic3V4M3d5ejY0Z2ZQNVZ2clJVTHcz?=
 =?utf-8?B?WUpiRk5RR2MzcXlFS1BYOE5pdmZWRW9rM2o0QldqeUpDMmxsYkhzWmNCd3dy?=
 =?utf-8?B?VE5DRm8vZ3pacEZlVUJObnMzVUFIcmtrMDhSUFJLNDhwUlA2NlhmaTdhTXRl?=
 =?utf-8?B?bnRyYithVXFRVzRVVkhDNk4ra2w2Q1RNamx6WlRJak9ReXg0V09xNVpLclN0?=
 =?utf-8?B?RS82MkhtQTZ6T2pDaHhGT1pvMi9adU1VOFdPSkd5QUsyTmllc2dsalNxWXFQ?=
 =?utf-8?B?RU8xQXR2bjFVRlMyNFUzYUtLVkZiU3JJenV2MVlRek0veXRHN2NtZlI5Rzg5?=
 =?utf-8?B?eStFVVZ0RHdtTGowejdqd2JLM1hBNXU0RkhxOWswWWk1M2wwKzlreTk5NUZX?=
 =?utf-8?B?WlhvRGN6QlN3eUlOOC9ZNUg3d05RUzRiNVZjZFpFZVliYjVGOTkrSmhtT1JS?=
 =?utf-8?B?MVFUUW9tcitjaHo3SksvVkJUOUV2QWRjS2lEN09UTFVWVmRwbHFVSHhST0R1?=
 =?utf-8?B?Ti9SWlRQemIrMlZkcldDbC8vc3hqaGdJajd0Mi9MMll1U0UwMDEwTHlZRG5q?=
 =?utf-8?B?Nm9TcS9PQW1WdnpUeEQzdktockhyR2tUV2daZHdXYUZoSXNua1lValh3RUsy?=
 =?utf-8?B?by9peUl3Y200R1lWRWZXeHZKNTJ3V2FiTjgyT2lSMnpBL1YrQVNhby9SSkhw?=
 =?utf-8?B?Z0F0UzBEZEJmS24rV3RhUncvanZBVWc5bkJwQ0g4aVJHaDBFYjRwY1BVbFha?=
 =?utf-8?B?OXFIc2VzbktQZlgycmhVaTI2dWFLd3IwYkJqQk5UdW41dFR5ZUJKb0taamhv?=
 =?utf-8?B?dTZ5U09GQUlRenBSUmlxVlRiZzVKb3dPQ2I3ak1hWVlFL25KL3JmRGZYZVlZ?=
 =?utf-8?B?QnRneXYybFhIbUMxTUxHOGpXRm1mL0o2dXIwc3luL3FEVHZWYVVzaUdCbnlx?=
 =?utf-8?B?MGU3REJLZ2w5MklmaFBhQmF0QlpZNyswVUFtVUxEeUIvdWpvYm5tR0dIalRX?=
 =?utf-8?B?R2dBcFhUV0NjWkVDYVVsV2VDellGcm4ybW9MRnJ2Z3lpcHF1cnpFRDJPcXQ3?=
 =?utf-8?B?cG8wMFhoMnA2aW4yeWo3SDlKbVE1QzF2ak9NWkduU2d5dUhLTEF4dTVNeEZz?=
 =?utf-8?B?UDFKazlFNzJKMTFNbUlUZm0vRmRERFJMODFzNnlIWWtlc1NIRnRGTDhBdlpj?=
 =?utf-8?B?U3VRMitBeDNIMVMzY1lpL0IxOFNoMnZ4cTlkOTU4dTh4ZURBRWw1OVdQcDFG?=
 =?utf-8?B?VEsrVWFjakxrSjJuWndWWkdZRHVCdWRKNU9FbjkwWms4ZmdUNTV3SmIweko5?=
 =?utf-8?B?c2RPOXJNbXFLL2d4UkpWUlpaZEJMQ00vam1RbWR4aWZJbldTTG9nN0U3YTRk?=
 =?utf-8?B?WE9MYWVJcW0yK3ZqU0NWNFI0b21LQzk0ejh1UFF4VlZ2K3FScGw2VTA2UWZw?=
 =?utf-8?B?czRTZ3FwZ3FBbGRRclVESWYvVUtPTFB3bjBhNHovNk9yM2tXbmFET3ZkVkFa?=
 =?utf-8?B?OXlWR3RmajZxUDcrNjNJdmdkMFhKeHF5RXpCU0hib1JvaU4wanBPeWNSQStl?=
 =?utf-8?B?am92WXo4Uzd1L3I5QThXY3FqNjdBN0pWUGU4TDRrMGN6MnFsbGJKZC8zYnZ0?=
 =?utf-8?B?dThQQUpmVU0zZTdyWkFwMTR2OEppRDZzZXcrYmoveWk0ZEFRZTZLQzc3aGtM?=
 =?utf-8?B?eEthV0VraW9oRHJOTzluQTdabndtZUw1eHZDbnJ5d1lObjg2aDhFTy9TQjNB?=
 =?utf-8?B?RGg2bFk1WGJKVktFbTE0NW9OUGNiWUQrb2IyNXVIN21uMGNGN0MwblNEOHRM?=
 =?utf-8?B?a3pjQmIreFRZSG1sdlFLWUVoZW56SFlyVkFRNjRLbUMxWlN2dThrVWM4c1Rx?=
 =?utf-8?Q?iC1txDJ3waDF0kC0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae7d1d8-b7bd-4b85-1aa1-08da48f2d908
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 02:01:48.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XdMHZYorjhntUmqojaJLkGEpJF3x/Kipa0UkUoYQhU+FhHJELLLW+/GrvOHDB3QjpNTPkqllZWnF+DWmG1B2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3995
X-OriginatorOrg: intel.com

Hi Matthew,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on jaegeuk-f2fs/dev-test linus/master v5.19-rc1 next-20220606]
[cannot apply to konis-nilfs2/upstream]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/Convert-to-filemap_get_folios/20220606-034220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220607/202206071410.ZIdrc0xR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://github.com/intel-lab-lkp/linux/commit/bc9eb0d5ef0a437e399f0fe3b7430b9da5ef9f95
         git remote add linux-review https://github.com/intel-lab-lkp/linux
         git fetch --no-tags linux-review Matthew-Wilcox-Oracle/Convert-to-filemap_get_folios/20220606-034220
         git checkout bc9eb0d5ef0a437e399f0fe3b7430b9da5ef9f95
         # save the config file
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> include/linux/pagevec.h:140:17: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
            fbatch->folios[fbatch->nr++] = folio;
                           ^
    mm/vmscan.c:4779:3: note: Calling 'folio_batch_add'
                    folio_batch_add(&fbatch, page_folio(page));
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    include/linux/pagevec.h:140:17: note: The expression is an uninitialized value. The computed value will also be garbage
            fbatch->folios[fbatch->nr++] = folio;
                           ^~~~~~~~~~

vim +4769 mm/vmscan.c

bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4769) void check_move_unevictable_pages(struct pagevec *pvec)
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4770) {
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05 @4771)  struct folio_batch fbatch;
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4772)  unsigned i;
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4773)
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4774)  for (i = 0; i < pvec->nr; i++) {
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4775)          struct page *page = pvec->pages[i];
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4776)
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4777)          if (PageTransTail(page))
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4778)                  continue;
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05 @4779)          folio_batch_add(&fbatch, page_folio(page));
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4780)  }
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4781)  check_move_unevictable_folios(&fbatch);
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4782) }
bc9eb0d5ef0a4 (Matthew Wilcox (Oracle) 2022-06-05  4783) EXPORT_SYMBOL_GPL(check_move_unevictable_pages);

vim +140 include/linux/pagevec.h

10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  126)
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  127) /**
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  128)  * folio_batch_add() - Add a folio to a batch.
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  129)  * @fbatch: The folio batch.
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  130)  * @folio: The folio to add.
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  131)  *
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  132)  * The folio is added to the end of the batch.
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  133)  * The batch must have previously been initialised using folio_batch_init().
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  134)  *
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  135)  * Return: The number of slots still available.
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  136)  */
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  137) static inline unsigned folio_batch_add(struct folio_batch *fbatch,
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  138) 		struct folio *folio)
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  139) {
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06 @140) 	fbatch->folios[fbatch->nr++] = folio;
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  141) 	return fbatch_space(fbatch);
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  142) }
10331795fb7991a Matthew Wilcox (Oracle  2021-12-06  143)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
