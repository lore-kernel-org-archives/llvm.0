Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB16603D
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 02:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657073769; x=1688609769;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cHJSBkXeW4T6vY/AMphI4Q8u+P2gWlSMwyVj6uk8ALA=;
  b=RFpIcnk3AnMwaNzZslruQ/+VE80w13ZmgV7rOfDtS+0pZuGOh7GpYTGE
   HbcMDozQ3VFyLiAn8ffhc1Lk5gTH86KZNfCfdqGVnuhnM9tpYaQewdrJh
   7XBb+xL9nldIWwzqSB/Zvro4SGXp6AFQnw1it1qr32J03Ve3eeE/avd5S
   X1pcKIDQO3VQ01pgxQSBc9Dab9kmXQmo/N0OmCxUcytsSrG0KjNJaB9Sf
   m60j9+xzKq4F+w6hJedO6xrGCPleMVQ18d4oycVBLph5jAWtDk30zkJSJ
   XasckIvXLZ8Hu6HVB9g2SYtGCQxuRkNVX+fUf2RwQmBGE+5HvsLJm8qqn
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="345302384"
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="345302384"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 19:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="650440455"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jul 2022 19:16:07 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8uaF-000Jq5-7n;
	Wed, 06 Jul 2022 02:16:07 +0000
Date: Wed, 6 Jul 2022 10:15:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 322/7896] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x6be):
 relocation R_RISCV_PCREL_HI20 out of range: -524408 is not in [-524288,
 524287]; references kallsyms_names
Message-ID: <202207061029.7xdyTtrZ-lkp@intel.com>
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

Hi Miguel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a2aa3f05338270aecbe2492fda910d6c17e0102
commit: 2087d6ac3567b38f2cddfa8fa445e595af87a04a [322/7896] kallsyms: support "big" kernel symbols
config: riscv-randconfig-r032-20220703 (https://download.01.org/0day-ci/archive/20220706/202207061029.7xdyTtrZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 142aca7741d5b06207e87bf4880fbe308c8d6823)
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

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x6be): relocation R_RISCV_PCREL_HI20 out of range: -524408 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xcf6): relocation R_RISCV_PCREL_HI20 out of range: -524409 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xd0e): relocation R_RISCV_PCREL_HI20 out of range: -524409 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xd18): relocation R_RISCV_PCREL_HI20 out of range: -524409 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x6b0): relocation R_RISCV_PCREL_HI20 out of range: -524408 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
