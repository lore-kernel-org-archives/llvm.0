Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129697A
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 05:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646371307; x=1677907307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WEO6uxzhlD/6xZlLbDAS3aVLXtQffiXdQWcpSwdf5GU=;
  b=ATlXjFuJFv/qM5oAgcyWTE7FAoWDcVfbxaGAMUfsz4kgGHQjRO2PeMYI
   iVw1ccQCrRp0ND+Jc87gQDqzhA1eq9dKjhx7xx/v5y+4PrFCwpGAzzqk6
   WW/5nNr8h3yaHLtuagmRVFzfxf6xjUacr7sXOPUKS0kXTT0cRHfU6SfwT
   YOREr50/hx0hDj25q1HToNUxcgpGVFJT1izGV0qWEQw328SmLoeEUZiCT
   C0r/djCciWztOXNPDavcNEKLqPPVxd3vidualX33IjnXjQj7sqTaNerVJ
   j3v9tZghY3T2VXzXFh6j0U3bQVrANZN7Q/c2X7uGIBv7Kc64tJwBsFKfT
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="241321051"
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; 
   d="scan'208";a="241321051"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 21:21:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; 
   d="scan'208";a="536148172"
Received: from lkp-server01.sh.intel.com (HELO ccb16ba0ecc3) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 21:21:42 -0800
Received: from kbuild by ccb16ba0ecc3 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nQ0Np-0001JO-Cz; Fri, 04 Mar 2022 05:21:41 +0000
Date: Fri, 4 Mar 2022 13:20:56 +0800
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
Subject: [linux-next:master 4865/10468] include/asm-generic/io.h:464:31:
 warning: performing pointer arithmetic on a null pointer has undefined
 behavior err: false
Message-ID: <202203041338.Bv4qJWdU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Miguel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   91265a6da44d13296bdb5b3fbafa19d06be462f2
commit: 17295a6760d551958a773a8342cff03630f3bff8 [4865/10468] Kbuild: add Rust support
config: riscv-randconfig-r006-20220304 (https://download.01.org/0day-ci/archive/20220304/202203041338.Bv4qJWdU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=17295a6760d551958a773a8342cff03630f3bff8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 17295a6760d551958a773a8342cff03630f3bff8
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
   --> rust/kernel/io_mem.rs:225:28
   |
   225 | unsafe { bindings::iounmap(self.ptr as _) };
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
