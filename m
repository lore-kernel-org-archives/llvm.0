Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBA17F
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 00:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653698547; x=1685234547;
  h=date:from:cc:subject:message-id:mime-version;
  bh=niqDI2Nx+X1SrZ7oqQlc2PliO4M97rj8lt2tS2Knycw=;
  b=IlV7M8tWfQPBt+EEPp+vnvLUnhr1BlWUEW4YqqZuv5BAagwmZ0R8SdJf
   Giof5NCvL1ohcu0ri66a23UHk+VGruoeGe01i+jEbwXVVoYaA6PTX5y2J
   tqPRv28cztOPIjWaTdPjm6hyjnS5tDkXPbuy4JQjkiq30rj6fA6iH2uFM
   Up/jbBHQaidKDzt1snMLMSn/z/hbFUFnx8JuJftXnfoqL2vGsIcZooJg/
   o80rOyfmRZ0dj08t6jRuU4KN9slm+iy40BSMPQqeIgOV4dTUm8tKtwcRu
   Oa2wgB6WGSI4FyhjrwqQe91Og3cRVRuPqNe1tRGjaB+HuE/aYkLNZtW5J
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="360989132"
X-IronPort-AV: E=Sophos;i="5.91,257,1647327600"; 
   d="scan'208";a="360989132"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 17:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,257,1647327600"; 
   d="scan'208";a="575099556"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 May 2022 17:42:25 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nukXB-0005Iz-5r;
	Sat, 28 May 2022 00:42:25 +0000
Date: Sat, 28 May 2022 08:41:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 13145/14198] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x59c):
 relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288,
 524287]; references kallsyms_names
Message-ID: <202205280829.utNOVd5s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Miguel Ojeda <ojeda@kernel.org>
CC: Kees Cook <keescook@chromium.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Wedson Almeida Filho <wedsonaf@google.com>
CC: Gary Guo <gary@garyguo.net>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Matthew Wilcox <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3fde8ff50ab265749704bd7fbcf70d35235421f
commit: 2087d6ac3567b38f2cddfa8fa445e595af87a04a [13145/14198] kallsyms: support "big" kernel symbols
config: riscv-randconfig-r042-20220527 (https://download.01.org/0day-ci/archive/20220528/202205280829.utNOVd5s-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2087d6ac3567b38f2cddfa8fa445e595af87a04a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2087d6ac3567b38f2cddfa8fa445e595af87a04a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x59c): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x58c): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
