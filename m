Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D449D518;
	Wed, 28 Jun 2023 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687976092; x=1719512092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k01upmdyss+6NNIQ8lG8Bnph4OIWKHmAe1qEjCFCWjk=;
  b=fRrxxb7LkU83EpFiuOx7OihtqCp+h3Go42N9MRZbrzHGvQsUu8FOWcOn
   FZcFDVmwGLOXyvytDIrV9DXLKO6Z87rNwf6YnUfIOGhb+KPQQFaSpRShq
   H6W1rb21PA+tu1UQkttgfHckitHiMbCQKeH1yXrj3kxXYAgJXm3EyU4eG
   nVXasFyf8d50NSRUBWFTVMdXbXC2OfmwmgiJ4nCxpG7ogJDNDz7UZLxpd
   uZqC7FjPWchmLudjgUqpUQ2PgwcUAyuPHk0wNEjifSFStVzULuj4MowUB
   OyxFuYBRaIFttf1iLD+VBfYezxdLd4NCFyDnNyZHDZIu75DCzs1cKcmI+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448307620"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="448307620"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 11:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963710744"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="963710744"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2023 11:14:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEZgn-000DQ1-2P;
	Wed, 28 Jun 2023 18:14:49 +0000
Date: Thu, 29 Jun 2023 02:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 3/5] mm/shmem.c:96:8: warning: 'const' type
 qualifier on return type has no effect
Message-ID: <202306290207.4pcekBLh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   add608c3e9db6e64e0cde5d883257d6fa6163bea
commit: 185978bc72854af761d4c55d648d7e0c237be725 [3/5] shmem: 16K on 4K hack
config: arm-randconfig-r046-20230628 (https://download.01.org/0day-ci/archive/20230629/202306290207.4pcekBLh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290207.4pcekBLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290207.4pcekBLh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:96:8: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      96 | static const unsigned long shmem_base_nr(struct address_space *mapping) {
         |        ^~~~~~
   1 warning generated.


vim +/const +96 mm/shmem.c

    95	
  > 96	static const unsigned long shmem_base_nr(struct address_space *mapping) {
    97		return 1L << mapping->order;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
