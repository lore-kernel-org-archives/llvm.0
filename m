Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9B733C1BE;
	Sat, 25 Jul 2026 01:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784942568; cv=none; b=Sl5a3zTEl8WeLe5zCb4yvFRYhEp/oPF7E1K4fL0Wc2f7zoVoxj/vfUOnMAU2RIxfmpGqw3EqpQuxuA+38Ip5WU14oo23tkqZbkAxln0vTehx/43jVPO6Xw6dmwMaEOCn/ycgTS/6hXrJ4N8NAPFhqLpEIXkqmEKKQP9+IW33UsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784942568; c=relaxed/simple;
	bh=z89TiYrHF8S6hnr2jlfbZelgHdLEmvhtm3TeUzTTusA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kOSAvYWig/tbnH6rW5rTxpjb8SRmcr7ovgdYYFX7KJtDwg9xssy3THHu/WRVaX9mURkpGmRPq+mTMA9rW32zKoT38r3WDV7Z0/Wcm/txE6u+nA/wLLh1H/ZkjsQSpT5ph6nBr2/77VB13BrN9tZ1HCbmHYOLJ8GxNGZq41VwoRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrY6PTqc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrY6PTqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784942565; x=1816478565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z89TiYrHF8S6hnr2jlfbZelgHdLEmvhtm3TeUzTTusA=;
  b=NrY6PTqcgNOVHMIDipofO7aKcFvl7OR9Fn3Q5VHK7Ci/lmCz91mAfK86
   djDOu7u6wxqA9H1jO7u0fforgow7Vv5tVbMLwUJf8xA86Gn9tH3GCkNDK
   sZV9hdAZWInf7ZAdGCbYL5wn74sxA/nsZccqK/DYFqFZphAXaAAdKV+B9
   gMesNhluXz3+YfeGbU+FILX0Ur4U+u710R8ssFBll2A3F9UKnghgvsMdo
   d+yYgl9EVa58/QHzr1rRqW775UazKMzYOMceFda33IUIkCsjnrWiZFg29
   MgBUXqroAVF0MGh4Wk3K1HFVnpSAvRE0eJZkjMz2siyWKUKP4xghE3MTk
   w==;
X-CSE-ConnectionGUID: HdLswJiERfOSDIvL0dmZyA==
X-CSE-MsgGUID: WwgiaHemSe2sHXY3ZuUb7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="84592200"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="84592200"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 18:22:42 -0700
X-CSE-ConnectionGUID: n4eluMK6SR+ViuVNgb4Hew==
X-CSE-MsgGUID: sKnXlI5hQ/eDZVOtwpZUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="288838674"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Jul 2026 18:22:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnR66-00000000158-3nvw;
	Sat, 25 Jul 2026 01:22:38 +0000
Date: Sat, 25 Jul 2026 03:22:36 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: scripts/syscalltbl.sh: 100: Syntax error: redirection
 unexpected
Message-ID: <202607250346.BuwihS2v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/syscalls-Create-unified-partial-table-for-all-archs/20260725-040333
head:   8c63d3ddb37ca9ef5da08071f85493dd0b281816
commit: d1da21b66eb29855b0d6a4d81ddfeb31efd2f125 syscalls: Create unified partial table for all archs
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260725/202607250346.BuwihS2v-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607250346.BuwihS2v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607250346.BuwihS2v-lkp@intel.com/

All errors (new ones prefixed by >>):

>> scripts/syscalltbl.sh: 100: Syntax error: redirection unexpected
   make[3]: *** [arch/x86/entry/syscalls/Makefile:52: arch/x86/include/generated/asm/syscalls_32.h] Error 2
>> scripts/syscallhdr.sh: 114: Syntax error: redirection unexpected
>> scripts/syscallhdr.sh: 114: Syntax error: redirection unexpected
   make[3]: *** [arch/x86/entry/syscalls/Makefile:29: arch/x86/include/generated/uapi/asm/unistd_32.h] Error 2
   make[3]: *** [arch/x86/entry/syscalls/Makefile:43: arch/x86/include/generated/uapi/asm/unistd_64.h] Error 2
>> scripts/syscalltbl.sh: 100: Syntax error: redirection unexpected
>> scripts/syscallhdr.sh: 114: Syntax error: redirection unexpected
   make[3]: *** [arch/x86/entry/syscalls/Makefile:55: arch/x86/include/generated/asm/syscalls_64.h] Error 2
   make[3]: *** [arch/x86/entry/syscalls/Makefile:39: arch/x86/include/generated/uapi/asm/unistd_x32.h] Error 2
>> scripts/syscallhdr.sh: 114: Syntax error: redirection unexpected
>> scripts/syscallhdr.sh: 114: Syntax error: redirection unexpected
   make[3]: *** [arch/x86/entry/syscalls/Makefile:34: arch/x86/include/generated/asm/unistd_32_ia32.h] Error 2
   make[3]: *** [arch/x86/entry/syscalls/Makefile:48: arch/x86/include/generated/asm/unistd_64_x32.h] Error 2
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [arch/x86/Makefile:256: archheaders] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
