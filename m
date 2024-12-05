Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D072391AB;
	Thu,  5 Dec 2024 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733383016; cv=none; b=ixaHjfwxZKDQPRbLOVgo54rUynCERKE7n0tgT+cAAVDhEFwtRqXQbGg3ttpm7+oVuveL7akNv5+2D958sTZCbr5BQm2hUuQDAKGPS+ByGn2GuU2pz0rLObvuaf3apZjPaJGN1y174bqMHUvWO+5DpA+z4JM/xVuzEubAFlj1Dw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733383016; c=relaxed/simple;
	bh=LBM3j8uj59Ffo35EFjVnHKqXle11keRRcv5Qz4qK88k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMX8cyzQE4HR0YJZQDDDE9+qm81Uf2Ijh0a4Uq7uJbVzAy2aMj6+HcgGobztn7wY+TvqS7btZ2h/ebc3rXDp13lr5tfzdNbpzHMQuhf+8IffPTrMZ24NqCJu8SzFUHECwk0gBxpQ7OiV8t3S/gBkO01u+bPqX7fWKBfCRvWwNnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrZrKjF6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrZrKjF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733383014; x=1764919014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LBM3j8uj59Ffo35EFjVnHKqXle11keRRcv5Qz4qK88k=;
  b=CrZrKjF61xyoMr/6e54Xf68UK3KiXV/OKFiaz9vC6JQAks+QKbYx9x9u
   dQnbQytUuA0NifeRm6g5DL1PSzE7kQJTdjXL7Ni42UM5FH6jZAe/Tzj3Z
   dBjdtP1B10dUh5e1lvBCAM6McuFZY56PItazAtsJlhyxwDxWZTAuzQeqO
   Z88pj+Hqb+vcZ0It72w/WqVWJhNcmrITq9WyLLSZySmNMXVw97t0GqLJq
   fn4joR5KSrLQHfwTsMjUK4iRqEoUQbffqcAf4sdM+XrXUYXztena9c6ll
   bTOfuiv14FAkFx9o+iBvanUaoSRfqKh3k8/NeIlxUA33d+bYsuLE75PDb
   A==;
X-CSE-ConnectionGUID: DzHjcvNSTGq5xlkwc3nbgw==
X-CSE-MsgGUID: rnenBuj/TWSZqeGpdEOBzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44155556"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="44155556"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:16:53 -0800
X-CSE-ConnectionGUID: FDu+HCNkQP27hBKplDkWNQ==
X-CSE-MsgGUID: 3RBhHuYFR56V6WwwDp6xRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="98817461"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 04 Dec 2024 23:16:51 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ66P-0003vl-1E;
	Thu, 05 Dec 2024 07:16:46 +0000
Date: Thu, 5 Dec 2024 15:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:8250-cleanup 13/13]
 drivers/tty/serial/8250/8250_isa.c:109:13: error: redefinition of
 'serial8250_isa_init_ports'
Message-ID: <202412051507.dU33IExr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git 8250-cleanup
head:   babed7b34c5946d07f915c7e4aab26fa2470ff86
commit: babed7b34c5946d07f915c7e4aab26fa2470ff86 [13/13] serial: 8250: split out legacy isa driver
config: mips-rb532_defconfig (https://download.01.org/0day-ci/archive/20241205/202412051507.dU33IExr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051507.dU33IExr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051507.dU33IExr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_isa.c:109:6: warning: attribute declaration must precede definition [-Wignored-attributes]
     109 | void __init serial8250_isa_init_ports(void)
         |      ^
   include/linux/init.h:52:17: note: expanded from macro '__init'
      52 | #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
         |                         ^
   include/linux/compiler_attributes.h:321:56: note: expanded from macro '__section'
     321 | #define __section(section)              __attribute__((__section__(section)))
         |                                                        ^
   drivers/tty/serial/8250/8250.h:129:20: note: previous definition is here
     129 | static inline void serial8250_isa_init_ports(void) {}
         |                    ^
   drivers/tty/serial/8250/8250_isa.c:109:6: warning: attribute declaration must precede definition [-Wignored-attributes]
     109 | void __init serial8250_isa_init_ports(void)
         |      ^
   include/linux/init.h:52:41: note: expanded from macro '__init'
      52 | #define __init          __section(".init.text") __cold  __latent_entropy __noinitretpoline
         |                                                 ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   drivers/tty/serial/8250/8250.h:129:20: note: previous definition is here
     129 | static inline void serial8250_isa_init_ports(void) {}
         |                    ^
>> drivers/tty/serial/8250/8250_isa.c:109:13: error: redefinition of 'serial8250_isa_init_ports'
     109 | void __init serial8250_isa_init_ports(void)
         |             ^
   drivers/tty/serial/8250/8250.h:129:20: note: previous definition is here
     129 | static inline void serial8250_isa_init_ports(void) {}
         |                    ^
   2 warnings and 1 error generated.


vim +/serial8250_isa_init_ports +109 drivers/tty/serial/8250/8250_isa.c

   108	
 > 109	void __init serial8250_isa_init_ports(void)
   110	{
   111		int i;
   112	
   113		if (nr_uarts > UART_NR)
   114			nr_uarts = UART_NR;
   115	
   116		for (i = 0; i < ARRAY_SIZE(old_serial_port) && i < nr_uarts; i++) {
   117			struct uart_8250_port *up = serial8250_get_port(i);
   118	
   119			old_serial_port[i].line = i;
   120			old_serial_port[i].irqflags = share_irqs ? IRQF_SHARED : 0;
   121	
   122			early_serial_setup(&old_serial_port[i]);
   123	
   124			serial8250_set_defaults(up);
   125	
   126			/* Allow Intel CE4100 and jailhouse to override defaults */
   127			if (serial8250_isa_config != NULL)
   128				serial8250_isa_config(i, &up->port, &up->capabilities);
   129		}
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
