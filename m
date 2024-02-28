Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63258145351;
	Wed, 28 Feb 2024 13:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709127995; cv=none; b=EimZGctOhv6HeODoKrLMCDwIbsWEQnb5GcU+ddN4ZA1Gd+85GZWBWXbpqf4T5bVVoKmU3Jve+LSANcx50DMQtoqoFI8AnfYtuNGDukpPPtqV5E2PAfnvjJ1aOs5+srGcNUCAa/8C+SY7rdLmuAUub1NZDadPr8XsRYPpadulRsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709127995; c=relaxed/simple;
	bh=AVEd94g/yLL3MbXUdkSk7L7kaJ2Vh0RBLFkT+5WDMd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HyYFN9q2TbMbZyiYdJpp59irL61pz1df22xdnGV/3HgDT1NKFcTakBDqp+W9rHAo6HY4l2MrHMedeKzTwATr5+jolem/U+7AAsnW9pC2GurEkzS+wTWtG20qhn+uaPvrCElfKHQC3BjShB2pNpU3kFJuheV0RgNl55K8BUi1+QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDpn0WF9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDpn0WF9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709127994; x=1740663994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AVEd94g/yLL3MbXUdkSk7L7kaJ2Vh0RBLFkT+5WDMd8=;
  b=oDpn0WF90qmWOEA1NOsrOESPu/gHugHYcqsFoo8ae2GtE41eoWCm0qqe
   MTwCG9VsDoWTAie5jRs814CoAJfp6HQqW5uqJVWhbL5/4SJpF17zpQCo1
   yYpVWi4o0zK5kR3XmSfjnsoYJxrugc2TGSRiuhMoHIS9fysdN/78hxEks
   AjJuqS9Ocy3eT2ksntm8/Itsza0dW5AKFkGjba/zEQsQPDDsy+L+yetO5
   5syA9Zd1Zx/XyRDPHr3unZamYViGPPkNWmOcZ72OYT3zh1EZ0XY7l0Ea+
   KfA1zpTNqbInXBgNuya3Iu+6nPjnQGUbCK6sEX3FHj4k80nyvl0r+qGqi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3689496"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3689496"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 05:46:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7550687"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Feb 2024 05:46:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfKGA-000C6p-15;
	Wed, 28 Feb 2024 13:46:15 +0000
Date: Wed, 28 Feb 2024 21:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v6 21/21] drivers/watchdog/sbc8360.c:226:2: error:
 call to '_outb' declared with 'error' attribute: outb() requires
 CONFIG_HAS_IOPORT
Message-ID: <202402282159.m17UtK2u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v6
head:   54f8a32579d3d5e8fd6bd4f91e101e1004997c8d
commit: 54f8a32579d3d5e8fd6bd4f91e101e1004997c8d [21/21] asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
config: um-randconfig-001-20240227 (https://download.01.org/0day-ci/archive/20240228/202402282159.m17UtK2u-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240228/202402282159.m17UtK2u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402282159.m17UtK2u-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/sbc8360.c:226:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     226 |         outb(wd_margin, SBC8360_BASETIME);
         |         ^
   include/asm-generic/io.h:654:14: note: expanded from macro 'outb'
     654 | #define outb _outb
         |              ^
   include/asm-generic/io.h:595:15: note: expanded from macro '_outb'
     595 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:212:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     212 |         outb(0x0A, SBC8360_ENABLE);
         |         ^
   include/asm-generic/io.h:654:14: note: expanded from macro 'outb'
     654 | #define outb _outb
         |              ^
   include/asm-generic/io.h:595:15: note: expanded from macro '_outb'
     595 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:214:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     214 |         outb(0x0B, SBC8360_ENABLE);
         |         ^
   include/asm-generic/io.h:654:14: note: expanded from macro 'outb'
     654 | #define outb _outb
         |              ^
   include/asm-generic/io.h:595:15: note: expanded from macro '_outb'
     595 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:217:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     217 |         outb(wd_multiplier, SBC8360_ENABLE);
         |         ^
   include/asm-generic/io.h:654:14: note: expanded from macro 'outb'
     654 | #define outb _outb
         |              ^
   include/asm-generic/io.h:595:15: note: expanded from macro '_outb'
     595 | #define _outb _outb
         |               ^
>> drivers/watchdog/sbc8360.c:226:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     226 |         outb(wd_margin, SBC8360_BASETIME);
         |         ^
   include/asm-generic/io.h:654:14: note: expanded from macro 'outb'
     654 | #define outb _outb
         |              ^
   include/asm-generic/io.h:595:15: note: expanded from macro '_outb'
     595 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:233:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     233 |         outb(0, SBC8360_ENABLE);
         |         ^
   include/asm-generic/io.h:654:14: note: expanded from macro 'outb'
     654 | #define outb _outb
         |              ^
   include/asm-generic/io.h:595:15: note: expanded from macro '_outb'
     595 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:233:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
   include/asm-generic/io.h:654:14: note: expanded from macro 'outb'
     654 | #define outb _outb
         |              ^
   include/asm-generic/io.h:595:15: note: expanded from macro '_outb'
     595 | #define _outb _outb
         |               ^
   7 errors generated.


vim +226 drivers/watchdog/sbc8360.c

3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan 2005-09-01  221  
3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan 2005-09-01  222  /* Kernel pings watchdog */
3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan 2005-09-01  223  static void sbc8360_ping(void)
3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan 2005-09-01  224  {
3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan 2005-09-01  225  	/* Write the base timer register */
3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan 2005-09-01 @226  	outb(wd_margin, SBC8360_BASETIME);
3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan 2005-09-01  227  }
3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan 2005-09-01  228  

:::::: The code at line 226 was first introduced by commit
:::::: 3809ad384af43ad883f47ee22a6faa33cedd61bc [WATCHDOG] New SBC8360 watchdog driver (revised)

:::::: TO: Ian E. Morgan <imorgan@webcon.ca>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
