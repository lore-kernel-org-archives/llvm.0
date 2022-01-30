Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35522C80
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 02:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643510047; x=1675046047;
  h=message-id:date:subject:references:in-reply-to:to:cc:
   from:content-transfer-encoding:mime-version;
  bh=MFxuqPhWTiDZ7YgMXSFC/EY6eRFUNmxRQTMt7dXWULo=;
  b=iXcL2nqa0XQwveYX977Ih7v/fn8Kvgu1OGctVpSkoMyGwrw/TWg5kynq
   c4kpFnBVd+AVXEd0tLYi9zn+0/2BOjrkNBwHUmjdNL/3ECrobXM32GGxT
   uvBw2LoEv6XdmJZweSoN3UGvi9XDe4wDKNM/Jq5nmupsDeYLj4KP/hdtG
   /2OkvYN8qmP1AzTHzjaXVDGAYiXVYawv349aAyAYVKirwKopBkV0s36+H
   +kq/nyE4u4N6X6lIRs0hnMku3KLKwAUksjprn0GGvuk3PobftIHfH0FnK
   3f3VJlPo3kxITJVQbl4ta6KZAcqp4L8MfbG3dXwAT43qxaFfjVFAkQF5l
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="227978340"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="227978340"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 18:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="564587997"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 29 Jan 2022 18:34:07 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 29 Jan 2022 18:34:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sat, 29 Jan 2022 18:34:06 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sat, 29 Jan 2022 18:34:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYn4FjK6tKbCw6yc2k0ArTdt4QhqVNYaMkNneAq1TaA3cbpTisixmmfGGWjDv+3EOPsK46/7+uo+vO2MOTj3FVpb9x9gXa1D3LH2U3GJFdTf3YLs64Wrd3rQkE6f5oGn38hGLmRk5qI+ETkTOcgx1lNZjNoMFb/TzhVTszYxJsOecxbf1n6j0A7HppCTCwmy1qbvJfrVeNFqVagkD2/AFfrMMirVTf/axfDkDR1H9/1cQVEOe8KftyHHoORTpsAIUPoItDLGHbiCJrGpHMaLdMiYln4fNl1QUTqrYdSdnpG4GE0sFnT5wjaYmzLJp2FsnduyEktbUyklxGVZ5wPr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJshUUkX97rG4DrjRNp9rKe0vXuIZtATIfMdfU2YxBY=;
 b=EDXrGPRVgHkKqQsunIRiMEdSW47x3ZCif4PN0UqDfNDSiOBthTOGy1sdlSLg2V2FyQpHlJQ/IEcAw+2+wSTMOUJLMv1prC+A5DYbYLUrWThw9UC6bGbMsPJnz2uHQEKN33K4IivSymJElR7vMvsghBjJ/XUDN+5HZesgsL6BZG+f8KSKq+0PTvS4t/dQZ/VZmOtcX/Fj4p/caoNEsSsCaJkJQni/grhnppPjWRlj/pb4M1iBR/a/vbqYATGulI61DsTyS9qlkaXTJjXjIUWzOoJsOpdar4KCpHDVLyAqyzfrtaFw+9R/60rEBu9mFFuzbm0oZoQ/RtwwY/nKsCCy8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12)
 by CY4PR1101MB2280.namprd11.prod.outlook.com (2603:10b6:910:19::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Sun, 30 Jan
 2022 02:34:04 +0000
Received: from SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d]) by SJ0PR11MB5598.namprd11.prod.outlook.com
 ([fe80::c4a2:d11d:cb7b:dc8d%6]) with mapi id 15.20.4930.020; Sun, 30 Jan 2022
 02:34:04 +0000
Message-ID: <3680a97d-967e-323f-37d3-dcdc20c49704@intel.com>
Date: Sun, 30 Jan 2022 10:33:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [PATCH v5 03/13] perf/x86/amd: add AMD Fam19h Branch Sampling
 support
References: <202201281639.FC1PUTSK-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202201281639.FC1PUTSK-lkp@intel.com>
To: Stephane Eranian <eranian@google.com>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>
From: kernel test robot <yujie.liu@intel.com>
X-Forwarded-Message-Id: <202201281639.FC1PUTSK-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR04CA0060.apcprd04.prod.outlook.com
 (2603:1096:202:14::28) To SJ0PR11MB5598.namprd11.prod.outlook.com
 (2603:10b6:a03:304::12)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed16c4e1-3246-4969-ba23-08d9e398fb57
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2280:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR1101MB228098756CE587D4AD7467F2FB249@CY4PR1101MB2280.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kKKp63SnOhQHVUWKL8q6Ar1gd89Dfx3yjUmdZv+kXBLpa4Bu+VSUh5o/Wpp3uYK6iv0duGBK/2PHS+yJHTXPOP7bHRWbJn7mOfBZgdBXZQ3bmBA9bLoWuie5kGHLgESOyKYtAIEPM8IEc5COZmLH5fcWFS/GAohO0pdBOBxuHD3qn2REp4u97/e7hrsSGpWGB8RnROlIfOfGXeJnT1itrJ/sn7LQqmbFcc/3iN60OJ3RPljikOvJaKWHB969SGiAkr5SIKlRElWuEKhKu+D07iufPsOIrtegAl7MhIxvyrIfDZzs+Rzh+t/BrGIdMqg7K97bieQc+j/oDDkBqrgqzgY04Yj51k/iGjpoUlFn5qN4UB+9mZk+L3hTcyBL0TiDOR/sRY7CmXA5631+vs5sYxzKNkggs/CeSIL0teBjpkGef23kbwg89ywmTzu+3F80F8uCUIkDWOegPOIwvVSTecEyEkpOB/SStYICuosFOPVkiizdK9ZEk5uDN9viHB9leXllL3p4UIu4Ta3wNRjVdOouL1KjQ2HX3W49H3XKy/bGZE+WvRoOl5JrSMB5by7ej3MGLJb905ngyGy2vfuBMiJA5wk6Vb30278vfrk51feS6WbVMzV6+t57ylvJv4Eu02wXVMFXRi/mgywk0oUP/HQlCCg+GfvYLCFWdL8FAG+ZwWGVTqKCJXrbpUMAjlQLK+VkEehVMZRLv1JzoUpm36+wTRJ3toFSHTs9SZhPAIbocy2RFoyHZXxTqhVgFNxC3ZKifVjBwLVUyJ3OSLxbt8sP/p+ziNKLiedunXsNTAlMF0BIiD0YvDtlGFy3af6Ko9NNIy1++wM1EVCZitvp6ZTk9z5H9om/dr9DLZQ739U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(186003)(26005)(6486002)(6512007)(6666004)(83380400001)(31696002)(6506007)(5660300002)(36756003)(966005)(31686004)(508600001)(38100700002)(316002)(6916009)(8676002)(4326008)(8936002)(66476007)(66556008)(82960400001)(66946007)(86362001)(2906002)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djA1Yk5WMXNDdkZoZTQzbHVtZkdpaVBhYnoxcU9FVzFvZndkLzJLRm0vZ3BX?=
 =?utf-8?B?MUNvNE1GUmQ4eHZIV1M2SkNRRnQvQ2ZEelVYMVdlSHE3NkpEVmU5TGF1SlJZ?=
 =?utf-8?B?QjY3MlYzVWVacG1rcDByTFFLNkltV1dHcmZtaDYxZzFOMkxYY1ltZXhXYy9U?=
 =?utf-8?B?dk9HRlNBZTVpQjFMMWFVQ2Y5TTZITjdYc2VjZGdyTU1RRXZXcmU5UlJsZ1dU?=
 =?utf-8?B?MUppRXFERm0xeVV3Qml2VEdTWUNOS1FoS2dRS2FJTW5KVjF4ZWZGbGZMT0c5?=
 =?utf-8?B?UjhiRm1NbDFRQ3FSUFpWemJ0VUZEaHlDVWhXVkVUNkpFWjlkS0k4dkNxMnF0?=
 =?utf-8?B?dkhrWEQ0OGtwdWdPem4wYXlxb0FLaWtrZ3RuL2dqeUdwczRZa20xaVBIZy8z?=
 =?utf-8?B?V1NxalVScllZT3FVTEhSWEJRZkdYM09FNUpKYTVRL2hKdUs5dkFDNksxQ3I1?=
 =?utf-8?B?UVJMRWd2VDFMTk5yR1lIMDdnMkhTQXNlQmorWWdVS2JjSElWTUlZZW9va0VQ?=
 =?utf-8?B?dVFlZG1US1NsRHFTS2VVRi9yelVqVHRIbFl4bkFyN3djcCtvSmdqcGJKcG5q?=
 =?utf-8?B?WjBKclBZZzZneUQ0SjVpY3JOcWpHMk1ObU04Um1vOXU2YWpHNE56Tkw3bE1h?=
 =?utf-8?B?MGhrTUF4YlZWZjFXbWZQbkZtcDlzTG1LZXBydCtOVGpZZUsvNU5ERDdwN1JW?=
 =?utf-8?B?VTNjdGJGbXJkRUM2VkhYbGRkdzVTTzVVVVduekhOaG1MeHMvdG1uV0J5UDMr?=
 =?utf-8?B?UjdKdlJZUXFkRUxFb0I5bUNjdGk2MUV1Z1VoY3haTHl3NkY1RytXWDVlaTZx?=
 =?utf-8?B?Wm1KV2d6VnNHUXhoYWlnTkMvMTBndy9kdXVQczBYaExvK3N5VFJzNXdqWHFM?=
 =?utf-8?B?OWFhVk8xaTNpeXRDSllIdzFBSXBXSzZya3RHSnB2Y0g3aHphcERCbDgySVgr?=
 =?utf-8?B?WnAzT1lLRk9qMklXcTUvRnZzMG56R0VubUtPS2RuYnhDb0dLeERnYkRYa3hT?=
 =?utf-8?B?N05kbzEwaVVBUlFkczdXQzEvOXlBdFoxcnpXQ3dTbHBMRTNlNFRIZmFyNHBq?=
 =?utf-8?B?ODF5SkJQTGZjamdBSU9DMnVqcVBlbWVObEpVLzA5ZVRxZ1hMZGVsRmNTaHBv?=
 =?utf-8?B?aTBBejhkaEdQM3ppRGxOWFVHQjFWd3daaStzRW0veDgvdU02WnlDVGtqSzB3?=
 =?utf-8?B?d0pCNCtGcmdaVC82UmJpM1dMcnY5YmtoSUozaGJVMklsWjNxcVlmK2QyaG1s?=
 =?utf-8?B?dEMyOHhsaThxVWQ2Q21zL05ScWhLcE1KaWZSWk96SlFveXpSdUhGcWZIdkJL?=
 =?utf-8?B?SnRmMG00Z0hOYnpDNlpwNFhVbDMzNW5NYWJkYnc0dkZNYkZ1ZG84SUErd3FB?=
 =?utf-8?B?YXhZRXkyZVY0d29GQk5iVVNJekdneFNGWUlEN0U3aTBvS3JvMEVZaHRrTDNs?=
 =?utf-8?B?Z3NRQjY2cStEYTZzODIwYXl3c0pmYnE1clQ5MGZGMzVlUG1Hc1hQNmF0RTgx?=
 =?utf-8?B?MVBxZmpSbEl6Wk9jRW1aWGZSVFgxZitwYkMvdW42WmF4bWlPZ0FvTlQxVDZH?=
 =?utf-8?B?MVcrTzZsSHZabU5QWjF3N2ljMXVVV1YwV3d6ZkRLQjUxcG9WWmFoRThrUXVR?=
 =?utf-8?B?amdPV0xJS25ONFI1UVJVMjV1MU5McjJzT0Q0cmdwelpKU05ncTNGT3VST2NI?=
 =?utf-8?B?R3NPNE4vSXo1cFJwdlFxS29wSzd0OGl2RllBczBXUG5kQThNRkV3VjlUMytK?=
 =?utf-8?B?WEIzRDQrSzdsQWZzaDF1UHpza0dsZ201QjFTMk5pdkx1UmtTRjFDMDljMzVO?=
 =?utf-8?B?Sys2Vk8ycGZVc2E5MTgzYm1lVjczU1JTdDRURkxyM3hKdzV5QzlRUGtUZDN1?=
 =?utf-8?B?OG93VWd5cXAwWEFodko4dXdaYUxkNEplZ1Z2bUtCL1F5VFNuVTZtamdRMUp5?=
 =?utf-8?B?cURRdnJITHA3cEZvNUE2elV0bXVkZ2I2eXBzVVpNcXJqdEFWZEZaa0ZkaFN4?=
 =?utf-8?B?K25FNkNvYXZWcllIbGkwY3pCK0VLc1N2Zko0bzNCZTdaKzRHV3luUU1Wbysw?=
 =?utf-8?B?cjBlWWxMejZTOWZDNGU3aHk5VFQvNWVuK3Z2bUNKbzVzVDNVTHJlbDVIcnVv?=
 =?utf-8?B?UytRcVJWZkpxSDh6Kzd4bmkrUUg0Zm0rMm1aQlJ0cVpCQk9JdFV4ckZZL0hH?=
 =?utf-8?Q?/Yq+RiKehzp+IUqFnQAzY6Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed16c4e1-3246-4969-ba23-08d9e398fb57
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2022 02:34:04.4437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0Gic8pCCN4diORJ3J+i8UibvI5o0NOVlFpLynXZ6SMQNcwjSspEIn4vLhtO9JDX1ni/Sr38406pjA2o6yhYzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2280
X-OriginatorOrg: intel.com

Hi Stephane,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220125]
[cannot apply to tip/x86/core rafael-pm/linux-next tip/perf/core v5.17-rc1 v5.16 v5.16-rc8 v5.17-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stephane-Eranian/perf-core-add-perf_clear_branch_entry_bitfields-helper/20220127-083516
base:    d25ee88530253138d0b20d43511ca5acbda4e9f7
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/archive/20220128/202201281639.FC1PUTSK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # https://github.com/0day-ci/linux/commit/933d072f6e0c0409115a8038a89a56979a042d30
         git remote add linux-review https://github.com/0day-ci/linux
         git fetch --no-tags linux-review Stephane-Eranian/perf-core-add-perf_clear_branch_entry_bitfields-helper/20220127-083516
         git checkout 933d072f6e0c0409115a8038a89a56979a042d30
         # save the config file to linux build tree
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 clang-analyzer

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <yujie.liu@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)

 >> arch/x86/events/amd/core.c:682:3: warning: Value stored to 'hwc' is never read [clang-analyzer-deadcode.DeadStores]
                    hwc = &cpuc->events[idx]->hw;
                    ^     ~~~~~~~~~~~~~~~~~~~~~~

vim +/hwc +682 arch/x86/events/amd/core.c

933d072f6e0c04 Stephane Eranian 2022-01-26  672
933d072f6e0c04 Stephane Eranian 2022-01-26  673  static void amd_pmu_enable_all(int added)
933d072f6e0c04 Stephane Eranian 2022-01-26  674  {
933d072f6e0c04 Stephane Eranian 2022-01-26  675  	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
933d072f6e0c04 Stephane Eranian 2022-01-26 @676  	struct hw_perf_event *hwc;
933d072f6e0c04 Stephane Eranian 2022-01-26  677  	int idx;
933d072f6e0c04 Stephane Eranian 2022-01-26  678
933d072f6e0c04 Stephane Eranian 2022-01-26  679  	amd_brs_enable_all();
933d072f6e0c04 Stephane Eranian 2022-01-26  680
933d072f6e0c04 Stephane Eranian 2022-01-26  681  	for (idx = 0; idx < x86_pmu.num_counters; idx++) {
933d072f6e0c04 Stephane Eranian 2022-01-26 @682  		hwc = &cpuc->events[idx]->hw;
933d072f6e0c04 Stephane Eranian 2022-01-26  683
933d072f6e0c04 Stephane Eranian 2022-01-26  684  		/* only activate events which are marked as active */
933d072f6e0c04 Stephane Eranian 2022-01-26  685  		if (!test_bit(idx, cpuc->active_mask))
933d072f6e0c04 Stephane Eranian 2022-01-26  686  			continue;
933d072f6e0c04 Stephane Eranian 2022-01-26  687
933d072f6e0c04 Stephane Eranian 2022-01-26  688  		amd_pmu_enable_event(cpuc->events[idx]);
933d072f6e0c04 Stephane Eranian 2022-01-26  689  	}
933d072f6e0c04 Stephane Eranian 2022-01-26  690  }
933d072f6e0c04 Stephane Eranian 2022-01-26  691

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
