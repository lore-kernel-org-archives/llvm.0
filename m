Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9228C04;
	Tue, 21 Mar 2023 11:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679397747; x=1710933747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sfORhRiVHQmtzdjGHhmxgrB1wKT3hy5Lc7QGL+RMo0A=;
  b=CWeXih7+tBkZykOgwQXYXCnfm25UMzhtJvGEv2OA0XpPEFPRkyXzzjEB
   yqbnYYC6t5Qx5oTOBZZh3YaTmoZz8cWisgY3TuccpZYYj1/+INXU81zrR
   U3n8Xf36S0nHNO8GqhkTukUyKpdiJtC/22fG/sYYknTXoXPsUb3FSoOxF
   q1dtA0dbeghmL7w8xJEPnp+CcGDXq4zjEdsEquVmmAbdX0Fpju9Q2SnHu
   xIT0oX/2aJYHFgSF4YxvmG7NKde3/jn4QgKQ6oz51S0f1QMN3DryZpV12
   +i+w2qXwQfEvSJF+pGz/2ZV3mTZBAGHT2KJCitxMTX7VGPQTPLDJf2CCO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403786538"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="403786538"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 04:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="824896475"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="824896475"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2023 04:22:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pea4P-000BqY-03;
	Tue, 21 Mar 2023 11:22:25 +0000
Date: Tue, 21 Mar 2023 19:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: <instantiation>:26:8: error: symbol '__pecoff_text_end' can not be
 undefined in a subtraction expression
Message-ID: <202303211908.171VMZlz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   0af44711e93ad0fcacc5c36723478acda54a2f68
commit: 88713f77905e621a997fb7aabb2e5377f0fa6580 riscv: Introduce CONFIG_RELOCATABLE
date:   10 hours ago
config: riscv-randconfig-r042-20230319 (https://download.01.org/0day-ci/archive/20230321/202303211908.171VMZlz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=88713f77905e621a997fb7aabb2e5377f0fa6580
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer for-next
        git checkout 88713f77905e621a997fb7aabb2e5377f0fa6580
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211908.171VMZlz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/head.S:329:5: warning: 'CONFIG_RISCV_BOOT_SPINWAIT' is not defined, evaluates to 0 [-Wundef]
   #if CONFIG_RISCV_BOOT_SPINWAIT
       ^
   1 warning generated.
>> <instantiation>:26:8: error: symbol '__pecoff_text_end' can not be undefined in a subtraction expression
    .long __pecoff_data_virt_end - __pecoff_text_end
          ^
   <instantiation>:84:8: error: symbol '__pecoff_text_end' can not be undefined in a subtraction expression
    .long __pecoff_data_virt_end - __pecoff_text_end
          ^
   <instantiation>:86:8: error: symbol '__pecoff_text_end' can not be undefined in a subtraction expression
    .long __pecoff_data_raw_end - __pecoff_text_end
          ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
