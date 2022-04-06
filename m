Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AF07E
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 05:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649223412; x=1680759412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vfg10iVRd5W+kiXO3Ssd8ncZ/ubfKh1O5PfYGQDGXFk=;
  b=Z41oq9WnNxgxiZ1FsfVU7HQn5T31IIQtEAef6Lh7isUlIGaSZHEZyuQB
   UZBReH0Tb4wZ4+s0sgiggiQdiAdEubqZApHwDC7dsiW/uOCFAlhHRpwC/
   Mmdm5/RxjXnW0ogWGRR7xOYFNMkOiqPs25bx9Np+Rw1OHEza16oAHLUip
   hYvTFG1IrG14yWiySgoJhdSQp91mdmgwP5vskEENB+Gh1J/KvoW0vpiNV
   IqrybpK9F9UL3Iq0azgNGn3wkw84LOz0g048jiRLLQIIAJ28TWmwtS2gv
   jCZaqgcoDbpJtJ6xEG5kE+yZhIAFyb0M59fyYMQzTjDLjVoCkiOSexDHw
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="285920474"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="285920474"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 22:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="549389677"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2022 22:36:49 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbyLZ-00046z-7U;
	Wed, 06 Apr 2022 05:36:49 +0000
Date: Wed, 6 Apr 2022 13:35:53 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 09/10] mm/slab: Simplify create_kmalloc_cache() args and
 make it static
Message-ID: <202204061348.mo7QK7AD-lkp@intel.com>
References: <20220405135758.774016-10-catalin.marinas@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405135758.774016-10-catalin.marinas@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Catalin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
base:   https://github.com/hnaz/linux-mm master
config: riscv-buildonly-randconfig-r004-20220405 (https://download.01.org/0day-ci/archive/20220406/202204061348.mo7QK7AD-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/594fc15f21ce6de4d37971f717ff4223ab271823
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
        git checkout 594fc15f21ce6de4d37971f717ff4223ab271823
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.data+0x2836c8): Section mismatch in reference from the variable sctp_prot to the variable .init.text:.LBB19_63
The variable sctp_prot references
the variable __init .LBB19_63
If the reference is valid then annotate the
variable with or __refdata (see linux/init.h) or name the variable:


Note: the below error/warnings can be found in parent commit:
<< WARNING: modpost: vmlinux.o(.text+0xf8244): Section mismatch in reference from the function perf_swevent_set_period() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x18d1e0): Section mismatch in reference from the function generic_update_time() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x29fd22): Section mismatch in reference from the function fat_remove_entries() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x2a46b4): Section mismatch in reference from the function fat_fill_inode() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x2a5e8e): Section mismatch in reference from the function fat_read_root() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x2a7412): Section mismatch in reference from the function fat_update_time() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x2a82ae): Section mismatch in reference from the function msdos_rename() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x2a8a1e): Section mismatch in reference from the function inode_inc_iversion() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x2aa840): Section mismatch in reference from the function exfat_lookup() to the function .init.text:set_reset_devices()
<< WARNING: modpost: vmlinux.o(.text+0x2aacd8): Section mismatch in reference from the function exfat_create() to the function .init.text:set_reset_devices()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
