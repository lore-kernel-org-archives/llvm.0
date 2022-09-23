Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE1E3D90
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663947063; x=1695483063;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=lZF8EUulYeY6I8hIhiNQBKSFEkp2+H9yTu++vDm4Vlo=;
  b=cUSlevfDBt4Z3lRodhUzXnhycjdNK2xdCxQNcarFwRkWrkdGglkivDsB
   h3e/sn342+Vf8yJaUc5MePMdCmyD/Oe6dBcH6pXON2c+YBBETW/bYUuBO
   3iu02/JnOjwoeBMcL6TlnC8gcR+za+ntQLk0hLVhhGemv7hQyId+qchXg
   qNLxavOye01WWm8LthOvfV8zl7d8fnUajdI0DUWhPrjrI8yFhGYJ8RKV0
   mF6iwetzRIpuHXOPO/RrsKygTFvOLF1Gb6MxeLRnWQ2MzXBYreizqte7H
   S2iuh7TIM9QFixmYrjADdCGnKHyDslGPca7jhimCYQ0lLCwQoQvFBzEzq
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="301499434"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="301499434"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 08:30:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="745829204"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP; 23 Sep 2022 08:30:42 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 08:30:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 08:30:41 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 08:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8cvb1ZR9p+DZqMiFOwk9HOxVMkbPsvxf94bpmPGrffMy1LuQjj+HNZpRL124W+GrltA+OIF91z8o6fhGpKBhj5GKzGVTOQVuZi1jMWnLHZjB6DkEBHNI0Xl9geECXpl+G07LsNkr+xQeCJ4ux+kDYLeIclecDysdy48Lkg7yZOXBWIvGUu8lBPQfsY2MXa2BWdsPs8ZocKte18lHe5SnLKQdv9KH59NKUhffB1SAIPMbevjsMVSdwmMHE7spJfVqwIGoHfOO7ufRwj65Zw6+vOwatQYlfCWaXAyO+azZaHNVkzwyCkscI57Q6Z/NWkUtYu1t/72z3KEB5tHobmtlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i03DdPOY2pI+fg6gsNaB5TiZNnv+bOFgQGzs/QXDPj8=;
 b=QgU5fVsm5NWA3gZvrei0w9FvAlZ9orohVpGVwn77lUDeT7lFs+zC+uJbUS0XTcFge0P7yVbTlAQRUW4ztBGD5W20XWfjngvRmmjtzidUFeBpWo+APgXKqvSk9ick+k911jeCn1xgVrJV0K0q13uRSW78nShM9whUNacp0d/wA+0V4O0Xhyl9jZsNtOknOsG4RqBnBQx3bwTWAoAPHXyt9uPYklh4PDaF4WuACAYp9IANx9NV0QMEn9toFciMk3i7iB9uL5X00eWfRp66J6f2nhRvMnNENK2nYXRD7kIbwK5IIM5u+4hT1d0gaFuQrtakgwp8bDQUafuUsMriA1ojCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by IA1PR11MB7175.namprd11.prod.outlook.com (2603:10b6:208:419::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Fri, 23 Sep
 2022 15:30:32 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be%4]) with mapi id 15.20.5654.019; Fri, 23 Sep 2022
 15:30:32 +0000
Date: Fri, 23 Sep 2022 23:30:20 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: kernel test robot <lkp@intel.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>, <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
	Linux Memory Management List <linux-mm@kvack.org>, Vasily Gorbik
	<gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [kbuild-all] Re: [linux-next:master 6347/9680] s390x-linux-ld:
 arch/s390/kernel/setup.c:523: undefined reference to `__tsan_memcpy'
Message-ID: <Yy3RDKWtOVH5/F6x@rli9-MOBL1.ccr.corp.intel.com>
References: <202209231914.X0DwumH0-lkp@intel.com>
 <Yy3PtisfDc5Wcg4b@dev-arch.thelio-3990X>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Yy3PtisfDc5Wcg4b@dev-arch.thelio-3990X>
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|IA1PR11MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: a83519a1-8c5d-4441-0856-08da9d788d04
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABoeviN2SkiRvb8rWU0Q8OQZ2oRoVieFfr3574L2Gzunn2I8BoIWJTZPGvmH4wf2j1ZtwEC77/RjEMI5pfuN/qApl4FUKVXiCixZiO8BFRLTqdSMgvrbjy06hjCR0rXjsuyJREqSArMDE1WTr1qskbax+Nz/IHGRK80FDEs6LkcYZNVlM2tERSRl7kpYz2Qp5S+wu/7Xc+QIcfF294PSjrv7WiDAyHKUaXiuNS2RMxwo60gUQaMWGByfIngE+GOMCXbcL4HILgjrjezk17ZKURiUWsaUAbqcoFjpIbSvNHFMBp4wqYWNy42QbMqQBJn2VPU5REKxBhqmu/nE+ZEuAib4XMNRXGX5d4+yrzAlg0t7KaSplFBi0eQISNDlMyUzHbgfXTph4Wd/ac30jX+o7y/E3sM5RWoa4BtrZlALOqzRCWhSi9DpKzxFSVbk/pl8Tls29NF3ZoWShf+uDzSor9RHGQ4TSXo12cOWC5ldAKd9Myn2kZCyNQ7kQp7Bgs9tErH4cPk7nJ57DNJFY9ymTBkiHEYhAw8IM1xkLUFfCrDWaydtJ3jhRmskmeNfU+4h8ZxrUZaBcK49XgpPfrpcT9XpLK/hLEX9JyErf3zmjZuAhVM5L+nE+SLb74Nzwrhw8XXtsBrPvC4XEzL2O3vSMmuO+/+LscOAFn0bM78kI2Ie+XikYfZ4A364XZ9YjwxBv99eato37ZT1Yk6ewZcAACPxprDTdzNnkG/eZ4k0WRjWxUWUWn/fiBGBt0bLjX/CeYdlMlG5C7BNYCJ/8tOBgcprMDZ6/n/twEh7X6CvgTdu5aMMV4ABx2cUqFJoSs93eBib31YwBdeNZKLhCbfkOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(376002)(396003)(366004)(346002)(136003)(451199015)(966005)(45080400002)(6512007)(26005)(8676002)(6666004)(6486002)(41300700001)(316002)(6506007)(6916009)(186003)(54906003)(2906002)(5660300002)(83380400001)(44832011)(38100700002)(66556008)(66476007)(30864003)(66946007)(86362001)(4326008)(478600001)(82960400001)(8936002)(95444003)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/I8Ch2hMBt7PRXVXz8VcYn6STS+O8eyxh7SMqiTDZI2LfCnp2C/t5ccz9oXB?=
 =?us-ascii?Q?TglIMVfcy0R7Wq6yC5i95z2b0itG4+J14vZLlCPfbNaQ9Gt+428CeORoqbhe?=
 =?us-ascii?Q?FNv6aBufOiph1QoZm/4uX6/qS0imqX7eBArMN7oLGw+5GICUvKsygASskSvi?=
 =?us-ascii?Q?8EXXe6hNy+pmFRTYOfD5ftIknLXGd46z2sUSeQ/V0c7g6p85rRv2o0yZkH+S?=
 =?us-ascii?Q?MxoO7lQmCmLZ+fz3DpbTLIZRwPB8bgnn/MiuV5WQjnTEJNBv3qwFIW1Gn/bJ?=
 =?us-ascii?Q?R0t0hUA91ZYr3Ur4LRrFknJtdXYMAhf6tE6+Ap/JzfKFwPJOIDZmJcKvh8pg?=
 =?us-ascii?Q?vwNOivh20GuFrlAz1D6f2yCSuqaSpDmQmWu9pJBz4xs5uS5DWzCUVX5q7f8I?=
 =?us-ascii?Q?eA18Alhrq24Wx+9/wN2/xsHrJytRmHUMowO8Aq10LXz6rzDLSkgsjXXEB68k?=
 =?us-ascii?Q?k0yOoW6H8BM5MHk5bXWuMCw6boGxccxWXLQoBUtlbq6aTbtiEsybKJewGdDn?=
 =?us-ascii?Q?3vbZAZn9fYerFPwBgVdQS+9LGbpsIT63DD4FaiaXV4QZYbaYKDNokPPrXf5P?=
 =?us-ascii?Q?9nPHgjtAm3IV547fBAiUxpfManU6M+2sJa72RlQhpnN9seu01uhYUFY1mw1+?=
 =?us-ascii?Q?h3x5xuJeuMBCUJwDyGaTnQzJ76PDxFQZ0I6lHbCWP3e2bAywtlb650M3QnJs?=
 =?us-ascii?Q?PjuEuK4D4BuNjP/eKbq+rnT8A/lvf7P6Ag4EcwXamHHt9FEXcqqdzNXuR9Zr?=
 =?us-ascii?Q?I0QjtPf1F/tYU8NZwLERfj1VDjxqXKff0rHk1wXO6iEchZHq2ekHdbJidj5F?=
 =?us-ascii?Q?BvkeiY3VbaKIT2uFPbCXeRc3VfsNj+ccPOvExVAa5jQOo73VD6oycMEQqS/+?=
 =?us-ascii?Q?/0zt4oouGUe3JG3/MitMWm54Bzkea1Dd6olt4bIImn8oHsfFHcIHkmjxgp01?=
 =?us-ascii?Q?0/jw9bdd0c3a9jTl5feM630qgFvWBPXflRHP3LYjUAgRuc9ySBbx1rMLNzRy?=
 =?us-ascii?Q?9ylmgmFsq5NNLpq3ZWEHjQLj26hdN7eRc3jULW6vVuHytLZVNxTe0os8y9Ug?=
 =?us-ascii?Q?cQFTDV3zdSS0IlANFToMRplxeicPBoXRZ8cwpSQTN1jIgrX6X5iJR/aIrM5b?=
 =?us-ascii?Q?rYd9/B50juXGSBNGPuqfIRc+s/tiZwHuymJGcmmoaVWs7M96GLfa6XB8o6qb?=
 =?us-ascii?Q?WZzCejf4fvtjYg2gIr8Lbh8Oi8b3OpWbsX5L1aqs9qQx8lJFVt2LT1r2CErK?=
 =?us-ascii?Q?UtT+h7tMz4+9uu4Lq36H27V0eb4QHpDurD56nAxjmS2SIdbLstltogbkdmu8?=
 =?us-ascii?Q?nVYHK8R5zvRjA5Rbsgsu6TU8iJhSAOwKi3Zb/mBPdV3foaeqXy7PZ7WMuGmf?=
 =?us-ascii?Q?XGOyYnjyne4FhjK0IPTq1eOcmS0rq5CMcvh++pkwYHZUoBcc+7ALZTlQhnrb?=
 =?us-ascii?Q?ipCd6MlCc12ot7QPiTCC/4AkrXKwS7Yp3c4EEgj6nLqVz/LjQmvGDI6A9e0A?=
 =?us-ascii?Q?Fb+lCPiOWj4WB9bkS08SEFbAgCOIcRkUDqM7VyJxH89YWe9mbfP6A+4hshS1?=
 =?us-ascii?Q?5T51VN+utL5/d+LwajTpau/2w7qoWcFZ7ZrIxWshh/H28WoU1gg5d3Dt9Ftw?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a83519a1-8c5d-4441-0856-08da9d788d04
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 15:30:32.2427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VHqCMM3ukEVMc+McqD33e+FbBRN5eXJAwF5o4Kf4z+wj3LGxAVw0sygMiFzefJMppgmWwKcE+HnrBjJwj7bVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7175
X-OriginatorOrg: intel.com

On Fri, Sep 23, 2022 at 08:24:38AM -0700, Nathan Chancellor wrote:
> Intel folks,
> 
> I thought these reports were not going to be delivered to kernel
> developers?

sorry, we will fix this soon, it's a wrong configuration that mixes
clang and gcc.

> 
> https://lore.kernel.org/Yx3HnuEDyFG0+G62@dev-arch.thelio-3990X/
> 
> Cheers,
> Nathan
> 
> On Fri, Sep 23, 2022 at 07:51:14PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   aaa11ce2ffc84166d11c4d2ac88c3fcf75425fbd
> > commit: 4df29d2b9024d6ababc6342cf5f721cbaff517b5 [6347/9680] s390/smp: rework absolute lowcore access
> > config: s390-randconfig-r014-20220922
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install s390 cross compiling tool for clang build
> >         # apt-get install binutils-s390x-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4df29d2b9024d6ababc6342cf5f721cbaff517b5
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 4df29d2b9024d6ababc6342cf5f721cbaff517b5
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > Note: the linux-next/master HEAD aaa11ce2ffc84166d11c4d2ac88c3fcf75425fbd builds fine.
> >       It may have been fixed somewhere.
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    s390x-linux-ld: init/main.o: in function `init_setup':
> >    init/main.c:587: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: init/main.o: in function `rdinit_setup':
> >    init/main.c:599: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: init/main.o: in function `parse_early_param':
> >    include/linux/fortify-string.h:169: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: init/main.o: in function `setup_boot_config':
> >    include/linux/fortify-string.h:169: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: init/main.o: in function `setup_command_line':
> >    include/linux/fortify-string.h:477: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: include/linux/fortify-string.h:477: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: init/main.o: in function `do_one_initcall':
> >    init/main.c:1289: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: init/main.c:1302: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: init/main.o: in function `initcall_blacklisted':
> >    init/main.c:1199: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: init/main.o: in function `repair_env_string':
> >    init/main.c:499: undefined reference to `__tsan_memmove'
> >    s390x-linux-ld: init/version.o: in function `early_hostname':
> >    include/linux/fortify-string.h:169: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: init/do_mounts.o: in function `name_to_dev_t':
> >    init/do_mounts.c:188: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: init/do_mounts.o: in function `name_to_dev_t':
> >    include/linux/fortify-string.h:477: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: init/do_mounts.o: in function `root_dev_setup':
> >    include/linux/fortify-string.h:169: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: init/do_mounts.o: in function `mount_block_root':
> >    init/do_mounts.c:399: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/time.o: in function `stp_work_fn':
> >    arch/s390/kernel/time.c:669: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/time.c:691: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/time.o: in function `stp_sync_clock':
> >    arch/s390/kernel/time.c:370: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/time.o: in function `stp_check_leap':
> >    arch/s390/kernel/time.c:606: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/time.o:arch/s390/kernel/time.c:593: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/kernel/time.o: in function `leap_seconds_scheduled_show':
> >    arch/s390/kernel/time.c:799: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/time.o: in function `time_early_init':
> >    arch/s390/kernel/time.c:81: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/time.c:82: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/time.o: in function `read_persistent_wall_and_boot_offset':
> >    include/linux/time64.h:83: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/time.o: in function `read_persistent_wall_and_boot_offset':
> >    arch/s390/kernel/time.c:222: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/process.o: in function `arch_dup_task_struct':
> >    arch/s390/kernel/process.c:92: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/process.c:103: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/process.o: in function `copy_thread':
> >    arch/s390/kernel/process.c:126: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/process.c:127: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/process.c:131: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/process.c:160: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/process.c:149: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/process.o: in function `__get_wchan':
> >    arch/s390/kernel/process.c:197: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/early.o: in function `startup_init':
> >    arch/s390/kernel/early.c:253: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/early.o: in function `setup_facility_list':
> >    arch/s390/kernel/early.c:172: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/early.o: in function `setup_arch_string':
> >    arch/s390/kernel/early.c:113: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/early.c:113: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/early.c:98: undefined reference to `__tsan_memmove'
> >    s390x-linux-ld: arch/s390/kernel/early.c:104: undefined reference to `__tsan_memmove'
> >    s390x-linux-ld: arch/s390/kernel/early.c:98: undefined reference to `__tsan_memmove'
> >    s390x-linux-ld: arch/s390/kernel/early.c:104: undefined reference to `__tsan_memmove'
> >    s390x-linux-ld: arch/s390/kernel/setup.o: in function `relocate_amode31_section':
> >    arch/s390/kernel/setup.c:842: undefined reference to `__tsan_memmove'
> >    s390x-linux-ld: arch/s390/kernel/setup.c:844: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/setup.o: in function `setup_resources':
> >    arch/s390/kernel/setup.c:590: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/setup.o: in function `setup_lowcore_dat_off':
> >    arch/s390/kernel/setup.c:484: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/setup.o: in function `setup_lowcore_dat_on':
> >    arch/s390/kernel/setup.c:522: undefined reference to `__tsan_memcpy'
> > >> s390x-linux-ld: arch/s390/kernel/setup.c:523: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/setup.o: in function `conmode_default':
> >    arch/s390/kernel/setup.c:245: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/setup.o: in function `setup_zfcpdump':
> >    include/linux/fortify-string.h:98: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/setup.o: in function `setup_randomness':
> >    arch/s390/include/asm/cpacf.h:230: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/idle.o: in function `account_idle_time_irq':
> >    arch/s390/kernel/idle.c:27: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/idle.o: in function `arch_cpu_idle':
> >    arch/s390/kernel/idle.c:64: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/vtime.o: in function `do_account_vtime':
> >    arch/s390/kernel/vtime.c:68: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/vtime.c:88: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/processor.o: in function `setup_elf_platform':
> >    arch/s390/kernel/processor.c:(.init.text+0x450): undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/syscall.o: in function `__se_sys_mmap2':
> >    arch/s390/kernel/syscall.c:58: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/syscall.o: in function `__se_sys_mmap2':
> >    include/linux/uaccess.h:122: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `update_cr_regs':
> >    arch/s390/kernel/ptrace.c:44: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.c:44: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `ptrace_disable':
> >    arch/s390/kernel/ptrace.c:137: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o:arch/s390/kernel/ptrace.c:138: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_regs_get':
> >    arch/s390/kernel/ptrace.c:848: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_fpregs_get':
> >    arch/s390/kernel/ptrace.c:892: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_fpregs_get':
> >    arch/s390/include/asm/fpu/internal.h:48: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_fpregs_get':
> >    include/linux/regset.h:42: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_fpregs_set':
> >    arch/s390/kernel/ptrace.c:909: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.c:917: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_fpregs_set':
> >    include/linux/regset.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: include/linux/regset.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_fpregs_set':
> >    arch/s390/kernel/ptrace.c:940: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_system_call_get':
> >    arch/s390/kernel/ptrace.c:1054: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o:include/linux/regset.h:266: more undefined references to `__tsan_memcpy' follow
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_vxrs_low_get':
> >    arch/s390/kernel/ptrace.c:985: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_vxrs_low_get':
> >    include/linux/regset.h:42: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_vxrs_low_set':
> >    arch/s390/kernel/ptrace.c:1002: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_vxrs_low_set':
> >    include/linux/regset.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_vxrs_high_get':
> >    include/linux/regset.h:42: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_vxrs_high_set':
> >    include/linux/regset.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_gs_cb_get':
> >    include/linux/regset.h:42: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_gs_cb_set':
> >    arch/s390/kernel/ptrace.c:1087: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.c:1102: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_gs_cb_set':
> >    include/linux/regset.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_gs_cb_set':
> >    arch/s390/kernel/ptrace.c:1112: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_gs_bc_get':
> >    include/linux/regset.h:42: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_gs_bc_set':
> >    include/linux/regset.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o:include/linux/regset.h:42: more undefined references to `__tsan_memcpy' follow
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_runtime_instr_set':
> >    arch/s390/kernel/ptrace.c:1198: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.c:1214: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_runtime_instr_set':
> >    include/linux/regset.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/ptrace.o: in function `s390_runtime_instr_set':
> >    arch/s390/kernel/ptrace.c:1236: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/signal.o: in function `restore_sigregs':
> >    arch/s390/kernel/signal.c:141: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/signal.c:167: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/signal.o:arch/s390/kernel/signal.c:168: more undefined references to `__tsan_memcpy' follow
> >    s390x-linux-ld: arch/s390/kernel/signal.o: in function `restore_sigregs_ext':
> >    arch/s390/kernel/signal.c:201: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/signal.o: in function `arch_do_signal_or_restart':
> >    arch/s390/kernel/signal.c:457: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/signal.o: in function `save_sigregs':
> >    arch/s390/kernel/signal.c:123: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/signal.c:130: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/signal.c:131: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/signal.o: in function `save_sigregs':
> >    arch/s390/include/asm/fpu/internal.h:48: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/signal.o: in function `save_sigregs_ext':
> >    arch/s390/kernel/signal.c:181: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/cpcmd.o: in function `__cpcmd':
> >    arch/s390/kernel/cpcmd.c:72: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/cpcmd.c:77: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/cpcmd.o: in function `cpcmd':
> >    arch/s390/kernel/cpcmd.c:105: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/nmi.o: in function `__s390_handle_mcck':
> >    arch/s390/kernel/nmi.c:141: undefined reference to `__tsan_memset'
> > --
> >    arch/s390/include/asm/os_info.h:48: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `get_vmcoreinfo_old':
> >    arch/s390/kernel/crash_dump.c:386: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `get_vmcoreinfo_old':
> >    arch/s390/include/asm/os_info.h:48: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/include/asm/os_info.h:48: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/include/asm/os_info.h:48: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `nt_init_name':
> >    arch/s390/kernel/crash_dump.c:271: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/crash_dump.c:274: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/crash_dump.o: in function `save_area_add_regs':
> >    arch/s390/kernel/crash_dump.c:93: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/crash_dump.c:94: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/crash_dump.c:95: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/crash_dump.o:arch/s390/kernel/crash_dump.c:96: more undefined references to `__tsan_memcpy' follow
> >    s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_components':
> >    arch/s390/kernel/machine_kexec_file.c:238: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/machine_kexec_file.c:267: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_initrd':
> >    arch/s390/kernel/machine_kexec_file.c:151: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_purgatory':
> >    arch/s390/kernel/machine_kexec_file.c:130: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/machine_kexec_file.o: in function `kexec_file_add_ipl_report':
> >    arch/s390/kernel/machine_kexec_file.c:181: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/kexec_image.o: in function `kexec_file_add_kernel_image':
> >    arch/s390/kernel/kexec_image.c:19: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/kexec_elf.o: in function `kexec_file_add_kernel_elf':
> >    arch/s390/kernel/kexec_elf.c:19: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_event.o:arch/s390/kernel/perf_event.c:106: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_cf.o: in function `event_show':
> >    arch/s390/kernel/perf_cpum_cf.c:1408: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumf_measurement_alert':
> >    arch/s390/kernel/perf_cpum_sf.c:109: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.c:109: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `hw_perf_event_update':
> >    arch/s390/kernel/perf_cpum_sf.c:1084: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `hw_perf_event_update':
> >    include/linux/perf_event.h:1060: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `hw_perf_event_update':
> >    arch/s390/kernel/perf_cpum_sf.c:1094: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o:arch/s390/kernel/perf_cpum_sf.c:109: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_pmu_disable':
> >    arch/s390/kernel/perf_cpum_sf.c:1014: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_pmu_event_init':
> >    arch/s390/kernel/perf_cpum_sf.c:767: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.c:796: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.c:805: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_pmu_check_period':
> >    arch/s390/kernel/perf_cpum_sf.c:1815: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.c:1825: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `event_show':
> >    arch/s390/kernel/perf_cpum_sf.c:1995: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `cpumsf_output_event_pid':
> >    arch/s390/kernel/perf_cpum_sf.c:663: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `setup_pmc_cpu':
> >    arch/s390/kernel/perf_cpum_sf.c:550: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.c:109: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.c:109: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o: in function `free_sampling_buffer':
> >    arch/s390/kernel/perf_cpum_sf.c:161: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_sf.o:arch/s390/kernel/perf_cpum_sf.c:326: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_cf_events.o: in function `event_show':
> >    arch/s390/kernel/perf_cpum_cf_events.c:788: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/perf_cpum_cf_events.o: in function `cpumf_cf_event_group':
> >    arch/s390/kernel/perf_cpum_cf_events.c:841: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.o: in function `paicrypt_sched_task':
> >    arch/s390/kernel/perf_pai_crypto.c:348: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.c:349: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.c:350: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.o: in function `paicrypt_sched_task':
> >    include/linux/perf_event.h:1060: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.o:arch/s390/kernel/perf_pai_crypto.c:374: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.o: in function `event_show':
> >    arch/s390/kernel/perf_pai_crypto.c:406: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kernel/perf_pai_crypto.o: in function `paicrypt_init':
> >    arch/s390/kernel/perf_pai_crypto.c:660: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/uv.o: in function `uv_destroy_owned_page':
> >    arch/s390/kernel/uv.c:106: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/uv.o: in function `uv_convert_from_secure':
> >    arch/s390/kernel/uv.c:148: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/uv.o: in function `uv_convert_owned_from_secure':
> >    arch/s390/kernel/uv.c:148: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/uv.o: in function `gmap_make_secure':
> >    arch/s390/kernel/uv.c:148: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kernel/uv.o:arch/s390/kernel/uv.c:355: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/mm/extmem.o: in function `query_segment_type':
> >    arch/s390/mm/extmem.c:229: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/mm/extmem.o: in function `segment_load':
> >    arch/s390/mm/extmem.c:100: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/extmem.o: in function `segment_by_name':
> >    arch/s390/mm/extmem.c:112: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/extmem.c:100: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/extmem.o: in function `segment_save':
> >    arch/s390/mm/extmem.c:567: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/extmem.c:568: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/mmap.o:arch/s390/mm/mmap.c:80: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/mm/maccess.o: in function `s390_kernel_write':
> >    arch/s390/mm/maccess.c:66: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/mm/maccess.o: in function `xlate_dev_mem_ptr':
> >    arch/s390/mm/maccess.c:197: undefined reference to `__tsan_memcpy'
> > >> s390x-linux-ld: arch/s390/mm/maccess.c:(.text+0x552): undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/mm/extable.o: in function `fixup_exception':
> >    arch/s390/mm/extable.c:45: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/dump_pagetables.o: in function `ptdump_check_wx':
> >    arch/s390/mm/dump_pagetables.c:193: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/dump_pagetables.c:190: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/dump_pagetables.c:204: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/mm/dump_pagetables.o: in function `pt_dump_init':
> >    arch/s390/mm/dump_pagetables.c:265: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/mm/gmap.o: in function `gmap_free':
> >    arch/s390/mm/gmap.c:152: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/gmap.c:153: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/gmap.o: in function `gmap_sync_dirty_log_pmd':
> >    include/linux/bitmap.h:255: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/gmap.o: in function `__s390_uv_destroy_range':
> >    arch/s390/mm/gmap.c:2763: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/gmap.o: in function `s390_replace_asce':
> >    arch/s390/mm/gmap.c:2845: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/mm/gmap.o: in function `gmap_radix_tree_free':
> >    arch/s390/mm/gmap.c:127: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/mm/gmap.c:128: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/kvm_main.o: in function `kvm_vcpu_unmap':
> >    arch/s390/kvm/../../../virt/kvm/kvm_main.c:2873: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/kvm_main.o: in function `kvm_io_bus_register_dev':
> >    arch/s390/kvm/../../../virt/kvm/kvm_main.c:5307: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/../../../virt/kvm/kvm_main.c:5310: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/kvm_main.o: in function `kvm_io_bus_unregister_dev':
> >    arch/s390/kvm/../../../virt/kvm/kvm_main.c:5343: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/../../../virt/kvm/kvm_main.c:5345: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/kvm_main.o: in function `kvm_init':
> >    arch/s390/kvm/../../../virt/kvm/kvm_main.c:5817: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/kvm_main.o: in function `kvm_vm_create_worker_thread':
> >    arch/s390/kvm/../../../virt/kvm/kvm_main.c:6028: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/kvm_main.o: in function `kvm_replace_memslot':
> >    include/linux/list.h:841: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/kvm_main.o: in function `kvm_replace_memslot':
> >    include/linux/rbtree.h:63: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/kvm_main.o: in function `kvm_device_ioctl_attr':
> >    arch/s390/kvm/../../../virt/kvm/kvm_main.c:4290: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/kvm_main.o:include/linux/uaccess.h:122: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/../../virt/kvm/eventfd.o: in function `kvm_irqfd':
> >    arch/s390/kvm/../../../virt/kvm/eventfd.c:261: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/eventfd.o: in function `kvm_irq_routing_update':
> >    arch/s390/kvm/../../../virt/kvm/eventfd.c:252: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/../../../virt/kvm/eventfd.c:261: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/eventfd.o: in function `irqfd_wakeup':
> >    arch/s390/kvm/../../../virt/kvm/eventfd.c:191: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/../../../virt/kvm/eventfd.c:204: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/irqchip.o: in function `kvm_irq_map_gsi':
> >    arch/s390/kvm/../../../virt/kvm/irqchip.c:33: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/irqchip.o: in function `kvm_send_userspace_msi':
> >    arch/s390/kvm/../../../virt/kvm/irqchip.c:51: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/../../virt/kvm/irqchip.o: in function `kvm_set_irq':
> >    arch/s390/kvm/../../../virt/kvm/irqchip.c:33: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_sync_dirty_log':
> >    arch/s390/kvm/kvm-s390.c:660: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_sync_dirty_log':
> >    include/linux/bitmap.h:245: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_vm_ioctl_get_dirty_log':
> >    arch/s390/kvm/kvm-s390.c:714: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    arch/s390/kvm/kvm-s390.c:2800: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.c:2819: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o:arch/s390/kvm/kvm-s390.c:2920: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    arch/s390/kvm/kvm-s390.c:1540: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.c:1152: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    include/linux/uaccess.h:122: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    arch/s390/kvm/kvm-s390.c:1212: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.c:1410: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    include/linux/bitmap.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: include/linux/bitmap.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    arch/s390/kvm/kvm-s390.c:1568: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.c:1570: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.c:1037: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.c:1047: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    include/linux/bitmap.h:266: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    include/linux/uaccess.h:122: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    arch/s390/kvm/kvm-s390.c:1244: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.c:1390: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_vm_ioctl':
> >    include/linux/uaccess.h:122: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: include/linux/uaccess.h:122: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: include/linux/uaccess.h:122: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_s390_handle_pv':
> >    arch/s390/kvm/kvm-s390.c:2563: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.c:2594: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o:arch/s390/include/asm/uv.h:327: more undefined references to `__tsan_memset' follow
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_s390_handle_pv':
> >    arch/s390/kvm/kvm-s390.c:2415: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.c:2692: undefined reference to `__tsan_memcpy'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_s390_handle_pv':
> >    include/linux/uaccess.h:122: undefined reference to `__tsan_memset'
> >    s390x-linux-ld: arch/s390/kvm/kvm-s390.o: in function `kvm_arch_crypto_set_masks':
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
> 
> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/s390 6.0.0-rc3 Kernel Configuration
> > #
> > CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project 791a7ae1ba3efd6bca96338e10ffde557ba83920)"
> > CONFIG_GCC_VERSION=0
> > CONFIG_CC_IS_CLANG=y
> > CONFIG_CLANG_VERSION=160000
> > CONFIG_AS_IS_LLVM=y
> > CONFIG_AS_VERSION=160000
> > CONFIG_LD_IS_BFD=y
> > CONFIG_LD_VERSION=23800
> > CONFIG_LLD_VERSION=0
> > CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
> > CONFIG_CC_HAS_ASM_INLINE=y
> > CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
> > CONFIG_PAHOLE_VERSION=123
> > CONFIG_IRQ_WORK=y
> > CONFIG_BUILDTIME_TABLE_SORT=y
> > CONFIG_THREAD_INFO_IN_TASK=y
> > 
> > #
> > # General setup
> > #
> > CONFIG_INIT_ENV_ARG_LIMIT=32
> > CONFIG_COMPILE_TEST=y
> > # CONFIG_WERROR is not set
> > CONFIG_LOCALVERSION=""
> > CONFIG_BUILD_SALT=""
> > CONFIG_HAVE_KERNEL_GZIP=y
> > CONFIG_HAVE_KERNEL_BZIP2=y
> > CONFIG_HAVE_KERNEL_LZMA=y
> > CONFIG_HAVE_KERNEL_XZ=y
> > CONFIG_HAVE_KERNEL_LZO=y
> > CONFIG_HAVE_KERNEL_LZ4=y
> > CONFIG_HAVE_KERNEL_ZSTD=y
> > CONFIG_HAVE_KERNEL_UNCOMPRESSED=y
> > # CONFIG_KERNEL_GZIP is not set
> > # CONFIG_KERNEL_BZIP2 is not set
> > # CONFIG_KERNEL_LZMA is not set
> > # CONFIG_KERNEL_XZ is not set
> > CONFIG_KERNEL_LZO=y
> > # CONFIG_KERNEL_LZ4 is not set
> > # CONFIG_KERNEL_ZSTD is not set
> > # CONFIG_KERNEL_UNCOMPRESSED is not set
> > CONFIG_DEFAULT_INIT=""
> > CONFIG_DEFAULT_HOSTNAME="(none)"
> > CONFIG_SYSVIPC=y
> > # CONFIG_WATCH_QUEUE is not set
> > CONFIG_CROSS_MEMORY_ATTACH=y
> > # CONFIG_USELIB is not set
> > CONFIG_HAVE_ARCH_AUDITSYSCALL=y
> > 
> > #
> > # IRQ subsystem
> > #
> > CONFIG_GENERIC_IRQ_CHIP=y
> > CONFIG_IRQ_DOMAIN=y
> > CONFIG_IRQ_SIM=y
> > CONFIG_IRQ_DOMAIN_HIERARCHY=y
> > CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
> > CONFIG_GENERIC_MSI_IRQ=y
> > CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
> > CONFIG_SPARSE_IRQ=y
> > # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> > # end of IRQ subsystem
> > 
> > CONFIG_GENERIC_TIME_VSYSCALL=y
> > CONFIG_GENERIC_CLOCKEVENTS=y
> > CONFIG_TIME_KUNIT_TEST=y
> > CONFIG_CONTEXT_TRACKING=y
> > CONFIG_CONTEXT_TRACKING_IDLE=y
> > 
> > #
> > # Timers subsystem
> > #
> > CONFIG_TICK_ONESHOT=y
> > CONFIG_HZ_PERIODIC=y
> > # CONFIG_NO_HZ_IDLE is not set
> > # CONFIG_NO_HZ is not set
> > CONFIG_HIGH_RES_TIMERS=y
> > # end of Timers subsystem
> > 
> > CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
> > 
> > #
> > # BPF subsystem
> > #
> > # CONFIG_BPF_SYSCALL is not set
> > # end of BPF subsystem
> > 
> > CONFIG_PREEMPT_NONE_BUILD=y
> > CONFIG_PREEMPT_NONE=y
> > # CONFIG_PREEMPT_VOLUNTARY is not set
> > # CONFIG_PREEMPT is not set
> > 
> > #
> > # CPU/Task time and stats accounting
> > #
> > CONFIG_VIRT_CPU_ACCOUNTING=y
> > CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
> > # CONFIG_PSI is not set
> > # end of CPU/Task time and stats accounting
> > 
> > CONFIG_CPU_ISOLATION=y
> > 
> > #
> > # RCU Subsystem
> > #
> > CONFIG_TREE_RCU=y
> > # CONFIG_RCU_EXPERT is not set
> > CONFIG_SRCU=y
> > CONFIG_TREE_SRCU=y
> > CONFIG_RCU_STALL_COMMON=y
> > CONFIG_RCU_NEED_SEGCBLIST=y
> > # end of RCU Subsystem
> > 
> > CONFIG_IKCONFIG=y
> > CONFIG_IKHEADERS=y
> > CONFIG_LOG_BUF_SHIFT=17
> > CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
> > CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
> > CONFIG_PRINTK_INDEX=y
> > 
> > #
> > # Scheduler features
> > #
> > # end of Scheduler features
> > 
> > CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
> > CONFIG_CC_HAS_INT128=y
> > CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
> > CONFIG_GCC12_NO_ARRAY_BOUNDS=y
> > CONFIG_CGROUPS=y
> > CONFIG_CGROUP_FAVOR_DYNMODS=y
> > # CONFIG_MEMCG is not set
> > # CONFIG_BLK_CGROUP is not set
> > CONFIG_CGROUP_SCHED=y
> > # CONFIG_FAIR_GROUP_SCHED is not set
> > CONFIG_RT_GROUP_SCHED=y
> > CONFIG_CGROUP_PIDS=y
> > # CONFIG_CGROUP_RDMA is not set
> > CONFIG_CGROUP_FREEZER=y
> > CONFIG_CPUSETS=y
> > # CONFIG_PROC_PID_CPUSET is not set
> > # CONFIG_CGROUP_DEVICE is not set
> > # CONFIG_CGROUP_CPUACCT is not set
> > CONFIG_CGROUP_PERF=y
> > # CONFIG_CGROUP_MISC is not set
> > # CONFIG_CGROUP_DEBUG is not set
> > # CONFIG_CHECKPOINT_RESTORE is not set
> > # CONFIG_SCHED_AUTOGROUP is not set
> > # CONFIG_SYSFS_DEPRECATED is not set
> > CONFIG_RELAY=y
> > # CONFIG_BLK_DEV_INITRD is not set
> > CONFIG_BOOT_CONFIG=y
> > CONFIG_BOOT_CONFIG_EMBED=y
> > CONFIG_BOOT_CONFIG_EMBED_FILE=""
> > # CONFIG_INITRAMFS_PRESERVE_MTIME is not set
> > # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> > CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> > CONFIG_SYSCTL_EXCEPTION_TRACE=y
> > CONFIG_EXPERT=y
> > # CONFIG_MULTIUSER is not set
> > # CONFIG_SGETMASK_SYSCALL is not set
> > CONFIG_SYSFS_SYSCALL=y
> > CONFIG_FHANDLE=y
> > CONFIG_POSIX_TIMERS=y
> > CONFIG_PRINTK=y
> > # CONFIG_BUG is not set
> > # CONFIG_BASE_FULL is not set
> > # CONFIG_FUTEX is not set
> > CONFIG_EPOLL=y
> > CONFIG_SIGNALFD=y
> > # CONFIG_TIMERFD is not set
> > CONFIG_EVENTFD=y
> > CONFIG_SHMEM=y
> > CONFIG_AIO=y
> > # CONFIG_IO_URING is not set
> > CONFIG_ADVISE_SYSCALLS=y
> > # CONFIG_MEMBARRIER is not set
> > CONFIG_KALLSYMS=y
> > CONFIG_KALLSYMS_ALL=y
> > CONFIG_KALLSYMS_BASE_RELATIVE=y
> > CONFIG_KCMP=y
> > # CONFIG_RSEQ is not set
> > CONFIG_EMBEDDED=y
> > CONFIG_HAVE_PERF_EVENTS=y
> > # CONFIG_PC104 is not set
> > 
> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=y
> > # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> > # end of Kernel Performance Events And Counters
> > 
> > CONFIG_PROFILING=y
> > # end of General setup
> > 
> > CONFIG_MMU=y
> > CONFIG_CPU_BIG_ENDIAN=y
> > CONFIG_LOCKDEP_SUPPORT=y
> > CONFIG_STACKTRACE_SUPPORT=y
> > CONFIG_GENERIC_HWEIGHT=y
> > CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
> > CONFIG_PGSTE=y
> > CONFIG_AUDIT_ARCH=y
> > CONFIG_NO_IOPORT_MAP=y
> > # CONFIG_PCI_QUIRKS is not set
> > CONFIG_ARCH_SUPPORTS_UPROBES=y
> > CONFIG_S390=y
> > CONFIG_SCHED_OMIT_FRAME_POINTER=y
> > CONFIG_PGTABLE_LEVELS=5
> > CONFIG_HAVE_LIVEPATCH=y
> > 
> > #
> > # Processor type and features
> > #
> > CONFIG_HAVE_MARCH_Z10_FEATURES=y
> > CONFIG_MARCH_Z10=y
> > # CONFIG_MARCH_Z196 is not set
> > # CONFIG_MARCH_ZEC12 is not set
> > # CONFIG_MARCH_Z13 is not set
> > # CONFIG_MARCH_Z14 is not set
> > # CONFIG_MARCH_Z15 is not set
> > # CONFIG_MARCH_Z16 is not set
> > CONFIG_MARCH_Z10_TUNE=y
> > # CONFIG_TUNE_DEFAULT is not set
> > CONFIG_TUNE_Z10=y
> > # CONFIG_TUNE_Z196 is not set
> > # CONFIG_TUNE_ZEC12 is not set
> > # CONFIG_TUNE_Z13 is not set
> > # CONFIG_TUNE_Z14 is not set
> > # CONFIG_TUNE_Z15 is not set
> > # CONFIG_TUNE_Z16 is not set
> > CONFIG_64BIT=y
> > CONFIG_COMMAND_LINE_SIZE=4096
> > CONFIG_SMP=y
> > CONFIG_NR_CPUS=64
> > CONFIG_HOTPLUG_CPU=y
> > # CONFIG_SCHED_TOPOLOGY is not set
> > # CONFIG_HZ_100 is not set
> > # CONFIG_HZ_250 is not set
> > CONFIG_HZ_300=y
> > # CONFIG_HZ_1000 is not set
> > CONFIG_HZ=300
> > CONFIG_SCHED_HRTICK=y
> > CONFIG_KEXEC=y
> > CONFIG_KEXEC_FILE=y
> > CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
> > CONFIG_KERNEL_NOBP=y
> > CONFIG_RELOCATABLE=y
> > # CONFIG_RANDOMIZE_BASE is not set
> > # end of Processor type and features
> > 
> > #
> > # Memory setup
> > #
> > CONFIG_ARCH_SPARSEMEM_ENABLE=y
> > CONFIG_ARCH_SPARSEMEM_DEFAULT=y
> > CONFIG_MAX_PHYSMEM_BITS=46
> > # CONFIG_CHECK_STACK is not set
> > # end of Memory setup
> > 
> > #
> > # I/O subsystem
> > #
> > # CONFIG_QDIO is not set
> > CONFIG_PCI_NR_FUNCTIONS=512
> > CONFIG_HAS_IOMEM=y
> > # CONFIG_CHSC_SCH is not set
> > CONFIG_SCM_BUS=y
> > CONFIG_EADM_SCH=y
> > # end of I/O subsystem
> > 
> > #
> > # Dump support
> > #
> > CONFIG_CRASH_DUMP=y
> > # end of Dump support
> > 
> > CONFIG_CCW=y
> > 
> > #
> > # Virtualization
> > #
> > CONFIG_PROTECTED_VIRTUALIZATION_GUEST=y
> > CONFIG_PFAULT=y
> > # CONFIG_CMM is not set
> > CONFIG_S390_HYPFS_FS=y
> > CONFIG_HAVE_KVM=y
> > CONFIG_HAVE_KVM_IRQCHIP=y
> > CONFIG_HAVE_KVM_IRQFD=y
> > CONFIG_HAVE_KVM_IRQ_ROUTING=y
> > CONFIG_HAVE_KVM_EVENTFD=y
> > CONFIG_KVM_ASYNC_PF=y
> > CONFIG_KVM_ASYNC_PF_SYNC=y
> > CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=y
> > CONFIG_KVM_VFIO=y
> > CONFIG_HAVE_KVM_INVALID_WAKEUPS=y
> > CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
> > CONFIG_HAVE_KVM_NO_POLL=y
> > CONFIG_VIRTUALIZATION=y
> > CONFIG_KVM=y
> > # CONFIG_KVM_S390_UCONTROL is not set
> > # CONFIG_S390_GUEST is not set
> > # end of Virtualization
> > 
> > CONFIG_S390_MODULES_SANITY_TEST_HELPERS=y
> > 
> > #
> > # Selftests
> > #
> > # CONFIG_S390_UNWIND_SELFTEST is not set
> > CONFIG_S390_MODULES_SANITY_TEST=y
> > # end of Selftests
> > 
> > #
> > # General architecture-dependent options
> > #
> > CONFIG_CRASH_CORE=y
> > CONFIG_KEXEC_CORE=y
> > CONFIG_GENERIC_ENTRY=y
> > CONFIG_JUMP_LABEL=y
> > # CONFIG_STATIC_KEYS_SELFTEST is not set
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
> > CONFIG_ARCH_USE_BUILTIN_BSWAP=y
> > CONFIG_HAVE_IOREMAP_PROT=y
> > CONFIG_HAVE_KPROBES=y
> > CONFIG_HAVE_KRETPROBES=y
> > CONFIG_HAVE_KPROBES_ON_FTRACE=y
> > CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
> > CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
> > CONFIG_HAVE_NMI=y
> > CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> > CONFIG_HAVE_ARCH_TRACEHOOK=y
> > CONFIG_HAVE_DMA_CONTIGUOUS=y
> > CONFIG_GENERIC_SMP_IDLE_THREAD=y
> > CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
> > CONFIG_ARCH_HAS_SET_MEMORY=y
> > CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
> > CONFIG_ARCH_WANTS_NO_INSTR=y
> > CONFIG_ARCH_32BIT_USTAT_F_TINODE=y
> > CONFIG_HAVE_ASM_MODVERSIONS=y
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> > CONFIG_HAVE_RSEQ=y
> > CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
> > CONFIG_HAVE_PERF_REGS=y
> > CONFIG_HAVE_PERF_USER_STACK_DUMP=y
> > CONFIG_HAVE_ARCH_JUMP_LABEL=y
> > CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
> > CONFIG_MMU_GATHER_TABLE_FREE=y
> > CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
> > CONFIG_MMU_GATHER_MERGE_VMAS=y
> > CONFIG_MMU_GATHER_NO_GATHER=y
> > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
> > CONFIG_HAVE_CMPXCHG_LOCAL=y
> > CONFIG_HAVE_CMPXCHG_DOUBLE=y
> > CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
> > CONFIG_HAVE_ARCH_SECCOMP=y
> > CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
> > CONFIG_SECCOMP=y
> > CONFIG_LTO_NONE=y
> > CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
> > CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE=y
> > CONFIG_ARCH_HAS_SCALED_CPUTIME=y
> > CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> > CONFIG_HAVE_ARCH_SOFT_DIRTY=y
> > CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
> > CONFIG_MODULES_USE_ELF_RELA=y
> > CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
> > CONFIG_ALTERNATE_USER_ADDRESS_SPACE=y
> > CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
> > CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
> > CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
> > CONFIG_HAVE_RELIABLE_STACKTRACE=y
> > CONFIG_ISA_BUS_API=y
> > CONFIG_CLONE_BACKWARDS2=y
> > CONFIG_OLD_SIGSUSPEND3=y
> > CONFIG_OLD_SIGACTION=y
> > CONFIG_COMPAT_32BIT_TIME=y
> > CONFIG_HAVE_ARCH_VMAP_STACK=y
> > # CONFIG_VMAP_STACK is not set
> > CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
> > # CONFIG_RANDOMIZE_KSTACK_OFFSET is not set
> > CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
> > CONFIG_STRICT_KERNEL_RWX=y
> > CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
> > CONFIG_LOCK_EVENT_COUNTS=y
> > CONFIG_ARCH_HAS_MEM_ENCRYPT=y
> > CONFIG_ARCH_HAS_VDSO_DATA=y
> > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
> > 
> > #
> > # GCOV-based kernel profiling
> > #
> > # CONFIG_GCOV_KERNEL is not set
> > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
> > # end of GCOV-based kernel profiling
> > 
> > CONFIG_HAVE_GCC_PLUGINS=y
> > # end of General architecture-dependent options
> > 
> > CONFIG_RT_MUTEXES=y
> > CONFIG_BASE_SMALL=1
> > # CONFIG_MODULES is not set
> > CONFIG_BLOCK=y
> > CONFIG_BLOCK_LEGACY_AUTOLOAD=y
> > CONFIG_BLK_DEV_BSG_COMMON=y
> > CONFIG_BLK_ICQ=y
> > CONFIG_BLK_DEV_BSGLIB=y
> > CONFIG_BLK_DEV_INTEGRITY=y
> > CONFIG_BLK_DEV_INTEGRITY_T10=y
> > # CONFIG_BLK_DEV_ZONED is not set
> > # CONFIG_BLK_WBT is not set
> > # CONFIG_BLK_DEBUG_FS is not set
> > CONFIG_BLK_SED_OPAL=y
> > # CONFIG_BLK_INLINE_ENCRYPTION is not set
> > 
> > #
> > # Partition Types
> > #
> > # CONFIG_PARTITION_ADVANCED is not set
> > CONFIG_AMIGA_PARTITION=y
> > CONFIG_MSDOS_PARTITION=y
> > CONFIG_EFI_PARTITION=y
> > # end of Partition Types
> > 
> > CONFIG_BLK_MQ_PCI=y
> > CONFIG_BLK_MQ_VIRTIO=y
> > 
> > #
> > # IO Schedulers
> > #
> > CONFIG_MQ_IOSCHED_DEADLINE=y
> > CONFIG_MQ_IOSCHED_KYBER=y
> > CONFIG_IOSCHED_BFQ=y
> > # end of IO Schedulers
> > 
> > CONFIG_PREEMPT_NOTIFIERS=y
> > CONFIG_PADATA=y
> > CONFIG_ASN1=y
> > CONFIG_ARCH_INLINE_SPIN_TRYLOCK=y
> > CONFIG_ARCH_INLINE_SPIN_TRYLOCK_BH=y
> > CONFIG_ARCH_INLINE_SPIN_LOCK=y
> > CONFIG_ARCH_INLINE_SPIN_LOCK_BH=y
> > CONFIG_ARCH_INLINE_SPIN_LOCK_IRQ=y
> > CONFIG_ARCH_INLINE_SPIN_LOCK_IRQSAVE=y
> > CONFIG_ARCH_INLINE_SPIN_UNLOCK=y
> > CONFIG_ARCH_INLINE_SPIN_UNLOCK_BH=y
> > CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQ=y
> > CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE=y
> > CONFIG_ARCH_INLINE_READ_TRYLOCK=y
> > CONFIG_ARCH_INLINE_READ_LOCK=y
> > CONFIG_ARCH_INLINE_READ_LOCK_BH=y
> > CONFIG_ARCH_INLINE_READ_LOCK_IRQ=y
> > CONFIG_ARCH_INLINE_READ_LOCK_IRQSAVE=y
> > CONFIG_ARCH_INLINE_READ_UNLOCK=y
> > CONFIG_ARCH_INLINE_READ_UNLOCK_BH=y
> > CONFIG_ARCH_INLINE_READ_UNLOCK_IRQ=y
> > CONFIG_ARCH_INLINE_READ_UNLOCK_IRQRESTORE=y
> > CONFIG_ARCH_INLINE_WRITE_TRYLOCK=y
> > CONFIG_ARCH_INLINE_WRITE_LOCK=y
> > CONFIG_ARCH_INLINE_WRITE_LOCK_BH=y
> > CONFIG_ARCH_INLINE_WRITE_LOCK_IRQ=y
> > CONFIG_ARCH_INLINE_WRITE_LOCK_IRQSAVE=y
> > CONFIG_ARCH_INLINE_WRITE_UNLOCK=y
> > CONFIG_ARCH_INLINE_WRITE_UNLOCK_BH=y
> > CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQ=y
> > CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE=y
> > CONFIG_INLINE_SPIN_TRYLOCK=y
> > CONFIG_INLINE_SPIN_TRYLOCK_BH=y
> > CONFIG_INLINE_SPIN_LOCK=y
> > CONFIG_INLINE_SPIN_LOCK_BH=y
> > CONFIG_INLINE_SPIN_LOCK_IRQ=y
> > CONFIG_INLINE_SPIN_LOCK_IRQSAVE=y
> > CONFIG_INLINE_SPIN_UNLOCK_BH=y
> > CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
> > CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE=y
> > CONFIG_INLINE_READ_TRYLOCK=y
> > CONFIG_INLINE_READ_LOCK=y
> > CONFIG_INLINE_READ_LOCK_BH=y
> > CONFIG_INLINE_READ_LOCK_IRQ=y
> > CONFIG_INLINE_READ_LOCK_IRQSAVE=y
> > CONFIG_INLINE_READ_UNLOCK=y
> > CONFIG_INLINE_READ_UNLOCK_BH=y
> > CONFIG_INLINE_READ_UNLOCK_IRQ=y
> > CONFIG_INLINE_READ_UNLOCK_IRQRESTORE=y
> > CONFIG_INLINE_WRITE_TRYLOCK=y
> > CONFIG_INLINE_WRITE_LOCK=y
> > CONFIG_INLINE_WRITE_LOCK_BH=y
> > CONFIG_INLINE_WRITE_LOCK_IRQ=y
> > CONFIG_INLINE_WRITE_LOCK_IRQSAVE=y
> > CONFIG_INLINE_WRITE_UNLOCK=y
> > CONFIG_INLINE_WRITE_UNLOCK_BH=y
> > CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
> > CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE=y
> > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> > CONFIG_MUTEX_SPIN_ON_OWNER=y
> > CONFIG_RWSEM_SPIN_ON_OWNER=y
> > CONFIG_LOCK_SPIN_ON_OWNER=y
> > CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
> > CONFIG_FREEZER=y
> > 
> > #
> > # Executable file formats
> > #
> > CONFIG_BINFMT_ELF=y
> > CONFIG_BINFMT_ELF_KUNIT_TEST=y
> > CONFIG_ARCH_BINFMT_ELF_STATE=y
> > CONFIG_ELFCORE=y
> > CONFIG_BINFMT_SCRIPT=y
> > CONFIG_BINFMT_MISC=y
> > # CONFIG_COREDUMP is not set
> > # end of Executable file formats
> > 
> > #
> > # Memory Management options
> > #
> > # CONFIG_SWAP is not set
> > 
> > #
> > # SLAB allocator options
> > #
> > CONFIG_SLAB=y
> > # CONFIG_SLUB is not set
> > # CONFIG_SLOB is not set
> > # CONFIG_SLAB_MERGE_DEFAULT is not set
> > CONFIG_SLAB_FREELIST_RANDOM=y
> > # CONFIG_SLAB_FREELIST_HARDENED is not set
> > # end of SLAB allocator options
> > 
> > # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
> > CONFIG_COMPAT_BRK=y
> > CONFIG_SPARSEMEM=y
> > CONFIG_SPARSEMEM_EXTREME=y
> > CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
> > CONFIG_SPARSEMEM_VMEMMAP=y
> > CONFIG_HAVE_MEMBLOCK_PHYS_MAP=y
> > CONFIG_HAVE_FAST_GUP=y
> > CONFIG_MEMORY_ISOLATION=y
> > CONFIG_EXCLUSIVE_SYSTEM_RAM=y
> > CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
> > CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
> > CONFIG_MEMORY_HOTPLUG=y
> > # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> > # CONFIG_MEMORY_HOTREMOVE is not set
> > CONFIG_SPLIT_PTLOCK_CPUS=4
> > CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
> > # CONFIG_COMPACTION is not set
> > # CONFIG_PAGE_REPORTING is not set
> > CONFIG_MIGRATION=y
> > CONFIG_CONTIG_ALLOC=y
> > CONFIG_PHYS_ADDR_T_64BIT=y
> > CONFIG_MMU_NOTIFIER=y
> > CONFIG_KSM=y
> > CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> > # CONFIG_TRANSPARENT_HUGEPAGE is not set
> > CONFIG_CMA=y
> > # CONFIG_CMA_DEBUG is not set
> > CONFIG_CMA_DEBUGFS=y
> > CONFIG_CMA_SYSFS=y
> > CONFIG_CMA_AREAS=7
> > # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> > CONFIG_PAGE_IDLE_FLAG=y
> > CONFIG_IDLE_PAGE_TRACKING=y
> > CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
> > CONFIG_ZONE_DMA=y
> > CONFIG_GET_FREE_REGION=y
> > CONFIG_VM_EVENT_COUNTERS=y
> > CONFIG_PERCPU_STATS=y
> > # CONFIG_GUP_TEST is not set
> > CONFIG_ARCH_HAS_PTE_SPECIAL=y
> > # CONFIG_USERFAULTFD is not set
> > 
> > #
> > # Data Access Monitoring
> > #
> > # CONFIG_DAMON is not set
> > # end of Data Access Monitoring
> > # end of Memory Management options
> > 
> > # CONFIG_NET is not set
> > 
> > #
> > # Device Drivers
> > #
> > CONFIG_HAVE_PCI=y
> > CONFIG_PCI=y
> > CONFIG_PCI_DOMAINS=y
> > # CONFIG_PCIEPORTBUS is not set
> > CONFIG_PCIEASPM=y
> > CONFIG_PCIEASPM_DEFAULT=y
> > # CONFIG_PCIEASPM_POWERSAVE is not set
> > # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> > # CONFIG_PCIEASPM_PERFORMANCE is not set
> > CONFIG_PCIE_PTM=y
> > CONFIG_PCI_MSI=y
> > CONFIG_PCI_MSI_IRQ_DOMAIN=y
> > CONFIG_PCI_MSI_ARCH_FALLBACKS=y
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> > CONFIG_PCI_STUB=y
> > # CONFIG_PCI_PF_STUB is not set
> > CONFIG_PCI_ATS=y
> > CONFIG_PCI_DOE=y
> > CONFIG_PCI_ECAM=y
> > CONFIG_PCI_IOV=y
> > # CONFIG_PCI_PRI is not set
> > CONFIG_PCI_PASID=y
> > CONFIG_PCIE_BUS_TUNE_OFF=y
> > # CONFIG_PCIE_BUS_DEFAULT is not set
> > # CONFIG_PCIE_BUS_SAFE is not set
> > # CONFIG_PCIE_BUS_PERFORMANCE is not set
> > # CONFIG_PCIE_BUS_PEER2PEER is not set
> > # CONFIG_HOTPLUG_PCI is not set
> > 
> > #
> > # PCI controller drivers
> > #
> > CONFIG_PCIE_XILINX_NWL=y
> > CONFIG_PCI_TEGRA=y
> > CONFIG_PCIE_RCAR_HOST=y
> > CONFIG_PCI_HOST_COMMON=y
> > # CONFIG_PCIE_XILINX is not set
> > CONFIG_PCIE_XILINX_CPM=y
> > CONFIG_PCI_VERSATILE=y
> > # CONFIG_PCIE_ALTERA is not set
> > # CONFIG_PCIE_MEDIATEK_GEN3 is not set
> > CONFIG_PCIE_MT7621=y
> > 
> > #
> > # DesignWare PCI Core Support
> > #
> > CONFIG_PCIE_DW=y
> > CONFIG_PCIE_DW_HOST=y
> > CONFIG_PCIE_DW_PLAT=y
> > CONFIG_PCIE_DW_PLAT_HOST=y
> > # CONFIG_PCI_EXYNOS is not set
> > # CONFIG_PCI_IMX6 is not set
> > CONFIG_PCIE_SPEAR13XX=y
> > # CONFIG_PCI_KEYSTONE_HOST is not set
> > # CONFIG_PCIE_ARMADA_8K is not set
> > CONFIG_PCIE_ARTPEC6=y
> > CONFIG_PCIE_ARTPEC6_HOST=y
> > CONFIG_PCIE_KEEMBAY=y
> > CONFIG_PCIE_KEEMBAY_HOST=y
> > CONFIG_PCIE_HISI_STB=y
> > CONFIG_PCI_MESON=y
> > CONFIG_PCIE_TEGRA194=y
> > CONFIG_PCIE_TEGRA194_HOST=y
> > CONFIG_PCIE_VISCONTI_HOST=y
> > CONFIG_PCIE_FU740=y
> > # end of DesignWare PCI Core Support
> > 
> > #
> > # Mobiveil PCIe Core Support
> > #
> > # CONFIG_PCIE_LAYERSCAPE_GEN4 is not set
> > # end of Mobiveil PCIe Core Support
> > 
> > #
> > # Cadence PCIe controllers support
> > #
> > # end of Cadence PCIe controllers support
> > # end of PCI controller drivers
> > 
> > #
> > # PCI Endpoint
> > #
> > # CONFIG_PCI_ENDPOINT is not set
> > # end of PCI Endpoint
> > 
> > #
> > # PCI switch controller drivers
> > #
> > CONFIG_PCI_SW_SWITCHTEC=y
> > # end of PCI switch controller drivers
> > 
> > CONFIG_CXL_BUS=y
> > CONFIG_CXL_PCI=y
> > CONFIG_CXL_MEM_RAW_COMMANDS=y
> > CONFIG_CXL_MEM=y
> > CONFIG_CXL_PORT=y
> > CONFIG_CXL_REGION=y
> > CONFIG_PCCARD=y
> > # CONFIG_PCMCIA is not set
> > CONFIG_CARDBUS=y
> > 
> > #
> > # PC-card bridges
> > #
> > CONFIG_YENTA=y
> > # CONFIG_YENTA_O2 is not set
> > # CONFIG_YENTA_RICOH is not set
> > # CONFIG_YENTA_TI is not set
> > CONFIG_YENTA_TOSHIBA=y
> > CONFIG_RAPIDIO=y
> > CONFIG_RAPIDIO_DISC_TIMEOUT=30
> > CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=y
> > CONFIG_RAPIDIO_DEBUG=y
> > CONFIG_RAPIDIO_ENUM_BASIC=y
> > CONFIG_RAPIDIO_CHMAN=y
> > # CONFIG_RAPIDIO_MPORT_CDEV is not set
> > 
> > #
> > # RapidIO Switch drivers
> > #
> > CONFIG_RAPIDIO_CPS_XX=y
> > CONFIG_RAPIDIO_CPS_GEN2=y
> > CONFIG_RAPIDIO_RXS_GEN3=y
> > # end of RapidIO Switch drivers
> > 
> > #
> > # Generic Driver Options
> > #
> > CONFIG_UEVENT_HELPER=y
> > CONFIG_UEVENT_HELPER_PATH=""
> > CONFIG_DEVTMPFS=y
> > CONFIG_DEVTMPFS_MOUNT=y
> > # CONFIG_DEVTMPFS_SAFE is not set
> > # CONFIG_STANDALONE is not set
> > # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> > 
> > #
> > # Firmware loader
> > #
> > CONFIG_FW_LOADER=y
> > CONFIG_FW_LOADER_PAGED_BUF=y
> > CONFIG_FW_LOADER_SYSFS=y
> > CONFIG_EXTRA_FIRMWARE=""
> > # CONFIG_FW_LOADER_USER_HELPER is not set
> > CONFIG_FW_LOADER_COMPRESS=y
> > CONFIG_FW_LOADER_COMPRESS_XZ=y
> > # CONFIG_FW_LOADER_COMPRESS_ZSTD is not set
> > CONFIG_FW_UPLOAD=y
> > # end of Firmware loader
> > 
> > CONFIG_WANT_DEV_COREDUMP=y
> > # CONFIG_ALLOW_DEV_COREDUMP is not set
> > CONFIG_DEBUG_DRIVER=y
> > # CONFIG_DEBUG_DEVRES is not set
> > CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
> > CONFIG_PM_QOS_KUNIT_TEST=y
> > CONFIG_DRIVER_PE_KUNIT_TEST=y
> > CONFIG_SYS_HYPERVISOR=y
> > CONFIG_GENERIC_CPU_AUTOPROBE=y
> > CONFIG_GENERIC_CPU_VULNERABILITIES=y
> > CONFIG_SOC_BUS=y
> > CONFIG_REGMAP=y
> > CONFIG_REGMAP_I2C=y
> > CONFIG_REGMAP_SPMI=y
> > CONFIG_REGMAP_W1=y
> > CONFIG_REGMAP_MMIO=y
> > CONFIG_REGMAP_IRQ=y
> > CONFIG_DMA_SHARED_BUFFER=y
> > CONFIG_DMA_FENCE_TRACE=y
> > # end of Generic Driver Options
> > 
> > #
> > # Bus devices
> > #
> > # CONFIG_ARM_INTEGRATOR_LM is not set
> > # CONFIG_BT1_APB is not set
> > # CONFIG_BT1_AXI is not set
> > CONFIG_HISILICON_LPC=y
> > # CONFIG_INTEL_IXP4XX_EB is not set
> > # CONFIG_QCOM_EBI2 is not set
> > # CONFIG_MHI_BUS is not set
> > CONFIG_MHI_BUS_EP=y
> > # end of Bus devices
> > 
> > #
> > # Firmware Drivers
> > #
> > 
> > #
> > # ARM System Control and Management Interface Protocol
> > #
> > # CONFIG_ARM_SCMI_PROTOCOL is not set
> > # end of ARM System Control and Management Interface Protocol
> > 
> > # CONFIG_ARM_SCPI_PROTOCOL is not set
> > # CONFIG_FIRMWARE_MEMMAP is not set
> > CONFIG_MTK_ADSP_IPC=y
> > CONFIG_QCOM_SCM=y
> > # CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set
> > # CONFIG_BCM47XX_NVRAM is not set
> > CONFIG_TEE_BNXT_FW=y
> > # CONFIG_GOOGLE_FIRMWARE is not set
> > # CONFIG_IMX_DSP is not set
> > CONFIG_IMX_SCU=y
> > CONFIG_IMX_SCU_PD=y
> > 
> > #
> > # Tegra firmware driver
> > #
> > # end of Tegra firmware driver
> > # end of Firmware Drivers
> > 
> > # CONFIG_GNSS is not set
> > # CONFIG_MTD is not set
> > # CONFIG_OF is not set
> > CONFIG_PARPORT=y
> > # CONFIG_PARPORT_AX88796 is not set
> > # CONFIG_PARPORT_1284 is not set
> > # CONFIG_BLK_DEV is not set
> > 
> > #
> > # NVME Support
> > #
> > CONFIG_NVME_COMMON=y
> > CONFIG_NVME_CORE=y
> > CONFIG_BLK_DEV_NVME=y
> > CONFIG_NVME_MULTIPATH=y
> > CONFIG_NVME_VERBOSE_ERRORS=y
> > CONFIG_NVME_HWMON=y
> > CONFIG_NVME_FABRICS=y
> > CONFIG_NVME_FC=y
> > CONFIG_NVME_AUTH=y
> > CONFIG_NVME_TARGET=y
> > CONFIG_NVME_TARGET_PASSTHRU=y
> > CONFIG_NVME_TARGET_LOOP=y
> > # CONFIG_NVME_TARGET_FC is not set
> > # CONFIG_NVME_TARGET_AUTH is not set
> > # end of NVME Support
> > 
> > #
> > # Misc devices
> > #
> > CONFIG_AD525X_DPOT=y
> > CONFIG_AD525X_DPOT_I2C=y
> > CONFIG_DUMMY_IRQ=y
> > CONFIG_PHANTOM=y
> > # CONFIG_TIFM_CORE is not set
> > # CONFIG_ICS932S401 is not set
> > CONFIG_ATMEL_SSC=y
> > CONFIG_ENCLOSURE_SERVICES=y
> > CONFIG_HP_ILO=y
> > CONFIG_QCOM_COINCELL=y
> > CONFIG_QCOM_FASTRPC=y
> > CONFIG_APDS9802ALS=y
> > CONFIG_ISL29003=y
> > # CONFIG_ISL29020 is not set
> > CONFIG_SENSORS_TSL2550=y
> > CONFIG_SENSORS_BH1770=y
> > # CONFIG_SENSORS_APDS990X is not set
> > CONFIG_HMC6352=y
> > # CONFIG_DS1682 is not set
> > CONFIG_PCH_PHUB=y
> > CONFIG_SRAM=y
> > # CONFIG_DW_XDATA_PCIE is not set
> > CONFIG_PCI_ENDPOINT_TEST=y
> > # CONFIG_XILINX_SDFEC is not set
> > CONFIG_MISC_RTSX=y
> > # CONFIG_C2PORT is not set
> > 
> > #
> > # EEPROM support
> > #
> > CONFIG_EEPROM_AT24=y
> > CONFIG_EEPROM_LEGACY=y
> > CONFIG_EEPROM_MAX6875=y
> > CONFIG_EEPROM_93CX6=y
> > # CONFIG_EEPROM_IDT_89HPESX is not set
> > CONFIG_EEPROM_EE1004=y
> > # end of EEPROM support
> > 
> > CONFIG_CB710_CORE=y
> > # CONFIG_CB710_DEBUG is not set
> > CONFIG_CB710_DEBUG_ASSUMPTIONS=y
> > 
> > #
> > # Texas Instruments shared transport line discipline
> > #
> > # end of Texas Instruments shared transport line discipline
> > 
> > # CONFIG_SENSORS_LIS3_I2C is not set
> > # CONFIG_ALTERA_STAPL is not set
> > CONFIG_GENWQE=y
> > CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
> > CONFIG_ECHO=y
> > CONFIG_BCM_VK=y
> > # CONFIG_BCM_VK_TTY is not set
> > CONFIG_MISC_ALCOR_PCI=y
> > CONFIG_MISC_RTSX_PCI=y
> > CONFIG_HABANA_AI=y
> > CONFIG_UACCE=y
> > # CONFIG_PVPANIC is not set
> > # end of Misc devices
> > 
> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=y
> > CONFIG_RAID_ATTRS=y
> > CONFIG_SCSI_COMMON=y
> > CONFIG_SCSI=y
> > CONFIG_SCSI_DMA=y
> > 
> > #
> > # SCSI support type (disk, tape, CD-ROM)
> > #
> > # CONFIG_BLK_DEV_SD is not set
> > CONFIG_CHR_DEV_ST=y
> > CONFIG_CHR_DEV_SG=y
> > CONFIG_BLK_DEV_BSG=y
> > # CONFIG_CHR_DEV_SCH is not set
> > # CONFIG_SCSI_ENCLOSURE is not set
> > # CONFIG_SCSI_CONSTANTS is not set
> > # CONFIG_SCSI_LOGGING is not set
> > # CONFIG_SCSI_SCAN_ASYNC is not set
> > 
> > #
> > # SCSI Transports
> > #
> > CONFIG_SCSI_SPI_ATTRS=y
> > CONFIG_SCSI_SAS_ATTRS=y
> > CONFIG_SCSI_SAS_LIBSAS=y
> > CONFIG_SCSI_SAS_ATA=y
> > CONFIG_SCSI_SAS_HOST_SMP=y
> > # CONFIG_SCSI_SRP_ATTRS is not set
> > # end of SCSI Transports
> > 
> > # CONFIG_SCSI_LOWLEVEL is not set
> > # CONFIG_SCSI_DH is not set
> > # end of SCSI device support
> > 
> > CONFIG_ATA=y
> > CONFIG_SATA_HOST=y
> > CONFIG_PATA_TIMINGS=y
> > CONFIG_ATA_VERBOSE_ERROR=y
> > # CONFIG_ATA_FORCE is not set
> > CONFIG_SATA_PMP=y
> > 
> > #
> > # Controllers with non-SFF native interface
> > #
> > # CONFIG_SATA_AHCI is not set
> > # CONFIG_SATA_AHCI_PLATFORM is not set
> > CONFIG_AHCI_BRCM=y
> > CONFIG_AHCI_DA850=y
> > # CONFIG_AHCI_DM816 is not set
> > CONFIG_AHCI_IMX=y
> > CONFIG_AHCI_MTK=y
> > # CONFIG_AHCI_MVEBU is not set
> > CONFIG_AHCI_SUNXI=y
> > CONFIG_AHCI_TEGRA=y
> > # CONFIG_AHCI_XGENE is not set
> > # CONFIG_SATA_FSL is not set
> > CONFIG_SATA_AHCI_SEATTLE=y
> > CONFIG_SATA_INIC162X=y
> > CONFIG_SATA_ACARD_AHCI=y
> > # CONFIG_SATA_SIL24 is not set
> > CONFIG_ATA_SFF=y
> > 
> > #
> > # SFF controllers with custom DMA interface
> > #
> > # CONFIG_PDC_ADMA is not set
> > # CONFIG_SATA_QSTOR is not set
> > CONFIG_SATA_SX4=y
> > CONFIG_ATA_BMDMA=y
> > 
> > #
> > # SATA SFF controllers with BMDMA
> > #
> > CONFIG_ATA_PIIX=y
> > CONFIG_SATA_HIGHBANK=y
> > CONFIG_SATA_MV=y
> > CONFIG_SATA_NV=y
> > CONFIG_SATA_PROMISE=y
> > CONFIG_SATA_RCAR=y
> > # CONFIG_SATA_SIL is not set
> > CONFIG_SATA_SIS=y
> > CONFIG_SATA_SVW=y
> > # CONFIG_SATA_ULI is not set
> > # CONFIG_SATA_VIA is not set
> > CONFIG_SATA_VITESSE=y
> > 
> > #
> > # PATA SFF controllers with BMDMA
> > #
> > CONFIG_PATA_ALI=y
> > CONFIG_PATA_AMD=y
> > # CONFIG_PATA_ARTOP is not set
> > CONFIG_PATA_ATIIXP=y
> > CONFIG_PATA_ATP867X=y
> > # CONFIG_PATA_BK3710 is not set
> > CONFIG_PATA_CMD64X=y
> > CONFIG_PATA_CS5520=y
> > CONFIG_PATA_CS5530=y
> > CONFIG_PATA_CS5536=y
> > # CONFIG_PATA_CYPRESS is not set
> > CONFIG_PATA_EFAR=y
> > CONFIG_PATA_HPT366=y
> > CONFIG_PATA_HPT37X=y
> > CONFIG_PATA_HPT3X2N=y
> > CONFIG_PATA_HPT3X3=y
> > # CONFIG_PATA_HPT3X3_DMA is not set
> > CONFIG_PATA_IMX=y
> > CONFIG_PATA_IT8213=y
> > # CONFIG_PATA_IT821X is not set
> > # CONFIG_PATA_JMICRON is not set
> > CONFIG_PATA_MARVELL=y
> > # CONFIG_PATA_NETCELL is not set
> > CONFIG_PATA_NINJA32=y
> > CONFIG_PATA_NS87415=y
> > CONFIG_PATA_OLDPIIX=y
> > CONFIG_PATA_OPTIDMA=y
> > CONFIG_PATA_PDC2027X=y
> > CONFIG_PATA_PDC_OLD=y
> > # CONFIG_PATA_RADISYS is not set
> > # CONFIG_PATA_RDC is not set
> > CONFIG_PATA_SC1200=y
> > CONFIG_PATA_SCH=y
> > CONFIG_PATA_SERVERWORKS=y
> > CONFIG_PATA_SIL680=y
> > CONFIG_PATA_SIS=y
> > # CONFIG_PATA_TOSHIBA is not set
> > # CONFIG_PATA_TRIFLEX is not set
> > CONFIG_PATA_VIA=y
> > CONFIG_PATA_PXA=y
> > CONFIG_PATA_WINBOND=y
> > 
> > #
> > # PIO-only SFF controllers
> > #
> > CONFIG_PATA_CMD640_PCI=y
> > # CONFIG_PATA_IXP4XX_CF is not set
> > CONFIG_PATA_MPIIX=y
> > CONFIG_PATA_NS87410=y
> > # CONFIG_PATA_OPTI is not set
> > # CONFIG_PATA_PLATFORM is not set
> > CONFIG_PATA_RZ1000=y
> > CONFIG_PATA_SAMSUNG_CF=y
> > 
> > #
> > # Generic fallback / legacy drivers
> > #
> > # CONFIG_ATA_GENERIC is not set
> > CONFIG_PATA_LEGACY=y
> > # CONFIG_MD is not set
> > CONFIG_TARGET_CORE=y
> > CONFIG_TCM_IBLOCK=y
> > # CONFIG_TCM_FILEIO is not set
> > # CONFIG_TCM_PSCSI is not set
> > CONFIG_LOOPBACK_TARGET=y
> > # CONFIG_SBP_TARGET is not set
> > CONFIG_FUSION=y
> > CONFIG_FUSION_SPI=y
> > CONFIG_FUSION_SAS=y
> > CONFIG_FUSION_MAX_SGE=128
> > CONFIG_FUSION_CTL=y
> > CONFIG_FUSION_LOGGING=y
> > 
> > #
> > # IEEE 1394 (FireWire) support
> > #
> > CONFIG_FIREWIRE=y
> > # CONFIG_FIREWIRE_OHCI is not set
> > # CONFIG_FIREWIRE_SBP2 is not set
> > CONFIG_FIREWIRE_NOSY=y
> > # end of IEEE 1394 (FireWire) support
> > 
> > #
> > # Input device support
> > #
> > CONFIG_INPUT=y
> > # CONFIG_INPUT_LEDS is not set
> > CONFIG_INPUT_FF_MEMLESS=y
> > # CONFIG_INPUT_SPARSEKMAP is not set
> > CONFIG_INPUT_MATRIXKMAP=y
> > CONFIG_INPUT_VIVALDIFMAP=y
> > 
> > #
> > # Userland interfaces
> > #
> > # CONFIG_INPUT_MOUSEDEV is not set
> > # CONFIG_INPUT_JOYDEV is not set
> > # CONFIG_INPUT_EVDEV is not set
> > CONFIG_INPUT_EVBUG=y
> > 
> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=y
> > CONFIG_KEYBOARD_ADP5520=y
> > # CONFIG_KEYBOARD_ADP5588 is not set
> > CONFIG_KEYBOARD_ADP5589=y
> > CONFIG_KEYBOARD_ATKBD=y
> > # CONFIG_KEYBOARD_QT1050 is not set
> > # CONFIG_KEYBOARD_QT1070 is not set
> > CONFIG_KEYBOARD_QT2160=y
> > CONFIG_KEYBOARD_DLINK_DIR685=y
> > CONFIG_KEYBOARD_LKKBD=y
> > # CONFIG_KEYBOARD_EP93XX is not set
> > CONFIG_KEYBOARD_GPIO=y
> > CONFIG_KEYBOARD_GPIO_POLLED=y
> > CONFIG_KEYBOARD_TCA6416=y
> > CONFIG_KEYBOARD_TCA8418=y
> > CONFIG_KEYBOARD_MATRIX=y
> > # CONFIG_KEYBOARD_LM8323 is not set
> > # CONFIG_KEYBOARD_LM8333 is not set
> > # CONFIG_KEYBOARD_MAX7359 is not set
> > CONFIG_KEYBOARD_MCS=y
> > # CONFIG_KEYBOARD_MPR121 is not set
> > CONFIG_KEYBOARD_IMX=y
> > # CONFIG_KEYBOARD_IMX_SC_KEY is not set
> > CONFIG_KEYBOARD_NEWTON=y
> > CONFIG_KEYBOARD_OPENCORES=y
> > CONFIG_KEYBOARD_PMIC8XXX=y
> > CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
> > CONFIG_KEYBOARD_STOWAWAY=y
> > CONFIG_KEYBOARD_ST_KEYSCAN=y
> > CONFIG_KEYBOARD_SUNKBD=y
> > CONFIG_KEYBOARD_SH_KEYSC=y
> > # CONFIG_KEYBOARD_IQS62X is not set
> > CONFIG_KEYBOARD_TM2_TOUCHKEY=y
> > # CONFIG_KEYBOARD_TWL4030 is not set
> > CONFIG_KEYBOARD_XTKBD=y
> > # CONFIG_KEYBOARD_MT6779 is not set
> > CONFIG_KEYBOARD_MTK_PMIC=y
> > # CONFIG_KEYBOARD_CYPRESS_SF is not set
> > # CONFIG_INPUT_MOUSE is not set
> > # CONFIG_INPUT_JOYSTICK is not set
> > # CONFIG_INPUT_TABLET is not set
> > CONFIG_INPUT_TOUCHSCREEN=y
> > CONFIG_TOUCHSCREEN_AD7879=y
> > CONFIG_TOUCHSCREEN_AD7879_I2C=y
> > CONFIG_TOUCHSCREEN_ATMEL_MXT=y
> > # CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
> > CONFIG_TOUCHSCREEN_AUO_PIXCIR=y
> > # CONFIG_TOUCHSCREEN_BU21013 is not set
> > # CONFIG_TOUCHSCREEN_BU21029 is not set
> > CONFIG_TOUCHSCREEN_CY8CTMA140=y
> > CONFIG_TOUCHSCREEN_CY8CTMG110=y
> > CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
> > CONFIG_TOUCHSCREEN_CYTTSP_I2C=y
> > # CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
> > CONFIG_TOUCHSCREEN_DYNAPRO=y
> > CONFIG_TOUCHSCREEN_HAMPSHIRE=y
> > # CONFIG_TOUCHSCREEN_EETI is not set
> > # CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
> > CONFIG_TOUCHSCREEN_EXC3000=y
> > # CONFIG_TOUCHSCREEN_FUJITSU is not set
> > # CONFIG_TOUCHSCREEN_GOODIX is not set
> > CONFIG_TOUCHSCREEN_HIDEEP=y
> > CONFIG_TOUCHSCREEN_HYCON_HY46XX=y
> > CONFIG_TOUCHSCREEN_ILI210X=y
> > CONFIG_TOUCHSCREEN_ILITEK=y
> > CONFIG_TOUCHSCREEN_IPROC=y
> > CONFIG_TOUCHSCREEN_S6SY761=y
> > CONFIG_TOUCHSCREEN_GUNZE=y
> > CONFIG_TOUCHSCREEN_EKTF2127=y
> > CONFIG_TOUCHSCREEN_ELAN=y
> > CONFIG_TOUCHSCREEN_ELO=y
> > # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> > CONFIG_TOUCHSCREEN_WACOM_I2C=y
> > CONFIG_TOUCHSCREEN_MAX11801=y
> > # CONFIG_TOUCHSCREEN_MCS5000 is not set
> > CONFIG_TOUCHSCREEN_MMS114=y
> > # CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
> > # CONFIG_TOUCHSCREEN_MSG2638 is not set
> > CONFIG_TOUCHSCREEN_MTOUCH=y
> > CONFIG_TOUCHSCREEN_IMAGIS=y
> > CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
> > CONFIG_TOUCHSCREEN_INEXIO=y
> > CONFIG_TOUCHSCREEN_MK712=y
> > CONFIG_TOUCHSCREEN_PENMOUNT=y
> > CONFIG_TOUCHSCREEN_EDT_FT5X06=y
> > CONFIG_TOUCHSCREEN_RASPBERRYPI_FW=y
> > CONFIG_TOUCHSCREEN_MIGOR=y
> > # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> > # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> > CONFIG_TOUCHSCREEN_TI_AM335X_TSC=y
> > CONFIG_TOUCHSCREEN_PIXCIR=y
> > # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
> > # CONFIG_TOUCHSCREEN_WM831X is not set
> > # CONFIG_TOUCHSCREEN_WM97XX is not set
> > CONFIG_TOUCHSCREEN_MC13783=y
> > CONFIG_TOUCHSCREEN_TOUCHIT213=y
> > CONFIG_TOUCHSCREEN_TSC_SERIO=y
> > # CONFIG_TOUCHSCREEN_TSC2004 is not set
> > CONFIG_TOUCHSCREEN_TSC2007=y
> > # CONFIG_TOUCHSCREEN_RM_TS is not set
> > CONFIG_TOUCHSCREEN_SILEAD=y
> > CONFIG_TOUCHSCREEN_SIS_I2C=y
> > CONFIG_TOUCHSCREEN_ST1232=y
> > CONFIG_TOUCHSCREEN_STMFTS=y
> > # CONFIG_TOUCHSCREEN_SUN4I is not set
> > CONFIG_TOUCHSCREEN_SX8654=y
> > # CONFIG_TOUCHSCREEN_TPS6507X is not set
> > # CONFIG_TOUCHSCREEN_ZET6223 is not set
> > CONFIG_TOUCHSCREEN_ZFORCE=y
> > CONFIG_TOUCHSCREEN_ROHM_BU21023=y
> > # CONFIG_TOUCHSCREEN_IQS5XX is not set
> > CONFIG_TOUCHSCREEN_ZINITIX=y
> > CONFIG_INPUT_MISC=y
> > CONFIG_INPUT_AD714X=y
> > CONFIG_INPUT_AD714X_I2C=y
> > # CONFIG_INPUT_ATC260X_ONKEY is not set
> > # CONFIG_INPUT_ATMEL_CAPTOUCH is not set
> > CONFIG_INPUT_BMA150=y
> > # CONFIG_INPUT_E3X0_BUTTON is not set
> > CONFIG_INPUT_PM8XXX_VIBRATOR=y
> > CONFIG_INPUT_PMIC8XXX_PWRKEY=y
> > # CONFIG_INPUT_MAX77693_HAPTIC is not set
> > CONFIG_INPUT_MAX8925_ONKEY=y
> > CONFIG_INPUT_MAX8997_HAPTIC=y
> > CONFIG_INPUT_MC13783_PWRBUTTON=y
> > CONFIG_INPUT_MMA8450=y
> > # CONFIG_INPUT_GPIO_BEEPER is not set
> > CONFIG_INPUT_GPIO_DECODER=y
> > CONFIG_INPUT_GPIO_VIBRA=y
> > CONFIG_INPUT_KXTJ9=y
> > # CONFIG_INPUT_REGULATOR_HAPTIC is not set
> > CONFIG_INPUT_RETU_PWRBUTTON=y
> > # CONFIG_INPUT_TWL4030_PWRBUTTON is not set
> > CONFIG_INPUT_TWL4030_VIBRA=y
> > CONFIG_INPUT_UINPUT=y
> > # CONFIG_INPUT_PCF8574 is not set
> > CONFIG_INPUT_PWM_BEEPER=y
> > CONFIG_INPUT_PWM_VIBRA=y
> > CONFIG_INPUT_GPIO_ROTARY_ENCODER=y
> > CONFIG_INPUT_DA7280_HAPTICS=y
> > # CONFIG_INPUT_DA9055_ONKEY is not set
> > CONFIG_INPUT_DA9063_ONKEY=y
> > CONFIG_INPUT_WM831X_ON=y
> > CONFIG_INPUT_ADXL34X=y
> > CONFIG_INPUT_ADXL34X_I2C=y
> > CONFIG_INPUT_IQS269A=y
> > # CONFIG_INPUT_IQS626A is not set
> > CONFIG_INPUT_IQS7222=y
> > CONFIG_INPUT_CMA3000=y
> > CONFIG_INPUT_CMA3000_I2C=y
> > CONFIG_INPUT_DRV260X_HAPTICS=y
> > # CONFIG_INPUT_DRV2665_HAPTICS is not set
> > CONFIG_INPUT_DRV2667_HAPTICS=y
> > CONFIG_INPUT_HISI_POWERKEY=y
> > CONFIG_INPUT_SC27XX_VIBRA=y
> > CONFIG_RMI4_CORE=y
> > # CONFIG_RMI4_I2C is not set
> > # CONFIG_RMI4_SMB is not set
> > CONFIG_RMI4_F03=y
> > CONFIG_RMI4_F03_SERIO=y
> > CONFIG_RMI4_2D_SENSOR=y
> > CONFIG_RMI4_F11=y
> > CONFIG_RMI4_F12=y
> > CONFIG_RMI4_F30=y
> > CONFIG_RMI4_F34=y
> > # CONFIG_RMI4_F3A is not set
> > # CONFIG_RMI4_F54 is not set
> > # CONFIG_RMI4_F55 is not set
> > 
> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=y
> > CONFIG_SERIO_SERPORT=y
> > # CONFIG_SERIO_PARKBD is not set
> > CONFIG_SERIO_PCIPS2=y
> > CONFIG_SERIO_LIBPS2=y
> > CONFIG_SERIO_RAW=y
> > CONFIG_SERIO_ALTERA_PS2=y
> > CONFIG_SERIO_PS2MULT=y
> > # CONFIG_SERIO_ARC_PS2 is not set
> > # CONFIG_SERIO_OLPC_APSP is not set
> > CONFIG_SERIO_SUN4I_PS2=y
> > CONFIG_SERIO_GPIO_PS2=y
> > # CONFIG_USERIO is not set
> > CONFIG_GAMEPORT=y
> > CONFIG_GAMEPORT_NS558=y
> > CONFIG_GAMEPORT_L4=y
> > # CONFIG_GAMEPORT_EMU10K1 is not set
> > CONFIG_GAMEPORT_FM801=y
> > # end of Hardware I/O ports
> > # end of Input device support
> > 
> > #
> > # Character devices
> > #
> > CONFIG_TTY=y
> > # CONFIG_VT is not set
> > # CONFIG_UNIX98_PTYS is not set
> > # CONFIG_LEGACY_PTYS is not set
> > CONFIG_LDISC_AUTOLOAD=y
> > 
> > #
> > # Serial drivers
> > #
> > CONFIG_SERIAL_EARLYCON=y
> > 
> > #
> > # Non-8250 serial port support
> > #
> > CONFIG_SERIAL_AMBA_PL010=y
> > CONFIG_SERIAL_AMBA_PL010_CONSOLE=y
> > # CONFIG_SERIAL_ATMEL is not set
> > CONFIG_SERIAL_MESON=y
> > # CONFIG_SERIAL_MESON_CONSOLE is not set
> > CONFIG_SERIAL_CLPS711X=y
> > # CONFIG_SERIAL_CLPS711X_CONSOLE is not set
> > CONFIG_SERIAL_SAMSUNG=y
> > CONFIG_SERIAL_SAMSUNG_UARTS_4=y
> > CONFIG_SERIAL_SAMSUNG_UARTS=4
> > # CONFIG_SERIAL_SAMSUNG_CONSOLE is not set
> > CONFIG_SERIAL_TEGRA=y
> > # CONFIG_SERIAL_TEGRA_TCU is not set
> > CONFIG_SERIAL_IMX=y
> > CONFIG_SERIAL_IMX_CONSOLE=y
> > CONFIG_SERIAL_UARTLITE=y
> > # CONFIG_SERIAL_UARTLITE_CONSOLE is not set
> > CONFIG_SERIAL_UARTLITE_NR_UARTS=1
> > # CONFIG_SERIAL_SH_SCI is not set
> > CONFIG_SERIAL_CORE=y
> > CONFIG_SERIAL_CORE_CONSOLE=y
> > # CONFIG_SERIAL_ICOM is not set
> > # CONFIG_SERIAL_JSM is not set
> > CONFIG_SERIAL_MSM=y
> > # CONFIG_SERIAL_MSM_CONSOLE is not set
> > CONFIG_SERIAL_QCOM_GENI=y
> > # CONFIG_SERIAL_QCOM_GENI_CONSOLE is not set
> > # CONFIG_SERIAL_VT8500 is not set
> > CONFIG_SERIAL_OMAP=y
> > # CONFIG_SERIAL_OMAP_CONSOLE is not set
> > # CONFIG_SERIAL_LANTIQ is not set
> > CONFIG_SERIAL_SCCNXP=y
> > CONFIG_SERIAL_SCCNXP_CONSOLE=y
> > CONFIG_SERIAL_SC16IS7XX_CORE=y
> > CONFIG_SERIAL_SC16IS7XX=y
> > CONFIG_SERIAL_SC16IS7XX_I2C=y
> > CONFIG_SERIAL_TIMBERDALE=y
> > CONFIG_SERIAL_BCM63XX=y
> > CONFIG_SERIAL_BCM63XX_CONSOLE=y
> > CONFIG_SERIAL_ALTERA_JTAGUART=y
> > CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
> > # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
> > # CONFIG_SERIAL_ALTERA_UART is not set
> > CONFIG_SERIAL_PCH_UART=y
> > CONFIG_SERIAL_PCH_UART_CONSOLE=y
> > # CONFIG_SERIAL_MXS_AUART is not set
> > # CONFIG_SERIAL_MPS2_UART is not set
> > CONFIG_SERIAL_ARC=y
> > # CONFIG_SERIAL_ARC_CONSOLE is not set
> > CONFIG_SERIAL_ARC_NR_PORTS=1
> > CONFIG_SERIAL_RP2=y
> > CONFIG_SERIAL_RP2_NR_UARTS=32
> > CONFIG_SERIAL_FSL_LPUART=y
> > # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> > CONFIG_SERIAL_FSL_LINFLEXUART=y
> > # CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE is not set
> > # CONFIG_SERIAL_ST_ASC is not set
> > # CONFIG_SERIAL_MEN_Z135 is not set
> > CONFIG_SERIAL_STM32=y
> > CONFIG_SERIAL_STM32_CONSOLE=y
> > # CONFIG_SERIAL_OWL is not set
> > # CONFIG_SERIAL_RDA is not set
> > CONFIG_SERIAL_LITEUART=y
> > CONFIG_SERIAL_LITEUART_MAX_PORTS=1
> > # CONFIG_SERIAL_LITEUART_CONSOLE is not set
> > CONFIG_SERIAL_SUNPLUS=y
> > CONFIG_SERIAL_SUNPLUS_CONSOLE=y
> > # end of Serial drivers
> > 
> > CONFIG_SERIAL_MCTRL_GPIO=y
> > # CONFIG_SERIAL_NONSTANDARD is not set
> > CONFIG_NOZOMI=y
> > # CONFIG_NULL_TTY is not set
> > CONFIG_HVC_DRIVER=y
> > CONFIG_RPMSG_TTY=y
> > CONFIG_SERIAL_DEV_BUS=y
> > # CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
> > # CONFIG_TTY_PRINTK is not set
> > CONFIG_PRINTER=y
> > CONFIG_LP_CONSOLE=y
> > CONFIG_PPDEV=y
> > CONFIG_VIRTIO_CONSOLE=y
> > CONFIG_IPMI_HANDLER=y
> > CONFIG_IPMI_PLAT_DATA=y
> > # CONFIG_IPMI_PANIC_EVENT is not set
> > CONFIG_IPMI_DEVICE_INTERFACE=y
> > CONFIG_IPMI_SI=y
> > CONFIG_IPMI_SSIF=y
> > CONFIG_IPMI_IPMB=y
> > # CONFIG_IPMI_WATCHDOG is not set
> > # CONFIG_IPMI_POWEROFF is not set
> > CONFIG_IPMI_KCS_BMC=y
> > CONFIG_ASPEED_KCS_IPMI_BMC=y
> > CONFIG_NPCM7XX_KCS_IPMI_BMC=y
> > CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
> > # CONFIG_IPMI_KCS_BMC_SERIO is not set
> > CONFIG_ASPEED_BT_IPMI_BMC=y
> > CONFIG_IPMB_DEVICE_INTERFACE=y
> > CONFIG_HW_RANDOM=y
> > # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> > # CONFIG_HW_RANDOM_BA431 is not set
> > CONFIG_HW_RANDOM_BCM2835=y
> > CONFIG_HW_RANDOM_IPROC_RNG200=y
> > # CONFIG_HW_RANDOM_IXP4XX is not set
> > CONFIG_HW_RANDOM_OMAP=y
> > CONFIG_HW_RANDOM_OMAP3_ROM=y
> > # CONFIG_HW_RANDOM_VIRTIO is not set
> > CONFIG_HW_RANDOM_NOMADIK=y
> > # CONFIG_HW_RANDOM_STM32 is not set
> > CONFIG_HW_RANDOM_MESON=y
> > CONFIG_HW_RANDOM_MTK=y
> > # CONFIG_HW_RANDOM_S390 is not set
> > CONFIG_HW_RANDOM_EXYNOS=y
> > CONFIG_HW_RANDOM_NPCM=y
> > CONFIG_HW_RANDOM_XIPHERA=y
> > CONFIG_HW_RANDOM_CN10K=y
> > CONFIG_APPLICOM=y
> > CONFIG_DEVMEM=y
> > # CONFIG_DEVPORT is not set
> > CONFIG_HANGCHECK_TIMER=y
> > CONFIG_TCG_TPM=y
> > CONFIG_HW_RANDOM_TPM=y
> > CONFIG_TCG_TIS_CORE=y
> > CONFIG_TCG_TIS_I2C=y
> > # CONFIG_TCG_TIS_SYNQUACER is not set
> > # CONFIG_TCG_TIS_I2C_CR50 is not set
> > # CONFIG_TCG_TIS_I2C_ATMEL is not set
> > CONFIG_TCG_TIS_I2C_INFINEON=y
> > CONFIG_TCG_TIS_I2C_NUVOTON=y
> > # CONFIG_TCG_VTPM_PROXY is not set
> > CONFIG_TCG_TIS_ST33ZP24=y
> > CONFIG_TCG_TIS_ST33ZP24_I2C=y
> > 
> > #
> > # S/390 character device drivers
> > #
> > CONFIG_TN3270=y
> > CONFIG_TN3270_TTY=y
> > CONFIG_TN3270_FS=y
> > CONFIG_TN3270_CONSOLE=y
> > CONFIG_TN3215=y
> > # CONFIG_TN3215_CONSOLE is not set
> > CONFIG_CCW_CONSOLE=y
> > CONFIG_SCLP_TTY=y
> > # CONFIG_SCLP_CONSOLE is not set
> > # CONFIG_SCLP_VT220_TTY is not set
> > CONFIG_HMC_DRV=y
> > # CONFIG_SCLP_OFB is not set
> > CONFIG_S390_UV_UAPI=y
> > CONFIG_S390_TAPE=y
> > 
> > #
> > # S/390 tape hardware support
> > #
> > CONFIG_S390_TAPE_34XX=y
> > # CONFIG_S390_TAPE_3590 is not set
> > CONFIG_VMCP=y
> > CONFIG_VMCP_CMA_SIZE=4
> > # CONFIG_MONWRITER is not set
> > CONFIG_S390_VMUR=y
> > CONFIG_XILLYBUS_CLASS=y
> > CONFIG_XILLYBUS=y
> > # CONFIG_XILLYBUS_PCIE is not set
> > # CONFIG_RANDOM_TRUST_CPU is not set
> > CONFIG_RANDOM_TRUST_BOOTLOADER=y
> > # end of Character devices
> > 
> > #
> > # I2C support
> > #
> > CONFIG_I2C=y
> > CONFIG_I2C_BOARDINFO=y
> > # CONFIG_I2C_COMPAT is not set
> > # CONFIG_I2C_CHARDEV is not set
> > CONFIG_I2C_MUX=y
> > 
> > #
> > # Multiplexer I2C Chip support
> > #
> > # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> > # CONFIG_I2C_MUX_GPIO is not set
> > # CONFIG_I2C_MUX_GPMUX is not set
> > CONFIG_I2C_MUX_LTC4306=y
> > CONFIG_I2C_MUX_PCA9541=y
> > CONFIG_I2C_MUX_PCA954x=y
> > # CONFIG_I2C_MUX_PINCTRL is not set
> > CONFIG_I2C_MUX_REG=y
> > CONFIG_I2C_MUX_MLXCPLD=y
> > # end of Multiplexer I2C Chip support
> > 
> > CONFIG_I2C_HELPER_AUTO=y
> > CONFIG_I2C_SMBUS=y
> > CONFIG_I2C_ALGOBIT=y
> > 
> > #
> > # I2C Hardware Bus support
> > #
> > 
> > #
> > # PC SMBus host controller drivers
> > #
> > CONFIG_I2C_CCGX_UCSI=y
> > # CONFIG_I2C_ALI1535 is not set
> > CONFIG_I2C_ALI1563=y
> > CONFIG_I2C_ALI15X3=y
> > # CONFIG_I2C_AMD756 is not set
> > # CONFIG_I2C_AMD8111 is not set
> > # CONFIG_I2C_HIX5HD2 is not set
> > CONFIG_I2C_I801=y
> > # CONFIG_I2C_ISCH is not set
> > # CONFIG_I2C_PIIX4 is not set
> > CONFIG_I2C_NFORCE2=y
> > # CONFIG_I2C_NVIDIA_GPU is not set
> > CONFIG_I2C_SIS5595=y
> > CONFIG_I2C_SIS630=y
> > # CONFIG_I2C_SIS96X is not set
> > CONFIG_I2C_VIA=y
> > CONFIG_I2C_VIAPRO=y
> > 
> > #
> > # I2C system bus drivers (mostly embedded / system-on-chip)
> > #
> > CONFIG_I2C_ASPEED=y
> > # CONFIG_I2C_AT91 is not set
> > CONFIG_I2C_AXXIA=y
> > CONFIG_I2C_BCM_IPROC=y
> > CONFIG_I2C_BCM_KONA=y
> > # CONFIG_I2C_BRCMSTB is not set
> > CONFIG_I2C_CADENCE=y
> > CONFIG_I2C_CBUS_GPIO=y
> > # CONFIG_I2C_DAVINCI is not set
> > CONFIG_I2C_DESIGNWARE_CORE=y
> > CONFIG_I2C_DESIGNWARE_SLAVE=y
> > # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> > CONFIG_I2C_DESIGNWARE_PCI=y
> > # CONFIG_I2C_DIGICOLOR is not set
> > CONFIG_I2C_EG20T=y
> > CONFIG_I2C_GPIO=y
> > CONFIG_I2C_GPIO_FAULT_INJECTOR=y
> > CONFIG_I2C_HIGHLANDER=y
> > CONFIG_I2C_HISI=y
> > CONFIG_I2C_IMG=y
> > CONFIG_I2C_IMX=y
> > CONFIG_I2C_IMX_LPI2C=y
> > # CONFIG_I2C_IOP3XX is not set
> > # CONFIG_I2C_JZ4780 is not set
> > CONFIG_I2C_MT65XX=y
> > CONFIG_I2C_MT7621=y
> > CONFIG_I2C_MV64XXX=y
> > CONFIG_I2C_MXS=y
> > CONFIG_I2C_NPCM=y
> > # CONFIG_I2C_OCORES is not set
> > CONFIG_I2C_OMAP=y
> > CONFIG_I2C_OWL=y
> > CONFIG_I2C_APPLE=y
> > # CONFIG_I2C_PCA_PLATFORM is not set
> > # CONFIG_I2C_PNX is not set
> > # CONFIG_I2C_PXA is not set
> > CONFIG_I2C_QCOM_CCI=y
> > # CONFIG_I2C_QCOM_GENI is not set
> > # CONFIG_I2C_QUP is not set
> > CONFIG_I2C_RIIC=y
> > # CONFIG_I2C_RZV2M is not set
> > CONFIG_I2C_S3C2410=y
> > CONFIG_I2C_SH_MOBILE=y
> > CONFIG_I2C_SIMTEC=y
> > CONFIG_I2C_ST=y
> > CONFIG_I2C_STM32F4=y
> > # CONFIG_I2C_STM32F7 is not set
> > CONFIG_I2C_SYNQUACER=y
> > # CONFIG_I2C_TEGRA_BPMP is not set
> > CONFIG_I2C_UNIPHIER=y
> > # CONFIG_I2C_UNIPHIER_F is not set
> > CONFIG_I2C_VERSATILE=y
> > # CONFIG_I2C_WMT is not set
> > CONFIG_I2C_THUNDERX=y
> > CONFIG_I2C_XILINX=y
> > # CONFIG_I2C_XLP9XX is not set
> > # CONFIG_I2C_RCAR is not set
> > 
> > #
> > # External I2C/SMBus adapter drivers
> > #
> > CONFIG_I2C_PARPORT=y
> > CONFIG_I2C_TAOS_EVM=y
> > 
> > #
> > # Other I2C/SMBus bus drivers
> > #
> > CONFIG_I2C_MLXCPLD=y
> > # CONFIG_I2C_VIRTIO is not set
> > # end of I2C Hardware Bus support
> > 
> > CONFIG_I2C_SLAVE=y
> > # CONFIG_I2C_SLAVE_EEPROM is not set
> > CONFIG_I2C_SLAVE_TESTUNIT=y
> > # CONFIG_I2C_DEBUG_CORE is not set
> > CONFIG_I2C_DEBUG_ALGO=y
> > # CONFIG_I2C_DEBUG_BUS is not set
> > # end of I2C support
> > 
> > # CONFIG_I3C is not set
> > # CONFIG_SPI is not set
> > CONFIG_SPMI=y
> > CONFIG_SPMI_HISI3670=y
> > CONFIG_SPMI_MSM_PMIC_ARB=y
> > # CONFIG_SPMI_MTK_PMIF is not set
> > CONFIG_HSI=y
> > CONFIG_HSI_BOARDINFO=y
> > 
> > #
> > # HSI controllers
> > #
> > 
> > #
> > # HSI clients
> > #
> > CONFIG_HSI_CHAR=y
> > CONFIG_PPS=y
> > # CONFIG_PPS_DEBUG is not set
> > # CONFIG_NTP_PPS is not set
> > 
> > #
> > # PPS clients support
> > #
> > # CONFIG_PPS_CLIENT_KTIMER is not set
> > # CONFIG_PPS_CLIENT_LDISC is not set
> > CONFIG_PPS_CLIENT_PARPORT=y
> > CONFIG_PPS_CLIENT_GPIO=y
> > 
> > #
> > # PPS generators support
> > #
> > 
> > #
> > # PTP clock support
> > #
> > CONFIG_PTP_1588_CLOCK_OPTIONAL=y
> > 
> > #
> > # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> > #
> > # end of PTP clock support
> > 
> > CONFIG_PINCTRL=y
> > CONFIG_GENERIC_PINCTRL_GROUPS=y
> > CONFIG_PINMUX=y
> > CONFIG_PINCONF=y
> > CONFIG_GENERIC_PINCONF=y
> > CONFIG_DEBUG_PINCTRL=y
> > CONFIG_PINCTRL_AMD=y
> > CONFIG_PINCTRL_MCP23S08_I2C=y
> > CONFIG_PINCTRL_MCP23S08=y
> > CONFIG_PINCTRL_SX150X=y
> > CONFIG_PINCTRL_MADERA=y
> > CONFIG_PINCTRL_CS47L15=y
> > CONFIG_PINCTRL_CS47L35=y
> > CONFIG_PINCTRL_CS47L92=y
> > 
> > #
> > # Intel pinctrl drivers
> > #
> > # end of Intel pinctrl drivers
> > 
> > #
> > # MediaTek pinctrl drivers
> > #
> > CONFIG_EINT_MTK=y
> > # end of MediaTek pinctrl drivers
> > 
> > CONFIG_PINCTRL_PXA=y
> > CONFIG_PINCTRL_PXA25X=y
> > CONFIG_PINCTRL_PXA27X=y
> > CONFIG_PINCTRL_MSM=y
> > CONFIG_PINCTRL_SC7280_LPASS_LPI=y
> > # CONFIG_PINCTRL_SM8250_LPASS_LPI is not set
> > CONFIG_PINCTRL_SM8350=y
> > CONFIG_PINCTRL_LPASS_LPI=y
> > 
> > #
> > # Renesas pinctrl drivers
> > #
> > # CONFIG_PINCTRL_RENESAS is not set
> > CONFIG_PINCTRL_SH_PFC=y
> > CONFIG_PINCTRL_SH_PFC_GPIO=y
> > CONFIG_PINCTRL_SH_FUNC_GPIO=y
> > # CONFIG_PINCTRL_PFC_EMEV2 is not set
> > CONFIG_PINCTRL_PFC_R8A77995=y
> > CONFIG_PINCTRL_PFC_R8A7794=y
> > # CONFIG_PINCTRL_PFC_R8A77990 is not set
> > CONFIG_PINCTRL_PFC_R8A7779=y
> > CONFIG_PINCTRL_PFC_R8A7790=y
> > # CONFIG_PINCTRL_PFC_R8A77950 is not set
> > # CONFIG_PINCTRL_PFC_R8A77951 is not set
> > CONFIG_PINCTRL_PFC_R8A7778=y
> > CONFIG_PINCTRL_PFC_R8A7793=y
> > CONFIG_PINCTRL_PFC_R8A7791=y
> > CONFIG_PINCTRL_PFC_R8A77965=y
> > # CONFIG_PINCTRL_PFC_R8A77960 is not set
> > # CONFIG_PINCTRL_PFC_R8A77961 is not set
> > CONFIG_PINCTRL_PFC_R8A779F0=y
> > # CONFIG_PINCTRL_PFC_R8A7792 is not set
> > CONFIG_PINCTRL_PFC_R8A77980=y
> > # CONFIG_PINCTRL_PFC_R8A77970 is not set
> > # CONFIG_PINCTRL_PFC_R8A779A0 is not set
> > CONFIG_PINCTRL_PFC_R8A779G0=y
> > # CONFIG_PINCTRL_PFC_R8A7740 is not set
> > CONFIG_PINCTRL_PFC_R8A73A4=y
> > CONFIG_PINCTRL_PFC_R8A77470=y
> > CONFIG_PINCTRL_PFC_R8A7745=y
> > CONFIG_PINCTRL_PFC_R8A7742=y
> > # CONFIG_PINCTRL_PFC_R8A7743 is not set
> > # CONFIG_PINCTRL_PFC_R8A7744 is not set
> > # CONFIG_PINCTRL_PFC_R8A774C0 is not set
> > # CONFIG_PINCTRL_PFC_R8A774E1 is not set
> > CONFIG_PINCTRL_PFC_R8A774A1=y
> > CONFIG_PINCTRL_PFC_R8A774B1=y
> > # CONFIG_PINCTRL_PFC_SH7203 is not set
> > # CONFIG_PINCTRL_PFC_SH7264 is not set
> > CONFIG_PINCTRL_PFC_SH7269=y
> > # CONFIG_PINCTRL_PFC_SH7720 is not set
> > CONFIG_PINCTRL_PFC_SH7722=y
> > # CONFIG_PINCTRL_PFC_SH7734 is not set
> > CONFIG_PINCTRL_PFC_SH7757=y
> > # CONFIG_PINCTRL_PFC_SH7785 is not set
> > # CONFIG_PINCTRL_PFC_SH7786 is not set
> > # CONFIG_PINCTRL_PFC_SH73A0 is not set
> > # CONFIG_PINCTRL_PFC_SH7723 is not set
> > # CONFIG_PINCTRL_PFC_SH7724 is not set
> > CONFIG_PINCTRL_PFC_SHX3=y
> > # end of Renesas pinctrl drivers
> > 
> > CONFIG_GPIOLIB=y
> > CONFIG_GPIOLIB_FASTPATH_LIMIT=512
> > CONFIG_GPIOLIB_IRQCHIP=y
> > # CONFIG_DEBUG_GPIO is not set
> > CONFIG_GPIO_SYSFS=y
> > CONFIG_GPIO_CDEV=y
> > CONFIG_GPIO_CDEV_V1=y
> > CONFIG_GPIO_GENERIC=y
> > CONFIG_GPIO_MAX730X=y
> > 
> > #
> > # Memory mapped GPIO drivers
> > #
> > CONFIG_GPIO_ATH79=y
> > CONFIG_GPIO_CLPS711X=y
> > CONFIG_GPIO_DWAPB=y
> > CONFIG_GPIO_GENERIC_PLATFORM=y
> > CONFIG_GPIO_HISI=y
> > CONFIG_GPIO_IOP=y
> > CONFIG_GPIO_MB86S7X=y
> > CONFIG_GPIO_MENZ127=y
> > CONFIG_GPIO_MPC8XXX=y
> > CONFIG_GPIO_MXC=y
> > CONFIG_GPIO_MXS=y
> > # CONFIG_GPIO_PXA is not set
> > CONFIG_GPIO_RCAR=y
> > CONFIG_GPIO_ROCKCHIP=y
> > CONFIG_GPIO_THUNDERX=y
> > CONFIG_GPIO_VX855=y
> > CONFIG_GPIO_XGENE_SB=y
> > CONFIG_GPIO_XLP=y
> > # CONFIG_GPIO_AMD_FCH is not set
> > CONFIG_GPIO_IDT3243X=y
> > # end of Memory mapped GPIO drivers
> > 
> > #
> > # I2C GPIO expanders
> > #
> > # CONFIG_GPIO_ADP5588 is not set
> > CONFIG_GPIO_MAX7300=y
> > CONFIG_GPIO_MAX732X=y
> > CONFIG_GPIO_MAX732X_IRQ=y
> > # CONFIG_GPIO_PCA953X is not set
> > # CONFIG_GPIO_PCA9570 is not set
> > CONFIG_GPIO_PCF857X=y
> > CONFIG_GPIO_TPIC2810=y
> > # CONFIG_GPIO_TS4900 is not set
> > # end of I2C GPIO expanders
> > 
> > #
> > # MFD GPIO expanders
> > #
> > # CONFIG_GPIO_ADP5520 is not set
> > # CONFIG_GPIO_ARIZONA is not set
> > CONFIG_GPIO_DA9055=y
> > CONFIG_GPIO_JANZ_TTL=y
> > CONFIG_GPIO_LP3943=y
> > # CONFIG_GPIO_MADERA is not set
> > # CONFIG_GPIO_SL28CPLD is not set
> > # CONFIG_GPIO_TPS6586X is not set
> > CONFIG_GPIO_TPS65912=y
> > # CONFIG_GPIO_TWL4030 is not set
> > # CONFIG_GPIO_WM831X is not set
> > CONFIG_GPIO_WM8994=y
> > # end of MFD GPIO expanders
> > 
> > #
> > # PCI GPIO expanders
> > #
> > CONFIG_GPIO_BT8XX=y
> > # CONFIG_GPIO_MLXBF is not set
> > CONFIG_GPIO_MLXBF2=y
> > # CONFIG_GPIO_ML_IOH is not set
> > CONFIG_GPIO_PCH=y
> > CONFIG_GPIO_PCI_IDIO_16=y
> > # CONFIG_GPIO_PCIE_IDIO_24 is not set
> > # CONFIG_GPIO_RDC321X is not set
> > # end of PCI GPIO expanders
> > 
> > #
> > # Virtual GPIO drivers
> > #
> > CONFIG_GPIO_AGGREGATOR=y
> > CONFIG_GPIO_MOCKUP=y
> > # CONFIG_GPIO_VIRTIO is not set
> > # CONFIG_GPIO_SIM is not set
> > # end of Virtual GPIO drivers
> > 
> > CONFIG_W1=y
> > 
> > #
> > # 1-wire Bus Masters
> > #
> > CONFIG_W1_MASTER_MATROX=y
> > # CONFIG_W1_MASTER_DS2482 is not set
> > CONFIG_W1_MASTER_MXC=y
> > # CONFIG_W1_MASTER_DS1WM is not set
> > CONFIG_W1_MASTER_GPIO=y
> > CONFIG_W1_MASTER_SGI=y
> > # end of 1-wire Bus Masters
> > 
> > #
> > # 1-wire Slaves
> > #
> > CONFIG_W1_SLAVE_THERM=y
> > CONFIG_W1_SLAVE_SMEM=y
> > CONFIG_W1_SLAVE_DS2405=y
> > CONFIG_W1_SLAVE_DS2408=y
> > # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> > CONFIG_W1_SLAVE_DS2413=y
> > CONFIG_W1_SLAVE_DS2406=y
> > CONFIG_W1_SLAVE_DS2423=y
> > # CONFIG_W1_SLAVE_DS2805 is not set
> > CONFIG_W1_SLAVE_DS2430=y
> > CONFIG_W1_SLAVE_DS2431=y
> > CONFIG_W1_SLAVE_DS2433=y
> > CONFIG_W1_SLAVE_DS2433_CRC=y
> > CONFIG_W1_SLAVE_DS2438=y
> > CONFIG_W1_SLAVE_DS250X=y
> > CONFIG_W1_SLAVE_DS2780=y
> > CONFIG_W1_SLAVE_DS2781=y
> > CONFIG_W1_SLAVE_DS28E04=y
> > # CONFIG_W1_SLAVE_DS28E17 is not set
> > # end of 1-wire Slaves
> > 
> > # CONFIG_POWER_RESET is not set
> > CONFIG_POWER_SUPPLY=y
> > CONFIG_POWER_SUPPLY_DEBUG=y
> > # CONFIG_POWER_SUPPLY_HWMON is not set
> > CONFIG_IP5XXX_POWER=y
> > CONFIG_MAX8925_POWER=y
> > CONFIG_WM831X_BACKUP=y
> > CONFIG_WM831X_POWER=y
> > CONFIG_TEST_POWER=y
> > CONFIG_CHARGER_ADP5061=y
> > # CONFIG_BATTERY_ACT8945A is not set
> > CONFIG_BATTERY_CW2015=y
> > # CONFIG_BATTERY_DS2760 is not set
> > # CONFIG_BATTERY_DS2780 is not set
> > CONFIG_BATTERY_DS2781=y
> > CONFIG_BATTERY_DS2782=y
> > # CONFIG_BATTERY_SAMSUNG_SDI is not set
> > # CONFIG_BATTERY_SBS is not set
> > CONFIG_CHARGER_SBS=y
> > CONFIG_MANAGER_SBS=y
> > CONFIG_BATTERY_BQ27XXX=y
> > CONFIG_BATTERY_BQ27XXX_I2C=y
> > CONFIG_BATTERY_BQ27XXX_HDQ=y
> > # CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
> > # CONFIG_BATTERY_DA9150 is not set
> > # CONFIG_BATTERY_MAX17040 is not set
> > # CONFIG_BATTERY_MAX17042 is not set
> > CONFIG_BATTERY_MAX1721X=y
> > CONFIG_CHARGER_MAX8903=y
> > CONFIG_CHARGER_LP8727=y
> > # CONFIG_CHARGER_GPIO is not set
> > CONFIG_CHARGER_MANAGER=y
> > # CONFIG_CHARGER_LT3651 is not set
> > # CONFIG_CHARGER_LTC4162L is not set
> > CONFIG_CHARGER_MAX14577=y
> > # CONFIG_CHARGER_MAX77693 is not set
> > CONFIG_CHARGER_MAX77976=y
> > CONFIG_CHARGER_MAX8998=y
> > CONFIG_CHARGER_MT6360=y
> > # CONFIG_CHARGER_BQ2415X is not set
> > # CONFIG_CHARGER_BQ24190 is not set
> > CONFIG_CHARGER_BQ24257=y
> > CONFIG_CHARGER_BQ24735=y
> > CONFIG_CHARGER_BQ2515X=y
> > CONFIG_CHARGER_BQ25890=y
> > # CONFIG_CHARGER_BQ25980 is not set
> > CONFIG_CHARGER_BQ256XX=y
> > # CONFIG_CHARGER_SMB347 is not set
> > # CONFIG_CHARGER_TPS65090 is not set
> > CONFIG_BATTERY_GAUGE_LTC2941=y
> > # CONFIG_BATTERY_GOLDFISH is not set
> > # CONFIG_BATTERY_RT5033 is not set
> > CONFIG_CHARGER_RT9455=y
> > # CONFIG_CHARGER_SC2731 is not set
> > CONFIG_CHARGER_BD99954=y
> > # CONFIG_BATTERY_UG3105 is not set
> > CONFIG_HWMON=y
> > CONFIG_HWMON_VID=y
> > CONFIG_HWMON_DEBUG_CHIP=y
> > 
> > #
> > # Native drivers
> > #
> > # CONFIG_SENSORS_AD7414 is not set
> > CONFIG_SENSORS_AD7418=y
> > CONFIG_SENSORS_ADM1021=y
> > CONFIG_SENSORS_ADM1025=y
> > # CONFIG_SENSORS_ADM1026 is not set
> > # CONFIG_SENSORS_ADM1029 is not set
> > CONFIG_SENSORS_ADM1031=y
> > CONFIG_SENSORS_ADM1177=y
> > CONFIG_SENSORS_ADM9240=y
> > CONFIG_SENSORS_ADT7X10=y
> > CONFIG_SENSORS_ADT7410=y
> > CONFIG_SENSORS_ADT7411=y
> > # CONFIG_SENSORS_ADT7462 is not set
> > CONFIG_SENSORS_ADT7470=y
> > CONFIG_SENSORS_ADT7475=y
> > CONFIG_SENSORS_AHT10=y
> > CONFIG_SENSORS_AS370=y
> > # CONFIG_SENSORS_ASC7621 is not set
> > CONFIG_SENSORS_AXI_FAN_CONTROL=y
> > CONFIG_SENSORS_ASB100=y
> > CONFIG_SENSORS_ASPEED=y
> > CONFIG_SENSORS_ATXP1=y
> > CONFIG_SENSORS_BT1_PVT=y
> > # CONFIG_SENSORS_BT1_PVT_ALARMS is not set
> > # CONFIG_SENSORS_CORSAIR_CPRO is not set
> > # CONFIG_SENSORS_CORSAIR_PSU is not set
> > CONFIG_SENSORS_DRIVETEMP=y
> > # CONFIG_SENSORS_DS620 is not set
> > CONFIG_SENSORS_DS1621=y
> > # CONFIG_SENSORS_DA9055 is not set
> > CONFIG_SENSORS_I5K_AMB=y
> > CONFIG_SENSORS_SPARX5=y
> > CONFIG_SENSORS_F71805F=y
> > CONFIG_SENSORS_F71882FG=y
> > CONFIG_SENSORS_F75375S=y
> > CONFIG_SENSORS_MC13783_ADC=y
> > CONFIG_SENSORS_FSCHMD=y
> > CONFIG_SENSORS_GL518SM=y
> > CONFIG_SENSORS_GL520SM=y
> > CONFIG_SENSORS_G760A=y
> > # CONFIG_SENSORS_G762 is not set
> > # CONFIG_SENSORS_HIH6130 is not set
> > # CONFIG_SENSORS_IBMAEM is not set
> > # CONFIG_SENSORS_IBMPEX is not set
> > CONFIG_SENSORS_IT87=y
> > CONFIG_SENSORS_JC42=y
> > # CONFIG_SENSORS_POWR1220 is not set
> > CONFIG_SENSORS_LAN966X=y
> > # CONFIG_SENSORS_LINEAGE is not set
> > CONFIG_SENSORS_LTC2945=y
> > # CONFIG_SENSORS_LTC2947_I2C is not set
> > CONFIG_SENSORS_LTC2990=y
> > CONFIG_SENSORS_LTC2992=y
> > # CONFIG_SENSORS_LTC4151 is not set
> > # CONFIG_SENSORS_LTC4215 is not set
> > # CONFIG_SENSORS_LTC4222 is not set
> > CONFIG_SENSORS_LTC4245=y
> > # CONFIG_SENSORS_LTC4260 is not set
> > CONFIG_SENSORS_LTC4261=y
> > CONFIG_SENSORS_MAX127=y
> > CONFIG_SENSORS_MAX16065=y
> > CONFIG_SENSORS_MAX1619=y
> > # CONFIG_SENSORS_MAX1668 is not set
> > # CONFIG_SENSORS_MAX197 is not set
> > CONFIG_SENSORS_MAX31730=y
> > CONFIG_SENSORS_MAX6620=y
> > # CONFIG_SENSORS_MAX6621 is not set
> > CONFIG_SENSORS_MAX6639=y
> > # CONFIG_SENSORS_MAX6642 is not set
> > CONFIG_SENSORS_MAX6650=y
> > CONFIG_SENSORS_MAX6697=y
> > CONFIG_SENSORS_MAX31790=y
> > CONFIG_SENSORS_MCP3021=y
> > CONFIG_SENSORS_TC654=y
> > # CONFIG_SENSORS_TPS23861 is not set
> > CONFIG_SENSORS_MENF21BMC_HWMON=y
> > CONFIG_SENSORS_MR75203=y
> > # CONFIG_SENSORS_LM63 is not set
> > CONFIG_SENSORS_LM73=y
> > # CONFIG_SENSORS_LM75 is not set
> > CONFIG_SENSORS_LM77=y
> > CONFIG_SENSORS_LM78=y
> > CONFIG_SENSORS_LM80=y
> > CONFIG_SENSORS_LM83=y
> > CONFIG_SENSORS_LM85=y
> > CONFIG_SENSORS_LM87=y
> > # CONFIG_SENSORS_LM90 is not set
> > CONFIG_SENSORS_LM92=y
> > # CONFIG_SENSORS_LM93 is not set
> > CONFIG_SENSORS_LM95234=y
> > CONFIG_SENSORS_LM95241=y
> > CONFIG_SENSORS_LM95245=y
> > CONFIG_SENSORS_PC87360=y
> > # CONFIG_SENSORS_PC87427 is not set
> > CONFIG_SENSORS_NCT6683=y
> > CONFIG_SENSORS_NCT6775_CORE=y
> > CONFIG_SENSORS_NCT6775=y
> > # CONFIG_SENSORS_NCT6775_I2C is not set
> > CONFIG_SENSORS_NCT7802=y
> > # CONFIG_SENSORS_NPCM7XX is not set
> > # CONFIG_SENSORS_OCC_P8_I2C is not set
> > CONFIG_SENSORS_PCF8591=y
> > CONFIG_PMBUS=y
> > CONFIG_SENSORS_PMBUS=y
> > # CONFIG_SENSORS_ADM1266 is not set
> > CONFIG_SENSORS_ADM1275=y
> > CONFIG_SENSORS_BEL_PFE=y
> > # CONFIG_SENSORS_BPA_RS600 is not set
> > CONFIG_SENSORS_DELTA_AHE50DC_FAN=y
> > CONFIG_SENSORS_FSP_3Y=y
> > CONFIG_SENSORS_IBM_CFFPS=y
> > CONFIG_SENSORS_DPS920AB=y
> > CONFIG_SENSORS_INSPUR_IPSPS=y
> > CONFIG_SENSORS_IR35221=y
> > CONFIG_SENSORS_IR36021=y
> > CONFIG_SENSORS_IR38064=y
> > # CONFIG_SENSORS_IR38064_REGULATOR is not set
> > # CONFIG_SENSORS_IRPS5401 is not set
> > CONFIG_SENSORS_ISL68137=y
> > # CONFIG_SENSORS_LM25066 is not set
> > # CONFIG_SENSORS_LT7182S is not set
> > CONFIG_SENSORS_LTC2978=y
> > CONFIG_SENSORS_LTC2978_REGULATOR=y
> > CONFIG_SENSORS_LTC3815=y
> > CONFIG_SENSORS_MAX15301=y
> > CONFIG_SENSORS_MAX16064=y
> > CONFIG_SENSORS_MAX16601=y
> > CONFIG_SENSORS_MAX20730=y
> > # CONFIG_SENSORS_MAX20751 is not set
> > CONFIG_SENSORS_MAX31785=y
> > # CONFIG_SENSORS_MAX34440 is not set
> > # CONFIG_SENSORS_MAX8688 is not set
> > CONFIG_SENSORS_MP2888=y
> > CONFIG_SENSORS_MP2975=y
> > CONFIG_SENSORS_MP5023=y
> > CONFIG_SENSORS_PIM4328=y
> > CONFIG_SENSORS_PLI1209BC=y
> > # CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
> > CONFIG_SENSORS_PM6764TR=y
> > CONFIG_SENSORS_PXE1610=y
> > CONFIG_SENSORS_Q54SJ108A2=y
> > CONFIG_SENSORS_STPDDC60=y
> > CONFIG_SENSORS_TPS40422=y
> > CONFIG_SENSORS_TPS53679=y
> > CONFIG_SENSORS_UCD9000=y
> > # CONFIG_SENSORS_UCD9200 is not set
> > CONFIG_SENSORS_XDPE152=y
> > # CONFIG_SENSORS_XDPE122 is not set
> > # CONFIG_SENSORS_ZL6100 is not set
> > # CONFIG_SENSORS_PWM_FAN is not set
> > # CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
> > # CONFIG_SENSORS_SL28CPLD is not set
> > CONFIG_SENSORS_SBTSI=y
> > # CONFIG_SENSORS_SBRMI is not set
> > CONFIG_SENSORS_SHT15=y
> > # CONFIG_SENSORS_SHT21 is not set
> > CONFIG_SENSORS_SHT3x=y
> > # CONFIG_SENSORS_SHT4x is not set
> > # CONFIG_SENSORS_SHTC1 is not set
> > # CONFIG_SENSORS_SIS5595 is not set
> > # CONFIG_SENSORS_SY7636A is not set
> > CONFIG_SENSORS_DME1737=y
> > CONFIG_SENSORS_EMC1403=y
> > CONFIG_SENSORS_EMC2103=y
> > CONFIG_SENSORS_EMC6W201=y
> > CONFIG_SENSORS_SMSC47M1=y
> > # CONFIG_SENSORS_SMSC47M192 is not set
> > CONFIG_SENSORS_SMSC47B397=y
> > CONFIG_SENSORS_STTS751=y
> > CONFIG_SENSORS_SMM665=y
> > # CONFIG_SENSORS_ADC128D818 is not set
> > CONFIG_SENSORS_ADS7828=y
> > CONFIG_SENSORS_AMC6821=y
> > CONFIG_SENSORS_INA209=y
> > CONFIG_SENSORS_INA2XX=y
> > # CONFIG_SENSORS_INA238 is not set
> > CONFIG_SENSORS_INA3221=y
> > CONFIG_SENSORS_TC74=y
> > CONFIG_SENSORS_THMC50=y
> > CONFIG_SENSORS_TMP102=y
> > CONFIG_SENSORS_TMP103=y
> > CONFIG_SENSORS_TMP108=y
> > CONFIG_SENSORS_TMP401=y
> > CONFIG_SENSORS_TMP421=y
> > CONFIG_SENSORS_TMP464=y
> > CONFIG_SENSORS_TMP513=y
> > CONFIG_SENSORS_VIA686A=y
> > # CONFIG_SENSORS_VT1211 is not set
> > CONFIG_SENSORS_VT8231=y
> > # CONFIG_SENSORS_W83773G is not set
> > CONFIG_SENSORS_W83781D=y
> > CONFIG_SENSORS_W83791D=y
> > CONFIG_SENSORS_W83792D=y
> > CONFIG_SENSORS_W83793=y
> > CONFIG_SENSORS_W83795=y
> > # CONFIG_SENSORS_W83795_FANCTRL is not set
> > # CONFIG_SENSORS_W83L785TS is not set
> > CONFIG_SENSORS_W83L786NG=y
> > CONFIG_SENSORS_W83627HF=y
> > CONFIG_SENSORS_W83627EHF=y
> > CONFIG_SENSORS_WM831X=y
> > CONFIG_THERMAL=y
> > # CONFIG_THERMAL_STATISTICS is not set
> > CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
> > CONFIG_THERMAL_HWMON=y
> > CONFIG_THERMAL_WRITABLE_TRIPS=y
> > CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
> > # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > CONFIG_THERMAL_GOV_FAIR_SHARE=y
> > CONFIG_THERMAL_GOV_STEP_WISE=y
> > CONFIG_THERMAL_GOV_BANG_BANG=y
> > CONFIG_THERMAL_GOV_USER_SPACE=y
> > # CONFIG_DEVFREQ_THERMAL is not set
> > CONFIG_THERMAL_EMULATION=y
> > CONFIG_K3_THERMAL=y
> > CONFIG_RCAR_THERMAL=y
> > 
> > #
> > # Intel thermal drivers
> > #
> > 
> > #
> > # ACPI INT340X thermal drivers
> > #
> > # end of ACPI INT340X thermal drivers
> > # end of Intel thermal drivers
> > 
> > #
> > # Broadcom thermal drivers
> > #
> > # CONFIG_BRCMSTB_THERMAL is not set
> > # CONFIG_BCM_NS_THERMAL is not set
> > CONFIG_BCM_SR_THERMAL=y
> > # end of Broadcom thermal drivers
> > 
> > #
> > # Texas Instruments thermal drivers
> > #
> > CONFIG_TI_SOC_THERMAL=y
> > # CONFIG_TI_THERMAL is not set
> > # CONFIG_OMAP3_THERMAL is not set
> > # CONFIG_OMAP4_THERMAL is not set
> > # CONFIG_OMAP5_THERMAL is not set
> > # CONFIG_DRA752_THERMAL is not set
> > # end of Texas Instruments thermal drivers
> > 
> > #
> > # Samsung thermal drivers
> > #
> > # end of Samsung thermal drivers
> > 
> > #
> > # NVIDIA Tegra thermal drivers
> > #
> > # CONFIG_TEGRA_SOCTHERM is not set
> > CONFIG_TEGRA_BPMP_THERMAL=y
> > CONFIG_TEGRA30_TSENSOR=y
> > # end of NVIDIA Tegra thermal drivers
> > 
> > #
> > # Qualcomm thermal drivers
> > #
> > # end of Qualcomm thermal drivers
> > 
> > CONFIG_SPRD_THERMAL=y
> > # CONFIG_WATCHDOG is not set
> > CONFIG_SSB_POSSIBLE=y
> > CONFIG_SSB=y
> > CONFIG_SSB_PCIHOST_POSSIBLE=y
> > # CONFIG_SSB_PCIHOST is not set
> > CONFIG_SSB_SDIOHOST_POSSIBLE=y
> > CONFIG_SSB_SDIOHOST=y
> > # CONFIG_SSB_DRIVER_GPIO is not set
> > CONFIG_BCMA_POSSIBLE=y
> > CONFIG_BCMA=y
> > CONFIG_BCMA_HOST_PCI_POSSIBLE=y
> > CONFIG_BCMA_HOST_PCI=y
> > CONFIG_BCMA_HOST_SOC=y
> > CONFIG_BCMA_DRIVER_PCI=y
> > # CONFIG_BCMA_DRIVER_MIPS is not set
> > # CONFIG_BCMA_SFLASH is not set
> > # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> > # CONFIG_BCMA_DRIVER_GPIO is not set
> > CONFIG_BCMA_DEBUG=y
> > 
> > #
> > # Multifunction device drivers
> > #
> > CONFIG_MFD_CORE=y
> > CONFIG_MFD_SUN4I_GPADC=y
> > # CONFIG_MFD_AS3711 is not set
> > CONFIG_PMIC_ADP5520=y
> > CONFIG_MFD_AAT2870_CORE=y
> > CONFIG_MFD_AT91_USART=y
> > CONFIG_MFD_BCM590XX=y
> > # CONFIG_MFD_BD9571MWV is not set
> > # CONFIG_MFD_AXP20X_I2C is not set
> > CONFIG_MFD_MADERA=y
> > CONFIG_MFD_MADERA_I2C=y
> > CONFIG_MFD_CS47L15=y
> > CONFIG_MFD_CS47L35=y
> > # CONFIG_MFD_CS47L85 is not set
> > # CONFIG_MFD_CS47L90 is not set
> > CONFIG_MFD_CS47L92=y
> > CONFIG_MFD_ASIC3=y
> > # CONFIG_PMIC_DA903X is not set
> > # CONFIG_MFD_DA9052_I2C is not set
> > CONFIG_MFD_DA9055=y
> > # CONFIG_MFD_DA9062 is not set
> > CONFIG_MFD_DA9063=y
> > CONFIG_MFD_DA9150=y
> > CONFIG_MFD_ENE_KB3930=y
> > # CONFIG_MFD_EXYNOS_LPASS is not set
> > CONFIG_MFD_MC13XXX=y
> > CONFIG_MFD_MC13XXX_I2C=y
> > CONFIG_MFD_MP2629=y
> > # CONFIG_MFD_MXS_LRADC is not set
> > # CONFIG_MFD_MX25_TSADC is not set
> > CONFIG_HTC_PASIC3=y
> > CONFIG_HTC_I2CPLD=y
> > # CONFIG_LPC_ICH is not set
> > # CONFIG_LPC_SCH is not set
> > CONFIG_MFD_IQS62X=y
> > CONFIG_MFD_JANZ_CMODIO=y
> > # CONFIG_MFD_KEMPLD is not set
> > # CONFIG_MFD_88PM800 is not set
> > # CONFIG_MFD_88PM805 is not set
> > # CONFIG_MFD_88PM860X is not set
> > CONFIG_MFD_MAX14577=y
> > # CONFIG_MFD_MAX77620 is not set
> > # CONFIG_MFD_MAX77650 is not set
> > # CONFIG_MFD_MAX77686 is not set
> > CONFIG_MFD_MAX77693=y
> > CONFIG_MFD_MAX77714=y
> > CONFIG_MFD_MAX77843=y
> > CONFIG_MFD_MAX8907=y
> > CONFIG_MFD_MAX8925=y
> > CONFIG_MFD_MAX8997=y
> > CONFIG_MFD_MAX8998=y
> > CONFIG_MFD_MT6360=y
> > # CONFIG_MFD_MT6397 is not set
> > CONFIG_MFD_MENF21BMC=y
> > CONFIG_MFD_NTXEC=y
> > CONFIG_MFD_RETU=y
> > # CONFIG_MFD_PCF50633 is not set
> > # CONFIG_UCB1400_CORE is not set
> > CONFIG_MFD_PM8XXX=y
> > CONFIG_MFD_RDC321X=y
> > CONFIG_MFD_RT4831=y
> > CONFIG_MFD_RT5033=y
> > # CONFIG_MFD_RC5T583 is not set
> > CONFIG_MFD_SEC_CORE=y
> > # CONFIG_MFD_SI476X_CORE is not set
> > # CONFIG_MFD_SIMPLE_MFD_I2C is not set
> > # CONFIG_MFD_SL28CPLD is not set
> > # CONFIG_MFD_SM501 is not set
> > CONFIG_MFD_SKY81452=y
> > # CONFIG_ABX500_CORE is not set
> > CONFIG_MFD_SUN6I_PRCM=y
> > CONFIG_MFD_SYSCON=y
> > CONFIG_MFD_TI_AM335X_TSCADC=y
> > CONFIG_MFD_LP3943=y
> > # CONFIG_MFD_LP8788 is not set
> > CONFIG_MFD_TI_LMU=y
> > # CONFIG_MFD_PALMAS is not set
> > CONFIG_TPS6105X=y
> > CONFIG_TPS65010=y
> > CONFIG_TPS6507X=y
> > # CONFIG_MFD_TPS65086 is not set
> > CONFIG_MFD_TPS65090=y
> > # CONFIG_MFD_TI_LP873X is not set
> > CONFIG_MFD_TPS6586X=y
> > # CONFIG_MFD_TPS65910 is not set
> > CONFIG_MFD_TPS65912=y
> > CONFIG_MFD_TPS65912_I2C=y
> > CONFIG_TWL4030_CORE=y
> > CONFIG_MFD_TWL4030_AUDIO=y
> > # CONFIG_TWL6040_CORE is not set
> > CONFIG_MFD_WL1273_CORE=y
> > CONFIG_MFD_LM3533=y
> > # CONFIG_MFD_TIMBERDALE is not set
> > CONFIG_MFD_TQMX86=y
> > CONFIG_MFD_VX855=y
> > CONFIG_MFD_ARIZONA=y
> > CONFIG_MFD_ARIZONA_I2C=y
> > # CONFIG_MFD_CS47L24 is not set
> > CONFIG_MFD_WM5102=y
> > # CONFIG_MFD_WM5110 is not set
> > CONFIG_MFD_WM8997=y
> > # CONFIG_MFD_WM8998 is not set
> > # CONFIG_MFD_WM8400 is not set
> > CONFIG_MFD_WM831X=y
> > CONFIG_MFD_WM831X_I2C=y
> > # CONFIG_MFD_WM8350_I2C is not set
> > CONFIG_MFD_WM8994=y
> > CONFIG_MFD_STW481X=y
> > # CONFIG_MFD_STM32_LPTIMER is not set
> > # CONFIG_MFD_STM32_TIMERS is not set
> > CONFIG_MFD_STMFX=y
> > CONFIG_MFD_ATC260X=y
> > CONFIG_MFD_ATC260X_I2C=y
> > # CONFIG_MFD_KHADAS_MCU is not set
> > # CONFIG_MFD_ACER_A500_EC is not set
> > # CONFIG_RAVE_SP_CORE is not set
> > # end of Multifunction device drivers
> > 
> > CONFIG_REGULATOR=y
> > CONFIG_REGULATOR_DEBUG=y
> > CONFIG_REGULATOR_FIXED_VOLTAGE=y
> > # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> > CONFIG_REGULATOR_USERSPACE_CONSUMER=y
> > # CONFIG_REGULATOR_88PG86X is not set
> > CONFIG_REGULATOR_ACT8865=y
> > CONFIG_REGULATOR_AD5398=y
> > CONFIG_REGULATOR_ANATOP=y
> > CONFIG_REGULATOR_AAT2870=y
> > # CONFIG_REGULATOR_ATC260X is not set
> > CONFIG_REGULATOR_BCM590XX=y
> > # CONFIG_REGULATOR_DA9055 is not set
> > CONFIG_REGULATOR_DA9210=y
> > # CONFIG_REGULATOR_DA9211 is not set
> > CONFIG_REGULATOR_FAN53555=y
> > CONFIG_REGULATOR_FAN53880=y
> > CONFIG_REGULATOR_GPIO=y
> > CONFIG_REGULATOR_ISL9305=y
> > CONFIG_REGULATOR_ISL6271A=y
> > CONFIG_REGULATOR_LM363X=y
> > CONFIG_REGULATOR_LP3971=y
> > CONFIG_REGULATOR_LP3972=y
> > # CONFIG_REGULATOR_LP872X is not set
> > # CONFIG_REGULATOR_LP8755 is not set
> > # CONFIG_REGULATOR_LTC3589 is not set
> > # CONFIG_REGULATOR_LTC3676 is not set
> > CONFIG_REGULATOR_MAX14577=y
> > CONFIG_REGULATOR_MAX1586=y
> > CONFIG_REGULATOR_MAX77620=y
> > CONFIG_REGULATOR_MAX77650=y
> > # CONFIG_REGULATOR_MAX8649 is not set
> > # CONFIG_REGULATOR_MAX8660 is not set
> > # CONFIG_REGULATOR_MAX8893 is not set
> > CONFIG_REGULATOR_MAX8907=y
> > CONFIG_REGULATOR_MAX8925=y
> > CONFIG_REGULATOR_MAX8952=y
> > # CONFIG_REGULATOR_MAX8997 is not set
> > CONFIG_REGULATOR_MAX8998=y
> > CONFIG_REGULATOR_MAX20086=y
> > CONFIG_REGULATOR_MAX77686=y
> > CONFIG_REGULATOR_MAX77693=y
> > # CONFIG_REGULATOR_MAX77802 is not set
> > CONFIG_REGULATOR_MAX77826=y
> > CONFIG_REGULATOR_MC13XXX_CORE=y
> > CONFIG_REGULATOR_MC13783=y
> > # CONFIG_REGULATOR_MC13892 is not set
> > CONFIG_REGULATOR_MP8859=y
> > CONFIG_REGULATOR_MP886X=y
> > # CONFIG_REGULATOR_MT6311 is not set
> > CONFIG_REGULATOR_MT6315=y
> > # CONFIG_REGULATOR_MT6360 is not set
> > # CONFIG_REGULATOR_PBIAS is not set
> > CONFIG_REGULATOR_PCA9450=y
> > # CONFIG_REGULATOR_PV88060 is not set
> > CONFIG_REGULATOR_PV88080=y
> > CONFIG_REGULATOR_PV88090=y
> > # CONFIG_REGULATOR_PWM is not set
> > # CONFIG_REGULATOR_QCOM_RPMH is not set
> > CONFIG_REGULATOR_QCOM_SMD_RPM=y
> > CONFIG_REGULATOR_QCOM_SPMI=y
> > # CONFIG_REGULATOR_QCOM_USB_VBUS is not set
> > CONFIG_REGULATOR_RT4801=y
> > CONFIG_REGULATOR_RT4831=y
> > # CONFIG_REGULATOR_RT5033 is not set
> > CONFIG_REGULATOR_RT5190A=y
> > # CONFIG_REGULATOR_RT5759 is not set
> > CONFIG_REGULATOR_RT6160=y
> > CONFIG_REGULATOR_RT6245=y
> > # CONFIG_REGULATOR_RTQ2134 is not set
> > CONFIG_REGULATOR_RTMV20=y
> > CONFIG_REGULATOR_RTQ6752=y
> > CONFIG_REGULATOR_S2MPA01=y
> > # CONFIG_REGULATOR_S2MPS11 is not set
> > # CONFIG_REGULATOR_S5M8767 is not set
> > CONFIG_REGULATOR_SC2731=y
> > # CONFIG_REGULATOR_SKY81452 is not set
> > CONFIG_REGULATOR_SLG51000=y
> > CONFIG_REGULATOR_STM32_BOOSTER=y
> > CONFIG_REGULATOR_STM32_VREFBUF=y
> > # CONFIG_REGULATOR_STM32_PWR is not set
> > CONFIG_REGULATOR_TI_ABB=y
> > CONFIG_REGULATOR_STW481X_VMMC=y
> > # CONFIG_REGULATOR_SY7636A is not set
> > CONFIG_REGULATOR_SY8106A=y
> > CONFIG_REGULATOR_SY8824X=y
> > CONFIG_REGULATOR_SY8827N=y
> > # CONFIG_REGULATOR_TPS51632 is not set
> > # CONFIG_REGULATOR_TPS6105X is not set
> > CONFIG_REGULATOR_TPS62360=y
> > CONFIG_REGULATOR_TPS65023=y
> > CONFIG_REGULATOR_TPS6507X=y
> > CONFIG_REGULATOR_TPS65090=y
> > CONFIG_REGULATOR_TPS65132=y
> > CONFIG_REGULATOR_TPS6586X=y
> > CONFIG_REGULATOR_TPS65912=y
> > CONFIG_REGULATOR_TPS68470=y
> > # CONFIG_REGULATOR_TWL4030 is not set
> > CONFIG_REGULATOR_WM831X=y
> > CONFIG_REGULATOR_WM8994=y
> > CONFIG_REGULATOR_QCOM_LABIBB=y
> > CONFIG_RC_CORE=y
> > # CONFIG_LIRC is not set
> > CONFIG_RC_MAP=y
> > # CONFIG_RC_DECODERS is not set
> > # CONFIG_RC_DEVICES is not set
> > CONFIG_CEC_CORE=y
> > CONFIG_CEC_NOTIFIER=y
> > 
> > #
> > # CEC support
> > #
> > # CONFIG_MEDIA_CEC_RC is not set
> > # CONFIG_MEDIA_CEC_SUPPORT is not set
> > # end of CEC support
> > 
> > CONFIG_MEDIA_SUPPORT=y
> > CONFIG_MEDIA_SUPPORT_FILTER=y
> > CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
> > 
> > #
> > # Media device types
> > #
> > # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> > CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
> > CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> > CONFIG_MEDIA_RADIO_SUPPORT=y
> > CONFIG_MEDIA_SDR_SUPPORT=y
> > CONFIG_MEDIA_PLATFORM_SUPPORT=y
> > # CONFIG_MEDIA_TEST_SUPPORT is not set
> > # end of Media device types
> > 
> > CONFIG_VIDEO_DEV=y
> > CONFIG_MEDIA_CONTROLLER=y
> > CONFIG_DVB_CORE=y
> > 
> > #
> > # Video4Linux options
> > #
> > CONFIG_VIDEO_V4L2_I2C=y
> > CONFIG_VIDEO_V4L2_SUBDEV_API=y
> > # CONFIG_VIDEO_ADV_DEBUG is not set
> > # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> > CONFIG_V4L2_H264=y
> > CONFIG_V4L2_VP9=y
> > CONFIG_V4L2_MEM2MEM_DEV=y
> > CONFIG_V4L2_FLASH_LED_CLASS=y
> > CONFIG_V4L2_FWNODE=y
> > CONFIG_V4L2_ASYNC=y
> > # end of Video4Linux options
> > 
> > #
> > # Media controller options
> > #
> > # CONFIG_MEDIA_CONTROLLER_DVB is not set
> > CONFIG_MEDIA_CONTROLLER_REQUEST_API=y
> > # end of Media controller options
> > 
> > #
> > # Digital TV options
> > #
> > CONFIG_DVB_MMAP=y
> > CONFIG_DVB_MAX_ADAPTERS=16
> > CONFIG_DVB_DYNAMIC_MINORS=y
> > CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
> > CONFIG_DVB_ULE_DEBUG=y
> > # end of Digital TV options
> > 
> > #
> > # Media drivers
> > #
> > 
> > #
> > # Drivers filtered as selected at 'Filter media drivers'
> > #
> > 
> > #
> > # Media drivers
> > #
> > # CONFIG_MEDIA_PCI_SUPPORT is not set
> > # CONFIG_RADIO_ADAPTERS is not set
> > # CONFIG_MEDIA_PLATFORM_DRIVERS is not set
> > 
> > #
> > # MMC/SDIO DVB adapters
> > #
> > # CONFIG_SMS_SDIO_DRV is not set
> > 
> > #
> > # FireWire (IEEE 1394) Adapters
> > #
> > CONFIG_DVB_FIREDTV=y
> > CONFIG_DVB_FIREDTV_INPUT=y
> > CONFIG_VIDEOBUF2_CORE=y
> > CONFIG_VIDEOBUF2_V4L2=y
> > CONFIG_VIDEOBUF2_MEMOPS=y
> > CONFIG_VIDEOBUF2_DMA_CONTIG=y
> > CONFIG_VIDEOBUF2_VMALLOC=y
> > # end of Media drivers
> > 
> > #
> > # Media ancillary drivers
> > #
> > 
> > #
> > # IR I2C driver auto-selected by 'Autoselect ancillary drivers'
> > #
> > CONFIG_VIDEO_IR_I2C=y
> > 
> > #
> > # Audio decoders, processors and mixers
> > #
> > CONFIG_VIDEO_CS3308=y
> > CONFIG_VIDEO_CS5345=y
> > CONFIG_VIDEO_CS53L32A=y
> > CONFIG_VIDEO_MSP3400=y
> > CONFIG_VIDEO_SONY_BTF_MPX=y
> > CONFIG_VIDEO_TDA7432=y
> > CONFIG_VIDEO_TDA9840=y
> > CONFIG_VIDEO_TEA6415C=y
> > CONFIG_VIDEO_TEA6420=y
> > # CONFIG_VIDEO_TLV320AIC23B is not set
> > CONFIG_VIDEO_TVAUDIO=y
> > CONFIG_VIDEO_UDA1342=y
> > CONFIG_VIDEO_VP27SMPX=y
> > CONFIG_VIDEO_WM8739=y
> > CONFIG_VIDEO_WM8775=y
> > # end of Audio decoders, processors and mixers
> > 
> > #
> > # RDS decoders
> > #
> > # CONFIG_VIDEO_SAA6588 is not set
> > # end of RDS decoders
> > 
> > #
> > # Video decoders
> > #
> > CONFIG_VIDEO_ADV7180=y
> > CONFIG_VIDEO_ADV7183=y
> > CONFIG_VIDEO_ADV7604=y
> > # CONFIG_VIDEO_ADV7604_CEC is not set
> > # CONFIG_VIDEO_ADV7842 is not set
> > CONFIG_VIDEO_BT819=y
> > CONFIG_VIDEO_BT856=y
> > CONFIG_VIDEO_BT866=y
> > CONFIG_VIDEO_KS0127=y
> > CONFIG_VIDEO_ML86V7667=y
> > CONFIG_VIDEO_SAA7110=y
> > # CONFIG_VIDEO_SAA711X is not set
> > CONFIG_VIDEO_TC358743=y
> > # CONFIG_VIDEO_TC358743_CEC is not set
> > # CONFIG_VIDEO_TVP514X is not set
> > CONFIG_VIDEO_TVP5150=y
> > CONFIG_VIDEO_TVP7002=y
> > # CONFIG_VIDEO_TW2804 is not set
> > CONFIG_VIDEO_TW9903=y
> > CONFIG_VIDEO_TW9906=y
> > CONFIG_VIDEO_TW9910=y
> > CONFIG_VIDEO_VPX3220=y
> > 
> > #
> > # Video and audio decoders
> > #
> > CONFIG_VIDEO_SAA717X=y
> > # CONFIG_VIDEO_CX25840 is not set
> > # end of Video decoders
> > 
> > #
> > # Video encoders
> > #
> > # CONFIG_VIDEO_AD9389B is not set
> > CONFIG_VIDEO_ADV7170=y
> > CONFIG_VIDEO_ADV7175=y
> > # CONFIG_VIDEO_ADV7343 is not set
> > CONFIG_VIDEO_ADV7393=y
> > CONFIG_VIDEO_ADV7511=y
> > CONFIG_VIDEO_ADV7511_CEC=y
> > CONFIG_VIDEO_AK881X=y
> > CONFIG_VIDEO_SAA7127=y
> > CONFIG_VIDEO_SAA7185=y
> > CONFIG_VIDEO_THS8200=y
> > # end of Video encoders
> > 
> > #
> > # Video improvement chips
> > #
> > # CONFIG_VIDEO_UPD64031A is not set
> > CONFIG_VIDEO_UPD64083=y
> > # end of Video improvement chips
> > 
> > #
> > # Audio/Video compression chips
> > #
> > CONFIG_VIDEO_SAA6752HS=y
> > # end of Audio/Video compression chips
> > 
> > #
> > # SDR tuner chips
> > #
> > # CONFIG_SDR_MAX2175 is not set
> > # end of SDR tuner chips
> > 
> > #
> > # Miscellaneous helper chips
> > #
> > CONFIG_VIDEO_I2C=y
> > CONFIG_VIDEO_M52790=y
> > CONFIG_VIDEO_ST_MIPID02=y
> > # CONFIG_VIDEO_THS7303 is not set
> > # end of Miscellaneous helper chips
> > 
> > CONFIG_MEDIA_TUNER=y
> > 
> > #
> > # Customize TV tuners
> > #
> > CONFIG_MEDIA_TUNER_E4000=y
> > # CONFIG_MEDIA_TUNER_FC0011 is not set
> > CONFIG_MEDIA_TUNER_FC0012=y
> > CONFIG_MEDIA_TUNER_FC0013=y
> > CONFIG_MEDIA_TUNER_FC2580=y
> > CONFIG_MEDIA_TUNER_IT913X=y
> > CONFIG_MEDIA_TUNER_M88RS6000T=y
> > CONFIG_MEDIA_TUNER_MAX2165=y
> > CONFIG_MEDIA_TUNER_MC44S803=y
> > CONFIG_MEDIA_TUNER_MT2060=y
> > CONFIG_MEDIA_TUNER_MT2063=y
> > CONFIG_MEDIA_TUNER_MT20XX=y
> > CONFIG_MEDIA_TUNER_MT2131=y
> > CONFIG_MEDIA_TUNER_MT2266=y
> > CONFIG_MEDIA_TUNER_MXL301RF=y
> > CONFIG_MEDIA_TUNER_MXL5005S=y
> > CONFIG_MEDIA_TUNER_MXL5007T=y
> > CONFIG_MEDIA_TUNER_QM1D1B0004=y
> > CONFIG_MEDIA_TUNER_QM1D1C0042=y
> > CONFIG_MEDIA_TUNER_QT1010=y
> > CONFIG_MEDIA_TUNER_R820T=y
> > # CONFIG_MEDIA_TUNER_SI2157 is not set
> > CONFIG_MEDIA_TUNER_SIMPLE=y
> > CONFIG_MEDIA_TUNER_TDA18212=y
> > # CONFIG_MEDIA_TUNER_TDA18218 is not set
> > # CONFIG_MEDIA_TUNER_TDA18250 is not set
> > CONFIG_MEDIA_TUNER_TDA18271=y
> > CONFIG_MEDIA_TUNER_TDA827X=y
> > CONFIG_MEDIA_TUNER_TDA8290=y
> > CONFIG_MEDIA_TUNER_TDA9887=y
> > CONFIG_MEDIA_TUNER_TEA5761=y
> > CONFIG_MEDIA_TUNER_TEA5767=y
> > # CONFIG_MEDIA_TUNER_TUA9001 is not set
> > CONFIG_MEDIA_TUNER_XC2028=y
> > CONFIG_MEDIA_TUNER_XC4000=y
> > CONFIG_MEDIA_TUNER_XC5000=y
> > # end of Customize TV tuners
> > 
> > #
> > # Customise DVB Frontends
> > #
> > 
> > #
> > # Multistandard (satellite) frontends
> > #
> > CONFIG_DVB_M88DS3103=y
> > CONFIG_DVB_MXL5XX=y
> > CONFIG_DVB_STB0899=y
> > CONFIG_DVB_STB6100=y
> > CONFIG_DVB_STV090x=y
> > CONFIG_DVB_STV0910=y
> > CONFIG_DVB_STV6110x=y
> > CONFIG_DVB_STV6111=y
> > 
> > #
> > # Multistandard (cable + terrestrial) frontends
> > #
> > # CONFIG_DVB_DRXK is not set
> > CONFIG_DVB_MN88472=y
> > # CONFIG_DVB_MN88473 is not set
> > CONFIG_DVB_SI2165=y
> > CONFIG_DVB_TDA18271C2DD=y
> > 
> > #
> > # DVB-S (satellite) frontends
> > #
> > CONFIG_DVB_CX24110=y
> > CONFIG_DVB_CX24116=y
> > # CONFIG_DVB_CX24117 is not set
> > # CONFIG_DVB_CX24120 is not set
> > CONFIG_DVB_CX24123=y
> > CONFIG_DVB_DS3000=y
> > CONFIG_DVB_MB86A16=y
> > # CONFIG_DVB_MT312 is not set
> > # CONFIG_DVB_S5H1420 is not set
> > CONFIG_DVB_SI21XX=y
> > CONFIG_DVB_STB6000=y
> > CONFIG_DVB_STV0288=y
> > CONFIG_DVB_STV0299=y
> > CONFIG_DVB_STV0900=y
> > CONFIG_DVB_STV6110=y
> > CONFIG_DVB_TDA10071=y
> > CONFIG_DVB_TDA10086=y
> > CONFIG_DVB_TDA8083=y
> > CONFIG_DVB_TDA8261=y
> > CONFIG_DVB_TDA826X=y
> > CONFIG_DVB_TS2020=y
> > CONFIG_DVB_TUA6100=y
> > CONFIG_DVB_TUNER_CX24113=y
> > CONFIG_DVB_TUNER_ITD1000=y
> > CONFIG_DVB_VES1X93=y
> > CONFIG_DVB_ZL10036=y
> > CONFIG_DVB_ZL10039=y
> > 
> > #
> > # DVB-T (terrestrial) frontends
> > #
> > CONFIG_DVB_AF9013=y
> > CONFIG_DVB_CX22700=y
> > # CONFIG_DVB_CX22702 is not set
> > # CONFIG_DVB_CXD2820R is not set
> > # CONFIG_DVB_CXD2841ER is not set
> > CONFIG_DVB_DIB3000MB=y
> > # CONFIG_DVB_DIB3000MC is not set
> > CONFIG_DVB_DIB7000M=y
> > CONFIG_DVB_DIB7000P=y
> > CONFIG_DVB_DIB9000=y
> > CONFIG_DVB_DRXD=y
> > CONFIG_DVB_EC100=y
> > CONFIG_DVB_L64781=y
> > CONFIG_DVB_MT352=y
> > # CONFIG_DVB_NXT6000 is not set
> > # CONFIG_DVB_RTL2830 is not set
> > # CONFIG_DVB_RTL2832 is not set
> > CONFIG_DVB_S5H1432=y
> > # CONFIG_DVB_SI2168 is not set
> > CONFIG_DVB_SP887X=y
> > # CONFIG_DVB_STV0367 is not set
> > CONFIG_DVB_TDA10048=y
> > CONFIG_DVB_TDA1004X=y
> > CONFIG_DVB_ZD1301_DEMOD=y
> > # CONFIG_DVB_ZL10353 is not set
> > 
> > #
> > # DVB-C (cable) frontends
> > #
> > CONFIG_DVB_STV0297=y
> > # CONFIG_DVB_TDA10021 is not set
> > CONFIG_DVB_TDA10023=y
> > CONFIG_DVB_VES1820=y
> > 
> > #
> > # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> > #
> > # CONFIG_DVB_AU8522_DTV is not set
> > # CONFIG_DVB_AU8522_V4L is not set
> > # CONFIG_DVB_BCM3510 is not set
> > CONFIG_DVB_LG2160=y
> > CONFIG_DVB_LGDT3305=y
> > CONFIG_DVB_LGDT3306A=y
> > CONFIG_DVB_LGDT330X=y
> > CONFIG_DVB_MXL692=y
> > # CONFIG_DVB_NXT200X is not set
> > CONFIG_DVB_OR51132=y
> > CONFIG_DVB_OR51211=y
> > CONFIG_DVB_S5H1409=y
> > # CONFIG_DVB_S5H1411 is not set
> > 
> > #
> > # ISDB-T (terrestrial) frontends
> > #
> > CONFIG_DVB_DIB8000=y
> > # CONFIG_DVB_MB86A20S is not set
> > CONFIG_DVB_S921=y
> > 
> > #
> > # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> > #
> > CONFIG_DVB_MN88443X=y
> > CONFIG_DVB_TC90522=y
> > 
> > #
> > # Digital terrestrial only tuners/PLL
> > #
> > CONFIG_DVB_PLL=y
> > CONFIG_DVB_TUNER_DIB0070=y
> > CONFIG_DVB_TUNER_DIB0090=y
> > 
> > #
> > # SEC control devices for DVB-S
> > #
> > CONFIG_DVB_A8293=y
> > CONFIG_DVB_AF9033=y
> > CONFIG_DVB_ASCOT2E=y
> > CONFIG_DVB_ATBM8830=y
> > # CONFIG_DVB_HELENE is not set
> > CONFIG_DVB_HORUS3A=y
> > CONFIG_DVB_ISL6405=y
> > CONFIG_DVB_ISL6421=y
> > # CONFIG_DVB_ISL6423 is not set
> > CONFIG_DVB_IX2505V=y
> > CONFIG_DVB_LGS8GL5=y
> > CONFIG_DVB_LGS8GXX=y
> > CONFIG_DVB_LNBH25=y
> > CONFIG_DVB_LNBH29=y
> > CONFIG_DVB_LNBP21=y
> > CONFIG_DVB_LNBP22=y
> > # CONFIG_DVB_M88RS2000 is not set
> > CONFIG_DVB_TDA665x=y
> > # CONFIG_DVB_DRX39XYJ is not set
> > 
> > #
> > # Common Interface (EN50221) controller drivers
> > #
> > # CONFIG_DVB_CXD2099 is not set
> > CONFIG_DVB_SP2=y
> > # end of Customise DVB Frontends
> > # end of Media ancillary drivers
> > 
> > #
> > # Graphics support
> > #
> > CONFIG_APERTURE_HELPERS=y
> > CONFIG_IMX_IPUV3_CORE=y
> > CONFIG_DRM=y
> > CONFIG_DRM_MIPI_DSI=y
> > # CONFIG_DRM_DEBUG_MM is not set
> > # CONFIG_DRM_DEBUG_SELFTEST is not set
> > CONFIG_DRM_KUNIT_TEST=y
> > CONFIG_DRM_KMS_HELPER=y
> > # CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
> > CONFIG_DRM_DEBUG_MODESET_LOCK=y
> > # CONFIG_DRM_FBDEV_EMULATION is not set
> > # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> > CONFIG_DRM_DISPLAY_HELPER=y
> > CONFIG_DRM_DISPLAY_DP_HELPER=y
> > CONFIG_DRM_DISPLAY_HDMI_HELPER=y
> > # CONFIG_DRM_DP_AUX_CHARDEV is not set
> > CONFIG_DRM_DP_CEC=y
> > CONFIG_DRM_TTM=y
> > CONFIG_DRM_BUDDY=y
> > CONFIG_DRM_VRAM_HELPER=y
> > CONFIG_DRM_TTM_HELPER=y
> > CONFIG_DRM_GEM_CMA_HELPER=y
> > CONFIG_DRM_GEM_SHMEM_HELPER=y
> > CONFIG_DRM_SCHED=y
> > 
> > #
> > # I2C encoder or helper chips
> > #
> > # CONFIG_DRM_I2C_CH7006 is not set
> > CONFIG_DRM_I2C_SIL164=y
> > CONFIG_DRM_I2C_NXP_TDA998X=y
> > CONFIG_DRM_I2C_NXP_TDA9950=y
> > # end of I2C encoder or helper chips
> > 
> > #
> > # ARM devices
> > #
> > # end of ARM devices
> > 
> > # CONFIG_DRM_RADEON is not set
> > CONFIG_DRM_AMDGPU=y
> > # CONFIG_DRM_AMDGPU_SI is not set
> > CONFIG_DRM_AMDGPU_CIK=y
> > # CONFIG_DRM_AMDGPU_USERPTR is not set
> > 
> > #
> > # ACP (Audio CoProcessor) Configuration
> > #
> > CONFIG_DRM_AMD_ACP=y
> > # end of ACP (Audio CoProcessor) Configuration
> > 
> > #
> > # Display Engine Configuration
> > #
> > # CONFIG_DRM_AMD_DC is not set
> > # end of Display Engine Configuration
> > 
> > CONFIG_DRM_NOUVEAU=y
> > CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT=y
> > CONFIG_NOUVEAU_DEBUG=5
> > CONFIG_NOUVEAU_DEBUG_DEFAULT=3
> > CONFIG_NOUVEAU_DEBUG_MMU=y
> > CONFIG_NOUVEAU_DEBUG_PUSH=y
> > CONFIG_DRM_NOUVEAU_BACKLIGHT=y
> > CONFIG_DRM_KMB_DISPLAY=y
> > CONFIG_DRM_VGEM=y
> > CONFIG_DRM_VKMS=y
> > CONFIG_DRM_AST=y
> > # CONFIG_DRM_MGAG200 is not set
> > CONFIG_DRM_QXL=y
> > CONFIG_DRM_VIRTIO_GPU=y
> > CONFIG_DRM_PANEL=y
> > 
> > #
> > # Display Panels
> > #
> > # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> > # end of Display Panels
> > 
> > CONFIG_DRM_BRIDGE=y
> > CONFIG_DRM_PANEL_BRIDGE=y
> > 
> > #
> > # Display Interface Bridges
> > #
> > CONFIG_DRM_ANALOGIX_ANX78XX=y
> > CONFIG_DRM_ANALOGIX_DP=y
> > # end of Display Interface Bridges
> > 
> > # CONFIG_DRM_IMX is not set
> > CONFIG_DRM_ETNAVIV=y
> > CONFIG_DRM_ETNAVIV_THERMAL=y
> > # CONFIG_DRM_HISI_HIBMC is not set
> > CONFIG_DRM_LOGICVC=y
> > CONFIG_DRM_BOCHS=y
> > # CONFIG_DRM_CIRRUS_QEMU is not set
> > CONFIG_DRM_SIMPLEDRM=y
> > CONFIG_DRM_PANFROST=y
> > # CONFIG_DRM_SSD130X is not set
> > CONFIG_DRM_LEGACY=y
> > # CONFIG_DRM_TDFX is not set
> > CONFIG_DRM_R128=y
> > CONFIG_DRM_MGA=y
> > CONFIG_DRM_VIA=y
> > # CONFIG_DRM_SAVAGE is not set
> > CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
> > CONFIG_DRM_NOMODESET=y
> > 
> > #
> > # Frame buffer Devices
> > #
> > CONFIG_FB_CMDLINE=y
> > CONFIG_FB_NOTIFY=y
> > CONFIG_FB=y
> > # CONFIG_FIRMWARE_EDID is not set
> > CONFIG_FB_DDC=y
> > CONFIG_FB_CFB_FILLRECT=y
> > CONFIG_FB_CFB_COPYAREA=y
> > CONFIG_FB_CFB_IMAGEBLIT=y
> > CONFIG_FB_SYS_FILLRECT=y
> > CONFIG_FB_SYS_COPYAREA=y
> > CONFIG_FB_SYS_IMAGEBLIT=y
> > CONFIG_FB_FOREIGN_ENDIAN=y
> > # CONFIG_FB_BOTH_ENDIAN is not set
> > CONFIG_FB_BIG_ENDIAN=y
> > # CONFIG_FB_LITTLE_ENDIAN is not set
> > CONFIG_FB_SYS_FOPS=y
> > CONFIG_FB_DEFERRED_IO=y
> > CONFIG_FB_SVGALIB=y
> > CONFIG_FB_MACMODES=y
> > CONFIG_FB_BACKLIGHT=y
> > CONFIG_FB_MODE_HELPERS=y
> > CONFIG_FB_TILEBLITTING=y
> > 
> > #
> > # Frame buffer hardware drivers
> > #
> > CONFIG_FB_CIRRUS=y
> > CONFIG_FB_PM2=y
> > CONFIG_FB_PM2_FIFO_DISCONNECT=y
> > CONFIG_FB_CLPS711X=y
> > # CONFIG_FB_CYBER2000 is not set
> > # CONFIG_FB_ARC is not set
> > CONFIG_FB_CONTROL=y
> > # CONFIG_FB_ASILIANT is not set
> > # CONFIG_FB_IMSTT is not set
> > CONFIG_FB_GBE=y
> > CONFIG_FB_GBE_MEM=4
> > # CONFIG_FB_PVR2 is not set
> > CONFIG_FB_OPENCORES=y
> > CONFIG_FB_S1D13XXX=y
> > CONFIG_FB_NVIDIA=y
> > CONFIG_FB_NVIDIA_I2C=y
> > CONFIG_FB_NVIDIA_DEBUG=y
> > # CONFIG_FB_NVIDIA_BACKLIGHT is not set
> > CONFIG_FB_RIVA=y
> > # CONFIG_FB_RIVA_I2C is not set
> > # CONFIG_FB_RIVA_DEBUG is not set
> > CONFIG_FB_RIVA_BACKLIGHT=y
> > CONFIG_FB_I740=y
> > CONFIG_FB_MATROX=y
> > # CONFIG_FB_MATROX_MILLENIUM is not set
> > # CONFIG_FB_MATROX_MYSTIQUE is not set
> > CONFIG_FB_MATROX_G=y
> > CONFIG_FB_MATROX_I2C=y
> > # CONFIG_FB_MATROX_MAVEN is not set
> > # CONFIG_FB_RADEON is not set
> > CONFIG_FB_ATY128=y
> > CONFIG_FB_ATY128_BACKLIGHT=y
> > CONFIG_FB_ATY=y
> > CONFIG_FB_ATY_CT=y
> > CONFIG_FB_ATY_GENERIC_LCD=y
> > # CONFIG_FB_ATY_GX is not set
> > # CONFIG_FB_ATY_BACKLIGHT is not set
> > CONFIG_FB_S3=y
> > # CONFIG_FB_S3_DDC is not set
> > CONFIG_FB_SAVAGE=y
> > CONFIG_FB_SAVAGE_I2C=y
> > # CONFIG_FB_SAVAGE_ACCEL is not set
> > CONFIG_FB_SIS=y
> > CONFIG_FB_SIS_300=y
> > # CONFIG_FB_SIS_315 is not set
> > CONFIG_FB_VIA=y
> > # CONFIG_FB_VIA_DIRECT_PROCFS is not set
> > # CONFIG_FB_VIA_X_COMPATIBILITY is not set
> > # CONFIG_FB_NEOMAGIC is not set
> > CONFIG_FB_KYRO=y
> > # CONFIG_FB_3DFX is not set
> > # CONFIG_FB_VOODOO1 is not set
> > CONFIG_FB_VT8623=y
> > CONFIG_FB_TRIDENT=y
> > CONFIG_FB_ARK=y
> > CONFIG_FB_PM3=y
> > CONFIG_FB_CARMINE=y
> > # CONFIG_FB_CARMINE_DRAM_EVAL is not set
> > CONFIG_CARMINE_DRAM_CUSTOM=y
> > # CONFIG_FB_WM8505 is not set
> > CONFIG_FB_W100=y
> > # CONFIG_FB_TMIO is not set
> > # CONFIG_FB_IBM_GXT4500 is not set
> > CONFIG_FB_GOLDFISH=y
> > CONFIG_FB_VIRTUAL=y
> > # CONFIG_FB_METRONOME is not set
> > CONFIG_FB_MB862XX=y
> > CONFIG_FB_MB862XX_PCI_GDC=y
> > CONFIG_FB_MB862XX_I2C=y
> > CONFIG_FB_BROADSHEET=y
> > CONFIG_FB_SSD1307=y
> > # CONFIG_FB_SM712 is not set
> > # CONFIG_FB_OMAP_LCD_H3 is not set
> > CONFIG_MMP_DISP=y
> > CONFIG_MMP_FB=y
> > # end of Frame buffer Devices
> > 
> > #
> > # Backlight & LCD device support
> > #
> > CONFIG_LCD_CLASS_DEVICE=y
> > CONFIG_LCD_PLATFORM=y
> > CONFIG_BACKLIGHT_CLASS_DEVICE=y
> > CONFIG_BACKLIGHT_KTD253=y
> > CONFIG_BACKLIGHT_LM3533=y
> > CONFIG_BACKLIGHT_OMAP1=y
> > CONFIG_BACKLIGHT_PWM=y
> > # CONFIG_BACKLIGHT_MAX8925 is not set
> > # CONFIG_BACKLIGHT_QCOM_WLED is not set
> > CONFIG_BACKLIGHT_RT4831=y
> > CONFIG_BACKLIGHT_WM831X=y
> > # CONFIG_BACKLIGHT_ADP5520 is not set
> > CONFIG_BACKLIGHT_ADP8860=y
> > CONFIG_BACKLIGHT_ADP8870=y
> > # CONFIG_BACKLIGHT_AAT2870 is not set
> > CONFIG_BACKLIGHT_LM3630A=y
> > CONFIG_BACKLIGHT_LM3639=y
> > # CONFIG_BACKLIGHT_LP855X is not set
> > CONFIG_BACKLIGHT_PANDORA=y
> > # CONFIG_BACKLIGHT_SKY81452 is not set
> > CONFIG_BACKLIGHT_GPIO=y
> > # CONFIG_BACKLIGHT_LV5207LP is not set
> > CONFIG_BACKLIGHT_BD6107=y
> > # CONFIG_BACKLIGHT_ARCXCNN is not set
> > # end of Backlight & LCD device support
> > 
> > CONFIG_VGASTATE=y
> > CONFIG_VIDEOMODE_HELPERS=y
> > CONFIG_HDMI=y
> > CONFIG_LOGO=y
> > # CONFIG_LOGO_LINUX_MONO is not set
> > # CONFIG_LOGO_LINUX_VGA16 is not set
> > CONFIG_LOGO_LINUX_CLUT224=y
> > # end of Graphics support
> > 
> > CONFIG_SOUND=y
> > CONFIG_SND=y
> > CONFIG_SND_TIMER=y
> > CONFIG_SND_PCM=y
> > CONFIG_SND_HWDEP=y
> > CONFIG_SND_RAWMIDI=y
> > CONFIG_SND_JACK=y
> > CONFIG_SND_JACK_INPUT_DEV=y
> > # CONFIG_SND_OSSEMUL is not set
> > CONFIG_SND_PCM_TIMER=y
> > CONFIG_SND_HRTIMER=y
> > CONFIG_SND_DYNAMIC_MINORS=y
> > CONFIG_SND_MAX_CARDS=32
> > # CONFIG_SND_SUPPORT_OLD_API is not set
> > CONFIG_SND_VERBOSE_PRINTK=y
> > CONFIG_SND_CTL_FAST_LOOKUP=y
> > # CONFIG_SND_DEBUG is not set
> > # CONFIG_SND_CTL_INPUT_VALIDATION is not set
> > CONFIG_SND_VMASTER=y
> > CONFIG_SND_CTL_LED=y
> > # CONFIG_SND_SEQUENCER is not set
> > CONFIG_SND_MPU401_UART=y
> > CONFIG_SND_OPL3_LIB=y
> > CONFIG_SND_VX_LIB=y
> > CONFIG_SND_AC97_CODEC=y
> > # CONFIG_SND_DRIVERS is not set
> > CONFIG_SND_PCI=y
> > CONFIG_SND_AD1889=y
> > # CONFIG_SND_ALS300 is not set
> > CONFIG_SND_ALI5451=y
> > # CONFIG_SND_ATIIXP is not set
> > CONFIG_SND_ATIIXP_MODEM=y
> > CONFIG_SND_AU8810=y
> > CONFIG_SND_AU8820=y
> > # CONFIG_SND_AU8830 is not set
> > CONFIG_SND_AW2=y
> > CONFIG_SND_AZT3328=y
> > CONFIG_SND_BT87X=y
> > # CONFIG_SND_BT87X_OVERCLOCK is not set
> > CONFIG_SND_CA0106=y
> > CONFIG_SND_CMIPCI=y
> > CONFIG_SND_OXYGEN_LIB=y
> > CONFIG_SND_OXYGEN=y
> > CONFIG_SND_CS4281=y
> > CONFIG_SND_CS46XX=y
> > # CONFIG_SND_CS46XX_NEW_DSP is not set
> > CONFIG_SND_CS5535AUDIO=y
> > CONFIG_SND_CTXFI=y
> > # CONFIG_SND_DARLA20 is not set
> > CONFIG_SND_GINA20=y
> > CONFIG_SND_LAYLA20=y
> > # CONFIG_SND_DARLA24 is not set
> > CONFIG_SND_GINA24=y
> > CONFIG_SND_LAYLA24=y
> > CONFIG_SND_MONA=y
> > CONFIG_SND_MIA=y
> > CONFIG_SND_ECHO3G=y
> > # CONFIG_SND_INDIGO is not set
> > CONFIG_SND_INDIGOIO=y
> > CONFIG_SND_INDIGODJ=y
> > # CONFIG_SND_INDIGOIOX is not set
> > CONFIG_SND_INDIGODJX=y
> > # CONFIG_SND_EMU10K1 is not set
> > # CONFIG_SND_EMU10K1X is not set
> > CONFIG_SND_ENS1370=y
> > # CONFIG_SND_ENS1371 is not set
> > CONFIG_SND_ES1938=y
> > CONFIG_SND_ES1968=y
> > CONFIG_SND_ES1968_INPUT=y
> > # CONFIG_SND_ES1968_RADIO is not set
> > # CONFIG_SND_FM801 is not set
> > CONFIG_SND_HDSP=y
> > 
> > #
> > # Don't forget to add built-in firmwares for HDSP driver
> > #
> > # CONFIG_SND_HDSPM is not set
> > CONFIG_SND_ICE1712=y
> > CONFIG_SND_ICE1724=y
> > CONFIG_SND_INTEL8X0=y
> > CONFIG_SND_INTEL8X0M=y
> > CONFIG_SND_KORG1212=y
> > CONFIG_SND_LOLA=y
> > # CONFIG_SND_MAESTRO3 is not set
> > # CONFIG_SND_MIXART is not set
> > CONFIG_SND_NM256=y
> > # CONFIG_SND_PCXHR is not set
> > # CONFIG_SND_RIPTIDE is not set
> > CONFIG_SND_RME32=y
> > CONFIG_SND_RME96=y
> > # CONFIG_SND_RME9652 is not set
> > CONFIG_SND_SONICVIBES=y
> > CONFIG_SND_TRIDENT=y
> > # CONFIG_SND_VIA82XX is not set
> > CONFIG_SND_VIA82XX_MODEM=y
> > CONFIG_SND_VIRTUOSO=y
> > CONFIG_SND_VX222=y
> > CONFIG_SND_YMFPCI=y
> > 
> > #
> > # HD-Audio
> > #
> > CONFIG_SND_HDA=y
> > CONFIG_SND_HDA_GENERIC_LEDS=y
> > CONFIG_SND_HDA_INTEL=y
> > CONFIG_SND_HDA_HWDEP=y
> > CONFIG_SND_HDA_RECONFIG=y
> > CONFIG_SND_HDA_INPUT_BEEP=y
> > CONFIG_SND_HDA_INPUT_BEEP_MODE=1
> > CONFIG_SND_HDA_PATCH_LOADER=y
> > # CONFIG_SND_HDA_CODEC_REALTEK is not set
> > CONFIG_SND_HDA_CODEC_ANALOG=y
> > CONFIG_SND_HDA_CODEC_SIGMATEL=y
> > CONFIG_SND_HDA_CODEC_VIA=y
> > # CONFIG_SND_HDA_CODEC_HDMI is not set
> > # CONFIG_SND_HDA_CODEC_CIRRUS is not set
> > CONFIG_SND_HDA_CODEC_CS8409=y
> > CONFIG_SND_HDA_CODEC_CONEXANT=y
> > CONFIG_SND_HDA_CODEC_CA0110=y
> > # CONFIG_SND_HDA_CODEC_CA0132 is not set
> > CONFIG_SND_HDA_CODEC_CMEDIA=y
> > CONFIG_SND_HDA_CODEC_SI3054=y
> > CONFIG_SND_HDA_GENERIC=y
> > CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM=y
> > # end of HD-Audio
> > 
> > CONFIG_SND_HDA_CORE=y
> > CONFIG_SND_HDA_COMPONENT=y
> > CONFIG_SND_HDA_PREALLOC_SIZE=64
> > CONFIG_SND_INTEL_DSP_CONFIG=y
> > CONFIG_SND_FIREWIRE=y
> > CONFIG_SND_FIREWIRE_LIB=y
> > CONFIG_SND_DICE=y
> > CONFIG_SND_OXFW=y
> > CONFIG_SND_ISIGHT=y
> > CONFIG_SND_FIREWORKS=y
> > CONFIG_SND_BEBOB=y
> > CONFIG_SND_FIREWIRE_DIGI00X=y
> > # CONFIG_SND_FIREWIRE_TASCAM is not set
> > CONFIG_SND_FIREWIRE_MOTU=y
> > # CONFIG_SND_FIREFACE is not set
> > # CONFIG_SND_SOC is not set
> > CONFIG_SND_VIRTIO=y
> > CONFIG_AC97_BUS=y
> > 
> > #
> > # HID support
> > #
> > CONFIG_HID=y
> > # CONFIG_HID_BATTERY_STRENGTH is not set
> > # CONFIG_HIDRAW is not set
> > CONFIG_UHID=y
> > # CONFIG_HID_GENERIC is not set
> > 
> > #
> > # Special HID drivers
> > #
> > CONFIG_HID_A4TECH=y
> > CONFIG_HID_ACRUX=y
> > CONFIG_HID_ACRUX_FF=y
> > # CONFIG_HID_APPLE is not set
> > CONFIG_HID_AUREAL=y
> > CONFIG_HID_BELKIN=y
> > CONFIG_HID_CHERRY=y
> > CONFIG_HID_COUGAR=y
> > CONFIG_HID_MACALLY=y
> > # CONFIG_HID_CMEDIA is not set
> > CONFIG_HID_CYPRESS=y
> > CONFIG_HID_DRAGONRISE=y
> > # CONFIG_DRAGONRISE_FF is not set
> > CONFIG_HID_EMS_FF=y
> > CONFIG_HID_ELECOM=y
> > CONFIG_HID_EZKEY=y
> > CONFIG_HID_GEMBIRD=y
> > CONFIG_HID_GFRM=y
> > CONFIG_HID_GLORIOUS=y
> > CONFIG_HID_VIVALDI_COMMON=y
> > CONFIG_HID_VIVALDI=y
> > CONFIG_HID_KEYTOUCH=y
> > CONFIG_HID_KYE=y
> > # CONFIG_HID_WALTOP is not set
> > CONFIG_HID_VIEWSONIC=y
> > CONFIG_HID_XIAOMI=y
> > CONFIG_HID_GYRATION=y
> > # CONFIG_HID_ICADE is not set
> > CONFIG_HID_ITE=y
> > CONFIG_HID_JABRA=y
> > CONFIG_HID_TWINHAN=y
> > # CONFIG_HID_KENSINGTON is not set
> > CONFIG_HID_LCPOWER=y
> > CONFIG_HID_LED=y
> > CONFIG_HID_LENOVO=y
> > # CONFIG_HID_MAGICMOUSE is not set
> > CONFIG_HID_MALTRON=y
> > CONFIG_HID_MAYFLASH=y
> > CONFIG_HID_REDRAGON=y
> > # CONFIG_HID_MICROSOFT is not set
> > CONFIG_HID_MONTEREY=y
> > # CONFIG_HID_MULTITOUCH is not set
> > # CONFIG_HID_NINTENDO is not set
> > CONFIG_HID_NTI=y
> > # CONFIG_HID_ORTEK is not set
> > CONFIG_HID_PANTHERLORD=y
> > # CONFIG_PANTHERLORD_FF is not set
> > CONFIG_HID_PETALYNX=y
> > CONFIG_HID_PICOLCD=y
> > # CONFIG_HID_PICOLCD_FB is not set
> > CONFIG_HID_PICOLCD_BACKLIGHT=y
> > # CONFIG_HID_PICOLCD_LCD is not set
> > CONFIG_HID_PICOLCD_LEDS=y
> > # CONFIG_HID_PICOLCD_CIR is not set
> > # CONFIG_HID_PLANTRONICS is not set
> > CONFIG_HID_PLAYSTATION=y
> > CONFIG_PLAYSTATION_FF=y
> > CONFIG_HID_RAZER=y
> > # CONFIG_HID_PRIMAX is not set
> > # CONFIG_HID_SAITEK is not set
> > # CONFIG_HID_SEMITEK is not set
> > # CONFIG_HID_SPEEDLINK is not set
> > CONFIG_HID_STEAM=y
> > CONFIG_HID_STEELSERIES=y
> > # CONFIG_HID_SUNPLUS is not set
> > CONFIG_HID_RMI=y
> > CONFIG_HID_GREENASIA=y
> > CONFIG_GREENASIA_FF=y
> > CONFIG_HID_SMARTJOYPLUS=y
> > CONFIG_SMARTJOYPLUS_FF=y
> > CONFIG_HID_TIVO=y
> > CONFIG_HID_TOPSEED=y
> > CONFIG_HID_THINGM=y
> > CONFIG_HID_UDRAW_PS3=y
> > # CONFIG_HID_WIIMOTE is not set
> > # CONFIG_HID_XINMO is not set
> > CONFIG_HID_ZEROPLUS=y
> > # CONFIG_ZEROPLUS_FF is not set
> > # CONFIG_HID_ZYDACRON is not set
> > CONFIG_HID_SENSOR_HUB=y
> > CONFIG_HID_SENSOR_CUSTOM_SENSOR=y
> > # CONFIG_HID_ALPS is not set
> > # end of Special HID drivers
> > 
> > #
> > # I2C HID support
> > #
> > # end of I2C HID support
> > 
> > #
> > # Intel ISH HID support
> > #
> > # end of Intel ISH HID support
> > 
> > #
> > # AMD SFH HID Support
> > #
> > CONFIG_AMD_SFH_HID=y
> > # end of AMD SFH HID Support
> > # end of HID support
> > 
> > CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> > # CONFIG_USB_SUPPORT is not set
> > CONFIG_MMC=y
> > CONFIG_MMC_BLOCK=y
> > CONFIG_MMC_BLOCK_MINORS=8
> > # CONFIG_SDIO_UART is not set
> > CONFIG_MMC_TEST=y
> > 
> > #
> > # MMC/SD/SDIO Host Controller Drivers
> > #
> > # CONFIG_MMC_DEBUG is not set
> > # CONFIG_MMC_SDHCI is not set
> > CONFIG_MMC_MOXART=y
> > CONFIG_MMC_OMAP_HS=y
> > CONFIG_MMC_ALCOR=y
> > # CONFIG_MMC_TIFM_SD is not set
> > CONFIG_MMC_DAVINCI=y
> > CONFIG_MMC_S3C=y
> > CONFIG_MMC_S3C_HW_SDIO_IRQ=y
> > # CONFIG_MMC_S3C_PIO is not set
> > CONFIG_MMC_S3C_DMA=y
> > CONFIG_MMC_TMIO_CORE=y
> > CONFIG_MMC_TMIO=y
> > CONFIG_MMC_SDHI=y
> > # CONFIG_MMC_SDHI_SYS_DMAC is not set
> > # CONFIG_MMC_SDHI_INTERNAL_DMAC is not set
> > # CONFIG_MMC_CB710 is not set
> > CONFIG_MMC_VIA_SDMMC=y
> > CONFIG_MMC_DW=y
> > CONFIG_MMC_DW_PLTFM=y
> > # CONFIG_MMC_DW_BLUEFIELD is not set
> > # CONFIG_MMC_DW_EXYNOS is not set
> > CONFIG_MMC_DW_HI3798CV200=y
> > CONFIG_MMC_DW_K3=y
> > CONFIG_MMC_DW_PCI=y
> > CONFIG_MMC_SH_MMCIF=y
> > CONFIG_MMC_USDHI6ROL0=y
> > CONFIG_MMC_REALTEK_PCI=y
> > CONFIG_MMC_CQHCI=y
> > CONFIG_MMC_HSQ=y
> > # CONFIG_MMC_TOSHIBA_PCI is not set
> > CONFIG_MMC_BCM2835=y
> > # CONFIG_MMC_OWL is not set
> > # CONFIG_MMC_LITEX is not set
> > CONFIG_SCSI_UFSHCD=y
> > # CONFIG_SCSI_UFS_BSG is not set
> > CONFIG_SCSI_UFS_HPB=y
> > # CONFIG_SCSI_UFS_FAULT_INJECTION is not set
> > # CONFIG_SCSI_UFS_HWMON is not set
> > # CONFIG_SCSI_UFSHCD_PCI is not set
> > CONFIG_SCSI_UFSHCD_PLATFORM=y
> > CONFIG_SCSI_UFS_CDNS_PLATFORM=y
> > CONFIG_SCSI_UFS_DWC_TC_PLATFORM=y
> > CONFIG_SCSI_UFS_HISI=y
> > # CONFIG_SCSI_UFS_RENESAS is not set
> > # CONFIG_SCSI_UFS_EXYNOS is not set
> > CONFIG_MEMSTICK=y
> > CONFIG_MEMSTICK_DEBUG=y
> > 
> > #
> > # MemoryStick drivers
> > #
> > # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> > CONFIG_MSPRO_BLOCK=y
> > CONFIG_MS_BLOCK=y
> > 
> > #
> > # MemoryStick Host Controller Drivers
> > #
> > # CONFIG_MEMSTICK_TIFM_MS is not set
> > CONFIG_MEMSTICK_JMICRON_38X=y
> > # CONFIG_MEMSTICK_R592 is not set
> > CONFIG_MEMSTICK_REALTEK_PCI=y
> > CONFIG_NEW_LEDS=y
> > CONFIG_LEDS_CLASS=y
> > CONFIG_LEDS_CLASS_FLASH=y
> > CONFIG_LEDS_CLASS_MULTICOLOR=y
> > CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y
> > 
> > #
> > # LED drivers
> > #
> > CONFIG_LEDS_ARIEL=y
> > CONFIG_LEDS_LM3530=y
> > CONFIG_LEDS_LM3532=y
> > # CONFIG_LEDS_LM3533 is not set
> > # CONFIG_LEDS_LM3642 is not set
> > CONFIG_LEDS_S3C24XX=y
> > CONFIG_LEDS_COBALT_QUBE=y
> > CONFIG_LEDS_COBALT_RAQ=y
> > CONFIG_LEDS_PCA9532=y
> > # CONFIG_LEDS_PCA9532_GPIO is not set
> > # CONFIG_LEDS_GPIO is not set
> > # CONFIG_LEDS_LP3944 is not set
> > # CONFIG_LEDS_LP3952 is not set
> > CONFIG_LEDS_LP50XX=y
> > # CONFIG_LEDS_PCA955X is not set
> > # CONFIG_LEDS_PCA963X is not set
> > CONFIG_LEDS_WM831X_STATUS=y
> > # CONFIG_LEDS_PWM is not set
> > CONFIG_LEDS_REGULATOR=y
> > CONFIG_LEDS_BD2802=y
> > # CONFIG_LEDS_LT3593 is not set
> > CONFIG_LEDS_ADP5520=y
> > # CONFIG_LEDS_MC13783 is not set
> > # CONFIG_LEDS_NS2 is not set
> > CONFIG_LEDS_ASIC3=y
> > CONFIG_LEDS_TCA6507=y
> > CONFIG_LEDS_TLC591XX=y
> > CONFIG_LEDS_MAX8997=y
> > CONFIG_LEDS_LM355x=y
> > CONFIG_LEDS_OT200=y
> > # CONFIG_LEDS_MENF21BMC is not set
> > # CONFIG_LEDS_IS31FL319X is not set
> > 
> > #
> > # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
> > #
> > CONFIG_LEDS_BLINKM=y
> > # CONFIG_LEDS_PM8058 is not set
> > # CONFIG_LEDS_MLXREG is not set
> > # CONFIG_LEDS_USER is not set
> > # CONFIG_LEDS_TI_LMU_COMMON is not set
> > CONFIG_LEDS_TPS6105X=y
> > CONFIG_LEDS_IP30=y
> > 
> > #
> > # Flash and Torch LED drivers
> > #
> > CONFIG_LEDS_AS3645A=y
> > CONFIG_LEDS_LM3601X=y
> > CONFIG_LEDS_RT8515=y
> > # CONFIG_LEDS_SGM3140 is not set
> > 
> > #
> > # RGB LED drivers
> > #
> > CONFIG_LEDS_PWM_MULTICOLOR=y
> > 
> > #
> > # LED Triggers
> > #
> > CONFIG_LEDS_TRIGGERS=y
> > # CONFIG_LEDS_TRIGGER_TIMER is not set
> > CONFIG_LEDS_TRIGGER_ONESHOT=y
> > CONFIG_LEDS_TRIGGER_DISK=y
> > # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
> > CONFIG_LEDS_TRIGGER_BACKLIGHT=y
> > # CONFIG_LEDS_TRIGGER_CPU is not set
> > # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> > CONFIG_LEDS_TRIGGER_GPIO=y
> > CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
> > 
> > #
> > # iptables trigger is under Netfilter config (LED target)
> > #
> > CONFIG_LEDS_TRIGGER_TRANSIENT=y
> > CONFIG_LEDS_TRIGGER_CAMERA=y
> > # CONFIG_LEDS_TRIGGER_PANIC is not set
> > CONFIG_LEDS_TRIGGER_PATTERN=y
> > CONFIG_LEDS_TRIGGER_AUDIO=y
> > CONFIG_LEDS_TRIGGER_TTY=y
> > 
> > #
> > # Simple LED drivers
> > #
> > # CONFIG_ACCESSIBILITY is not set
> > # CONFIG_DMADEVICES is not set
> > 
> > #
> > # DMABUF options
> > #
> > CONFIG_SYNC_FILE=y
> > CONFIG_SW_SYNC=y
> > CONFIG_UDMABUF=y
> > # CONFIG_DMABUF_MOVE_NOTIFY is not set
> > # CONFIG_DMABUF_DEBUG is not set
> > CONFIG_DMABUF_SELFTESTS=y
> > # CONFIG_DMABUF_HEAPS is not set
> > CONFIG_DMABUF_SYSFS_STATS=y
> > # end of DMABUF options
> > 
> > CONFIG_AUXDISPLAY=y
> > CONFIG_CHARLCD=y
> > CONFIG_LINEDISP=y
> > CONFIG_HD44780_COMMON=y
> > CONFIG_HD44780=y
> > # CONFIG_IMG_ASCII_LCD is not set
> > CONFIG_HT16K33=y
> > CONFIG_LCD2S=y
> > CONFIG_PARPORT_PANEL=y
> > CONFIG_PANEL_PARPORT=0
> > CONFIG_PANEL_PROFILE=5
> > # CONFIG_PANEL_CHANGE_MESSAGE is not set
> > CONFIG_CHARLCD_BL_OFF=y
> > # CONFIG_CHARLCD_BL_ON is not set
> > # CONFIG_CHARLCD_BL_FLASH is not set
> > CONFIG_PANEL=y
> > CONFIG_UIO=y
> > CONFIG_UIO_CIF=y
> > CONFIG_UIO_PDRV_GENIRQ=y
> > CONFIG_UIO_DMEM_GENIRQ=y
> > CONFIG_UIO_AEC=y
> > CONFIG_UIO_SERCOS3=y
> > CONFIG_UIO_PCI_GENERIC=y
> > CONFIG_UIO_NETX=y
> > CONFIG_UIO_PRUSS=y
> > CONFIG_UIO_MF624=y
> > # CONFIG_VFIO is not set
> > CONFIG_VIRT_DRIVERS=y
> > CONFIG_VIRTIO_ANCHOR=y
> > CONFIG_VIRTIO=y
> > CONFIG_VIRTIO_MENU=y
> > # CONFIG_VIRTIO_PCI is not set
> > # CONFIG_VIRTIO_BALLOON is not set
> > CONFIG_VIRTIO_INPUT=y
> > # CONFIG_VIRTIO_MMIO is not set
> > CONFIG_VIRTIO_DMA_SHARED_BUFFER=y
> > # CONFIG_VHOST_MENU is not set
> > 
> > #
> > # Microsoft Hyper-V guest support
> > #
> > # end of Microsoft Hyper-V guest support
> > 
> > CONFIG_GREYBUS=y
> > CONFIG_COMEDI=y
> > CONFIG_COMEDI_DEBUG=y
> > CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
> > CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
> > # CONFIG_COMEDI_MISC_DRIVERS is not set
> > # CONFIG_COMEDI_ISA_DRIVERS is not set
> > CONFIG_COMEDI_PCI_DRIVERS=y
> > # CONFIG_COMEDI_8255_PCI is not set
> > CONFIG_COMEDI_ADDI_WATCHDOG=y
> > # CONFIG_COMEDI_ADDI_APCI_1032 is not set
> > CONFIG_COMEDI_ADDI_APCI_1500=y
> > CONFIG_COMEDI_ADDI_APCI_1516=y
> > CONFIG_COMEDI_ADDI_APCI_1564=y
> > CONFIG_COMEDI_ADDI_APCI_16XX=y
> > CONFIG_COMEDI_ADDI_APCI_2032=y
> > CONFIG_COMEDI_ADDI_APCI_2200=y
> > CONFIG_COMEDI_ADDI_APCI_3120=y
> > CONFIG_COMEDI_ADDI_APCI_3501=y
> > CONFIG_COMEDI_ADDI_APCI_3XXX=y
> > # CONFIG_COMEDI_ADL_PCI6208 is not set
> > # CONFIG_COMEDI_ADL_PCI7X3X is not set
> > CONFIG_COMEDI_ADL_PCI8164=y
> > CONFIG_COMEDI_ADL_PCI9111=y
> > CONFIG_COMEDI_ADL_PCI9118=y
> > CONFIG_COMEDI_ADV_PCI1710=y
> > # CONFIG_COMEDI_ADV_PCI1720 is not set
> > CONFIG_COMEDI_ADV_PCI1723=y
> > CONFIG_COMEDI_ADV_PCI1724=y
> > CONFIG_COMEDI_ADV_PCI1760=y
> > CONFIG_COMEDI_ADV_PCI_DIO=y
> > CONFIG_COMEDI_AMPLC_DIO200_PCI=y
> > # CONFIG_COMEDI_AMPLC_PC236_PCI is not set
> > CONFIG_COMEDI_AMPLC_PC263_PCI=y
> > # CONFIG_COMEDI_AMPLC_PCI224 is not set
> > # CONFIG_COMEDI_AMPLC_PCI230 is not set
> > CONFIG_COMEDI_CONTEC_PCI_DIO=y
> > CONFIG_COMEDI_DAS08_PCI=y
> > # CONFIG_COMEDI_DT3000 is not set
> > CONFIG_COMEDI_DYNA_PCI10XX=y
> > # CONFIG_COMEDI_GSC_HPDI is not set
> > CONFIG_COMEDI_MF6X4=y
> > CONFIG_COMEDI_ICP_MULTI=y
> > CONFIG_COMEDI_DAQBOARD2000=y
> > CONFIG_COMEDI_JR3_PCI=y
> > # CONFIG_COMEDI_KE_COUNTER is not set
> > CONFIG_COMEDI_CB_PCIDAS64=y
> > CONFIG_COMEDI_CB_PCIDAS=y
> > CONFIG_COMEDI_CB_PCIDDA=y
> > CONFIG_COMEDI_CB_PCIMDAS=y
> > CONFIG_COMEDI_CB_PCIMDDA=y
> > # CONFIG_COMEDI_ME4000 is not set
> > # CONFIG_COMEDI_ME_DAQ is not set
> > CONFIG_COMEDI_NI_6527=y
> > CONFIG_COMEDI_NI_65XX=y
> > CONFIG_COMEDI_NI_660X=y
> > # CONFIG_COMEDI_NI_670X is not set
> > # CONFIG_COMEDI_NI_LABPC_PCI is not set
> > # CONFIG_COMEDI_NI_PCIDIO is not set
> > # CONFIG_COMEDI_NI_PCIMIO is not set
> > CONFIG_COMEDI_RTD520=y
> > # CONFIG_COMEDI_S626 is not set
> > CONFIG_COMEDI_MITE=y
> > CONFIG_COMEDI_NI_TIOCMD=y
> > CONFIG_COMEDI_8254=y
> > CONFIG_COMEDI_8255=y
> > CONFIG_COMEDI_8255_SA=y
> > # CONFIG_COMEDI_KCOMEDILIB is not set
> > CONFIG_COMEDI_AMPLC_DIO200=y
> > CONFIG_COMEDI_DAS08=y
> > CONFIG_COMEDI_NI_TIO=y
> > CONFIG_COMEDI_NI_ROUTING=y
> > CONFIG_COMEDI_TESTS=y
> > CONFIG_COMEDI_TESTS_EXAMPLE=y
> > CONFIG_COMEDI_TESTS_NI_ROUTES=y
> > CONFIG_STAGING=y
> > CONFIG_RTS5208=y
> > CONFIG_FB_SM750=y
> > CONFIG_STAGING_MEDIA=y
> > # CONFIG_DVB_AV7110 is not set
> > # CONFIG_VIDEO_HANTRO is not set
> > CONFIG_VIDEO_IMX_MEDIA=y
> > 
> > #
> > # i.MX5/6/7/8 Media Sub devices
> > #
> > # CONFIG_VIDEO_IMX_CSI is not set
> > CONFIG_VIDEO_IMX7_CSI=y
> > # end of i.MX5/6/7/8 Media Sub devices
> > 
> > CONFIG_VIDEO_MESON_VDEC=y
> > # CONFIG_VIDEO_OMAP4 is not set
> > CONFIG_VIDEO_ROCKCHIP_VDEC=y
> > # CONFIG_VIDEO_SUNXI is not set
> > # CONFIG_VIDEO_ZORAN is not set
> > CONFIG_FIREWIRE_SERIAL=y
> > CONFIG_FWTTY_MAX_TOTAL_PORTS=64
> > CONFIG_FWTTY_MAX_CARD_PORTS=32
> > # CONFIG_MOST_COMPONENTS is not set
> > # CONFIG_GREYBUS_BOOTROM is not set
> > CONFIG_GREYBUS_HID=y
> > CONFIG_GREYBUS_LIGHT=y
> > CONFIG_GREYBUS_LOG=y
> > # CONFIG_GREYBUS_LOOPBACK is not set
> > CONFIG_GREYBUS_POWER=y
> > # CONFIG_GREYBUS_RAW is not set
> > # CONFIG_GREYBUS_VIBRATOR is not set
> > CONFIG_GREYBUS_BRIDGED_PHY=y
> > CONFIG_GREYBUS_GPIO=y
> > CONFIG_GREYBUS_I2C=y
> > CONFIG_GREYBUS_PWM=y
> > CONFIG_GREYBUS_SDIO=y
> > CONFIG_GREYBUS_UART=y
> > CONFIG_GREYBUS_ARCHE=y
> > # CONFIG_FIELDBUS_DEV is not set
> > # CONFIG_VME_BUS is not set
> > # CONFIG_GOLDFISH is not set
> > CONFIG_CHROME_PLATFORMS=y
> > # CONFIG_CROS_EC is not set
> > # CONFIG_MELLANOX_PLATFORM is not set
> > # CONFIG_OLPC_XO175 is not set
> > CONFIG_SURFACE_PLATFORMS=y
> > # CONFIG_COMMON_CLK is not set
> > # CONFIG_HWSPINLOCK is not set
> > 
> > #
> > # Clock Source drivers
> > #
> > CONFIG_TIMER_OF=y
> > CONFIG_TIMER_PROBE=y
> > CONFIG_CLKSRC_MMIO=y
> > # CONFIG_BCM2835_TIMER is not set
> > CONFIG_BCM_KONA_TIMER=y
> > CONFIG_DAVINCI_TIMER=y
> > # CONFIG_DIGICOLOR_TIMER is not set
> > # CONFIG_OMAP_DM_TIMER is not set
> > # CONFIG_DW_APB_TIMER is not set
> > # CONFIG_FTTMR010_TIMER is not set
> > CONFIG_IXP4XX_TIMER=y
> > # CONFIG_MESON6_TIMER is not set
> > CONFIG_OWL_TIMER=y
> > # CONFIG_RDA_TIMER is not set
> > # CONFIG_SUN4I_TIMER is not set
> > CONFIG_TEGRA_TIMER=y
> > CONFIG_VT8500_TIMER=y
> > # CONFIG_NPCM7XX_TIMER is not set
> > # CONFIG_ASM9260_TIMER is not set
> > # CONFIG_CLKSRC_DBX500_PRCMU is not set
> > CONFIG_CLPS711X_TIMER=y
> > CONFIG_MXS_TIMER=y
> > CONFIG_NSPIRE_TIMER=y
> > CONFIG_INTEGRATOR_AP_TIMER=y
> > # CONFIG_CLKSRC_PISTACHIO is not set
> > # CONFIG_CLKSRC_STM32_LP is not set
> > CONFIG_ARMV7M_SYSTICK=y
> > CONFIG_ATMEL_PIT=y
> > # CONFIG_ATMEL_ST is not set
> > # CONFIG_CLKSRC_SAMSUNG_PWM is not set
> > CONFIG_FSL_FTM_TIMER=y
> > CONFIG_OXNAS_RPS_TIMER=y
> > # CONFIG_MTK_TIMER is not set
> > # CONFIG_SPRD_TIMER is not set
> > # CONFIG_SH_TIMER_CMT is not set
> > # CONFIG_SH_TIMER_MTU2 is not set
> > # CONFIG_RENESAS_OSTM is not set
> > # CONFIG_SH_TIMER_TMU is not set
> > CONFIG_EM_TIMER_STI=y
> > # CONFIG_CLKSRC_PXA is not set
> > CONFIG_TIMER_IMX_SYS_CTR=y
> > # CONFIG_CLKSRC_ST_LPC is not set
> > CONFIG_GXP_TIMER=y
> > CONFIG_MSC313E_TIMER=y
> > CONFIG_MICROCHIP_PIT64B=y
> > # end of Clock Source drivers
> > 
> > CONFIG_MAILBOX=y
> > CONFIG_IMX_MBOX=y
> > CONFIG_ROCKCHIP_MBOX=y
> > # CONFIG_ALTERA_MBOX is not set
> > # CONFIG_POLARFIRE_SOC_MAILBOX is not set
> > # CONFIG_QCOM_APCS_IPC is not set
> > CONFIG_BCM_PDC_MBOX=y
> > # CONFIG_STM32_IPCC is not set
> > CONFIG_MTK_ADSP_MBOX=y
> > CONFIG_MTK_CMDQ_MBOX=y
> > CONFIG_SUN6I_MSGBOX=y
> > # CONFIG_SPRD_MBOX is not set
> > CONFIG_QCOM_IPCC=y
> > CONFIG_IOMMU_API=y
> > CONFIG_IOMMU_SUPPORT=y
> > 
> > #
> > # Generic IOMMU Pagetable Support
> > #
> > CONFIG_IOMMU_IO_PGTABLE=y
> > CONFIG_IOMMU_IO_PGTABLE_LPAE=y
> > # CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST is not set
> > CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
> > # CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST is not set
> > # end of Generic IOMMU Pagetable Support
> > 
> > CONFIG_IOMMU_DEBUGFS=y
> > CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
> > # CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
> > # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> > CONFIG_OMAP_IOMMU=y
> > # CONFIG_OMAP_IOMMU_DEBUG is not set
> > # CONFIG_ROCKCHIP_IOMMU is not set
> > # CONFIG_SUN50I_IOMMU is not set
> > # CONFIG_IPMMU_VMSA is not set
> > CONFIG_APPLE_DART=y
> > CONFIG_ARM_SMMU=y
> > CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y
> > CONFIG_S390_IOMMU=y
> > CONFIG_S390_CCW_IOMMU=y
> > # CONFIG_S390_AP_IOMMU is not set
> > CONFIG_MTK_IOMMU=y
> > # CONFIG_QCOM_IOMMU is not set
> > CONFIG_SPRD_IOMMU=y
> > 
> > #
> > # Remoteproc drivers
> > #
> > # CONFIG_REMOTEPROC is not set
> > # end of Remoteproc drivers
> > 
> > #
> > # Rpmsg drivers
> > #
> > CONFIG_RPMSG=y
> > # CONFIG_RPMSG_CTRL is not set
> > CONFIG_RPMSG_NS=y
> > CONFIG_RPMSG_QCOM_GLINK=y
> > CONFIG_RPMSG_QCOM_GLINK_RPM=y
> > CONFIG_RPMSG_VIRTIO=y
> > # end of Rpmsg drivers
> > 
> > #
> > # SOC (System On Chip) specific Drivers
> > #
> > 
> > #
> > # Amlogic SoC drivers
> > #
> > CONFIG_MESON_CANVAS=y
> > CONFIG_MESON_CLK_MEASURE=y
> > # CONFIG_MESON_GX_SOCINFO is not set
> > CONFIG_MESON_MX_SOCINFO=y
> > # end of Amlogic SoC drivers
> > 
> > #
> > # Apple SoC drivers
> > #
> > CONFIG_APPLE_RTKIT=y
> > CONFIG_APPLE_SART=y
> > # end of Apple SoC drivers
> > 
> > #
> > # ASPEED SoC drivers
> > #
> > # CONFIG_ASPEED_LPC_CTRL is not set
> > CONFIG_ASPEED_LPC_SNOOP=y
> > CONFIG_ASPEED_UART_ROUTING=y
> > CONFIG_ASPEED_P2A_CTRL=y
> > CONFIG_ASPEED_SOCINFO=y
> > # end of ASPEED SoC drivers
> > 
> > CONFIG_AT91_SOC_ID=y
> > # CONFIG_AT91_SOC_SFR is not set
> > 
> > #
> > # Broadcom SoC drivers
> > #
> > CONFIG_SOC_BCM63XX=y
> > CONFIG_SOC_BRCMSTB=y
> > # end of Broadcom SoC drivers
> > 
> > #
> > # NXP/Freescale QorIQ SoC drivers
> > #
> > # end of NXP/Freescale QorIQ SoC drivers
> > 
> > #
> > # fujitsu SoC drivers
> > #
> > # end of fujitsu SoC drivers
> > 
> > #
> > # i.MX SoC drivers
> > #
> > # CONFIG_SOC_IMX8M is not set
> > # end of i.MX SoC drivers
> > 
> > #
> > # IXP4xx SoC drivers
> > #
> > # CONFIG_IXP4XX_QMGR is not set
> > CONFIG_IXP4XX_NPE=y
> > # end of IXP4xx SoC drivers
> > 
> > #
> > # Enable LiteX SoC Builder specific drivers
> > #
> > CONFIG_LITEX=y
> > CONFIG_LITEX_SOC_CONTROLLER=y
> > # end of Enable LiteX SoC Builder specific drivers
> > 
> > #
> > # MediaTek SoC drivers
> > #
> > # CONFIG_MTK_CMDQ is not set
> > # CONFIG_MTK_DEVAPC is not set
> > CONFIG_MTK_INFRACFG=y
> > # CONFIG_MTK_SCPSYS is not set
> > CONFIG_MTK_MMSYS=y
> > # end of MediaTek SoC drivers
> > 
> > #
> > # Qualcomm SoC drivers
> > #
> > CONFIG_QCOM_GENI_SE=y
> > # CONFIG_QCOM_GSBI is not set
> > # CONFIG_QCOM_LLCC is not set
> > # CONFIG_QCOM_RPMH is not set
> > CONFIG_QCOM_SMD_RPM=y
> > CONFIG_QCOM_SPM=y
> > # CONFIG_QCOM_WCNSS_CTRL is not set
> > # CONFIG_QCOM_ICC_BWMON is not set
> > # end of Qualcomm SoC drivers
> > 
> > # CONFIG_SOC_RENESAS is not set
> > CONFIG_ROCKCHIP_GRF=y
> > # CONFIG_SOC_SAMSUNG is not set
> > CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
> > # CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
> > CONFIG_SOC_TI=y
> > CONFIG_UX500_SOC_ID=y
> > 
> > #
> > # Xilinx SoC drivers
> > #
> > # end of Xilinx SoC drivers
> > # end of SOC (System On Chip) specific Drivers
> > 
> > CONFIG_PM_DEVFREQ=y
> > 
> > #
> > # DEVFREQ Governors
> > #
> > CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> > CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> > CONFIG_DEVFREQ_GOV_POWERSAVE=y
> > CONFIG_DEVFREQ_GOV_USERSPACE=y
> > # CONFIG_DEVFREQ_GOV_PASSIVE is not set
> > 
> > #
> > # DEVFREQ Drivers
> > #
> > # CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
> > CONFIG_ARM_IMX_BUS_DEVFREQ=y
> > # CONFIG_ARM_MEDIATEK_CCI_DEVFREQ is not set
> > CONFIG_PM_DEVFREQ_EVENT=y
> > # CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
> > # CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU is not set
> > # CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI is not set
> > CONFIG_EXTCON=y
> > 
> > #
> > # Extcon Device Drivers
> > #
> > CONFIG_EXTCON_FSA9480=y
> > CONFIG_EXTCON_GPIO=y
> > # CONFIG_EXTCON_MAX14577 is not set
> > CONFIG_EXTCON_MAX3355=y
> > # CONFIG_EXTCON_MAX77693 is not set
> > CONFIG_EXTCON_MAX77843=y
> > CONFIG_EXTCON_MAX8997=y
> > CONFIG_EXTCON_PTN5150=y
> > CONFIG_EXTCON_QCOM_SPMI_MISC=y
> > CONFIG_EXTCON_RT8973A=y
> > CONFIG_EXTCON_SM5502=y
> > # CONFIG_EXTCON_USB_GPIO is not set
> > # CONFIG_EXTCON_USBC_TUSB320 is not set
> > CONFIG_MEMORY=y
> > CONFIG_DDR=y
> > CONFIG_BRCMSTB_DPFE=y
> > CONFIG_BT1_L2_CTL=y
> > # CONFIG_TI_EMIF is not set
> > CONFIG_FSL_CORENET_CF=y
> > # CONFIG_FSL_IFC is not set
> > CONFIG_MTK_SMI=y
> > # CONFIG_DA8XX_DDRCTL is not set
> > # CONFIG_RENESAS_RPCIF is not set
> > CONFIG_STM32_FMC2_EBI=y
> > CONFIG_SAMSUNG_MC=y
> > CONFIG_EXYNOS5422_DMC=y
> > CONFIG_EXYNOS_SROM=y
> > # CONFIG_IIO is not set
> > CONFIG_NTB=y
> > # CONFIG_NTB_MSI is not set
> > # CONFIG_NTB_IDT is not set
> > CONFIG_NTB_SWITCHTEC=y
> > CONFIG_NTB_PINGPONG=y
> > CONFIG_NTB_TOOL=y
> > CONFIG_NTB_PERF=y
> > CONFIG_NTB_TRANSPORT=y
> > CONFIG_PWM=y
> > CONFIG_PWM_SYSFS=y
> > CONFIG_PWM_DEBUG=y
> > CONFIG_PWM_BCM2835=y
> > CONFIG_PWM_BERLIN=y
> > CONFIG_PWM_BRCMSTB=y
> > # CONFIG_PWM_CLK is not set
> > # CONFIG_PWM_CLPS711X is not set
> > # CONFIG_PWM_DWC is not set
> > CONFIG_PWM_EP93XX=y
> > CONFIG_PWM_HIBVT=y
> > # CONFIG_PWM_IMX1 is not set
> > CONFIG_PWM_IMX27=y
> > CONFIG_PWM_INTEL_LGM=y
> > CONFIG_PWM_IQS620A=y
> > CONFIG_PWM_LP3943=y
> > # CONFIG_PWM_LPC18XX_SCT is not set
> > CONFIG_PWM_LPC32XX=y
> > CONFIG_PWM_LPSS=y
> > CONFIG_PWM_LPSS_PCI=y
> > CONFIG_PWM_LPSS_PLATFORM=y
> > # CONFIG_PWM_MTK_DISP is not set
> > # CONFIG_PWM_MEDIATEK is not set
> > CONFIG_PWM_NTXEC=y
> > # CONFIG_PWM_PCA9685 is not set
> > CONFIG_PWM_PXA=y
> > CONFIG_PWM_RASPBERRYPI_POE=y
> > # CONFIG_PWM_RCAR is not set
> > CONFIG_PWM_RENESAS_TPU=y
> > CONFIG_PWM_ROCKCHIP=y
> > CONFIG_PWM_SAMSUNG=y
> > # CONFIG_PWM_SL28CPLD is not set
> > CONFIG_PWM_SPRD=y
> > # CONFIG_PWM_STM32 is not set
> > CONFIG_PWM_STM32_LP=y
> > CONFIG_PWM_TEGRA=y
> > CONFIG_PWM_TIECAP=y
> > CONFIG_PWM_TIEHRPWM=y
> > # CONFIG_PWM_TWL is not set
> > # CONFIG_PWM_TWL_LED is not set
> > CONFIG_PWM_VISCONTI=y
> > CONFIG_PWM_VT8500=y
> > 
> > #
> > # IRQ chip support
> > #
> > # CONFIG_AL_FIC is not set
> > CONFIG_MADERA_IRQ=y
> > CONFIG_RENESAS_INTC_IRQPIN=y
> > # CONFIG_RENESAS_IRQC is not set
> > # CONFIG_RENESAS_RZA1_IRQC is not set
> > # CONFIG_RENESAS_RZG2L_IRQC is not set
> > CONFIG_SL28CPLD_INTC=y
> > CONFIG_TS4800_IRQ=y
> > CONFIG_INGENIC_TCU_IRQ=y
> > # CONFIG_IRQ_UNIPHIER_AIDET is not set
> > CONFIG_MESON_IRQ_GPIO=y
> > # CONFIG_IMX_IRQSTEER is not set
> > CONFIG_IMX_INTMUX=y
> > # CONFIG_EXYNOS_IRQ_COMBINER is not set
> > # CONFIG_MST_IRQ is not set
> > CONFIG_MCHP_EIC=y
> > # CONFIG_SUNPLUS_SP7021_INTC is not set
> > # end of IRQ chip support
> > 
> > # CONFIG_IPACK_BUS is not set
> > # CONFIG_RESET_CONTROLLER is not set
> > 
> > #
> > # PHY Subsystem
> > #
> > CONFIG_GENERIC_PHY=y
> > CONFIG_GENERIC_PHY_MIPI_DPHY=y
> > # CONFIG_PHY_PISTACHIO_USB is not set
> > CONFIG_PHY_CAN_TRANSCEIVER=y
> > 
> > #
> > # PHY drivers for Broadcom platforms
> > #
> > # CONFIG_PHY_BCM63XX_USBH is not set
> > CONFIG_BCM_KONA_USB2_PHY=y
> > # end of PHY drivers for Broadcom platforms
> > 
> > CONFIG_PHY_HI6220_USB=y
> > CONFIG_PHY_HI3660_USB=y
> > CONFIG_PHY_HI3670_USB=y
> > CONFIG_PHY_HI3670_PCIE=y
> > CONFIG_PHY_HISTB_COMBPHY=y
> > # CONFIG_PHY_HISI_INNO_USB2 is not set
> > # CONFIG_PHY_PXA_28NM_HSIC is not set
> > CONFIG_PHY_PXA_28NM_USB2=y
> > CONFIG_PHY_PXA_USB=y
> > # CONFIG_PHY_MMP3_USB is not set
> > CONFIG_PHY_MMP3_HSIC=y
> > CONFIG_PHY_MT7621_PCI=y
> > # CONFIG_PHY_RALINK_USB is not set
> > # CONFIG_PHY_RCAR_GEN3_USB3 is not set
> > CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
> > CONFIG_PHY_ROCKCHIP_PCIE=y
> > CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
> > CONFIG_PHY_SAMSUNG_USB2=y
> > CONFIG_PHY_S5PV210_USB2=y
> > CONFIG_PHY_ST_SPEAR1310_MIPHY=y
> > CONFIG_PHY_ST_SPEAR1340_MIPHY=y
> > CONFIG_PHY_TEGRA194_P2U=y
> > # CONFIG_PHY_DA8XX_USB is not set
> > CONFIG_OMAP_CONTROL_PHY=y
> > CONFIG_TI_PIPE3=y
> > CONFIG_PHY_INTEL_KEEMBAY_EMMC=y
> > CONFIG_PHY_INTEL_KEEMBAY_USB=y
> > CONFIG_PHY_INTEL_LGM_EMMC=y
> > CONFIG_PHY_XILINX_ZYNQMP=y
> > # end of PHY Subsystem
> > 
> > # CONFIG_POWERCAP is not set
> > CONFIG_MCB=y
> > CONFIG_MCB_PCI=y
> > CONFIG_MCB_LPC=y
> > 
> > #
> > # Performance monitor support
> > #
> > CONFIG_ARM_CCN=y
> > # CONFIG_ARM_CMN is not set
> > CONFIG_ARM_SMMU_V3_PMU=y
> > # CONFIG_FSL_IMX8_DDR_PMU is not set
> > # CONFIG_XGENE_PMU is not set
> > # CONFIG_ARM_DMC620_PMU is not set
> > CONFIG_MARVELL_CN10K_TAD_PMU=y
> > CONFIG_HNS3_PMU=y
> > CONFIG_MARVELL_CN10K_DDR_PMU=y
> > # end of Performance monitor support
> > 
> > CONFIG_RAS=y
> > CONFIG_USB4=y
> > CONFIG_USB4_DEBUGFS_WRITE=y
> > CONFIG_USB4_KUNIT_TEST=y
> > CONFIG_USB4_DMA_TEST=y
> > 
> > #
> > # Android
> > #
> > CONFIG_ANDROID_BINDER_IPC=y
> > # CONFIG_ANDROID_BINDERFS is not set
> > CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
> > # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
> > # end of Android
> > 
> > # CONFIG_DAX is not set
> > CONFIG_NVMEM=y
> > CONFIG_NVMEM_SYSFS=y
> > CONFIG_NVMEM_IMX_IIM=y
> > # CONFIG_NVMEM_IMX_OCOTP is not set
> > # CONFIG_NVMEM_LPC18XX_EEPROM is not set
> > CONFIG_NVMEM_LPC18XX_OTP=y
> > CONFIG_NVMEM_MXS_OCOTP=y
> > # CONFIG_MTK_EFUSE is not set
> > # CONFIG_MICROCHIP_OTPC is not set
> > # CONFIG_NVMEM_NINTENDO_OTP is not set
> > # CONFIG_QCOM_QFPROM is not set
> > CONFIG_NVMEM_SPMI_SDAM=y
> > # CONFIG_ROCKCHIP_EFUSE is not set
> > # CONFIG_ROCKCHIP_OTP is not set
> > # CONFIG_NVMEM_BCM_OCOTP is not set
> > # CONFIG_NVMEM_STM32_ROMEM is not set
> > # CONFIG_UNIPHIER_EFUSE is not set
> > CONFIG_NVMEM_VF610_OCOTP=y
> > # CONFIG_MESON_MX_EFUSE is not set
> > CONFIG_NVMEM_SNVS_LPGPR=y
> > # CONFIG_SC27XX_EFUSE is not set
> > # CONFIG_SPRD_EFUSE is not set
> > CONFIG_NVMEM_RMEM=y
> > CONFIG_NVMEM_BRCM_NVRAM=y
> > CONFIG_NVMEM_LAYERSCAPE_SFP=y
> > # CONFIG_NVMEM_SUNPLUS_OCOTP is not set
> > CONFIG_NVMEM_APPLE_EFUSES=y
> > 
> > #
> > # HW tracing support
> > #
> > CONFIG_STM=y
> > CONFIG_STM_PROTO_BASIC=y
> > # CONFIG_STM_PROTO_SYS_T is not set
> > CONFIG_STM_DUMMY=y
> > CONFIG_STM_SOURCE_CONSOLE=y
> > CONFIG_STM_SOURCE_HEARTBEAT=y
> > # CONFIG_INTEL_TH is not set
> > # end of HW tracing support
> > 
> > CONFIG_FPGA=y
> > CONFIG_FPGA_MGR_SOCFPGA=y
> > # CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
> > # CONFIG_ALTERA_PR_IP_CORE is not set
> > CONFIG_FPGA_MGR_ALTERA_CVP=y
> > CONFIG_FPGA_MGR_ZYNQ_FPGA=y
> > # CONFIG_FPGA_BRIDGE is not set
> > # CONFIG_FPGA_DFL is not set
> > CONFIG_FPGA_MGR_ZYNQMP_FPGA=y
> > CONFIG_FPGA_MGR_VERSAL_FPGA=y
> > CONFIG_TEE=y
> > CONFIG_MULTIPLEXER=y
> > 
> > #
> > # Multiplexer drivers
> > #
> > # CONFIG_MUX_ADG792A is not set
> > CONFIG_MUX_GPIO=y
> > # CONFIG_MUX_MMIO is not set
> > # end of Multiplexer drivers
> > 
> > CONFIG_PM_OPP=y
> > # CONFIG_SIOX is not set
> > # CONFIG_SLIMBUS is not set
> > # CONFIG_INTERCONNECT is not set
> > CONFIG_COUNTER=y
> > CONFIG_104_QUAD_8=y
> > # CONFIG_INTERRUPT_CNT is not set
> > # CONFIG_STM32_TIMER_CNT is not set
> > # CONFIG_STM32_LPTIMER_CNT is not set
> > CONFIG_TI_EQEP=y
> > CONFIG_INTEL_QEP=y
> > CONFIG_MOST=y
> > # CONFIG_MOST_CDEV is not set
> > # CONFIG_MOST_SND is not set
> > # CONFIG_PECI is not set
> > CONFIG_HTE=y
> > # end of Device Drivers
> > 
> > #
> > # File systems
> > #
> > # CONFIG_VALIDATE_FS_PARSER is not set
> > CONFIG_FS_IOMAP=y
> > # CONFIG_EXT2_FS is not set
> > CONFIG_EXT3_FS=y
> > CONFIG_EXT3_FS_POSIX_ACL=y
> > # CONFIG_EXT3_FS_SECURITY is not set
> > CONFIG_EXT4_FS=y
> > CONFIG_EXT4_USE_FOR_EXT2=y
> > CONFIG_EXT4_FS_POSIX_ACL=y
> > # CONFIG_EXT4_FS_SECURITY is not set
> > # CONFIG_EXT4_DEBUG is not set
> > CONFIG_EXT4_KUNIT_TESTS=y
> > CONFIG_JBD2=y
> > CONFIG_JBD2_DEBUG=y
> > CONFIG_FS_MBCACHE=y
> > CONFIG_REISERFS_FS=y
> > CONFIG_REISERFS_CHECK=y
> > # CONFIG_REISERFS_FS_XATTR is not set
> > CONFIG_JFS_FS=y
> > CONFIG_JFS_POSIX_ACL=y
> > # CONFIG_JFS_SECURITY is not set
> > CONFIG_JFS_DEBUG=y
> > CONFIG_JFS_STATISTICS=y
> > CONFIG_XFS_FS=y
> > CONFIG_XFS_SUPPORT_V4=y
> > # CONFIG_XFS_QUOTA is not set
> > # CONFIG_XFS_POSIX_ACL is not set
> > CONFIG_XFS_RT=y
> > # CONFIG_XFS_ONLINE_SCRUB is not set
> > CONFIG_XFS_DEBUG=y
> > CONFIG_XFS_ASSERT_FATAL=y
> > CONFIG_GFS2_FS=y
> > CONFIG_BTRFS_FS=y
> > CONFIG_BTRFS_FS_POSIX_ACL=y
> > # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> > CONFIG_BTRFS_FS_RUN_SANITY_TESTS=y
> > # CONFIG_BTRFS_DEBUG is not set
> > # CONFIG_BTRFS_ASSERT is not set
> > # CONFIG_BTRFS_FS_REF_VERIFY is not set
> > CONFIG_NILFS2_FS=y
> > CONFIG_F2FS_FS=y
> > CONFIG_F2FS_STAT_FS=y
> > # CONFIG_F2FS_FS_XATTR is not set
> > # CONFIG_F2FS_CHECK_FS is not set
> > # CONFIG_F2FS_FAULT_INJECTION is not set
> > CONFIG_F2FS_FS_COMPRESSION=y
> > # CONFIG_F2FS_FS_LZO is not set
> > # CONFIG_F2FS_FS_LZ4 is not set
> > CONFIG_F2FS_FS_ZSTD=y
> > # CONFIG_F2FS_IOSTAT is not set
> > CONFIG_FS_POSIX_ACL=y
> > CONFIG_EXPORTFS=y
> > # CONFIG_EXPORTFS_BLOCK_OPS is not set
> > # CONFIG_FILE_LOCKING is not set
> > # CONFIG_FS_ENCRYPTION is not set
> > # CONFIG_FS_VERITY is not set
> > CONFIG_FSNOTIFY=y
> > CONFIG_DNOTIFY=y
> > CONFIG_INOTIFY_USER=y
> > CONFIG_FANOTIFY=y
> > CONFIG_QUOTA=y
> > # CONFIG_PRINT_QUOTA_WARNING is not set
> > CONFIG_QUOTA_DEBUG=y
> > CONFIG_QUOTA_TREE=y
> > # CONFIG_QFMT_V1 is not set
> > CONFIG_QFMT_V2=y
> > CONFIG_QUOTACTL=y
> > # CONFIG_AUTOFS4_FS is not set
> > CONFIG_AUTOFS_FS=y
> > CONFIG_FUSE_FS=y
> > CONFIG_CUSE=y
> > CONFIG_VIRTIO_FS=y
> > CONFIG_OVERLAY_FS=y
> > CONFIG_OVERLAY_FS_REDIRECT_DIR=y
> > CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
> > CONFIG_OVERLAY_FS_INDEX=y
> > CONFIG_OVERLAY_FS_XINO_AUTO=y
> > CONFIG_OVERLAY_FS_METACOPY=y
> > 
> > #
> > # Caches
> > #
> > # CONFIG_FSCACHE is not set
> > # end of Caches
> > 
> > #
> > # CD-ROM/DVD Filesystems
> > #
> > # CONFIG_ISO9660_FS is not set
> > CONFIG_UDF_FS=y
> > # end of CD-ROM/DVD Filesystems
> > 
> > #
> > # DOS/FAT/EXFAT/NT Filesystems
> > #
> > CONFIG_FAT_FS=y
> > # CONFIG_MSDOS_FS is not set
> > CONFIG_VFAT_FS=y
> > CONFIG_FAT_DEFAULT_CODEPAGE=437
> > CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
> > CONFIG_FAT_DEFAULT_UTF8=y
> > CONFIG_FAT_KUNIT_TEST=y
> > CONFIG_EXFAT_FS=y
> > CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
> > CONFIG_NTFS_FS=y
> > CONFIG_NTFS_DEBUG=y
> > CONFIG_NTFS_RW=y
> > CONFIG_NTFS3_FS=y
> > CONFIG_NTFS3_64BIT_CLUSTER=y
> > CONFIG_NTFS3_LZX_XPRESS=y
> > # CONFIG_NTFS3_FS_POSIX_ACL is not set
> > # end of DOS/FAT/EXFAT/NT Filesystems
> > 
> > #
> > # Pseudo filesystems
> > #
> > # CONFIG_PROC_FS is not set
> > # CONFIG_PROC_CHILDREN is not set
> > CONFIG_KERNFS=y
> > CONFIG_SYSFS=y
> > CONFIG_TMPFS=y
> > CONFIG_TMPFS_POSIX_ACL=y
> > CONFIG_TMPFS_XATTR=y
> > # CONFIG_TMPFS_INODE64 is not set
> > CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
> > # CONFIG_HUGETLBFS is not set
> > CONFIG_MEMFD_CREATE=y
> > CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
> > CONFIG_CONFIGFS_FS=y
> > # end of Pseudo filesystems
> > 
> > CONFIG_MISC_FILESYSTEMS=y
> > # CONFIG_ORANGEFS_FS is not set
> > # CONFIG_ADFS_FS is not set
> > CONFIG_AFFS_FS=y
> > CONFIG_ECRYPT_FS=y
> > CONFIG_ECRYPT_FS_MESSAGING=y
> > CONFIG_HFS_FS=y
> > # CONFIG_HFSPLUS_FS is not set
> > CONFIG_BEFS_FS=y
> > CONFIG_BEFS_DEBUG=y
> > # CONFIG_BFS_FS is not set
> > CONFIG_EFS_FS=y
> > CONFIG_CRAMFS=y
> > CONFIG_CRAMFS_BLOCKDEV=y
> > # CONFIG_SQUASHFS is not set
> > # CONFIG_VXFS_FS is not set
> > CONFIG_MINIX_FS=y
> > CONFIG_MINIX_FS_NATIVE_ENDIAN=y
> > CONFIG_OMFS_FS=y
> > # CONFIG_HPFS_FS is not set
> > CONFIG_QNX4FS_FS=y
> > # CONFIG_QNX6FS_FS is not set
> > CONFIG_ROMFS_FS=y
> > CONFIG_ROMFS_BACKED_BY_BLOCK=y
> > CONFIG_ROMFS_ON_BLOCK=y
> > CONFIG_PSTORE=y
> > CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
> > CONFIG_PSTORE_DEFLATE_COMPRESS=y
> > # CONFIG_PSTORE_LZO_COMPRESS is not set
> > CONFIG_PSTORE_LZ4_COMPRESS=y
> > CONFIG_PSTORE_LZ4HC_COMPRESS=y
> > CONFIG_PSTORE_842_COMPRESS=y
> > CONFIG_PSTORE_ZSTD_COMPRESS=y
> > CONFIG_PSTORE_COMPRESS=y
> > CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
> > # CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
> > # CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
> > # CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
> > # CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
> > CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
> > # CONFIG_PSTORE_CONSOLE is not set
> > # CONFIG_PSTORE_PMSG is not set
> > # CONFIG_PSTORE_RAM is not set
> > # CONFIG_PSTORE_BLK is not set
> > CONFIG_SYSV_FS=y
> > CONFIG_UFS_FS=y
> > CONFIG_UFS_FS_WRITE=y
> > # CONFIG_UFS_DEBUG is not set
> > CONFIG_EROFS_FS=y
> > CONFIG_EROFS_FS_DEBUG=y
> > # CONFIG_EROFS_FS_XATTR is not set
> > # CONFIG_EROFS_FS_ZIP is not set
> > CONFIG_NLS=y
> > CONFIG_NLS_DEFAULT="iso8859-1"
> > CONFIG_NLS_CODEPAGE_437=y
> > CONFIG_NLS_CODEPAGE_737=y
> > CONFIG_NLS_CODEPAGE_775=y
> > CONFIG_NLS_CODEPAGE_850=y
> > CONFIG_NLS_CODEPAGE_852=y
> > CONFIG_NLS_CODEPAGE_855=y
> > # CONFIG_NLS_CODEPAGE_857 is not set
> > # CONFIG_NLS_CODEPAGE_860 is not set
> > CONFIG_NLS_CODEPAGE_861=y
> > CONFIG_NLS_CODEPAGE_862=y
> > CONFIG_NLS_CODEPAGE_863=y
> > CONFIG_NLS_CODEPAGE_864=y
> > # CONFIG_NLS_CODEPAGE_865 is not set
> > # CONFIG_NLS_CODEPAGE_866 is not set
> > CONFIG_NLS_CODEPAGE_869=y
> > # CONFIG_NLS_CODEPAGE_936 is not set
> > CONFIG_NLS_CODEPAGE_950=y
> > CONFIG_NLS_CODEPAGE_932=y
> > CONFIG_NLS_CODEPAGE_949=y
> > CONFIG_NLS_CODEPAGE_874=y
> > # CONFIG_NLS_ISO8859_8 is not set
> > CONFIG_NLS_CODEPAGE_1250=y
> > CONFIG_NLS_CODEPAGE_1251=y
> > # CONFIG_NLS_ASCII is not set
> > # CONFIG_NLS_ISO8859_1 is not set
> > # CONFIG_NLS_ISO8859_2 is not set
> > CONFIG_NLS_ISO8859_3=y
> > CONFIG_NLS_ISO8859_4=y
> > CONFIG_NLS_ISO8859_5=y
> > # CONFIG_NLS_ISO8859_6 is not set
> > CONFIG_NLS_ISO8859_7=y
> > # CONFIG_NLS_ISO8859_9 is not set
> > CONFIG_NLS_ISO8859_13=y
> > # CONFIG_NLS_ISO8859_14 is not set
> > CONFIG_NLS_ISO8859_15=y
> > # CONFIG_NLS_KOI8_R is not set
> > CONFIG_NLS_KOI8_U=y
> > # CONFIG_NLS_MAC_ROMAN is not set
> > # CONFIG_NLS_MAC_CELTIC is not set
> > # CONFIG_NLS_MAC_CENTEURO is not set
> > # CONFIG_NLS_MAC_CROATIAN is not set
> > CONFIG_NLS_MAC_CYRILLIC=y
> > CONFIG_NLS_MAC_GAELIC=y
> > CONFIG_NLS_MAC_GREEK=y
> > CONFIG_NLS_MAC_ICELAND=y
> > # CONFIG_NLS_MAC_INUIT is not set
> > CONFIG_NLS_MAC_ROMANIAN=y
> > # CONFIG_NLS_MAC_TURKISH is not set
> > CONFIG_NLS_UTF8=y
> > CONFIG_UNICODE=y
> > # CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
> > # end of File systems
> > 
> > #
> > # Security options
> > #
> > CONFIG_KEYS=y
> > CONFIG_KEYS_REQUEST_CACHE=y
> > # CONFIG_PERSISTENT_KEYRINGS is not set
> > CONFIG_BIG_KEYS=y
> > CONFIG_TRUSTED_KEYS=y
> > CONFIG_TRUSTED_KEYS_TPM=y
> > CONFIG_TRUSTED_KEYS_TEE=y
> > CONFIG_ENCRYPTED_KEYS=y
> > # CONFIG_USER_DECRYPTED_DATA is not set
> > # CONFIG_KEY_DH_OPERATIONS is not set
> > # CONFIG_SECURITY_DMESG_RESTRICT is not set
> > # CONFIG_SECURITYFS is not set
> > CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
> > CONFIG_HARDENED_USERCOPY=y
> > CONFIG_FORTIFY_SOURCE=y
> > # CONFIG_STATIC_USERMODEHELPER is not set
> > # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> > CONFIG_DEFAULT_SECURITY_DAC=y
> > CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
> > 
> > #
> > # Kernel hardening options
> > #
> > 
> > #
> > # Memory initialization
> > #
> > CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
> > CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
> > # CONFIG_INIT_STACK_NONE is not set
> > CONFIG_INIT_STACK_ALL_PATTERN=y
> > # CONFIG_INIT_STACK_ALL_ZERO is not set
> > CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
> > # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> > # end of Memory initialization
> > 
> > CONFIG_CC_HAS_RANDSTRUCT=y
> > # CONFIG_RANDSTRUCT_NONE is not set
> > CONFIG_RANDSTRUCT_FULL=y
> > CONFIG_RANDSTRUCT=y
> > # end of Kernel hardening options
> > # end of Security options
> > 
> > CONFIG_XOR_BLOCKS=y
> > CONFIG_CRYPTO=y
> > 
> > #
> > # Crypto core or helper
> > #
> > CONFIG_CRYPTO_FIPS=y
> > CONFIG_CRYPTO_FIPS_NAME="Linux Kernel Cryptographic API"
> > CONFIG_CRYPTO_FIPS_CUSTOM_VERSION=y
> > CONFIG_CRYPTO_FIPS_VERSION="(none)"
> > CONFIG_CRYPTO_ALGAPI=y
> > CONFIG_CRYPTO_ALGAPI2=y
> > CONFIG_CRYPTO_AEAD=y
> > CONFIG_CRYPTO_AEAD2=y
> > CONFIG_CRYPTO_SKCIPHER=y
> > CONFIG_CRYPTO_SKCIPHER2=y
> > CONFIG_CRYPTO_HASH=y
> > CONFIG_CRYPTO_HASH2=y
> > CONFIG_CRYPTO_RNG=y
> > CONFIG_CRYPTO_RNG2=y
> > CONFIG_CRYPTO_RNG_DEFAULT=y
> > CONFIG_CRYPTO_AKCIPHER2=y
> > CONFIG_CRYPTO_AKCIPHER=y
> > CONFIG_CRYPTO_KPP2=y
> > CONFIG_CRYPTO_KPP=y
> > CONFIG_CRYPTO_ACOMP2=y
> > CONFIG_CRYPTO_MANAGER=y
> > CONFIG_CRYPTO_MANAGER2=y
> > # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> > CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
> > CONFIG_CRYPTO_GF128MUL=y
> > CONFIG_CRYPTO_NULL=y
> > CONFIG_CRYPTO_NULL2=y
> > CONFIG_CRYPTO_PCRYPT=y
> > CONFIG_CRYPTO_CRYPTD=y
> > CONFIG_CRYPTO_AUTHENC=y
> > # CONFIG_CRYPTO_TEST is not set
> > 
> > #
> > # Public-key cryptography
> > #
> > CONFIG_CRYPTO_RSA=y
> > CONFIG_CRYPTO_DH=y
> > CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
> > CONFIG_CRYPTO_ECC=y
> > # CONFIG_CRYPTO_ECDH is not set
> > CONFIG_CRYPTO_ECDSA=y
> > CONFIG_CRYPTO_ECRDSA=y
> > CONFIG_CRYPTO_SM2=y
> > # CONFIG_CRYPTO_CURVE25519 is not set
> > 
> > #
> > # Authenticated Encryption with Associated Data
> > #
> > CONFIG_CRYPTO_CCM=y
> > # CONFIG_CRYPTO_GCM is not set
> > CONFIG_CRYPTO_CHACHA20POLY1305=y
> > CONFIG_CRYPTO_AEGIS128=y
> > # CONFIG_CRYPTO_SEQIV is not set
> > CONFIG_CRYPTO_ECHAINIV=y
> > 
> > #
> > # Block modes
> > #
> > CONFIG_CRYPTO_CBC=y
> > CONFIG_CRYPTO_CFB=y
> > CONFIG_CRYPTO_CTR=y
> > CONFIG_CRYPTO_CTS=y
> > CONFIG_CRYPTO_ECB=y
> > CONFIG_CRYPTO_LRW=y
> > # CONFIG_CRYPTO_OFB is not set
> > CONFIG_CRYPTO_PCBC=y
> > CONFIG_CRYPTO_XTS=y
> > CONFIG_CRYPTO_KEYWRAP=y
> > # CONFIG_CRYPTO_ADIANTUM is not set
> > # CONFIG_CRYPTO_HCTR2 is not set
> > CONFIG_CRYPTO_ESSIV=y
> > 
> > #
> > # Hash modes
> > #
> > CONFIG_CRYPTO_CMAC=y
> > CONFIG_CRYPTO_HMAC=y
> > CONFIG_CRYPTO_XCBC=y
> > CONFIG_CRYPTO_VMAC=y
> > 
> > #
> > # Digest
> > #
> > CONFIG_CRYPTO_CRC32C=y
> > CONFIG_CRYPTO_CRC32=y
> > CONFIG_CRYPTO_CRC32_S390=y
> > CONFIG_CRYPTO_XXHASH=y
> > CONFIG_CRYPTO_BLAKE2B=y
> > CONFIG_CRYPTO_CRCT10DIF=y
> > CONFIG_CRYPTO_CRC64_ROCKSOFT=y
> > CONFIG_CRYPTO_GHASH=y
> > CONFIG_CRYPTO_POLY1305=y
> > # CONFIG_CRYPTO_MD4 is not set
> > CONFIG_CRYPTO_MD5=y
> > CONFIG_CRYPTO_MICHAEL_MIC=y
> > CONFIG_CRYPTO_RMD160=y
> > CONFIG_CRYPTO_SHA1=y
> > # CONFIG_CRYPTO_SHA512_S390 is not set
> > CONFIG_CRYPTO_SHA1_S390=y
> > CONFIG_CRYPTO_SHA256=y
> > CONFIG_CRYPTO_SHA256_S390=y
> > CONFIG_CRYPTO_SHA512=y
> > # CONFIG_CRYPTO_SHA3 is not set
> > CONFIG_CRYPTO_SHA3_256_S390=y
> > CONFIG_CRYPTO_SHA3_512_S390=y
> > CONFIG_CRYPTO_SM3=y
> > CONFIG_CRYPTO_SM3_GENERIC=y
> > CONFIG_CRYPTO_STREEBOG=y
> > # CONFIG_CRYPTO_WP512 is not set
> > # CONFIG_CRYPTO_GHASH_S390 is not set
> > 
> > #
> > # Ciphers
> > #
> > CONFIG_CRYPTO_AES=y
> > CONFIG_CRYPTO_AES_TI=y
> > CONFIG_CRYPTO_AES_S390=y
> > CONFIG_CRYPTO_BLOWFISH=y
> > CONFIG_CRYPTO_BLOWFISH_COMMON=y
> > CONFIG_CRYPTO_CAMELLIA=y
> > CONFIG_CRYPTO_CAST_COMMON=y
> > CONFIG_CRYPTO_CAST5=y
> > # CONFIG_CRYPTO_CAST6 is not set
> > CONFIG_CRYPTO_DES=y
> > CONFIG_CRYPTO_DES_S390=y
> > CONFIG_CRYPTO_FCRYPT=y
> > CONFIG_CRYPTO_CHACHA20=y
> > CONFIG_CRYPTO_CHACHA_S390=y
> > CONFIG_CRYPTO_ARIA=y
> > CONFIG_CRYPTO_SERPENT=y
> > # CONFIG_CRYPTO_SM4_GENERIC is not set
> > CONFIG_CRYPTO_TWOFISH=y
> > CONFIG_CRYPTO_TWOFISH_COMMON=y
> > 
> > #
> > # Compression
> > #
> > CONFIG_CRYPTO_DEFLATE=y
> > CONFIG_CRYPTO_LZO=y
> > CONFIG_CRYPTO_842=y
> > CONFIG_CRYPTO_LZ4=y
> > CONFIG_CRYPTO_LZ4HC=y
> > CONFIG_CRYPTO_ZSTD=y
> > 
> > #
> > # Random Number Generation
> > #
> > CONFIG_CRYPTO_ANSI_CPRNG=y
> > CONFIG_CRYPTO_DRBG_MENU=y
> > CONFIG_CRYPTO_DRBG_HMAC=y
> > CONFIG_CRYPTO_DRBG_HASH=y
> > CONFIG_CRYPTO_DRBG_CTR=y
> > CONFIG_CRYPTO_DRBG=y
> > CONFIG_CRYPTO_JITTERENTROPY=y
> > CONFIG_CRYPTO_HASH_INFO=y
> > # CONFIG_CRYPTO_HW is not set
> > # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> > 
> > #
> > # Certificates for signature checking
> > #
> > CONFIG_SYSTEM_BLACKLIST_KEYRING=y
> > CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
> > # end of Certificates for signature checking
> > 
> > #
> > # Library routines
> > #
> > CONFIG_RAID6_PQ=y
> > # CONFIG_RAID6_PQ_BENCHMARK is not set
> > CONFIG_LINEAR_RANGES=y
> > # CONFIG_PACKING is not set
> > CONFIG_BITREVERSE=y
> > CONFIG_GENERIC_STRNCPY_FROM_USER=y
> > CONFIG_GENERIC_STRNLEN_USER=y
> > CONFIG_GENERIC_NET_UTILS=y
> > CONFIG_CORDIC=y
> > CONFIG_PRIME_NUMBERS=y
> > CONFIG_RATIONAL=y
> > CONFIG_STMP_DEVICE=y
> > CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
> > 
> > #
> > # Crypto library routines
> > #
> > CONFIG_CRYPTO_LIB_AES=y
> > CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
> > CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
> > CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
> > CONFIG_CRYPTO_LIB_CHACHA=y
> > CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
> > CONFIG_CRYPTO_LIB_CURVE25519=y
> > CONFIG_CRYPTO_LIB_DES=y
> > CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
> > CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
> > CONFIG_CRYPTO_LIB_POLY1305=y
> > CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
> > CONFIG_CRYPTO_LIB_SHA1=y
> > CONFIG_CRYPTO_LIB_SHA256=y
> > # end of Crypto library routines
> > 
> > CONFIG_LIB_MEMNEQ=y
> > CONFIG_CRC_CCITT=y
> > CONFIG_CRC16=y
> > CONFIG_CRC_T10DIF=y
> > CONFIG_CRC64_ROCKSOFT=y
> > CONFIG_CRC_ITU_T=y
> > CONFIG_CRC32=y
> > CONFIG_CRC32_SELFTEST=y
> > # CONFIG_CRC32_SLICEBY8 is not set
> > # CONFIG_CRC32_SLICEBY4 is not set
> > CONFIG_CRC32_SARWATE=y
> > # CONFIG_CRC32_BIT is not set
> > CONFIG_CRC64=y
> > CONFIG_CRC4=y
> > # CONFIG_CRC7 is not set
> > CONFIG_LIBCRC32C=y
> > CONFIG_CRC8=y
> > CONFIG_XXHASH=y
> > # CONFIG_RANDOM32_SELFTEST is not set
> > CONFIG_842_COMPRESS=y
> > CONFIG_842_DECOMPRESS=y
> > CONFIG_ZLIB_INFLATE=y
> > CONFIG_ZLIB_DEFLATE=y
> > # CONFIG_ZLIB_DFLTCC is not set
> > CONFIG_LZO_COMPRESS=y
> > CONFIG_LZO_DECOMPRESS=y
> > CONFIG_LZ4_COMPRESS=y
> > CONFIG_LZ4HC_COMPRESS=y
> > CONFIG_LZ4_DECOMPRESS=y
> > CONFIG_ZSTD_COMPRESS=y
> > CONFIG_ZSTD_DECOMPRESS=y
> > CONFIG_XZ_DEC=y
> > CONFIG_XZ_DEC_X86=y
> > CONFIG_XZ_DEC_POWERPC=y
> > # CONFIG_XZ_DEC_IA64 is not set
> > CONFIG_XZ_DEC_ARM=y
> > CONFIG_XZ_DEC_ARMTHUMB=y
> > CONFIG_XZ_DEC_SPARC=y
> > CONFIG_XZ_DEC_MICROLZMA=y
> > CONFIG_XZ_DEC_BCJ=y
> > CONFIG_XZ_DEC_TEST=y
> > CONFIG_GENERIC_ALLOCATOR=y
> > CONFIG_REED_SOLOMON=y
> > CONFIG_REED_SOLOMON_ENC16=y
> > CONFIG_REED_SOLOMON_DEC16=y
> > CONFIG_INTERVAL_TREE=y
> > CONFIG_XARRAY_MULTI=y
> > CONFIG_ASSOCIATIVE_ARRAY=y
> > CONFIG_HAS_DMA=y
> > CONFIG_DMA_OPS=y
> > CONFIG_NEED_SG_DMA_LENGTH=y
> > CONFIG_NEED_DMA_MAP_STATE=y
> > CONFIG_ARCH_DMA_ADDR_T_64BIT=y
> > CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
> > CONFIG_SWIOTLB=y
> > CONFIG_DMA_CMA=y
> > # CONFIG_DMA_PERNUMA_CMA is not set
> > 
> > #
> > # Default contiguous memory area size:
> > #
> > CONFIG_CMA_SIZE_MBYTES=16
> > CONFIG_CMA_SIZE_SEL_MBYTES=y
> > # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> > # CONFIG_CMA_SIZE_SEL_MIN is not set
> > # CONFIG_CMA_SIZE_SEL_MAX is not set
> > CONFIG_CMA_ALIGNMENT=8
> > CONFIG_DMA_API_DEBUG=y
> > CONFIG_DMA_API_DEBUG_SG=y
> > CONFIG_DMA_MAP_BENCHMARK=y
> > CONFIG_SGL_ALLOC=y
> > CONFIG_IOMMU_HELPER=y
> > CONFIG_GLOB=y
> > CONFIG_GLOB_SELFTEST=y
> > CONFIG_CLZ_TAB=y
> > CONFIG_IRQ_POLL=y
> > CONFIG_MPILIB=y
> > CONFIG_OID_REGISTRY=y
> > CONFIG_HAVE_GENERIC_VDSO=y
> > CONFIG_GENERIC_GETTIMEOFDAY=y
> > CONFIG_GENERIC_VDSO_TIME_NS=y
> > CONFIG_SG_POOL=y
> > CONFIG_MEMREGION=y
> > CONFIG_ARCH_STACKWALK=y
> > CONFIG_STACKDEPOT=y
> > CONFIG_REF_TRACKER=y
> > CONFIG_SBITMAP=y
> > CONFIG_PARMAN=y
> > CONFIG_OBJAGG=y
> > # end of Library routines
> > 
> > CONFIG_ASN1_ENCODER=y
> > CONFIG_POLYNOMIAL=y
> > 
> > #
> > # Kernel hacking
> > #
> > 
> > #
> > # printk and dmesg options
> > #
> > # CONFIG_PRINTK_TIME is not set
> > # CONFIG_PRINTK_CALLER is not set
> > # CONFIG_STACKTRACE_BUILD_ID is not set
> > CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> > CONFIG_CONSOLE_LOGLEVEL_QUIET=4
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> > CONFIG_DYNAMIC_DEBUG=y
> > CONFIG_DYNAMIC_DEBUG_CORE=y
> > # CONFIG_SYMBOLIC_ERRNAME is not set
> > # end of printk and dmesg options
> > 
> > CONFIG_DEBUG_KERNEL=y
> > CONFIG_DEBUG_MISC=y
> > 
> > #
> > # Compile-time checks and compiler options
> > #
> > CONFIG_DEBUG_INFO=y
> > # CONFIG_DEBUG_INFO_NONE is not set
> > # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> > CONFIG_DEBUG_INFO_DWARF4=y
> > # CONFIG_DEBUG_INFO_DWARF5 is not set
> > CONFIG_DEBUG_INFO_REDUCED=y
> > CONFIG_DEBUG_INFO_SPLIT=y
> > CONFIG_PAHOLE_HAS_SPLIT_BTF=y
> > CONFIG_PAHOLE_HAS_BTF_TAG=y
> > CONFIG_GDB_SCRIPTS=y
> > CONFIG_FRAME_WARN=2048
> > # CONFIG_STRIP_ASM_SYMS is not set
> > # CONFIG_HEADERS_INSTALL is not set
> > CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> > # CONFIG_VMLINUX_MAP is not set
> > CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
> > # end of Compile-time checks and compiler options
> > 
> > #
> > # Generic Kernel Debugging Instruments
> > #
> > CONFIG_MAGIC_SYSRQ=y
> > CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
> > CONFIG_MAGIC_SYSRQ_SERIAL=y
> > CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
> > CONFIG_DEBUG_FS=y
> > CONFIG_DEBUG_FS_ALLOW_ALL=y
> > # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> > # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> > CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
> > # CONFIG_UBSAN is not set
> > CONFIG_HAVE_ARCH_KCSAN=y
> > CONFIG_HAVE_KCSAN_COMPILER=y
> > CONFIG_KCSAN=y
> > CONFIG_CC_HAS_TSAN_COMPOUND_READ_BEFORE_WRITE=y
> > CONFIG_KCSAN_SELFTEST=y
> > CONFIG_KCSAN_EARLY_ENABLE=y
> > CONFIG_KCSAN_NUM_WATCHPOINTS=64
> > CONFIG_KCSAN_UDELAY_TASK=80
> > CONFIG_KCSAN_UDELAY_INTERRUPT=20
> > # CONFIG_KCSAN_DELAY_RANDOMIZE is not set
> > CONFIG_KCSAN_SKIP_WATCH=4000
> > # CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE is not set
> > CONFIG_KCSAN_INTERRUPT_WATCHER=y
> > CONFIG_KCSAN_REPORT_ONCE_IN_MS=3000
> > CONFIG_KCSAN_REPORT_RACE_UNKNOWN_ORIGIN=y
> > # CONFIG_KCSAN_STRICT is not set
> > CONFIG_KCSAN_REPORT_VALUE_CHANGE_ONLY=y
> > CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC=y
> > # CONFIG_KCSAN_IGNORE_ATOMICS is not set
> > # CONFIG_KCSAN_PERMISSIVE is not set
> > # end of Generic Kernel Debugging Instruments
> > 
> > #
> > # Networking Debugging
> > #
> > # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> > # CONFIG_NET_NS_REFCNT_TRACKER is not set
> > # end of Networking Debugging
> > 
> > #
> > # Memory Debugging
> > #
> > CONFIG_PAGE_EXTENSION=y
> > CONFIG_DEBUG_PAGEALLOC=y
> > # CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
> > # CONFIG_DEBUG_SLAB is not set
> > CONFIG_PAGE_OWNER=y
> > # CONFIG_PAGE_POISONING is not set
> > CONFIG_DEBUG_RODATA_TEST=y
> > CONFIG_ARCH_HAS_DEBUG_WX=y
> > CONFIG_DEBUG_WX=y
> > CONFIG_GENERIC_PTDUMP=y
> > CONFIG_PTDUMP_CORE=y
> > # CONFIG_PTDUMP_DEBUGFS is not set
> > # CONFIG_DEBUG_OBJECTS is not set
> > CONFIG_SHRINKER_DEBUG=y
> > CONFIG_HAVE_DEBUG_KMEMLEAK=y
> > CONFIG_DEBUG_KMEMLEAK=y
> > CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
> > CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=y
> > # CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
> > # CONFIG_DEBUG_STACK_USAGE is not set
> > # CONFIG_SCHED_STACK_END_CHECK is not set
> > CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
> > # CONFIG_DEBUG_VM is not set
> > CONFIG_DEBUG_VM_PGTABLE=y
> > CONFIG_DEBUG_MEMORY_INIT=y
> > # CONFIG_DEBUG_PER_CPU_MAPS is not set
> > CONFIG_HAVE_ARCH_KASAN=y
> > CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
> > CONFIG_CC_HAS_KASAN_GENERIC=y
> > CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
> > # CONFIG_KASAN is not set
> > CONFIG_HAVE_ARCH_KFENCE=y
> > # CONFIG_KFENCE is not set
> > # end of Memory Debugging
> > 
> > # CONFIG_DEBUG_SHIRQ is not set
> > 
> > #
> > # Debug Oops, Lockups and Hangs
> > #
> > # CONFIG_PANIC_ON_OOPS is not set
> > CONFIG_PANIC_ON_OOPS_VALUE=0
> > CONFIG_PANIC_TIMEOUT=0
> > # CONFIG_DETECT_HUNG_TASK is not set
> > # CONFIG_WQ_WATCHDOG is not set
> > # end of Debug Oops, Lockups and Hangs
> > 
> > #
> > # Scheduler Debugging
> > #
> > # end of Scheduler Debugging
> > 
> > CONFIG_DEBUG_TIMEKEEPING=y
> > 
> > #
> > # Lock Debugging (spinlocks, mutexes, etc...)
> > #
> > CONFIG_LOCK_DEBUGGING_SUPPORT=y
> > # CONFIG_PROVE_LOCKING is not set
> > # CONFIG_LOCK_STAT is not set
> > # CONFIG_DEBUG_RT_MUTEXES is not set
> > # CONFIG_DEBUG_SPINLOCK is not set
> > # CONFIG_DEBUG_MUTEXES is not set
> > # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> > # CONFIG_DEBUG_RWSEMS is not set
> > # CONFIG_DEBUG_LOCK_ALLOC is not set
> > # CONFIG_DEBUG_ATOMIC_SLEEP is not set
> > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > # CONFIG_LOCK_TORTURE_TEST is not set
> > CONFIG_WW_MUTEX_SELFTEST=y
> > CONFIG_SCF_TORTURE_TEST=y
> > # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> > # end of Lock Debugging (spinlocks, mutexes, etc...)
> > 
> > CONFIG_DEBUG_IRQFLAGS=y
> > CONFIG_STACKTRACE=y
> > CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
> > # CONFIG_DEBUG_KOBJECT is not set
> > 
> > #
> > # Debug kernel data structures
> > #
> > CONFIG_DEBUG_LIST=y
> > CONFIG_DEBUG_PLIST=y
> > # CONFIG_DEBUG_SG is not set
> > CONFIG_DEBUG_NOTIFIERS=y
> > CONFIG_BUG_ON_DATA_CORRUPTION=y
> > # end of Debug kernel data structures
> > 
> > CONFIG_DEBUG_CREDENTIALS=y
> > 
> > #
> > # RCU Debugging
> > #
> > CONFIG_TORTURE_TEST=y
> > # CONFIG_RCU_SCALE_TEST is not set
> > CONFIG_RCU_TORTURE_TEST=y
> > # CONFIG_RCU_REF_SCALE_TEST is not set
> > CONFIG_RCU_CPU_STALL_TIMEOUT=21
> > CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
> > # CONFIG_RCU_TRACE is not set
> > CONFIG_RCU_EQS_DEBUG=y
> > # end of RCU Debugging
> > 
> > # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> > CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
> > CONFIG_HAVE_FUNCTION_TRACER=y
> > CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
> > CONFIG_HAVE_DYNAMIC_FTRACE=y
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
> > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
> > CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> > CONFIG_HAVE_FENTRY=y
> > CONFIG_HAVE_NOP_MCOUNT=y
> > CONFIG_TRACING_SUPPORT=y
> > # CONFIG_FTRACE is not set
> > # CONFIG_SAMPLES is not set
> > CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
> > CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
> > CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
> > CONFIG_STRICT_DEVMEM=y
> > # CONFIG_IO_STRICT_DEVMEM is not set
> > 
> > #
> > # s390 Debugging
> > #
> > CONFIG_EARLY_PRINTK=y
> > CONFIG_DEBUG_ENTRY=y
> > # CONFIG_CIO_INJECT is not set
> > # end of s390 Debugging
> > 
> > #
> > # Kernel Testing and Coverage
> > #
> > CONFIG_KUNIT=y
> > CONFIG_KUNIT_DEBUGFS=y
> > CONFIG_KUNIT_TEST=y
> > CONFIG_KUNIT_EXAMPLE_TEST=y
> > CONFIG_KUNIT_ALL_TESTS=y
> > # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> > CONFIG_FAULT_INJECTION=y
> > # CONFIG_FAILSLAB is not set
> > # CONFIG_FAIL_PAGE_ALLOC is not set
> > CONFIG_FAULT_INJECTION_USERCOPY=y
> > # CONFIG_FAIL_MAKE_REQUEST is not set
> > # CONFIG_FAIL_IO_TIMEOUT is not set
> > # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
> > CONFIG_ARCH_HAS_KCOV=y
> > CONFIG_CC_HAS_SANCOV_TRACE_PC=y
> > CONFIG_KCOV=y
> > # CONFIG_KCOV_ENABLE_COMPARISONS is not set
> > # CONFIG_KCOV_INSTRUMENT_ALL is not set
> > CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
> > CONFIG_RUNTIME_TESTING_MENU=y
> > CONFIG_LKDTM=y
> > CONFIG_CPUMASK_KUNIT_TEST=y
> > CONFIG_TEST_LIST_SORT=y
> > CONFIG_TEST_MIN_HEAP=y
> > CONFIG_TEST_SORT=y
> > # CONFIG_TEST_DIV64 is not set
> > # CONFIG_BACKTRACE_SELF_TEST is not set
> > CONFIG_TEST_REF_TRACKER=y
> > CONFIG_RBTREE_TEST=y
> > CONFIG_REED_SOLOMON_TEST=y
> > CONFIG_INTERVAL_TREE_TEST=y
> > CONFIG_ATOMIC64_SELFTEST=y
> > CONFIG_TEST_HEXDUMP=y
> > CONFIG_STRING_SELFTEST=y
> > CONFIG_TEST_STRING_HELPERS=y
> > CONFIG_TEST_STRSCPY=y
> > CONFIG_TEST_KSTRTOX=y
> > CONFIG_TEST_PRINTF=y
> > # CONFIG_TEST_SCANF is not set
> > # CONFIG_TEST_BITMAP is not set
> > # CONFIG_TEST_UUID is not set
> > # CONFIG_TEST_XARRAY is not set
> > CONFIG_TEST_RHASHTABLE=y
> > CONFIG_TEST_SIPHASH=y
> > # CONFIG_TEST_IDA is not set
> > CONFIG_TEST_PARMAN=y
> > CONFIG_FIND_BIT_BENCHMARK=y
> > CONFIG_TEST_FIRMWARE=y
> > CONFIG_BITFIELD_KUNIT=y
> > CONFIG_HASH_KUNIT_TEST=y
> > CONFIG_RESOURCE_KUNIT_TEST=y
> > CONFIG_SYSCTL_KUNIT_TEST=y
> > CONFIG_LIST_KUNIT_TEST=y
> > # CONFIG_LINEAR_RANGES_TEST is not set
> > CONFIG_CMDLINE_KUNIT_TEST=y
> > CONFIG_BITS_TEST=y
> > CONFIG_RATIONAL_KUNIT_TEST=y
> > CONFIG_MEMCPY_KUNIT_TEST=y
> > CONFIG_OVERFLOW_KUNIT_TEST=y
> > CONFIG_STACKINIT_KUNIT_TEST=y
> > CONFIG_TEST_UDELAY=y
> > CONFIG_TEST_MEMCAT_P=y
> > # CONFIG_TEST_OBJAGG is not set
> > # CONFIG_TEST_MEMINIT is not set
> > CONFIG_TEST_FREE_PAGES=y
> > # end of Kernel Testing and Coverage
> > 
> > CONFIG_WARN_MISSING_DOCUMENTS=y
> > # CONFIG_WARN_ABI_ERRORS is not set
> > # end of Kernel hacking
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
