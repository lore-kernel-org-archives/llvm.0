Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2554697
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 03:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652066771; x=1683602771;
  h=message-id:date:subject:references:to:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V0KVKSpjdQAle7FAEJjDRRMw3Xr+uI2E6tS1O3h3twA=;
  b=JY1PuC3EqjjFWyoJSTHfiQ7Y2pfijqxRNHsMNr5Fr1LkSL49DBA0k/Zn
   JnkyyGVLHaOIz6STIQLTprZqMy3ls4sn/cxP5tANET90s5kyAgvyV5Hce
   uQFd4pvlsOnFZm5c4GPZD1ngKtVBzHAPYSGg9aDXt7TdxNN85US5FRXAk
   9PBzLJyGcCCjxLt3HBx7yMwES7bqWPKSP0/imVxZ89euXjaGLeHn3JzsN
   bHzSMMTkm3iBSW3jVNxvdYEo9nMWhDY8I/CYPW4AaE2PyIZL5n9bjOBTz
   QA4RmJApao6EUgj8aPawX7kCyYBFZ9LyLQEPZ+0Dj+HfhdvpIJNqMth63
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="248828126"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="248828126"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 20:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="550810424"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by orsmga002.jf.intel.com with ESMTP; 08 May 2022 20:26:07 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 8 May 2022 20:26:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 8 May 2022 20:26:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 8 May 2022 20:26:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 8 May 2022 20:26:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQVQGnRcmVHulesxH4P+fEdiKxP8+vdg5wIx0rGo86faZmc5ifajNzj7v3kWdBopKUw9Ahla91VAT7p3ybDtigaMB6c9L+teSZ2XsnENUmCt1lKvt85K+GYaucshDjVo9Alx0dT2Yx2/im5WoGtp5Vfl0VlZAtu/M1I0e4EfTRucY+2E/ETn+OY6+ngpKC7BWRbKO2P6c9WDL4gwxzIogPSWOnR6+x/9ZDOonyqfo5/DjD/RNPRjTpBgRaQBiJMajqstPfE2jVTUtvwDQrlv8s9zbhbajFa5rMJHt07elBYMsab73+1RzHMKSD8gXl2ubyC5B4QmSBwhLvgwzxM3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tX8UVsyUCEIfxaHHBLiWVGw3TM/VJtVuzCKIHBb7Wc=;
 b=ZNqqz4u3awH0DyLsFn8d7vlT3nTEsYLonuolfnlKdDKZpYmE0TKMvRf3q+b1+kTACzfvB7BvID9S7Z5bca0XI+VTF3nXBr6kuo6g4TuE8aTsnyO9TnzgLO50FhLNQQbcNUi0y3uYDrLUxVK5U02Yd505g32pqyirays726iIIr9du0VFEQqHeJ1Lk+tkC6pcl+1cMNd3pepMQPOPuK+49CWNWMi8u3Cc9MY60mgMLQzCtHkZIFSv2qT9TMBGehAN113tFlSTZhvMV4dEc2dNKVhD3tZXXMdrWNqQ7KeoSc/s8jBtaPpnqtTirKJM6TqC6BZJVZ7ub9yUDPamGNWu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 by BYAPR11MB2806.namprd11.prod.outlook.com (2603:10b6:a02:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 03:26:04 +0000
Received: from MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::91fc:35fb:9ebc:81ec]) by MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::91fc:35fb:9ebc:81ec%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 03:26:04 +0000
Message-ID: <028fae20-bb0e-183c-e0f9-041a0b50bbb3@intel.com>
Date: Mon, 9 May 2022 11:25:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: [linux-next:master 9659/9759] drivers/nvme/host/ioctl.c:693:2:
 warning: Undefined or garbage value returned to caller
 [clang-analyzer-core.uninitialized.UndefReturn]
References: <202205081711.ssgxsL9Z-lkp@intel.com>
Content-Language: en-US
To: Kanchan Joshi <joshi.k@samsung.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, "Linux Memory
 Management List" <linux-mm@kvack.org>, Jens Axboe <axboe@kernel.dk>, "Anuj
 Gupta" <anuj20.g@samsung.com>, Christoph Hellwig <hch@lst.de>
From: kernel test robot <yujie.liu@intel.com>
In-Reply-To: <202205081711.ssgxsL9Z-lkp@intel.com>
X-Forwarded-Message-Id: <202205081711.ssgxsL9Z-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2P15301CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::12) To MW4PR11MB5933.namprd11.prod.outlook.com
 (2603:10b6:303:16a::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57ea8c79-e829-4949-7146-08da316ba5ab
X-MS-TrafficTypeDiagnostic: BYAPR11MB2806:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB28060A06978CBD737EAFD01EFBC69@BYAPR11MB2806.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: esH86PI1eXOnPesfv4GiZr+Kh3py1xmpPIPwMOQqXlGIumMo4NEH8SYcZHV3jZwgllxQFpdgtfVcXnhHScJuygTXbuo1qwYIaYnCopS0GTCOSDJXLfXfnVspydA4I7HmIIvuDevdf5keg2notK9d84zwSARFjcK4U4Ckgws92RX01iG1xBU4p6EKXVtoWS2DPmuhjiMxOn4B7n6QnWBwUFM5gATUA+Vf7Av66mVBcaQZLPVLUY86tPm+h3pTwoyk9+a87P/ie2mGSTatRMYfCph20JJT50UG1npaNyETiQKVqOA0s5dqqbvu6Fu2TKan7pAFy+fc6lL9RJ73dbay0vDxrgjBqMTeAclMvI8EpyOwuVlzaBWgEP3g2rTJw7sDJnc3MbuiDuB4qrpq4v7iPfROaKnMnG9sTx9WculBAR6xL63DWCmt/Vkbkd7LYEawBebHgXTxhRX9jCNZJz+k/MWipv7YSSajhdrkGLlOrf1GJqVkZJfAaoNm4+5Ebu2D/2uczdNjIVoNhhKDs/cqwfbY7BOukhr9gm0UNf1d3TxKrWICpC2P79jx1DlasqUKx4ZVeeElGOMKIphDkg8tuc4do1UOAm49gRS7A06dWh7F0I9Ce+e+FbgcuL2YNZbT0gC+Vm7IdKIG5C/h8DKh5k3kcv7lsQxK/FOuJuXqoZzvzSw3AGOlm7agqPfHF8B72Z4bf5Yc83tZBxZ1dOnUuGnYsUXMhWtEqWTMFEqWZJQlNI1kg9gqPU9ITk464tqGfrVw4V+ihzg9nAaYwqJZj/m6v8ZaJhMBltz713jb69iQfQXblwttgCcgUvqvwMOASKmAYZ2hgUDxh+WrQFuoMsfXGKZbwM2HdckX2Ualxgg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5933.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(86362001)(38100700002)(5660300002)(36756003)(82960400001)(83380400001)(8936002)(6506007)(31686004)(26005)(6512007)(66556008)(6486002)(66476007)(508600001)(66946007)(316002)(966005)(54906003)(8676002)(31696002)(4326008)(6916009)(186003)(2906002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjVqUzk1UGVMREdOYmdTYmVTMWFBVFJWa0lETm5mdUF2WktvTVRHeTJTRkNX?=
 =?utf-8?B?cHE4bUVxcnNrODlGM2JRMWg4Mk1xWkdOTnRWakVrN21HVFBrL1dMWm43Z2s3?=
 =?utf-8?B?TThTNnVkdzJWbml5ekhPTUR0cXFKbkk0WlhFME53dHhpRWR1OS9pY2UwcWlr?=
 =?utf-8?B?K1Urb3l6ZmgzRUlMNzBKcEV5aVRhNWZuN3RmK0FGODNhMjk0UHpXc211ZmV4?=
 =?utf-8?B?R1pmajhvR1hlSEVtbEovZjZWLzNVUklXL1QvYkRUdUVjZ2treG81OVFUemla?=
 =?utf-8?B?bUVrNWxnSmhmbG82TFBCTmR6V0E2M2RvTTBzOWs4RmFwbWFET3oyWXRETUw3?=
 =?utf-8?B?ZzVIbklNNjVod1VIS2ZSUW9ZR0tDOGtWY1c1RE5MMUJGbzNrSXZyQ01JVWFC?=
 =?utf-8?B?M08zK2YxdzRBdDJhRVJ2akg5c2creHppWkhiZ28yVFIwK2V3NmxiVWNoK1BW?=
 =?utf-8?B?QnViZ0llK0d1WEVuZmdRZ01ybUtWN2puZUNiYVV0VlNZdDJXdDgvYldmVDNF?=
 =?utf-8?B?VURZZlRLUUxZMTEwSzJxQzgrWXFnTjg5UTJhMklsR1p5UFhZdHU1LzM0VHJR?=
 =?utf-8?B?aUp5Y0lmV3BweWVMcXY1TCtLaksyRmJpV3RGeGoyc2ltSk9BS2pXQituVUp3?=
 =?utf-8?B?R0EwRlNsTEJPTmY3ZXNWOURrWENJNlE1a3d3R3EwK253Z1JIMk9yVE4rR01N?=
 =?utf-8?B?eHM2b0R0ZWtqYmZDL09welRNVXBncWNhbWFrdWdVbDNJUzRmdmU3b1I3Nm9n?=
 =?utf-8?B?UjhmZkFoOGFFVUU0RFREcWl1dk5Ub3N2ZXdxZTZHY3dEaFBxM0t1MzRkSnky?=
 =?utf-8?B?aWRUQWZSMkp6bkQ2QjBTalQ3eUVtL0NZdlgrcWxaVk5KY3VjREpJMHQ5S240?=
 =?utf-8?B?eVk3RzVzN1VxOGEySElSKzJrZmlDeUZxck0xTGtCYWsxRE8ycW9oZEFvS0pv?=
 =?utf-8?B?N1pqbmkwdjJQeFRNbFd6OW5HUW15Q21KcXNGd1RHbWU5UjYxOE5CZFFmdDRa?=
 =?utf-8?B?ZDgwMDR1VzhhWXhzZGtIMHlLYm16ZlFRekl0am1rRW5YdFpqelFWZ25jYXIw?=
 =?utf-8?B?cTJWQ3JoVVIrcUFkamROazRWcGFxN09vMzVtZStBcDhhdkg2eFVmWmg1cjI0?=
 =?utf-8?B?elpoV2hoRjhZaGxybFNwWk9Td21aN0g0UGhuU2d1akpXZEhsNlFCdzJqSlVJ?=
 =?utf-8?B?ZnhQNTVFcW1aaE5sSkxtUU1aWEd2RnZrbVF6enczbXFKTUFXM3h0K3I0MWlM?=
 =?utf-8?B?UUtUY3Jha0psaTA3SHF2dmY1Uis4S1N5bVVaVkZLdE03Y1ZoaWxCWVVLaWMy?=
 =?utf-8?B?cEsvTDhhb2RwbUZGcGhwK2o5UGM2ZEtrT3kvVWhNalpqbnRxaUxnWTNCZzUr?=
 =?utf-8?B?aFR2L1dleWxnTDJTOGRKMDdBZ0paTlJRRDZ1b2FkOTdoRFQ0U1A1Y05PU216?=
 =?utf-8?B?MndUalcyOG1VcGtSSzd3dCtrVDJncWk5Yk1XZXhhWk54czV6cWNBTzc3bUZI?=
 =?utf-8?B?bjlBQ0JNVXdqc05kOUNHQmJLendFUzlLZnFqSzcxYzFrbW9WU3dPdDZsVXZz?=
 =?utf-8?B?Qm1qL2VpOFUxTjB6QURodmRTZlgrOHRaMC9SNXpoRUlNQXRPTytUUjNCY1Bn?=
 =?utf-8?B?T1lCNWJrS09vdmFlS0JNYTZDd0N0MHZCY2N1WjVaeWVQbFUxYnQwNVRNU3dp?=
 =?utf-8?B?M0M5L3A4NnRjZzFBRHVCVkpLTWV3aC9LeXE1OExZSmdxZnJKTXdyK3BkRzNI?=
 =?utf-8?B?RTh3R3UwZ2l3elhnNi8xeENTNzFaVHNYWGw1cnp3aDVIMlhkRzJyNDVVRkdR?=
 =?utf-8?B?ZkxiczI5RXpTc2trTFVBRG9wTTZEZUJvK2VySjdZVkhDcnNBS05nWnhzZHRx?=
 =?utf-8?B?Y2xTNGtoWTh4Y3dlWVZrNDJFOWtRSDk0Z1ZjQ0FHdk9lVVozLy94RnB5TTVM?=
 =?utf-8?B?K1plS052SURVSDd1Mmo1MmI5ekk1NnVIcVBFeEZ6L05DWVVrdlVLSUx5NnpD?=
 =?utf-8?B?WjdJT29LQzVvTWF5SWZqUWFIQnVpYjdlZkJWQlpCUkVzazNJa1E5ZG5tQndM?=
 =?utf-8?B?RFkvaUxSdlIwNGxtYytGUlJ2NXFIU1lMOWtiSUpaRXJibDhCeGJ1OWtDTWFM?=
 =?utf-8?B?enNYZGI2RVhNUGt5M2w2M2t0WTRwSnVhdG5paThrdFc0eXVDeDA3bUNYUXdU?=
 =?utf-8?B?VnpUUmF1aGpvWU44ODdMZUgvN3JoM29WQmNyRDc4QitSVlErVzAxQ0ZtdVY3?=
 =?utf-8?B?RUdvdk1FV0RlZ0RHNEJGRVpnMUpHZ2J1enpINmtZVjR2WGdXVDBpSEkyK2hm?=
 =?utf-8?B?OVZvdDlQMDUwcncrVDkyUjVPR09tTHAzbzV1Q3k5NkFtWFFPUENxQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ea8c79-e829-4949-7146-08da316ba5ab
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 03:26:04.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Egihd0Wug9oNvy2EaZUG3x9JcdyB0mh0AutLi2Gu3VkTxMm3QxRk5ht5OyuDgKAu1oMTcNeZfnvmjtnIQA0BFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2806
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 86116c2f6fee81a0be72a71cc2f1f7c087df8efa [9659/9759] nvme: wire-up uring-cmd support for io-passthru on char-device.
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220508/202205081711.ssgxsL9Z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=86116c2f6fee81a0be72a71cc2f1f7c087df8efa
         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
         git fetch --no-tags linux-next master
         git checkout 86116c2f6fee81a0be72a71cc2f1f7c087df8efa
         # save the config file
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/nvme/host/ioctl.c:693:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
            return ret;
            ^      ~~~
    drivers/nvme/host/ioctl.c:688:2: note: 'ret' declared without an initial value
            int ret;
            ^~~~~~~
    drivers/nvme/host/ioctl.c:690:2: note: Assuming 'ns' is null
            if (ns)
            ^
    drivers/nvme/host/ioctl.c:690:2: note: Taking false branch
            if (ns)
            ^
    drivers/nvme/host/ioctl.c:693:2: note: Undefined or garbage value returned to caller
            return ret;
            ^      ~~~

vim +693 drivers/nvme/host/ioctl.c

86116c2f6fee81 Kanchan Joshi     2022-05-05  680
86116c2f6fee81 Kanchan Joshi     2022-05-05  681  int nvme_ns_head_chr_uring_cmd(struct io_uring_cmd *ioucmd,
86116c2f6fee81 Kanchan Joshi     2022-05-05  682  		unsigned int issue_flags)
86116c2f6fee81 Kanchan Joshi     2022-05-05  683  {
86116c2f6fee81 Kanchan Joshi     2022-05-05  684  	struct cdev *cdev = file_inode(ioucmd->file)->i_cdev;
86116c2f6fee81 Kanchan Joshi     2022-05-05  685  	struct nvme_ns_head *head = container_of(cdev, struct nvme_ns_head, cdev);
86116c2f6fee81 Kanchan Joshi     2022-05-05  686  	int srcu_idx = srcu_read_lock(&head->srcu);
86116c2f6fee81 Kanchan Joshi     2022-05-05  687  	struct nvme_ns *ns = nvme_find_path(head);
86116c2f6fee81 Kanchan Joshi     2022-05-05  688  	int ret;
86116c2f6fee81 Kanchan Joshi     2022-05-05  689
86116c2f6fee81 Kanchan Joshi     2022-05-05  690  	if (ns)
86116c2f6fee81 Kanchan Joshi     2022-05-05  691  		ret = nvme_ns_uring_cmd(ns, ioucmd, issue_flags);
86116c2f6fee81 Kanchan Joshi     2022-05-05  692  	srcu_read_unlock(&head->srcu, srcu_idx);
86116c2f6fee81 Kanchan Joshi     2022-05-05 @693  	return ret;
86116c2f6fee81 Kanchan Joshi     2022-05-05  694  }
2405252a680e21 Christoph Hellwig 2021-04-10  695  #endif /* CONFIG_NVME_MULTIPATH */
2405252a680e21 Christoph Hellwig 2021-04-10  696

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
