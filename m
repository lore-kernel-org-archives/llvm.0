Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019E87E
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 01:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654046797; x=1685582797;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xp9WA+7bkXHS1Ye6wOA0qonSu1pSRFAyDKHFNB4ym9A=;
  b=Ax/3zgVndu1ZNPpUMx4ppiSM8o+aP3fDBrPG5JzPTjBJqSe3UnQUPwto
   KAA0IGegB2P2Og+ZS0OKFjueG3sRSAr7SH8rvZd25seHYbQEUNAMpr6xI
   amFeDsD8sfP7XMg8JZHNr/vp8oleMwMI0UqdtxsAJJKN0P6Y0iLA2FX2M
   +5/L8DwcDzOJf6KiSFX7c/Ork9mixDGSGXXX0fMJEWo8OOYRH7420mKCf
   QcFAK1usyxUf7mGkEq0uM3I5WdiEpcCbacq2JJIyFfNJzi1vcmaohOSO+
   VcNkX/adUwFa1kOzUQPY2Pp1Os7nL43IX4LNj9R5GxCOXMOBmF9ppcJBH
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="300787671"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="300787671"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 18:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="720561154"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 May 2022 18:26:36 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwD88-0003Kh-0J;
	Wed, 01 Jun 2022 01:26:36 +0000
Date: Wed, 1 Jun 2022 09:26:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [stable:linux-5.17.y 2088/2645] ld.lld: error:
 init/built-in.a(initramfs.o):(function wait_for_initramfs: .text+0x2c):
 relocation R_RISCV_HI20 out of range: 535133 is not in [-524288, 524287];
 references wait_for_initramfs.__if_trace.0
Message-ID: <202206010956.rOpdU4dr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Daniel Starke <daniel.starke@siemens.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.17.y
head:   39555c443b4f5c2406e81d4ad66224f963e43d23
commit: 5c2ac89f540bbfad7ae5156e3356bdf47731e52a [2088/2645] tty: n_gsm: fix wrong DLCI release order
config: riscv-randconfig-r042-20220529 (https://download.01.org/0day-ci/archive/20220601/202206010956.rOpdU4dr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0776c48f9b7e69fa447bee57c7c0985caa856be9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=5c2ac89f540bbfad7ae5156e3356bdf47731e52a
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.17.y
        git checkout 5c2ac89f540bbfad7ae5156e3356bdf47731e52a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(initramfs.o):(function wait_for_initramfs: .text+0x2c): relocation R_RISCV_HI20 out of range: 535133 is not in [-524288, 524287]; references wait_for_initramfs.__if_trace.0
   >>> referenced by initramfs.c
   >>> defined in init/built-in.a(initramfs.o)
--
>> ld.lld: error: init/built-in.a(initramfs.o):(function wait_for_initramfs: .text+0x20): relocation R_RISCV_HI20 out of range: 535848 is not in [-524288, 524287]; references initramfs_cookie
   >>> referenced by initramfs.c
   >>> defined in init/built-in.a(initramfs.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
