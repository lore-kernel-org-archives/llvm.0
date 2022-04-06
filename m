Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83A219D
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 02:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649210567; x=1680746567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qw4BWEinEx3D+pI/Y4QH6KOMzTg4JbRJZI+r3M+rlxQ=;
  b=IGn3a2ldP/R74uHH3PmFpHBpImGNbRpL07aLoKw04iWos8sSZS+LROJS
   r1QlIjiTR+7RginBPcXAgcMYH8oJLps5Xj/MNuexOVRwghBGoOzJiczyw
   8OKyw28E5cNoQH0RM1MyO4TiIPOqnBCJLUYMpOHF6Kxm9NwCFTYHDG46j
   BQK6KnQemBajxFniy+Tu4JIn0B2kTjquc2q0SBPlW0Ek06Hr5GwLeAaL/
   sypDJYYsGxzoGUBCbMNhw/a/gHOvgK/nioemrqiB+5O7F5fq2Jmpmulnc
   gUTf2IEyL0uT/Jdh7HY6jDDnVRfS1M3Zd+1CohJlrWX+SD/LagzHga1x3
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="261101662"
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="261101662"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 19:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,238,1643702400"; 
   d="scan'208";a="505534342"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Apr 2022 19:02:45 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbv0O-0003yt-Fx;
	Wed, 06 Apr 2022 02:02:44 +0000
Date: Wed, 6 Apr 2022 10:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 01/10] mm/slab: Decouple ARCH_KMALLOC_MINALIGN from
 ARCH_DMA_MINALIGN
Message-ID: <202204060957.sHGvCxYf-lkp@intel.com>
References: <20220405135758.774016-2-catalin.marinas@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405135758.774016-2-catalin.marinas@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Catalin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
base:   https://github.com/hnaz/linux-mm master
config: riscv-buildonly-randconfig-r004-20220405 (https://download.01.org/0day-ci/archive/20220406/202204060957.sHGvCxYf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4b3dfcfcd58dc57d321559e467e85ce909539755
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
        git checkout 4b3dfcfcd58dc57d321559e467e85ce909539755
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0xf8244): Section mismatch in reference from the function perf_swevent_set_period() to the function .init.text:set_reset_devices()
The function perf_swevent_set_period() references
the function __init set_reset_devices().
This is often because perf_swevent_set_period lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x18d1dc): Section mismatch in reference from the function generic_update_time() to the function .init.text:set_reset_devices()
The function generic_update_time() references
the function __init set_reset_devices().
This is often because generic_update_time lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x29fd1e): Section mismatch in reference from the function fat_remove_entries() to the function .init.text:set_reset_devices()
The function fat_remove_entries() references
the function __init set_reset_devices().
This is often because fat_remove_entries lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x2a46b0): Section mismatch in reference from the function fat_fill_inode() to the function .init.text:set_reset_devices()
The function fat_fill_inode() references
the function __init set_reset_devices().
This is often because fat_fill_inode lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x2a5e8a): Section mismatch in reference from the function fat_read_root() to the function .init.text:set_reset_devices()
The function fat_read_root() references
the function __init set_reset_devices().
This is often because fat_read_root lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x2a740e): Section mismatch in reference from the function fat_update_time() to the function .init.text:set_reset_devices()
The function fat_update_time() references
the function __init set_reset_devices().
This is often because fat_update_time lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x2a82aa): Section mismatch in reference from the function msdos_rename() to the function .init.text:set_reset_devices()
The function msdos_rename() references
the function __init set_reset_devices().
This is often because msdos_rename lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x2a8a1a): Section mismatch in reference from the function inode_inc_iversion() to the function .init.text:set_reset_devices()
The function inode_inc_iversion() references
the function __init set_reset_devices().
This is often because inode_inc_iversion lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x2aa83c): Section mismatch in reference from the function exfat_lookup() to the function .init.text:set_reset_devices()
The function exfat_lookup() references
the function __init set_reset_devices().
This is often because exfat_lookup lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x2aacd4): Section mismatch in reference from the function exfat_create() to the function .init.text:set_reset_devices()
The function exfat_create() references
the function __init set_reset_devices().
This is often because exfat_create lacks a __init
annotation or the annotation of set_reset_devices is wrong.
--
>> WARNING: modpost: vmlinux.o(.text+0x228148): Section mismatch in reference from the function ext4_readdir() to the function .init.text:set_reset_devices()
The function ext4_readdir() references
the function __init set_reset_devices().
This is often because ext4_readdir lacks a __init
annotation or the annotation of set_reset_devices is wrong.
..

Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb2412): Section mismatch in reference from the function bpf_check_uarg_tail_zero() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb24b8): Section mismatch in reference from the function bpf_map_area_alloc() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b16): Section mismatch in reference from the function bpf_obj_pin() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5b54): Section mismatch in reference from the function bpf_obj_get() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5ba4): Section mismatch in reference from the function bpf_prog_attach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5d2e): Section mismatch in reference from the function bpf_prog_detach() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5db8): Section mismatch in reference from the function bpf_prog_query() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5e38): Section mismatch in reference from the function bpf_prog_test_run() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5f1c): Section mismatch in reference from the function bpf_obj_get_next_id() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0xb5fba): Section mismatch in reference from the function bpf_prog_get_fd_by_id() to the function .init.text:set_reset_devices()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
