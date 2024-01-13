Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E6DFBEC;
	Sat, 13 Jan 2024 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSeNw7Hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705127259; x=1736663259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j98s5NZ8fEGR+sOr/XDd4Ut/ZG0+myZ3kkI1NCOFYos=;
  b=lSeNw7HgC0fzBIgg5CAj6OEqWZyr/628fl30wTDx1vxiGSMD5/2TPuJn
   QvFUoG7FGVQ0i04mBW9uyI9HJAexrhAkUExfunhIi1fAZGr7txsl/wb4/
   SDF0qjti1cPUUnrZ2DFYBDFwUyYOtaQ4o2u4GHhk/SqpkqRa/TTmHbjME
   jtY6uPlN0EOYA5IJPQbRLgT5Sbixtvf/CkI/jjbUaCtJyULMdlxWK4olF
   0fLdMP+2++zspOI6fncsr/LLzg9TUJNAxkRQv/McgqOAHUmhendkdDQ5o
   U3h0BmZiGJz4jNi3LZZtPAUOPOziUiiA6FjsXqxpuUKIkw+LdyS8HIJWt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="399034838"
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="399034838"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 22:27:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,191,1695711600"; 
   d="scan'208";a="31611499"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 12 Jan 2024 22:27:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOXUS-000AAp-38;
	Sat, 13 Jan 2024 06:27:32 +0000
Date: Sat, 13 Jan 2024 14:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 12/15] drm/i915: Simplify intel_initial_plane_config()
 calling convention
Message-ID: <202401131457.PbfNaUDC-lkp@intel.com>
References: <20231215105929.29568-13-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215105929.29568-13-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip linus/master next-20240112]
[cannot apply to drm-intel/for-linux-next-fixes v6.7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-Use-struct-resource-for-memory-region-IO-as-well/20240112-020958
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20231215105929.29568-13-ville.syrjala%40linux.intel.com
patch subject: [PATCH v2 12/15] drm/i915: Simplify intel_initial_plane_config() calling convention
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240113/202401131457.PbfNaUDC-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240113/202401131457.PbfNaUDC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401131457.PbfNaUDC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/display/xe_plane_initial.c:270:6: warning: no previous prototype for function 'intel_crtc_initial_plane_config' [-Wmissing-prototypes]
     270 | void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
         |      ^
   drivers/gpu/drm/xe/display/xe_plane_initial.c:270:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     270 | void intel_crtc_initial_plane_config(struct intel_crtc *crtc)
         | ^
         | static 
   1 warning generated.


vim +/intel_crtc_initial_plane_config +270 drivers/gpu/drm/xe/display/xe_plane_initial.c

44e694958b9539 Maarten Lankhorst 2023-08-17  269  
44e694958b9539 Maarten Lankhorst 2023-08-17 @270  void intel_crtc_initial_plane_config(struct intel_crtc *crtc)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
