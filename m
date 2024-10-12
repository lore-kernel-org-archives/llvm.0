Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0065629;
	Sat, 12 Oct 2024 01:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728695570; cv=none; b=p2RIz6OMir57wg2UifBnoJllLnozPdkdcywickEUjddtCZzu+TlnFLp40VodtKa6fbD2wjkQfDIrpn1X42PyaeJTbsFYfuupvjesd1X1x1Qn7kSSlEuKGgVhL3aaVuShAKtfP7gMa2DgNebmmddn3i5ZwFUszL1sp9UIibtZGh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728695570; c=relaxed/simple;
	bh=hKvTI6I10vAO9ZsBDO7RFZ+YsyZKAWLz8ycSPms5b3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHQ2faEO+qxE79oxEzl4cMA+oo1fK/y0PMXAlKGACGzHWD2U32b14EldtD6cM40w9dUXD3LzO3glymnvTx9J/39dWQmLj2/Osk0Ik2yIPzr0UViRbiNTRaG9I6FAA3DmoN8XCh4H2ZMWC24vCSAI36s4o7+M3EzSR0+SzyxT9Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hza0BhQ4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hza0BhQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728695568; x=1760231568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hKvTI6I10vAO9ZsBDO7RFZ+YsyZKAWLz8ycSPms5b3E=;
  b=hza0BhQ43svJYxoiKqhcZ6Zgg+mMcXicLE8ysxdJvmj+++tsREW7DGU/
   XyYstXbZ9D5yyDoB1djYlafgBd/n7mriJBl4I0cm+Ld5518QFS2SV8pK3
   1gc7EFV7Z9w6PfwUPBpOIG1FxFp+1IZ09WUVDmiTSJkxIjQX7ef4d2/qP
   WHKIFpCocUqf+0xBP0r+b9kMotT39Fqs5l1hGdoD5x6WKeAtLkB+Rdz7m
   jMeGQ13n8qJiXaXCXV/7+KmbgoN9hvj7yfz2+Ioll26FimuSe3ZmtcKEg
   t5/T1tmGcGzA6Fe9qG4+hd0wLuwtaDufIh6xnFsUZKFiljshhZ4XH4MRg
   Q==;
X-CSE-ConnectionGUID: Ry5VgHxIQ2WWR/LmckZPBA==
X-CSE-MsgGUID: FDYFlbklSyiUiIq9h+izCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39486710"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="39486710"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 18:12:47 -0700
X-CSE-ConnectionGUID: Cylb/ryNTROPE9PT/JVXyA==
X-CSE-MsgGUID: Upt9VxdoQ0aRLxeFd6wSgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="81887358"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Oct 2024 18:12:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szQgV-000Cut-0z;
	Sat, 12 Oct 2024 01:12:43 +0000
Date: Sat, 12 Oct 2024 09:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 5/5] asm-generic/io.h: Remove I/O port accessors for
 HAS_IOPORT=n
Message-ID: <202410120803.PveI3ZXV-lkp@intel.com>
References: <20241008-b4-has_ioport-v8-5-793e68aeadda@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-b4-has_ioport-v8-5-793e68aeadda@linux.ibm.com>

Hi Niklas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Schnelle/hexagon-Don-t-select-GENERIC_IOMAP-without-HAS_IOPORT-support/20241008-204236
base:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
patch link:    https://lore.kernel.org/r/20241008-b4-has_ioport-v8-5-793e68aeadda%40linux.ibm.com
patch subject: [PATCH v8 5/5] asm-generic/io.h: Remove I/O port accessors for HAS_IOPORT=n
config: um-randconfig-002-20241011 (https://download.01.org/0day-ci/archive/20241012/202410120803.PveI3ZXV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120803.PveI3ZXV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120803.PveI3ZXV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/sbc8360.c:233:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     233 |         outb(0, SBC8360_ENABLE);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:226:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     226 |         outb(wd_margin, SBC8360_BASETIME);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:212:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     212 |         outb(0x0A, SBC8360_ENABLE);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:214:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     214 |         outb(0x0B, SBC8360_ENABLE);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:217:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     217 |         outb(wd_multiplier, SBC8360_ENABLE);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   drivers/watchdog/sbc8360.c:226:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     226 |         outb(wd_margin, SBC8360_BASETIME);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
>> drivers/watchdog/sbc8360.c:233:2: error: call to '_outb' declared with 'error' attribute: outb() requires CONFIG_HAS_IOPORT
     233 |         outb(0, SBC8360_ENABLE);
         |         ^
   include/asm-generic/io.h:655:14: note: expanded from macro 'outb'
     655 | #define outb _outb
         |              ^
   include/asm-generic/io.h:596:15: note: expanded from macro '_outb'
     596 | #define _outb _outb
         |               ^
   7 errors generated.


vim +233 drivers/watchdog/sbc8360.c

3809ad384af43a drivers/char/watchdog/sbc8360.c Ian E. Morgan    2005-09-01  228  
12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-18  229  /* stop watchdog */
12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-18  230  static void sbc8360_stop(void)
12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-18  231  {
12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-18  232  	/* De-activate the watchdog */
12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-18 @233  	outb(0, SBC8360_ENABLE);
12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-18  234  }
12b7a1523eda9c drivers/watchdog/sbc8360.c      Wim Van Sebroeck 2008-07-18  235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
