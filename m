Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2C1FFC5B;
	Wed,  7 May 2025 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599480; cv=none; b=L06Cg6K/Xp/jp31j+tu1kbEK4zm1vKBq++QodC3u10F+3rXwLOQJZa8qpUBPXJqRtBsy8iHp7yofw8m26+MDQXM5tlRsNLwE9POeAdbquB9c83puY5C2dmp0cameqyPxM89ugIIR9dfXUN8Y0sX4lAysjQw19LYG30YDKJpPdOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599480; c=relaxed/simple;
	bh=eBW3TaD+3+3Q6oR16v5Zhwb6Gtg5LMVyWIKLRy/wLdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HuyktFC2GQVsg7yVHndy8wS8Mid8cXQh8hoB5putoz/O4Ks3+767nCeMOAx0vPn9q9+4W57LD1q+A55g5wc9x3QGc51CGY73tggqKvjxDX7fHOjvhXlAEdKKIuPqSp9JINd7SpP0ICaxqzEgDuYxIt+3CBw1LsEk0VweWfqhJoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqMYUvUT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqMYUvUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746599479; x=1778135479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eBW3TaD+3+3Q6oR16v5Zhwb6Gtg5LMVyWIKLRy/wLdM=;
  b=VqMYUvUTNRsEdv5QBj/lZKgbyaV4kHIsQSCpyUEQLq/ijJAKkWQbLKBQ
   QxCoaQ4QH+pJBu0bDEA8IOrnMyUaECuDFZAYAy7UPSBtH86Wwk8LWWBH2
   WKV30cIMTPC37huAgSURF1uFPCVWD3w5wtLw3EsaMn+ZJlGPs9RVJTqgf
   eAlNFpChjPA4AnHadqZt5rH1PMb9EEonT49HjBzhFwP/rXexrBP/rlaaO
   b7h4AnRukllY1d8OIEgZZYlcAj/mctTpkQ/bpvA8sobM6llzMFF0FTMDu
   xOjkYYCYRI+GrJWmMrD99CGy6w3NUnOflGxcTXTLgyw6mPD3ie6S8WWWE
   w==;
X-CSE-ConnectionGUID: ws8gKs6sTPmf7QcmIKvLmw==
X-CSE-MsgGUID: XHHMtrivQN2Xrnzu/WsRpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70818310"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="70818310"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:31:17 -0700
X-CSE-ConnectionGUID: e0cN2xe4QSK/hCQv1lm6Jg==
X-CSE-MsgGUID: Yb2njNSKQKqRwcoVMGQDlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135744299"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2025 23:31:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYJC-0007CJ-18;
	Wed, 07 May 2025 06:31:10 +0000
Date: Wed, 7 May 2025 14:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 62/87] drivers/tty/serial/8250/8250.h:327:54:
 warning: omitting the parameter name in a function definition is a C23
 extension
Message-ID: <202505071456.I7rZ5FKN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6c308d0b04c8c17ab39fcf6d4ed9a9033efc363f
commit: fa0317bfb9f28c33a9a84d824d1e8096a860b0da [62/87] 8250: move RSA functions to 8250_rsa.c
config: x86_64-buildonly-randconfig-005-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071456.I7rZ5FKN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071456.I7rZ5FKN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071456.I7rZ5FKN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/serial/8250/8250_platform.c:25:
>> drivers/tty/serial/8250/8250.h:327:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     327 | static inline void enable_rsa(struct uart_8250_port *) {}
         |                                                      ^
   drivers/tty/serial/8250/8250.h:328:55: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     328 | static inline void disable_rsa(struct uart_8250_port *) {}
         |                                                       ^
   drivers/tty/serial/8250/8250.h:329:58: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     329 | static inline void rsa_autoconfig(struct uart_8250_port *) {}
         |                                                          ^
   drivers/tty/serial/8250/8250.h:330:53: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     330 | static inline void rsa_reset(struct uart_8250_port *) {}
         |                                                     ^
   4 warnings generated.
--
   In file included from drivers/tty/serial/8250/8250_port.c:39:
>> drivers/tty/serial/8250/8250.h:327:54: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     327 | static inline void enable_rsa(struct uart_8250_port *) {}
         |                                                      ^
   drivers/tty/serial/8250/8250.h:328:55: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     328 | static inline void disable_rsa(struct uart_8250_port *) {}
         |                                                       ^
   drivers/tty/serial/8250/8250.h:329:58: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     329 | static inline void rsa_autoconfig(struct uart_8250_port *) {}
         |                                                          ^
   drivers/tty/serial/8250/8250.h:330:53: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     330 | static inline void rsa_reset(struct uart_8250_port *) {}
         |                                                     ^
   drivers/tty/serial/8250/8250_port.c:2172:2: error: call to undeclared function 'rsa_enable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2172 |         rsa_enable(up);
         |         ^
   drivers/tty/serial/8250/8250_port.c:2172:2: note: did you mean 'sme_enable'?
   arch/x86/include/asm/mem_encrypt.h:51:6: note: 'sme_enable' declared here
      51 | void sme_enable(struct boot_params *bp);
         |      ^
   drivers/tty/serial/8250/8250_port.c:2439:2: error: call to undeclared function 'rsa_disable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2439 |         rsa_disable(up);
         |         ^
   4 warnings and 2 errors generated.


vim +327 drivers/tty/serial/8250/8250.h

   318	
   319	#ifdef CONFIG_SERIAL_8250_RSA
   320	void univ8250_rsa_support(struct uart_ops *ops);
   321	void rsa_enable(struct uart_8250_port *up);
   322	void rsa_disable(struct uart_8250_port *up);
   323	void rsa_autoconfig(struct uart_8250_port *up);
   324	void rsa_reset(struct uart_8250_port *up);
   325	#else
   326	static inline void univ8250_rsa_support(struct uart_ops *ops) { }
 > 327	static inline void enable_rsa(struct uart_8250_port *) {}
   328	static inline void disable_rsa(struct uart_8250_port *) {}
   329	static inline void rsa_autoconfig(struct uart_8250_port *) {}
   330	static inline void rsa_reset(struct uart_8250_port *) {}
   331	#endif
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
