Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C3B17EC
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649230804; x=1680766804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sV9b+cScATro9Da3kwZV40I5CBiv4vmg1Aeg62rfn/Y=;
  b=MlA+dxAV5jWiJ0Azs/aMd1UipurZNbV/Ya97/C3KtlXH9qx9tq78Oniv
   XpAs86XgfTkhh4y1hz6U7eLFu8Tb7fgurqOS1jpXMzXZa/x1HxmRlaiOt
   9CU10nd/uIvRcnqYRRKHZovABArH40vgbHPgl/2trub+3PafHr+3j56RH
   uSKAQvPMAACGEP7VP4FBQIiJ1/6YVbVz236b8817DoX0YjOhot4Il4VR0
   CiNsvrvYr4VHBXnBta4JbaJPWHDtiyW5JFd+uL57+5NV9s28SMOW7w3me
   9TAIX3RpjPEZmVBUuNDSFg2yKboSQXOz59slFCdpSD/5F+2Xabf6v4xK/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="260674247"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="260674247"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 00:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="588266160"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2022 00:39:53 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nc0Ge-0004Bn-Fh;
	Wed, 06 Apr 2022 07:39:52 +0000
Date: Wed, 6 Apr 2022 15:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:paulmck/linux-rcu/rcu/next 103/110] WARNING:
 modpost: vmlinux.o(.text+0x9deeba): Section mismatch in reference from the
 function spi_dv_device_work_wrapper() to the function
 .exit.text:test_ww_mutex_exit()
Message-ID: <202204061528.kzz0m3tZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/rcu/next
head:   d0c78768fd9c838d9c4f1965a33ce7f51f16a319
commit: d00674235d8d0e85006ad5b107a266e2c7ee594d [103/110] srcu: Prevent expedited GPs and blocking readers from consuming CPU
config: riscv-buildonly-randconfig-r004-20220405 (https://download.01.org/0day-ci/archive/20220406/202204061528.kzz0m3tZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/d00674235d8d0e85006ad5b107a266e2c7ee594d
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/rcu/next
        git checkout d00674235d8d0e85006ad5b107a266e2c7ee594d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x9deeba): Section mismatch in reference from the function spi_dv_device_work_wrapper() to the function .exit.text:test_ww_mutex_exit()
The function spi_dv_device_work_wrapper() references a function in an exit section.
Often the function test_ww_mutex_exit() has valid usage outside the exit section
and the fix is to remove the __exit annotation of test_ww_mutex_exit.
--
>> WARNING: modpost: vmlinux.o(.text+0x9e0b08): Section mismatch in reference from the function child_iter() to the function .exit.text:test_ww_mutex_exit()
The function child_iter() references a function in an exit section.
Often the function test_ww_mutex_exit() has valid usage outside the exit section
and the fix is to remove the __exit annotation of test_ww_mutex_exit.
--
>> WARNING: modpost: vmlinux.o(.text+0xa2c6e2): Section mismatch in reference from the function hisi_sas_phy_down() to the function .init.text:set_reset_devices()
The function hisi_sas_phy_down() references
the function __init set_reset_devices().
This is often because hisi_sas_phy_down lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0xa2dc2e): Section mismatch in reference from the function hisi_sas_remove() to the function .init.text:set_reset_devices()
The function hisi_sas_remove() references
the function __init set_reset_devices().
This is often because hisi_sas_remove lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x9eb084): Section mismatch in reference from the function sas_phy_enable() to the function .init.text:set_reset_devices()
The function sas_phy_enable() references
the function __init set_reset_devices().
This is often because sas_phy_enable lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x14b5336): Section mismatch in reference from the function rds_sysctl_init() to the function .meminit.text:init_reserve_notifier()
The function rds_sysctl_init() references
the function __meminit init_reserve_notifier().
This is often because rds_sysctl_init lacks a __meminit
annotation or the annotation of init_reserve_notifier is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x15abf1a): Section mismatch in reference from the function ceph_strings_empty() to the function .init.text:set_reset_devices()
The function ceph_strings_empty() references
the function __init set_reset_devices().
This is often because ceph_strings_empty lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.init.text+0x460f2): Section mismatch in reference from the function scsi_init_devinfo() to the function .exit.text:test_ww_mutex_exit()
The function __init scsi_init_devinfo() references
a function __exit test_ww_mutex_exit().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __exit annotation of
test_ww_mutex_exit() so it may be used outside an exit section.
--
>> WARNING: modpost: vmlinux.o(.init.text+0x7340e): Section mismatch in reference from the function xbc_node_find_next_leaf() to the variable .exit.text:.LBB3_6
The function __init xbc_node_find_next_leaf() references
a variable __exit .LBB3_6.
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __exit annotation of
.LBB3_6 so it may be used outside an exit section.
--
>> WARNING: modpost: vmlinux.o(.init.setup+0x73c): Section mismatch in reference from the variable __setup_debug_boot_weak_hash_enable to the function .exit.text:test_ww_mutex_exit()
The variable __init __setup_debug_boot_weak_hash_enable references
a function __exit test_ww_mutex_exit().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __exit annotation of
test_ww_mutex_exit() so it may be used outside an exit section.
--
>> WARNING: modpost: vmlinux.o(.data+0x179b3c): Section mismatch in reference from the variable iscsi_flashnode_bus to the function .exit.text:test_ww_mutex_exit()
The variable iscsi_flashnode_bus references
the function __exit test_ww_mutex_exit()
If the reference is valid then annotate the
variable with (see linux/init.h) or name the variable:

..

Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb0c7e2): Section mismatch in reference from the function __spi_pump_messages() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb11244): Section mismatch in reference from the function spi_mem_dirmap_read() to the variable .exit.text:.LBB0_3
<< WARNING: modpost: vmlinux.o(.text+0xb46a60): Section mismatch in reference from the function stm32_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb47604): Section mismatch in reference from the function sun4i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4827c): Section mismatch in reference from the function sun6i_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb492f0): Section mismatch in reference from the function synquacer_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4a894): Section mismatch in reference from the function tegra_qspi_remove() to the function .exit.text:test_ww_mutex_exit()
<< WARNING: modpost: vmlinux.o(.text+0xb4cbd6): Section mismatch in reference from the function tegra_spi_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f030): Section mismatch in reference from the function tegra_slink_probe() to the variable .exit.text:.LBB0_4
<< WARNING: modpost: vmlinux.o(.text+0xb4f410): Section mismatch in reference from the function tegra_slink_remove() to the function .exit.text:test_ww_mutex_exit()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
