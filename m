Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1795136B
	for <llvm@lists.linux.dev>; Wed,  5 Oct 2022 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664970309; x=1696506309;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=OtF4Qd4W7NhvVWJgHPoUydLPQi3ffQ7OzEjC4Vk/SDA=;
  b=lh0891Km2udwazs76yq0DgA6gElaF4sYv402NNBwVRiEtqkNsL+qVYSE
   To8eEO4BRP6QCPTfzhEekYIzsde4V0xVkr4rZbzXqhuRIrxXWmLFCo4fo
   hWud8swpD7TvvEANPAtLlONYT9ePquqPjRim6GCyFBg+b0MRztezhHX1V
   /AiGFel/dBxrAkkuFw5L338ZGnTo1odFZBRTeFSAFvpL682SMPemaVSLx
   uWGP1Nf6zWDVtBvsGiVyMSd66/XzPmmXdDtCHhkYRonsH9twXM1PqfI3C
   ZQFnFfcWe7Du55jnfj54q1j6fNXykPeP8LRbWi7Z6QQqSlaLYDwrZIs3U
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="303115520"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="303115520"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 04:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="869373294"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="869373294"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 05 Oct 2022 04:45:08 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 5 Oct 2022 04:45:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 5 Oct 2022 04:45:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 5 Oct 2022 04:45:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLQHIv41kR42Ltdi9G7z9GsmoUO16q7DI2ri9KJRZy+0STZAol58KRywZXkfJjK5wbdet367apX/PbWU9P4WTe1PIypXWS6w9tlPuSHB+Og+O0kqL+XT+FgzlUp2yiYimZVg72Vea9+CGff1JYsA00lzirspumvhJGi0Lxn/1hy6ngoc0vfNTDtplp5GfqZIhyknDYBe7GR7LjUvvmvNRjiU1xEmhQa4aOJ63cg7OOF8uOcvvlTU74yuqhUWOj+3zLu8W+stpD2bKu1B+rH+/F6wAPQySf0knX3FM97EmHHvVlwaMzeW+n0RLzHZwKwDuPj4Iwrpd+A38518QP0xbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cwqk8VoJM94Mq3/Ll6LNiwNWoTW5g6ik2GxwpoczERw=;
 b=m+LhksP8ki9J2E6SM2m8bIL5nU/W/6OT4gM/LY81FV8YEf7kA4Lua5XgA+svXD8PeGLj5+tn138fuBxkUIrmx6TZMnqtXiUCBM/3A70z3F1a6Ya/WrFkAiE3DzaFQ1YIhBPDcKLNgYvM1lRlxKBDMgSxnJIB6Uk1tyYXcBnbyUN02SEUi7UO4nZgsnaDk38A3O9d3kYDE7AyyxdC3SqbnJT431k4wvQXBNnEF9aTM/3fOZUmeEaej+If9gqZiXZp60JKwF54CKbK4UH2g7RuhwD8KmdqKqTw37vM0smFB6SExQ9L3Dt9590W4KwyMoNRuE9aRzXCndv/W01tiV3WQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Wed, 5 Oct
 2022 11:45:05 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be%4]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 11:45:04 +0000
Date: Wed, 5 Oct 2022 19:44:54 +0800
From: Philip Li <philip.li@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
CC: Nick Desaulniers <ndesaulniers@google.com>, kernel test robot
	<lkp@intel.com>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	<llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, "Linux Memory Management
 List" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 5475/12409] s390x-linux-ld:
 kernel/kexec_core.c:822: undefined reference to `__tsan_memcpy'
Message-ID: <Yz1uNgG7iOOVzks0@rli9-MOBL1.ccr.corp.intel.com>
References: <202210050509.cZtMcazl-lkp@intel.com>
 <Yzy/VbCd0e+K3ptN@iweiny-mobl>
 <CAKwvOdkWLE2ONDbHpSgAbFSwMZUN=KF0yeLjncS2TVVh=Wrk+A@mail.gmail.com>
 <YzzDXNTG4pMcke0i@iweiny-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YzzDXNTG4pMcke0i@iweiny-mobl>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|IA1PR11MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: c0086c24-6e23-4171-8580-08daa6c70b2f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h/99w+Quxt6QgyaqLK+uKJmCUiXowY2lm2sxUu13zVnXrx+24ieFOF2sn5VBAC1/vebAcSZek30Q42bls+R+yZLbsp6VvsKXJ9YY7M6k/ZjdrUozDXZx97AAvaTlTfWA/fFDG6qlV1qGg7S4M8580GtPfhGNnVCvGVkkLK81iKfxoxefhwOn5mAYObKzkqNF4pJO7OntvB9utaN/oTI7yhlgU0faWg9Zn278SvdVziuNJzlSgquQv/tRKaODz+wOL4SM/D2lQm7HyBXVgnkFya3UlcjLztEfEr7+C1oSSbMMxAwXtxTUwj01SA84Kstgiwsmw0rfQHbm3g9sIvyJHlNKi69LvPkOGl8yKPhWu2eUNKdVLopULgBtoU2ELIj9uxzDBcIihmT9Qj+J2OepjPpWZ9EBwJqA7BIYk6NyPKpQ+z7ZeACa2MJfAZx/ocnMu8av+LXWsjDaZ4pLrQJXVwEgLrq5s5+FcDxiP+hGQQGmHGLNZBmo81sWSOBaVKRQPskdFjxrTcFnni3KWugK56rCoAzg3z+GX3WQvqsb9PAqSScMQE1A4tF6MsKLmYFjBMP3jsOLjQpux6Lw5Y9Spgii/wgj+uoaobbu8Sv/DyrPQYFFii7LTNNDDZ0AcV28mWzhaDiJNb9Il10IhyuycEWGzU5Ykc1uUABlLRcil3c1en5lL3TH2vwp7TtDXttOpadj95D1dHMMJDuPV+XaQgEJdhGmRtbkH2SO+YhLRrJs/cW0flBDckTzNvqlc5Uh2+nKstvi02w64oScgv2X1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199015)(6862004)(316002)(86362001)(8676002)(54906003)(38100700002)(82960400001)(4326008)(66476007)(41300700001)(2906002)(66946007)(8936002)(66556008)(5660300002)(478600001)(6636002)(186003)(44832011)(83380400001)(966005)(6506007)(53546011)(6486002)(6512007)(26005)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SY2TetEqip4irvSZpFnxTJLig/6UHK09OlrzTOcRI1J4dnCM3B/zuBsTPiax?=
 =?us-ascii?Q?jwO6eG97CPBqUMZUtDcSWzzt/9pZJxTtQIzp+7Bx7HlSPV/Ah+5sE3Hj1JmB?=
 =?us-ascii?Q?UNLyNCm8+zsOg8d5d+4z8Ty6jZbMw0klhBvywr4TN0bYEvip28sRZhLXwahI?=
 =?us-ascii?Q?g/YLtHj65FDZG+PAPNCBKedgkLcQGMIRgxnMoqGIoNguUq4v4T9ZKwQKpKUO?=
 =?us-ascii?Q?blKSg+HJxGlXczketiWBmw1cDhB+1Ds6a3Bc6swdZrsQ869ldkucI3b0RJ2G?=
 =?us-ascii?Q?zzeO66/67RHaHpqRHzlDJY0YDsP8P7CCh0Snwy5dRt+20KE1Ov6o+oTYPlZN?=
 =?us-ascii?Q?O0MQGvrxer9q018GHRxgm7kQKBjl5aMaAVvMsYBg35SoUot+L/7g2hcN428z?=
 =?us-ascii?Q?L3TXfDbdqZGdOaFaLfULKTRqom6G7bVu1+RqL+knJPze92SGfXINido/UpDx?=
 =?us-ascii?Q?cxmu9l62u1qJgMM6KE+p2y8R+MEdgXcQXR1mobed44yuSIBEQ1G5qARzpqCp?=
 =?us-ascii?Q?L7DxPJYxRgub3QCtyz3oj4L/zEKaQBOk2EWqSNJFfX61gcCbTP82lWAySmcK?=
 =?us-ascii?Q?ylcewdfOtTZluZ2K3/rM0/4njwDPZNSkKYXQFAV6y4PifGl+LbQn+Cm6WkYV?=
 =?us-ascii?Q?RLfuyyW0eq3myUDefpGTIaNB4OEZHKH6i6brlr6lX5c+50tRGxrTETldOsy0?=
 =?us-ascii?Q?yt05KB6TpG7T3GpMlHFyP2elSVsB2tI5tbTjTwLjB7KzF1SZp7VhEMSe5L/t?=
 =?us-ascii?Q?VvCbN1DZIXCPiYkjjm937yqh2z0GXpS3bYMyL2KkrE+8RqSnoAev3dW3n2lL?=
 =?us-ascii?Q?qEUmYvSv6aLU2ATzQMAJIbPl2ArT73g9JR/RLmbV7SrK0yG7H5TXA9y1Da4U?=
 =?us-ascii?Q?oJM26lWVSof/Yp0oWm/qcFG0Z/FBjWldHYgqXN1zx0t2sPmnF3Bv/6JPNzyc?=
 =?us-ascii?Q?2ebHIsaLgnAjLKRjZk0alfv60fWcjx/prPj3xBUqq0IwcczF5P1cW8M0kS+f?=
 =?us-ascii?Q?e/VsKpK4LLErZqs3Gz5GTnNUDD2eKuWFM4b19US7qZxzslSeoPv45pjHmV5m?=
 =?us-ascii?Q?pNk1SqNkGx5fVBbSQ21SXX5KhnxyoSYoKAf9n7bSqHXllSwIlZ0zlfAoIMRp?=
 =?us-ascii?Q?060ZMYtrwRL67c4QZgJQqrc62uzF4M1VX31GODD9qusELQX64T9OlPydxvLL?=
 =?us-ascii?Q?qWHjdNKjeoOCoinwUwNP1vZHqozF+SUQ0mtz9s37tJijGC+oirc3gYMb9cup?=
 =?us-ascii?Q?m8Mdp4jnbeHfNCIdbrCnbCNDJo2Z8CXiMvjS8cquyWmoxQF09jolvmkfywmZ?=
 =?us-ascii?Q?cG7sqKNy+4S4jNY6fc3rEljGhQTleCH8tKcxTbwlMVQx+NmUJk4/SOQUXC+y?=
 =?us-ascii?Q?iAPihDEyNL+Gckur3LQk8ci9HPh0OxAgGXyYHuyDy10xp/x3IzezxTEBgnLF?=
 =?us-ascii?Q?5y1xhxFYpO250TfP1T7jYxOYPy4xULw2N6B1DwRbs0pu9X1Y4PuvYeFaQGXW?=
 =?us-ascii?Q?/Wph2dN3KcmMkNQrGcMHvGyoyaYBtcXC/yJOz1+HZoVcAdPSjRmQTvmTMJih?=
 =?us-ascii?Q?O67+azTNrc1DPzEbBnt98wa7aejORLXzK+VfBqLN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0086c24-6e23-4171-8580-08daa6c70b2f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 11:45:04.7712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jr9XDmcRUsNphZRV+64hLP7FeB5EYzYo7GCGTH5m7kIUg3LGVeaAWmIrFwJJnA0QrnUGGfLH5vc2GHCdzcVyzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6418
X-OriginatorOrg: intel.com

On Tue, Oct 04, 2022 at 04:35:56PM -0700, Ira Weiny wrote:
> On Tue, Oct 04, 2022 at 04:24:54PM -0700, Nick Desaulniers wrote:
> > Sorry for the noise, please see:
> > https://lore.kernel.org/all/Yx3HnuEDyFG0+G62@dev-arch.thelio-3990X/

Sorry for late reply, as we are in vacation that the response to email is slow.

The early logic only disables __tsan_memset, we should correct the logic to for
all mem* function as mentioned in the link. We will fix this asap.

> 
> NP and thanks for letting us know!

Sorry for the false positive.

> Ira
> 
> > EOM
> > 
> > On Tue, Oct 4, 2022 at 4:18 PM Ira Weiny <ira.weiny@intel.com> wrote:
> > >
> > > On Wed, Oct 05, 2022 at 05:05:12AM +0800, kernel test robot wrote:
> > > > Hi Fabio,
> > > >
> > > > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > >
> > > I don't think this is relevant.
> > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   4d80748d16c82a9c2c4ea5feea96e476de3cd876
> > > > commit: 948084f0f6959f602f89f679522b706a72da0285 [5475/12409] kexec: replace kmap() with kmap_local_page()
> > > > config: s390-randconfig-r035-20221003
> > > > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> > > > reproduce (this is a W=1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # install s390 cross compiling tool for clang build
> > > >         # apt-get install binutils-s390x-linux-gnu
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=948084f0f6959f602f89f679522b706a72da0285
> > > >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > >         git fetch --no-tags linux-next master
> > > >         git checkout 948084f0f6959f602f89f679522b706a72da0285
> > > >         # save the config file
> > > >         mkdir build_dir && cp config build_dir/.config
> > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> > > >
> > > > If you fix the issue, kindly add following tag where applicable
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > Note: the linux-next/master HEAD 4d80748d16c82a9c2c4ea5feea96e476de3cd876 builds fine.
> > > >       It may have been fixed somewhere.
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > >
> > > [snip]
> > >
> > > >    s390x-linux-ld: kernel/kexec_core.o: in function `kimage_load_normal_segment':
> > > >    kernel/kexec_core.c:814: undefined reference to `__tsan_memset'
> > > > >> s390x-linux-ld: kernel/kexec_core.c:822: undefined reference to `__tsan_memcpy'
> > > >    s390x-linux-ld: kernel/kexec_core.o: in function `_copy_from_user':
> > >
> > > I don't see __tsan_memcpy anywhere in the current linux-next tree?
> > >
> > > Ira
> > >
> > 
> > 
> > -- 
> > Thanks,
> > ~Nick Desaulniers
> 
