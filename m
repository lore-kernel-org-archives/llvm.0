Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07534A02
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661191200; x=1692727200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CPFy24F8sy/omsQamBjsDDWtFQi9GRtcPb64gkgr7Dg=;
  b=cbpuAb7Qm3OnwiAQOphl89cgetqscSAdEKL7IYiVPIsplwwnhhNwiXyg
   wTX9MLx2MM3RdEkotza89qxgdC+sH26gnanFxrJgNOrYoXMkBZLZpSPL1
   VOE4PXBeraXDOmkVY0NkfQhv8KIijBPm4kn6J97XH9ha3iylts35J9JFU
   +KOQU0XSUMnVb5abDLobOzLbGu/QKroCfYCfWp5443JANl6uYQA3MnQWI
   fekpjSrGucxJnccre7pQ284uJ/utNePL1FpMZuaSScRRoH2/UgRApW+me
   /k7FaDkcMsH45afFSXsYanJ0PD2fvz8vhOtRGr91RrAyIz4IuZPgygCVy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="280455557"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="280455557"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 11:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="751379047"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2022 10:59:58 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQBiQ-0000Y5-12;
	Mon, 22 Aug 2022 17:59:58 +0000
Date: Tue, 23 Aug 2022 01:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: ld.lld: error: undefined symbol: drm_gem_fb_begin_cpu_access
Message-ID: <202208230156.Vo2ozAm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c23f9e627a7b412978b4e852793c5e3c3efc555
commit: 08971eea06db3377ea1f9ff4f95a5df5f6c9aeb7 drm/mipi-dbi: Use framebuffer dma-buf helpers
date:   1 year, 1 month ago
config: x86_64-randconfig-a002-20220822 (https://download.01.org/0day-ci/archive/20220823/202208230156.Vo2ozAm4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=08971eea06db3377ea1f9ff4f95a5df5f6c9aeb7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 08971eea06db3377ea1f9ff4f95a5df5f6c9aeb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_gem_fb_begin_cpu_access
   >>> referenced by drm_mipi_dbi.c:207 (drivers/gpu/drm/drm_mipi_dbi.c:207)
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_gem_fb_end_cpu_access
   >>> referenced by drm_mipi_dbi.c:227 (drivers/gpu/drm/drm_mipi_dbi.c:227)
   >>>               gpu/drm/drm_mipi_dbi.o:(mipi_dbi_buf_copy) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
