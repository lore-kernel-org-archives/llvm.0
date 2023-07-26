Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAA11DA20;
	Wed, 26 Jul 2023 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690382369; x=1721918369;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RBAiNlNIUVg3mo/vJGenZiAnbAsvvtCDCMY/dF65aog=;
  b=WJhO/Ep+aV8AQ/mnHKjil2qkEK78kTcPdfqXycVvjHFOyJqdm0tR9Sx9
   hQlTZZ4wOeL3w8u8sADCUqD5Ty34Q0qxK34d4ZpnKnI13MkGxCHNycg3m
   swdVNkodQqnWAXa3KM8QwnEOiyGqVy69paBMPHXJQN7kzNSN/V6mXMdkw
   fX0VYJgn+Bg5dlHm/rnZpVhHxyWInfxA06hw2lAm1+ikqxoyGULz6JEuF
   YghQZJQmjD6QPoGG7wqIv1dtr1rWYLfvujhO1PUoEfQnVWRwErOgqLnKo
   BwBeiQ3MFBakEmA6eauUEucmgscEt13uQOm1IwIJHsCBhjvhuRcI8aBlf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="371644925"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="371644925"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 07:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="900445753"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="900445753"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2023 07:39:25 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOffh-00011R-0W;
	Wed, 26 Jul 2023 14:39:25 +0000
Date: Wed, 26 Jul 2023 22:38:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 3835/4710] clang: error: unknown argument:
 '-msym32'
Message-ID: <202307262218.hpvyrXrf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Maciej W. Rozycki" <macro@orcam.me.uk>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: "Philippe Mathieu-Daudé" <philmd@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ba5d07205771c50789fd9063950aa75e7f1183f
commit: a79a404e6c2241ebc528b9ebf4c0832457b498c3 [3835/4710] MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `modules_install' regression
config: mips-randconfig-r034-20230726 (https://download.01.org/0day-ci/archive/20230726/202307262218.hpvyrXrf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307262218.hpvyrXrf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307262218.hpvyrXrf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unknown argument: '-msym32'
>> clang: error: unknown argument: '-msym32'
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1 shuffle=249098922
   make[3]: Target 'missing-syscalls' not remade because of errors.
   make[2]: *** [arch/mips/Makefile:430: archprepare] Error 2 shuffle=249098922
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=249098922
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=249098922
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
