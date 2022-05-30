Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9C15AB
	for <llvm@lists.linux.dev>; Mon, 30 May 2022 03:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653881143; x=1685417143;
  h=message-id:date:subject:references:from:in-reply-to:to:
   cc:content-transfer-encoding:mime-version;
  bh=K+Y5OQQgiT2Sas7sJPBw1csx32cxAueejGkfhbYJ7oI=;
  b=BCOVYgX7Ui6WuNcGPEHmg8p6wA2H1VFoO4/leTtqVvPoCpLbwOyXhY/Z
   MntjfWlB05WXdBAwa2wmmoKdysLM33CEhqzqfGAoG5s+cKChjLmhLzuF3
   Ua2vMqtLFbLS0OtSem1CQNsgJb7OckipQUFBdKSEXzsAdzNMXkgIJMXfG
   6iEoXDRSLjV5NbT+NgioqFA59UBiyaCnbVkGBzBmTuIzLVAEf6FJSp/xA
   TYdnDwapX3SQcEWQ81ajnxRtQvqKlsvmG2zk1GFmjrVx3VaxKf1qqLrS3
   yJRdTdA+fTiH6tN8zT0LmUcJwS26Pydk6BDxQuWE7aq4GdZ6N34VIdn6D
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="272450576"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; 
   d="scan'208";a="272450576"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2022 20:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; 
   d="scan'208";a="551156882"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2022 20:25:42 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 29 May 2022 20:25:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 29 May 2022 20:25:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 29 May 2022 20:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhEPsLtsMNSea1HmdhfTb3suG7Qs90PfrROhqvuw0exGvbQQt1NBAYZI4D1BHWGgvvdvMJ+YUiySeP56Y2qryaxvlyQpAbyyZWmrRHtQWS5VbFjl73nImZgYMezGSfMbK7LcWof1TfDmmUxr9qYTTz+QWrXVNc9xQPDAOea5nA362J5+OurdpWdy3QXq1/m0Gnzve6XGV0i/VhM36en0c56drOjLxjPv+ePI9QEdNOQsqOAmF+5B6/mrYPyopINEglba9U9rSnMd7ETqhDSWPQXKwN4WyrOV+houvs0rE9AgIy4K8d//QzDQSY9qBI4X/oKaA8C1yy+wOBDWyOhOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLEEErR/EPgK/+nPGgmi2PhVQvQqfusRpgqZmU+OVos=;
 b=hYBDZcSxt/lDxEnHhER8u1P70bgwn/WfpPXudz5YglNUVtjxQDOD/L8cSjS0c14kezkz1gEtp6pTvTTTOMtDtiTHGSuWChJTGhWSOYTXEME2lIcU+6Ovi9if2xxEzG3gdAKziNirnK1LM1o4qoBUjhSZnv9JE+da/jVruibDyW9VdXy2528ESLLM7kKySCzFLwfBh95gW6Rw/3ozR1EQXQuTcXBP0cRbF1sn4N1tuHjft5LmAoNSbvLxoanq6RwmS327iDqjP1lvwE8fj3yuNM5DBjMtyPL7aTS0SFBTZ8IzmePVJy7bAyrkbnwl7ZHFan1Vhwftuuw9MeWfqlP7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15)
 by BYAPR11MB3720.namprd11.prod.outlook.com (2603:10b6:a03:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 03:25:39 +0000
Received: from MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::1169:fc9:c1ef:248e]) by MW4PR11MB5933.namprd11.prod.outlook.com
 ([fe80::1169:fc9:c1ef:248e%9]) with mapi id 15.20.5293.018; Mon, 30 May 2022
 03:25:39 +0000
Message-ID: <8a2c0318-ba75-a563-a86c-dfc34e9c1fdd@intel.com>
Date: Mon, 30 May 2022 11:25:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v6 14/22] dma-buf: Introduce new locking convention
References: <202205280550.MWGs9cj4-lkp@intel.com>
Content-Language: en-US
From: kernel test robot <yujie.liu@intel.com>
In-Reply-To: <202205280550.MWGs9cj4-lkp@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
X-Forwarded-Message-Id: <202205280550.MWGs9cj4-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0208.apcprd02.prod.outlook.com
 (2603:1096:201:20::20) To MW4PR11MB5933.namprd11.prod.outlook.com
 (2603:10b6:303:16a::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7d43f29-1c11-4be2-1ad4-08da41ec1191
X-MS-TrafficTypeDiagnostic: BYAPR11MB3720:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB37200A5248C2E7E63A991653FBDD9@BYAPR11MB3720.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bE2CvAn0KDqDJRf8/DAaPB9utjPFNHAU4T//Ipd6g1XmXR7NwEbHrZPwsEblS3bfoBUN/IVOyF35TwuCkXXV+Je5ULfjZrlSHwfYhlaIOQY9hlrmjGA0pLph8umU3sPHoxQ8B6j9e3VqgWc0j4roQnJFBS6743vnWjo/TT9lxhCYqY/wu243lB+SeHfHmMlRIrreSalhTTEqXxyWklfPJLgPO9Rb2CTTA/n4oWoeS205IRrypDqoJ93nJSrD03ndc0Jv/MLCEq1/0LKVKe4fF681A9UozkZ8CVEuBAy5Ckrpcc+wds5aCvHm/HEG58wvPHXOPkdnJdIh3UR6F6X84Dyxz9qgzc3X+1CmjdeDJP5HefJt0n3Y2z853tSknPK5Akp63EbJUDbzGESKx+qLpYrsvM+v22j2EKRhZ3+V6z56WeZ3ro/72lmpgQKuB0Xe/EW455R2dLz+/RDQ+g32zCaDoQzyPmAm8Acb3YInKtdMwnA5fRtMHN8j9xaZg5KJV6F/CwS9iSnKkiC/cjJq0X8T6qdmDcO82ynyzjy+fjzQUwLyysczlha+enPG7MtvKzxJdh+kg5Zd6cXhwIWF2fVJVfyzsMN25vXmxss05S1cKhHpsUw8rIFFiKJRO7KjAF5OQqGGEu8slRZ0ZZC9CBSIo0NJpKex3TNwh8QGh4eEP0qitVKGXlx1LqG8zX/3BeaF20nxa8shrL/QswkWsNkvVvWzZ9AKRuBCyVlg+9shs5TTRNYbnH4b5VE+AwmAK6cWnFMXg31aglIzWqC+Xq8p4zkp8BJyPtVZRcYYBig3dOIPel93p83GgAyOYI34ouW+O3zUQ8yH7VyMZeeXWXyARXItfQ7eyexR0SkxoeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5933.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(83380400001)(66476007)(31686004)(66946007)(66556008)(82960400001)(31696002)(2906002)(186003)(8936002)(38100700002)(2616005)(4326008)(8676002)(26005)(86362001)(6666004)(6512007)(508600001)(966005)(6506007)(6916009)(316002)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVhJTUs3NmVxdTlpazhjYmJhYUNaVFpGalNNRVQ5bVBXbHV6OVJ1MENGYU1S?=
 =?utf-8?B?c0NQZE83YmthaThtTzk5ODFjcGZyVk51N3hTUGxDNDFlTlZ1NW5JQ2ppNEpE?=
 =?utf-8?B?VUwxK0lkc3pLZnlnai9Kak5EdXV5N1RZRUpYc3VFd1JWbzAwMGlDcVgzNEE1?=
 =?utf-8?B?NDVxUWZOVXpPa0ZFUjJFMEdIN3UraXpiZUlPKzcxMWJ4dFYvdlliQkdxWkpK?=
 =?utf-8?B?M3hkdlNqNHdpVkowTkdTRzFPTmpWdTRDVWJZUFdsMVd1UndWcUtRS2l2K0pE?=
 =?utf-8?B?amZXRkFXV2RMZ0lzaFJhWFV1M1hrU1h3TEJsTmVtM3JqY2VKQUN3RHFiSXBE?=
 =?utf-8?B?WlQ0RWprL3d1aU5pV2RWWG9lQUp4S1R2RCt2OFNQRkNaVEtlOFZERnppaHo3?=
 =?utf-8?B?SXJkR0pmVm9zMkd6amVrVHYxZWlqd3k1NUEzSjRXOWs2WWhlNDR0THNRaVBC?=
 =?utf-8?B?ZWgvbFRVTXNoSEkrZWthU3hQc29qeGZhTWhkZEUvUUFHQlVhR2cwSEZxYVJa?=
 =?utf-8?B?Q0JjeTdxaWlDM2pBZjNXNzZsdGdwMlFYUStoZXNjZklRNGovdGhwUjcrSXpa?=
 =?utf-8?B?R01vVERtbS9rMVNUcXI3T0VZT2tuREZIOEtOZkZQWDRhMzhINVpoNVprUGk4?=
 =?utf-8?B?VVI2SDBEbVNFVG1lc0tNTTVWV3lxa3dIS0F6ekxmWTM2UmtxdSt3SHJFNmJO?=
 =?utf-8?B?VHdGbGtEbUhGL3ZjcWlkOUwyR09SUzF0RWRkSy9zcXI1all3a21Ua3N1NHND?=
 =?utf-8?B?RXhmc2ZDTjNObWZoWXNsajBwcGxkZ3NkT1JkSDR6R0NtTVJFb01ndk00bG1L?=
 =?utf-8?B?UVZMYUdFSER2VGFVOWZEQ05NSUV4eEF5cXl4bkNCMUlETnNud3RFVHE0bTRJ?=
 =?utf-8?B?VlZkRzhINDF5d0Y4ejd6NVJNblBxdVpGUFpJVWVPcnpqN2VycjVKbFlNQWdL?=
 =?utf-8?B?WVFqNysvNUVDWG96eVZPaG5PS25oTkNoM3FEYzFMZWh2c2Mra3JsRVd2dytK?=
 =?utf-8?B?VnFOYU11cW91SHZONUtGdmc0NUFjM2xnUU8wNGhWaUVncElTeEt0UjZjdXVR?=
 =?utf-8?B?U1o2UHBJN2NiclVueEIxOXI2OWJLaUEzYUVOMzI0Mjc0eG9iM28vSlFUMjA0?=
 =?utf-8?B?eVBUdkdHeXE2dWRtdHlmakIvQXMxczR4QUMvTityRWJtTmVkWS9PUDJsTkE2?=
 =?utf-8?B?M2g4VC9OcnFvVzA4MmZSZXZiMjhvSUovaGlHaXNCaU9ENVUxQWF4TlRyNmc4?=
 =?utf-8?B?MmFEU3ZNRDhZNGFEckQzVGVNZktka3VtZ2ZseE5SY2cxRE1rcjl0MDBHVE1T?=
 =?utf-8?B?Vks2Z1hEUlZyT2swY2gvKzN2bjFOcnFXVG5pcSs0SWJ6cU1EL2JhNm1WUzFz?=
 =?utf-8?B?bHBGWmdDbHZaY0g5VHk1R1IrVVNwZi9hVTNSNVExYkxRRHdDYUdRSUxOWkto?=
 =?utf-8?B?MFlOdVNPVDQ0bE1pL2xFYWJGTHZmNTRrUnZVYTNic1MxMGZBRUhZOG9VeFhO?=
 =?utf-8?B?N3YrdmtzMVJYWWYwYXVjN3hDa2x1ZzZOcklnb05qM1JhdW11WnBQQjVHWVh1?=
 =?utf-8?B?bjViQWFuRWF4U2h1M2g0UkJSQlVyMk8wTUJGc0F2SXo5WnU5WUZGaGZ3bXRZ?=
 =?utf-8?B?L0dmZ2RhQ1ZMQS9wWkdWcnUvUG9EZmJaUWNDMTZJOHFLVmlLS3JLMWQyZFFM?=
 =?utf-8?B?bm4rN3dvZmdvMDNuN1hEcjJhZlBDM0NPMmkzOUxSdVBRMmFYVFJCV096dVJp?=
 =?utf-8?B?aDY4RTFxa3N4akljejFpT0ZIb1lkR2tkY0FwU1FMVWZFV3VuSmp3NG1vRldn?=
 =?utf-8?B?ZlBiVTJXandnczZRaVRKcG1UVmlJUmRBdHk4OVBuc0psVjVBWDI2c3ozK0FN?=
 =?utf-8?B?dkFaaGxUanppQU5FQnYrRE5WZ0VWY3NjaG5MaCsxRTNJT1FPSHFWbjdwemZ0?=
 =?utf-8?B?eTNBUllrYzBkVGhLOUViaWpLRGJEOHNnQzE2ZS9kTGwyNzlFY05QQjMwSDBY?=
 =?utf-8?B?OVAzOUZzU1E0V29wSG05dzI4VlRHaHRMZzAvdmxsdmhmYkZTVlE0RGlWUjZh?=
 =?utf-8?B?d2t3YVZ2S2UxWDBUQ1dKcVBMSVNkTEhyRmI5WXIwcW8vY0JlWDQybWVkVTNF?=
 =?utf-8?B?N3BOcngvT2RlckJCZ1VaSXVuYkZWc0NMNDUyKzRLbWt2bEZaYXdPTVRUcmVn?=
 =?utf-8?B?WC9pellJVHlKR1hVMjdyR3NiY2svQXVSaGt0T1EvMzBoTFF5dTg3aG95RUF0?=
 =?utf-8?B?WU40bDQ2ZTNkR3g2N1FabzgxTEh0eDdmTmFYMGlIdWQyS1l0SUZMcUJseWJl?=
 =?utf-8?B?N3diWWJPeWh0R1RkSSt6VjZ1UWVuUUpHaG9GckZpa0Ewck9TcitXUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d43f29-1c11-4be2-1ad4-08da41ec1191
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5933.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 03:25:39.3530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11Fj/kaNLNp6eP+LpeSCWyZa6O/BrC1gaND0xNwooB0HTcDV+9MrgOizc9MGe23eTax2u1N+5xMGewVfrkxvWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3720
X-OriginatorOrg: intel.com

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20220527]
[cannot apply to drm/drm-next media-tree/master drm-intel/for-linux-next v5.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220527-075717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cdeffe87f790dfd1baa193020411ce9a538446d7
config: arm-randconfig-c002-20220524 (https://download.01.org/0day-ci/archive/20220528/202205280550.MWGs9cj4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install arm cross compiling tool for clang build
         # apt-get install binutils-arm-linux-gnueabi
         # https://github.com/intel-lab-lkp/linux/commit/97f090c47ec995a8cf3bced98526ee3eaa25f10f
         git remote add linux-review https://github.com/intel-lab-lkp/linux
         git fetch --no-tags linux-review Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220527-075717
         git checkout 97f090c47ec995a8cf3bced98526ee3eaa25f10f
         # save the config file
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/dma-buf/dma-buf.c:1339:3: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
                    return ret;
                    ^

vim +1339 drivers/dma-buf/dma-buf.c

4c78513e457f72 drivers/base/dma-buf.c    Daniel Vetter   2012-04-24  1327
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1328  static int dma_buf_vmap_locked(struct dma_buf *dmabuf, struct iosys_map *map)
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1329  {
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1330  	struct iosys_map ptr;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27 @1331  	int ret;
4c78513e457f72 drivers/base/dma-buf.c    Daniel Vetter   2012-04-24  1332
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1333  	dma_resv_assert_held(dmabuf->resv);
4c78513e457f72 drivers/base/dma-buf.c    Daniel Vetter   2012-04-24  1334
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1335  	if (dmabuf->vmapping_counter) {
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1336  		dmabuf->vmapping_counter++;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1337  		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1338  		*map = dmabuf->vmap_ptr;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27 @1339  		return ret;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1340  	}
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1341
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1342  	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1343
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1344  	ret = dmabuf->ops->vmap(dmabuf, &ptr);
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1345  	if (WARN_ON_ONCE(ret))
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1346  		return ret;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1347
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1348  	dmabuf->vmap_ptr = ptr;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1349  	dmabuf->vmapping_counter = 1;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1350
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1351  	*map = dmabuf->vmap_ptr;
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1352
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko 2022-05-27  1353  	return 0;
4c78513e457f72 drivers/base/dma-buf.c    Daniel Vetter   2012-04-24  1354  }
98f86c9e4ae320 drivers/base/dma-buf.c    Dave Airlie     2012-05-20  1355

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
