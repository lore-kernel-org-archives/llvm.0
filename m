Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47B68481;
	Wed, 30 Aug 2023 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693433130; x=1724969130;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9jGgd69MEGUAjwHGVw5QiI3Ycfntazk2TP+N7CIuKWU=;
  b=VSORbv4dexdjd9g6pyDoCgxSp3R9uMkTHDj2crO138TeUjqRTprFFc4O
   1DiIkW2Yv2YQ4U7H4j+vA7udvj6y6etSjSPA2luJTLlK4NP4ed/zbCMzW
   DoQ4Wp2uPvalbwjsje6SgHuieQTsBw1ROs8irLexxXHsQOful1TfTWUI6
   oFDGgxpbW/HH2hAtWdc+71uY+A+AUkdfS7OfqkwtG5ExlGj+LMI2V8WhI
   pomTb1gBfQxwn5kSY5BOT0DrrlKjxRy82Bodk8SjDx3CB3WoCsJGX3r2C
   z11Bhv6XfcInfteqnwUztVwFii38j2/X1fmy9KrCGbdJnb20yIfrsCIHV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375711214"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="375711214"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 15:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809299224"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="809299224"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2023 15:05:27 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbTJV-000AH1-0D;
	Wed, 30 Aug 2023 22:05:26 +0000
Date: Thu, 31 Aug 2023 06:04:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error:
 vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation
 R_HEX_B22_PCREL out of range: 2110640 is not in [-2097152, 2097151];
 references '__vmnewmap'
Message-ID: <202308310611.dirpEMwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   53ea7f624fb91074c2f9458832ed74975ee5d64c
commit: 3216484550610470013b7ce1c9ed272da0a74589 kbuild: use obj-y instead extra-y for objects placed at the head
date:   11 months ago
config: hexagon-randconfig-002-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310611.dirpEMwf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310611.dirpEMwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310611.dirpEMwf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2110640 is not in [-2097152, 2097151]; references '__vmnewmap'
   >>> referenced by head.S:122 (arch/hexagon/kernel/head.S:122)
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x12c): relocation R_HEX_B22_PCREL out of range: 2110512 is not in [-2097152, 2097151]; references '__vmsetvec'
   >>> referenced by head.S:163 (arch/hexagon/kernel/head.S:163)
   >>> defined in vmlinux.a(arch/hexagon/kernel/vm_ops.o)
--
>> ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):(.init.text+0x160): relocation R_HEX_B22_PCREL out of range: 2121984 is not in [-2097152, 2097151]; references 'memset'
   >>> referenced by head.S:198 (arch/hexagon/kernel/head.S:198)
   >>> defined in vmlinux.a(arch/hexagon/lib/memset.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
