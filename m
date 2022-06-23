Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B061FA6
	for <llvm@lists.linux.dev>; Thu, 23 Jun 2022 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655994226; x=1687530226;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1tRozn9E3HubNOmtAJWIS6huezpGp6YeMwB8c7VY9x8=;
  b=fdV5sikBj3QVTO+kDUOrp8l00mJwuGmANynUICXpwLkg8lfLsTfNRCY2
   NdEbtrlZie0Rue6WrVr2QXQxGKoH0JG1ybaXv1GSlZC9DCz4PujY01Nec
   gHyVMGosfiVNX3SlPFM7OKKxDMmSeGS88pMPug++Rbpph1EHlm2l+IQ8F
   DxaA2M+3n/PdF/UYoGy/lH1yJKqGEpqUAGuF/WXqE5Lk/4qd9LbNNtnZ8
   0OG1Z2bxK0Br74bQYbFd8tRK2zpHSQUdmuJvmHvshMnoZXca+yW1NvyYL
   bOekDGVi/pPZZFa961xRlyrbRFCB6NGAKoi+gen3YRMoQFP++YD/H0/yf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="263765712"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="263765712"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 07:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="691044658"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2022 07:23:44 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4NkF-0001O9-GY;
	Thu, 23 Jun 2022 14:23:43 +0000
Date: Thu, 23 Jun 2022 22:23:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.10 1505/6724] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_lookup: .text+0x6b2):
 relocation R_RISCV_PCREL_HI20 out of range: 33553684 is not in [-524288,
 524287]; references kallsyms_markers
Message-ID: <202206232233.437lNqIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Alexandre Ghiti <alexandre.ghiti@canonical.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   4f3fee72a74c88c9039ce0405a715f6221791d06
commit: 6f416815c505ad1e0c2d0f5c7300e18ba16ad281 [1505/6724] riscv: Fix asan-stack clang build
config: riscv-buildonly-randconfig-r005-20220622 (https://download.01.org/0day-ci/archive/20220623/202206232233.437lNqIc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 46be5faaf03466c3751f8a2882bef5a217e15926)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=6f416815c505ad1e0c2d0f5c7300e18ba16ad281
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout 6f416815c505ad1e0c2d0f5c7300e18ba16ad281
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup: .text+0x6b2): relocation R_RISCV_PCREL_HI20 out of range: 33553684 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup: .text+0x6cc): relocation R_RISCV_PCREL_HI20 out of range: 33553684 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup: .text+0x726): relocation R_RISCV_PCREL_HI20 out of range: 33553684 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
