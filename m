Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532D536F;
	Fri, 17 Mar 2023 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679051351; x=1710587351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v10ok78XmnbTvrOG0ZyBDbG2rIV540KEKIp/CoL6i84=;
  b=QRnDgyzU248ijhTS1IMkMPaHuRpKjy3dlvUwRrlz5cV7OeaBNATA5FFh
   Gqi0+U8HIGMjV8kaFRJVE2eNdswyjFYv80p8Rffzn5EGuQD78+6aK7nLf
   zxYivcaGfraq+CkmlNAn0ALXPXPQe97yAsYm0KXAtDowouEsyEZcUyQDS
   7zvEURPnHdxIDZOKdhJxBYzU2bOLVjY1MvD2FslPiOaTBdZayb/FJsgro
   EhvrrJpNMclFo24ciebASwgt7RbW9BBsX2uWo3j8ePwVcDleDusdjqgMF
   LCl6FIq9Qz7Ieq0V8fsATFgPFX/Zmr/ttAeLfBKPJOr5Uv0BELcZ26gqD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="424508724"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="424508724"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 04:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="926107442"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="926107442"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2023 04:09:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd7xJ-0009JS-14;
	Fri, 17 Mar 2023 11:09:05 +0000
Date: Fri, 17 Mar 2023 19:08:31 +0800
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
Message-ID: <202303171804.y0iCB2XM-lkp@intel.com>
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
config: riscv-randconfig-r033-20230312 (https://download.01.org/0day-ci/archive/20230317/202303171804.y0iCB2XM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303171804.y0iCB2XM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:101
   >>> referenced by hwprobe.c:35 (arch/riscv/kernel/vdso/hwprobe.c:35)
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:101
   >>> referenced by hwprobe.c:0 (arch/riscv/kernel/vdso/hwprobe.c:0)
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:101
   >>> referenced by hwprobe.c:0 (arch/riscv/kernel/vdso/hwprobe.c:0)
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '_vdso_data'; recompile with -fPIC
   >>> defined in arch/riscv/kernel/vdso/vdso.lds:101
   >>> referenced by hwprobe.c:0 (arch/riscv/kernel/vdso/hwprobe.c:0)
   >>>               arch/riscv/kernel/vdso/hwprobe.o:(__vdso_riscv_hwprobe)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
