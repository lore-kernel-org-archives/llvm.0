Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B012F28
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 03:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644463378; x=1675999378;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=/OvOyw0GZcPqzJV2IjiUGCjxy0P/tIqPg5uVnZJlzyY=;
  b=T+zorb7VfKIfgYSgBMtFoaN4weP3YZO79t6KjHvcwwAtLM8OMDtuuDP1
   xV1mgoS9iQZ+Et/r0oKPCdQDfPYL4vgPvx1RhMVNzScRh1ufUdGTErAch
   NbRLpuMNhshE3cA4A/D5QiHiMkr2Jey/mHZju7gJnTiw0/v+768Mcm/0K
   qtkIbM4zVZFtvHfBjdhSOoLLiXUWm8sZ4nc6qCzpvrNrqqjlG3oxv2J//
   778wlWlFZmKc7AgCUMMIf61sHpsmFUPXzxS5h/ySpNlbO8tgC0jxqsPWx
   AJO9b57iNudVgsxspUy9Lkq29w/1PH+qqkVUPcXk/chWY2+HFbQT4wGAq
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="335814042"
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; 
   d="scan'208";a="335814042"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 19:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; 
   d="scan'208";a="482587873"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga003.jf.intel.com with ESMTP; 09 Feb 2022 19:22:57 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 19:22:57 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 9 Feb 2022 19:22:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 9 Feb 2022 19:22:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 9 Feb 2022 19:22:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BV3MPwKnEW9dFcOQqPUliRUbTa1JwSu1SxSQSf4NTsYSnOFtKCQKiTJXjO1q1r+zmskkxV2DkZsmWf6bVHza6uNQJDUtQmhCb3kXeMH3DZ4sT2QegDOWdqa4ewIQcnJugfVNMfEVhvE5HjxLPBwCcHrXVXnrFLGGB27MFMGtI10h+7c3QLCbikzrMVkWz4z5HbQgJLcYJ6OUkdb/3QHVaJu89JrD1loeiIoeLmwGonmbM0Fdn9pwtNaJ23LHLnNnU7ds6FbVdzVq3WM32GhLivRkW+vyE/XlLiuaqkODEW9Dtj8gjqA9Agg96Pl6hK7JVkWpAps/KdMrrebX5IkRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HtDA+KIsK2eaarqQV42WmgmjnnE3WmPnZoNuFn5YV0=;
 b=hhVbEX+AM/naKp1p/xIXjhswx8yO0wdH9i0GSLqhD6BOFZwrtv30Rjc7OAOhb/729rW+BCorctxii+4M9OTcMhtZkdfLF+EuAZuPzfipTTZEDbZ0Ryw4nlpQqhwRlRX8OCjA1oGaQ22JbnzrAWm+G8hI7Jdwlfp37z0YwDcjDJW9qmR3mdNPuErQYTaJWF9cWYdEZ5/+rCCW2Qvhtz9NC23ZKQpPoEvMA7L12iS5/AylRwvBoVwDoxgBsaYGacxvXmnylUp2tvrAgppCHPwY4ElWTjmeJ4i49A1KPujkJ4tlM3lcTWs1MS0jQuFHnBsfEZ8vj+JFoWiPjPLfVy95aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by DM5PR11MB1722.namprd11.prod.outlook.com (2603:10b6:3:f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Thu, 10 Feb 2022 03:22:54 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d%7]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 03:22:54 +0000
Message-ID: <512b9231-e789-5acf-f3d5-6e1d5a84a675@intel.com>
Date: Thu, 10 Feb 2022 11:22:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [PATCH v5 1/5] drm/i915/gsc: add gsc as a mei
 auxiliary device
References: <202202092218.JQby54ao-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202202092218.JQby54ao-lkp@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202202092218.JQby54ao-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 865f0b8d-dbf2-4817-1c87-08d9ec44a06d
X-MS-TrafficTypeDiagnostic: DM5PR11MB1722:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB1722EA84F0674CD02F6D42F1FB2F9@DM5PR11MB1722.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0MZrgets/M71RUrmeR76Kz0MtLdyf/dsM3db79sy+ifk8wkJVVAVFcGWDPaW8QHCrNFCPuDM4s6R58EyqiaQU3VKx78OZ4xqFQyEMVjJ9cHmVWJUn23jedc4XHxw57kWLv1VLLPi2fpNCJy9cCwovCxL9q5yH/glELT5GMlwWdukdr01pXsRi9ruEG+tAS+t9OzQ2+oScanriHCcUGyNb9BLXPdYxZcbWgL/7dvcg4mcGMWfndISZ1qSlXmTiRWuYaNYILiuaWnxRjiBtq6ScOXqB5DOEOf88SoVmcQjwwdZpJySOOyelaUiLIV9OpETMQ2NBGPpDgjjhJaWwQclNOzN2SFYh721+kCej35le+9Ssshw3qhAXZRJZd3Py2WjCl5cAJDe2SlPG0BPK15xCGWxP7xzyqvGNtjx9VpfhyJAVTTrx03gQBqE8nOvTncD69NAkpBCtvLhV7tTrJFK9wFj6Qi0L0VCMin/LejmdoDYol0Z3gsyBigxpZ+klbr/1XlP2jKBifrsYAT430T2bmfh+JyYOY/fco8jF5p4CXei/TpW7kMhUW6bEnRnbcyapeBXPVztElQPZWvIqE6wwk1Af8ILK2jj+fyMqepcro7mhfur8GeDEFL+h9RpUbv8L1x+RvNDv4dUhpJz86f4NslwW89Igc0VGNNBakUmjqf7Zn/GQ7V5oMLg/jG7G5F+vk8xqbJvHvqp0sZPWY2ZY/8uXC6sdSsbV3HTno8p1Hjd8emHd7XlJMAyjtem9nM7QzALPOe+Lnfq1DaylWYjdX+ZNtOL94cxBbeXRDaDxXqabFzXFpgMCWn4KOJLAGjPYr5o88YUqCabU0z8k7ChKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(37006003)(6512007)(2616005)(6636002)(6486002)(66476007)(5660300002)(6506007)(86362001)(82960400001)(2906002)(966005)(31696002)(83380400001)(6666004)(6862004)(4326008)(316002)(8676002)(38100700002)(8936002)(31686004)(36756003)(186003)(26005)(66556008)(66946007)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjdTMlBlQWY3U0NzLzJNUVp6Um9lYVZvODE0L0hveFJFVm9tNloyUnRnWlFY?=
 =?utf-8?B?SlZodXlUL2x2Q053SDM5ZDdEWlF0NmtvL1owSEltVS9yZUV1a3ExcW1OWUd0?=
 =?utf-8?B?TjZxVEszU1lBTllZSm5VV0o4cExPczJ0OHExd01YblAyZm5mSEE2R0htTWtx?=
 =?utf-8?B?b2NldjNUOHZzZHEwbDdvRmozVzVpVlNDa3laZVA2REtzSElUSGQ0bC85RmNK?=
 =?utf-8?B?REhSQVV3S1E1a1pGMnpNVTBCWVY3RVFWNUZ2K2RKOUVleEo3enRUYXRqVnYz?=
 =?utf-8?B?UVlCSlIrMVZFaHJ0VU4wVnZ1V2NRTklRT1h3YVdWdlhFWTE4NEViVkJVczl3?=
 =?utf-8?B?bnVpbHBrTVU4NlZHSjduMDFNOHBSR2FsN2FsSzNJYi9zNUxDeDN3SE51VGQx?=
 =?utf-8?B?RHdQWGdTakN4Zk5BMkl0Y0kzUjNsR1VUR0dkMzBUQ1R6S0VWcHI5MXdMVkhX?=
 =?utf-8?B?a3BnUlNiOW1nMEMxWmxvZ1A3MktyRmtLUmRVNXZvQ3Fsa05iRGFFTm1Qay9t?=
 =?utf-8?B?VjlmNk0yclZLZXpJZkxndXFsZWwxb2hmSjh1dUVuSnd2Y1o5c1BmSDZuckN1?=
 =?utf-8?B?aDc5WUc5NkF2NStKcEsyWTV5aDdKWjJIYk5MVjgxN3pNYXRvYllqeCt4ZjVU?=
 =?utf-8?B?UVpyNWMvSjhFQjUvUlNHQ2ljYWhvTUphT01KN05ENE85MENHK2ttdXc3UHpH?=
 =?utf-8?B?OUFYNnBKTlRac1FRSFZZZjBBRzA2N3ZhVGJCUXBqYmhQbDhwVHV0aEE4c29P?=
 =?utf-8?B?WHplV25TcFFnRGZwc3ZkeFZxUWtEMXdsQW9rRmpza2E5MXkwVWowWDd1eUFl?=
 =?utf-8?B?WWdmMDBucmxva0xlRmhYNUdtU0hTTnBRSnpxem9yWjM3emlWaU1qMnM4a2NY?=
 =?utf-8?B?b0M5bHg2NVdwcUp5MnJYNkZNMWRlSDc2OGVmenNlallVbDcwQVF1dEVxZmNP?=
 =?utf-8?B?TnZaSnh5aWt5K3dMVUV5TWdyUFByMUREVXVRRDlncmJEeHMxcU1MUHpUbFZv?=
 =?utf-8?B?ZTJUMVpYajFQUjdJaWR2eUtaWVVVZm9OY21vY2x6UGE4c0FJRExhNmcwWXpz?=
 =?utf-8?B?a2ZpdHBUd2dFZXVCdk9TVVJKZkkzVmhicGttSldoTzF2eHh2cnNFcTZmZTVK?=
 =?utf-8?B?dlI0MjZEcGRubFNjSEpDTFY5NGRqWXNXNTBqVnBrc251aHVhd1FESDh5KzFS?=
 =?utf-8?B?NExzVWNCNnlXZ2ZqU1YyeVpuTlQwVy9ZbXlWNHZyVytpZFZVNGcvTTJEcnZp?=
 =?utf-8?B?V3NWQllmU3NMeGRKSVprRXJnSzlCL1I5NDcrZVk5S2h2N2U5dk9UZXpWOE45?=
 =?utf-8?B?MElHTDVodWM2c1paUE9wbUN1MlRWTWY3NWVjeVI5NGdyMUFJZmNsNTRIK05W?=
 =?utf-8?B?N2ppOXlyT2l6NXVtWUF4bFA1U1VYLy9qZ1dRRU5aNDBLK2h0dmY4bFROVFph?=
 =?utf-8?B?TC9BUFozaVl0bkpVbXN1Rm9VYTEzQy9sb1JqQ3ZnejJxL0ZGNXFUYWo3SE5Z?=
 =?utf-8?B?dDhhWkVzdHN5cWkrdjJKWlc5OFNSTlRZOXd2cENVaTAyUnZIOVY5SnhvYy9m?=
 =?utf-8?B?VGlzMEt1amFXN21aTW0vcEZVUjJzRFJYcHg5SGh3VUZOalRtTDMvTDBqT3dH?=
 =?utf-8?B?azluR1pxY2c1WjBjMEpjZGJYU2ViQjhseEZkaVhlVzY2akVQMFRsS3hsRGky?=
 =?utf-8?B?KzczYmVDRzhlektIemFZMXhvNnEyNVJ5Wi9HUWdCZjRnNVd2azdpckNMb3do?=
 =?utf-8?B?NHQ4aVRHNDdPTHRJU2d4ZEZZQit5U1FOMzlsV25RWlZYNTZlcVJvbG56d3FP?=
 =?utf-8?B?dTZ2ckQ5Z081RnlQZFFJL0pOeGNKY1A1UmRiWDdPa2pXUDByTERjUExXbTlK?=
 =?utf-8?B?bEF2TDY4Uko4eCtZeVlOc0JRNUtDL0Nxd0tjazNtS3hiZi9OK0VyNit6TTha?=
 =?utf-8?B?N3VKR0puOGsxcVlWTTA3Q2t6bDllcWxsWGhvSFNPWlBqb0tKMCtubjh3cXZB?=
 =?utf-8?B?RW9sbTNOdW1BVVg2eTZGWXVQVTB5NVpPZUFNKzJsa21za0l0NjZTdDg2V2U3?=
 =?utf-8?B?eWdIcGNGSHp1V0lwc3gzd2JPc3lRelhzSks1dTl2eG94b25kVjN6Ymx3SVdC?=
 =?utf-8?B?djFhVm41OW8rL3A1cGtzS245cjkzc051WXNjbG5xNVNQQnRSZTVVeloyUitS?=
 =?utf-8?Q?AVd0AEcaRSbBHZczdvmGFqw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 865f0b8d-dbf2-4817-1c87-08d9ec44a06d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 03:22:54.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6AckgyXqf2x5r1SjNQ1D7dFn5BiEsvwEEFjc7LAiCroJhW29jc4qwYZNjFybps+dqaiy1NN4b1KtpSSCyXB6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1722
X-OriginatorOrg: intel.com

Hi Alexander,

Thanks for your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220209]
[cannot apply to drm-intel/for-linux-next char-misc/char-misc-testing linus/master v5.17-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexander-Usyskin/Add-driver-for-GSC-controller/20220206-211428
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-c001-20220207 (https://download.01.org/0day-ci/archive/20220209/202202092218.JQby54ao-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://github.com/0day-ci/linux/commit/3640b7d101ae88e367a0abc2cda8eb46dbab2982
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Alexander-Usyskin/Add-driver-for-GSC-controller/20220206-211428
         git checkout 3640b7d101ae88e367a0abc2cda8eb46dbab2982
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/gpu/drm/i915/gt/intel_gsc.c:109:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                    ret = -ENOMEM;
                    ^     ~~~~~~~
 >> drivers/gpu/drm/i915/gt/intel_gsc.c:112:2: warning: Value stored to 'aux_dev' is never read [clang-analyzer-deadcode.DeadStores]
            aux_dev = &adev->aux_dev;
            ^         ~~~~~~~~~~~~~~

vim +/ret +109 drivers/gpu/drm/i915/gt/intel_gsc.c

3640b7d101ae88 Tomas Winkler 2022-02-06   75
3640b7d101ae88 Tomas Winkler 2022-02-06   76  static void intel_gsc_init_one(struct drm_i915_private *dev_priv,
3640b7d101ae88 Tomas Winkler 2022-02-06   77  			       struct intel_gsc_intf *intf,
3640b7d101ae88 Tomas Winkler 2022-02-06   78  			       unsigned int intf_id)
3640b7d101ae88 Tomas Winkler 2022-02-06   79  {
3640b7d101ae88 Tomas Winkler 2022-02-06   80  	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
3640b7d101ae88 Tomas Winkler 2022-02-06   81  	struct mei_aux_device *adev;
3640b7d101ae88 Tomas Winkler 2022-02-06   82  	struct auxiliary_device *aux_dev;
3640b7d101ae88 Tomas Winkler 2022-02-06   83  	const struct intel_gsc_def *def;
3640b7d101ae88 Tomas Winkler 2022-02-06   84  	int ret;
3640b7d101ae88 Tomas Winkler 2022-02-06   85
3640b7d101ae88 Tomas Winkler 2022-02-06   86  	intf->irq = -1;
3640b7d101ae88 Tomas Winkler 2022-02-06   87  	intf->id = intf_id;
3640b7d101ae88 Tomas Winkler 2022-02-06   88
3640b7d101ae88 Tomas Winkler 2022-02-06   89  	if (intf_id == 0 && !HAS_HECI_PXP(dev_priv))
3640b7d101ae88 Tomas Winkler 2022-02-06   90  		return;
3640b7d101ae88 Tomas Winkler 2022-02-06   91
3640b7d101ae88 Tomas Winkler 2022-02-06   92  	def = &intel_gsc_def_dg1[intf_id];
3640b7d101ae88 Tomas Winkler 2022-02-06   93
3640b7d101ae88 Tomas Winkler 2022-02-06   94  	dev_dbg(&pdev->dev, "init gsc one with id %d\n", intf_id);
3640b7d101ae88 Tomas Winkler 2022-02-06   95  	intf->irq = irq_alloc_desc(0);
3640b7d101ae88 Tomas Winkler 2022-02-06   96  	if (intf->irq < 0) {
3640b7d101ae88 Tomas Winkler 2022-02-06   97  		dev_err(&pdev->dev, "gsc irq error %d\n", intf->irq);
3640b7d101ae88 Tomas Winkler 2022-02-06   98  		return;
3640b7d101ae88 Tomas Winkler 2022-02-06   99  	}
3640b7d101ae88 Tomas Winkler 2022-02-06  100
3640b7d101ae88 Tomas Winkler 2022-02-06  101  	ret = gsc_irq_init(dev_priv, intf->irq);
3640b7d101ae88 Tomas Winkler 2022-02-06  102  	if (ret < 0) {
3640b7d101ae88 Tomas Winkler 2022-02-06  103  		dev_err(&pdev->dev, "gsc irq init failed %d\n", ret);
3640b7d101ae88 Tomas Winkler 2022-02-06  104  		goto fail;
3640b7d101ae88 Tomas Winkler 2022-02-06  105  	}
3640b7d101ae88 Tomas Winkler 2022-02-06  106
3640b7d101ae88 Tomas Winkler 2022-02-06  107  	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
3640b7d101ae88 Tomas Winkler 2022-02-06  108  	if (!adev) {
3640b7d101ae88 Tomas Winkler 2022-02-06 @109  		ret = -ENOMEM;
3640b7d101ae88 Tomas Winkler 2022-02-06  110  		goto fail;
3640b7d101ae88 Tomas Winkler 2022-02-06  111  	}
3640b7d101ae88 Tomas Winkler 2022-02-06 @112  	aux_dev = &adev->aux_dev;
3640b7d101ae88 Tomas Winkler 2022-02-06  113
3640b7d101ae88 Tomas Winkler 2022-02-06  114  	adev->irq = intf->irq;
3640b7d101ae88 Tomas Winkler 2022-02-06  115  	adev->bar.parent = &pdev->resource[0];
3640b7d101ae88 Tomas Winkler 2022-02-06  116  	adev->bar.start = def->bar + pdev->resource[0].start;
3640b7d101ae88 Tomas Winkler 2022-02-06  117  	adev->bar.end = adev->bar.start + def->bar_size - 1;
3640b7d101ae88 Tomas Winkler 2022-02-06  118  	adev->bar.flags = IORESOURCE_MEM;
3640b7d101ae88 Tomas Winkler 2022-02-06  119  	adev->bar.desc = IORES_DESC_NONE;
3640b7d101ae88 Tomas Winkler 2022-02-06  120
3640b7d101ae88 Tomas Winkler 2022-02-06  121  	aux_dev = &adev->aux_dev;
3640b7d101ae88 Tomas Winkler 2022-02-06  122  	aux_dev->name = def->name;
3640b7d101ae88 Tomas Winkler 2022-02-06  123  	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
3640b7d101ae88 Tomas Winkler 2022-02-06  124  		      PCI_DEVID(pdev->bus->number, pdev->devfn);
3640b7d101ae88 Tomas Winkler 2022-02-06  125  	aux_dev->dev.parent = &pdev->dev;
3640b7d101ae88 Tomas Winkler 2022-02-06  126  	aux_dev->dev.release = intel_gsc_release_dev;
3640b7d101ae88 Tomas Winkler 2022-02-06  127
3640b7d101ae88 Tomas Winkler 2022-02-06  128  	ret = auxiliary_device_init(aux_dev);
3640b7d101ae88 Tomas Winkler 2022-02-06  129  	if (ret < 0) {
3640b7d101ae88 Tomas Winkler 2022-02-06  130  		dev_err(&pdev->dev, "gsc aux init failed %d\n", ret);
3640b7d101ae88 Tomas Winkler 2022-02-06  131  		kfree(adev);
3640b7d101ae88 Tomas Winkler 2022-02-06  132  		goto fail;
3640b7d101ae88 Tomas Winkler 2022-02-06  133  	}
3640b7d101ae88 Tomas Winkler 2022-02-06  134
3640b7d101ae88 Tomas Winkler 2022-02-06  135  	ret = auxiliary_device_add(aux_dev);
3640b7d101ae88 Tomas Winkler 2022-02-06  136  	if (ret < 0) {
3640b7d101ae88 Tomas Winkler 2022-02-06  137  		dev_err(&pdev->dev, "gsc aux add failed %d\n", ret);
3640b7d101ae88 Tomas Winkler 2022-02-06  138  		/* adev will be freed with the put_device() and .release sequence */
3640b7d101ae88 Tomas Winkler 2022-02-06  139  		auxiliary_device_uninit(aux_dev);
3640b7d101ae88 Tomas Winkler 2022-02-06  140  		goto fail;
3640b7d101ae88 Tomas Winkler 2022-02-06  141  	}
3640b7d101ae88 Tomas Winkler 2022-02-06  142  	intf->adev = adev;
3640b7d101ae88 Tomas Winkler 2022-02-06  143
3640b7d101ae88 Tomas Winkler 2022-02-06  144  	dev_dbg(&pdev->dev, "gsc init one done\n");
3640b7d101ae88 Tomas Winkler 2022-02-06  145  	return;
3640b7d101ae88 Tomas Winkler 2022-02-06  146  fail:
3640b7d101ae88 Tomas Winkler 2022-02-06  147  	intel_gsc_destroy_one(intf);
3640b7d101ae88 Tomas Winkler 2022-02-06  148  }
3640b7d101ae88 Tomas Winkler 2022-02-06  149

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
