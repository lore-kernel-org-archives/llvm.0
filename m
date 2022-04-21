Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F063723A0
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 20:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650572806; x=1682108806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y8unbK9Ek6KCDiTDsxDHyypG4mp4nnlyjAuZ37/RS2g=;
  b=lhLlDqrPW6MaEvPU7ExoxWP3epH/JusQG7ArSjQ4uUPo9HR97WbEhO6Q
   v2gXkpV7RvPpgwVMm/wi9MhOyZjtjUX4cJnPaI5+taL/bBlcuif8pXM0g
   wWPTE9wBUZyPmTEU+dSsUaFrZjsDUoASJUHLePxK5T+nLmGtVX/09YtKe
   YMMtmbFBqxdz/HTV3Mnplbsz87Jx/PDpjsXMPvJEyBpbUHz1LOagZ6Utp
   LZMOIEutQdQjsGA4Y2rWajxGDgbiaDQotzzbcfTcw/vMfMh8axu7XlChS
   9nxenBeH9VXj4+R+if9BfUrODkTdWFa7NKCGTcTDPGOVwR82nPGqkKqLw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245045179"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="245045179"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 13:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; 
   d="scan'208";a="577452614"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Apr 2022 13:26:45 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhdO0-0008l8-BL;
	Thu, 21 Apr 2022 20:26:44 +0000
Date: Fri, 22 Apr 2022 04:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [norov:bitmap 45/47] lib/bitmap.c:1570:17: error: initializing
 'unsigned long *' with an expression of type 'const unsigned long *'
 discards qualifiers
Message-ID: <202204220430.uHgyhQL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux bitmap
head:   29f3046c8c2929f8dbe5e1cb4f25ebdd5366ebe7
commit: f1cbd19c47bf73d532ff30571601c7ede57d5f82 [45/47] lib: add bitmap_{from,to}_arr64
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20220422/202204220430.uHgyhQL9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/norov/linux/commit/f1cbd19c47bf73d532ff30571601c7ede57d5f82
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov bitmap
        git checkout f1cbd19c47bf73d532ff30571601c7ede57d5f82
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/bitmap.c:1570:17: error: initializing 'unsigned long *' with an expression of type 'const unsigned long *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           unsigned long *end = bitmap + BITS_TO_LONGS(nbits);
                          ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/bitmap.c:1575:22: warning: shift count >= width of type [-Wshift-count-overflow]
                           *buf |= *bitmap++ << 32;
                                             ^  ~~
   1 warning and 1 error generated.


vim +1570 lib/bitmap.c

  1561	
  1562	/**
  1563	 * bitmap_to_arr64 - copy the contents of bitmap to a u64 array of bits
  1564	 *	@buf: array of u64 (in host byte order), the dest bitmap
  1565	 *	@bitmap: array of unsigned longs, the source bitmap
  1566	 *	@nbits: number of bits in @bitmap
  1567	 */
  1568	void bitmap_to_arr64(u64 *buf, const unsigned long *bitmap, unsigned int nbits)
  1569	{
> 1570		unsigned long *end = bitmap + BITS_TO_LONGS(nbits);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
