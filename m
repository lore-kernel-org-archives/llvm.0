Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1C42C9A;
	Thu, 31 Jul 2025 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753961924; cv=none; b=eYoK3F1ygYzPoUOYGgxBhjWbJSHmN3nhzTgDXSf+eR7NL/wL5VAXHmtJcSUF/7jcCsaAR0RXHAw+Qvac8Dj2kmUeupPFY2hQB27mYFKZ1Bdwrwgp28DQWWOBI7PKZmhV1NyZJWUnpJKrQzBtu3Q7q3fqdlKvOPFU6S5pS/DALeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753961924; c=relaxed/simple;
	bh=3YxRjAWvCDe5LEm7FQxIMMGsIS8/ufZmz7MavGY9RYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVdcUdd6lsgBy47qaVm3N98FZjpdXJFEbHSROzSCxZVjj8DOvJpiOHRk+ID88BG8OeSwNpFAvzvw8XdmDnFJmzQ8C7vHZpjGFjdHO6i9DE3jG2Ec1FfLsno74ZAQeP4Dvg6X0Na4bn/LXqoJr8naiM+0Nh5CLeMYuv1misdV9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/MEw/C9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/MEw/C9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753961923; x=1785497923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3YxRjAWvCDe5LEm7FQxIMMGsIS8/ufZmz7MavGY9RYc=;
  b=E/MEw/C9fAnla1Z4WZ3MYybmBfVAQ2RdsPGfoJwIptL1W1WOcKZ62809
   Jfo8SJTpmu0WeQLFoiy4hWwPeXCT2Z9GBUpMtryYPZbGKpWQlUgoaeanX
   RCsZxdrlr1XZNPQlY2WNJn0rvW8lPGgVb5HOSoZ/1FyLvTRp/oVhO1Aur
   0oPt2FD8s8u4hAj1vEh12EZFl+ay6PWwJ4/sUjWZT2Xax+1+AwBeATiX3
   XJ6vAjv+xHa18DWZC2uFou3DsjXhAEPc6cIQZzqZ+lepBtqb9BZQQfaHb
   MUc0WiNzm8XcffMuF1C1ekinp6ix71ySqcyvrlD8ZGt0xhohjlD2cPCXh
   A==;
X-CSE-ConnectionGUID: raNu6J92Sx+G4Nqn6pE/HA==
X-CSE-MsgGUID: yZhMomWQSBil5jaDDynTdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56148417"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="56148417"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 04:38:42 -0700
X-CSE-ConnectionGUID: BDEYSKczS22H1iG4TI7SqA==
X-CSE-MsgGUID: C2rFzRaISWqK6MQnKo23HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="194081527"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2025 04:38:41 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhRcM-0003j4-1H;
	Thu, 31 Jul 2025 11:38:38 +0000
Date: Thu, 31 Jul 2025 19:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:vm_normal_page_pud 6/10]
 arch/powerpc/mm/ptdump/ptdump.h:14:1: error: use of 'pgtable_level' with tag
 type that does not match previous declaration
Message-ID: <202507311905.pXY6ZhA9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux vm_normal_page_pud
head:   ee313117a86878c228f0f2e08821cc5f9d6c6b3a
commit: 14d707b0ff670015a8d5bcb669f5ee83706c5332 [6/10] mm/rmap: convert "enum rmap_level" to "enum pgtable_level"
config: powerpc64-randconfig-003-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311905.pXY6ZhA9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311905.pXY6ZhA9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311905.pXY6ZhA9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/ptdump/book3s64.c:10:
>> arch/powerpc/mm/ptdump/ptdump.h:14:1: error: use of 'pgtable_level' with tag type that does not match previous declaration
      14 | struct pgtable_level {
         | ^
   include/linux/pgtable.h:1977:6: note: previous use is here
    1977 | enum pgtable_level {
         |      ^
   In file included from arch/powerpc/mm/ptdump/book3s64.c:10:
   arch/powerpc/mm/ptdump/ptdump.h:20:8: error: use of 'pgtable_level' with tag type that does not match previous declaration
      20 | extern struct pgtable_level pg_level[5];
         |        ^
   include/linux/pgtable.h:1977:6: note: previous use is here
    1977 | enum pgtable_level {
         |      ^
>> arch/powerpc/mm/ptdump/book3s64.c:105:1: error: use of 'pgtable_level' with tag type that does not match previous declaration
     105 | struct pgtable_level pg_level[5] = {
         | ^
   include/linux/pgtable.h:1977:6: note: previous use is here
    1977 | enum pgtable_level {
         |      ^
   3 errors generated.
--
   In file included from arch/powerpc/mm/ptdump/ptdump.c:30:
>> arch/powerpc/mm/ptdump/ptdump.h:14:1: error: use of 'pgtable_level' with tag type that does not match previous declaration
      14 | struct pgtable_level {
         | ^
   include/linux/pgtable.h:1977:6: note: previous use is here
    1977 | enum pgtable_level {
         |      ^
   In file included from arch/powerpc/mm/ptdump/ptdump.c:30:
   arch/powerpc/mm/ptdump/ptdump.h:20:8: error: use of 'pgtable_level' with tag type that does not match previous declaration
      20 | extern struct pgtable_level pg_level[5];
         |        ^
   include/linux/pgtable.h:1977:6: note: previous use is here
    1977 | enum pgtable_level {
         |      ^
   2 errors generated.


vim +/pgtable_level +14 arch/powerpc/mm/ptdump/ptdump.h

97026b5a5ac2654 arch/powerpc/mm/dump_linuxpagetables.h Christophe Leroy 2018-10-09  13  
97026b5a5ac2654 arch/powerpc/mm/dump_linuxpagetables.h Christophe Leroy 2018-10-09 @14  struct pgtable_level {
97026b5a5ac2654 arch/powerpc/mm/dump_linuxpagetables.h Christophe Leroy 2018-10-09  15  	const struct flag_info *flag;
97026b5a5ac2654 arch/powerpc/mm/dump_linuxpagetables.h Christophe Leroy 2018-10-09  16  	size_t num;
97026b5a5ac2654 arch/powerpc/mm/dump_linuxpagetables.h Christophe Leroy 2018-10-09  17  	u64 mask;
97026b5a5ac2654 arch/powerpc/mm/dump_linuxpagetables.h Christophe Leroy 2018-10-09  18  };
97026b5a5ac2654 arch/powerpc/mm/dump_linuxpagetables.h Christophe Leroy 2018-10-09  19  

:::::: The code at line 14 was first introduced by commit
:::::: 97026b5a5ac26541b3d294146f5c941491a9e609 powerpc/mm: Split dump_pagelinuxtables flag_array table

:::::: TO: Christophe Leroy <christophe.leroy@c-s.fr>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
