Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3ED15A7
	for <llvm@lists.linux.dev>; Sat, 25 Jun 2022 02:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656125086; x=1687661086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lhf2cpaLyrgMFW/oM/kAcIqZ1W3FB8AGWbSkn2LzutQ=;
  b=OJD5cvcisbrt2X9Iyf6J8gCuF/kZXAOpvVg9cC7S2L9oxn0G7GhB3YlC
   YFynoK1vDNl4WUns6ar9VmM2y5qWs8Fi1qtTb23SsPkAi9D6+cd/FRZoQ
   eSRo8GcFfarBZg7IG1mY5s/sKPTi0QNTDDza7t+K6a8nJwpV5HtEHTZrx
   U+8SjtGcWA+E435NRIPRcnBssj1YZ7lI7vZQUeav8n1CF6etpyJW8F0cm
   nd1VljNXh0CJfMYV5LefgZGNE8gJTfDUXpGuJ3hv1emD9qYPESah8Aher
   tpHFyDrLn+URzHDaaqsYI9tOVL9GYuhS2fz9M1DTEp+L+LeJyjqJ9+O1a
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="278684607"
X-IronPort-AV: E=Sophos;i="5.92,221,1650956400"; 
   d="scan'208";a="278684607"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 19:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,221,1650956400"; 
   d="scan'208";a="731553152"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jun 2022 19:44:44 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4vmu-0005Bx-4r;
	Sat, 25 Jun 2022 02:44:44 +0000
Date: Sat, 25 Jun 2022 10:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Karsten Graul <kgraul@linux.ibm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: net/smc/smc_llc.c:26:2: warning: field  within 'struct smc_llc_hdr'
 is less aligned than 'union smc_llc_hdr::(anonymous at
 net/smc/smc_llc.c:26:2)' and is usually due to 'struct smc_llc_hdr' being
 packed, which can lead to unaligned accesses
Message-ID: <202206240723.OOu0nUgA-lkp@intel.com>
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
head:   92f20ff72066d8d7e2ffb655c2236259ac9d1c5d
commit: b4ba4652b3f8b7c9bbb5786f8acf4724bdab2196 net/smc: extend LLC layer for SMC-Rv2
date:   8 months ago
config: arm-randconfig-c002-20220622 (https://download.01.org/0day-ci/archive/20220624/202206240723.OOu0nUgA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/

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
