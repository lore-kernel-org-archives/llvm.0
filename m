Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386E3D61
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663155481; x=1694691481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ChpsJOCbWEiNwO2FqMWNtvFuQxOIOOWWobtbp+M73i0=;
  b=GJXbE4YcD2EoyB6itHIK4xhIzPp1dIf8CTfPqB/A+bbdtIi4XsXNRsAi
   jboUAvGXpJB4KtOx470kHACYqbWykIz9YaRkHnIU/k7TFwY+WU5EX28AL
   kgNCHNX6odLjPgGwIHAHXXpdYb+ufFcGcIxjcfgE/G0+JglyZs07AigmN
   mlxWSlj/Hbnh1OV3mR5N/0wTjp/G44fFJDuSThL9kZr9aMWtm8vW96q+Q
   RO4hCYDoTuuqkoW8cKPuxHoIcVYlCmDN30B3J5NEytiE7sOeJF4V8h0La
   EKZle3FRRQyVekpoO9ryiryT1CyzJeDJHcN2TTXYvQFCCbNRH6/Hjc/i7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="295993093"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="295993093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 04:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; 
   d="scan'208";a="650049243"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Sep 2022 04:37:59 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYQiM-00009L-1l;
	Wed, 14 Sep 2022 11:37:58 +0000
Date: Wed, 14 Sep 2022 19:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 6256/7172] arch/riscv/errata/thead/errata.c:40:2:
 error: use of undeclared identifier 'riscv_cbom_block_size'
Message-ID: <202209141913.Nxzv3hwM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f117c01187301a087412bd6697fcf5463cb427d8
commit: 8f7e001e0325de63a42f23342ac3b8139150c5cf [6256/7172] RISC-V: Clean up the Zicbom block size probing
config: riscv-randconfig-r042-20220914 (https://download.01.org/0day-ci/archive/20220914/202209141913.Nxzv3hwM-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8f7e001e0325de63a42f23342ac3b8139150c5cf
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8f7e001e0325de63a42f23342ac3b8139150c5cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/errata/thead/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/errata/thead/errata.c:40:2: error: use of undeclared identifier 'riscv_cbom_block_size'
           riscv_cbom_block_size = L1_CACHE_BYTES;
           ^
   1 error generated.


vim +/riscv_cbom_block_size +40 arch/riscv/errata/thead/errata.c

    29	
    30	static bool errata_probe_cmo(unsigned int stage,
    31				     unsigned long arch_id, unsigned long impid)
    32	{
    33	#ifdef CONFIG_ERRATA_THEAD_CMO
    34		if (arch_id != 0 || impid != 0)
    35			return false;
    36	
    37		if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
    38			return false;
    39	
  > 40		riscv_cbom_block_size = L1_CACHE_BYTES;
    41		riscv_noncoherent_supported();
    42		return true;
    43	#else
    44		return false;
    45	#endif
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
