Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F73B2222DD;
	Thu,  8 May 2025 18:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729455; cv=none; b=PQU0G56NLP7CT1n1HrqB38JmA1uI5OqRFj1M8NhPBZoB73yBS7h+NtWvviwijvJTfnMNNXY7m4BrERGDIn8jFVO3HW4nukzFQKSQSJ5Metdg8jy3fyKi60e9WKJ5l5Hadgjn65UI80RKQ/84nZDi2yBSUu9mJzhlpbx9J6lIOJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729455; c=relaxed/simple;
	bh=EoIQ+cqAfiB7251AtfH+yl08bQmIgz6Fipk58bk8xJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WR+HzljlMJK0Ksq60Ot+HeWz+tIkmyMguBftzY8XuF/xqvu9O+gpMR7wZR7Q4DTR1QeP0TsSM4M2xq9MjleKhW/U4eNnhhxZIFmEJsBnzb3FJSdqibB6TF9hQrgcU2I4AMJAnuOMn6BAPq7uRIa5I+ACc/Uh4bLknkoBPuJf758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLz0ueFf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLz0ueFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746729453; x=1778265453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EoIQ+cqAfiB7251AtfH+yl08bQmIgz6Fipk58bk8xJ4=;
  b=lLz0ueFfMLzjNe1QY79uwr7yQGwFQkmwtTTZrn7vTAEHy/QJLQXs21c9
   bYHPIdLHvA7T1MCg9tqPdt3A2uRCSrxZm8w9F+vsswZ5n2BcJJNg/AzlD
   szfyzhbmnL58+cbprWxqb6/MMqKStCgdQYVqe9DOM1wG7ztT2uoQSa0gJ
   cnbJ47PRhom3B3GVpUUIfqBwyZDCB+D6Nxo0xLz0qOfpdZySzhf0PvpOW
   Az5DhMR82n2b5W96hgbKB3w/VGGn7PyiLhMK4GLSl5KYPF+sL5eBaUt1i
   uiYLZOIvMhj8yblUOlD19sD0czOn3ZrUeiBD6ir80Xvhl/YZLrURUQnqJ
   g==;
X-CSE-ConnectionGUID: 4EaNvknzTY+dhCvb+lMvCA==
X-CSE-MsgGUID: qzFVk6FpRdmDXoDkdRt9GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47637339"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="47637339"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 11:37:32 -0700
X-CSE-ConnectionGUID: nr0z77mySvOfWRBnD3WebQ==
X-CSE-MsgGUID: NWT9aWVlSpysfV+lEtCAUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136262559"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2025 11:37:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD67d-000BGZ-1A;
	Thu, 08 May 2025 18:37:29 +0000
Date: Fri, 9 May 2025 02:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 40/57] arch/arm/include/asm/jump_label.h:46:8:
 error: redefinition of 'jump_entry'
Message-ID: <202505090246.h9Z2HgQ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   a756ad343c6f178683f423165424a8b5b8048da8
commit: 076ba887573130fab206095fc9371b6b7727fb22 [40/57] x86/bug: Define ELF section entry size for __jump_table
config: arm-randconfig-003-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090246.h9Z2HgQ4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090246.h9Z2HgQ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090246.h9Z2HgQ4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
   In file included from include/linux/mod_devicetable.h:14:
   In file included from include/linux/uuid.h:11:
   In file included from include/linux/string.h:392:
   In file included from include/linux/fortify-string.h:6:
   In file included from include/linux/bug.h:5:
   In file included from arch/arm/include/asm/bug.h:60:
   In file included from include/asm-generic/bug.h:22:
   In file included from include/linux/printk.h:616:
   In file included from include/linux/dynamic_debug.h:6:
   In file included from include/linux/jump_label.h:122:
>> arch/arm/include/asm/jump_label.h:46:8: error: redefinition of 'jump_entry'
      46 | struct jump_entry {
         |        ^
   include/linux/jump_label.h:116:8: note: previous definition is here
     116 | struct jump_entry {
         |        ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:98: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1368264795
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=1368264795
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1368264795
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1368264795
   make: Target 'prepare' not remade because of errors.


vim +/jump_entry +46 arch/arm/include/asm/jump_label.h

09f05d8529ff4aa Rabin Vincent 2012-02-18  45  
09f05d8529ff4aa Rabin Vincent 2012-02-18 @46  struct jump_entry {
09f05d8529ff4aa Rabin Vincent 2012-02-18  47  	jump_label_t code;
09f05d8529ff4aa Rabin Vincent 2012-02-18  48  	jump_label_t target;
09f05d8529ff4aa Rabin Vincent 2012-02-18  49  	jump_label_t key;
09f05d8529ff4aa Rabin Vincent 2012-02-18  50  };
09f05d8529ff4aa Rabin Vincent 2012-02-18  51  

:::::: The code at line 46 was first introduced by commit
:::::: 09f05d8529ff4aa92311c1a55ce35ac98cb59b8c ARM: 7334/1: add jump label support

:::::: TO: Rabin Vincent <rabin@rab.in>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
