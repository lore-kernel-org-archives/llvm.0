Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791420E315;
	Thu, 26 Jun 2025 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750973333; cv=none; b=NgWreUk3W4hq6QLsTZ/W5iL05+NXz2O35DDpXEzCVsetRERAH1xDJd0/XpmJeQhNAxdGVCKqHvnr4zoLa5LjTzW9kbiWz70NK/0rIVQKcNjBCJOmRiy1LT5t+WM4MtJxpZs2qsmcg7o3cqfKjmQ0wSA58oReCRUmlveWaVsvy2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750973333; c=relaxed/simple;
	bh=PLZzAdX+5PzAgrtD7ATf2kU/OYqwm6guag3uzHDX384=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RS8mqRdLI36kgvXrz2CUgXriaFUxMPqhEWW+RnapeZQIC2FmPvlm4KVCar+1p46LAlNxJ/i0UlwLzMHrbtfa1+q1KYaqV1r/fHoVBaxfB1xF0bYK83gfVF+nq81k9IhcWL5igXOuTA5Fd99yF/BROcDovxekjmwiS79r9VflOv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVH0+HGa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVH0+HGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750973331; x=1782509331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PLZzAdX+5PzAgrtD7ATf2kU/OYqwm6guag3uzHDX384=;
  b=OVH0+HGaFJbdI515+Ix3IhEXRqlZGLFJokikQhBO0rJ3p1HarwGJZ8ZE
   UhQ1jTsZ9B5q+4oxw68A/h7sb6RQZwmqnBS0RzW/H3PzxiTPrEWPuSiXI
   VoEegrhH4OP2k9zTmnOvT16506GU1BmvpTpHy70nxbrvj2DaHHHpb2iha
   jGNmIINNkNBmL4YK6Xgj9TytF2T/mVX4COGqwPOwQNXSeBEMw5Jr0V1vv
   SsmtRyN3QAWJyqm/7KLtAKNe5tBoF+3zGSIporSvyTk9XdIOfiMuT22EO
   degbxGCKlZEX/lP7u94g/ADLG7ishPCf9cAlNJT5dnXWGo0lMQ9oUUY9S
   w==;
X-CSE-ConnectionGUID: ZQVg7OkaQXukKFjS1G2VPw==
X-CSE-MsgGUID: V4P3qj3rTe+ATyj05crOnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53008178"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53008178"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 14:28:51 -0700
X-CSE-ConnectionGUID: dA2POMMHSBGcOFw3AQerzw==
X-CSE-MsgGUID: 8Nwjcn/pS7iKXdke8f6K5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153149425"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jun 2025 14:28:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUu9G-000VYE-0p;
	Thu, 26 Jun 2025 21:28:46 +0000
Date: Fri, 27 Jun 2025 05:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Helge Deller <deller@gmx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Jones <pjones@redhat.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed
 but not fixuped
Message-ID: <202506270558.awnEnyeN-lkp@intel.com>
References: <20250626094937.515552-1-oushixiong1025@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626094937.515552-1-oushixiong1025@163.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc3 next-20250626]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/fbdev-efifb-do-not-load-efifb-if-PCI-BAR-has-changed-but-not-fixuped/20250626-175111
base:   linus/master
patch link:    https://lore.kernel.org/r/20250626094937.515552-1-oushixiong1025%40163.com
patch subject: [PATCH] fbdev: efifb: do not load efifb if PCI BAR has changed but not fixuped
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20250627/202506270558.awnEnyeN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270558.awnEnyeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270558.awnEnyeN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from init/main.c:110:
   In file included from arch/arm/include/asm/setup.h:14:
>> include/linux/screen_info.h:145:6: warning: no previous prototype for function 'screen_info_is_useful' [-Wmissing-prototypes]
     145 | bool screen_info_is_useful(void)
         |      ^
   include/linux/screen_info.h:145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     145 | bool screen_info_is_useful(void)
         | ^
         | static 
   1 warning generated.


vim +/screen_info_is_useful +145 include/linux/screen_info.h

   139	
   140	#if defined(CONFIG_PCI)
   141	bool screen_info_is_useful(void);
   142	void screen_info_apply_fixups(void);
   143	struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
   144	#else
 > 145	bool screen_info_is_useful(void)
   146	{
   147		return true;
   148	}
   149	static inline void screen_info_apply_fixups(void)
   150	{ }
   151	static inline struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
   152	{
   153		return NULL;
   154	}
   155	#endif
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
