Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754EA2F21
	for <llvm@lists.linux.dev>; Mon,  4 Apr 2022 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649078119; x=1680614119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DzYh2TT2DOKLLMChVIhAuZom8iBz7Y6etMyMErPF8Hk=;
  b=dbOp9/PyMs/+YaTkn+Zk0MQV1p0NvNG45O6XzvYsDS+33ngs3IzC5VNm
   LjL9x+X+/N7nbsHN7np29JE8QPTm/psXVxzzVFNpZ4zwEbR7ZbP0uxzep
   Ecgt11DRSCvUxLkSX5PjGRbxdqrZLNjC6dVgJmRX3g/ldBpfqblezXovU
   wUDC8252irj0AsD8JkckuwzI/6N0epn/sjOQMPvNc2BzPmq4o9MfZzdKG
   4Ft060mfTSVK5UnM9HJIyQdWox16+6bWEx3l0nEKoZ8FuiJAKn4zTXOwD
   CNkg418N+j4/+uSLT0Z7PHmda5QcFUfnUkci/180AXbKAJXFpk8jPMczy
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="242652090"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="242652090"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 06:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="850033258"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2022 06:15:14 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbMY6-00024n-Ar;
	Mon, 04 Apr 2022 13:15:14 +0000
Date: Mon, 4 Apr 2022 21:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Finn Behrens <me@kloenk.de>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	Wedson Almeida Filho <wedsonaf@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sven Van Asbroeck <thesven73@gmail.com>,
	Gary Guo <gary@garyguo.net>, Boris-Chengbiao Zhou <bobo1239@web.de>,
	Boqun Feng <boqun.feng@gmail.com>, Douglas Su <d0u9.su@outlook.com>,
	Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
	Antonio Terceiro <antonio.terceiro@linaro.org>,
	Daniel Xu <dxu@dxuuu.xyz>, Miguel Cano <macanroj@gmail.com>
Subject: [linux-next:master 1141/1176] include/asm-generic/io.h:464:31:
 warning: performing pointer arithmetic on a null pointer has undefined
 behavior err: false
Message-ID: <202204042148.V5rM3bkT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   696206280c5e5c028caf9fd259999cb72b1f6127
commit: 241608fc4d70999563abc1ad52e5114f0021af88 [1141/1176] Kbuild: add Rust support
config: riscv-randconfig-c006-20220404 (https://download.01.org/0day-ci/archive/20220404/202204042148.V5rM3bkT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=241608fc4d70999563abc1ad52e5114f0021af88
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 241608fc4d70999563abc1ad52e5114f0021af88
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
>> include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior err: false
   cannot find function `iounmap` in module `bindings`
   --> rust/kernel/io_mem.rs:235:28
   |
   235 | unsafe { bindings::iounmap(self.ptr as _) };
   | ^^^^^^^ help: a function with a similar name exists: `ioremap`
   |
   ::: rust/bindings_helpers_generated.rs:40:5
   |
   40 | / pub fn ioremap(
   41 | | offset: resource_size_t,
   42 | | size: c_types::c_ulong,
   43 | | ) -> c_types::c_void;
   | |______________________________- similarly named function `ioremap` defined here


vim +464 include/asm-generic/io.h

3f7e212df82ca0 Arnd Bergmann  2009-05-13  450  
9216efafc52ff9 Thierry Reding 2014-10-01  451  /*
9216efafc52ff9 Thierry Reding 2014-10-01  452   * {in,out}{b,w,l}() access little endian I/O. {in,out}{b,w,l}_p() can be
9216efafc52ff9 Thierry Reding 2014-10-01  453   * implemented on hardware that needs an additional delay for I/O accesses to
9216efafc52ff9 Thierry Reding 2014-10-01  454   * take effect.
9216efafc52ff9 Thierry Reding 2014-10-01  455   */
9216efafc52ff9 Thierry Reding 2014-10-01  456  
f009c89df79abe John Garry     2020-03-28  457  #if !defined(inb) && !defined(_inb)
f009c89df79abe John Garry     2020-03-28  458  #define _inb _inb
214ba3584b2e2c Stafford Horne 2020-07-26  459  static inline u8 _inb(unsigned long addr)
9216efafc52ff9 Thierry Reding 2014-10-01  460  {
87fe2d543f8173 Sinan Kaya     2018-04-05  461  	u8 val;
87fe2d543f8173 Sinan Kaya     2018-04-05  462  
87fe2d543f8173 Sinan Kaya     2018-04-05  463  	__io_pbr();
87fe2d543f8173 Sinan Kaya     2018-04-05 @464  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e9 Will Deacon    2019-02-22  465  	__io_par(val);
87fe2d543f8173 Sinan Kaya     2018-04-05  466  	return val;
9216efafc52ff9 Thierry Reding 2014-10-01  467  }
9216efafc52ff9 Thierry Reding 2014-10-01  468  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  469  

:::::: The code at line 464 was first introduced by commit
:::::: 87fe2d543f817300e13f0ea683f38c122737856e io: change inX() to have their own IO barrier overrides

:::::: TO: Sinan Kaya <okaya@codeaurora.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
