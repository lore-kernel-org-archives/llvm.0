Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4216E5686;
	Sun, 28 May 2023 20:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685305277; x=1716841277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVdQHDVOPlOkQn+8IBIehdsbUsP/EBl6EUmKEeMdepA=;
  b=LRTK/NuJE2fblum92PQGJ7fKKRL8Lc5dVB5XLGt7CnuufI/aT/DLM4eS
   /WlJJtI7uwMMITTRo659bwDzMr13Gw5fqUqLOgOoKpfD5JbDF8kH+skzc
   U10LT8+OaOoOpaMYjQt7/750kD9oBOdfh0i8RnsAFLaiGZso7dEbRMZ7P
   tCRSLLYKgj//20IT7r9q2GOAf1DoQwXg+zK1d3FoZDj0o4aCdAjHyiJJS
   wVVBGJK5xk1A2+iEe1PFEWzVfiATpGMOP5l8NcbGIN6lgmsThpt6JKtGn
   pUU8cQTvdGBEvOlod3/OraG8bT+r6itGJuZ62cjv6y5k2u9bdzVp+TU2m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="357805980"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="357805980"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 13:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="775704447"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="775704447"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 May 2023 13:21:14 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Mt8-000KjO-13;
	Sun, 28 May 2023 20:21:14 +0000
Date: Mon, 29 May 2023 04:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 69/229] rust/helpers.c:342:9: error:
 implicit declaration of function 'of_node_is_root' is invalid in C99
Message-ID: <202305290436.KGrKf4Lf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Asahi,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   98f5852ba1f7bc80f0f575fa9175ceb19aa5c8d5
commit: c6d23800776bb644812a4a684bf05b031cc8085f [69/229] rust: of: Add OF node abstraction
config: x86_64-randconfig-r022-20230528 (https://download.01.org/0day-ci/archive/20230529/202305290436.KGrKf4Lf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/c6d23800776bb644812a4a684bf05b031cc8085f
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout c6d23800776bb644812a4a684bf05b031cc8085f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305290436.KGrKf4Lf-lkp@intel.com/

All errors (new ones prefixed by >>):

   rust/helpers.c:204:9: error: implicit declaration of function 'ioremap' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:204:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
   rust/helpers.c:210:9: error: implicit declaration of function 'readb' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:216:9: error: implicit declaration of function 'readw' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:222:9: error: implicit declaration of function 'readl' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:229:9: error: implicit declaration of function 'readq' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:236:2: error: implicit declaration of function 'writeb' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:242:2: error: implicit declaration of function 'writew' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:248:2: error: implicit declaration of function 'writel' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:255:2: error: implicit declaration of function 'writeq' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:262:9: error: implicit declaration of function 'readb_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:268:9: error: implicit declaration of function 'readw_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:274:9: error: implicit declaration of function 'readl_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:281:9: error: implicit declaration of function 'readq_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:288:2: error: implicit declaration of function 'writeb_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:294:2: error: implicit declaration of function 'writew_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:300:2: error: implicit declaration of function 'writel_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:307:2: error: implicit declaration of function 'writeq_relaxed' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:314:2: error: implicit declaration of function 'memcpy_fromio' is invalid in C99 [-Wimplicit-function-declaration]
>> rust/helpers.c:342:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration]
   rust/helpers.c:204:9: error: implicit declaration of function 'ioremap' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:204:9: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion], err: false
   rust/helpers.c:210:9: error: implicit declaration of function 'readb' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:216:9: error: implicit declaration of function 'readw' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:222:9: error: implicit declaration of function 'readl' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:229:9: error: implicit declaration of function 'readq' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:236:2: error: implicit declaration of function 'writeb' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:242:2: error: implicit declaration of function 'writew' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:248:2: error: implicit declaration of function 'writel' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:255:2: error: implicit declaration of function 'writeq' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:262:9: error: implicit declaration of function 'readb_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:268:9: error: implicit declaration of function 'readw_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:274:9: error: implicit declaration of function 'readl_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:281:9: error: implicit declaration of function 'readq_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:288:2: error: implicit declaration of function 'writeb_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:294:2: error: implicit declaration of function 'writew_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:300:2: error: implicit declaration of function 'writel_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:307:2: error: implicit declaration of function 'writeq_relaxed' is invalid in C99 [-Wimplicit-function-declaration], err: true
   rust/helpers.c:314:2: error: implicit declaration of function 'memcpy_fromio' is invalid in C99 [-Wimplicit-function-declaration], err: true
>> rust/helpers.c:342:9: error: implicit declaration of function 'of_node_is_root' is invalid in C99 [-Wimplicit-function-declaration], err: true
   thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/std/src/panicking.rs:575:5
      1: core::panicking::panic_fmt
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/core/src/panicking.rs:65:14
      2: core::result::unwrap_failed
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/core/src/result.rs:1791:5
      3: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.
   make[2]: *** [rust/Makefile:330: rust/bindings/bindings_helpers_generated.rs] Error 1
   make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[2]: Target 'rust/' not remade because of errors.
   make[1]: *** [Makefile:1292: prepare] Error 2
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/of_node_is_root +342 rust/helpers.c

   259	
   260	u8 rust_helper_readb_relaxed(const volatile void __iomem *addr)
   261	{
 > 262		return readb_relaxed(addr);
   263	}
   264	EXPORT_SYMBOL_GPL(rust_helper_readb_relaxed);
   265	
   266	u16 rust_helper_readw_relaxed(const volatile void __iomem *addr)
   267	{
   268		return readw_relaxed(addr);
   269	}
   270	EXPORT_SYMBOL_GPL(rust_helper_readw_relaxed);
   271	
   272	u32 rust_helper_readl_relaxed(const volatile void __iomem *addr)
   273	{
   274		return readl_relaxed(addr);
   275	}
   276	EXPORT_SYMBOL_GPL(rust_helper_readl_relaxed);
   277	
   278	#ifdef CONFIG_64BIT
   279	u64 rust_helper_readq_relaxed(const volatile void __iomem *addr)
   280	{
   281		return readq_relaxed(addr);
   282	}
   283	EXPORT_SYMBOL_GPL(rust_helper_readq_relaxed);
   284	#endif
   285	
   286	void rust_helper_writeb_relaxed(u8 value, volatile void __iomem *addr)
   287	{
   288		writeb_relaxed(value, addr);
   289	}
   290	EXPORT_SYMBOL_GPL(rust_helper_writeb_relaxed);
   291	
   292	void rust_helper_writew_relaxed(u16 value, volatile void __iomem *addr)
   293	{
   294		writew_relaxed(value, addr);
   295	}
   296	EXPORT_SYMBOL_GPL(rust_helper_writew_relaxed);
   297	
   298	void rust_helper_writel_relaxed(u32 value, volatile void __iomem *addr)
   299	{
   300		writel_relaxed(value, addr);
   301	}
   302	EXPORT_SYMBOL_GPL(rust_helper_writel_relaxed);
   303	
   304	#ifdef CONFIG_64BIT
   305	void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
   306	{
   307		writeq_relaxed(value, addr);
   308	}
   309	EXPORT_SYMBOL_GPL(rust_helper_writeq_relaxed);
   310	#endif
   311	
   312	void rust_helper_memcpy_fromio(void *to, const volatile void __iomem *from, long count)
   313	{
   314		memcpy_fromio(to, from, count);
   315	}
   316	EXPORT_SYMBOL_GPL(rust_helper_memcpy_fromio);
   317	
   318	void *
   319	rust_helper_platform_get_drvdata(const struct platform_device *pdev)
   320	{
   321		return platform_get_drvdata(pdev);
   322	}
   323	EXPORT_SYMBOL_GPL(rust_helper_platform_get_drvdata);
   324	
   325	void
   326	rust_helper_platform_set_drvdata(struct platform_device *pdev,
   327					 void *data)
   328	{
   329		platform_set_drvdata(pdev, data);
   330	}
   331	EXPORT_SYMBOL_GPL(rust_helper_platform_set_drvdata);
   332	
   333	const struct of_device_id *rust_helper_of_match_device(
   334			const struct of_device_id *matches, const struct device *dev)
   335	{
   336		return of_match_device(matches, dev);
   337	}
   338	EXPORT_SYMBOL_GPL(rust_helper_of_match_device);
   339	
   340	bool rust_helper_of_node_is_root(const struct device_node *np)
   341	{
 > 342		return of_node_is_root(np);
   343	}
   344	EXPORT_SYMBOL_GPL(rust_helper_of_node_is_root);
   345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
