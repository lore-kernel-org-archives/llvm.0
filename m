Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B4C2C9C
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 05:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641792370; x=1673328370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04XjPUd5I3uXPOgfXYDSNAJy4WDjy994czFo7/wAE5E=;
  b=gdEP6RdpRktYEBidbttmlSLBnZoV/V6O59Ts0TPg3sQXi0m1kHu7F9LG
   zr5XZd7nZkyr8MhOReX9hlEUK9pLcNgCYLFVU8lTBoHqk7fiNF5ghXXy5
   Jh+GcT/g2HaUxMtYvRA2B3j+H/BX/H8tCoVLnh+dV3VWnuSe79CKq2M1p
   HU+EKsG0on26bZDxcl4rjOXfq6gJsIpy/Zy2dsu1AlzpdTQgifuONGwVo
   J4m1jkC+PhNvaOCa6zmvg481whzlTaEJL8KnD5WK1pWUzrz/1YY7z/q3H
   QPVhl3EXBXL02ANtTRWo9ueg4RytYLmP3xrbt1Dr0sMg2UZeVxRDKwBWz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="243354101"
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="243354101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2022 21:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,276,1635231600"; 
   d="scan'208";a="575709888"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Jan 2022 21:26:07 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6nC3-0002Ge-72; Mon, 10 Jan 2022 05:26:07 +0000
Date: Mon, 10 Jan 2022 13:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Pei <huangpei@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 47/54] sound/pci/ca0106/ca0106.h:62:9:
 warning: 'PTR' macro redefined
Message-ID: <202201101327.4yt7VUmE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   c5c7440fe7f74645940d5c9e2c49cd7efb706a4f
commit: f0b7ddbd794bdffade370f22bb7a774002208ef4 [47/54] MIPS: retire "asm/llsc.h"
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20220110/202201101327.4yt7VUmE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=f0b7ddbd794bdffade370f22bb7a774002208ef4
        git remote add mips-linux https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
        git fetch --no-tags mips-linux mips-next
        git checkout f0b7ddbd794bdffade370f22bb7a774002208ef4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/pci/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from sound/pci/ca0106/ca0106_main.c:156:
>> sound/pci/ca0106/ca0106.h:62:9: warning: 'PTR' macro redefined [-Wmacro-redefined]
   #define PTR                     0x00            /* Indexed register set pointer register        */
           ^
   arch/mips/include/asm/asm.h:288:9: note: previous definition is here
   #define PTR             .word
           ^
   1 warning generated.


vim +/PTR +62 sound/pci/ca0106/ca0106.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  61  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @62  #define PTR			0x00		/* Indexed register set pointer register	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  63  						/* NOTE: The CHANNELNUM and ADDRESS words can	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  64  						/* be modified independently of each other.	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  65  						/* CNL[1:0], ADDR[27:16]                        */
^1da177e4c3f41 Linus Torvalds 2005-04-16  66  

:::::: The code at line 62 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
