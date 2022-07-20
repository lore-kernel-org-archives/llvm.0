Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7CE4C6D
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658321681; x=1689857681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Pv4abcgEHRqnDlGrOd3z3wOgXcTGp+XPJuexVgMzx0=;
  b=Bur9c+zARe6TL0WLURS+VLewuY+HHrwsvAws7jHPK7GN1hN+zNKWIAhF
   eaEdOg93oTAvbALMVNi55Txm/Np+Xk/6297a0seyDH3egtprTchIo4o2q
   6sRha/8BecC3IhHiejwOqV2UfPCbHjxAfZdFCksQE3xFDuNY2jRcAE/tK
   yMTM5KNIqVaj+5HsmOEwWH+bAgfoNGU8YzRipzKvytdg8+qDdKE7r0hJJ
   EuqApv80hjS2BqFE11RviXCA6dLcFw1D6uiK71W/x3UJEACWQDchYOUTl
   degtPMwbDa6fLKgj+U6KX1BG22ki6uy/nRePHmscWwdO99bKMCzWYfeFO
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="273608080"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="273608080"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 05:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="665847862"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jul 2022 05:54:38 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oE9Dq-0000VZ-8G;
	Wed, 20 Jul 2022 12:54:38 +0000
Date: Wed, 20 Jul 2022 20:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: [kraxel:drm-misc-next 5/11]
 drivers/video/fbdev/aty/radeon_base.c:2246:73: warning: expression which
 evaluates to zero treated as a null pointer constant of type 'const char *'
Message-ID: <202207202040.jS1WcTzN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kraxel.org/linux drm-misc-next
head:   15fced5b051e6e22c228a521a5894b12c2ba0892
commit: 8d69d008f44cb96050c35e64fe940a22dd6b0113 [5/11] fbdev: Convert drivers to aperture helpers
config: powerpc-randconfig-r035-20220718 (https://download.01.org/0day-ci/archive/20220720/202207202040.jS1WcTzN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dd5635541cd7bbd62cd59b6694dfb759b6e9a0d8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        git remote add kraxel git://git.kraxel.org/linux
        git fetch --no-tags kraxel drm-misc-next
        git checkout 8d69d008f44cb96050c35e64fe940a22dd6b0113
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/video/fbdev/aty/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/video/fbdev/aty/radeon_base.c:2246:73: warning: expression which evaluates to zero treated as a null pointer constant of type 'const char *' [-Wnon-literal-null-conversion]
           return aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME, false);
                                                                                  ^~~~~
   1 warning generated.


vim +2246 drivers/video/fbdev/aty/radeon_base.c

  2240	
  2241	static int radeon_kick_out_firmware_fb(struct pci_dev *pdev)
  2242	{
  2243		resource_size_t base = pci_resource_start(pdev, 0);
  2244		resource_size_t size = pci_resource_len(pdev, 0);
  2245	
> 2246		return aperture_remove_conflicting_devices(base, size, KBUILD_MODNAME, false);
  2247	}
  2248	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
