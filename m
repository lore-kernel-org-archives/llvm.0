Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A47F6357
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 09:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645520721; x=1677056721;
  h=message-id:date:subject:references:to:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JvxRfk/JTlZxriY+mPvPfPxATDnIXqWZ3tx5IXIxFxs=;
  b=Kw0vcgSmFE0RH7G98O12vSinbVOPLkHZiDJM0E5UFfRRIc/aBS8CK7i1
   jmsIKl+qFHFQxHbOnxeJ5aoh4bKPf9wydqzMyjRuicveFbvxhiaxJ361F
   S7VDGnmUUrtSSsuQNscjOH26RXx1F26EnNC8I9NnOY+SNAu3plORQ+uiz
   Vlkfn1g3yLkw7IAf12DjtIlQyHyPiba+lvsvE5C06emdaYYJ3O7ngr5ej
   HzaCCoLL8/XOxKmkPqw+FT2WR7m7THVbL/dwU/fdvQtQXPe+j+oyPjI7o
   X00vQZUDCVqi3J4XkUr8wZNTHpM0zToVeH05OIY5U4sm/Dp+f6zX+/Iu1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="239062627"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="239062627"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 01:05:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="638835572"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 22 Feb 2022 01:05:20 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 01:05:19 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 01:05:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Tue, 22 Feb 2022 01:05:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 01:05:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXXrthwGw1v7SVQoVw0xblKVH7j+zAoAoSIOKytUKNAbcu9YnGBhpfNSaTQ5/kRy1a1YVFw3S52LTQOnaB/u2WAav8wq7OB1+iJvBUOV1cDiyJvX01PYnFswtSQdVNkjjOYEW+sBwUgY7vOydXTCKbdmNLU3H68zOlBQahJM+Y+aekoAdmCPyHvEVpFRVrA3xsQyVW1WWlkC3W1Vr6CGVCQLNF+rvrIQkPIo5KFEYHL87raKXp4Xd6OkmoUysD995fEnRhB1dgq5RErgwXrQJd9phYbM/BFxHu1UwgKw1meAP+fRqkT8hBQtBtReT51oADm4Pt/rI1pT+XkKNPG3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6IebaVodP7yw5NtozRlKBEuph86OjfHqCLLpgP0GAo=;
 b=NAMOjuOTHsQqM1kQ1bEOlYfXzYAjgTuGQPSigwdWyRJL/RnyvVso2QuJzlVe0njGRaKOzlOwpvDchdicaGHqDWoJAXOyv/dEpDK8G+EmoyMPQ85yZ8dBG0J8abkDR/6XZcBAWW/8F0BBdu0HhD7fa9hpABhh3OEHU4x8vm+jQKLIBAghlCW46ILeZpDwTNMdgUEf4dyFQCvY/Tggat9EYv+D6i1QgeOcF7MLKu+K4wBYfyVn/KJnSH49vDMko0aSYR04+FGeggDzyWReZXCgFcwb/bI8lMUBsjre4lX4h8EWFy0SQBYz6T1XTmPSd8jQglCNuPpLmV3uswUw9AsqfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by DM8PR11MB5749.namprd11.prod.outlook.com (2603:10b6:8:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Tue, 22 Feb
 2022 09:05:16 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d%9]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 09:05:16 +0000
Message-ID: <ee50d553-e183-eaae-eed2-c4823a30f693@intel.com>
Date: Tue, 22 Feb 2022 17:05:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: [linux-next:master 5970/6564] mm/huge_memory.c:2145:4: warning: Value
 stored to 'page' is never read [clang-analyzer-deadcode.DeadStores]
References: <202202220917.CFUvfxmY-lkp@intel.com>
Content-Language: en-US
To: Hugh Dickins <hughd@google.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, "Linux Memory
 Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
From: kernel test robot <yujie.liu@intel.com>
In-Reply-To: <202202220917.CFUvfxmY-lkp@intel.com>
X-Forwarded-Message-Id: <202202220917.CFUvfxmY-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR06CA0020.apcprd06.prod.outlook.com
 (2603:1096:202:2e::32) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea154186-8d37-42b7-9358-08d9f5e27148
X-MS-TrafficTypeDiagnostic: DM8PR11MB5749:EE_
X-Microsoft-Antispam-PRVS: <DM8PR11MB57490130C0CDDFC4AE49E064FB3B9@DM8PR11MB5749.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D6DgwD6xrVT8KsOaSLazpTbJEnZSvQhYKL3DnVgN05Kd3bN2GesCLwUyoi+CrmE3MipF5coF6275Yv0792giCsB87gjcnaFveTx8KM6+LS5h+qhoGePL9EyZOG3ryWTi5Y0S+0x3kdQvvElV92YlQh4v8ih6Moo3L6zSqT+WaGUyyQZeQcYwnMwxAwpUGw2JNdL6IUs1Lelo00Ze5oSCRMyS5KldNc6uk4OdbTSk4EtSUlED8UHy6NLQQmLMO8nhqr2C9K8osQE6P2IzJH//Z5Lt26nIZkoQ3YW2s4ArTtj5me+jVZj4MR73u8q82eGdVyHwMAU1b7ACSmH1Bss6lpDBYoht79+zA4Sb190D1/nGK6+IvDKFRax9/JCLHLDNwX+hv2oPDWxwVyPVAie+rifvUuuzbHXV1q1xdBT8nqhZtfKCCH1SDJQ8iEdxD18NqqLb4xii6XkM+jaDEL+Wkf53/qt4nfr3808mobKF/VjxExl2X4bPh5ECzsTaRtQAf2w8pEHVO9djS/B8MrwHml0gpXPqfYzUmgf8JYWapcgNbpdxkKkeOVievs1+fta/IR/AY3cdzE9ILnITT10sby+0FHYQkLZXUSv3sOTOb9nTjHFr3NN97IhmUiZrsoL4yWbT09QB7+FS5/C99yHOlXGtLJ1aff376YMELquq44zqcD/fioOhFcdwJYhdVslnPqBwYWhdvlcoaXDWCrkRBEgd0JElBEN6ogGuAwaCmmUmVer15J5u29xhxpIlMzzPsM9O4JKX5Bphr9HgaHS0MBEDdB0Alio8zgd+fZJmjBto3kLiRzer1B2ynNLVKj22ltsqAhMpL/meCOv5EmMXlhz4m59/ExSKxCjBZ8FV9oxO6EEynkwfAAMtGGDD/7i3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(36756003)(5660300002)(508600001)(4001150100001)(31686004)(6486002)(82960400001)(6666004)(8676002)(186003)(26005)(6512007)(4326008)(6916009)(38100700002)(54906003)(86362001)(6506007)(66574015)(2906002)(966005)(66556008)(31696002)(2616005)(66476007)(66946007)(316002)(83380400001)(14583001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXNIdCtwUW9US1Qwd05yTWpPNmFjUjhHbVRBeFArZWp5R0FBcTBJZnJyZEdP?=
 =?utf-8?B?d0JURHlnWHpIcGRzN09ZL29FRGxCTk15aW1oM0o0S05GSnpDVzFxSWtKTU1u?=
 =?utf-8?B?ZE9GWmpjQ2JDTmlpRFJpdExrVlV3MXBMR1k1Q0lhdFZlYlh0Q0ZTQWZRSjh4?=
 =?utf-8?B?L2o5SUxjQUJGUjhsaFBNRFhEZ2gvRzdnbzdkeEJEZ1BlUlZDbVRhRDBZVkxh?=
 =?utf-8?B?SnZVU2hFQ202UWp6eHFGRlRZa0FrNE4wb21FRUZPVi9mdWk2VjNJY29nYmM3?=
 =?utf-8?B?NUtqTEJoUnpJOCtzN0k2VFlnSVc2V284a2xZZzMxdUVBaENsejFad2xGaTU4?=
 =?utf-8?B?bjdEWiszbS9OZW9HR3kyQkMxK2ZLNThlTjNrdWZCV2lsUEdVd3p5eUJPYmVN?=
 =?utf-8?B?NGVPUEphb0ljMm1HOHVubUxDL2VoeGlhR2kwZCtYckFXWFY2c2hqbXp6TWNt?=
 =?utf-8?B?MjRwczRJN1MxS290aEg2QWo5M0UyeWZyMHI4ZzE5T1cyQmN1R3pPT2RuMVNH?=
 =?utf-8?B?cjNKL1hRN1dSTkwxVzd6R3VNMTZvd3Fob1pZQVRVSWw2ZC81MTh3alZ2SlJG?=
 =?utf-8?B?OUhpN0lEZXVoUnRBTGFFejhFWG1LeVc2d1JqSThtZXZuVHoxRHRxZ29JUkFU?=
 =?utf-8?B?QW9iSVlkMVRGTlpBUUx0VmZXeDhHaENIQVlNSjJzU1FYT1NsaFhmcXpaZU53?=
 =?utf-8?B?OHFsTjllRHNzVzgyY0tPQlRPVVhJT1ErN3pkVVNEc1JCREpLb1poaTBrM1ZY?=
 =?utf-8?B?VkpiVWdCaGc5dE11WGZtelFMQXJESHMyR0dNV2VQdjNmSC9VbkJpSEJOaGpI?=
 =?utf-8?B?aGVkOHgxazBCTFZscHdtMVpNOFVxelYwUUFwR1p1enorUzBDUExKdlNxL0d6?=
 =?utf-8?B?akw4dHpFQ09rRDVvT2l2OE1xQ09PSUxNWGh6OHlUKzBYRWNhM1M4VEs4MDkx?=
 =?utf-8?B?a3pxUTNOYU9YcUlpai9qT2ljbTMyQ1F3b2xsdkkzbUtEaGVsQnB6Q0hjRWkw?=
 =?utf-8?B?aTlhVDJNb0dOMzBNUTRQWmhLWGNNdWxtc1pIUW1Jd0YvNmNJcCtMQlBUMDgw?=
 =?utf-8?B?Qmtwb3Q2Q0N4L1MyWHZCVnEwUXRSOHJiOStWKzZiMm5BTmM1N1BnWERrYkI5?=
 =?utf-8?B?cGFUeE1vMWdhQS85aVFyazBEWEhMYVdMRXowVThhcFpvQ3FLdXdZYm5qQmZx?=
 =?utf-8?B?em5Rb1pWT0lKWE5WUno0RlN3RDllMWFoVUsydVBzbzVJZzJuaHFGU1g5ZEg0?=
 =?utf-8?B?YlZRMXJTY0F5dE91VlpUZlp3YVN5b2YxN0tMVnoxT3Q4aEJ0c29hL2VGa3hS?=
 =?utf-8?B?MU1SUmcvTzAzeCtOUXBOQUFlZE5KQVpTanN0YkFmNVVWcTl4bkREUlBSYUl2?=
 =?utf-8?B?VnFtQ3J1Si9XZGUzVW51ck1lNFBycHo4WkEzTDFNVVpNRG0zd1J2SDZIQXFT?=
 =?utf-8?B?cXJ1Qmo3NWtmUnc2SnBJYkYyUUt1NUFYV09oTWFDWTI4MzB4MDVIUC9TeW5R?=
 =?utf-8?B?bnJ6VHpYTHlFalJwam5ZSUJXdCtPd0JFSlBYUFVCMDE4ZVRqMmtjZzNZYkc3?=
 =?utf-8?B?eGtxNHEzZGN2c0tVZDk2NnFmRHpGQ0ROREg1SDZHS0ZKOHFiQ1Zlamo4dWMr?=
 =?utf-8?B?NEROek0yM1JjYUFBVmpid3U5WXIrcWxaZzhhQXd2aUdDRTYrSm5pTld2RWpM?=
 =?utf-8?B?alRPZUNBdmgvZkNwLzBjMjhMbGltR0ZGTVNlMWIwd3B2UEFySzBFUVUwc0Yx?=
 =?utf-8?B?R2hJOVc2OWZLSkxTUnNWWHNLRyt4RmhYdlppaHdjNXJhS0JkSDFhd1dSZHBl?=
 =?utf-8?B?MGxOS3h5R3JNZkJoaU5FRS81b0hHVnJqQTNobWM3OGtlTU5rbzBEZk1JcWpz?=
 =?utf-8?B?cnAxT3lkcFpTdDZFZ2hGN0FGRlZiV3dWTjh5Q1orWkVRWGJNVzNzVVAxZGxj?=
 =?utf-8?B?cWluRzJHOUFGemVXdW1rOENLalhiN2FBQlBzbkxHV3dGVUdocElPR1FFN2Fl?=
 =?utf-8?B?Y2EyQTVKMmt0UUYwaWtrMFRMVUNtSERHUUYvaTV6MmZQMWdKME5WZjNLNGRu?=
 =?utf-8?B?TzNqUVRtNHdCZzNXekcwQndpdnRPeVJjVHhlbnJvOW1SMWk5Vk00TGh1aTQ0?=
 =?utf-8?B?R2VSTXNGN3pJMjByV0dBWFRFT0lQdy9NYWpEZTN4eUJYS3YvUzhzcS9CcnJt?=
 =?utf-8?Q?WGE7V762nlL5MQTztSuL5Qw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea154186-8d37-42b7-9358-08d9f5e27148
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 09:05:16.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRSoy7NY/CRyJUqTCHm1CJ5+qcBtiTjQOT3bjtVd6xplK26ey0l4Z3EQMy6GGZMSUROqI58Er0876lLRQo/BIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5749
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
commit: c1879365d325d0f44337fedcfffe8bf200092f95 [5970/6564] mm/munlock: rmap call mlock_vma_page() munlock_vma_page()
config: x86_64-randconfig-c007-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220917.CFUvfxmY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c1879365d325d0f44337fedcfffe8bf200092f95
         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
         git fetch --no-tags linux-next master
         git checkout c1879365d325d0f44337fedcfffe8bf200092f95
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> mm/huge_memory.c:2145:4: warning: Value stored to 'page' is never read [clang-analyzer-deadcode.DeadStores]
                            page = pmd_page(*pmd);
                            ^

vim +/page +2145 mm/huge_memory.c

eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2119
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2120  void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
33f4751e99601b Naoya Horiguchi    2016-07-14  2121  		unsigned long address, bool freeze, struct page *page)
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2122  {
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2123  	spinlock_t *ptl;
ac46d4f3c43241 Jérôme Glisse      2018-12-28  2124  	struct mmu_notifier_range range;
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2125
7269f999934b28 Jérôme Glisse      2019-05-13  2126  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
6f4f13e8d9e27c Jérôme Glisse      2019-05-13  2127  				address & HPAGE_PMD_MASK,
ac46d4f3c43241 Jérôme Glisse      2018-12-28  2128  				(address & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE);
ac46d4f3c43241 Jérôme Glisse      2018-12-28  2129  	mmu_notifier_invalidate_range_start(&range);
ac46d4f3c43241 Jérôme Glisse      2018-12-28  2130  	ptl = pmd_lock(vma->vm_mm, pmd);
33f4751e99601b Naoya Horiguchi    2016-07-14  2131
33f4751e99601b Naoya Horiguchi    2016-07-14  2132  	/*
33f4751e99601b Naoya Horiguchi    2016-07-14  2133  	 * If caller asks to setup a migration entries, we need a page to check
33f4751e99601b Naoya Horiguchi    2016-07-14  2134  	 * pmd against. Otherwise we can end up replacing wrong page.
33f4751e99601b Naoya Horiguchi    2016-07-14  2135  	 */
33f4751e99601b Naoya Horiguchi    2016-07-14  2136  	VM_BUG_ON(freeze && !page);
c444eb564fb166 Andrea Arcangeli   2020-05-27  2137  	if (page) {
c444eb564fb166 Andrea Arcangeli   2020-05-27  2138  		VM_WARN_ON_ONCE(!PageLocked(page));
c444eb564fb166 Andrea Arcangeli   2020-05-27  2139  		if (page != pmd_page(*pmd))
33f4751e99601b Naoya Horiguchi    2016-07-14  2140  			goto out;
c444eb564fb166 Andrea Arcangeli   2020-05-27  2141  	}
33f4751e99601b Naoya Horiguchi    2016-07-14  2142
5c7fb56e5e3f70 Dan Williams       2016-01-15  2143  	if (pmd_trans_huge(*pmd)) {
dbe67be3d9f30a David Hildenbrand  2022-02-16  2144  		if (!page)
33f4751e99601b Naoya Horiguchi    2016-07-14 @2145  			page = pmd_page(*pmd);
84c3fc4e9c563d Zi Yan             2017-09-08  2146  	} else if (!(pmd_devmap(*pmd) || is_pmd_migration_entry(*pmd)))
5c7fb56e5e3f70 Dan Williams       2016-01-15  2147  		goto out;
ac46d4f3c43241 Jérôme Glisse      2018-12-28  2148  	__split_huge_pmd_locked(vma, pmd, range.start, freeze);
e90309c9f7722d Kirill A. Shutemov 2016-01-15  2149  out:
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2150  	spin_unlock(ptl);
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2151  	/*
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2152  	 * No need to double call mmu_notifier->invalidate_range() callback.
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2153  	 * They are 3 cases to consider inside __split_huge_pmd_locked():
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2154  	 *  1) pmdp_huge_clear_flush_notify() call invalidate_range() obvious
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2155  	 *  2) __split_huge_zero_page_pmd() read only zero page and any write
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2156  	 *    fault will trigger a flush_notify before pointing to a new page
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2157  	 *    (it is fine if the secondary mmu keeps pointing to the old zero
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2158  	 *    page in the meantime)
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2159  	 *  3) Split a huge pmd into pte pointing to the same page. No need
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2160  	 *     to invalidate secondary tlb entry they are all still valid.
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2161  	 *     any further changes to individual pte will notify. So no need
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2162  	 *     to call mmu_notifier->invalidate_range()
4645b9fe84bf48 Jérôme Glisse      2017-11-15  2163  	 */
ac46d4f3c43241 Jérôme Glisse      2018-12-28  2164  	mmu_notifier_invalidate_range_only_end(&range);
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2165  }
eef1b3ba053aa6 Kirill A. Shutemov 2016-01-15  2166

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
