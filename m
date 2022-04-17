Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F37D2567
	for <llvm@lists.linux.dev>; Sun, 17 Apr 2022 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650218518; x=1681754518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/m+JhS2MQX+M3FW9Pzi/1wZPuLIiA4cNo0RmjfwG9g=;
  b=iUsyShtTySHe7F6xdr5pHWblhOe/U8StsCcSi6nH1tUcLI+6P2UPhaTI
   MrKvHn5+DsklnUhMkW++IIKiikCZNTd9gTCpOgtCIYy3Zd0SuVvCbzNHd
   btTohU5+r0ehsj8a276dZ7o6rGaoGX4tjgOQmxgulLMTPkfvMB5ze8go4
   fivO3iFMSZgoUcx2aiu3NlZvQ7LrW6/l1ydq4t8VXPOFYBS1ytHrhzuLS
   /mne1hkZWsY+2oPGtXoASeU6wMxZZQ1IFdNbBmokFQB/CRJK55E5pUl7l
   zSUowD3RwuDoPoEt6tLDSjMgRhrSMOLouPtUkoe1yBDfWbu3mIPOMVjXr
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10320"; a="243987041"
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; 
   d="scan'208";a="243987041"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2022 11:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,267,1643702400"; 
   d="scan'208";a="613368059"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Apr 2022 11:01:55 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ng9De-00044j-OU;
	Sun, 17 Apr 2022 18:01:54 +0000
Date: Mon, 18 Apr 2022 02:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: WARNING: modpost: vmlinux.o(.text+0x1719f9c): Section mismatch in
 reference from the function fxos8700_core_probe() to the function
 .init.text:set_reset_devices()
Message-ID: <202204180155.7WFnHuLm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a2c29ccd9477861b16ddc02c411a6c9665250558
commit: d83ce027a54068fabb70d2c252e1ce2da86784a4 ubsan: no need to unset panic_on_warn in ubsan_epilogue()
date:   4 weeks ago
config: riscv-randconfig-r004-20220408 (https://download.01.org/0day-ci/archive/20220418/202204180155.7WFnHuLm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d83ce027a54068fabb70d2c252e1ce2da86784a4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d83ce027a54068fabb70d2c252e1ce2da86784a4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x1719f9c): Section mismatch in reference from the function fxos8700_core_probe() to the function .init.text:set_reset_devices()
The function fxos8700_core_probe() references
the function __init set_reset_devices().
This is often because fxos8700_core_probe lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x172ef66): Section mismatch in reference from the function al3320a_probe() to the function .init.text:set_reset_devices()
The function al3320a_probe() references
the function __init set_reset_devices().
This is often because al3320a_probe lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x174bf64): Section mismatch in reference from the function bmc150_magn_probe() to the function .init.text:set_reset_devices()
The function bmc150_magn_probe() references
the function __init set_reset_devices().
This is often because bmc150_magn_probe lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x1751f2c): Section mismatch in reference from the function mux_probe() to the function .init.text:set_reset_devices()
The function mux_probe() references
the function __init set_reset_devices().
This is often because mux_probe lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x1764a86): Section mismatch in reference from the function mlx90632_probe() to the function .init.text:set_reset_devices()
The function mlx90632_probe() references
the function __init set_reset_devices().
This is often because mlx90632_probe lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x1766fd4): Section mismatch in reference from the function tmp006_probe() to the function .init.text:set_reset_devices()
The function tmp006_probe() references
the function __init set_reset_devices().
This is often because tmp006_probe lacks a __init
annotation or the annotation of set_reset_devices is wrong.

Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0x43f08a): Section mismatch in reference from the function chksum_update() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x43f0cc): Section mismatch in reference from the function chksum_finup() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x440f76): Section mismatch in reference from the function lzorle_decompress() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x8080ba): Section mismatch in reference from the function ccu_mux_enable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778818): Section mismatch in reference from the function mcb_lpc_probe() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080d8): Section mismatch in reference from the function ccu_mux_disable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778fc6): Section mismatch in reference from the function binderfs_fill_super() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080f6): Section mismatch in reference from the function ccu_mux_is_enabled() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x177ff94): Section mismatch in reference from the function print_binder_transaction_ilocked() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x808148): Section mismatch in reference from the function ccu_mux_set_parent() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x43f08a): Section mismatch in reference from the function chksum_update() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x43f0cc): Section mismatch in reference from the function chksum_finup() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x440f76): Section mismatch in reference from the function lzorle_decompress() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x8080ba): Section mismatch in reference from the function ccu_mux_enable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778818): Section mismatch in reference from the function mcb_lpc_probe() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080d8): Section mismatch in reference from the function ccu_mux_disable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778fc6): Section mismatch in reference from the function binderfs_fill_super() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080f6): Section mismatch in reference from the function ccu_mux_is_enabled() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x177ff94): Section mismatch in reference from the function print_binder_transaction_ilocked() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x808148): Section mismatch in reference from the function ccu_mux_set_parent() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x43f08a): Section mismatch in reference from the function chksum_update() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x43f0cc): Section mismatch in reference from the function chksum_finup() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x440f76): Section mismatch in reference from the function lzorle_decompress() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x8080ba): Section mismatch in reference from the function ccu_mux_enable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778818): Section mismatch in reference from the function mcb_lpc_probe() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080d8): Section mismatch in reference from the function ccu_mux_disable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778fc6): Section mismatch in reference from the function binderfs_fill_super() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080f6): Section mismatch in reference from the function ccu_mux_is_enabled() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x177ff94): Section mismatch in reference from the function print_binder_transaction_ilocked() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x808148): Section mismatch in reference from the function ccu_mux_set_parent() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x43f08a): Section mismatch in reference from the function chksum_update() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x43f0cc): Section mismatch in reference from the function chksum_finup() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x440f76): Section mismatch in reference from the function lzorle_decompress() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x8080ba): Section mismatch in reference from the function ccu_mux_enable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778818): Section mismatch in reference from the function mcb_lpc_probe() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080d8): Section mismatch in reference from the function ccu_mux_disable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778fc6): Section mismatch in reference from the function binderfs_fill_super() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080f6): Section mismatch in reference from the function ccu_mux_is_enabled() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x177ff94): Section mismatch in reference from the function print_binder_transaction_ilocked() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x808148): Section mismatch in reference from the function ccu_mux_set_parent() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x43f08a): Section mismatch in reference from the function chksum_update() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x43f0cc): Section mismatch in reference from the function chksum_finup() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x440f76): Section mismatch in reference from the function lzorle_decompress() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x8080ba): Section mismatch in reference from the function ccu_mux_enable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778818): Section mismatch in reference from the function mcb_lpc_probe() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080d8): Section mismatch in reference from the function ccu_mux_disable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778fc6): Section mismatch in reference from the function binderfs_fill_super() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080f6): Section mismatch in reference from the function ccu_mux_is_enabled() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x177ff94): Section mismatch in reference from the function print_binder_transaction_ilocked() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x808148): Section mismatch in reference from the function ccu_mux_set_parent() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x43f08a): Section mismatch in reference from the function chksum_update() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x43f0cc): Section mismatch in reference from the function chksum_finup() to the function .exit.text:cryptomgr_exit()
<< WARNING: modpost: vmlinux.o(.text+0x440f76): Section mismatch in reference from the function lzorle_decompress() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0x8080ba): Section mismatch in reference from the function ccu_mux_enable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778818): Section mismatch in reference from the function mcb_lpc_probe() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080d8): Section mismatch in reference from the function ccu_mux_disable() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x1778fc6): Section mismatch in reference from the function binderfs_fill_super() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x8080f6): Section mismatch in reference from the function ccu_mux_is_enabled() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x177ff94): Section mismatch in reference from the function print_binder_transaction_ilocked() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x808148): Section mismatch in reference from the function ccu_mux_set_parent() to the function .init.text:set_reset_devices()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
