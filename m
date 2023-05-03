Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5422F3A;
	Wed,  3 May 2023 17:37:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNtpdM3N8qbMbGZo+7RYxQ1b5L1J6l+5LTjSZZAXvx+1UufCAdH8H8qeIhalP0SaYaOPLt+GeU3O2wgaFol6WnnRB1A2cz0v/Jszb3Ddx1atOSMfSL+gjmjZKl8x/PPHMBV3DdP0l1uzCne+IQnUmuCHDr4/tX9MFaKjI0Atig6s3e97iBpgEqqqpGrWZQlSChpr6fgyiJzVBJb/GRrETsRRrMUKYOeqVHQttvrMBJuvMGuXw/pvtMYNoRsEdQcZH7OJgFyGGuYjfAYJi3CxTxbKPQoIqKfsU0Sh7cY4/SPkF333eljNwNgJdaxHkyVNWdhMQhrbsGcnq8xbKUCcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2shPECtq2wL0JftKuZ6Q8U/dT/kTivDYTD6aoNwejo=;
 b=lklmnS8L74YwS78MsO3ogEXDV1pcDT5xR/T+//8bCwTtpVO06t2zFqCa3MiMhW6ar7jomlbsIAgMk0nnneb9UFhg5xe3nkrriFSj50g8IQh15qur57K2wy8q0wlEIEYoTLKaMdjXRo7HTiwSbrHhQRF/hpUzFor2n/tob4vEIA4IGhNpkWG77qXlpn4cHp7Ar+SEI4RRDnG0dahLEbi0VuawSAB4no7rkN5o+gghqtZuEKhCE1SeCLtftCoIFKToNIfqgDRENl5vM+G6/6cAkgMJzFDJPbwdrNAv3a78NBFqdtYqTY9/zZ3FdNxhvooszw3EtJiUVIhY0n1CtnN9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2shPECtq2wL0JftKuZ6Q8U/dT/kTivDYTD6aoNwejo=;
 b=OAIcvKejRIxy//9wstPdqtTu1y0VE7UQbWkZqlb44eiL3OAZ66LAb8vWGAqi/5OuGPG5l81bffcEGycgz1HgoYR8Yng6lahB+rAladWV0isse+fzFn4xU8d1lpkP1MeTgVhC/htbLakD8CT2YoFqg4rLNkLK/+qUHTZ2r2kmrQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3008.namprd12.prod.outlook.com (2603:10b6:208:c8::17)
 by SN7PR12MB7177.namprd12.prod.outlook.com (2603:10b6:806:2a5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 17:37:15 +0000
Received: from MN2PR12MB3008.namprd12.prod.outlook.com
 ([fe80::13fd:6611:29cf:a351]) by MN2PR12MB3008.namprd12.prod.outlook.com
 ([fe80::13fd:6611:29cf:a351%4]) with mapi id 15.20.6363.022; Wed, 3 May 2023
 17:37:15 +0000
Message-ID: <9fdaf243-f301-6a2f-61cf-38d8ecf61d2e@amd.com>
Date: Wed, 3 May 2023 23:07:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [RFC PATCH V1 1/2] sched/numa: Introduce per vma scan counter
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <abd037023141f25f79c6bbbb801c8405e4c449a1.1683033105.git.raghavendra.kt@amd.com>
 <202305040103.BRgS5gsL-lkp@intel.com>
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <202305040103.BRgS5gsL-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0196.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::8) To MN2PR12MB3008.namprd12.prod.outlook.com
 (2603:10b6:208:c8::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3008:EE_|SN7PR12MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eab7ca3-00e9-4843-b881-08db4bfd0923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LPG37bPOtjjsjYNCVnj2iSsOYsvuaA1vqH/JNbmmwHtpznkSVyZLPCVjZSPzfztnshyVeetVwJooKmpzI+8z1wXzzbMfOmVyTxVkxFNMBDwBZTct3BCJlTQovK0yuAZm0u5G7o1jcFn6fNkGu2GRto4ueF4sATjxD6RJrxhG55sIt5n2VlJ0VGofeL8oVVKnyPOJAzBMIAhdziCIEHzf22Rx13BgYjlu0jIK6WETHsC6a8jqBEZYDVdt7UiugFu/2Fs6/h2msFPbD48wy8LZdzCgKPEksHuUtDwC2QxmQFQhAqP2ouEKDAbnVtpgHRMfOUS3paMienZIIcD/fSAPrUQaT2fgXrq28rI5XCYZ5r6AGaQe/xMGiOznTP2DN8r4EyqIVMtoEBk4kJ7C1Cu6MFMWkl+cbeApt8UcovA04I7xRYZGZtMFannNwWyLRa0sG75+bsuCBhJXaonLzvRHxbeub8u5gYkpewAwWfVp8RKtTuh5w/4Isd7O+s8pWzThtc8ySgp8VrOIdJ+VKGY4zq2YSbpXEi6uNDhZi1szryGpvXiy3GGuNC1qNVFhuvCixQyttC6A8o/TLeJAJkhmwScLR/HM5uNv1I2WGA5H0q6wS9D+sMHqEEsWUd0OwIwUihVADaBst7SxgbM7Ke9at3nsCUuuIOFoHGx2PJo+odGduHhuMOyc8d95gbql27yI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3008.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(66476007)(2616005)(186003)(26005)(6506007)(6512007)(316002)(66946007)(6916009)(66556008)(4326008)(41300700001)(966005)(8676002)(53546011)(38100700002)(31696002)(8936002)(5660300002)(6666004)(6486002)(478600001)(36756003)(2906002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2c1cmJzcEZxaUp6SzdKaWNjdjlMdUhSenlqS1VsU2FEVmtlSko0NWc4UWhE?=
 =?utf-8?B?M2dFakxqR2M4WVhWRlg1bitxM2lxVWRjNkkveGIyZWNFc0U0czBaV3NGTHBn?=
 =?utf-8?B?NFc5czY5R2NUU0liS1hLeVpjT3dSdjNiQWp0SitEUmY3Skl0a09TUU9oUUNt?=
 =?utf-8?B?SFZUemxDbmZyUmtvYWc5R2xkaytsNGJUd2k4RjB0RFdzQVAvV1kveWtCdXJN?=
 =?utf-8?B?UzRoN09paWRDcno5amxpTmVhOWRrZjhSMHlEcnE0NGxHOFJrRDA0ZWFHK0FX?=
 =?utf-8?B?UVhVWHBremFUODFKTWQ2Wm5oVjJqZ0RmMWFtQkppM3NQVHRwWGl1ak9vRUhF?=
 =?utf-8?B?SEV0MmMyWDJEalN0R0R4Mkt2Y1dKN1dFZTBQWFU4aWV2Ym9oUUc5Y0RBeVVj?=
 =?utf-8?B?S2ZUcGI4V2ljUWY4UVFvTnoySGhtdVZuT0pxNm9YSk8vNW5iWUxmUEtWaE9F?=
 =?utf-8?B?NWU1b1VpcTRpQlpQWlgwWDlITFNhQkZzK1haUE1WK0h4eUdrZnlkbmJ5R3Bu?=
 =?utf-8?B?aWVSQUFRbVZVSXRZdVkyZE4wTmx3K25aN1lIZU93amVBaEJBaHQwY2xCektw?=
 =?utf-8?B?UHVqTFQ0OVQ5VHY4UTQxdkIvb2ZPQ2ZjS2wxY3J1cS9wNnJLaFdXUEdack43?=
 =?utf-8?B?M1VWaHNQbUlxa0lmWm9tT0lIRkc5c2RJdWM0SS9Xd3N1eFJpUXJoRm9oV1kz?=
 =?utf-8?B?S3YzeEFxbVVUQkljOTkvclA3bk1CazErN3lNWm1tR0l6K2M3M3oweU5KK3VS?=
 =?utf-8?B?RmZ1OXhCZTNKNVlTQmhvVWtQa3E0UTZ0VVA1Zk1lczJLanNuZStwSHUvdHNq?=
 =?utf-8?B?OFVKdlNCL3lzWlJnTHEwMzhiZmxKNys4VllXaFV5cVgrcWo5ZDhnV2RnRHFt?=
 =?utf-8?B?bXc0dmdOVzlHNXJsRklya2libC9GOVlCUDhIVzJhQzFOMTVUeFI1dlEvYTVu?=
 =?utf-8?B?YUpYNEJEOWx3RkgwUDRUNlNlOFZ4UTgxdnBqRWgzL3BjUWZCQWdXZzUyTW1G?=
 =?utf-8?B?M2xpbFRMU0Y2SHhmNkpBVUJZZFFJZW83bFRIaDBrZFBTb0wyR2Nmc3hJb2I3?=
 =?utf-8?B?Ni9XbW5uTlBYSXNWWWJtWkpwNWJxZFhuV2ZzbVJzZ2dveXNmQzJweHlLMVAz?=
 =?utf-8?B?eWcwK0w2TW10WklFRERpOEg2OTBZYWhNRmQwdTk5dEduQm1aUkpEUEthQnpP?=
 =?utf-8?B?cDJ0ckZWN21sUmw2Y3p4WEZFNzU5SHd1UUhPcEJVSklvNFdzakt4VUk4NHp1?=
 =?utf-8?B?RkJZOTYveUNHUU1yN2FoYlJiREdvazArN1Q0Y0JaQk5FMjZHa2haUWlHQmlS?=
 =?utf-8?B?My9xY1dUeXMxS2NGTC95MjhVWXJMUG1mWDFNUlc1QzJBeHgvWlY4MTg3c2dQ?=
 =?utf-8?B?TUVBZEJtQjBNOFNvSCtTQnkwbGpBZUJVSVNGQklHVVNnMjdNK3hFUFNmazNH?=
 =?utf-8?B?bkM2K3psb0o3ZS9qT25vN2JDU1dpOGtUa2FPZllkaWFxWWpjVXlJbCttcERK?=
 =?utf-8?B?NE1KdWV2bkVPcmFtbGI5UURhY2JqQVJwcVpTZWFXblk5Vkx0cnExdEFBVVov?=
 =?utf-8?B?S3JaSHJHOGxhRk1QUFcveEN5UHR5T29WRUVqZno5NmRpOUc5SkIxQ0dvWlky?=
 =?utf-8?B?SnkxalhwQU55RnNqVlpHZGs2VzJzNzVudnBkekZPU21PejArMTR4cG1LY1BN?=
 =?utf-8?B?bDBYZWk5eituZFkwaGJna2VrYW9WME0zZHFiZ3gvUXlGK1hlT0NqKzBwMVgx?=
 =?utf-8?B?dXFwQ0hGUStKZXB6RjhwMkxxY1hPb0ptdCtWS0IzSzFCUitjS1BXbjkzbmc2?=
 =?utf-8?B?V3VGUjJ4d3ZhR29UY0c5a25LWVhPM2grTDc0VDMvWWpYc0hpbUcvdDk0UGJy?=
 =?utf-8?B?cmc1NzFIbDY1R0lKcktNY1JEYzJ2a09LdEJZZWsvZDhkY2JmMEg2aVBudTMz?=
 =?utf-8?B?RW8vc0pjb0Y1cHRDSUI4dmh5RHY5MjJlR2orMjVTazduUGhpT2wvak05eElM?=
 =?utf-8?B?T3J1cDJ0eG1EZ2Q1cUg2U3BJU1ZXYm8xRVB2bnozNUdYS0g4WEgxaGhMbFZ4?=
 =?utf-8?B?aVFNYjBrN2JSeGU4Rkl1Unpyd2FYbXNPbUU3a3BYUkxKYlYwZ2l2N2xtbnRt?=
 =?utf-8?Q?NDnLDkafeB+6uViDY0phVUiNU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eab7ca3-00e9-4843-b881-08db4bfd0923
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3008.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 17:37:15.8374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOFClCSbb1DiJYh3XfdN0j0egAF+EZg+dclCWlQmtUDyeNL6rAf7agqu4o28a5sXcetCuGWfOLoygwwsnxLEvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7177

On 5/3/2023 10:53 PM, kernel test robot wrote:
> Hi Raghavendra,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master next-20230428]
> [cannot apply to tip/sched/core tip/master tip/auto-latest v6.3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 

Sorry to miss about base patch explicitly (Though it is hidden in cover
letter that base was linux-next-april-2023).  so it was next-20230411

> url:    https://github.com/intel-lab-lkp/linux/commits/Raghavendra-K-T/sched-numa-Introduce-per-vma-scan-counter/20230503-100717
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/abd037023141f25f79c6bbbb801c8405e4c449a1.1683033105.git.raghavendra.kt%40amd.com
> patch subject: [RFC PATCH V1 1/2] sched/numa: Introduce per vma scan counter
> config: x86_64-randconfig-a016-20230501 (https://download.01.org/0day-ci/archive/20230504/202305040103.BRgS5gsL-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/2e4296f7fd895ddd9ab683b8bd350f3aa654d91d
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Raghavendra-K-T/sched-numa-Introduce-per-vma-scan-counter/20230503-100717
>          git checkout 2e4296f7fd895ddd9ab683b8bd350f3aa654d91d
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305040103.BRgS5gsL-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> kernel/sched/fair.c:2940:6: warning: variable 'windows' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>             if (scan_size < MAX_SCAN_WINDOW)
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>     kernel/sched/fair.c:2944:2: note: uninitialized use occurs here
>             windows /= 2;
>             ^~~~~~~
>     kernel/sched/fair.c:2940:2: note: remove the 'if' if its condition is always true
>             if (scan_size < MAX_SCAN_WINDOW)
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     kernel/sched/fair.c:2937:22: note: initialize the variable 'windows' to silence this warning
>             unsigned int windows;
>                                 ^
>                                  = 0
>     kernel/sched/fair.c:6191:6: warning: no previous prototype for function 'init_cfs_bandwidth' [-Wmissing-prototypes]
>     void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
>          ^
>     kernel/sched/fair.c:6191:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
>     ^
>     static
>     kernel/sched/fair.c:12003:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
>     void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
>          ^
>     kernel/sched/fair.c:12003:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
>     ^
>     static
>     kernel/sched/fair.c:12613:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
>     void free_fair_sched_group(struct task_group *tg) { }
>          ^
>     kernel/sched/fair.c:12613:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     void free_fair_sched_group(struct task_group *tg) { }
>     ^
>     static
>     kernel/sched/fair.c:12615:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
>     int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>         ^
>     kernel/sched/fair.c:12615:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>     ^
>     static
>     kernel/sched/fair.c:12620:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
>     void online_fair_sched_group(struct task_group *tg) { }
>          ^
>     kernel/sched/fair.c:12620:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     void online_fair_sched_group(struct task_group *tg) { }
>     ^
>     static
>     kernel/sched/fair.c:12622:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
>     void unregister_fair_sched_group(struct task_group *tg) { }
>          ^
>     kernel/sched/fair.c:12622:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     void unregister_fair_sched_group(struct task_group *tg) { }
>     ^
>     static
>     kernel/sched/fair.c:535:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
>     static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
>                        ^
>     kernel/sched/fair.c:556:19: warning: unused function 'tg_is_idle' [-Wunused-function]
>     static inline int tg_is_idle(struct task_group *tg)
>                       ^
>     kernel/sched/fair.c:3606:20: warning: unused function 'load_avg_is_decayed' [-Wunused-function]
>     static inline bool load_avg_is_decayed(struct sched_avg *sa)
>                        ^
>     kernel/sched/fair.c:6164:20: warning: unused function 'cfs_bandwidth_used' [-Wunused-function]
>     static inline bool cfs_bandwidth_used(void)
>                        ^
>     kernel/sched/fair.c:6172:20: warning: unused function 'sync_throttle' [-Wunused-function]
>     static inline void sync_throttle(struct task_group *tg, int cpu) {}
>                        ^
>     kernel/sched/fair.c:6197:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
>     static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
>                                         ^
>     kernel/sched/fair.c:6201:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
>     static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
>                        ^
>     kernel/sched/fair.c:9235:19: warning: unused function 'check_misfit_status' [-Wunused-function]
>     static inline int check_misfit_status(struct rq *rq, struct sched_domain *sd)
>                       ^
>     15 warnings generated.
> 
> 
> vim +2940 kernel/sched/fair.c
> 
>    2933	
>    2934	static bool vma_is_accessed(struct vm_area_struct *vma)
>    2935	{
>    2936		unsigned long pids;
>    2937		unsigned int windows;

Correct I did miss initialization windows=0 while splitting patch

>    2938		unsigned int scan_size = READ_ONCE(sysctl_numa_balancing_scan_size);
>    2939	
>> 2940		if (scan_size < MAX_SCAN_WINDOW)
>    2941			windows = MAX_SCAN_WINDOW / scan_size;
>    2942	
>    2943		/* Allow only half of the windows for disjoint set cases */
>    2944		windows /= 2;
>    2945	
>    2946		windows = max(VMA_DISJOINT_SET_ACCESS_THRESH, windows);
>    2947	
>    2948		/*
>    2949		 * Make sure to allow scanning of disjoint vma set for the first
>    2950		 * few times.
>    2951		 * OR At mm level allow unconditional access first two times, so that
>    2952		 * all the (pages) of VMAs get prot_none fault introduced irrespective
>    2953		 * of accesses.
>    2954		 * This is also done to avoid any side effect of task scanning
>    2955		 * amplifying the unfairness of disjoint set of VMAs' access.
>    2956		 */
>    2957		if (READ_ONCE(vma->numab_state->scan_counter) < windows ||
>    2958			READ_ONCE(current->mm->numa_scan_seq) < 2)
>    2959			return true;
>    2960	
>    2961		pids = vma->numab_state->access_pids[0] | vma->numab_state->access_pids[1];
>    2962	
>    2963		return test_bit(hash_32(current->pid, ilog2(BITS_PER_LONG)), &pids);
>    2964	}
>    2965	
> 

