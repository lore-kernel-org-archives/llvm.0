Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703B53672BF;
	Thu, 21 May 2026 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374803; cv=none; b=WtWtKom1YPbHY71dA1RkyODpnmJjv3UFmwSniT/S5oFWgMYn+QHN8ARS0Y3W0qiI2btxg5qZk7O9EGSa625+MDSMgdvQtzHxIvErt+KBa+wX9XN04Ble22xpNH1bFMzKC2Eo/UIcQWZBWXupCPo6kjEfwEYOpi+6kX1tLhWb3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374803; c=relaxed/simple;
	bh=sPrKm0Twa0Ara9NZCuihTY7k9o56SY7VyXcY+tux2AU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kFToxunGG81opkrjfpoQ4CSYIeeRpzrzKDfAFhGNf9lKFLvZP7q8On5tmHTbXGcwoUNb7G6sF3vbcEwGMYD1I0Dn71otBxfPeP8/lLBwja6fXYNOmUA9PpAIp2D4BzALTNnRKIwnChu04obnKhW9nmdD3IUSdp/8NP+vlPA8T+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLNBeKgD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLNBeKgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779374802; x=1810910802;
  h=date:from:to:cc:subject:message-id;
  bh=sPrKm0Twa0Ara9NZCuihTY7k9o56SY7VyXcY+tux2AU=;
  b=dLNBeKgD5VZYuc0swuAmQtNLpVG75vQ0OBexudOWnPFiew6jfawyyF+h
   ZnPLiYff5wE6b74NauN3v/wuiJ14ggzh4k/WGb+LFDxyivWcJdHEdA8qL
   Q0vDqNS1KBxX/MIzdVgE49Fjk6YjQb4ojqPJ5Pe0nSS3GZm+yhQ7L7tMJ
   /5a3x4tZi2OZQxH0KUFqz3yy1pTbqWVYSfHjF8Q0p+ZBVQXtxIDp4IeEI
   w+QSD8/crwRL1UaGVLrj+/GVefAOc7nBCtSBgR2zR0cP9qT9/bzHr6VV9
   rZ7rRNUoeTjE/ZQ54yqj7xfadHe0o4MrQNSv8oSn0vtpYEjgc/mU4Z5XJ
   A==;
X-CSE-ConnectionGUID: f+suBWquRqSAwnwF1KhsCw==
X-CSE-MsgGUID: J8+9HcaHQf6NPW2FsEfENw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79324359"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="79324359"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 07:46:41 -0700
X-CSE-ConnectionGUID: UBrx9YrYRXikH0h6RYstSg==
X-CSE-MsgGUID: ReOCLPpiTdyy0lwN3kcUSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="244823633"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 May 2026 07:46:40 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ4fV-000000000Wd-16Gm;
	Thu, 21 May 2026 14:46:37 +0000
Date: Thu, 21 May 2026 22:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:x86-cpu-2 6/9] make[4]: *** No rule to make
 target 'arch/x86/um/../lib/atomic64_386_32.o', needed by
 'arch/x86/um/built-in.a'.
Message-ID: <202605212249.zTpdePcV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git x86-cpu-2
head:   1e02572c8cb3ff4e0377b09f63f1ef9a00f80d88
commit: 99af8a9b6cad5150016b3b156dd35d807ee93368 [6/9] x86: make CX8 usage unconditional
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605212249.zTpdePcV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212249.zTpdePcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212249.zTpdePcV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/x86/um/../lib/atomic64_386_32.o', needed by 'arch/x86/um/built-in.a'.
   make[4]: *** [scripts/Makefile.build:289: arch/x86/um/../kernel/sys_ia32.o] Error 1
   make[4]: *** [scripts/Makefile.build:289: arch/x86/um/tls_32.o] Error 1
   make[4]: *** [scripts/Makefile.build:289: arch/x86/um/syscalls_32.o] Error 1
   make[4]: Target 'arch/x86/um/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
