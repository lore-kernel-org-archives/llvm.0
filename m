Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6F41EE026;
	Mon, 20 Jan 2025 19:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737402237; cv=none; b=FltfLnO0GfsYYnGinL9W05PhD7Z/gld3UXWjk1Z/jVERE4SS/AQqt+dZEYi4Z5Z3GoR0AqsFy6jYZ17i6HiHFj5lMEHyNvFkW3v5/JhOMoGGpCkm0IyBMVjb26xnmyGXEEWnhf6kxjir2VsmzquI2GVFTJDoyd9snTlLF2kSElg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737402237; c=relaxed/simple;
	bh=Zj06Q+wQDq3oRuK1FCxwYy84njMnfOoMa11gfORBLqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZLUJm3AKxqc5CqI3KqkMj1XBvQV+VMRaUdJJ6TjFYMkHpikP4JUpphYWI5/6KDH0gRT/H/2d5g61Aomru1L/U0znYQOeXQM8G8gm57fgu5NjoLqIy9ha9HgFe8qKx/TDrIjAHU+v3CSp62QvV7LuIV9AL5j6iey2tT076N0ahA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qmam6PWP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qmam6PWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737402236; x=1768938236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zj06Q+wQDq3oRuK1FCxwYy84njMnfOoMa11gfORBLqE=;
  b=Qmam6PWPVF3/RZQEgF0sJTGlOTscRuzRIIqpbKenVmISFfSnbmgoGJW1
   5rzDd4CsY8SOjxtwL0ZsPHEGPfdtGJvkLyneQ6J/tmM1l10/5cHRBQHW4
   E6EE3juI3DCFdeR28BqZBdcZYDuyP+LR562/YT7rIc7KxUVg7Hs+Dt86Z
   MNA9gVdQtIQKs99LHUYuxuct1V+CRz+HEGltsj+R5I3+h1Xsvuu5w9bTJ
   YdHjwbtY2m1lo1bX4cspUo6BG6ZHJY5sMHwqvVO4imD8CkYTvJR4FSFAL
   MKH5jNR9Ny/aG9rHebVJEBZGpjyV1twfx0AMv2eXblIhc0iF5vW38s4nD
   A==;
X-CSE-ConnectionGUID: 17XHBsxkQJyxOumt1CEEcg==
X-CSE-MsgGUID: +KCc6Ag0SWqI9pBPfZPkNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37681897"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37681897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 11:43:55 -0800
X-CSE-ConnectionGUID: PEtvk8NETE6JRYeCU1J0rw==
X-CSE-MsgGUID: u9nNMTvJR3aw2KqmmbsFcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="106419829"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2025 11:43:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZxgd-000Wvh-2l;
	Mon, 20 Jan 2025 19:43:51 +0000
Date: Tue, 21 Jan 2025 03:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/mv_ctltables 10/10] arch/x86/kernel/nmi.c:237:6:
 error: use of undeclared identifier 'panic_on_unrecovered_nmi'
Message-ID: <202501210326.DSXlGT9c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/mv_ctltables
head:   18654655ca1b5e5bc57b89c5e88645cd3284764c
commit: e3369ef9500b8ead45c027ac0cc054adbd71052e [10/10] x86: Move sysctls into arch/x86
config: i386-buildonly-randconfig-002-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210326.DSXlGT9c-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210326.DSXlGT9c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210326.DSXlGT9c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/nmi.c:237:6: error: use of undeclared identifier 'panic_on_unrecovered_nmi'
     237 |         if (panic_on_unrecovered_nmi)
         |             ^
>> arch/x86/kernel/nmi.c:262:6: error: use of undeclared identifier 'panic_on_io_nmi'
     262 |         if (panic_on_io_nmi) {
         |             ^
   arch/x86/kernel/nmi.c:310:27: error: use of undeclared identifier 'panic_on_unrecovered_nmi'
     310 |         if (unknown_nmi_panic || panic_on_unrecovered_nmi)
         |                                  ^
   3 errors generated.
--
>> arch/x86/kernel/setup.c:153:13: error: use of undeclared identifier 'panic_on_unrecovered_nmi'
     153 |                 .data           = &panic_on_unrecovered_nmi,
         |                                    ^
>> arch/x86/kernel/setup.c:160:13: error: use of undeclared identifier 'panic_on_io_nmi'
     160 |                 .data           = &panic_on_io_nmi,
         |                                    ^
   2 errors generated.


vim +/panic_on_unrecovered_nmi +237 arch/x86/kernel/nmi.c

c9126b2ee8adb92 Don Zickus       2011-09-30  226  
9326638cbee2d36 Masami Hiramatsu 2014-04-17  227  static void
1d48922c14b6363 Don Zickus       2011-09-30  228  pci_serr_error(unsigned char reason, struct pt_regs *regs)
1d48922c14b6363 Don Zickus       2011-09-30  229  {
553222f3e81f18d Don Zickus       2012-03-29  230  	/* check to see if anyone registered against these types of errors */
bf9f2ee28d475ad Andy Lutomirski  2015-07-20  231  	if (nmi_handle(NMI_SERR, regs))
553222f3e81f18d Don Zickus       2012-03-29  232  		return;
553222f3e81f18d Don Zickus       2012-03-29  233  
1d48922c14b6363 Don Zickus       2011-09-30  234  	pr_emerg("NMI: PCI system error (SERR) for reason %02x on CPU %d.\n",
1d48922c14b6363 Don Zickus       2011-09-30  235  		 reason, smp_processor_id());
1d48922c14b6363 Don Zickus       2011-09-30  236  
1d48922c14b6363 Don Zickus       2011-09-30 @237  	if (panic_on_unrecovered_nmi)
58c5661f2144c08 Hidehiro Kawai   2015-12-14  238  		nmi_panic(regs, "NMI: Not continuing");
1d48922c14b6363 Don Zickus       2011-09-30  239  
1d48922c14b6363 Don Zickus       2011-09-30  240  	pr_emerg("Dazed and confused, but trying to continue\n");
1d48922c14b6363 Don Zickus       2011-09-30  241  
1d48922c14b6363 Don Zickus       2011-09-30  242  	/* Clear and disable the PCI SERR error line. */
1d48922c14b6363 Don Zickus       2011-09-30  243  	reason = (reason & NMI_REASON_CLEAR_MASK) | NMI_REASON_CLEAR_SERR;
1d48922c14b6363 Don Zickus       2011-09-30  244  	outb(reason, NMI_REASON_PORT);
1d48922c14b6363 Don Zickus       2011-09-30  245  }
9326638cbee2d36 Masami Hiramatsu 2014-04-17  246  NOKPROBE_SYMBOL(pci_serr_error);
1d48922c14b6363 Don Zickus       2011-09-30  247  
9326638cbee2d36 Masami Hiramatsu 2014-04-17  248  static void
1d48922c14b6363 Don Zickus       2011-09-30  249  io_check_error(unsigned char reason, struct pt_regs *regs)
1d48922c14b6363 Don Zickus       2011-09-30  250  {
1d48922c14b6363 Don Zickus       2011-09-30  251  	unsigned long i;
1d48922c14b6363 Don Zickus       2011-09-30  252  
553222f3e81f18d Don Zickus       2012-03-29  253  	/* check to see if anyone registered against these types of errors */
bf9f2ee28d475ad Andy Lutomirski  2015-07-20  254  	if (nmi_handle(NMI_IO_CHECK, regs))
553222f3e81f18d Don Zickus       2012-03-29  255  		return;
553222f3e81f18d Don Zickus       2012-03-29  256  
1d48922c14b6363 Don Zickus       2011-09-30  257  	pr_emerg(
1d48922c14b6363 Don Zickus       2011-09-30  258  	"NMI: IOCK error (debug interrupt?) for reason %02x on CPU %d.\n",
1d48922c14b6363 Don Zickus       2011-09-30  259  		 reason, smp_processor_id());
57da8b960b9a256 Jan Beulich      2012-05-09  260  	show_regs(regs);
1d48922c14b6363 Don Zickus       2011-09-30  261  
1717f2096b543ce Hidehiro Kawai   2015-12-14 @262  	if (panic_on_io_nmi) {
58c5661f2144c08 Hidehiro Kawai   2015-12-14  263  		nmi_panic(regs, "NMI IOCK error: Not continuing");
1717f2096b543ce Hidehiro Kawai   2015-12-14  264  
1717f2096b543ce Hidehiro Kawai   2015-12-14  265  		/*
1717f2096b543ce Hidehiro Kawai   2015-12-14  266  		 * If we end up here, it means we have received an NMI while
1717f2096b543ce Hidehiro Kawai   2015-12-14  267  		 * processing panic(). Simply return without delaying and
1717f2096b543ce Hidehiro Kawai   2015-12-14  268  		 * re-enabling NMIs.
1717f2096b543ce Hidehiro Kawai   2015-12-14  269  		 */
1717f2096b543ce Hidehiro Kawai   2015-12-14  270  		return;
1717f2096b543ce Hidehiro Kawai   2015-12-14  271  	}
1d48922c14b6363 Don Zickus       2011-09-30  272  
1d48922c14b6363 Don Zickus       2011-09-30  273  	/* Re-enable the IOCK line, wait for a few seconds */
1d48922c14b6363 Don Zickus       2011-09-30  274  	reason = (reason & NMI_REASON_CLEAR_MASK) | NMI_REASON_CLEAR_IOCHK;
1d48922c14b6363 Don Zickus       2011-09-30  275  	outb(reason, NMI_REASON_PORT);
1d48922c14b6363 Don Zickus       2011-09-30  276  
1d48922c14b6363 Don Zickus       2011-09-30  277  	i = 20000;
1d48922c14b6363 Don Zickus       2011-09-30  278  	while (--i) {
1d48922c14b6363 Don Zickus       2011-09-30  279  		touch_nmi_watchdog();
1d48922c14b6363 Don Zickus       2011-09-30  280  		udelay(100);
1d48922c14b6363 Don Zickus       2011-09-30  281  	}
1d48922c14b6363 Don Zickus       2011-09-30  282  
1d48922c14b6363 Don Zickus       2011-09-30  283  	reason &= ~NMI_REASON_CLEAR_IOCHK;
1d48922c14b6363 Don Zickus       2011-09-30  284  	outb(reason, NMI_REASON_PORT);
1d48922c14b6363 Don Zickus       2011-09-30  285  }
9326638cbee2d36 Masami Hiramatsu 2014-04-17  286  NOKPROBE_SYMBOL(io_check_error);
1d48922c14b6363 Don Zickus       2011-09-30  287  

:::::: The code at line 237 was first introduced by commit
:::::: 1d48922c14b6363f6d5febb12464d804bb5cc53f x86, nmi: Split out nmi from traps.c

:::::: TO: Don Zickus <dzickus@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
