Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6398C17C0;
	Sat,  8 Apr 2023 04:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680926980; x=1712462980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I85LnZNyBLif63Nt+7CkFxtYuaxsLLp2R4nv7/uIJo0=;
  b=jRAGIUYcmmsMnShR9r74UKpGLm6gbLxIwQH7i91IJ7C6QG4Y+RKUDlKk
   IWibkDXYBghfJmyGySAS0FAA4XvU232lEZ+Y94qMN57boUZ09FW9OVm7j
   jxcpm8xKUFVNEn09G4cvbuaU+iMuHDaosBLRKvfAOZa1j3Ga1Hgk6J6uN
   3YLt9iN8FKzbeC4+ChOu1JeeLmC/C1Krx1SInp/K1UpOpM25+DwIS1cnT
   3XmO+epC/nAaNtt2hG3sgQOSKiBA1feZIpHAKtefHBqjWnhIDBqEIz1s5
   eBzf/qv1cqzLO+Yh3MY5KK3e0+y2wqWXxSoa+RaEAPG/t5f6dyN9DRwId
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341861523"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="341861523"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 21:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="831368603"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="831368603"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2023 21:09:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkztH-000TIP-1p;
	Sat, 08 Apr 2023 04:09:27 +0000
Date: Sat, 8 Apr 2023 12:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Karol Herbst <kherbst@redhat.com>,
	Jani Nikula <jani.nikula@intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 2/2] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for
 reading IOR state
Message-ID: <202304081129.AMXCmyn2-lkp@intel.com>
References: <20230407222133.1425969-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407222133.1425969-2-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/drm-nouveau-kms-Add-INHERIT-ioctl-to-nvkm-nvif-for-reading-IOR-state/20230408-062329
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230407222133.1425969-2-lyude%40redhat.com
patch subject: [PATCH 2/2] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
config: arm64-buildonly-randconfig-r001-20230403 (https://download.01.org/0day-ci/archive/20230408/202304081129.AMXCmyn2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a3d963915cf6f2d87b57146f7bc57a6a89d90cf6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lyude-Paul/drm-nouveau-kms-Add-INHERIT-ioctl-to-nvkm-nvif-for-reading-IOR-state/20230408-062329
        git checkout a3d963915cf6f2d87b57146f7bc57a6a89d90cf6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081129.AMXCmyn2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/dispnv50/disp.c:2554:1: warning: no previous prototype for function 'nv50_display_read_hw_state' [-Wmissing-prototypes]
   nv50_display_read_hw_state(struct nouveau_drm *drm)
   ^
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2553:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2618:1: warning: no previous prototype for function 'nv50_display_create' [-Wmissing-prototypes]
   nv50_display_create(struct drm_device *dev)
   ^
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2617:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   2 warnings generated.


vim +/nv50_display_read_hw_state +2554 drivers/gpu/drm/nouveau/dispnv50/disp.c

  2551	
  2552	/* Read back the currently programmed display state */
  2553	void
> 2554	nv50_display_read_hw_state(struct nouveau_drm *drm)
  2555	{
  2556		struct drm_device *dev = drm->dev;
  2557		struct drm_encoder *encoder;
  2558		struct drm_modeset_acquire_ctx ctx;
  2559		struct nv50_disp *disp = nv50_disp(dev);
  2560		int ret;
  2561	
  2562		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
  2563	
  2564		drm_for_each_encoder(encoder, dev) {
  2565			if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
  2566				continue;
  2567	
  2568			nv50_display_read_hw_or_state(dev, disp, nouveau_encoder(encoder));
  2569		}
  2570	
  2571		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
  2572	}
  2573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
