Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A105173
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 06:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642485771; x=1674021771;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=lcj8nY0zEG2PH6dWmv2jD5RPW+ZkRLaWj6ryYKvmdr0=;
  b=M486hzDdI4QlqpKMCY55AzQO51QuVZwdFid4gR1aIqsaBq5AM6eyvfLB
   aMZxLcEQ87yNxRJhdWvZI7XsdKEAQ+94AfIKlUzTEfkN0dW436Z574bqa
   a2pEGHBmuSRkpc+VsSLjU1Sej6mZ4bGugOlcRMzHzEXxx+TyAJ5odoUeK
   yWd2AWDTGo+JxAefV9LL/ND3dZA1OPodSHYOVSXQDRDnkcN4mOXdlIB6q
   qdRGGymOFaR9zA0VMZyUmC7U3GrAwGnnkLElDblx0LJVaceFtASXRTLHa
   Gl2+Q/Zuc1abo+ohyCAuKfShqwzlJfnqKJWCK4c5AQHoeGPtVf6JutbIx
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="331096424"
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; 
   d="scan'208";a="331096424"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2022 22:02:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,296,1635231600"; 
   d="scan'208";a="474658972"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 17 Jan 2022 22:02:00 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 22:01:59 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 17 Jan 2022 22:01:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 17 Jan 2022 22:01:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 17 Jan 2022 22:01:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWwNrqZMcQZRSYV/kVLo2qIKsJNHskQzFnKPNFrZeXXeAzpIpAOKyDItdFmxUrE7jZ/u7JOVIEs/re4QGwE84/V58oeeuCYqq6uUQxuzmWPrU5/av+c1whECymuObpSSrRR3Ur0jBTKll7OJxESL+0vuQrKx0po8C35tNvS18kLbuWEMV/O5+ModsNA6M635SF1qlyZhgFDo8vKHIuGh7Y5GgqFDQnk517BAgwAqxSb9uWCfsKsiVKlPqyTNs1Lw+nHgY5h9Qb7/0WDoH12+Y4P50feoS/whS6mtn7Qk1X8rVArOVd8LUYrMl3aaBk3ZJx/h/y97OOzXfDIe7JUyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQyGhwAoQMK7wP6oUz0+uJ059W3XzwxwMbn8hUkwmEQ=;
 b=F07+lZNom6UaiEHyKFS2r79BCU671BKvbwyT4AX3fo5AI8Grl/uHzzEsWK8PTovi/SEh22S9jghrDPAneYn4mBjiuhX31DM7F2dPlnWdoLLQhY2owmuVPHEHrQeIdfiQkEIPR8dK8h8ITUjb4eca8BwPH80jZcXf2NITaQem6zMtlmVtWNajb06Lugc+rANwcbXcP+OVSAoIcLCa9grfswlSUMSiN7xXQryxJrKwjC5Hx3yEETs4g2x/Jy8dwm4fgWL2wqV5PdS/SwlNIZPCKzo3HcXjWn56nTX7j5fO9dFy4WtCn87tKYiSDMOX5w2IcxFJBlt5oTtOpKNO6z1u6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 06:01:57 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::741a:c47f:a4:bff5]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::741a:c47f:a4:bff5%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 06:01:57 +0000
Message-ID: <e9b4b5f3-319c-b112-5a52-e89316ae4c56@intel.com>
Date: Tue, 18 Jan 2022 14:01:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [RFC v2] perf: Rewrite core context handling
References: <202201150516.CCZxTJTq-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202201150516.CCZxTJTq-lkp@intel.com>
To: Ravi Bangoria <ravi.bangoria@amd.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202201150516.CCZxTJTq-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2P15301CA0007.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::17) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6911fcbc-96e3-4d1a-1526-08d9da4808fe
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB564805E9E21CF9148B41E2DCFB589@SJ0PR11MB5648.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ltpamXHpMd9Kkr2N5R1Gnn8z85H+sariAaB34gLVtFWChSTOfOQ/lT/+/OdEnaR636nDcRW0iXiMqGig84WduxCjD6siUf9GCEwFrtXAoklcoTEpLtt4O2UD1CmsplXMg1gy0B3zmRq8WyHWXH4hDMAaRqxFmA4/0sjWThqSODMEpRdPkLRibc553PYSk2Quyw45xqeTFQvRJivZoQMqlroKQ+7FGiqTvcDsAYutJ2hvX+NWGvh8vhY+jMEk3IfOsOfLY8kwxIyoCJBNxLtsdkcN6GraWfjxyqPFms/7Ai4JY67THCLXHXHjZuxiZjrpsQDd33kn42s/Oph6+cLjsGn/WTTb0fsBe3oe1xTOYWoGAEHe3zxndIBI1TDr6OjiK3zOIHlnyUMuoaY40ZECHt5hrcrpiDU7zhI+5m61n2Fn8h5VHE20TaaBJb13MZ5pqQF6u690tJ+CL9zJWWlDJgYDikv5r9YtC6W2XJwJxhhjLbMJJK2wObLoUtJ7/yIq/R7notcbMpFUkhpvi3/nZU/6KjiBaNKxeFoAiXfx1o6KnuK1no0fYtQSVpIFOi/xRw4HTm6lChI/JLNmdVHX/1AfcaUFnE6JCtgN5ZB4HCXcJek3TgE/0/1drnLN37x7Idl8rBYntIDv5UBUYWcVeaHUBwD6UG7kDeYK4lumyxKMFaeghDEK1Ft6UqgRM0C/BIGkxzVOlmub/tGXDs/AN/kVPPzI5jisbqP45y5tweT8kPK8OJd0qkeAR8p8rB1U34rG2RpQCBqD0e0Df7IleaRdbWcyNoYtzDUb/SH8syYlQi4jnrTFUeQLKuWb2Uq8qQJw0Td1QPpgLsqWsa8GLQosLdnnwDiPp5IsbI7WCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(2616005)(83380400001)(2906002)(38100700002)(86362001)(4001150100001)(6512007)(36756003)(508600001)(966005)(31686004)(66946007)(6916009)(6486002)(4326008)(66556008)(66476007)(316002)(82960400001)(8936002)(6666004)(186003)(31696002)(6506007)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cC9sSGxDUjh5UUxKUUZuNFcyMkJ5QTlhcDhxSXB3cTlsUzJ3bW9xeU1yWlIv?=
 =?utf-8?B?WVpGVXB5eGJFclMvalptdFRLaDBpc2dLMTNTOWV2TFFKNEJiUW96REdqbmk5?=
 =?utf-8?B?YWdXejBhTnlLUVFzWURkenNTUVFSVkszUFVMdWN2UzU1SXZjaEtieHNyZTlG?=
 =?utf-8?B?TVY5QnVTNytid2h3Qks5NDhNTTVBSFFOSmcxTkxHUjJuTjQxdjdtV0NhUnRm?=
 =?utf-8?B?czZNZ0RFWlJ6NTRtY3gwRkpLc2RFSlpGVkc0cDgwV1MvYkk1Y1hOU0d4MmdB?=
 =?utf-8?B?eCsyaFNFdDdSa3FOeVJLckR6VG9nenM2TGEzNURydUdrSVNteWZrL3duZlFK?=
 =?utf-8?B?cXIyaU9FaW9qVDJxZyszdWowN0RYUko0d2F5dlQrV2RrOXlNK1BpcTZhRkND?=
 =?utf-8?B?YXV2bHRYQWxJU2JNdU5UU1ZVVHZTblYrZk9NcDNqc0w1N0ljQlcyckNXRy93?=
 =?utf-8?B?SWM0MEZqelZSUmNkSmJsSzVZTlVOVm44YmFZYUZJZFp1YUZFZGVDakJVNkF4?=
 =?utf-8?B?MHEwbXlUSWxPOXVLSzdyUG5JYjJxMTUzS2lmaFdvaVlDeGFxV1QxTE5ZeDZI?=
 =?utf-8?B?U2Zzc2p4YnhPVmdIdUR5WXdJWFBta2dvOVZQRWpHQ05oMGp3OXdTSW1JTGhY?=
 =?utf-8?B?bHhzWUM5TFkzMGIrUGtpMUhLaVBVaVl2aS9Xd2lQdENmR1Y3c0h3N21EZThC?=
 =?utf-8?B?ckRUOTAzdFQvRXVvaG43a3h4WjdXZFo2M2xVMEpsczBIOXRKRHZVVFdrLzBS?=
 =?utf-8?B?UVNCQzhUVUZONWpXS2tKY0V3ZGVLcUJQV0R6S3pleE44czB1UzF5Qm81cDdL?=
 =?utf-8?B?bWVEU3RjOXZGYmdYWWdhWjJuSHVtcUxOVjRrbkw3ZzgrRWo1RG9TdTFzOHJQ?=
 =?utf-8?B?RXV0RWpOVWJabjJrcjREMThtNVNEM1NQVzFsaW9HeVlwc0N6S3ZDQmdBMTJG?=
 =?utf-8?B?ekkxZGsydjcwd0dmZmZvYUIxRXduaFhTZXhSM1hYUzE0dDNNT250YUR0b3dv?=
 =?utf-8?B?RjdMQS9tVkYzZ3owNFNlOXhkbHlqbElaMVVwck5XT2p4S2lBZkJzbDJYRjB2?=
 =?utf-8?B?ajdQdWFlelJ1dTQvWG4rUjhVdmhBY3p2c3VldTJHOXdQVzJXaDZKaGtzTWZG?=
 =?utf-8?B?cXRrS1lqMjBSZEMvaWNMank5UnhRMWtmZVRTN0k3NnU2WEVHeWx2RldtbFN0?=
 =?utf-8?B?eUl0YUJML2REM2JadDFjU3FDcWF2Rmw1bGQ3emxtTExJNHROa0Y1a3NpcU1T?=
 =?utf-8?B?NUxPZzE4VkJLMUpLUlRRc3J0WmtXYU9sdWpvTVRDTDF4UlRsU0J0YWJqWi9y?=
 =?utf-8?B?OHJyRk16Z1FNUDIvZzdJZEdmMEhUYXZYcWJ1SEZKaVl0VHlsWHlPQ0R0Z1ht?=
 =?utf-8?B?SDVuOEpZZDRDSGJ3dmYrdDlVWE9ZQ2pDTzhEZU8wd2xlZHZQRDBrR3RQb0hN?=
 =?utf-8?B?TkwxNi9SYUpMdnUvTGNjUWp6YWw0NWUydXA1UVJTTzFJLytnWTFmM1lHUlN2?=
 =?utf-8?B?clpWZ1J2N2FMNVYzK0Zpc2dnSG9xL2dSRUxpL2tKV2ZNUUtzcHpEbG9QcE9O?=
 =?utf-8?B?YUkveE1KenArZ0FBam1NSEZ6WFRFd09RSjFhM1ZRcHRzQXkyY3RMb2hFbkdB?=
 =?utf-8?B?cWRUcTRIYTJMV2ZvaDJiUlRqV3RDVVhwN050MDMxKzJ1S1BiSmhNSXM4Mi9N?=
 =?utf-8?B?dXNHeWdscHVzZ1JRRmx6aFRMbGFRVEIrNk9OS1ZZQThTTWdONzJIakh4U1lF?=
 =?utf-8?B?VytGRnU0MDJQQ0hFOWpoVTUvem5nNVVySkltUEFmUW1nY2V2ZW04SmQwTFgy?=
 =?utf-8?B?c0pabnJkWDB4V1JKdXdpaHBGZVRYUUo1Y1M3WmN3cWFpZ3c1cWxSVm4vZFY3?=
 =?utf-8?B?VTBsS3RaaEYzMVdOTk1CK1NXM0I0NWs3NFpEVkNhbzRvSVR0am1CNU4xS1li?=
 =?utf-8?B?MTFVVVZaaFNldUdYSU9ac042UjM0dmVIMGVqd3pqVkxxLzg0NmxNeVVyRHd2?=
 =?utf-8?B?UUFpN0Rmc0lqN3NMbFZINGYvOWhqaHptbVNGYVV4TjZkbDlKS1VxSkUxZVZa?=
 =?utf-8?B?VWVqeGorcytXaUxycUtxQlowU01sUFRoSm9ieWpueFowVU9udkRqbEdORzFQ?=
 =?utf-8?B?NjczbUR4TGxDQldQNzBUYjI1RzAzaFRKUkpwTHduZFJpNEJWUExNRWdpUUxC?=
 =?utf-8?Q?I4GDe0JD/CTQIBKEVx1gAmM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6911fcbc-96e3-4d1a-1526-08d9da4808fe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 06:01:57.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1YSMg1Pzinm/8qheWHgJD4AfS5eFK+Fwsv4NB7NLUW5VExgz8HpL7W/Vd8w3GQLVT+2YZGf0jjB4zBYes3UNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5648
X-OriginatorOrg: intel.com

Hi Ravi,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tip/perf/core]
[also build test WARNING on powerpc/next tip/sched/core v5.16 next-20220114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ravi-Bangoria/perf-Rewrite-core-context-handling/20220113-215022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git a9f4a6e92b3b319296fb078da2615f618f6cd80c
config: arm-randconfig-c002-20220113 (https://download.01.org/0day-ci/archive/20220115/202201150516.CCZxTJTq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install arm cross compiling tool for clang build
         # apt-get install binutils-arm-linux-gnueabi
         # https://github.com/0day-ci/linux/commit/f7cf7134e405062bf0f22c3ba5637241c4c4d06a
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Ravi-Bangoria/perf-Rewrite-core-context-handling/20220113-215022
         git checkout f7cf7134e405062bf0f22c3ba5637241c4c4d06a
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> kernel/events/core.c:4277:2: warning: Value stored to 'task_ctx' is never read [clang-analyzer-deadcode.DeadStores]
            task_ctx = cpuctx->task_ctx;
            ^          ~~~~~~~~~~~~~~~~

vim +/task_ctx +4277 kernel/events/core.c

8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4257
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4258  static bool perf_rotate_context(struct perf_cpu_pmu_context *cpc)
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4259  {
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4260  	struct perf_cpu_context *cpuctx = this_cpu_ptr(&cpu_context);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4261  	struct perf_event_pmu_context *cpu_epc, *task_epc = NULL;
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4262  	struct perf_event *cpu_event = NULL, *task_event = NULL;
fd7d55172d1e2e kernel/events/core.c  Ian Rogers       2019-06-01  4263  	struct perf_event_context *task_ctx = NULL;
fd7d55172d1e2e kernel/events/core.c  Ian Rogers       2019-06-01  4264  	int cpu_rotate, task_rotate;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4265  	struct pmu *pmu;
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4266
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4267  	/*
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4268  	 * Since we run this from IRQ context, nobody can install new
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4269  	 * events, thus the event count values are stable.
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4270  	 */
7fc23a53807970 kernel/perf_counter.c Peter Zijlstra   2009-05-08  4271
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4272  	cpu_epc = &cpc->epc;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4273  	pmu = cpu_epc->pmu;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4274  	task_epc = cpc->task_epc;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4275
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4276  	cpu_rotate = cpu_epc->rotate_necessary;
fd7d55172d1e2e kernel/events/core.c  Ian Rogers       2019-06-01 @4277  	task_ctx = cpuctx->task_ctx;
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4278  	task_rotate = task_epc ? task_epc->rotate_necessary : 0;
9717e6cd3db22e kernel/perf_event.c   Peter Zijlstra   2010-01-28  4279
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4280  	if (!(cpu_rotate || task_rotate))
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4281  		return false;
0f5a2601284237 kernel/events/core.c  Peter Zijlstra   2011-11-16  4282
facc43071cc0d4 kernel/events/core.c  Peter Zijlstra   2011-04-09  4283  	perf_ctx_lock(cpuctx, cpuctx->task_ctx);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4284  	perf_pmu_disable(pmu);
0f5a2601284237 kernel/events/core.c  Peter Zijlstra   2011-11-16  4285
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4286  	if (task_rotate)
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4287  		task_event = ctx_event_to_rotate(task_epc);
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4288  	if (cpu_rotate)
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4289  		cpu_event = ctx_event_to_rotate(cpu_epc);
8703a7cfe148f7 kernel/events/core.c  Peter Zijlstra   2017-11-13  4290
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4291  	/*
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4292  	 * As per the order given at ctx_resched() first 'pop' task flexible
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4293  	 * and then, if needed CPU flexible.
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4294  	 */
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4295  	if (task_event || (task_epc && cpu_event)) {
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4296  		update_context_time(task_epc->ctx);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4297  		__pmu_ctx_sched_out(task_epc, EVENT_FLEXIBLE);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4298  	}
235c7fc7c500e4 kernel/perf_counter.c Ingo Molnar      2008-12-21  4299
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4300  	if (cpu_event) {
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4301  		update_context_time(&cpuctx->ctx);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4302  		__pmu_ctx_sched_out(cpu_epc, EVENT_FLEXIBLE);
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4303  		rotate_ctx(&cpuctx->ctx, cpu_event);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4304  		__pmu_ctx_sched_in(&cpuctx->ctx, pmu);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4305  	}
0793a61d4df8da kernel/perf_counter.c Thomas Gleixner  2008-12-04  4306
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4307  	if (task_event)
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4308  		rotate_ctx(task_epc->ctx, task_event);
0f5a2601284237 kernel/events/core.c  Peter Zijlstra   2011-11-16  4309
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4310  	if (task_event || (task_epc && cpu_event))
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4311  		__pmu_ctx_sched_in(task_epc->ctx, pmu);
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4312
f7cf7134e40506 kernel/events/core.c  Peter Zijlstra   2022-01-13  4313  	perf_pmu_enable(pmu);
0f5a2601284237 kernel/events/core.c  Peter Zijlstra   2011-11-16  4314  	perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
9e6302056f8029 kernel/events/core.c  Stephane Eranian 2013-04-03  4315
8d5bce0c37fa10 kernel/events/core.c  Peter Zijlstra   2018-03-09  4316  	return true;
e9d2b064149ff7 kernel/perf_event.c   Peter Zijlstra   2010-09-17  4317  }
e9d2b064149ff7 kernel/perf_event.c   Peter Zijlstra   2010-09-17  4318

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
