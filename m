Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27F6443F
	for <llvm@lists.linux.dev>; Tue,  4 Oct 2022 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664926589; x=1696462589;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7xZjRrKmAo1synEExsy4W6JXRShbun+rXXakjpR6KqM=;
  b=TAW+gZ/2PiIWz5DnsOIqWEEaicCzl+mrIVT0Sd+Lp4hwcTpWai0dxf1h
   x87FA+ir6IFf9yx7tHLi7WNabtIGUwrOly/mD41Ix2iQQsSW2dLVPc89+
   SvmJYPOUXzoLj6q5rTgMAAGT1UHPb9uIYMRKHlq+HuHupjJUTMCl0vCnK
   1/v2mmFZv5/kp1h+3dmNBjvMUDZudMA2Xxj6YFCDzg5QwpBLBj7bk78DT
   AnBcz4JfdYQcjtD9CkZwA41f3PZUk10M97b+xG9eddLy6nt/yINnq6I7+
   3mZc+Geh8JepX5DAst4gWpbXEKZ8Ou9CzpWBEKAXJWGv6j7iN2zrIWM3G
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="304035381"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="304035381"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 16:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="713225262"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="713225262"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2022 16:36:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 4 Oct 2022 16:36:10 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 4 Oct 2022 16:36:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 4 Oct 2022 16:36:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 4 Oct 2022 16:36:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqMM8imf0iD4KfF053xQjsjQfUr4CJYpbO51TSLEDbnWB3Jrg8EMflGv+w7jliVPNbUu2erovCKfZRaGtBpl9o94dLA8IWUkIOh0oiHMfQ3AmF2U0RNtI+e5KyWSCpPhZAlZY1h3vSNg94t7c7NtKPBGABXSJg/cG+jGMvxbPAPW9gqdliy9Y8ZywGLRlFKSBVY2q9xFYBzLxA8+iP+imCuftIcEFIT9wFZdw6V9J5I9JaKbP6Np/mnFejvBq0Tq1FqzO1r0/9lyxTZRmmQhCMxh9DDoLDWOMzFmLM8y5OaEs/+IqjPs2LzR6wpk/eki5tvbXUtC5i6B+fZtau+Eig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPQw5srQgOOzClDVz/nYzma6Ub7kUKlWTSmqoi5IzCY=;
 b=kdNclMCJEr7wAuNJG3CYKhsvdZ2gaJZKUVNuzL2WLu1ORmFcy+BC/f/a025srlLwneFM8B5ZXDfgTrM76yfN1S1wzhwLhuqHZSt/awZ3aaoKbSjyyM707QrSx0vLohV5RV5Eo3PqdE964f8oRtrl/E2JSX7+kaL3zAHgIPnY4O+7+ufgB2nvzsrJmCKsfV1tuLD8O89gA+86AntYUvgikViAprJbQKWk1xS9jC5gIXWdA1bjyyJBptvkWWeLdFynEcIrWxgYivhF6R0Kn3CwwNvzLi0K/j9ha4N7UIb1pXfwgLx4uhBfbgCgJ5DNM6TbRsYOSaEb/k6t3PW8uqviSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Tue, 4 Oct
 2022 23:36:01 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::b572:2e32:300b:d14a]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::b572:2e32:300b:d14a%3]) with mapi id 15.20.5654.035; Tue, 4 Oct 2022
 23:36:01 +0000
Date: Tue, 4 Oct 2022 16:35:56 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
CC: kernel test robot <lkp@intel.com>, "Fabio M. De Francesco"
	<fmdefrancesco@gmail.com>, <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>,
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [linux-next:master 5475/12409] s390x-linux-ld:
 kernel/kexec_core.c:822: undefined reference to `__tsan_memcpy'
Message-ID: <YzzDXNTG4pMcke0i@iweiny-mobl>
References: <202210050509.cZtMcazl-lkp@intel.com>
 <Yzy/VbCd0e+K3ptN@iweiny-mobl>
 <CAKwvOdkWLE2ONDbHpSgAbFSwMZUN=KF0yeLjncS2TVVh=Wrk+A@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKwvOdkWLE2ONDbHpSgAbFSwMZUN=KF0yeLjncS2TVVh=Wrk+A@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|PH0PR11MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: 926e9c7a-0927-4a8f-34cf-08daa6613206
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KlEEt+CS4gxHe8P4a36qDqE9X2fFVzR8rubVW1EwfbTC5qGpepcA5jpSFPk/6xHhWSBsJTA/iV9fvCDoc+hm6VwlP9x/iwqY5snXrHH7/6ggj/0arztgSOiEGGZE1bcvUIQQoFqDCLputkveg0IXFdCq0wTtgwXuyvDpEXtx22TiINP/RE7GIH5bf1BbLNb+P85UVGfWs8dODVSodkXH8GbXj9tFmh644wVl+OMhQlWh4lR8f+itgrel1fJtak/8Y0iXMtlUDVjN7Lmtu0ZsosvxLviJdTPJYGvfYRL+C5jdpzMnVNUI0fO3xEHFAAoSBqdgToBHeOkUxv0JC3nYiCQIQl3CmDztNxCBmDCMFF6dYgig4bOqiY5fPF1mu3hwYJTO+98wPfiAAFneJZ3Pifb6Pb05j+p42aa9WVdmJG8/x1aX2pSZDQIK4Ki+FxZcx+F8JxbXsOZplWii1H3fJ+12Dys46SmvRCWkgXeZME2k4dX4QMlv+eKu98kf/5IAJvBxXJII3K/pJOdyOOuEqBnX/oTyvOzXQGnyX+7FVNN65seiEbx8qYNVIjyONN9a/NreVoNupS7OGvok6LCILqpkYBlt7qTMMofQBCue3zTpxGOLMsgikqkJtIX4o4czerZWCw8nkDoy29CW6iHzCKtSfznj9BTvkcpCJ33bco5qWGv7sjaTf2H9XadrkjcEhl+HoJ+VqHr/iLmkel0N4Xu/LcLV18oVbFdP88UaN/nF3mFsVSGY8FeWOCujWNLK8LgqBEvdI5wQyK2g2ch2oA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199015)(6486002)(8676002)(5660300002)(38100700002)(33716001)(186003)(86362001)(6916009)(4326008)(66556008)(316002)(83380400001)(8936002)(41300700001)(66476007)(53546011)(66946007)(9686003)(44832011)(54906003)(2906002)(26005)(6506007)(6512007)(6666004)(966005)(82960400001)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7cY3piCabqyTeeU++H+4ToIlEPLv3QUZO2JDPch07CoO8E10XdYirsqwB4Kk?=
 =?us-ascii?Q?OMQgbt4iDD1xilp8jQSNw5S3cNdYkaKfvcbNFKoRr1dl3i7T6H1UVfe0AcQ/?=
 =?us-ascii?Q?aNbmkZQqvknWdcRy4rIsUWWHyK9n1R+5lf28vMHFwkJET0RiIGsrnhWqTYBf?=
 =?us-ascii?Q?T/EIYl0SoqFF+Tg29b7cafpBmG/weVSRtAF0qtxqc1q0rLHV+wt4MFnimutb?=
 =?us-ascii?Q?US/Yg5CpBEW0KQ2ULmm3K5gSuSzAXGV/rqQCiqObKaBGIvTeL7kYu7gjfxJa?=
 =?us-ascii?Q?0Agu22hjQmG7pze+ftA+DCRbONunUM8suJB8PxJcm27MOOPBhqoo1By0gwAX?=
 =?us-ascii?Q?b2c75+2bZI5GWzAMupemluFo+4Bi6TU89xRsZsvw+QWj2r4wekEXvwKUD7dc?=
 =?us-ascii?Q?dVR6GgBEZ5yjRox1AUpv7MdTEVAemgh//k/BjWd/I/tis6hWT6X/u6kw2Aad?=
 =?us-ascii?Q?GwmzWwjG3C1zjNL3mV6j4hGxnzaPRBflEmK05h00lAd0PGnPs0V8LkWN96JI?=
 =?us-ascii?Q?xeoPNSWX7EkgS/NBZDhWHIR4Fyz2x+G+J5sysvThz+p7uPQ+JC1ct6hpCdld?=
 =?us-ascii?Q?4pz2CA56V77yC9AXo+V2DRb72hFNxqEAYIu7tv6sxHemUepgzwDHvXtJ+Hs3?=
 =?us-ascii?Q?mKZXjkls1qDiL2kXZBGeCIjJhuFfLEKjHoTaIS17Gze+KWnFMl3hNuLc9n0B?=
 =?us-ascii?Q?jQrsOQLn8XlhtmevlZ5Rd+MFdmegHsUdcK2P4B9L6kEY9tMGQIvGnGekdHVd?=
 =?us-ascii?Q?Atizod/ENvix4wcGAfhDNr0ty9y3+29atfrU3FfGaX04DA+4SvPlgtCXizgy?=
 =?us-ascii?Q?8wj2/vonbk/zxeb85oNAUsYNkLMtitvN3X6vGAF8QH5G25WzcS8NozSlnsLT?=
 =?us-ascii?Q?dtHag7K1jUQATKEELvs0BMFpP5NOGN5AIDyQXmkDNFfpLeNhQ+dDP8lspzK0?=
 =?us-ascii?Q?9XHjqfjh4evI/COYV7R4cjwOJ1x5qzF5VJ7RrQNw+U9J0r9teB1VPStpzrun?=
 =?us-ascii?Q?+B3ldavaRaF2tqHpaFfoMA5nGtuqU4h6RI4SQUaEn2aJPld+fi1RO6015xJb?=
 =?us-ascii?Q?ipDSOEfnGrUxMepcaioXnlhRlfhjMEwO45BEVNuoATTkNto0Qi8my5RVL7YV?=
 =?us-ascii?Q?+P52C3LYYYJpiZUph4SPtaqfXkXA5fal9PxGn0nMwpmPRro2MLeX7QPcRXmy?=
 =?us-ascii?Q?78E10BaBEF0dYWyEttOsRevKtbODkLc0tPk3pTuErZTIB0veGiLxnAbq/kuo?=
 =?us-ascii?Q?nhY5+1gNHM6zbr+7tjgcMrrQe2bbWCk9OJ8t5xIynyP3vFs4JtmJgasXtj0H?=
 =?us-ascii?Q?hpBfyCnm7080jQS4bMVeYxsMOFMGbUmFQl7owXg9gW7SoKgli64/Zfi2fLVy?=
 =?us-ascii?Q?4yLMan/qLP8kG1aukuRfxR7/Is+LzKP5susaY3Da2zsqJbiG/IL3JWpeZkZ7?=
 =?us-ascii?Q?cP1WM3s9rMzUyX2w9B2xPGGYWv7bua435cu3v5RxT0IXKt7Uw1FA3TKEolo0?=
 =?us-ascii?Q?HWg/1/3FeKiSD6Bz143JK0fQEYGqw9EFL9EKfs8j9n7oUypTok0kl+SKSFtG?=
 =?us-ascii?Q?dw479FeaKFgSkn4Q2/8tdxX49YgYf40MgpTLdMPO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 926e9c7a-0927-4a8f-34cf-08daa6613206
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 23:36:00.9215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlwdFFvemgZ1AHpDBNoZBbPGYDO4/Dejk71oNvVitDfqpmLrHHVFoGIqvWPPt5ZlMC5JYDUifnab7DHhpidHgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
X-OriginatorOrg: intel.com

On Tue, Oct 04, 2022 at 04:24:54PM -0700, Nick Desaulniers wrote:
> Sorry for the noise, please see:
> https://lore.kernel.org/all/Yx3HnuEDyFG0+G62@dev-arch.thelio-3990X/

NP and thanks for letting us know!
Ira

> EOM
> 
> On Tue, Oct 4, 2022 at 4:18 PM Ira Weiny <ira.weiny@intel.com> wrote:
> >
> > On Wed, Oct 05, 2022 at 05:05:12AM +0800, kernel test robot wrote:
> > > Hi Fabio,
> > >
> > > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> >
> > I don't think this is relevant.
> >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   4d80748d16c82a9c2c4ea5feea96e476de3cd876
> > > commit: 948084f0f6959f602f89f679522b706a72da0285 [5475/12409] kexec: replace kmap() with kmap_local_page()
> > > config: s390-randconfig-r035-20221003
> > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install s390 cross compiling tool for clang build
> > >         # apt-get install binutils-s390x-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=948084f0f6959f602f89f679522b706a72da0285
> > >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >         git fetch --no-tags linux-next master
> > >         git checkout 948084f0f6959f602f89f679522b706a72da0285
> > >         # save the config file
> > >         mkdir build_dir && cp config build_dir/.config
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> > >
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > Note: the linux-next/master HEAD 4d80748d16c82a9c2c4ea5feea96e476de3cd876 builds fine.
> > >       It may have been fixed somewhere.
> > >
> > > All errors (new ones prefixed by >>):
> > >
> >
> > [snip]
> >
> > >    s390x-linux-ld: kernel/kexec_core.o: in function `kimage_load_normal_segment':
> > >    kernel/kexec_core.c:814: undefined reference to `__tsan_memset'
> > > >> s390x-linux-ld: kernel/kexec_core.c:822: undefined reference to `__tsan_memcpy'
> > >    s390x-linux-ld: kernel/kexec_core.o: in function `_copy_from_user':
> >
> > I don't see __tsan_memcpy anywhere in the current linux-next tree?
> >
> > Ira
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
