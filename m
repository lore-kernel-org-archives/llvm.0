Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCCCDDAD;
	Tue, 13 May 2025 04:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109707; cv=none; b=sgYkcOjH00yhBBCwsTn2ZYYxF4H6YF4GEVZVX7lIBzjdlNHAlHTV0x30U4F4A+tDutgqjqUPasA9HOPaAO9YpznRTCAJeI1G4EhMTyfmCfwRwAcKJJ3yjCx6Mqum/Ee9jQF5mVhTV9+MasHtAOJbsgcZJodFCofnAjmHTyYnr+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109707; c=relaxed/simple;
	bh=qKbizQHaQOdCF+X4U/bk3iQxhsjkug/ftrYhQS6Gstw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+objNAtSxS5mM0ed0V3viEruN6GVgli2iTBtC0p8lQef3EkdTcZt3gwZSus9cIqqgrKzeLIXnu2sJeBIQgujEvYXwVjPoOHXhGSDOKn+b7C3TVeyqu80A79e+Sw/GjbGywUTS2JN91dxLoAF1KCB7wGJ3HKRUBVDKMPtNFj9o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c48b9yyP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c48b9yyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747109705; x=1778645705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qKbizQHaQOdCF+X4U/bk3iQxhsjkug/ftrYhQS6Gstw=;
  b=c48b9yyPKnOcQ9e7JqVdrOm8SBdjQMW9xM91qpOy2LCOhKqgIhb6p7Ze
   93WQRJqxJKNKfP9qt/05TjdOZ81VsYuqBkUTBKCovwC7GJxU61E5j2iMS
   iUbePByrR/BnTX0fph9vR+KSuTQmGgQrVFPaj3oX/1EOrp4GH3GOPw9xE
   iMkRmy90ziS39DiADVrjiusyNnsFHW10RubAaBryBNm8CH2g8ka8j4J14
   omPrVuVQUl5kg5bPrBvYrd7yhwRz5PNpnLquBQ/zsBEItlpA14HlC2TSA
   xGL5mG83KHfnal/ps5nCkauKIgvWH47KONYeE5CA/iK5MxcR9eHMmXMKr
   A==;
X-CSE-ConnectionGUID: QlRtLdE4Sue9Tr8Kg1urzA==
X-CSE-MsgGUID: hqhA0FpRQ4mPv9PoMaA+bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48926146"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="48926146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 21:15:04 -0700
X-CSE-ConnectionGUID: ZFkVO7pLRU+A7WBrxNJzyQ==
X-CSE-MsgGUID: BITEGDntQieZtouIFyiu7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="142696144"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 May 2025 21:15:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEh2i-000Fdp-2f;
	Tue, 13 May 2025 04:15:00 +0000
Date: Tue, 13 May 2025 12:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 20/64] arch/powerpc/kernel/legacy_serial.c:149:40:
 error: incompatible function pointer types assigning to 'u32 (*)(struct
 uart_port *, unsigned int)' (aka 'unsigned int (*)(struct uart_port *,
 unsigned int)') from 'unsigned int (struct uart_port *, int)'
Message-ID: <202505131208.nNLau4Ty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f060943a6971b43116b370a038e41046e9421154
commit: 2c711abcb8fcb6ffb47c2b315e9e52a94d6b11a7 [20/64] serial: sanitize uart_port::serial_{in,out}() types
config: powerpc-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250513/202505131208.nNLau4Ty-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131208.nNLau4Ty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131208.nNLau4Ty-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/legacy_serial.c:149:40: error: incompatible function pointer types assigning to 'u32 (*)(struct uart_port *, unsigned int)' (aka 'unsigned int (*)(struct uart_port *, unsigned int)') from 'unsigned int (struct uart_port *, int)' [-Wincompatible-function-pointer-types]
     149 |                 legacy_serial_ports[index].serial_in = tsi_serial_in;
         |                                                      ^ ~~~~~~~~~~~~~
>> arch/powerpc/kernel/legacy_serial.c:150:41: error: incompatible function pointer types assigning to 'void (*)(struct uart_port *, unsigned int, u32)' (aka 'void (*)(struct uart_port *, unsigned int, unsigned int)') from 'void (struct uart_port *, int, int)' [-Wincompatible-function-pointer-types]
     150 |                 legacy_serial_ports[index].serial_out = tsi_serial_out;
         |                                                       ^ ~~~~~~~~~~~~~~
   2 errors generated.


vim +149 arch/powerpc/kernel/legacy_serial.c

7df5659eefad9b Arnd Bergmann          2011-06-27   74  
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   75  static int __init add_legacy_port(struct device_node *np, int want_index,
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   76  				  int iotype, phys_addr_t base,
b580d46ce833f6 Kumar Gala             2005-12-20   77  				  phys_addr_t taddr, unsigned long irq,
0ebfff1491ef85 Benjamin Herrenschmidt 2006-07-03   78  				  upf_t flags, int irq_check_parent)
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   79  {
13ae40370f62cd Stephen Chivers        2014-04-20   80  	const __be32 *clk, *spd, *rs;
a7f67bdf2c9f24 Jeremy Kerr            2006-07-12   81  	u32 clock = BASE_BAUD * 16;
13ae40370f62cd Stephen Chivers        2014-04-20   82  	u32 shift = 0;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   83  	int index;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   84  
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   85  	/* get clock freq. if present */
e2eb63927bfcb5 Stephen Rothwell       2007-04-03   86  	clk = of_get_property(np, "clock-frequency", NULL);
31df1678d7732b David Woodhouse        2005-11-24   87  	if (clk && *clk)
f14362d1fe81ce Ian Munsie             2010-10-01   88  		clock = be32_to_cpup(clk);
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   89  
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   90  	/* get default speed if present */
e2eb63927bfcb5 Stephen Rothwell       2007-04-03   91  	spd = of_get_property(np, "current-speed", NULL);
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   92  
13ae40370f62cd Stephen Chivers        2014-04-20   93  	/* get register shift if present */
13ae40370f62cd Stephen Chivers        2014-04-20   94  	rs = of_get_property(np, "reg-shift", NULL);
13ae40370f62cd Stephen Chivers        2014-04-20   95  	if (rs && *rs)
13ae40370f62cd Stephen Chivers        2014-04-20   96  		shift = be32_to_cpup(rs);
13ae40370f62cd Stephen Chivers        2014-04-20   97  
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   98  	/* If we have a location index, then try to use it */
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23   99  	if (want_index >= 0 && want_index < MAX_LEGACY_SERIAL_PORTS)
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  100  		index = want_index;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  101  	else
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  102  		index = legacy_serial_count;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  103  
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  104  	/* if our index is still out of range, that mean that
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  105  	 * array is full, we could scan for a free slot but that
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  106  	 * make little sense to bother, just skip the port
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  107  	 */
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  108  	if (index >= MAX_LEGACY_SERIAL_PORTS)
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  109  		return -1;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  110  	if (index >= legacy_serial_count)
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  111  		legacy_serial_count = index + 1;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  112  
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  113  	/* Check if there is a port who already claimed our slot */
b0d436c739b0d4 Anton Blanchard        2013-08-07  114  	if (legacy_serial_infos[index].np != NULL) {
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  115  		/* if we still have some room, move it, else override */
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  116  		if (legacy_serial_count < MAX_LEGACY_SERIAL_PORTS) {
0ebfff1491ef85 Benjamin Herrenschmidt 2006-07-03  117  			printk(KERN_DEBUG "Moved legacy port %d -> %d\n",
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  118  			       index, legacy_serial_count);
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  119  			legacy_serial_ports[legacy_serial_count] =
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  120  				legacy_serial_ports[index];
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  121  			legacy_serial_infos[legacy_serial_count] =
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  122  				legacy_serial_infos[index];
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  123  			legacy_serial_count++;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  124  		} else {
0ebfff1491ef85 Benjamin Herrenschmidt 2006-07-03  125  			printk(KERN_DEBUG "Replacing legacy port %d\n", index);
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  126  		}
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  127  	}
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  128  
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  129  	/* Now fill the entry */
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  130  	memset(&legacy_serial_ports[index], 0,
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  131  	       sizeof(struct plat_serial8250_port));
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  132  	if (iotype == UPIO_PORT)
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  133  		legacy_serial_ports[index].iobase = base;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  134  	else
8dacaedf04467e Benjamin Herrenschmidt 2005-11-29  135  		legacy_serial_ports[index].mapbase = base;
7df5659eefad9b Arnd Bergmann          2011-06-27  136  
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  137  	legacy_serial_ports[index].iotype = iotype;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  138  	legacy_serial_ports[index].uartclk = clock;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  139  	legacy_serial_ports[index].irq = irq;
b580d46ce833f6 Kumar Gala             2005-12-20  140  	legacy_serial_ports[index].flags = flags;
13ae40370f62cd Stephen Chivers        2014-04-20  141  	legacy_serial_ports[index].regshift = shift;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  142  	legacy_serial_infos[index].taddr = taddr;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  143  	legacy_serial_infos[index].np = of_node_get(np);
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  144  	legacy_serial_infos[index].clock = clock;
f14362d1fe81ce Ian Munsie             2010-10-01  145  	legacy_serial_infos[index].speed = spd ? be32_to_cpup(spd) : 0;
0ebfff1491ef85 Benjamin Herrenschmidt 2006-07-03  146  	legacy_serial_infos[index].irq_check_parent = irq_check_parent;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  147  
7df5659eefad9b Arnd Bergmann          2011-06-27  148  	if (iotype == UPIO_TSI) {
7df5659eefad9b Arnd Bergmann          2011-06-27 @149  		legacy_serial_ports[index].serial_in = tsi_serial_in;
7df5659eefad9b Arnd Bergmann          2011-06-27 @150  		legacy_serial_ports[index].serial_out = tsi_serial_out;
7df5659eefad9b Arnd Bergmann          2011-06-27  151  	}
7df5659eefad9b Arnd Bergmann          2011-06-27  152  
b7c670d673d118 Rob Herring            2017-08-21  153  	printk(KERN_DEBUG "Found legacy serial port %d for %pOF\n",
b7c670d673d118 Rob Herring            2017-08-21  154  	       index, np);
0ebfff1491ef85 Benjamin Herrenschmidt 2006-07-03  155  	printk(KERN_DEBUG "  %s=%llx, taddr=%llx, irq=%lx, clk=%d, speed=%d\n",
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  156  	       (iotype == UPIO_PORT) ? "port" : "mem",
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  157  	       (unsigned long long)base, (unsigned long long)taddr, irq,
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  158  	       legacy_serial_ports[index].uartclk,
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  159  	       legacy_serial_infos[index].speed);
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  160  
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  161  	return index;
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  162  }
463ce0e103f419 Benjamin Herrenschmidt 2005-11-23  163  

:::::: The code at line 149 was first introduced by commit
:::::: 7df5659eefad9b6d457ccdee016bd78bd064cfc0 serial/8250: Move UPIO_TSI to powerpc

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
