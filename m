Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15495A936;
	Tue, 12 Dec 2023 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxgG2IlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702385728; x=1733921728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w+lkU+xutOwVwtDcyc729Y4oCnLefQk3xbQDr3f4OT8=;
  b=dxgG2IlBgnYuQiUKqwzYjofJsfzL2vlxYR3bBWZo0rFU0f93QZh0VGim
   sG0OII0lDMe8H33wRN96TpfFqhtaCboFwVThkggnpiWincr3tc48K70ke
   L4dMQNBNH+Jrp89sIQwTO6w+Yp1mLrQuqbCdeENLG7EQ9Hl1l0As/jYON
   cFxMQSMcJ3CPmaNJ+RUVCathXTz4vc7veJzlqzev+7P+0ccT1pxoUWcx0
   kUWZG1kxEz2ToI5W6+5Gc7xRf+mv8rt6TTOXy/dmzG8yF3bNYcpWzulUV
   l1rfVrrmh1+wErof43xiXyL4tXYhqj22FbOFYwoeyYukbX8qD6EXOCDtG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="459116274"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="459116274"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 04:55:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="802456171"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="802456171"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Dec 2023 04:55:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD2IB-000JAz-1W;
	Tue, 12 Dec 2023 12:55:19 +0000
Date: Tue, 12 Dec 2023 20:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Maurer <mmaurer@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Matthew Maurer <mmaurer@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] x86/Kconfig: rust: Patchable function Rust compat
Message-ID: <202312122055.m7s1ccIE-lkp@intel.com>
References: <20231211150753.293883-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211150753.293883-1-mmaurer@google.com>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on peterz-queue/sched/core tip/master tip/auto-latest linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Maurer/x86-Kconfig-rust-Patchable-function-Rust-compat/20231211-230934
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231211150753.293883-1-mmaurer%40google.com
patch subject: [PATCH] x86/Kconfig: rust: Patchable function Rust compat
config: x86_64-rhel-8.3-bpf (attached as .config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312122055.m7s1ccIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312122055.m7s1ccIE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/Kconfig:2443: syntax error
   arch/x86/Kconfig:2442: invalid statement
   arch/x86/Kconfig:2443: invalid statement
   make[3]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1
   make[2]: *** [Makefile:685: oldconfig] Error 2
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> arch/x86/Kconfig:2443: syntax error
   arch/x86/Kconfig:2442: invalid statement
   arch/x86/Kconfig:2443: invalid statement
   make[3]: *** [scripts/kconfig/Makefile:77: olddefconfig] Error 1
   make[2]: *** [Makefile:685: olddefconfig] Error 2
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +2443 arch/x86/Kconfig

  2431	
  2432	config CC_HAS_SLS
  2433		def_bool $(cc-option,-mharden-sls=all)
  2434	
  2435	config CC_HAS_RETURN_THUNK
  2436		def_bool $(cc-option,-mfunction-return=thunk-extern)
  2437	
  2438	config CC_HAS_ENTRY_PADDING
  2439		def_bool $(cc-option,-fpatchable-function-entry=16,16)
  2440	
  2441	config RUSTC_HAS_ENTRY_PADDING
  2442		depends RUST
> 2443		def_bool $(rs-option,-Zpatchable-function-entry=16,16)
  2444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
