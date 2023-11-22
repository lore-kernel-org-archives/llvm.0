Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17C754BEF;
	Wed, 22 Nov 2023 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4+ZzRO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700676563; x=1732212563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4JENVpqXOViel0rt8RIv7h36jZXGtWho2re5/QyTnM=;
  b=d4+ZzRO//gWAQtF+xe1Ah7P2fxSRGberv9hjdmy9beI+QLbh6H11b1nw
   l8UOhhpOLnRXFd2ISuBdNy20o9dbH0dZ48wRdYy+QTkRpz+Ssgm9i+o4n
   ZI3ECA6JuIfoNsRbZGF+nPE603zHyr6WNuhORy5RJgxfvL/Qqu9DHR+DF
   cSKPIayEAYIahw2rGyK4S3zDoXmiYkOW3A7Nf1ZBXHwaDDIQfSFbHIdLO
   YJMUMOWGr38mIgzM3ahPPRlk0easHto53vxIb+0PDBrzVWbvwG9D4L5sA
   nqmRThx6WHbHnILJ7XULFK93CENfBbpBbDiyLrg6nFFDxasjgPCpIKGDD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389272505"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="389272505"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 10:09:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837524663"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="837524663"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Nov 2023 10:09:20 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5rf4-0000lQ-0O;
	Wed, 22 Nov 2023 18:09:18 +0000
Date: Thu, 23 Nov 2023 02:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2099/2429] fs/bcachefs/btree_write_buffer.c:32:6:
 error: unknown token in expression
Message-ID: <202311230137.gpCHK9z4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   288736c822de7fd3b69be317c11eaa8dfb78bf6f
commit: 2163db2aabf55033fca1637ff633f9c1f5fc8b31 [2099/2429] bcachefs: Inline btree write buffer sort
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231123/202311230137.gpCHK9z4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230137.gpCHK9z4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230137.gpCHK9z4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:35: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%rdx];sub rax, [%rcx];mov rax, [%rdx + 8];sbb rax, [%rcx + 8];mov rax, [%rdx + 16];sbb rax, [%rcx + 16];.att_syntax prefix;
                                            ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:51: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%rdx];sub rax, [%rcx];mov rax, [%rdx + 8];sbb rax, [%rcx + 8];mov rax, [%rdx + 16];sbb rax, [%rcx + 16];.att_syntax prefix;
                                                            ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:67: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%rdx];sub rax, [%rcx];mov rax, [%rdx + 8];sbb rax, [%rcx + 8];mov rax, [%rdx + 16];sbb rax, [%rcx + 16];.att_syntax prefix;
                                                                            ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:87: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%rdx];sub rax, [%rcx];mov rax, [%rdx + 8];sbb rax, [%rcx + 8];mov rax, [%rdx + 16];sbb rax, [%rcx + 16];.att_syntax prefix;
                                                                                                ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:107: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%rdx];sub rax, [%rcx];mov rax, [%rdx + 8];sbb rax, [%rcx + 8];mov rax, [%rdx + 16];sbb rax, [%rcx + 16];.att_syntax prefix;
                                                                                                                    ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:128: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%rdx];sub rax, [%rcx];mov rax, [%rdx + 8];sbb rax, [%rcx + 8];mov rax, [%rdx + 16];sbb rax, [%rcx + 16];.att_syntax prefix;
                                                                                                                                         ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:35: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%r14];sub rax, [%r15];mov rax, [%r14 + 8];sbb rax, [%r15 + 8];mov rax, [%r14 + 16];sbb rax, [%r15 + 16];.att_syntax prefix;
                                            ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:51: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%r14];sub rax, [%r15];mov rax, [%r14 + 8];sbb rax, [%r15 + 8];mov rax, [%r14 + 16];sbb rax, [%r15 + 16];.att_syntax prefix;
                                                            ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:67: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%r14];sub rax, [%r15];mov rax, [%r14 + 8];sbb rax, [%r15 + 8];mov rax, [%r14 + 16];sbb rax, [%r15 + 16];.att_syntax prefix;
                                                                            ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:87: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%r14];sub rax, [%r15];mov rax, [%r14 + 8];sbb rax, [%r15 + 8];mov rax, [%r14 + 16];sbb rax, [%r15 + 16];.att_syntax prefix;
                                                                                                ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:107: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%r14];sub rax, [%r15];mov rax, [%r14 + 8];sbb rax, [%r15 + 8];mov rax, [%r14 + 16];sbb rax, [%r15 + 16];.att_syntax prefix;
                                                                                                                    ^
>> fs/bcachefs/btree_write_buffer.c:32:6: error: unknown token in expression
           asm(".intel_syntax noprefix;"
               ^
   <inline asm>:1:128: note: instantiated into assembly here
           .intel_syntax noprefix;mov rax, [%r14];sub rax, [%r15];mov rax, [%r14 + 8];sbb rax, [%r15 + 8];mov rax, [%r14 + 16];sbb rax, [%r15 + 16];.att_syntax prefix;
                                                                                                                                         ^
   12 errors generated.


vim +32 fs/bcachefs/btree_write_buffer.c

    26	
    27	static inline bool wb_key_cmp(const struct wb_key_ref *l, const struct wb_key_ref *r)
    28	{
    29	#ifdef CONFIG_X86_64
    30		int cmp;
    31	
  > 32		asm(".intel_syntax noprefix;"
    33		    "mov rax, [%[l]];"
    34		    "sub rax, [%[r]];"
    35		    "mov rax, [%[l] + 8];"
    36		    "sbb rax, [%[r] + 8];"
    37		    "mov rax, [%[l] + 16];"
    38		    "sbb rax, [%[r] + 16];"
    39		    ".att_syntax prefix;"
    40		    : "=@ccae" (cmp)
    41		    : [l] "r" (l), [r] "r" (r)
    42		    : "rax", "cc");
    43	
    44		EBUG_ON(cmp != __wb_key_cmp(l, r));
    45		return cmp;
    46	#else
    47		return __wb_key_cmp(l, r);
    48	#endif
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
