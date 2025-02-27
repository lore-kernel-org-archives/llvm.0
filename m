Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD6022DF92;
	Thu, 27 Feb 2025 12:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740660440; cv=none; b=F6HNHYJlz/3uFW6+ZN9YEaei5DV5icUnOPGVKgS8d4+Nyp7duh56Kg5GlRH6inebihssQ1+AgfSdwcXPEjFdCe0voC4ktuXS9CAGpkx2enf3W9ROkqETwItWgbxzzHzR3J6eUqmKguoj631yu2J+RtjnkyNJJkdnTt+GQYz5lIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740660440; c=relaxed/simple;
	bh=3C6LfeONdJOFLj+p0EbKVvPdF23zDoQ10QCYeO/qWGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxFNNkNaqauK4lsdBtUWetZIknentlA5XhGfAtMHnOiBCnDYHhYIvTlkNxCq13dVs3ioMHEDFDM5KWooeoL45HLQR650mxA1X+ag7oL0aMt0+yO2g4VK+CQaVa5j1ez4UnsaelFLNE6LmJ+q5NM8hhARWAtV+YTc0OTGD927Kak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOxEIk8N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOxEIk8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740660439; x=1772196439;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3C6LfeONdJOFLj+p0EbKVvPdF23zDoQ10QCYeO/qWGk=;
  b=iOxEIk8NN8RHrl5y9jDolBY0k62rcMjsVVJew/trprWiefMc1y2YD+BX
   OE9OWg09xUyFqn++488U7lgov2RpYk7VzdIk0ivIajLyn06MK3h+9qQbA
   bOgbIVXnCzz3X9YD0VPQuF79QY9IQlwXoUiQtMO+UnfozXA8Ed5YNO8ia
   j1YP7jK519rwKt1dAbaTvZhY8E8jt6HrVzARmicJ9L/Uo5QPApbU2XIJs
   BB6GZMmZCXbAviV5o5JTauhR3dw4gbn/t068OsLV/YpqsXPucUJpxtpra
   28M9cSzUb399nTwE20GsEjINge4jzXEjQMn4EWebbIH4E7J4VEjpiNoqy
   Q==;
X-CSE-ConnectionGUID: Wjda+BMWRVq9C45tvoRMBQ==
X-CSE-MsgGUID: WyQtcAA5TUKWpRDWMQJozw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52942652"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="52942652"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:47:18 -0800
X-CSE-ConnectionGUID: o+KrKfJATMimeNe7Axwrgw==
X-CSE-MsgGUID: bDUITUR/R++TizCvmZutgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121616508"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2025 04:47:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tndIF-000DMg-00;
	Thu, 27 Feb 2025 12:47:11 +0000
Date: Thu, 27 Feb 2025 20:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org, pavel@ucw.cz,
	danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <202502272049.iWEcMOrk-lkp@intel.com>
References: <20250226093456.147402-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226093456.147402-7-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-backlight/for-backlight-next]
[also build test ERROR on lee-leds/for-leds-next linus/master lee-backlight/for-backlight-fixes v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-Rework-fb_blank/20250226-174013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20250226093456.147402-7-tzimmermann%40suse.de
patch subject: [PATCH v2 06/11] backlight: Replace fb events with a dedicated function call
config: arm-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272049.iWEcMOrk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272049.iWEcMOrk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272049.iWEcMOrk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/mach-omap2/fb.c:16:
   In file included from include/linux/omapfb.h:13:
   In file included from include/uapi/linux/omapfb.h:28:
>> include/linux/fb.h:767:6: warning: no previous prototype for function 'fb_bl_notify_blank' [-Wmissing-prototypes]
     767 | void fb_bl_notify_blank(struct fb_info *info, int old_blank)
         |      ^
   include/linux/fb.h:767:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     767 | void fb_bl_notify_blank(struct fb_info *info, int old_blank)
         | ^
         | static 
   1 warning generated.
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-vdi.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-smfc.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-cpmem.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-image-convert.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-ic-csc.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-ic.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-dmfc.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-dp.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-di.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: fb_bl_notify_blank
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-common.o:(fb_bl_notify_blank)
   >>> defined at fb.h:768 (include/linux/fb.h:768)
   >>>            drivers/gpu/ipu-v3/ipu-dc.o:(.text+0x0)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
