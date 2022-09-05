Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1B28EA
	for <llvm@lists.linux.dev>; Mon,  5 Sep 2022 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662362486; x=1693898486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=17ZT4OKFvDSi/SgTCXtfH6eYMUE4tf5dtEeFailkW98=;
  b=mdbM1ARG2P4s4zB0gYq7H+b8AyZrHBpIeaObyt7tuaw9Ue7EcFs1Sod9
   GYxlHSlAmrB5PTl08hwVZHvuB9P9HmV2XXvysm1RNMudm7DzgVuVDLX6h
   xjs5TvSVhhyJcI3bdEmnNju2O3btUrBT0E6QJQ51rutJhFIFOyHJKxnPX
   TPDenaY3C46xABlK8VR41+e202z6eWJFwgp7W2dVpHHaMZviGSuEBz88c
   zvwAco/rVo4blTjrtFL4VGQPKPt0CXtShL/MGm2XmGDEUq0vvHBf6aM8J
   0Ygd+Aokp2RzOrwEY8ndUwlcHQ/FMZ/JyzoZL+TmQn60gpSwzLLqRsocd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10460"; a="360281014"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="360281014"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 00:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="590814484"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Sep 2022 00:21:24 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oV6Q7-0003vd-3B;
	Mon, 05 Sep 2022 07:21:23 +0000
Date: Mon, 5 Sep 2022 15:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4627/4736] WARNING: modpost:
 vmlinux.o(__ex_table+0x0): Section mismatch in reference from the (unknown
 reference) (unknown) to the (unknown reference) .debug_str:(unknown)
Message-ID: <202209051548.Felczun3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
commit: 12c674aa7e797864f36a4e9dbc2cf20930c1f6fe [4627/4736] kbuild: add debug level and macro defs options
config: mips-randconfig-r031-20220905 (https://download.01.org/0day-ci/archive/20220905/202209051548.Felczun3-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c55b41d5199d2394dd6cdb8f52180d8b81d809d4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=12c674aa7e797864f36a4e9dbc2cf20930c1f6fe
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 12c674aa7e797864f36a4e9dbc2cf20930c1f6fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux.o: section mismatch in reference: device_link_add (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: device_link_add (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: dev_driver_string (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: __dev_printk (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: devlink_add_symlinks (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: devlink_add_symlinks (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: devlink_add_symlinks (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: devlink_add_symlinks (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: devlink_add_symlinks (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: devlink_remove_symlinks (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: devlink_remove_symlinks (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: devlink_remove_symlinks (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: devlink_remove_symlinks (section: .text) -> s3c64xx_pin_ctrl (section: .init.rodata)
WARNING: modpost: vmlinux.o: section mismatch in reference: io_watchdog_func (section: .text) -> configfs_init (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: usbtmc_read (section: .text) -> exit_nls_koi8_u (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: usbtmc_read (section: .text) -> init_nls_koi8_u (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: tmio_mmc_probe (section: .text) -> exit_nls_cp950 (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: tmio_mmc_remove (section: .text) -> exit_nls_cp950 (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: tmio_mmc_host_probe (section: .text) -> exit_nls_cp950 (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: renesas_sdhi_probe (section: .text) -> exit_nls_cp950 (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: renesas_sdhi_remove (section: .text) -> exit_nls_cp950 (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: direction_show (section: .text) -> crypto_cts_module_init (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: trace_event_fields_udc_log_req (section: .data) -> rmd160_mod_fini (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: trace_event_fields_udc_log_req (section: .data) -> rmd160_mod_init (section: .init.text)
>> WARNING: modpost: vmlinux.o(__ex_table+0x0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
FATAL: modpost: The relocation at __ex_table+0x0 references
section ".debug_str" which is not executable, IOW
it is not possible for the kernel to fault
at that address.  Something is seriously wrong
and should be fixed.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
