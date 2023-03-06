Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968220F0;
	Mon,  6 Mar 2023 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678120549; x=1709656549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NGgKZfrfY47Yp6YFkhLMquYguvEs/8hVYsgBTj94qeA=;
  b=eTVbfHED1whXdlEN4KyLiWiRgqALaijTHh+mexO8nh/B6HxUOon44MEL
   utvAS8qxnAWzRH647siVHzjpfbV3kHH73KDbbAAAcRL0aQRIUs8K4OTVr
   KUEENNMseh5nD3gVUZrJKsQO9U2JeiUYUJ7gVV4vaAPNe5lyf0j8FZlcx
   ahNci9C69P7s4YY2CG8nZvbUEwQ/I6o+Q/bBodciCqoFWti6wmEg22gTh
   KS1nYLfvlCQt06zHG/rX9rV9NS2N1sQRnbfYkXl++g8eeqlG5Ta11pgnk
   sEJ5adj2liyEnuMHzL2SadKPctovyopP9X18QChtZ/u+DQlPuNJaGkR6v
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315257701"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="315257701"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 08:35:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="922007835"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="922007835"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2023 08:35:27 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZDo6-0000TL-2L;
	Mon, 06 Mar 2023 16:35:26 +0000
Date: Tue, 7 Mar 2023 00:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 3/3] drm/i915/display: Implement fb_mmap callback
 function
Message-ID: <202303070027.DvK3SmXg-lkp@intel.com>
References: <20230306102850.18299-3-nirmoy.das@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306102850.18299-3-nirmoy.das@intel.com>

Hi Nirmoy,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Nirmoy-Das/drm-i915-Add-a-helper-func-for-gem-obj-mmap/20230306-183112
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230306102850.18299-3-nirmoy.das%40intel.com
patch subject: [PATCH RFC 3/3] drm/i915/display: Implement fb_mmap callback function
config: i386-randconfig-a012-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070027.DvK3SmXg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2c504ed19ce4930ccadb2e9060cc79056969c599
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nirmoy-Das/drm-i915-Add-a-helper-func-for-gem-obj-mmap/20230306-183112
        git checkout 2c504ed19ce4930ccadb2e9060cc79056969c599
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070027.DvK3SmXg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_fbdev.c:131:21: warning: unused variable 'dev' [-Wunused-variable]
           struct drm_device *dev = fbdev->helper.dev;
                              ^
   1 warning generated.


vim +/dev +131 drivers/gpu/drm/i915/display/intel_fbdev.c

   124	
   125	#define to_intel_fbdev(x) container_of(x, struct intel_fbdev, helper)
   126	static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
   127	{
   128		struct intel_fbdev *fbdev = to_intel_fbdev(info->par);
   129		struct drm_gem_object *bo = drm_gem_fb_get_obj(&fbdev->fb->base, 0);
   130		struct drm_i915_gem_object *obj = to_intel_bo(bo);
 > 131		struct drm_device *dev = fbdev->helper.dev;
   132	
   133		vma->vm_page_prot =
   134				pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
   135	
   136		if (obj->stolen)
   137			return vm_iomap_memory(vma, info->fix.smem_start,
   138					       info->fix.smem_len);
   139	
   140		return i915_gem_object_mmap(obj, vma);
   141	}
   142	static const struct fb_ops intelfb_ops = {
   143		.owner = THIS_MODULE,
   144		DRM_FB_HELPER_DEFAULT_OPS,
   145		.fb_set_par = intel_fbdev_set_par,
   146		.fb_read = drm_fb_helper_cfb_read,
   147		.fb_write = drm_fb_helper_cfb_write,
   148		.fb_fillrect = drm_fb_helper_cfb_fillrect,
   149		.fb_copyarea = drm_fb_helper_cfb_copyarea,
   150		.fb_imageblit = drm_fb_helper_cfb_imageblit,
   151		.fb_pan_display = intel_fbdev_pan_display,
   152		.fb_blank = intel_fbdev_blank,
   153		.fb_mmap = intel_fbdev_mmap,
   154	};
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
