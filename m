Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4CF7C
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 08:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663402191; x=1694938191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7W8jqt61giXCLdgAFKdnTy3mAba1l5HB3NWMC7GsU+M=;
  b=gzYzr9IgWkqxBh12V/wjrmgSdI4LtNPP9+Mn93Nw9KOyF3qlCg6ZwaLb
   92okf8ZF0c1PMLpYxsF0sFtXUg0hk6qrfwDD02i/a0SzZpihiBe1l6SXZ
   OTSKIqFaUrIpxUFGu3ivGs6QMklDLqNWTkcjW+u/Xe7YpOEnn0mJzeACJ
   Ylz/Tq6J7/rMOw+cRdJpovnQvilCCXabeSdxxkNAAQyKqxik3s4tkSYJv
   h+6jS7q6vMo7YInGzB0747NsCxjE/XIwI3180gEa5bvFw3mqDvqGReob2
   IMfxSZo2mWQ++MaP92y5xFR8dzNFXMYUQWmghdNlUy2KZoQe7Q8yaSztQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="299957958"
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="299957958"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 01:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="648527109"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 17 Sep 2022 01:09:49 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZStZ-00008t-07;
	Sat, 17 Sep 2022 08:09:49 +0000
Date: Sat, 17 Sep 2022 16:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: Karsten Graul <kgraul@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: net/smc/smc_llc.c:26:2: warning: field  within 'struct smc_llc_hdr'
 is less aligned than 'union smc_llc_hdr::(anonymous at
 net/smc/smc_llc.c:26:2)' and is usually due to 'struct smc_llc_hdr' being
 packed, which can lead to unaligned accesses
Message-ID: <202209171512.qcgXdSrG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Karsten,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a335366bad1364a07f49df9da1fdfa6d411a5f39
commit: b4ba4652b3f8b7c9bbb5786f8acf4724bdab2196 net/smc: extend LLC layer for SMC-Rv2
date:   11 months ago
config: arm-buildonly-randconfig-r005-20220917 (https://download.01.org/0day-ci/archive/20220917/202209171512.qcgXdSrG-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4ba4652b3f8b7c9bbb5786f8acf4724bdab2196
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b4ba4652b3f8b7c9bbb5786f8acf4724bdab2196
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/smc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/smc/smc_llc.c:26:2: warning: field  within 'struct smc_llc_hdr' is less aligned than 'union smc_llc_hdr::(anonymous at net/smc/smc_llc.c:26:2)' and is usually due to 'struct smc_llc_hdr' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           union {
           ^
   1 warning generated.


vim +26 net/smc/smc_llc.c

    23	
    24	struct smc_llc_hdr {
    25		struct smc_wr_rx_hdr common;
  > 26		union {
    27			struct {
    28				u8 length;	/* 44 */
    29		#if defined(__BIG_ENDIAN_BITFIELD)
    30				u8 reserved:4,
    31				   add_link_rej_rsn:4;
    32	#elif defined(__LITTLE_ENDIAN_BITFIELD)
    33				u8 add_link_rej_rsn:4,
    34				   reserved:4;
    35	#endif
    36			};
    37			u16 length_v2;	/* 44 - 8192*/
    38		};
    39		u8 flags;
    40	} __packed;		/* format defined in
    41				 * IBM Shared Memory Communications Version 2
    42				 * (https://www.ibm.com/support/pages/node/6326337)
    43				 */
    44	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
