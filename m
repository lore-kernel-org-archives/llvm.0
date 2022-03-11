Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876A7E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646984324; x=1678520324;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=2Teu+RRPtYJNuSSP9vZdYTk1MGr1w9BphUd0s7OE5Ew=;
  b=mDDrqI7L+m0sAUmFrNW5OOOjH+UC/Mu5u5BzoHn7HQGPRwIdnWIie9vl
   ti+BfRwOLQ11EqEc0k83oOYzMmMr9ff3UVwRv86AQseeqrHxbnzwn56vr
   185akQX3xjU4IEJp+xF2vQpA22fVKhh6xUquZjlhF98PxvyZ2oAieDava
   RSNiCfSW0vdLqFvxRyj0s5jwk9MIJxR4hnW4+XIOfoz3dYzPmxqFDUJ5J
   teTtMgJbjWpl/XWxkvqVWiFgxmGbs6PXE+r3sCib4W7AhT1Ylt5+elXuL
   DWYfN0f1AaQmDWLZemDJbCj+bkOivA7frWuBQ31I/m8O0mVObVx5SrtJH
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="253084306"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="253084306"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 23:38:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="642903050"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2022 23:38:43 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 23:38:43 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 10 Mar 2022 23:38:43 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 10 Mar 2022 23:38:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da24u/jl7SzVm5ffOBvQZOdHDyxsJqmDWLEDdZNa8m4Ubi7mp78jMzd2RTfNG91zTsH3OivMiVnwAhXPLcIlwV0KQbhGaTBY6k4YHjDlQl0RTZ/WQ7hSUH2g37fzQSy6jHKd7wPIMQPOpNr3mU0XuWT3FiJctGZI7EgbESDbCNSat1l3Z8J0eKdzhyuMOU49YknsCHEd2zbPkkUKeGnlslXoif8N7KijmTDSyJnld0YowAMfMq3nE7RHvveKnaLmSLMtF1VHlT3f+JnOBGYpFzc2mqI9LRoUMDBNqZjs4eVlwJy8QYHGCMGt769G8UESCbmo2S229Vyy17H+1Q8T7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmZ/WCa1I1RhcmOkbdfMm67KtBO9H6Tm9WmZJftYvsU=;
 b=gW88THsf2weuS1Su7Yows17EU+8HcUy1pm9fseADtgkRQ19e5iHp4sJ8ftBj2SxSqclIa+PWgWhctgQbbYMpAUPzLfrBRb7cR99UxtxcMevcQbDdKf7s2fKzIWO9nypDXXFg+HfOOTTfs3Hjyl8XXikPku5vTIeoqD0wY7ast5RkD+eDEdogjN3tqVOguhBtTdrpa1M1siRRyXphdShokIjX7dwfj5PNgEJngrV+RA1yN87WsYlFgbjzdTvByfJfuAeEuAQLE4cVyNCBYGes9iAoEKV4gy3H1JJRViFFa0TR3tqQiiDyG67DzHZVJPpqWwpMdqqywhN0Nrw7e9jCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by DM6PR11MB2554.namprd11.prod.outlook.com (2603:10b6:5:c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 07:38:33 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::90bc:9408:541e:5b94]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::90bc:9408:541e:5b94%6]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 07:38:33 +0000
Message-ID: <2a79103f-91b0-d52f-9901-37fc93435449@intel.com>
Date: Fri, 11 Mar 2022 15:38:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH bpf-next v11 1/5] bpf: Add "live packet" mode for XDP in
 BPF_PROG_RUN
References: <202203110108.Nlnr17an-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202203110108.Nlnr17an-lkp@intel.com>
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202203110108.Nlnr17an-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HK2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:202:2e::22) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6776d59e-be71-4267-a9d0-08da0332252c
X-MS-TrafficTypeDiagnostic: DM6PR11MB2554:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB2554E987A0D7466C428E4A52FB0C9@DM6PR11MB2554.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHTHJHEKibwt2EhTxceZf7Ruv8f0G2BpqpZSwHhJWrXXIUWE8RPwXN7dazfyrIHz7/xKzkoAZqZkYmUbv2OqfvG4wdyIez/Bc1Bys+corqfXi9Ns+3rr1dxyrthAZEz76sr6nRrInZbqlhASJ9HtO09REZT60tDTM+1zxk9kTl0PYKXMBqPvOtUyP8pbh3yFwFfy8mFyLkBd0Ka5w2aZf3dRRKCDNd3phvP2fWVfQR0dTV0IDkafbk1sgIgOaRwh/2oUsh9MGzrYc0I2UXzHjTjfPhIFPBPcpR8QG7STqsyDz5jBCieLksr4FFzfOED0kBnPFw6y0gGkQw9PK6i9kwSzV0TnGgZa2ho6Cd+dv4Ud5oQpInWWziM+JHcyThamniuDK8rcaejBJAulB3ecFOv52C6BCstwMz9GPt3MGw3QEGAnEK1P5rn/fTbhiGhch9lS2BGsw+L2FXlCppe5fNRn4pS2Nml8ZLj81qNhEXQxffR8yLpdIgVcLpVbZBbFX/E3XWwoALa5wg3LxyZUh8aZhxPAq1BvwcEF1VPS8lAaitMq3QZuVXQh6XcT6iSABmsSSE5cFxR7I62D+oawfaAFq7bVBvDvxX+r0JE/zsOcYHgK0Kb2l+JDz8eTzSxQigAgnciRvqQnFmvcriZx2Ku22vgymLUJjFCTFQ+H4PgCf9CXgDwGz2UZAw1ADwIFJuGmTNT0dcavyem6s97UMlsWtgoIKJIFqxc6nPE09K0dTimmowXeLyt9s+3vfcJVVqo1cFqr+F2JbmLB+3cqDr9Aj/VicRylKNaoLYsVrAc+e0ZRiKvaJ1GcL+iZmLoj+j3+9e0C7eHNxKI9d93SpmRaSFtfaraAAEKXaUC/Y0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(82960400001)(8936002)(966005)(8676002)(36756003)(5660300002)(4326008)(6486002)(186003)(2906002)(66946007)(66556008)(31686004)(66476007)(38100700002)(83380400001)(66574015)(6916009)(2616005)(6506007)(86362001)(6666004)(26005)(6512007)(508600001)(31696002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTZPbmgydDc0U2FKL250Wjc0QlBJTHc3bitrajQ2cmxBVVRSUmUrVFRDR3lV?=
 =?utf-8?B?MXVEc25GQUluY1dLUEZiOUlQOXY5YXpXSTFvdUY0RU1kT1lQK0RtU2wvMEZN?=
 =?utf-8?B?emg2dHA2Szg2aS9GTUNWYUt5eE9oVmZTbG9sZWM2c2t4ZU5wNm9KS00vTVV6?=
 =?utf-8?B?NFJGNU9GRW1GY1IyeHZjZWQ2R0RKNVE4NTRnZkZaTFVwODExM2tOVTdMWE95?=
 =?utf-8?B?SFJ1emhNdjFLeGwwc2RJNXFLdGdxTkdaUjd3NE5kQnViWkhub24wNU5uSHh0?=
 =?utf-8?B?a3ZjdTBPTU4wZUFqTThCd0Y4TmRHRUlnWUkzTTNFdmEyOUY4RU85MzFRcmhm?=
 =?utf-8?B?LzR5NTVpQkxCaEc5YWJMd1RIUnV5RDJXTEdxM1pPQ3dOK0JEdm11bmFLUkhm?=
 =?utf-8?B?NEFqbndTTFNDeUlhekpheHdBak1KWFlrQXEwbUExaUhNWTE5UVAvNHFON0tO?=
 =?utf-8?B?Y1RHU3BTRjZQUjNxSjVDU2dCejZoZVR6YlcyS0Rmb1RYYlJmUC9aWU9zdUky?=
 =?utf-8?B?V1VEMWxWMVFiVWZlN3NQU1JXaXF3Q1pjZVJacWRNZlJuK2RkWmdrbUdBRXAv?=
 =?utf-8?B?K2pLWUJ2RjNJTzhvWEJxVkI3Znd5Z1hqQ2lnZU9UYTdMR2haWG1iTzJucldH?=
 =?utf-8?B?a0VoU0FscjZ0MTAyeW1kZ0I4aXU5bTJWQTA2cENabmVxNWxSMHpTMWdkeDBo?=
 =?utf-8?B?dzhPUExsZzhvY3RZVFdwVzlJODA0c2UwYVhKZnBIWE9JRFRIamdzNTc0dUZm?=
 =?utf-8?B?ZFZvMHRCNE5oWjBVMXgwUG5UeWdGN3I2NSs3TThqSSsvOVp1aTJ6cCtiR2No?=
 =?utf-8?B?Nk14R3Z1OWdtY1dvakdZRTlScFRpeGcxZ2lQay9vYks1eVVGSFFDS1c5clBF?=
 =?utf-8?B?T3pxOEdPYTNmeHV5Y2h2ckZGOEpTa2VzSDNHUFQxajB5N1pMS0tCU0hPdHVa?=
 =?utf-8?B?UWc2T2tUQWd1cHM5Zy93VFZIamlUcnFuYkpMRXArTGR2TFFZdiszSSt5dmt0?=
 =?utf-8?B?NkE0NHJLM2dtOTEwNkF4bG9ncm1wZWdKM09lSm03Qm9CMGQ4SUh1eHUreGMr?=
 =?utf-8?B?T0Q2MklkWHVPV2JZay9TSGd2aVJlQzlvSTdpcFhJQ3lJSnZCR0dlRXJwaFlG?=
 =?utf-8?B?QVVCUUQySjBqejhaT0JCVzIxNm8veHV6S0o5dkxHbkw0WHl6cU9BTXFmd3Ri?=
 =?utf-8?B?VHZtSk9GTVRQWHYwNW1BdTg0TUp2UHp4dFowZjhQbHB1MlphZzcwREpkbkhu?=
 =?utf-8?B?SytlNjExV2VMR2hzZ0lpeUlFSkJQcm4wZkU2TERLdXFScTV5RHBPVGxlcU9K?=
 =?utf-8?B?Mi9Hdy9MNHZIMmNzNkN4R0lqSEI4VGI4UkJmT29xKzFCMmVpTkw0OHhvRzJj?=
 =?utf-8?B?MWRuRVNEajZoN3MrS243Yk5yN2FRQkVQSStOREQ3elFsZUZoV2pxSDhiekNV?=
 =?utf-8?B?VGZmTUNia0pJcmRBWWFUZmhwMVN5bVZIVzJHb2dPamdGaGxmaDMySndTM3E3?=
 =?utf-8?B?bWhGaDJTUlFIc2pvMWsycHo4SGY1ZkJNK25XUWc4S3ltWC83c3JhL25XbkRx?=
 =?utf-8?B?L2k0VnRXTzVPL2R6WGRSVFh0Y1M2WjRPNHJRbXcrdGNnN1IxZEVacGJpNWZo?=
 =?utf-8?B?NEgvbUlGTUJNTDBycjBVMDYyY1dGcytTV0JISmF2Z3lYNGd6Z09VeTR1cE9M?=
 =?utf-8?B?dGtwOGFRdmFBYTFLUmp2MUlhbVJIeTFPQUNDblI4WnR6aFZrck9iZjUwM2lN?=
 =?utf-8?B?YmNXV29HaWh0eU1XOHJzeisydWsvZnprV3pxd1RheTZadSs4UzIxaHlrcmxU?=
 =?utf-8?B?WDgrTHNoNUdxUFB4UlczbW14Vk1vRit3b2lMdnFCb2ZMSlU2N3lpL2x0YnVC?=
 =?utf-8?B?MUtVSUVISjdyRHZweExMM0hpclp1Mkp4QU9ueklkWGQrN0wvKzl1b1dCd016?=
 =?utf-8?B?YllTcGI0ek1SREVBUGcxSDdxVVIxQXRkV3FkaHNta3dhaTBaaVJIR0UxaDE1?=
 =?utf-8?B?NUpZdHF4MWtRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6776d59e-be71-4267-a9d0-08da0332252c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 07:38:33.7184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXyA6gkQWcZxw2bv6UpGQk3dVm+DvuN4/e0SBVPd61n8QZibp3meIFS13pO1m/AP94HjpqmxmvoHZgzo+K2Trg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2554
X-OriginatorOrg: intel.com

Hi Toke,

Thanks for your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Toke-H-iland-J-rgensen/Add-support-for-transmitting-packets-using-XDP-in-bpf_prog_run/20220309-185524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220311/202203110108.Nlnr17an-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://github.com/0day-ci/linux/commit/429da9d7b2fa526bfcd4230a2a2e9bf19dd10902
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Toke-H-iland-J-rgensen/Add-support-for-transmitting-packets-using-XDP-in-bpf_prog_run/20220309-185524
         git checkout 429da9d7b2fa526bfcd4230a2a2e9bf19dd10902
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> net/bpf/test_run.c:104:8: warning: Excessive padding in 'struct xdp_test_data' (100 padding bytes, where 36 is optimal).
    Optimal fields order:
    rxq,
    orig_ctx,
    dev,
    pp,
    frames,
    skbs,
    batch_size,
    frame_cnt,
    consider reordering the fields or adding explicit padding members [clang-analyzer-optin.performance.Padding]

# please notice that this is for struct space optimization.
# reordering the fields may be more friendly for machine, but may also be less friendly for human.

vim +104 net/bpf/test_run.c

429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  103
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09 @104  struct xdp_test_data {
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  105  	struct xdp_buff *orig_ctx;
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  106  	struct xdp_rxq_info rxq;
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  107  	struct net_device *dev;
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  108  	struct page_pool *pp;
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  109  	struct xdp_frame **frames;
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  110  	struct sk_buff **skbs;
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  111  	u32 batch_size;
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  112  	u32 frame_cnt;
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  113  };
429da9d7b2fa52 Toke Høiland-Jørgensen 2022-03-09  114

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
