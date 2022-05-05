Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8652CA4
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651784849; x=1683320849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=emk+u4QGTOihANvtJGusMZwI7AXthtuoRKkv+2jjuq8=;
  b=PJuyqMNu8Yk+h3tRW5GFPIF1ZB2xjvVwPAiOli3tNyiZv7X6Nfe69SGM
   1IazLASRFdiOypmVsqMpZkImJfJXnIwfyGTA08SWY8JenfZYvgWIBGgC2
   FpkA5JFB0gm+sQjYGnsqFVBvNJxlr1J32sCC/0iT5q6qEJN5YkTDEEAJH
   egUkfea9WKUMKu7eqvhH0HTjjK0IdBTmKCR4dJNcEfs4sw1pdSOgn1HmM
   9kln/QfmG+7ITIaQOz63CbJbaCGGDRsfvRlra1/KvvtkEZS80ZtwmoxSQ
   ofpgzXAo7OOrKZYkZtVydKDBHvqKK3ImEcqRDSveGcwLU7RDv4YorvoYx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="293455120"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="293455120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 14:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="709126636"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 May 2022 14:06:51 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmigV-000Cl4-2W;
	Thu, 05 May 2022 21:06:51 +0000
Date: Fri, 6 May 2022 05:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
	jfalempe@redhat.com, daniel@ffwll.ch
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/mgag200: Fail on I2C initialization errors
Message-ID: <202205060439.bfJ2FmzU-lkp@intel.com>
References: <20220505152244.413-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505152244.413-1-tzimmermann@suse.de>

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip tegra-drm/drm/tegra/for-next v5.18-rc5 next-20220505]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-mgag200-Fail-on-I2C-initialization-errors/20220505-234643
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220506/202205060439.bfJ2FmzU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/11682b9fc557a02edac08b0dedc91ce704c2f749
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/drm-mgag200-Fail-on-I2C-initialization-errors/20220505-234643
        git checkout 11682b9fc557a02edac08b0dedc91ce704c2f749
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/mgag200/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mgag200/mgag200_mode.c:819:47: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   drm_err(dev, "failed to add DDC bus: %d\n", ret);
                                                               ^~~
   include/drm/drm_print.h:438:46: note: expanded from macro 'drm_err'
           __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
                                                       ^~~~~~~~~~~
   include/drm/drm_print.h:425:48: note: expanded from macro '__drm_printk'
           dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
                                                         ^~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                       ^~~~~~~~~~~
   drivers/gpu/drm/mgag200/mgag200_mode.c:815:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +819 drivers/gpu/drm/mgag200/mgag200_mode.c

   808	
   809	static int mgag200_vga_connector_init(struct mga_device *mdev)
   810	{
   811		struct drm_device *dev = &mdev->base;
   812		struct mga_connector *mconnector = &mdev->connector;
   813		struct drm_connector *connector = &mconnector->base;
   814		struct mga_i2c_chan *i2c;
   815		int ret;
   816	
   817		i2c = mgag200_i2c_create(dev);
   818		if (IS_ERR(i2c)) {
 > 819			drm_err(dev, "failed to add DDC bus: %d\n", ret);
   820			return PTR_ERR(i2c);
   821		}
   822	
   823		ret = drm_connector_init_with_ddc(dev, connector,
   824						  &mga_vga_connector_funcs,
   825						  DRM_MODE_CONNECTOR_VGA,
   826						  &i2c->adapter);
   827		if (ret)
   828			goto err_mgag200_i2c_destroy;
   829		drm_connector_helper_add(connector, &mga_vga_connector_helper_funcs);
   830	
   831		mconnector->i2c = i2c;
   832	
   833		return 0;
   834	
   835	err_mgag200_i2c_destroy:
   836		mgag200_i2c_destroy(i2c);
   837		return ret;
   838	}
   839	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
