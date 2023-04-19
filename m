Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A9823A2;
	Wed, 19 Apr 2023 06:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681884573; x=1713420573;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=nlDqBKnYacF6xlZlRvsg2LMN2lEAxATxdxTo13vwkxU=;
  b=DWEJ7/l2D/25rYx3lLhlyAQO87SnGjHW21yFA6oBzaqpkBh+fnC6JP0X
   wS6pjiTdCDCbR3OpmydgUNGU4f8yM7U4+vXACIDu3Y/SEZxLxXYns24QU
   md4CMuv3eGNXutT9BdiQM6k8aiItqqOV6x6nS9fPEHiPtj6ExpPd/aNwA
   nV+i9Oc8I6yFG7izQqxKlOhCS1Q02f7VyOjEzQLouYUPtz8tKeoeFcGMQ
   NN9Kp+FB+eAsYZnYfi6Z6ravIZIxkQRqFAc5YdgvCBwKbmvskZpWsV0l0
   Ewukn/vjpmqKuSTu4d90k2lIZW/4PfMQw91blodfdO6E05XvmnhAP/LDx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="344112406"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="344112406"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 23:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="684866963"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="684866963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 18 Apr 2023 23:09:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 23:09:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 18 Apr 2023 23:09:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 18 Apr 2023 23:09:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 18 Apr 2023 23:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfhjv+hQ3zevKHdcoEMKpfjs+dmRGB1TdiP5zxzaUX7UCYBuDWQbzrmMBwlaow0iwVxN74kJX6HQhrdxOFdfAOXAlIibx5jkJHzk29o05OC7iUQ8vYPrpHpwzJLC1HgZ30P+tR0mlvvaumLSaY9EsI3XgLFdGRPr2czZG6vOWlTVghbSUbdToujUdh/6HbgfH/u1MlT258oi0YdKnl9K0RRemB65rGG888SL05w2/emgabqgtbPieFNcGRlPuIu7CmLWojdqUpbx4eYRYRo5HddVwyJPOfMYDIO5BgqPuSBocQroJnEZpfLnMH8CmWqyAaFhhe1KdokzPSUEb9lhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Il0ewv/hxZa+HX5yHcU09N0l4lBXmTeR6GFBaf4ndrs=;
 b=FI6eH+21IaOpUxkLFjkeNBlGUrZ9+uTIoxr6Bogsxqz5Ai6gjK/1CHc1yXIlmqznR3qD1OT3nHL1PLU5NEbyYeHQRGIY3RdVLdcDyc1nkk7vulapnaGREw+ObQUGc+ZBvNRIdYbutF91sy7RBJVuIZxnzVl2pbRIOSZrwH+h5ejce5fHneWmFplilzY+pVOpWNGnTUMNMj4KIPFVel88Y8FIlGCE9K4dXhyLfKQW1VoBiB/21QHYF1tmRNUfRQVfhZCw/sYYBmdITt2Ocor3D8cUPUZgqiklWdQvgedUUGeP/criY4CBxImxZ5Gjc6hogdPFaDdrkAlhAzpxrga4mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS7PR11MB6272.namprd11.prod.outlook.com (2603:10b6:8:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 06:09:28 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 06:09:28 +0000
Date: Wed, 19 Apr 2023 14:06:22 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Ryan Roberts
	<ryan.roberts@arm.com>
Subject: Re: [linux-next:master 10286/12016] arch/arm64/mm/fixmap.c:199:10:
 warning: variable 'bm_pudp' set but not used
Message-ID: <ZD+E3ulewOplS6tm@yujie-X299>
References: <202304172004.r3IPh5Ja-lkp@intel.com>
 <ZD1OhVZElN1uGRJy@FVFF77S0Q05N>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZD1OhVZElN1uGRJy@FVFF77S0Q05N>
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS7PR11MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aea0f9d-2636-4705-590f-08db409ca1b2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JOAjDxIkcNr8ECPFyaFxjQ7yOPSDmbzq+a+d7pZ1sMsn5oZCb5xlESeXPEP+fpKbZaITHb77rOsDn2SLMbRIZu1KilB+AQEJ86FYvF3fhQLIn2a1q+r61WH9nJlUHlxtrXs6VGDccg+wgDIQabCxyy9ahfGrn+FcEpzMoir+XTKsL166H9oETpvzX48gkHArl6iAzOYWdUrhq51NZocIBaQHnPoVBSdnoWm0IeJGOIbAQBmmsn4Imy8HhtE996trogAiw7NfEYYKXJ65T9TdabKui0NSm44d3biqD/HBBaGj6jTHzF7DRnpGXqPl2CP+c06PZEqubmq+a2s02VVXbxhxR3GEk4Z21i0P4/4lNs11i1E9vYuY3VFtxOJY8RVzkE2JvWQwrmq880oXuUZj8VWVY2eQ9rphBF4LqEELDfUR83finLHmEUGr7O9wA65MwqAoLlTz1DvDxJ+r+xaVQbYJ9y/Kw6IMKzlh/ZQ2IGs6N7jNWkpHJ2TxZvqsBp/RJ9rwUuttmw/q142fndv+v1PpxeS9hOXGrEok122XTO7Xq3JbkSS5U2rjlVg8olbKESDYBd3/ikT5miQMRuYyn05zHsZzCSoVqAe+KPQ3O7FpbE2/oW4aawRFfzxvlH245c/DKMPpjL0k9ZFgUnkNww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(44832011)(966005)(66476007)(66556008)(6666004)(6486002)(2906002)(8936002)(8676002)(5660300002)(478600001)(82960400001)(38100700002)(33716001)(41300700001)(54906003)(66946007)(26005)(186003)(6506007)(6512007)(9686003)(83380400001)(316002)(4326008)(6916009)(86362001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9yK0t8MD0oDadDYgNv0D4kJmq28KyrPCHWmgt24ofD2ipnxbi4WMMQ5FIhQv?=
 =?us-ascii?Q?9Lop9q2seJhpqTHJ5MSm6w5DWwnN34aBGmJxhuwqivLjCiipzBunBCjIcdmu?=
 =?us-ascii?Q?1cw7sw1JVVIlSRNJTPhZeVxylfomHDeZbiF3P5nazxkm7gixI6DnE1sGUWIt?=
 =?us-ascii?Q?z7miQVabjnM4hThTOuQ1+VhPXSKlFmjaNkLMR9Xm1CU+K4hv2uD9YCZDnZkK?=
 =?us-ascii?Q?QsD+YPlV7BUbFE5sUZ6BQ98ZnY/yv+znlvp6AYBJtGRGOyVjP+DMz8Wftirn?=
 =?us-ascii?Q?6VZlYTgJ4/cBKvG8hCRSH/fI8E1r0UWrk+XEK+TBapdfHTGeVdO9IR4Nrqrb?=
 =?us-ascii?Q?88TH0VqMDyKSloiustMWgzgMzEvbANVle4vp3NqzvHRXLdm5xn6KbXdd4gAx?=
 =?us-ascii?Q?ugAr5xwaoMziiKY7zQlDoZGYQDiefM1lhqjR2yEo3ygKC+drNy+7K/tyE0PV?=
 =?us-ascii?Q?T8OUSUFR8R5i869er8unOFYdsdXh+X6Az7ygfnp48HuoauhvhePCB4yfmsuG?=
 =?us-ascii?Q?jRdnk6vK8UzUI0vYGuKW6rHbOXrdH50NOQhmkCZoVhV7NkAaTOJezzLKzl7d?=
 =?us-ascii?Q?rHjmwFbs6RLgcmueRzehgWG69OJQcmSdnNKKXatla8opr7RgVKEafHPxexAq?=
 =?us-ascii?Q?TJD7TWmmgg7ucadCl6uluLDF9GIqIhtsaAQAkP7z4IkYVw3SBNXJuq2Uyja9?=
 =?us-ascii?Q?lArTHWotJ8z1f6CNowZoiR/pg0Vkde3Phg0Uq1mzwFinDlLcwRUDH9PT7ait?=
 =?us-ascii?Q?QBDNHTW7rWXl13WAUQ86WMVZ7hhBKJlps+Oy5fZDfmRb69D1CBMn/y37CqM9?=
 =?us-ascii?Q?ny4hSQw4dZXcKgmN9uGhs1Tm8w7a01XA3lbykfKA/E838+odWcMg2BOFmRKz?=
 =?us-ascii?Q?+coXT8zVLiQg+na10UbikSIaIHNJrzdASF9CmNixcz80STY59MXIHQrBsZ7H?=
 =?us-ascii?Q?qBOFE/ijoQccVULXuYfw7gD2U5hswvjKhj0G60FvUcOz/fZOIt7TDH6HSI/1?=
 =?us-ascii?Q?PlI3F0eiyHTCjGBxp1GFlXKGCo4XQf8nfEBVck/ARcPxLBvGScVnNANdLHVV?=
 =?us-ascii?Q?5+cLc7tHiRwLSKh+nfTPCDNLYo7OWsSUjnaZ8ezEMwJyhZ6Q+TB4L7LTBVNZ?=
 =?us-ascii?Q?qMgAgSp44dBik3V3g8a7unIRl5nJ96E2IJgElthSuTomn/KBhhA3/t7xW819?=
 =?us-ascii?Q?njPY7w4bd+KFveTZI7B78gHdoFjWfj7o611ptiU6E7p4MM0Y3gjkx8TVmTiU?=
 =?us-ascii?Q?yrutvEgDvxOIfnLf1AR2ib75SncqXXjcu8zj8dTQId4nyI4Zr447A/5GE5lf?=
 =?us-ascii?Q?cEzsuF9dK0tuOLtOz4wDJfNIlIFQHYfw68H8GZ6583qeVDuspx3KYHTgIqDS?=
 =?us-ascii?Q?yKDbM918PldCAu8ybQUvlwKIng81P4YXosuj1ebxOCuFC402DKuHesIGUwpP?=
 =?us-ascii?Q?9ZmKOFUR9HDwu2Pmcv+YrJKMWwOl5L2U1MSSFQryPkmJbP4VR432ufXHmwQ3?=
 =?us-ascii?Q?QiCrtE6IXoqz4V58IwmfxfC6dNP6Q0N6B1D0Vze4Hgnj4wolXROvI4Le3mOR?=
 =?us-ascii?Q?5MNfo9qhz3c7mzczKLiB0YWNi5xVtTpf/7vRr4Ta?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aea0f9d-2636-4705-590f-08db409ca1b2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 06:09:28.0215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPDpPJnvD+cIj5Tao5wXLskh7GifzgPfXFCRRtrDGBBsSGm0581+akB7QRcaoZg4vNDK+x4EiODOsLI+kvzczw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6272
X-OriginatorOrg: intel.com

On Mon, Apr 17, 2023 at 02:49:57PM +0100, Mark Rutland wrote:
> On Mon, Apr 17, 2023 at 08:55:17PM +0800, kernel test robot wrote:
> > Hi Mark,
> 
> Hi,
> 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> I took a look, and this warning existed in the prior commit. All that has
> changed is that it has moved from arch/arm64/mm/mmu.c to arch/arm64/mm/init.c.
> 
> This commit is not to blame, and there is no regression here.
> 
> The warning itself is bogus; more details on that below. Please ignore this.

Sorry for this false positive. We've configured the bot to filter out
the reports on this commit.


Best Regards,
Yujie

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   d3f2cd24819158bb70701c3549e586f9df9cee67
> > commit: b97547761b02cc95e0e6be827dc9ca9da8142761 [10286/12016] arm64: mm: move fixmap code to its own file
> > config: arm64-buildonly-randconfig-r004-20230416 (https://download.01.org/0day-ci/archive/20230417/202304172004.r3IPh5Ja-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm64 cross compiling tool for clang build
> >         # apt-get install binutils-aarch64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b97547761b02cc95e0e6be827dc9ca9da8142761
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout b97547761b02cc95e0e6be827dc9ca9da8142761
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202304172004.r3IPh5Ja-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> arch/arm64/mm/fixmap.c:199:10: warning: variable 'bm_pudp' set but not used [-Wunused-but-set-variable]
> >                    pud_t *bm_pudp;
> >                           ^
> >    1 warning generated.
> > 
> > 
> > vim +/bm_pudp +199 arch/arm64/mm/fixmap.c
> > 
> :>    182	
> >    183	/*
> >    184	 * Copy the fixmap region into a new pgdir.
> >    185	 */
> >    186	void __init fixmap_copy(pgd_t *pgdir)
> >    187	{
> >    188		if (!READ_ONCE(pgd_val(*pgd_offset_pgd(pgdir, FIXADDR_TOT_START)))) {
> >    189			/*
> >    190			 * The fixmap falls in a separate pgd to the kernel, and doesn't
> >    191			 * live in the carveout for the swapper_pg_dir. We can simply
> >    192			 * re-use the existing dir for the fixmap.
> >    193			 */
> >    194			set_pgd(pgd_offset_pgd(pgdir, FIXADDR_TOT_START),
> >    195				READ_ONCE(*pgd_offset_k(FIXADDR_TOT_START)));
> >    196		} else if (CONFIG_PGTABLE_LEVELS > 3) {
> >    197			pgd_t *bm_pgdp;
> >    198			p4d_t *bm_p4dp;
> >  > 199			pud_t *bm_pudp;
> 
> The full piece of code in question is:
> 
> |        } else if (CONFIG_PGTABLE_LEVELS > 3) {
> |                pgd_t *bm_pgdp;
> |                p4d_t *bm_p4dp;
> |                pud_t *bm_pudp;
>                         ^ defined
> 
> |                /*
> |                 * The fixmap shares its top level pgd entry with the kernel
> |                 * mapping. This can really only occur when we are running
> |                 * with 16k/4 levels, so we can simply reuse the pud level
> |                 * entry instead.
> |                 */
> |                BUG_ON(!IS_ENABLED(CONFIG_ARM64_16K_PAGES));
> |                bm_pgdp = pgd_offset_pgd(pgdp, FIXADDR_TOT_START);
> |                bm_p4dp = p4d_offset(bm_pgdp, FIXADDR_TOT_START);
> |                bm_pudp = pud_set_fixmap_offset(bm_p4dp, FIXADDR_TOT_START);
>                  ^ set
> 
> |                pud_populate(&init_mm, bm_pudp, lm_alias(bm_pmd));
>                                         ^ used
> 
> |                pud_clear_fixmap();
> |        } else {
> 
> What's happening here is that the config has CONFIG_PGTABLE_LEVELS=2, where the
> above block is unreachable, but the warning is being generated for trivially
> unreachable code.
> 
> With that config, we'll use include/asm-generic/pgtable-nopmd.h, where
> pud_populate() is defined as:
> 
> | #define pud_populate(mm, pmd, pte)          do { } while (0)
> 
> ... and hence it's complaing that the (unreachable) definition and
> initialization of bm_pudp is not used.
> 
> If I reconfigure the kernel with 4K pages and 48-bit VAs so that
> CONFIG_PGTABLE_LEVELS=4, the above warning isn't generated.
> 
> Thanks,
> Mark.
> 
