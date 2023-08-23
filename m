Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7481105;
	Wed, 23 Aug 2023 01:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692753855; x=1724289855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9KvJzjR0osX3H/xVlk6Z0b2tzeo5amibIsn1ZwMHKw=;
  b=UBEUbAK5IRpcpHNlaWaPdOYMlD+TCVpMSUm7kBkK854Djnp2itmeDocM
   PUeXlyA9MYIlhJmmGFIa3VplfjXhXTnBZoVLRKkZ91Uzkw83wnDW7V1iP
   KIEZEvwlBPKEZaH2CkkcO3svjNYJu2UI70ket/WDID2E9O07FGM9a/HxD
   CA16BB5XwHlG8wJrYrXE88g2hOmIMJcdDzlgAN+SVU2AMs3b5FL8VKCJy
   r4oQkS6LgoIemcTHUrAn2XzHjQerN06lY08rnMxUiEVEbwzlIwpz0pB7r
   yN0uyVU7HiSprnZ2+nXEb17/1BPXp7d8c+C8UfHBHBvmUC8eGnNcgog/h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="377794419"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="377794419"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 18:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="801900984"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="801900984"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 18:24:13 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYcbU-0000hQ-26;
	Wed, 23 Aug 2023 01:24:12 +0000
Date: Wed, 23 Aug 2023 09:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linuxppc:merge-test 18/29]
 arch/powerpc/platforms/pseries/vphn.c:79:6: error: no previous prototype for
 function 'hcall_vphn'
Message-ID: <202308230912.1kXexjac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/linuxppc/linux merge-test
head:   d9e93a45f3bc203364872fe3fe0532d3717f1c37
commit: b0e66fc213781fd287815bd5ddd51d66cc88a41f [18/29] powerpc/pseries: Move VPHN constants into vphn.h
config: powerpc64-randconfig-r003-20230823 (https://download.01.org/0day-ci/archive/20230823/202308230912.1kXexjac-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230912.1kXexjac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230912.1kXexjac-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/vphn.c:79:6: error: no previous prototype for function 'hcall_vphn' [-Werror,-Wmissing-prototypes]
      79 | long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity)
         |      ^
   arch/powerpc/platforms/pseries/vphn.c:79:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      79 | long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity)
         | ^
         | static 
   1 error generated.


vim +/hcall_vphn +79 arch/powerpc/platforms/pseries/vphn.c

5a1ea4774ddc2c Naveen N. Rao 2019-07-03  78  
5a1ea4774ddc2c Naveen N. Rao 2019-07-03 @79  long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity)

:::::: The code at line 79 was first introduced by commit
:::::: 5a1ea4774ddc2c6bc3ba1415880091eccf1a901e powerpc/pseries: Move mm/book3s64/vphn.c under platforms/pseries/

:::::: TO: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
