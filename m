Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE84683CD1;
	Tue, 16 Apr 2024 09:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713259629; cv=none; b=YJ8bTD4PIZjAXZe/Ig7e3ISz7yFzLGYS7aiFeyhYs3gENWFYmOE6YLESCtsm8t0Mx57Lv94ygCVcXsi5SxSmZGV+dqHxGp6FgV61vD/na7fSsWN6zSppAucWvo6ij+/D6YykTHfuBaei1DOjKgs6HZh1DEpL9VvUdbc4FV/yJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713259629; c=relaxed/simple;
	bh=DaHG80PCJjJ2rsypliyRFGT0fjjFDmlWGvHgopnk08c=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AvtR7An1819dFN1unlU+YHdN49PATZhyHqgc4a7LNrGj7sqpLl7TjPLtT8QQ0xN/9KPPXH1eFChb3Om3a8dhJx3YfaMmCUj7OVhXqJ/QmUMTiup0P7zZAnqSgqrU0ZIA4in0vVXgsq+xafpOahbMGNXWuva02do9RKTvIQSAg+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vwr1gTvc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vwr1gTvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713259628; x=1744795628;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DaHG80PCJjJ2rsypliyRFGT0fjjFDmlWGvHgopnk08c=;
  b=Vwr1gTvcz9nMJe43PruLPDKCenHFD2LxMx4Yp6gOXQnlcOwHPprZih6p
   hve1GH6zeabhx4y0q9E+r1yFFEvEllRnIXiylxdndW6LmdmG6DLETn5uV
   mFnF2U1AifchmEmYNKPhna2/OQ971i5yNCW+KGEmjmGPFXZErZYl7DfJd
   YtFzNRzLGFUfR/CwABI7bRA/PIAFmEbzioqWdGObH5bqJQsDHJYzFsAV9
   8ilYUZC11v489rwi0XTJsXz3jikDXQhMit7t4fQdWba5GZVl7Aohq5SPt
   R5XNkIsnOz2tGuYfHGMmKU/RlbvObduae+7rTKZ+0zuTVl5zA1PNDPFUG
   A==;
X-CSE-ConnectionGUID: xakCzv1mTKWu5AbCxs41DA==
X-CSE-MsgGUID: /U5/eFvnT/K8E2nSea2ANA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8547820"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8547820"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 02:27:07 -0700
X-CSE-ConnectionGUID: CieXNt1ATX6WVD1Fo0G7gw==
X-CSE-MsgGUID: y83lTFN6Tr+rlNFyS6fe+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="53180194"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Apr 2024 02:27:06 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwf5j-00056W-2B;
	Tue, 16 Apr 2024 09:27:03 +0000
Date: Tue, 16 Apr 2024 17:26:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [openeuler:OLK-5.10 20605/30000] clang: error: unsupported option
 '-mbig-endian' for target 'x86_64-unknown-linux-gnu'
Message-ID: <202404161708.BW1kcG3L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: kernel@openeuler.org
TO: Huaxin Lu <luhuaxin1@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f356a9b6bb6b38a5bf43c2a87d88e8218a7da086
commit: 78568d28ad62c586e32e3989de5354fcb014c09f [20605/30000] scripts: Fix issue of module signing with openssl 3.x
config: arm64-randconfig-002-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161708.BW1kcG3L-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161708.BW1kcG3L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161708.BW1kcG3L-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/include/openssl/engine.h182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   :478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.hscripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated [-Wdeprecated-declarations]
      59 |         while (ERR_get_error_line(&file, &line)) {}
         |                ^
   /usr/include/openssl/err.h:422:1: note: 'ERR_get_error_line' has been explicitly marked deprecated here
     422 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   :182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__scripts/extract-cert.c:124:3: warning: 'ENGINE_load_builtin_engines' is deprecated [-Wdeprecated-declarations]
     124 |                 ENGINE_load_builtin_engines();
         |                 ^
   ((/usr/include/openssl/engine.hdeprecated))
         |                                                    ^
   :358:1: note: 'ENGINE_load_builtin_engines' has been explicitly marked deprecated here
     scripts/sign-file.c:153:17: warning: 'ENGINE_load_private_key' is deprecated [-Wdeprecated-declarations]
     153 |                 private_key = ENGINE_load_private_key(e, private_key_name,
         |                               ^
   /usr/include/openssl/engine.h:637:1: note: 'ENGINE_load_private_key' has been explicitly marked deprecated here
     637 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:126:7: warning: 'ENGINE_by_id' is deprecated [-Wdeprecated-declarations]
     126 |                 e = ENGINE_by_id("pkcs11");
         |                     ^
   /usr/include/openssl/engine.h:336:1: note: 'ENGINE_by_id' has been explicitly marked deprecated here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:128:7: warning: 'ENGINE_init' is deprecated [-Wdeprecated-declarations]
     128 |                 if (ENGINE_init(e))
         |                     ^
   /usr/include/openssl/engine.h:620:1: note: 'ENGINE_init' has been explicitly marked deprecated here
     620 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:133:9: warning: 'ENGINE_ctrl_cmd_string' is deprecated [-Wdeprecated-declarations]
     133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
         |                              ^
   /usr/include/openssl/engine.h:478:1: note: 'ENGINE_ctrl_cmd_string' has been explicitly marked deprecated here
     478 | OSSL_DEPRECATEDIN_3_0
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   scripts/extract-cert.c:134:3: warning: 'ENGINE_ctrl_cmd' is deprecated [-Wdeprecated-declarations]
     134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
         |                 ^
   /usr/include/openssl/engine.h:450:1: note: 'ENGINE_ctrl_cmd' has been explicitly marked deprecated here
     450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   7 warnings generated.
   7 warnings generated.
>> clang: error: unsupported option '-mbig-endian' for target 'x86_64-unknown-linux-gnu'
   make[2]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1 shuffle=2425708518
>> clang: error: unsupported option '-mbig-endian' for target 'x86_64-unknown-linux-gnu'
   make[2]: *** [scripts/Makefile.build:286: scripts/mod/empty.o] Error 1 shuffle=2425708518
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1237: prepare0] Error 2 shuffle=2425708518
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:187: __sub-make] Error 2 shuffle=2425708518
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
