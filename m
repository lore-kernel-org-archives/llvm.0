Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791EA441B;
	Sat,  1 Jul 2023 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688199246; x=1719735246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZ2nGTYAWiHpDRm/SOo5zqQOhYqH6RSAz7mNe3RQ21o=;
  b=FpZAeeGXabnCLgoi1D5lHjUtzUfcb20DB7SqC8Dcy4Ik+IsBOKK6g0Nt
   eJ4+CzWCsmb7XUzl//bMt4UxYlOqbfYDQW9t58pfyIJPm25pRBzTQufC7
   7MjBl0n1HJXw2AM8/QbQzn+YcDySV9Nmdw9kjI77TE6dT+WAeudmpKq56
   loYX4oG72hxWmuvcsf8rHVAqhZC9AGp1xtYnJCcGTAglItGSMQP4tupSh
   MslDRW/mOBkXEfZqbMCld1gJBApZDwP3Btkdrup0zlojtUH092DepBzUN
   OCcdkLuHUK7WH7FKAcQmmWZiKd28BEo9Gazy/QSmOl6CZJy5GrpYTZvuA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="428610071"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="428610071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 01:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="783328575"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="783328575"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2023 01:14:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFVk3-000Fs9-1x;
	Sat, 01 Jul 2023 08:14:03 +0000
Date: Sat, 1 Jul 2023 16:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:splice-fix-corruption 3/4] ld.lld: error: undefined
 symbol: folio_total_mapcount
Message-ID: <202307011618.qtnPIiyW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git splice-fix-corruption
head:   b7635ac359c8d2a679e0c0bd9bf7acab652ff3fb
commit: a7899df4243c815f5fff96738d4d3179b9113698 [3/4] splice: Remove some now-unused bits
config: riscv-randconfig-r042-20230629 (https://download.01.org/0day-ci/archive/20230701/202307011618.qtnPIiyW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011618.qtnPIiyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011618.qtnPIiyW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: folio_total_mapcount
   >>> referenced by splice.c
   >>>               fs/splice.o:(__se_sys_vmsplice) in archive vmlinux.a
   >>> referenced by splice.c
   >>>               fs/splice.o:(__se_sys_vmsplice) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
