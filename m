Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3672A1C0;
	Tue,  5 Dec 2023 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnvROX6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701789097; x=1733325097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3aYgHSvWQd1cVfoPCxW4y0fhglZy0+rBsZj59LAX4r4=;
  b=fnvROX6w92JuwuK9h7bpmBpuPA7Jv+sNE8BPKUYj/iCx6VUm9c9kYN6V
   zHXZVdSmJDuejhp153AntF/nnOl2Lxu+EXOh/H7vPWNZ4sGtvOJcDdz8S
   1IE4XqZ8i9Oww9Q35PybCADpHdMX9BpbW6zFX58n5i36b4OY8wW1q758h
   I+5jBvl70TTsskdRGgU9/jWWEd8o6mFTqU+Wx6AU6+nQGa1zA+OUPTyIL
   uMVv9gNtJaN9aV/f84Hk1kpKa1ZZYpsRcshyVoKlVuOvEU7WVmoOnjz5m
   TiJ8eZlk4vmG6aWnpsarzP+RirvUbyWk8F230bemv+p5kHQoztPdhf5Wz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391071788"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="391071788"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 07:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="888968226"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="888968226"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 07:11:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAX59-0009E3-2o;
	Tue, 05 Dec 2023 15:11:32 +0000
Date: Tue, 5 Dec 2023 23:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [v3 4/6] drm/vs: Add KMS crtc&plane
Message-ID: <202312052346.3kCifvmT-lkp@intel.com>
References: <20231204123315.28456-5-keith.zhao@starfivetech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204123315.28456-5-keith.zhao@starfivetech.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.7-rc4]
[cannot apply to drm-misc/drm-misc-next drm/drm-next next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Zhao/dt-bindings-display-Add-yamls-for-JH7110-display-system/20231204-203725
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231204123315.28456-5-keith.zhao%40starfivetech.com
patch subject: [v3 4/6] drm/vs: Add KMS crtc&plane
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231205/202312052346.3kCifvmT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052346.3kCifvmT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052346.3kCifvmT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/verisilicon/vs_dc.c:970:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     970 |         u32 i, ret;
         |                ^
>> drivers/gpu/drm/verisilicon/vs_dc.c:78:18: warning: unused variable 'primary_overlay_format1' [-Wunused-const-variable]
      78 | static const u32 primary_overlay_format1[] = {
         |                  ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DMA_CMA
   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
   Selected by [m]:
   - DRM_VERISILICON [=m] && HAS_IOMEM [=y] && DRM [=m]


vim +/primary_overlay_format1 +78 drivers/gpu/drm/verisilicon/vs_dc.c

    77	
  > 78	static const u32 primary_overlay_format1[] = {
    79		DRM_FORMAT_XRGB8888,
    80		DRM_FORMAT_XBGR8888,
    81		DRM_FORMAT_RGBX8888,
    82		DRM_FORMAT_BGRX8888,
    83		DRM_FORMAT_ARGB8888,
    84		DRM_FORMAT_ABGR8888,
    85		DRM_FORMAT_RGBA8888,
    86		DRM_FORMAT_BGRA8888,
    87		DRM_FORMAT_ARGB2101010,
    88		DRM_FORMAT_ABGR2101010,
    89		DRM_FORMAT_RGBA1010102,
    90		DRM_FORMAT_BGRA1010102,
    91		DRM_FORMAT_NV12,
    92		DRM_FORMAT_NV21,
    93		DRM_FORMAT_YUV444,
    94	};
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
