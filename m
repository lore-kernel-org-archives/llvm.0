Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289531867
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663066624; x=1694602624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BL9ydBtVwfEgQDpu1HgFXSFKo0fJNzYIDkD86bRaHYg=;
  b=BMcVZ8KKyhEPr7QLRMcf1o5gTLOdK0Iw5KcVQckGmtLZdU2siVOSVkyU
   AUFgg9y/d9yzL6YkZyFdQZbElplfwJNAd7HcIaBTJn/MJEUfbE4Vz1PsQ
   ZAnRno0RWxCOeQWgCea0+AHXcM8f1mDG+pbMuWVM27xsgJwoZsFdezXkg
   lAjvoZdwduRFjK4l+32k6aU6LWM86f21Apji+Td/rDJUzzjRcxn5zx1C9
   UTnrPVar/UTv+HGvSoA837SRm6jycF1/+amtR1m+nyfbM8/I6o18m+pwW
   +Oycn1PCAA7iwe+jRCVOopnfbGcimMV4CwLl0N8YHEgbG1LMnUKP8/3kk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="295698231"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="295698231"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 03:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; 
   d="scan'208";a="861511473"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 13 Sep 2022 03:57:01 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oY3bB-0003WM-0Y;
	Tue, 13 Sep 2022 10:57:01 +0000
Date: Tue, 13 Sep 2022 18:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>
Subject: [palmer:riscv-zicbom_fix 7/7] arch/riscv/mm/dma-noncoherent.c:15:14:
 error: redefinition of 'riscv_cbom_block_size' with a different type:
 'unsigned int' vs 'int'
Message-ID: <202209131858.0qmW0TEk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git riscv-zicbom_fix
head:   933c80bff1907722a069a0d8bdce283183e4b203
commit: 933c80bff1907722a069a0d8bdce283183e4b203 [7/7] RISC-V: Clean up the Zicbom block size probing
config: riscv-buildonly-randconfig-r005-20220912 (https://download.01.org/0day-ci/archive/20220913/202209131858.0qmW0TEk-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=933c80bff1907722a069a0d8bdce283183e4b203
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer riscv-zicbom_fix
        git checkout 933c80bff1907722a069a0d8bdce283183e4b203
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/riscv/mm/dma-noncoherent.c:15:14: error: redefinition of 'riscv_cbom_block_size' with a different type: 'unsigned int' vs 'int'
   unsigned int riscv_cbom_block_size;
                ^
   arch/riscv/include/asm/cacheflush.h:46:12: note: previous declaration is here
   extern int riscv_cbom_block_size;
              ^
   1 error generated.


vim +15 arch/riscv/mm/dma-noncoherent.c

    14	
  > 15	unsigned int riscv_cbom_block_size;
    16	static bool noncoherent_supported;
    17	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
