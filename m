Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E84F53A7
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663338179; x=1694874179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Uq8/Qm9rAnA0pwSxTizcf5pgMVHtsJ+n/ks5w9hDuc=;
  b=Mcq6mbs+OcCFw5slon+nOwk9n85Q0K8pICsYlnjPGPMYx24DKGaWtzb3
   d4DjdoiYWk/VPGXY87+gPxDmz7tP+YDdf/co24hEeYIXC5kwrZOQwIUtv
   SyGqcYvaZdhPvvAul1AtmBeTQjJu0Krnp945Y1KVwbUhf8Gl1N0dXPZzf
   nowyQ6L2/UatcDhauhdPcLpeUv4QxJrQVZqbLg/X6N0Dc2RJXzMuQqGYE
   JwExagcbUfqxSfFYQyXRUTrHBda1q04VyTQ3iEdSItFQiKhM/dfcoy2/7
   Wr17rru9Unq/k4v+ZY/FAk9sftwDaJlzoZ9wvA5FBm/FcW6IP6MWJ1WiP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="325275008"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="325275008"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 07:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="946389479"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 Sep 2022 07:22:57 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZCF6-0001q6-20;
	Fri, 16 Sep 2022 14:22:56 +0000
Date: Fri, 16 Sep 2022 22:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:palmer/linux/vdso-fix-v3 9/9]
 arch/riscv/kernel/vdso.c:26:27: warning: tentative definition of variable
 with internal linkage has incomplete non-array type 'struct __vdso_info'
Message-ID: <202209162203.LQxeIrqT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block palmer/linux/vdso-fix-v3
head:   fcbe4db4bf998e22fc7a35a2e02f6ba3d5ffb5db
commit: fcbe4db4bf998e22fc7a35a2e02f6ba3d5ffb5db [9/9] WIP: riscv: vdso: fix NULL deference in vdso_join_timens() when vfork
config: riscv-randconfig-r022-20220916 (https://download.01.org/0day-ci/archive/20220916/202209162203.LQxeIrqT-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/fcbe4db4bf998e22fc7a35a2e02f6ba3d5ffb5db
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block palmer/linux/vdso-fix-v3
        git checkout fcbe4db4bf998e22fc7a35a2e02f6ba3d5ffb5db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/ drivers/char/pcmcia/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/vdso.c:26:27: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct __vdso_info' [-Wtentative-definition-incomplete-type]
   static struct __vdso_info vdso_info;
                             ^
   arch/riscv/kernel/vdso.c:26:15: note: forward declaration of 'struct __vdso_info'
   static struct __vdso_info vdso_info;
                 ^
   arch/riscv/kernel/vdso.c:29:27: warning: tentative definition of variable with internal linkage has incomplete non-array type 'struct __vdso_info' [-Wtentative-definition-incomplete-type]
   static struct __vdso_info compat_vdso_info;
                             ^
   arch/riscv/kernel/vdso.c:26:15: note: forward declaration of 'struct __vdso_info'
   static struct __vdso_info vdso_info;
                 ^
   2 warnings generated.


vim +26 arch/riscv/kernel/vdso.c

    24	
    25	extern char vdso_start[], vdso_end[];
  > 26	static struct __vdso_info vdso_info;
    27	#ifdef CONFIG_COMPAT
    28	extern char compat_vdso_start[], compat_vdso_end[];
    29	static struct __vdso_info compat_vdso_info;
    30	#endif
    31	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
