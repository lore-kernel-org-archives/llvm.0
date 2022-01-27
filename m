Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53702CA1
	for <llvm@lists.linux.dev>; Thu, 27 Jan 2022 05:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643262356; x=1674798356;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=7W1Mrh0hBOXiYYJVIj0+xGzCq8u5mg5VkQzJQ54sO/Q=;
  b=ghJqWxZG0/XAbIDfsm7i872Y/kAuYBDffjfCqff5HP1CrWFF873xc1Ss
   /AMRK11qFwEp1TapNM7EA7FhCHMd03FPQ1nvcKAvcfgw+I4ElAlj3Vqfj
   6fE3F1DwXpoZtRKNL6g3wMQ6qGh8MMYMWz5vPoWX7lqHiZSX/tIa9F7Hf
   X+rz6A2I5SBnLCL5W1nPIRnalaOPHvHuyYdNV7KewCRJth+Ye5vXZt1xw
   nuVEnaSGbxpJTzZ1FR7Jq9MBPOLT1gZgt+N+3p7H1zuLulYlcAMJf6OO/
   nXsEo9EnALhwllVAiubqIb4XF8rcjH5DhbbrefO6ZDixA0moYYxkCom58
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="244355706"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="244355706"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 21:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600"; 
   d="scan'208";a="521085340"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga007.jf.intel.com with ESMTP; 26 Jan 2022 21:45:55 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 26 Jan 2022 21:45:55 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 26 Jan 2022 21:45:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 26 Jan 2022 21:45:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYLoKKQVYXYGllt1I5ysVAKfDicitAcFOTL+ex2PchbzwvaRtpqRpr4957NvD/3fHnQ3mMBb4NEYpAkWXdP87msYJ9470UejlKWr/aqTTT7RFWwHtHqBr2OPtAiZ1rEkWSCh1z4JzrbNaw3W4jcxRpe5o2dRWDSng5ss9R98JgUBh5ayxXKUcnCvYspyUba12NtkfuRnv/HzU49rkE3q7KQyUoOGvw5Pu737rb5RthKeJNn1FXtfIf4I6rvq1sv+ZSdM1SibF7v6xF1kMRy1ohVJDxGPbFk1j71MTcaUBoa59vwfqyt1U9ACVFJSSN18q1CyykeNnUabd06QtFsqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IhZNo0M4uLlu72ZlOhF8Qh9FNGcxuWxl7oNKXzHpSk=;
 b=S7USCnE6lIGEow79POWzLKjkuIv30RdMwd8JSXt9XlboxHLtC+7bL6jM2iPcfkALf3zyrAGIQumMf+BlOP8K3AxqbyZlAt/8VwUjHui5utryDRcugMCWVLUZ9rFBr+PeHnHuWkGTXHX6kM9MQoLETOpefozRUmxrGZZy8F+sW5iPVKjQKpgAT2SzT2NupshYBsAGWcfErmKsJiqsOYi8lYTFC4oBbM/oh8BTi9bbMiysEzJSWzDzDjeVJK5EsnZtjl8O7FGgHQYLe4oqiy372x9hjrCIX/d2HuxQrdl/T6Vlv0j7w754D/2VThGMAot6KCHoLwZFj0IkV1/bnjCM2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 05:45:48 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d%6]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 05:45:48 +0000
Message-ID: <a789e990-c5ec-386f-94a3-5c5d74ba06b5@intel.com>
Date: Thu, 27 Jan 2022 13:45:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH 6/6] hw_random: credit entropy for low quality sources of
 randomness
References: <202201252124.ZlTUIMTI-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202201252124.ZlTUIMTI-lkp@intel.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202201252124.ZlTUIMTI-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR02CA0054.namprd02.prod.outlook.com
 (2603:10b6:408:e5::29) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d10d13b7-f6b3-4a43-bc7b-08d9e15844c7
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4975:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB4975D1A181EE0EAF4F5A8447FB219@SJ0PR11MB4975.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XW9XUwxohxSdfAjwwVdl5h3v5JEix8EDHRUCkaUuLtdtTqFzbp9iGxsF+k5kGaQdJqeQRdevbSQRE4OwzW8ryL2eHNRDi4H1cMDN3pxWXm+bg96VvYjOEU+N2rqRkcwOyc5RHCvL5ocefZ2HPa6ulliAq3VvklT79gVQ6GMTMUruQEq2cWOLYt6Vw+tFPOS1Il10DptA1y/hR5I7c+1W0AxXsh0CE1+ldxVoDvajozegVO3dxTlbX6J/jtRvvflboenwDIYRtwezdGyEgodthMm7Y/S1440CMJVh0GkzsXeFZX4hc1zxTX3wmFzM9NLM8tOz5X4ybF88HoPlywhynKEWmGTlWxLmLfrWfIDHUSm6oe9kG/SCgXU7gUq5ljH8nBaYIMXdwnSCkBfnjohYzchRQCd0JSQ8zTpEtedb9UDhtC3C4FTGV/WRFDT4PveVD2+5hOEbYUR9wJznB7RGvVt9hIYyy/CZzAYzb3Q6KiGvA6NgtkDx9ndii6zxxnZlkOJPXrpoiwV8VK/xMeL3C0j89jyvxrpS5KwLj253JPynRaueNk75YEKAgalFOr8/7djLxWuQ1lr5zOxF0LyVFIbYFHVtYaJVwHmcTEYFftd7KUey+My9xJtRnRQMPkQ6Y1O1/O1mortaeC+l+J3ulCD2JrkaPoJTrI1na932YFA+yGr5iZgT9Vrf+fP8NonMJuW7p6aTxDmI4tM+AgXtRN31cWW2d5yHmLdzwDxvImBeB1/2r1ZEiy3LpIkHat8L55gC83E+Era0sDe/cCZRChaEfczIBxVjCayj42wNDgUWDTc/Rw3CqpyS3Hn9J/j5YlZxq/rvb42T5PpGf4OMw4jxoxpzeSVW7To6WbSp8yM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(186003)(36756003)(26005)(6506007)(4001150100001)(6666004)(2906002)(31686004)(2616005)(8676002)(6486002)(4326008)(66556008)(66946007)(82960400001)(8936002)(508600001)(66476007)(6916009)(966005)(5660300002)(31696002)(6512007)(86362001)(83380400001)(316002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0toTUxGRXN1QWJZWi8za0EwTEZ5TVdaRW5MWm9jWGZDUEU0cVRHb09SVzF5?=
 =?utf-8?B?YVJUQzgzYUx3d1VUM2tLSi8xcDgvMGxacnlVSzZmNlQyY0ducVZtNjBvZGJy?=
 =?utf-8?B?a3QvTmkzYnNRQisxSGVqTGtWRXJXUWRvbGNrQ3ZMaksxSm5UZmNER0gwb25W?=
 =?utf-8?B?RXpHamVHZ243NmVqc2ZDQzZtNTlFSFNTMjVDNWxVelhWYWdxUThEKzF2ajNJ?=
 =?utf-8?B?dlZvc1gvZGdWTjMzRVp2L2pseklaY3dHcUJJVkVUWkVlWE92bTJzY0ZZUlky?=
 =?utf-8?B?SjZMb1BOc1hneXVZZDhrdG81c1lEU1g3R0dSc1pQTkhuQVVOZEsyNUtPRUVp?=
 =?utf-8?B?dE84T0ZjaGNWa0hadmZla1I4QnZyMTBxR2lxQlNPRnQyN1ZVNE9CS29aZ09W?=
 =?utf-8?B?V0NRSThlblZmeEJEQTUvelNweGZSaVNyendwQno3THdlQlFIdFYwYW1uY1ZC?=
 =?utf-8?B?K3JxalRoYlAxVkl4NldQNGJxRXYwOUxmZGJFMUcycTJ2SXNhdnNqQUcyYXFN?=
 =?utf-8?B?RHdvek92eUduS2w2TjVUN3FMOWczNDQ1dGpxWHpFVFJoQU9jR29jbTFoRnEz?=
 =?utf-8?B?b1ExRnVaUjU2Um4vRWF4RHJlYzR0ZzhFRVdGYTZZYUNEYnYwSTB5MkduaVAv?=
 =?utf-8?B?anVHRE9qWW1kMWlFeklqVVg2MEFMN3hmMTFYUFpKai94bUN2MlJtUFVBb2FN?=
 =?utf-8?B?L2YxWjIxalVaOFhvaExKbVQvZkN2Z3dWZDVtRFF3cWJXT2RqdzFkbkhRODRt?=
 =?utf-8?B?Z0tHeFN5SGxKM0xhZURTV2NiV3hmMXlmMFQ2cGNnd1M5K3ZsNzlpNkhnSjFQ?=
 =?utf-8?B?TXRWandNbHBVd04yM0N5Ky9VT2hoRWNIRkNDcjNTTTllME5WT2RoaVlJclpL?=
 =?utf-8?B?N2tuUURZM2RNL3VpZnJ3VlN1aWlGc1NuUHA3T05ubUk2elF2U3JPemtnRm5P?=
 =?utf-8?B?NklmandkQnNMcVUyc3JmUnU4K2lVZklpTzBBS095aU92VVBjKzI1SjFHRTA5?=
 =?utf-8?B?c0g2bUNWcXFJeUhsU1VwZlBkd1dNMW9ZQytOMTU0SU1Ielk0K09HbzNXTGND?=
 =?utf-8?B?RUVEbjBBa0dhazE4RHZEQWZ2VUZlMHFKOHBUNktCTXBkZ3RkczJWZWp3eTQx?=
 =?utf-8?B?b05WVXF3TmlWTENjYWcwSDh3UkpKN0ViMkVoN0RkSUVITVlITElJeXErbXY4?=
 =?utf-8?B?RjZ6N3NaSjRXbXpRZm5JVGdqeEhDaFRYY1lkVW8vSzg4Zmprem9qTEhoOUds?=
 =?utf-8?B?Y3FYN0h4b0xDNmV5RFNiWXlHSi9kZWdzckNmQ3pJWUtPVUJjTzk0bitQdHdB?=
 =?utf-8?B?eXI0SGlrRmN4dUhaYzl6Umk3aGIzcGpuOHRMRGVoWTkzOTlnVVFvbmRqUHlP?=
 =?utf-8?B?TXVxbm5FTmFJM0VsRHpCV2hWbzhMU09Hak54QVYxelhuYSs0cjUzMzhXZzhi?=
 =?utf-8?B?cjJDd3c4cGNVanlQbFdPcm0xSUVpaHJtaDlabjJMOThYQ2s0ZmJ2Z1cza2Rk?=
 =?utf-8?B?dVkyaDZKWEVrWWpKWGRNN3c4K3N0MjhhN0FxM2ZQaXg5U0hvSTByWFpHeDgv?=
 =?utf-8?B?NVpLWU5tcFRldjBQM0JOTlM2ZFAzVGxGR1ovOWlzclUxNGxVMVoxVEZiNHpy?=
 =?utf-8?B?ckFmb2x5OWFnckplVEcvWklScCtHTEhZdXV6N010dkx5cTlqNmZjcnQrUTNj?=
 =?utf-8?B?Ynk3YlZUS2FHNmtvaWF5amZpTTNwaUxqdE5TaW9MVEV5RlRoTWpRazZVYUxt?=
 =?utf-8?B?VDVNbGpEUnZrZGlVZVAwWUQrWm9ta1pJYjRrNERhaEJRYkdSZGZCQzhMaEU2?=
 =?utf-8?B?clBZZjY4RWdlNm1FUDE3d09UOXJ0cnpCUjBJWGYrRXdwbXo4UTgzZjQ0Qk9l?=
 =?utf-8?B?RVFyT2hxc096WDFmN1VCQ2xKRDVYQ09QcDQyVWV2b1I5RDQzTmNKNFp0WnZ2?=
 =?utf-8?B?S0Rkb1Jtd2o5dm9obXBOL05BdnY4NjZoeWQwdUdDQWJrcm00UjJtSVdjLzJk?=
 =?utf-8?B?dE5KVUdDTy9oeGdpYWxWMitGay8wTURlZWd5bm5MVU50MUdIckxNeEFYc3V3?=
 =?utf-8?B?ZWhVL2lMREFjUkUrcWRVaWRrbEdLZlY0UkFJaWozSms3bVdna1RTRXFsT0FH?=
 =?utf-8?B?WFFYWjFIM1JuenNsOWp1L01iN3R5QXY0blN2eEcrS013bDVjc2s1MFBIVTZH?=
 =?utf-8?Q?XH/k7fdT/KPRZuk6ieUsZ7o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d10d13b7-f6b3-4a43-bc7b-08d9e15844c7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 05:45:48.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfSxdpIU6EfMacgu4AZ/3BBMzLc3w0rUPMI8wNZGaSN4VqPzf1EkylLCo0a9F7Z6Q8LECmMDB0iggj7I4QPRNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
X-OriginatorOrg: intel.com

Hi Dominik,

Thanks for your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on v5.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dominik-Brodowski/hw_random-explicit-ordering-of-initcalls/20220125-051254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git 515a2f507491e7c3818e74ef4f4e088c1fecb190
config: riscv-randconfig-c006-20220124 (https://download.01.org/0day-ci/archive/20220125/202201252124.ZlTUIMTI-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # install riscv cross compiling tool for clang build
         # apt-get install binutils-riscv64-linux-gnu
         # https://github.com/0day-ci/linux/commit/a0f46724fe340bab80dd4a8bf4a9f413c6a294f1
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Dominik-Brodowski/hw_random-explicit-ordering-of-initcalls/20220125-051254
         git checkout a0f46724fe340bab80dd4a8bf4a9f413c6a294f1
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> drivers/char/hw_random/core.c:455:4: warning: Value stored to 'entropy_credit' is never read [clang-analyzer-deadcode.DeadStores]
                            entropy_credit = entropy;
                            ^                ~~~~~~~

vim +/entropy_credit +455 drivers/char/hw_random/core.c

844dd05fec172d Michael Buesch    2006-06-26  424
be4000bc4644d0 Torsten Duwe      2014-06-14  425  static int hwrng_fillfn(void *unused)
be4000bc4644d0 Torsten Duwe      2014-06-14  426  {
be4000bc4644d0 Torsten Duwe      2014-06-14  427  	long rc;
be4000bc4644d0 Torsten Duwe      2014-06-14  428
08e97aec700aef Herbert Xu        2019-11-17  429  	while (!kthread_should_stop()) {
a0f46724fe340b Dominik Brodowski 2022-01-24  430  		size_t entropy, entropy_credit = 0; /* in 1/1024 of a bit */
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  431  		struct hwrng *rng;
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  432
502e9986132b25 Dominik Brodowski 2022-01-24  433  		if (!current_quality)
502e9986132b25 Dominik Brodowski 2022-01-24  434  			break;
502e9986132b25 Dominik Brodowski 2022-01-24  435
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  436  		rng = get_current_rng();
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  437  		if (IS_ERR(rng) || !rng)
be4000bc4644d0 Torsten Duwe      2014-06-14  438  			break;
9372b35e11149c Rusty Russell     2014-12-08  439  		mutex_lock(&reading_mutex);
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  440  		rc = rng_get_data(rng, rng_fillbuf,
be4000bc4644d0 Torsten Duwe      2014-06-14  441  				  rng_buffer_size(), 1);
9372b35e11149c Rusty Russell     2014-12-08  442  		mutex_unlock(&reading_mutex);
3a2c0ba5ad00c0 Rusty Russell     2014-12-08  443  		put_rng(rng);
be4000bc4644d0 Torsten Duwe      2014-06-14  444  		if (rc <= 0) {
be4000bc4644d0 Torsten Duwe      2014-06-14  445  			pr_warn("hwrng: no data available\n");
be4000bc4644d0 Torsten Duwe      2014-06-14  446  			msleep_interruptible(10000);
be4000bc4644d0 Torsten Duwe      2014-06-14  447  			continue;
be4000bc4644d0 Torsten Duwe      2014-06-14  448  		}
a0f46724fe340b Dominik Brodowski 2022-01-24  449
a0f46724fe340b Dominik Brodowski 2022-01-24  450  		/* If we cannot credit at least one bit of entropy,
a0f46724fe340b Dominik Brodowski 2022-01-24  451  		 * keep track of the remainder for the next iteration
a0f46724fe340b Dominik Brodowski 2022-01-24  452  		 */
a0f46724fe340b Dominik Brodowski 2022-01-24  453  		entropy = rc * current_quality * 8 + entropy_credit;
a0f46724fe340b Dominik Brodowski 2022-01-24  454  		if ((entropy >> 10) == 0)
a0f46724fe340b Dominik Brodowski 2022-01-24 @455  			entropy_credit = entropy;
a0f46724fe340b Dominik Brodowski 2022-01-24  456
9372b35e11149c Rusty Russell     2014-12-08  457  		/* Outside lock, sure, but y'know: randomness. */
be4000bc4644d0 Torsten Duwe      2014-06-14  458  		add_hwgenerator_randomness((void *)rng_fillbuf, rc,
a0f46724fe340b Dominik Brodowski 2022-01-24  459  					   entropy >> 10);
be4000bc4644d0 Torsten Duwe      2014-06-14  460  	}
9dda727d37ff6c Torsten Duwe      2014-06-16  461  	hwrng_fill = NULL;
be4000bc4644d0 Torsten Duwe      2014-06-14  462  	return 0;
be4000bc4644d0 Torsten Duwe      2014-06-14  463  }
be4000bc4644d0 Torsten Duwe      2014-06-14  464

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
