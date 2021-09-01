Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416BD3FC2
	for <llvm@lists.linux.dev>; Wed,  1 Sep 2021 05:51:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="218354587"
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
   d="scan'208";a="218354587"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2021 22:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,368,1620716400"; 
   d="scan'208";a="510200237"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP; 31 Aug 2021 22:51:42 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 31 Aug 2021 22:51:42 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 31 Aug 2021 22:51:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 31 Aug 2021 22:51:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 31 Aug 2021 22:51:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/jdbhe52estd4D+492qL6HviRuNjuqMJiz5vPgzqc43ap8tpls0NtvWALcBLXdMugN84yjsyoRK6l33uURnb9M8TRJ3N2A5F96HLV9o0iZwMzFanrVwAAIDILrIR3V9emyDRmHA3xjR14BbLqSHCbdnbYfFZSCaH56XweX5XzdLW/NgdEOnegY6qiw2tNqmVIC3PnT14T1vkWPnE7F5XZ9xR/oWnJT7cGF18sC87S+t1tzMGYPIveY0k9JzHbjxOlAO2EPdnRk//xLCzhwUjk8Hvy0o0pwXSFPrNq6MIB02W6C5Mlecm/AduUBPBtv7I/sx1v5d38S+Vr6wgQhUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ENsT5hhin+FtB4y5t3GLN59D5Rk2LAajvbh/0dIBr1E=;
 b=AFMwgZ4v+FjPdLth37izTW/co/Vn3VWYuqVEFKK+2c33prKQOnRegM+JErhZq+vk9B+BvWgrCc5wSMTQWCW4yKRnXAynEkWhtAwikGogRlfNW81VIi7IRKSPTYd5yUlJj9qzG2KkSI6fLKcnK2g3XejEvJEDScQ22FnBR/3K/a6p5Yt4ZADgR56zCyzEHQfJDfSdjLPJ6VkieuG8s5eX30gTB7w76XNt8XeACsX/xEHBQfixF/1KFjs75gyXAvepX3u7NcOL8c0S9Jg19ohT7C+fI6aG0ezNsUEYF4fTIq5yXW5YvQoHuNLYtxrw4n0gMD9dadMLFVmsUe5FVfaeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENsT5hhin+FtB4y5t3GLN59D5Rk2LAajvbh/0dIBr1E=;
 b=V8GNfmboPtAINYSdLtueX/8jF/OWyavW/beKN9fA4BJ4tyeNhOfsa+3HnWMbT8p3xd28fD6m1seZLs3X5Pi7cOLDNZ3GK+tpN6sXA9cajZ6HdumFQgNRyK7Jd4HyVWmwIcLnuPXCQk0EUgIb52KsCFmUOkm7eZW3p3beW1lVW/k=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB5662.namprd11.prod.outlook.com (2603:10b6:a03:3af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 05:51:40 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::6d71:2479:2bf5:de7f]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::6d71:2479:2bf5:de7f%8]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 05:51:40 +0000
Message-ID: <8587b67f-6d5d-897f-d225-8e1b82fba8ed@intel.com>
Date: Wed, 1 Sep 2021 13:51:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.0.3
Subject: Re: [PATCH net 2/2] ipv4: make exception cache less predictible
Content-Language: en-US
To: Eric Dumazet <edumazet@google.com>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
	<kuba@kernel.org>, <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, netdev
	<netdev@vger.kernel.org>, Willy Tarreau <w@1wt.eu>, Keyu Man
	<kman001@ucr.edu>, David Ahern <dsahern@kernel.org>
References: <202108310136.TL90plMR-lkp@intel.com>
 <5c11c2e3-2d50-981e-623a-d43a897584f1@intel.com>
 <CANn89i+muzNH6nEZvPmEq5pUZbq3B-ZprFrLVw8mPd2iH8BNLw@mail.gmail.com>
From: kernel test robot <yujie.liu@intel.com>
In-Reply-To: <CANn89i+muzNH6nEZvPmEq5pUZbq3B-ZprFrLVw8mPd2iH8BNLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HKAPR03CA0032.apcprd03.prod.outlook.com
 (2603:1096:203:c9::19) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: from [10.238.2.112] (192.198.143.21) by HKAPR03CA0032.apcprd03.prod.outlook.com (2603:1096:203:c9::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend Transport; Wed, 1 Sep 2021 05:51:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd05a856-3837-447b-e5bb-08d96d0c91db
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5662:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5662E0D782CAD997506C9F1BFBCD9@SJ0PR11MB5662.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QJ0vuSTkN10QxIu4WGW+Ti1YVykDVgYIm3v+9Wm+YLxKXA3ZnzmAOfdWGV00d6l1ZI7naVkIsZBCH+kB3B9Wne//IrtPLQ6vKQqwB31EiAhfGlAkt6Ssn52gXPz9oF3nE+ueyVKcoEDeSs8LygNuVSmgGGz4UoAytU/Lpw+C47p7NmNyBu26SfsTA+6RBNT7QKvvcgrJd79kaA+wHrj6KboFuw6lT5AoSaSm7AZPQhvD25+ekRkse9N5PYY4M1U6/Bp9JiJQdxr2+qwCdmah16smyEnAAqx4s6PrhuQ2j2u2vnxuzgI6kQjInGYDxVFmsrBEK9GPA9vd0YLDE32xt37F/qxLdSP30fviPqCbFczDJf2fUkyOa4D3ugCnOPV6aFCBxM1bb3SxGPpdETB242fDAS3ZTxzgyEpX5OmHZvMoKlK7qEZiz2OCNUuBdQi24h3RXCuAejNzMUmQL7XLddUt3fqEaLCXTA8Mbk3K5jRF7bc/+mu/ibQoCqdSsaggC+yGAw+MeDW/bBIesAMJyBwcF/5m6aQstajpLIU2Qc3Ric11FU11XmF7l42F2Ib+Un8/1Iu+9TaXcJZJBMbHAZ1MzRPZ+HyCCRvErXoraKmrYyeteOhkjUFJpyb6miiDerAYiNaUBGp238rgPibCN/HGzsh3TIE+6hs43v/KIpc2yc7ig3tlBsvTbr3ANm0teRk42cFBq54VSFqIknyz59MIKSDJvEMMsXHyzJvOCSWTJ4EwGCHXrw42/NsIqCcxIp/huQf3Ka+GD33SU4kY/dj1gYs+mohvuA8j91HaeYom2oPX2iW/LieNUWjVDtG9Z8sNnESady7b0N0o0yI3ovbRBRFuQqM6zwVQ5EjCiC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(31696002)(956004)(66476007)(86362001)(6666004)(36756003)(5660300002)(53546011)(2616005)(66556008)(4326008)(54906003)(26005)(316002)(186003)(31686004)(16576012)(66946007)(38100700002)(478600001)(66574015)(6486002)(83380400001)(8936002)(966005)(2906002)(6916009)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGlCa1dVVi9lNVE5SUFrUUZsYnZudDl6ZjNJUUxlemIzbURoZWJpdWpYMnJK?=
 =?utf-8?B?Q3Ryb2tLeXFReG5TamxNZkhsYUoxVU1GeGxQUmRNejQzRTcyT0VjazRoZ0Zj?=
 =?utf-8?B?TTVmendPOXhLS1MxNmpaazUwcUlQS0xzL09pN1YvTkRjQ1pSUTJOYmp6NnV0?=
 =?utf-8?B?TkhBZHFQNmFrQUFQTVFtUFB6QnhxeVVNeFNIVVJNOTBLYkJwandEQlJWenNo?=
 =?utf-8?B?Q0grK3FpejNkV0ZvRk55M2Vhamw3bHJSZ0E0REdhZDRMb1R6ZThKbTlZOW1q?=
 =?utf-8?B?YWZSVUVUOGgyZUhzdmwrclZucmFlaWhTMHVQVjB3SFlUaUxPMGNvZDNjdjNE?=
 =?utf-8?B?d1ZUQWM0Z0ZlOGJzRm8xb0VzakhURVNndGFrLzZJN1Fva1hkc2cvdHpQTmZr?=
 =?utf-8?B?Q1NRUlFzZnhWeXBmbzVWZzFxVW9nZUZPY2tWZlBuZ2xZdUdXdHpJZDBVRUY3?=
 =?utf-8?B?RjRET3V1Ylc2RnVoSjhOM3dPUjBBNUV3VTdXc1R0dG5sbVc4ZkFpL05US0VW?=
 =?utf-8?B?c2dWNVAzR0pzMXVmRGYxbEJpeDNaMHZwenpaSGVGQldJZGw5bWZkZGxGSHpK?=
 =?utf-8?B?YnpnMCs4ZlpRVG81VmJlUnlRZ0hHU2R1c0hwQkkwN1grRm1VRmoxWXZ4RS9R?=
 =?utf-8?B?aStrdWdJSkptS3pTT1RnNWpPM1F6dVpNRzFXenRCaS82TmNNeVNseDBTVDJj?=
 =?utf-8?B?aFhRaVBXWFE2VFhOODRsRXI5RkRxNTFRU0NQb1BuaFZDVE5SYVNGajZ2clUv?=
 =?utf-8?B?MjJWWittNGxQNlFWZDVaRTZySmRiZEthM3RXTWNsckVHM2U5NFMzNmJKUDBK?=
 =?utf-8?B?Zmk4OUFaZmFRS2V4amdrWjkzU1o4c3pJbzkwQlIzc3FRK2wzZ2ZTRnpTcktN?=
 =?utf-8?B?REVUVEp2VGFWY1VwL0V4b1hxV3F5NDhDRXdmZzlmZmxldW1LYk5HSkpLdDBk?=
 =?utf-8?B?ZlBaMDM5cWdyNG5Ta05qUjdOUHNvQTZleHYxZ3V3dHk0UDZUeW9XSXFYS29F?=
 =?utf-8?B?UVZERnM5SFpLME9IL0hDc1pNVk1uNVhZTFY3NkdtN1VjZkxXOERYY1dSdkpw?=
 =?utf-8?B?TTg5NDRKMWRDY0tDTE04a1FweUxvMkNsaklxQkwvdzloa3hscWtHQTVyUVB1?=
 =?utf-8?B?TG1QN3BjN1NxMnVTVkdONVJ3Z2pFMmc2NytrR3ZKQnpaajhvaFNYbkh4VnRk?=
 =?utf-8?B?cnVidkpWcHhpODdIT3NIcHVaMkFxS1dtbE1LcWZ1V1JJaFNVTTh3aElvcGlu?=
 =?utf-8?B?amhQVXdHTUVNK0hnM1VDWEdYWi9ZazJQc2xsblhmZGk2Ty9pMmp2cExkUGhj?=
 =?utf-8?B?UU9KTHB3a2REaDByY0hhQzBCNk5WVTRiVUl2OUI5dnlrRTRiNVdpbjhJNHlz?=
 =?utf-8?B?OWpDT1kxOXdzYnJMTGpPdXJYeXI4T28wdnVTTWN4VGhYZ0t6RTlxaXNPeDNW?=
 =?utf-8?B?OXNwdW5wZ1BhR0JCTzFUdzJtaGU2ajRWY0duSnYxWVN4VFZwZUY1eVpCS0J5?=
 =?utf-8?B?MWlrRW5nWWdleUVUUHQrVmIvVVcrZ0V2N2E2Y2p3U2dHRDJWbHA4SFMzVWpk?=
 =?utf-8?B?Z21zdVk0OUZrWGhuMm54RVhodWdTZU1WY2V6RytlU2ZNMmpRQXlPeFh1YjhY?=
 =?utf-8?B?elZJbm1kalljL21NM29LbUxMYkpGbVdzN3ZsV0JkcGdOWFVDRzBSZ3lSdzRO?=
 =?utf-8?B?a1NqcFFLSXhXL3lSNElkc3g5VUZmWmdETFlwUWdnOHYwSm9tdytXbDdVKzBP?=
 =?utf-8?Q?LxALa918iLlHeRRm+GiboVxuTFikZ2MFiemFpHd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd05a856-3837-447b-e5bb-08d96d0c91db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 05:51:40.6491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOUHee/o+150DzOGy7vlkewzH8Q2IE4VRTKNzSZAgMk8YLBGQ0pMcR20TeHkw83pi9Wg4ujsGrSNctWFbvAAYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5662
X-OriginatorOrg: intel.com

On 8/31/2021 11:13 PM, Eric Dumazet wrote:
> Honestly this report seems wrong to me.
> 
> Please kernel test robot, improve your automation.
> 
> The function is only called when we know there are at least 6 items in
> the list, I do not think you took this into account.

Oops, I got it, this function is only called when depth is greater than FNHE_RECLAIM_DEPTH.

It was our fault that we simply followed clang-analyzer's note and didn't make a thorough check.

Sorry for bothering. We'll improve the bot.

> On Tue, Aug 31, 2021 at 12:48 AM kernel test robot <yujie.liu@intel.com> wrote:
>>
>> Hi Eric,
>>
>> I love your patch! Perhaps something to improve:
>>
>> [auto build test WARNING on net/master]
>>
>> url:    https://github.com/0day-ci/linux/commits/Eric-Dumazet/inet-make-exception-handling-less-predictible/20210830-061726
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 57f780f1c43362b86fd23d20bd940e2468237716
>> :::::: branch date: 19 hours ago
>> :::::: commit date: 19 hours ago
>> config: x86_64-randconfig-c007-20210830 (attached as .config)
>> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b1fde8a2b681dad2ce0c082a5d6422caa06b0bc)
>> reproduce (this is a W=1 build):
>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>           chmod +x ~/bin/make.cross
>>           # https://github.com/0day-ci/linux/commit/adf305d00ec06cb771dc960f0d7bd62d07561371
>>           git remote add linux-review https://github.com/0day-ci/linux
>>           git fetch --no-tags linux-review Eric-Dumazet/inet-make-exception-handling-less-predictible/20210830-061726
>>           git checkout adf305d00ec06cb771dc960f0d7bd62d07561371
>>           # save the attached .config to linux build tree
>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> clang-analyzer warnings: (new ones prefixed by >>)
>>
>>   >> net/ipv4/route.c:575:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
>>              rt = rcu_dereference(fnhe->fnhe_rth_input);
>>                   ^
>>      net/ipv4/route.c:592:34: note: 'oldest' initialized to a null pointer value
>>              struct fib_nh_exception *fnhe, *oldest = NULL;
>>                                              ^~~~~~
>>      net/ipv4/route.c:594:2: note: Loop condition is true.  Entering loop body
>>              for (fnhe_p = &hash->chain; ; fnhe_p = &fnhe->fnhe_next) {
>>              ^
>>      net/ipv4/route.c:595:10: note: Assuming the condition is false
>>                      fnhe = rcu_dereference_protected(*fnhe_p,
>>                             ^
>>      include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereference_protected'
>>              __rcu_dereference_protected((p), (c), __rcu)
>>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>      include/linux/rcupdate.h:396:19: note: expanded from macro '__rcu_dereference_protected'
>>              RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
>>              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>      include/linux/rcupdate.h:318:8: note: expanded from macro 'RCU_LOCKDEP_WARN'
>>                      if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
>>                           ^
>>      net/ipv4/route.c:595:10: note: Left side of '&&' is false
>>                      fnhe = rcu_dereference_protected(*fnhe_p,
>>                             ^
>>      include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereference_protected'
>>              __rcu_dereference_protected((p), (c), __rcu)
>>              ^
>>      include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_dereference_protected'
>>              RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
>>              ^
>>      include/linux/rcupdate.h:318:11: note: expanded from macro 'RCU_LOCKDEP_WARN'
>>                      if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
>>                              ^
>>      net/ipv4/route.c:595:10: note: Loop condition is false.  Exiting loop
>>                      fnhe = rcu_dereference_protected(*fnhe_p,
>>                             ^
>>      include/linux/rcupdate.h:587:2: note: expanded from macro 'rcu_dereference_protected'
>>              __rcu_dereference_protected((p), (c), __rcu)
>>              ^
>>      include/linux/rcupdate.h:396:2: note: expanded from macro '__rcu_dereference_protected'
>>              RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
>>              ^
>>      include/linux/rcupdate.h:316:2: note: expanded from macro 'RCU_LOCKDEP_WARN'
>>              do {                                                            \
>>              ^
>>      net/ipv4/route.c:597:7: note: Assuming 'fnhe' is null
>>                      if (!fnhe)
>>                          ^~~~~
>>      net/ipv4/route.c:597:3: note: Taking true branch
>>                      if (!fnhe)
>>                      ^
>>      net/ipv4/route.c:598:4: note:  Execution continues on line 605
>>                              break;
>>                              ^
>>      net/ipv4/route.c:605:20: note: Passing null pointer value via 1st parameter 'fnhe'
>>              fnhe_flush_routes(oldest);
>>                                ^~~~~~
>>      net/ipv4/route.c:605:2: note: Calling 'fnhe_flush_routes'
>>              fnhe_flush_routes(oldest);
>>              ^~~~~~~~~~~~~~~~~~~~~~~~~
>>      net/ipv4/route.c:575:7: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
>>              rt = rcu_dereference(fnhe->fnhe_rth_input);
>>                   ^
>>
>> vim +575 net/ipv4/route.c
>>
>> 4895c771c7f006 David S. Miller 2012-07-17  570
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  571  static void fnhe_flush_routes(struct fib_nh_exception *fnhe)
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  572  {
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  573          struct rtable *rt;
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  574
>> 2ffae99d1fac27 Timo Teräs      2013-06-27 @575          rt = rcu_dereference(fnhe->fnhe_rth_input);
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  576          if (rt) {
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  577                  RCU_INIT_POINTER(fnhe->fnhe_rth_input, NULL);
>> 95c47f9cf5e028 Wei Wang        2017-06-17  578                  dst_dev_put(&rt->dst);
>> 0830106c539001 Wei Wang        2017-06-17  579                  dst_release(&rt->dst);
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  580          }
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  581          rt = rcu_dereference(fnhe->fnhe_rth_output);
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  582          if (rt) {
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  583                  RCU_INIT_POINTER(fnhe->fnhe_rth_output, NULL);
>> 95c47f9cf5e028 Wei Wang        2017-06-17  584                  dst_dev_put(&rt->dst);
>> 0830106c539001 Wei Wang        2017-06-17  585                  dst_release(&rt->dst);
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  586          }
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  587  }
>> 2ffae99d1fac27 Timo Teräs      2013-06-27  588
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
