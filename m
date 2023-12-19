Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D067FB;
	Tue, 19 Dec 2023 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gg0VrDLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702947852; x=1734483852;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qU8xOkhwgoU/Q4Kp4P1eGxgylIv6eoDe8pTQdnUGwSw=;
  b=Gg0VrDLuZJcRjr8Q4zG+rswG6/2layYjCIY4UoWsqShJjncpLWrNExPx
   pj/sXIMBptquzxrqIqXktUen0gE0R8RTI3uvYFqt//fhTWXCDv4NUqKty
   etylwTFVHQUbkzmy/hpR4lMUdcm+bmOpsgWWfPYmYZ7ZCAXE+x6ZyXObo
   LPtWhNyuxoYB3rRabAVnRi62fPiPL2x1K+XOVw1IOkVnDv9MkEEUkpjlM
   AWxoZ6NK5ctykRXzuB9XIoifMqa8pxR9DdND5YxlDS5wwxv72q/bqpl25
   IlgbZDFmrUUqbbgOo3UuB9bLMSdQzKRcerZn804EifsYDzKmF4klyUQUY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="375740236"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="375740236"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 17:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="17397685"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2023 17:04:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 17:04:09 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 17:04:09 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 17:04:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccoPXvngJB7x9ZhhMZOYegyMH/GOmtoz7PZKxZdfpsq+o5/I8kjmSr01JnBvwNPvjVXTrqkDxy7lvM7th1lzWWzSPsyWVrmDAGoM6q1ZSSu3zMl+bMgpvknGSZxt8hEN/9vILqQKI8+mnDRulAvTd7q3tXezXlXMWuHJMqgYuoqsNWDsYwgUaF+6RZJRI7U2Q0ex7x7uO1MPSpUkXBjuQKEX+bCxALfovA8EKnEh+C6ApHaEESMmnm07DfzKkZ9C1emXiYI3e08F9iOhAEOYRj8PAReQo/RFIYE5zBp2+rJgWI9x3dBjMCsitaGelFkFL/CU/LL8nWu23N4OOe4tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDpbaYCRi08zu9azIQgPI/BUqYIJ2jocsP/+2EtFV7w=;
 b=SK0F40f1MPfMir+zng9CV578nUfYLbVETYDLekWfxtE438WZkbmLeZt50SGU+CKFZvuTsP6/25Zn/4CSdui9mZs0ChRc6mq+X/BHDXqWx2nMELn9ymCb5/fKZ5i9wO+QAZslSm/G7xiqjGvoHMjA1++RSlw4NmeG5pPdbSUU1zr8gFtlzteQI7kYXCko4xw3/IUM/pAIptpI/nQrfsIijl+5MYbjJwsVYXWmIq0F/Zjw1x9Z5ABDkCukG4hjj/N2TXKhckw67lkHFz3Fi4736gqGBX0ucU/YGHOfSwoqaxSPGqPV1oDiyYsyE1E5+id3SnftvgU/+J9lTuNlMVEr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 01:04:06 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67%5]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 01:04:05 +0000
Date: Tue, 19 Dec 2023 09:03:57 +0800
From: Philip Li <philip.li@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: kernel test robot <lkp@intel.com>, Lucas De Marchi
	<lucas.demarchi@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <intel-xe@lists.freedesktop.org>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [drm-xe:drm-xe-next 989/1016]
 drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is
 used uninitialized whenever switch default is taken
Message-ID: <ZYDr/dN2E/EP24a4@rli9-mobl>
References: <202312170357.KPSinwPs-lkp@intel.com>
 <20231218185722.GA2863043@dev-arch.thelio-3990X>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231218185722.GA2863043@dev-arch.thelio-3990X>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|SN7PR11MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 7745d9d9-54da-4508-9291-08dc002e6570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VBXRr392t1E4GVeWSoSQVladnhhXOQLoIQ1wsCcY5wXKlVJvbxBAwwvojTO2yUk/J4/e3l/Ir9/lwoMefF5mp/qw3LRPP5CqosQF3sOULAzZE1YMqTd66ce0d12xBLOQk24A9bZB3oATaPkPnztlEWs8b86tW5vmZp8to8DHJXQfKJSWVTXkL9KsyotThX7rk2giCCc7KpeXKBL64CUXEvU9bpXtKbuzap0V03jFQNBQg5zyAhAYSbcLiDxhyFNpxmgGpEWsuWYTPAvPtEHvT1mv+8HTS8Tx9ewNvgWEVdNerF8lKLvnKE7HTmsS2pxcIajgMeenk0Cz94njZmmOi241bvKbKDWSMszReNVano6xMnxKPMpKLuzD1/ZZCHXkXXqlKRE2GAc8IAUQlUZMbuNjt9wEOf9yLAGOIgLxNWK6/FSLmUrOxh0tmKylgDIYAGIz9hhRV+iOvfCsJblk8ap6/lx+O4DAeNj8NjnYmijD6t2dDARABwe36A/UYER+kyAYoRT6L3/yArHSDhpJq8wt7RySJmkYNH2LjiPY5dLL8Y3lZQzTVwyhiVtCCoj48UCgW8LGYoKraHCsKHBkW+b9cFt6ZApVTIg4rr3yOQ0HIJVrGZPqhjiCi+u6osfAwliXbOp4cGLF6JprVxnpCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(107886003)(26005)(82960400001)(86362001)(38100700002)(5660300002)(6512007)(83380400001)(44832011)(9686003)(66946007)(8936002)(8676002)(54906003)(316002)(66556008)(6486002)(4326008)(66476007)(6916009)(33716001)(2906002)(966005)(6666004)(478600001)(41300700001)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?faWJShz1iR0vYL+nmP9Hh7LHlfGXHrbo9/oPmpS2Psf+CG64Jx/hBR5CDicK?=
 =?us-ascii?Q?8ZpMrzK3125EqblyE57zIlWNzH/O5ZnBcIBDCUC8dofpoKTESMwwZOHtxgZx?=
 =?us-ascii?Q?/1Wlgc9fACgyLFb+bwpJiC1p7cU46EbFhsSuj4V/zPr+s1XISj5CUM9VU0i+?=
 =?us-ascii?Q?NLHl0l8un2bkbuLG6d+QO33No2csy/2kKjBtvNDU0pfmTXMvF4NFWZc4zyw5?=
 =?us-ascii?Q?P7nkQRI2h67VhRItv/P6MjmLJGE5+bgcZwcJTV9NGg7qvoU7VgB4TWS8Q+Ze?=
 =?us-ascii?Q?vR3wiarYnxg3NQpGJGmSXGuEzSgJBbO5vjOm7KF3HmMejXTMaeukky6lPsrg?=
 =?us-ascii?Q?pqKTlHKCzvDRGA4irKdzRbYYcsASRdJRjuq+mlQTDZSmol5v8tfw+OxP+xjZ?=
 =?us-ascii?Q?2h+mSUfmOROKNJ0n4Ji21bloWvZiL4HOjFHSSGUwfrggYcDMBoKPcBXPkQxE?=
 =?us-ascii?Q?KsRZEvCGmW+fPuj5RvzA0YPpp5wSxlntWReDprRaLST+ZzYlFi74XOqj9tVk?=
 =?us-ascii?Q?H9RfTRsoms8dwW96JkspJA92fPj9dO00/GFWXZ8My9p4hDYH/lk9CAVh2M16?=
 =?us-ascii?Q?Wd9i06AiJNVg4jxSjJ6kGKSfPLfTJ5Y4HIxsaDdwh6jQceFZa7HvnnLnZGsI?=
 =?us-ascii?Q?yjktotuvi5H6AEZ90eykvzMOerhYJz6h4JKbo6Vfuw0MWCZDWRTPob9AKQcC?=
 =?us-ascii?Q?W4j65beXXd0dK0I6SPo4Ecg4oPz42PS8gkbrsCCf5MxQk9CVBEFNIVD4W35f?=
 =?us-ascii?Q?q2tQFQsj0KhaDmWFKvVTmulzzOPNJJ6u1T4mnnOulGZ38SG9uGCVuiRSh0o+?=
 =?us-ascii?Q?QW1NBf/p3fnEhef3esjCIS4xM0C3CeJ7/3UxKnvUN8nAARxrpYhUYvCMpljC?=
 =?us-ascii?Q?JlUnEZn0l1PnyHXXFXOpbfBha1b3fnkQp9TPc1im4ZQDuP+nLA79mHTyUGoD?=
 =?us-ascii?Q?KeX+M6qik/Q/E9uer7dvFwPjX8OunovAqhsdTUfAmU7kFtv6kLHtM+2iEDgr?=
 =?us-ascii?Q?rRJ4D0SvC29uBFmpoMVJM6T8ZzOT86WbsPov9osJQ+f45YEib0JolZyB1q3J?=
 =?us-ascii?Q?TEwhlAH7tjXrBuY2hjpcZdEUkivwmj5jFfW6uBjiXJt8azsnJMgzBVaSLrr8?=
 =?us-ascii?Q?pzqplbgNUp9CrV+adQc0WLys6+eTdljjcJ/jVz8v5prfD093kB1qFtCEL5Lm?=
 =?us-ascii?Q?uxUQ0+IJe8HZwvJspMn87eiH8B41GzQlqPYXQ3rrItQZ4+wSKa3tWtrLAC8P?=
 =?us-ascii?Q?p6zny3P1jq1xp0cIxrJP7nWa2fuNy+C+8EWV25RHGsGE8/TXgOWpGbvwCTKw?=
 =?us-ascii?Q?UlZlFTB/4kOhEIBkUy/51Ycm1dvJYOMi/mRS0e1CF8U5ESI+ytSRtbm9jsBx?=
 =?us-ascii?Q?s4vtAw0m6Q+Z9w9WY55j/uBIaq1XZRhU9yToGnpZd6ISdxlgD7Bb4m9aPQu8?=
 =?us-ascii?Q?e5OWViAiDZMXbyW+kZzv5v+B0zJA09N0jaEa8UWaT4SstGfcIcKu1+C4TLq/?=
 =?us-ascii?Q?aBBo1jS6bNSWCcHwOotDXBKgQaL87DBLj070ylJoJMLGntpk3u4D6xpJfw5R?=
 =?us-ascii?Q?CWcC6NuQB8dXq7gz4EUXc1YAHNDyvn4BS7sLU/NK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7745d9d9-54da-4508-9291-08dc002e6570
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 01:04:05.4723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6E9fQ3rTcLZiSSeuSADJVXPUyUrMViGxYwuJa+lXXelpzG45jqcqrsARonEW2u3a5bk48Gs7S1+XiFZMl8mQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
X-OriginatorOrg: intel.com

On Mon, Dec 18, 2023 at 11:57:22AM -0700, Nathan Chancellor wrote:
> On Sun, Dec 17, 2023 at 03:28:47AM +0800, kernel test robot wrote:
> > tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
> > head:   c54005fdd0347a17088e7ff78070a55bf9103bc4
> > commit: ad7d86415578e1a5deedb0ceed5c281f7367d66d [989/1016] drm/xe: Enable W=1 warnings by default
> > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231217/202312170357.KPSinwPs-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170357.KPSinwPs-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
> >    warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
> >    warning: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
> >    warning: unknown warning option '-Wformat-truncation' [-Wunknown-warning-option]
> >    warning: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
> >    warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wstring-concatenation'? [-Wunknown-warning-option]
> 
> I am not sure why these warnings are even showing up in the first place,
> they are wrapped with cc-option, which should be catching that they are
> not supported... Is 0day doing something funky with KCFLAGS?

Thanks Nathan for pointing this out, we will fix this issue to avoid showing these warnings.

And the bot does add some flags [1] to make the build more consistent and align with latest
mainline ones.

[1] https://github.com/intel/lkp-tests/blob/master/kbuild/etc/kbuild-kcflags
