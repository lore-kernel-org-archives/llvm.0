Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC04F139C
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662117826; x=1693653826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnK7mM2TLm6TyHNXJhK4C8fpUzMRmiO65JWefCxXIvI=;
  b=IxafE6lzo8MrvnyEJPDkpquj+w8xCnNQRQbrC6PDma4+1gKUrauzdiuK
   cLZuDMK+MzAoW2HsegaeMGVnaA27FHFcBFUXdbVEzOKfturF5VsmFrTsP
   7c34TsWEqf4iE04WPNabwkvrLo/oW50fqtKpLMtrT7uoYIq8BRiwHIF3T
   1Y0Tc7TN8LLkb2becPA1ZBpIntRfHlJKqTf6xrYLJMBnIjmjKsrSRaVkk
   iqWMGkyRvXH6fmGLMFOlUfat7oRhfijcR8iqb0oRLRxbD7+VsD2tDNaDs
   RS6SI1Xewj1mdyFd7VzMU5DDpElPPG3d1EgKNrIWqLOf4ze7DfJYRqyzT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="276361462"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="276361462"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 04:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="674321022"
Received: from lkp-server02.sh.intel.com (HELO fccc941c3034) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 02 Sep 2022 04:23:44 -0700
Received: from kbuild by fccc941c3034 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oU4lw-0000YB-0T;
	Fri, 02 Sep 2022 11:23:40 +0000
Date: Fri, 2 Sep 2022 19:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 02/11] drm/i915: Read graphics/media/display arch
 version from hw
Message-ID: <202209021916.tSrqNgUq-lkp@intel.com>
References: <20220902060342.151824-3-radhakrishna.sripada@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902060342.151824-3-radhakrishna.sripada@intel.com>

Hi Radhakrishna,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220901]
[cannot apply to drm-intel/for-linux-next drm/drm-next drm-misc/drm-misc-next linus/master v6.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Radhakrishna-Sripada/Initial-Meteorlake-Support/20220902-140730
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220902/202209021916.tSrqNgUq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/59999fd809c2d1e77bdd9f02a79322602bc7ef3d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Radhakrishna-Sripada/Initial-Meteorlake-Support/20220902-140730
        git checkout 59999fd809c2d1e77bdd9f02a79322602bc7ef3d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_device_info.c:319: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Setup the graphics version for the current device.  This must be done before


vim +319 drivers/gpu/drm/i915/intel_device_info.c

   317	
   318	/**
 > 319	 * Setup the graphics version for the current device.  This must be done before
   320	 * any code that performs checks on GRAPHICS_VER or DISPLAY_VER, so this
   321	 * function should be called very early in the driver initialization sequence.
   322	 *
   323	 * Regular MMIO access is not yet setup at the point this function is called so
   324	 * we peek at the appropriate MMIO offset directly.  The GMD_ID register is
   325	 * part of an 'always on' power well by design, so we don't need to worry about
   326	 * forcewake while reading it.
   327	 */
   328	static void intel_ipver_early_init(struct drm_i915_private *i915)
   329	{
   330		struct intel_runtime_info *runtime = RUNTIME_INFO(i915);
   331	
   332		if (!HAS_GMD_ID(i915))
   333			return;
   334	
   335		ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS),
   336			    &runtime->graphics.version);
   337		ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_DISPLAY),
   338			    &runtime->display.version);
   339		ip_ver_read(i915, MTL_MEDIA_GSI_BASE + i915_mmio_reg_offset(GMD_ID_GRAPHICS),
   340			    &runtime->media.version);
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
