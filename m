Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00627E;
	Thu, 23 Feb 2023 19:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677178986; x=1708714986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u3IWCb3Tpaem6hYHmLmVm8fw7X6FazOdpdYkJDUVCYs=;
  b=kxlK08GzplG1exZC1gnG2N+DJvGraZyyA3BND2YDjm5Ox1PIq4fmqE0R
   T1T2iBufDCOahHqsU0Ok2zPW8bfT27bjTaVpMmAqYaT4kORVWZBYWqXVz
   Aosc1ESR6nhAbV+GUan1ffHJea+96S9IkZmEeQ96wWPOf5xb1MGsCtrb5
   Pz4kIccshyvcYe62CsGY4bNxJtsvpcTe122cWFZaCa58JPabPVqdkO2p7
   rPq3po9dM7OvIASdBtH885gjPnLEPYPK0sK0nnAhLlppPyhuvxMxrCfsz
   n+ZY1sCchYMuMarQ/6NsaTMrRArifPn01M6TkQnrm2alGCshPwi8LC6VP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335530483"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="335530483"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 11:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="622435491"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="622435491"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2023 11:02:15 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVGr8-0001e5-2r;
	Thu, 23 Feb 2023 19:02:14 +0000
Date: Fri, 24 Feb 2023 03:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, patrik.r.jakobsson@gmail.com,
	airlied@gmail.com, daniel@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
Message-ID: <202302240250.JspOgN9W-lkp@intel.com>
References: <20230223121733.12549-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223121733.12549-7-tzimmermann@suse.de>

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to drm-misc/drm-misc-next v6.2 v6.2-rc8 v6.2-rc7 next-20230223 v6.2 next-20230223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-gma500-Remove-unnecessary-include-statements/20230223-202205
patch link:    https://lore.kernel.org/r/20230223121733.12549-7-tzimmermann%40suse.de
patch subject: [PATCH 6/7] drm/gma500: Implement client-based fbdev emulation
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230224/202302240250.JspOgN9W-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d1c984af29e0c5219d353a4772527d233d1c1bcc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-gma500-Remove-unnecessary-include-statements/20230223-202205
        git checkout d1c984af29e0c5219d353a4772527d233d1c1bcc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240250.JspOgN9W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/gma500/backlight.c:14:
>> drivers/gpu/drm/gma500/psb_drv.h:620:6: warning: no previous prototype for function 'psb_fbdev_setup' [-Wmissing-prototypes]
   void psb_fbdev_setup(struct drm_psb_private *dev_priv)
        ^
   drivers/gpu/drm/gma500/psb_drv.h:620:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void psb_fbdev_setup(struct drm_psb_private *dev_priv)
   ^
   static 
   1 warning generated.
--
   In file included from drivers/gpu/drm/gma500/psb_irq.c:15:
>> drivers/gpu/drm/gma500/psb_drv.h:620:6: warning: no previous prototype for function 'psb_fbdev_setup' [-Wmissing-prototypes]
   void psb_fbdev_setup(struct drm_psb_private *dev_priv)
        ^
   drivers/gpu/drm/gma500/psb_drv.h:620:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void psb_fbdev_setup(struct drm_psb_private *dev_priv)
   ^
   static 
   drivers/gpu/drm/gma500/psb_irq.c:35:19: warning: unused function 'gma_pipe_event' [-Wunused-function]
   static inline u32 gma_pipe_event(int pipe)
                     ^
   2 warnings generated.


vim +/psb_fbdev_setup +620 drivers/gpu/drm/gma500/psb_drv.h

   610	
   611	/* framebuffer */
   612	extern struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
   613							      const struct drm_mode_fb_cmd2 *mode_cmd,
   614							      struct drm_gem_object *obj);
   615	
   616	/* fbdev */
   617	#if defined(CONFIG_DRM_FBDEV_EMULATION)
   618	void psb_fbdev_setup(struct drm_psb_private *dev_priv);
   619	#else
 > 620	void psb_fbdev_setup(struct drm_psb_private *dev_priv)
   621	{ }
   622	#endif
   623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
