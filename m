Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D041C4438
	for <llvm@lists.linux.dev>; Tue,  4 Oct 2022 23:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664925533; x=1696461533;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=53ypLlbwit+eZC/FOq8HPzWPyyed3a35tU6Sq1sc/xg=;
  b=QyH0LLZRjVdHDtxAgSadDnVL/xjXLo3al8JCoUxZnL0YMD0AjwKOkqAx
   FX7FWZ/9BbmjO25GDkl3mxWP9RzbM/eKwBok/qTbj7Rzm2VNvOxuOD71p
   Yhlk/7D8zzFcB5SutDN45QzgLH3EQ4oVtg7l/8LUf+prIkijhk/4xtAe1
   +fbZ22sRy8zzq8y3XsShZvaIPRfr/urWVLCF0ahuc+EnlBTBSp58JFs/M
   ICUp9CxRLB3cPCUNVDwBunwMBsfokWEhraxHu5p7NNnXwahJZc+enKZTE
   +l5pPraPnvLvxGDq5fumCAsoTAMiBoJO6ZyB4BPJeRbmxKGJ9qNDd9h8G
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="286262125"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="286262125"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 16:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="626386291"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="626386291"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP; 04 Oct 2022 16:18:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 4 Oct 2022 16:18:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 4 Oct 2022 16:18:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 4 Oct 2022 16:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFwTPYQRTGQQkBj2EUq5lwRY/UcvizonuIGaPgXKL/rmcTYgG8rmILZJxw2IDu6UNuPznq2TfiC5n4nXPTf+herVQBLOkKjf9FMamjkuIrO/6Hu3T6h1c/RlefoQ9AwO5K78iKN+hWmAJy1IwXfgB2UsBocPVJ26yNByE8w4aZi8khoLQmk29FbEi3sD195+LSI+9bCRLhUlCV6ROjgswSMoTTIn+PpfLSZBzec10aTYwKAMxY9b5B3IPSWXwqfVIDLtNB/ON7kRLbDjnGhIdwrjw+eAsoYc4GUmUg3bEJeKJ/oQYL/18tQOYQt2ORPtDOvSlJ04DG1m5sHehC5jFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F62olVu8UQ0z0lbbqFFlQ08Q3hS0W7yXcxsH1/H2Jbs=;
 b=HgizAomxztez3MP/xHWcvsj4aONbgkmipUVcuXankTbKz4rK4/cl1J2zM2b4u7jSKfpMA1T9cQT0YFn5xNOx1lLJy3u2EYYBLxHKgZkzLBBhiD+Ha6JQoZm00t/4+eIjqt6v0XUHEjjyuANRsIYCQGvW6FuDGS9v86Lmy9jMUdKGHsDobQNNWNnx3KmqOH44Cz/9J0KCpBYbWL7ne5cIMz/aRQnVxCGLfRQ7FUVq2vvVBenXTtpEA2Z2YCf3pn57rywV9B02bRWM/ouL4hEPTHrtiIq/uveSofvXEfi8cr7L3Q4M0eYedbcpjR53oVLWahLCJAbUtUbgiD8Ngsy1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Tue, 4 Oct
 2022 23:18:49 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::b572:2e32:300b:d14a]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::b572:2e32:300b:d14a%3]) with mapi id 15.20.5654.035; Tue, 4 Oct 2022
 23:18:49 +0000
Date: Tue, 4 Oct 2022 16:18:45 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: kernel test robot <lkp@intel.com>
CC: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, <llvm@lists.linux.dev>,
	<kbuild-all@lists.01.org>, Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 5475/12409] s390x-linux-ld:
 kernel/kexec_core.c:822: undefined reference to `__tsan_memcpy'
Message-ID: <Yzy/VbCd0e+K3ptN@iweiny-mobl>
References: <202210050509.cZtMcazl-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202210050509.cZtMcazl-lkp@intel.com>
X-ClientProxiedBy: SJ0PR05CA0064.namprd05.prod.outlook.com
 (2603:10b6:a03:332::9) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|SN7PR11MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ce5c5d-60b4-4c35-4dc4-08daa65ecb67
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yMdi8LOtEYGd2ki1AVwYoYPvaqtMzXCpaQbmZqx6rw8Ar12BpWt6jE+4FpwkE+pIH/GoXn+W+m1414cgIiosW8ICPXh9XrDgXFafaon1lMUdR0lteKx1MXOtNTrB47CdJAzI4S1hnAUsVcp2MNpDCSjEqDBPm6pTX8w0n4nPK3/sTxuqibIfG4rcp5t4Lk+j5ld+dNW621Kjo7o4/xAFyni/VjdaqGCA1PrPU0bDkUur0tHi7vy3NycD7LzI9hLp30R3N0v/ggq0jaP2p6lDp3uFmgdDJc9kj9+S08PtZqfsY3fmOMIVrVbUleiamSjl6hq1GbBMxHThzs5LRqovVmQUecfs+B7rmZQW1ZBi3OBidD+VVmwv54eZ90SkdJSns1yUFVDrdHmsIGvakpBgSTE2+B5K31mm0gB+MLwNM6E9eikjbX7n4pI41me+c71GzKKHMsIcdWa6NfUeYvqPhfspsjID5bf+TVAkjuCuVjj4k/2/NZnWicW2GHMxCIhSTuOrKpm3O/+Uuig93J1euGi+7SfarhlYQJZj48sdiCxYJiWzQtjncL7/k0lAzgQm4/BKPuCpS8CdHDQpRd++wSMrQj4aeW3bJI5u73t7w8cFMcU2zH3m/PAMi0Cy/Z8f8b0U0do4UswGV30JdliL9d+MK4WCSBgDizGUAt4I1EC3zHYqbopLBcgRJhLJip0fS9ip3AP08toG8DP3PyhGnf1/q5l4wkJcRWgw38dMKo/2ipSLBI6Ctn07lDEnfVGO/evNx54F5+2BuSij3LhLZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199015)(44832011)(478600001)(41300700001)(6862004)(8936002)(5660300002)(6636002)(316002)(54906003)(66476007)(66556008)(66946007)(4326008)(8676002)(6486002)(966005)(38100700002)(82960400001)(186003)(6512007)(6506007)(26005)(6666004)(86362001)(9686003)(83380400001)(33716001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3fFN2bRdBdGLCaJ/kvriMWGmbFwEXpL88cMWlXanlQ/TkxCIJXlzXznV/rF/?=
 =?us-ascii?Q?1Vof9gs9jI6PVKk6Ak4dJTUsPnMpBAxKBwqRqld5FcCOLCr7MuC8zxE5aDhU?=
 =?us-ascii?Q?kh5Ay5UMocMJzQfqPxe6LBWJQTQTpPSuqnn0zjIDvaI/BScOdnX//IXA1f40?=
 =?us-ascii?Q?zXVQ2T/x+/tW0st9aNqmZSJQy6OiOfo35IULehVEMQetDrMeP5LPl+Ns6peV?=
 =?us-ascii?Q?oVhLlhnjc1spfqVfSN1FUnz+GbRWO4dlCOpOizAHrZJxNLJ2+AeMfsikuMni?=
 =?us-ascii?Q?15X+oy9dSfmamrngqucaoAe0H6XdLD47Fgte2R+ZVcjVYUIC69aJ4PGaJg9x?=
 =?us-ascii?Q?awu1rgHLTRDRF5zw5+RdGf27WcVPzAMJ9AqG04A0tRgapg4Wv0WmndqtqyWR?=
 =?us-ascii?Q?ZOWJOoX/VWNtPQvC2bbSZ2b5USqiwJMlnkNEcQCiRHG3+K13IKotbHENqpr4?=
 =?us-ascii?Q?HhIvJPgX8be/TKGYpsNlv95svY7YGW3zB5Hc+4xMrz1nswfdwbny6Q1wtPBc?=
 =?us-ascii?Q?XBT/iGA6qpyR+M/0kpWWBpG85BfcyaYwQkcfI4FC2iO9ibHXtNPe7DnWcMm1?=
 =?us-ascii?Q?9K1yn1el7R94HJcXpito+P2/sOtuCJhRnsfwBOqPNAPm2Kg3+v5/+TZsIeg5?=
 =?us-ascii?Q?yAk5tb7cX75RdZpNrHfhZ5rRHXiAtsNbt+9Ai/q9OMhotCQSQoBiY2kBsGr2?=
 =?us-ascii?Q?Hg2R85Aiz8J+2FF8W4Ryxog+AXy3Mn57aFpOV7qnXmyvxxYWBxCsa0oFLNzU?=
 =?us-ascii?Q?MMvD59y7kRTbsjO2n5OZeaxjh+jM9gY+ronz5MDOfxC5+XTEnecZoSVHqDQ/?=
 =?us-ascii?Q?gyL3TXov3WSWKAVepI3pF2HU95g3ZOZVD1ZGRYFGtTXPnKuZ/kHU0Yso01Um?=
 =?us-ascii?Q?6QmA6h7QZz71Z/rmwOJoo9ADNy76VlFXQ+wIjYhn+ZCZy9+CUtI9JY4l3HLu?=
 =?us-ascii?Q?zwporu/fGwbFWmiu7nWMf3LCgF9DCpBhu/LPuFcnjp0zHtBJiQp8ukr+LyOC?=
 =?us-ascii?Q?vvzhsWC8qjalAI5/LGy85NImL8dBWcgvOL0Z2J6j8ExoEyAl6tyDakvsLHLQ?=
 =?us-ascii?Q?yfiIacDXWsPaXcMjxK+Qa8+tqfnUOABSqr2M2i556qo7HNg9YwQLLutJPP8D?=
 =?us-ascii?Q?gl3lqu/CkqQ302udY0QMHAgCBO/JVVqlyxiMicfLsxXoGysu3D5uzlOlKw85?=
 =?us-ascii?Q?DJXxHB2lZ8fT4nO1EwWydW68cRH7TrnFw+G3w4ZDvkmno6+tPCyaE20LX8Kx?=
 =?us-ascii?Q?YAoCi8y73/b1zX9kNEyw/Mz61m5cEPb/Nu/NDOkh4bqL9GXb44F3+NYJrubX?=
 =?us-ascii?Q?rr5zeMNzhs1mkfW+iInRAUM0QtS/wEGR0jd50DZg6GeDqNUpMR2MB9KqF2RL?=
 =?us-ascii?Q?o1YpJaQ2jHfpKBDG1jtVXTnx3mdh6i9bDzWIumCly7rx3j1Jlq2lNqyvwDqa?=
 =?us-ascii?Q?2lGROuzC0Cd0b9G9WIT9RItwJGfZh7tJfg5UAOT3w6G5fJTXFa0+Yx8CTJPn?=
 =?us-ascii?Q?j50u94XV7MQ00sXUeOoRc6fLp9/Jhu1JAyIFKzveP+T/P/E2aJYvWcxhtuap?=
 =?us-ascii?Q?CdQqW9Ybh5okwTfAISPsyihX9M5oxDavj3BRzzYq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ce5c5d-60b4-4c35-4dc4-08daa65ecb67
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 23:18:49.7746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8R4X107gb3y+f/TqJ29PCI6FCLCSREzkd4lLAN1EX/J0frIMxwON/H2C8mEe0f6O56Jt5+UAtzNwb/pxMXnpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6945
X-OriginatorOrg: intel.com

On Wed, Oct 05, 2022 at 05:05:12AM +0800, kernel test robot wrote:
> Hi Fabio,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

I don't think this is relevant.

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4d80748d16c82a9c2c4ea5feea96e476de3cd876
> commit: 948084f0f6959f602f89f679522b706a72da0285 [5475/12409] kexec: replace kmap() with kmap_local_page()
> config: s390-randconfig-r035-20221003
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=948084f0f6959f602f89f679522b706a72da0285
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 948084f0f6959f602f89f679522b706a72da0285
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> Note: the linux-next/master HEAD 4d80748d16c82a9c2c4ea5feea96e476de3cd876 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 

[snip]

>    s390x-linux-ld: kernel/kexec_core.o: in function `kimage_load_normal_segment':
>    kernel/kexec_core.c:814: undefined reference to `__tsan_memset'
> >> s390x-linux-ld: kernel/kexec_core.c:822: undefined reference to `__tsan_memcpy'
>    s390x-linux-ld: kernel/kexec_core.o: in function `_copy_from_user':

I don't see __tsan_memcpy anywhere in the current linux-next tree?

Ira
