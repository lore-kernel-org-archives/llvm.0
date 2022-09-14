Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1602561
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 05:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663132751; x=1694668751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zs/nU3jdhfF/Tuo2sh/sQZjk2vbK/z1YJgI0Nzv2KRQ=;
  b=UhaO9Wlsl803BwSYaUqljI1BOdIEDs1Mavl7ycY/1Ih+h4mcbxc2gbHV
   Birm8zxfzC5PSYvRXbtv0xgtKlQLhi0nioDifTTv9vg/9PHp2vhnpPHY3
   C3LRGG/lwPLudYq/sm48Y+hAi7cWy0gferVR6WBEThkuwk7oZicSVo2Zz
   oniFkkVTMG+IhSkrrr7lDqmdne0E6Gd8vRf6YgH8/nnypD67iYvKAFMyZ
   Po6O1yD3N5cbGRP+Rdzdgk3DvrCRqak9SYer5jgIdZRxMaweEs9eRWbFR
   Oy6MBEXZHK6VGqvEt9MhVwj+rWe2wPsKQ19KOVoBrZftUmNnTuf+OPv9J
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="299693467"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="299693467"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 22:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="594241604"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Sep 2022 22:19:09 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYKnk-0004Ov-2n;
	Wed, 14 Sep 2022 05:19:08 +0000
Date: Wed, 14 Sep 2022 13:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: YunQiang Su <yunqiang.su@cipunited.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: arch/mips/boot/compressed/uart-16550.c:44:6: warning: no previous
 prototype for function 'putc'
Message-ID: <202209141345.SIXtlp0W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi YunQiang,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d1221cea11fca0f6946bdd032a45b22cecfc0f99
commit: 31b2f3dc851c65fee288612432c4fc956f1a264e MIPS: enable both vmlinux.gz.itb and vmlinuz for generic
date:   9 months ago
config: mips-buildonly-randconfig-r002-20220914 (https://download.01.org/0day-ci/archive/20220914/202209141345.SIXtlp0W-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=31b2f3dc851c65fee288612432c4fc956f1a264e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 31b2f3dc851c65fee288612432c4fc956f1a264e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/mips/boot/compressed/uart-16550.c:44:6: warning: no previous prototype for function 'putc' [-Wmissing-prototypes]
   void putc(char c)
        ^
   arch/mips/boot/compressed/uart-16550.c:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void putc(char c)
   ^
   static 
   1 warning generated.


vim +/putc +44 arch/mips/boot/compressed/uart-16550.c

1b93b3c3e94be2 Wu Zhangjin 2009-10-14  43  
1b93b3c3e94be2 Wu Zhangjin 2009-10-14 @44  void putc(char c)

:::::: The code at line 44 was first introduced by commit
:::::: 1b93b3c3e94be2605759735a89fc935ba5f58dcf MIPS: Add support for GZIP / BZIP2 / LZMA compressed kernel images

:::::: TO: Wu Zhangjin <wuzhangjin@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
