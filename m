Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF382F34;
	Mon, 26 Jun 2023 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687778764; x=1719314764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UWJ7i7+coAvBrdv3J4Ig12WoOEZkUinyjCTFqWaNBqU=;
  b=WqvaO1UOS9nIILxjcFf2B8vX8tY5kLIdEujTGs7JKjfWi314O6YuPOn8
   rEmljuOYbdDjTNbzzPtcpe+r4ZhL9psg0M8NZ9gBgD2sMZkHMzRccV5Ks
   KYJ6A0D09ndnvBBPuhVswdn97cBFSRm0lcnXAmrURhvn2PL+0OGoi/qA0
   36EOHg3gMnq4CgFZBhyhoirw3nBD3jHEwCwwHUfsi0b9+SejrTSMhOE85
   re+GNWPtlEB+Cvadhfcb8/5gLncXa3CaA7ncmg2PFrJprL+dEK6MJjaDR
   fJ584Fe4MGq/EI0W0hjUvBz4U87gfj5Uac7fNKFeZ1bSWD5hbbVt8bH+g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361285659"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="361285659"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 04:26:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="716098199"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="716098199"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 26 Jun 2023 04:25:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qDkM3-006kLS-1z;
	Mon, 26 Jun 2023 14:25:59 +0300
Date: Mon, 26 Jun 2023 14:25:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Sahin, Okan" <Okan.Sahin@analog.com>
Cc: kernel test robot <lkp@intel.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [linux-next:master 11546/12162] drivers/mfd/max77541.c:176:18:
 warning: cast to smaller integer type 'enum max7754x_ids' from 'const void
 *'
Message-ID: <ZJl1xws6rkU389QT@smile.fi.intel.com>
References: <202306260401.qZlYQpV2-lkp@intel.com>
 <ZJlQ9w89k7x88ovM@smile.fi.intel.com>
 <MN2PR03MB51687DB73500E906779F7043E726A@MN2PR03MB5168.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR03MB51687DB73500E906779F7043E726A@MN2PR03MB5168.namprd03.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 26, 2023 at 09:54:52AM +0000, Sahin, Okan wrote:
> >On Mon, Jun 26, 2023 at 04:53:43AM +0800, kernel test robot wrote:
> >> tree:
> >https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/lin
> >ux-
> >next.git__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXqlC8DQVkUWp
> >cL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosibK3JnB$  master
> >> head:   8d2be868b42c08290509c60515865f4de24ea704
> >> commit: e0cbc202388af454eb771043b20db6dfe68199ec [11546/12162] mfd:
> >max77541: Add ADI MAX77541/MAX77540 PMIC Support
> >> config: x86_64-randconfig-r003-20230626
> >(https://urldefense.com/v3/__https://download.01.org/0day-
> >ci/archive/20230626/202306260401.qZlYQpV2-
> >lkp@intel.com/config__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXq
> >lC8DQVkUWpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosrRvALWc$ )
> >> compiler: clang version 15.0.7
> >(https://urldefense.com/v3/__https://github.com/llvm/llvm-
> >project.git__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXqlC8DQVkU
> >WpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosvqDz55X$
> >8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> >> reproduce: (https://urldefense.com/v3/__https://download.01.org/0day-
> >ci/archive/20230626/202306260401.qZlYQpV2-
> >lkp@intel.com/reproduce__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2K
> >SjXqlC8DQVkUWpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosglKrEOj$ )
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-
> >all/202306260401.qZlYQpV2-
> >lkp@intel.com/__;!!A3Ni8CS0y2Y!8_hG3CE9MEp7WGmtpHuJhRpyycfvZX2KSjXqlC8DQ
> >VkUWpcL2zcPVAFQpJ4KxsH35hJP2pmvm8bIz_FXyDwMkGeosnz2lU0N$
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >> >> drivers/mfd/max77541.c:176:18: warning: cast to smaller integer type 'enum
> >max7754x_ids' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> >>            max77541->id  = (enum max7754x_ids)device_get_match_data(dev);
> >
> >	max77541->id  = (enum
> >max7754x_ids)(uintptr_t)device_get_match_data(dev);
> >
> >should fix it.
> >
> >--
> >With Best Regards,
> >Andy Shevchenko
> >
> Hi Andy,
> 
> As far as I understand, I should update the code then resend it again, right?

Ask Lee, I'm not the MFD maintainer.

-- 
With Best Regards,
Andy Shevchenko


