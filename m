Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B8192D7C;
	Thu,  5 Dec 2024 05:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733376587; cv=none; b=siQDuITfn4u3B76R5La+SSaqY9+bqT7Owx52pBcoT/Xmk9R8jhKLyI0U/BoBBYvFHm6A096jvSLJ4PSm/dKZq/kzGPD1zhmz3GgjVwuc8Rj/qZAgKof+TtPOX37wcIpx6w9spNhxJa07MWc2eHIqRofAGtgH1z5pdPcTidUqtOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733376587; c=relaxed/simple;
	bh=oOQHJVhCmVCN8C34/xA1CD1/NI9aI/LIgzIvpWecc/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ygjwb7F4GWSKsFNkeMgHz60bRoMRLBuUgQweWkxAtJRIANlz1e6T2KS/DqpfE3szuBvv2f5Vk7s7rz0jaI63Ld+R6aPyRK/ETfoN7vt3bcjuE5MuJ7vv8TfLfM/MoXDKqmMFJg6OrTN4Q9HQT0RHfYo/bpVdb7+kaL/mZHltClA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N65ueyjJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N65ueyjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733376585; x=1764912585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oOQHJVhCmVCN8C34/xA1CD1/NI9aI/LIgzIvpWecc/A=;
  b=N65ueyjJRZrcRNLjY9++H5UGA1PNJWgqtOwdxdwUeytEutwvQlrx8TNC
   MIFSnmwuHkGBEXTXiCT+kgRKreiQaeosxdKodhTtB06q5wIBilUQtVyaF
   Pl3SpneW7Fk/gXYdZOmoNuBL68xf/JeZGlm/Sp+4tPeZtY7AWI8QGQotx
   zgqebDAuWSnhVQ0VXkRypKHXh6z588UgtoMiSNxjggEbjIg+4qdhpQ6vp
   AlEdDAcLaH5jMNbldAd+/CmaSWDbxL2euqAwpIYsWprweB82hzjFkfM4b
   +bYhEc7b+6WM302YOB+nYCC8X5erBDiV4xoTHXKyB389a4Mws7za6dSi2
   g==;
X-CSE-ConnectionGUID: JKZ6LbMxRCeEDuz4kLkdew==
X-CSE-MsgGUID: qU3GVmc+QdilVCitNBVKBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="56147751"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="56147751"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 21:29:42 -0800
X-CSE-ConnectionGUID: /nqlIDobRZeABnYCAHWw7Q==
X-CSE-MsgGUID: ZL1LBvM9SFGbm8fPGRVOwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="124904039"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2024 21:29:42 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ4Ql-0003qL-1a;
	Thu, 05 Dec 2024 05:29:39 +0000
Date: Thu, 5 Dec 2024 13:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:8250-cleanup 13/13]
 drivers/tty/serial/8250/8250_isa.c:109:6: warning: attribute declaration
 must precede definition
Message-ID: <202412051310.6e6KaJ2Y-lkp@intel.com>
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
config: mips-rb532_defconfig (https://download.01.org/0day-ci/archive/20241205/202412051310.6e6KaJ2Y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051310.6e6KaJ2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051310.6e6KaJ2Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_isa.c:109:6: warning: attribute declaration must precede definition [-Wignored-attributes]
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
>> drivers/tty/serial/8250/8250_isa.c:109:6: warning: attribute declaration must precede definition [-Wignored-attributes]
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
   drivers/tty/serial/8250/8250_isa.c:109:13: error: redefinition of 'serial8250_isa_init_ports'
     109 | void __init serial8250_isa_init_ports(void)
         |             ^
   drivers/tty/serial/8250/8250.h:129:20: note: previous definition is here
     129 | static inline void serial8250_isa_init_ports(void) {}
         |                    ^
   2 warnings and 1 error generated.


vim +109 drivers/tty/serial/8250/8250_isa.c

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
