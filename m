Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1424C236433;
	Tue,  8 Apr 2025 18:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138487; cv=none; b=fAnwff3m5Hp4zFehkGAFpndIz2C9Yw90RWJmT4C4sN6v88XYz1ejJvnxODWJj/AMsNCU3e8LWS8f4jTSI5XPEdMDwcsax6MDw8Ckp3p6xwcejaPuW11gEayLcC405wU0ajO/gWosAf9myoKn5PxccVFAiplp+o4HjX+Br7gubN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138487; c=relaxed/simple;
	bh=ywjJEmuZPM1iyGk0mIqblxFAdmgkg6pH6xB0IAfcLqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLpsj5blvAYrC56Pn80cmeFDM5/3hb5Ut+Y/4UZuMGoMF99pFxEdwaUa6GK/RdNN0zxS+W6PC185dNzv5hqlAiYs+tbwyV9HZ7PjIFPLvY/o1MXwtXrNCRX9mt1zkPhQ1wo9y/Ims+u6IJreZwath3FjIWCAe2wDo8eop96WCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VT35wrwA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VT35wrwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744138486; x=1775674486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ywjJEmuZPM1iyGk0mIqblxFAdmgkg6pH6xB0IAfcLqU=;
  b=VT35wrwAb7/8B+pVmTyaB70w4E6W7wG80+ijyAeGxEO4NIw1/5eFr1by
   59RI8fWENmtEgv+zGuyoYqvsDAabN/fIZwkVelIDtMUN4l49FN8kNvwyY
   4FSLGO6WUPAPQUGq+ndAOAUDPtlZ2g1ulgzjT2IiEcCNbtJT5yyO+3MLb
   OyHdzUzc4njNt4NFZ8qdQCd8QJx5wdCWX6kz+C9WG0iBiHKcZ06iadhQY
   8AF7Qp23mcxBj9Sf6C+n/+IyqBHkwdozKw8QKqYJXvKCWpbZnqhLKVk4H
   omphA6JAHu0q145c97D3xPef4Kv4s6B+eR9tUaX3mALn26nOVXd7GC0nY
   g==;
X-CSE-ConnectionGUID: L377GGfhShKMutib/ygG2w==
X-CSE-MsgGUID: wD+SYZsvRX22oJu1YoWElw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45478256"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45478256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 11:54:45 -0700
X-CSE-ConnectionGUID: WHWcMP4qSf2hLvbT7spdLg==
X-CSE-MsgGUID: Jx8N1yOPQwSX29lY0yk2EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="132487510"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2025 11:54:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2E5o-0007tR-2U;
	Tue, 08 Apr 2025 18:54:40 +0000
Date: Wed, 9 Apr 2025 02:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: rust/helpers/io.c:12:10: error: passing 'volatile void *' to
 parameter of type 'void *' discards qualifiers
Message-ID: <202504090231.9MRSDPoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Danilo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0af2f6be1b4281385b618cb86ad946eded089ac8
commit: ce30d94e6855a4f6dc687f658e63c225fcc1d690 rust: add `io::{Io, IoRaw}` base types
date:   4 months ago
config: um-randconfig-002-20250409 (https://download.01.org/0day-ci/archive/20250409/202504090231.9MRSDPoU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090231.9MRSDPoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090231.9MRSDPoU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:17:
>> rust/helpers/io.c:12:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           iounmap(addr);
                   ^~~~
   arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
   static inline void iounmap(void __iomem *addr)
                                            ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:194: rust/helpers/helpers.o] Error 1 shuffle=3926512877
>> rust/helpers/io.c:12:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
   arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
   make[3]: *** [rust/Makefile:330: rust/bindings/bindings_helpers_generated.rs] Error 101 shuffle=3926512877
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1269: prepare] Error 2 shuffle=3926512877
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3926512877
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3926512877
   make: Target 'prepare' not remade because of errors.


vim +12 rust/helpers/io.c

     9	
    10	void rust_helper_iounmap(volatile void __iomem *addr)
    11	{
  > 12		iounmap(addr);
    13	}
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
