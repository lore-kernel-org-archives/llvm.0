Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF34133C9;
	Fri, 17 Mar 2023 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679055021; x=1710591021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=74x+HdYibsA/wqEfWvcwgYAGJ9bXo0e4vgKCvjJbqwQ=;
  b=mM+saRWaqmdVooBI1v7MNmVoB1Tldzx52fS+X4HuoSIujTrjH80wfkj8
   hzq4GTbH1PLfUDnZzaPYSvbCZPBsrX03nO1zJ1snJpbyxJFI1yMtILY9x
   sPRhKhjxSP1wogBHCFfKF97P/owlv4/yCgst+sethTASSH9rcYkghrwAe
   djwfS50ZsdXdiOOKzY6gyh3wSuZXDJpeK78NdvsPwcRSgeCP2Md3tFmun
   B1qiZrs3XQ0zO0sOzc9sOq1bkoFMCnjpXfCqkhInd6bxXE2pspCLofYp2
   95gJy/dPPHPTo6DlpwXf36OnN0+RpZzCFfdOfP8Qfk02PVs6OY+HrZ8XK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="322094119"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="322094119"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 05:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="854425785"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="854425785"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 17 Mar 2023 05:10:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd8uM-0009Ks-15;
	Fri, 17 Mar 2023 12:10:06 +0000
Date: Fri, 17 Mar 2023 20:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	slewis@rivosinc.com, heiko@sntech.de,
	Conor Dooley <conor@kernel.org>, vineetg@rivosinc.com,
	Evan Green <evan@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	Davidlohr Bueso <dave@stgolabs.net>, Guo Ren <guoren@kernel.org>,
	Jann Horn <jannh@google.com>, Jisheng Zhang <jszhang@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 6/6] RISC-V: Add hwprobe vDSO function and data
Message-ID: <202303171953.6DiSO3Si-lkp@intel.com>
References: <20230314183220.513101-7-evan@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314183220.513101-7-evan@rivosinc.com>

Hi Evan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v6.2]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes linus/master v6.3-rc2 v6.3-rc1 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230315-023754
patch link:    https://lore.kernel.org/r/20230314183220.513101-7-evan%40rivosinc.com
patch subject: [PATCH v4 6/6] RISC-V: Add hwprobe vDSO function and data
config: riscv-randconfig-r042-20230313 (https://download.01.org/0day-ci/archive/20230317/202303171953.6DiSO3Si-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8ded35c1c6a29c13d7509e1e845fe6bb27a4c109
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230315-023754
        git checkout 8ded35c1c6a29c13d7509e1e845fe6bb27a4c109
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171953.6DiSO3Si-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:105
   >>> referenced by hwprobe.c
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:105
   >>> referenced by hwprobe.c
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)
--
>> ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_riscv_hwprobe' failed: symbol not defined
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:105
   >>> referenced by hwprobe.c
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)
   llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory
>> ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_riscv_hwprobe' failed: symbol not defined
   llvm-nm: error: arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
