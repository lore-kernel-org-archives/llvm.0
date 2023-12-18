Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A2B7204D;
	Mon, 18 Dec 2023 20:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaYIhlHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702931328; x=1734467328;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=EwGOuhE2gApYyoIad49V6pXqf2xzJIFtwFwJJXBtK68=;
  b=IaYIhlHBuYfZvg65anOqVTVLcQA7xOt9F9ukkIYDxiRKHNiXDnYGIfrN
   guUX9KegTN+vXVIyCFKiCzbw+re+VRscshUjs06akv8y65Tx23tNlB3rI
   5Qwz1R2F7eS1W/bIhY1yyx426XZffKK5rJHOmj1PAq0Vw/7XrLfxhJs9b
   9fFg/fZmLgU4kZKneNQKNOCeymAFZ/2IWyKGFVyaPRxCKq0zhnXy9EUQT
   oii3mwEDgaZZNTnuGm3leddd9XxQwXlcdX9Ak2dqAkDyv5TG/4QAZjMNo
   NjGqW40PmSVepObuixAobFziPOWrMF1vjtGCMbzgya7mbgtWFTyp6vDOV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="395289447"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="395289447"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 12:28:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="751878642"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="751878642"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Dec 2023 12:28:46 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 12:28:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 12:28:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Dec 2023 12:28:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Dec 2023 12:28:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVMyfSOXF/HjfUaWqfxl1wVzJPQWV83qTHLkk8X0IWUheFT2KGEdYor4XElMXMx6hhmswjoiE8/7Jz+6XMR3bFIjVCOqcKDStVLhSFkVd3P6EqEpsQENYOunphfandBmRE9rmJRUmoZEzoMlzOkI+y9FtkiCK3C0Wqbn0ew/XmudgbBGUpCCjOMjM4QA5oeLBGCXrfWjl1UJ+MKTi47M3Ftgy6oBgyPVLfUKfxBd2lvtLCd7nwKz2W0Q0fBZye1IHsfDu1+sUjJ+0nXmyoGaJRedd37OoTS12gu+jcdQBbIIv1tRjmrtTjesrkvAnqcM+BTA/bsd2qNrGAFqsbWWhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mDHqq8Nh8eAf+WkIu1ZQ3qURw3Tb1RqWIzTDI3Xs4A=;
 b=Q2XUNNn/bqKAvON39GOvjG1jov46cOdXrcfHkKN5TCPr8kT3Yp2OH43wgPj9czmoYPBuQ0gEvDsn7IwLmEUSszJiAyckBrb5i2lbAPr/6/HFrNe7inryKwPVpCVlYJhi1YZImvJUkF3FqlWIqYG1zr3ZmuwkO0RVn+umMmEWJlnkIpZLoTgeQ/VDFzw/klCtpch4ldVLx8tf1xe4eYX6fyYkbD7Pa6/21jcB0XuBU7WDggTwcdoWo43zjDwL9VVjL6B10Upx/sWVX18Wl1zOTMsaHNv0aqwhfsTOHHGCD3os1quuh8VXEM9NL/1BOm7Dcrhq4JwswN9T9Rio7zQ1eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Mon, 18 Dec 2023 20:28:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 20:28:44 +0000
Date: Mon, 18 Dec 2023 14:28:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: kernel test robot <lkp@intel.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <intel-xe@lists.freedesktop.org>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [drm-xe:drm-xe-next 989/1016]
 drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is
 used uninitialized whenever switch default is taken
Message-ID: <w3nzgx5fsi5pi2oezarnbyorwnum5vpdkkwmxgfpnfg2zs4sbb@abaiypfjw432>
References: <202312170357.KPSinwPs-lkp@intel.com>
 <20231218185722.GA2863043@dev-arch.thelio-3990X>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231218185722.GA2863043@dev-arch.thelio-3990X>
X-ClientProxiedBy: BYAPR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:a03:80::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0eca3e-0690-46eb-e136-08dc0007ee1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AQ8cljBHzO7peVzS3WRGw242DVqDE+0fHKZRIghfw/3jaaJSJphM3l0typWQ/htwQN6xsMztOrc4saWM4QCi5e4M7ksQ7rdLnjaVgX3bJxO6bGZtB4QX88lXRwtzwFzRvKCAmaM5Cji93uMQM9rqQGbF4RstJ4dYiMJtUdO/Ac1PZ8vnR7JzgcDHj1eNPDmyscvbWI30cfg0WV+LLqBj4Z1k6K1B6TXfH6egEZAZ+4/E7QKGpwgnAPD2aQ620XG7Qp3Y/gUdkB4Em+8OghGpkiI8ctaFdnnpacNz8TgcP57h3qTVbAc1W2r9k+mWvUvLDcT9WBXMyeH/NhQSbu2KLOLA0Ns9ZWPHxIrpBH5M6xZnubHAPA8oawbNABOpNiuPX4YBgzKfruLvPBl5yaAAa+X7qkQ/BloDnBU1aMkL0Foti/hQDe7mJX+VnfzdK3fZrVztKjyAq3PsgD1dajkuoB1NoLenpv4K2Fbdg/aCfdrWc1ZETZGHqZeVFALzt7eNDN4Xs9tQgHSRxRK3YI4F0JdeLauiEYyyxT3EbDokepToeB2T1O7g/78819GddZQ0+8B0+IR7G+RiuktxsrcYDeCQcl6LfFEuzr5DpDjSC1JUVdYWEvFLLlKjyOFN3Vaq2pxBtmTIVqVwzt7rI8mHIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799012)(451199024)(64100799003)(66946007)(66556008)(83380400001)(107886003)(316002)(6916009)(54906003)(66476007)(478600001)(38100700002)(966005)(6486002)(26005)(8676002)(4326008)(8936002)(6506007)(6666004)(9686003)(6512007)(5660300002)(2906002)(86362001)(33716001)(82960400001)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/npmVoVmz1Bsl4upkw4Rcb+rfF4/t9W8vO3Rw2xTtloUlstKJ6MKrMqU+i0k?=
 =?us-ascii?Q?OsZ63kdoz8ausGGvYTzH8ks6dFkrEaBJ/CnG67GII/VUVrk9tySOkEQn9Zqj?=
 =?us-ascii?Q?lU3UyhtgingisDKNk3QqMfkjXcl+ERHhI8fPtz0Xkc9EMWpMJLDV0+dRRt81?=
 =?us-ascii?Q?/0rJ6OYuP2WLOqOrd1ouKWB4H/dPTJgj7Gh18fOVUUCXpC4anNTKHSEhN6kj?=
 =?us-ascii?Q?WBSZrb+8X3ZNN/bmliFgaDFuenRfpQsUU7HHpkSmna+gLxI2IeyBfqFvCweU?=
 =?us-ascii?Q?DuAfoiJ4HCE4dTDGpQ7VhQcz8bw+GZjLwo8Ay2MI7XqfWgnBZpqpPzpjjwjP?=
 =?us-ascii?Q?pJUOkoRihHkPnj5SqXmoaALNCS7rpwp+mmtbQGIf07tR2TV7xPS3v6pw7gAZ?=
 =?us-ascii?Q?Hjac//9Zdfw4TliMix49z7KlA3H9rdyU24nIlok68x6+ArX4UX33sVWuM1Fz?=
 =?us-ascii?Q?XeHW08LOhH4PRXx4uQcKcPM+KFxbnTASeTqgG7LtKmRxe1SaqEnlLApZ0N8F?=
 =?us-ascii?Q?G3Ny+svatoP67B06J+Sw2Yoj3qUoPW+z1NJU5+gblzSeAWI2hfk6KKjA1oZ5?=
 =?us-ascii?Q?P1odYFKsQRSAXkg9GjqpHBfXx4nJI3RQk+wOeTnCDl/colbRsfIODg8zrroz?=
 =?us-ascii?Q?LxXIqr3YrNOS9xJgpi9rmI2/oCvx6z3C16TFQSvgj6TICNh2xJ1Zs9kYomc3?=
 =?us-ascii?Q?gQTNe0Cn5TL/q/pk1L5rHMbFb3/eO/7aHerEsvJoRgkFTaGbYF69H7u/1UrZ?=
 =?us-ascii?Q?MpMMdRKpSPxRaDSnJPUQNQxPv/wNoqa7DACAuZZpXKG6hVnpNKR7Xe9TbpZe?=
 =?us-ascii?Q?rSHk1wymyCP5aBuQRo2Bt4QObyh/AMY5CGsycFfcv3SMQuwjr/AN5TdA8tuV?=
 =?us-ascii?Q?UXpw6bxwSpckssRxFTXOV1n7KZY6LbfN6EH3Bk2MsACbsG0CqeeEKSJ+TRxX?=
 =?us-ascii?Q?IJItudnlbziWkoqjf94j6IpF1Fg7dW8bPg4zIyaTOZk8l1dpG6xSHxgKdk5o?=
 =?us-ascii?Q?9Lo2aOB0PdRoOoTl/y3lIW689bvdcMq9RugdPg4jVIJ4Ax2ql/NFWhBkQoS1?=
 =?us-ascii?Q?Ozzl6Ub/AQxPeTvoY25EJEI5Mphr5oGsovw2pSC5BJSplVNusLONCN4d6qmk?=
 =?us-ascii?Q?9GBIF1MgLkIyYM7davSXGPAwDhLX9vMEMVfsDcNUk+ValEbzE+nRTo+r1j8+?=
 =?us-ascii?Q?5cDBW2LVpwyMde1H+nEZlhBvkew6qw/LZHKEDFSz7/LuGuVgkgRfFi9nDDI5?=
 =?us-ascii?Q?/JnKZwwcPDxFTB+P1GJ62I/nXzsK6s7yAnfvbw1i9rSiPr59KMfllRbfSAQv?=
 =?us-ascii?Q?fsUduNKk5yKpY2D7y9pgvNJPj19UDDPo2WzZeacHwQ3/1G5Q1gjKfVi6C09X?=
 =?us-ascii?Q?w6ZXPWndeRkaHiBR/0AfIjHNQaTrIhS4YuTmQWgwPvqmgtpj9nPsnRFoCLDB?=
 =?us-ascii?Q?HjWmqVaEi/3HDTm3TgwH96corkPiSaY97aKRXW7++Sz0nZf3M+1L6EGbM1zo?=
 =?us-ascii?Q?Sr1Znp4LmV67fonggZSBZLKkhTg8SCEMQzeu1u7lHElwGcv2PxWkDlxvstTJ?=
 =?us-ascii?Q?1jLzCIXlUycahNCWLDlR7idrr2LKPdzXkOueZJLHjulkmXMN8hhcTW1x3b9a?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0eca3e-0690-46eb-e136-08dc0007ee1f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 20:28:44.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wpcys1wLBHEBSoVzm1IIF1DS9J/0m/aQobVYzeZ/6lBTbsjmiSxp3vM2t0A6nQ+3h4KyHLkdYjUQ7WEEumXss3nUkRTx3HRdXzdqZ+XQGII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6470
X-OriginatorOrg: intel.com

On Mon, Dec 18, 2023 at 11:57:22AM -0700, Nathan Chancellor wrote:
>On Sun, Dec 17, 2023 at 03:28:47AM +0800, kernel test robot wrote:
>> tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
>> head:   c54005fdd0347a17088e7ff78070a55bf9103bc4
>> commit: ad7d86415578e1a5deedb0ceed5c281f7367d66d [989/1016] drm/xe: Enable W=1 warnings by default
>> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231217/202312170357.KPSinwPs-lkp@intel.com/config)
>> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170357.KPSinwPs-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>    warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
>>    warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
>>    warning: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
>>    warning: unknown warning option '-Wformat-truncation' [-Wunknown-warning-option]
>>    warning: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
>>    warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wstring-concatenation'? [-Wunknown-warning-option]
>
>I am not sure why these warnings are even showing up in the first place,
>they are wrapped with cc-option, which should be catching that they are
>not supported... Is 0day doing something funky with KCFLAGS?
>Regardless...
>
>> >> drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>>            default:
>>            ^~~~~~~
>>    drivers/gpu/drm/xe/xe_wait_user_fence.c:50:9: note: uninitialized use occurs here
>>            return passed ? 0 : 1;
>>                   ^~~~~~
>>    drivers/gpu/drm/xe/xe_wait_user_fence.c:21:13: note: initialize the variable 'passed' to silence this warning
>>            bool passed;
>>                       ^
>>                        = 0
>>    7 warnings generated.
>
>I was surprised that this was not caught sooner as
>-Wsometimes-uninitialized is a part of -Wall but it looks like
>drivers/gpu/drm/xe/Makefile was forked from the i915 Makefile before
>commit 43192617f781 ("drm/i915: Enable -Wsometimes-uninitialized") was
>added. It is good to see that the warnings are aligned now so that
>trivial uninitialized warnings can be caught by clang because they are
>disabled for GCC since commit 78a5255ffb6a ("Stop the ad-hoc games with
>-Wno-maybe-initialized") in 5.7. Will this be fixed as a separate patch?

https://lore.kernel.org/all/20231218163301.3453285-1-lucas.demarchi@intel.com/

Lucas De Marchi
