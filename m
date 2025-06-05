Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F127A915;
	Thu,  5 Jun 2025 19:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151403; cv=none; b=Yy8IcCi6ICHtw7Hdvw3GQJrsLWewgjs5vYPjkAZkpKVpij+KzlP3nQiSEtRoRdfPVT2OoCZPx7GJ/hrg4KJiInywA83JVQPedkwzJMlWBKYea1xZsFUPTZQH74A8+AErwFUCryhewBRp2LdPob5BF/oAXQCT4n5g1nBcO8JD3rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151403; c=relaxed/simple;
	bh=fNUPHy1GkKj9GHy8djJTbawJhLN5lKKQY4/+nWFYzV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=auQ0oauADl3hXLxXzAnAmAOrVEk87S6PcuCZFZIShdlL+Xzx0RlMIpsD2t+yx0gToSI/yedIuoQEsLNNtFBkB/Yg7ZE51OYtTEjlzWjtpCUl5Ooi3Zt7izBJqaAxb2ibeYtv80gl1aAvvmB/hNE/cUmc3HlFgjsyzjpS76PEcLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PpQ1IrRD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpQ1IrRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749151401; x=1780687401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNUPHy1GkKj9GHy8djJTbawJhLN5lKKQY4/+nWFYzV0=;
  b=PpQ1IrRD6TixE6DGES/RwVPpc0cYN7Ura5QGGX4hz8q7OCRzpMERFEZH
   tPOnRhBM4NXujpoieZnaatxwbDvOvso6vqVzxTIaI/bP7d1bcCAOHj90Z
   UgTdjsktYtsxU+DRh3kzBQ3lSZKtJ+bTadFhedWMUeqHnob0b4VUwHDSu
   L/5q0tjF+p8IsB2Pb+H6f/zsaL6Hy0/lZdOraP3m8UkHXOtwbW5Oh8c0/
   tn9hwNzGgkyz0sJHXQenEfB7vTbskobQBHn2nKVf7cqcRvKZmG0ZP3KNA
   23+GuvEeUj0w7iDoRnuigJPuR78kvOJPGecJjkCQfi34VytWsRVYQszhV
   Q==;
X-CSE-ConnectionGUID: 1t9dG3/rSSuMKuYKoLms1A==
X-CSE-MsgGUID: ciEEXLaUTdmGLDXJa8CJBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62686693"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="62686693"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 12:23:20 -0700
X-CSE-ConnectionGUID: b313nIXjSxOk7K87+E+oZQ==
X-CSE-MsgGUID: dPqlZMzHTDCzeUECH7M/nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="150762619"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2025 12:23:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNGBJ-0004P7-0h;
	Thu, 05 Jun 2025 19:23:17 +0000
Date: Fri, 6 Jun 2025 03:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [peterz-queue:x86/urgent 4/5] arch/x86/kernel/alternative.c:264:14:
 error: call to undeclared function 'its_alloc'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202506060355.7UJHIyDa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
head:   e87348e4a2daaf44da409991ca751e8844b27ef8
commit: 01c48b9466bf0ecf95821e3ea1a58b876c4e8aaf [4/5] x86/its: explicitly manage permissions for ITS pages
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250606/202506060355.7UJHIyDa-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060355.7UJHIyDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060355.7UJHIyDa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/alternative.c:264:14: error: call to undeclared function 'its_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     264 |                 its_page = its_alloc();
         |                            ^
>> arch/x86/kernel/alternative.c:264:12: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     264 |                 its_page = its_alloc();
         |                          ^ ~~~~~~~~~~~
   2 errors generated.


vim +/its_alloc +264 arch/x86/kernel/alternative.c

e52c1dc7455d32 Peter Zijlstra 2025-04-23  262  
872df34d7c51a7 Peter Zijlstra 2024-10-14  263  	if (!its_page || (its_offset + size - 1) >= PAGE_SIZE) {
872df34d7c51a7 Peter Zijlstra 2024-10-14 @264  		its_page = its_alloc();
872df34d7c51a7 Peter Zijlstra 2024-10-14  265  		if (!its_page) {
872df34d7c51a7 Peter Zijlstra 2024-10-14  266  			pr_err("ITS page allocation failed\n");
872df34d7c51a7 Peter Zijlstra 2024-10-14  267  			return NULL;
872df34d7c51a7 Peter Zijlstra 2024-10-14  268  		}
872df34d7c51a7 Peter Zijlstra 2024-10-14  269  		memset(its_page, INT3_INSN_OPCODE, PAGE_SIZE);
872df34d7c51a7 Peter Zijlstra 2024-10-14  270  		its_offset = 32;
872df34d7c51a7 Peter Zijlstra 2024-10-14  271  	}
872df34d7c51a7 Peter Zijlstra 2024-10-14  272  
872df34d7c51a7 Peter Zijlstra 2024-10-14  273  	/*
872df34d7c51a7 Peter Zijlstra 2024-10-14  274  	 * If the indirect branch instruction will be in the lower half
872df34d7c51a7 Peter Zijlstra 2024-10-14  275  	 * of a cacheline, then update the offset to reach the upper half.
872df34d7c51a7 Peter Zijlstra 2024-10-14  276  	 */
872df34d7c51a7 Peter Zijlstra 2024-10-14  277  	if ((its_offset + size - 1) % 64 < 32)
872df34d7c51a7 Peter Zijlstra 2024-10-14  278  		its_offset = ((its_offset - 1) | 0x3F) + 33;
872df34d7c51a7 Peter Zijlstra 2024-10-14  279  
872df34d7c51a7 Peter Zijlstra 2024-10-14  280  	thunk = its_page + its_offset;
872df34d7c51a7 Peter Zijlstra 2024-10-14  281  	its_offset += size;
872df34d7c51a7 Peter Zijlstra 2024-10-14  282  
872df34d7c51a7 Peter Zijlstra 2024-10-14  283  	return its_init_thunk(thunk, reg);
872df34d7c51a7 Peter Zijlstra 2024-10-14  284  }
872df34d7c51a7 Peter Zijlstra 2024-10-14  285  

:::::: The code at line 264 was first introduced by commit
:::::: 872df34d7c51a79523820ea6a14860398c639b87 x86/its: Use dynamic thunks for indirect branches

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
