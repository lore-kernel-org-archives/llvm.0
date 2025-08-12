Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1E129BD9D;
	Tue, 12 Aug 2025 19:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755026368; cv=none; b=XzJ64iOhMvoUaBx/dFLeSNbyt3FbN7HU7Q2ltEdZEzM1pJd3zo/HdqXxihU8FY3iyrXfAxj4ecIrEIaBBzhdjVvxFn8hxW69AVvRKKStwrbAOfL9hAljRk+XU4ba+9r0+ohuqRz5+tnVygL8STuY8wGi/1NAq5UqZB500sc01T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755026368; c=relaxed/simple;
	bh=AI4AXv8xWUmSxBoBjpDgRZHIow4jmjUto7XtO84gmZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aUQgA8folsGAovlFUOihzg8HH0S+Yj1MmKozraaUi2Lwuq8p2v5T+9Cx72YHI/yPcQUzgaQkzdiQGRa4HlU21elyxr5GUuoyodcPY2GuUGHDR7h6TPZNvTFvEMDdiuKCusDkoOcOOfA0DPdY8yYkqalAF6PMCf08YGP/9whh6hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvsUkI4s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvsUkI4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755026367; x=1786562367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AI4AXv8xWUmSxBoBjpDgRZHIow4jmjUto7XtO84gmZI=;
  b=bvsUkI4sMRbBmtQrezXM5ZaxmWkuvG4l1bY5cj3uYZnUr18SZPYIMJRI
   QDcg3ufa6vTUi9uKCjUDdqL9IJ8n+twiluGeB0n+KSOrDZIapoAli4Nco
   8VTzaV6KWw6NqWf71y6M7JbBulDvS7/WCwWmKnc0xXXlM+3vpQdTDaxn7
   +Z3HL9O5kB8cAdzVKsHBBOAx3aAAuR4yXJxJY91Brq64Lgy/ezqbGzeGR
   2YhnUY/v+ymUngLSLt++NadHR3NPyJJ7ChxSzqVwfAFXJskbyCHlwoq6k
   O7ofa/nU+0pTqQhmI7j26ly8WIJ5wFf1bj3qjPR2DWRC2wp+SQBepf0ix
   A==;
X-CSE-ConnectionGUID: 7DMBwIoMQ62ILVOIRQrfsg==
X-CSE-MsgGUID: psaulfJBQdKqosTSeEKr3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56522155"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56522155"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 12:19:25 -0700
X-CSE-ConnectionGUID: RiX52RMhSFSOjoBGYQ+MwA==
X-CSE-MsgGUID: LOLf/Ur7SZidYyNAp85e2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170408956"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Aug 2025 12:19:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uluWn-00090k-1M;
	Tue, 12 Aug 2025 19:19:21 +0000
Date: Wed, 13 Aug 2025 03:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 101/118] arch/powerpc/mm/ptdump/shared.c:70:1:
 error: use of 'pgtable_level' with tag type that does not match previous
 declaration
Message-ID: <202508130304.5FJqRz2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   33ad02f876604ac2990e510480b0ab3a03cf892e
commit: 627bf62489a6d9a45f6d6f83edd0cb6c0ee610c0 [101/118] mm/rmap: convert "enum rmap_level" to "enum pgtable_level"
config: powerpc-randconfig-001-20250812 (https://download.01.org/0day-ci/archive/20250813/202508130304.5FJqRz2c-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130304.5FJqRz2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130304.5FJqRz2c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/mm/ptdump/shared.c:10:
   arch/powerpc/mm/ptdump/ptdump.h:14:1: error: use of 'pgtable_level' with tag type that does not match previous declaration
      14 | struct pgtable_level {
         | ^
   include/linux/pgtable.h:1961:6: note: previous use is here
    1961 | enum pgtable_level {
         |      ^
   In file included from arch/powerpc/mm/ptdump/shared.c:10:
   arch/powerpc/mm/ptdump/ptdump.h:20:8: error: use of 'pgtable_level' with tag type that does not match previous declaration
      20 | extern struct pgtable_level pg_level[5];
         |        ^
   include/linux/pgtable.h:1961:6: note: previous use is here
    1961 | enum pgtable_level {
         |      ^
>> arch/powerpc/mm/ptdump/shared.c:70:1: error: use of 'pgtable_level' with tag type that does not match previous declaration
      70 | struct pgtable_level pg_level[5] = {
         | ^
   include/linux/pgtable.h:1961:6: note: previous use is here
    1961 | enum pgtable_level {
         |      ^
   3 errors generated.


vim +/pgtable_level +70 arch/powerpc/mm/ptdump/shared.c

97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09   9  
e66c3209c7fd17 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2019-02-18 @10  #include "ptdump.h"
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  11  
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  12  static const struct flag_info flag_array[] = {
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  13  	{
ceaba662c06598 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2023-09-25  14  		.mask	= _PAGE_READ,
dd8de84b57b02b arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2022-06-28  15  		.val	= 0,
ceaba662c06598 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2023-09-25  16  		.set	= " ",
ceaba662c06598 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2023-09-25  17  		.clear	= "r",
ceaba662c06598 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2023-09-25  18  	}, {
ceaba662c06598 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2023-09-25  19  		.mask	= _PAGE_WRITE,
ceaba662c06598 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2023-09-25  20  		.val	= 0,
ceaba662c06598 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2023-09-25  21  		.set	= " ",
ceaba662c06598 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2023-09-25  22  		.clear	= "w",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  23  	}, {
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  24  		.mask	= _PAGE_EXEC,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  25  		.val	= _PAGE_EXEC,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  26  		.set	= " X ",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  27  		.clear	= "   ",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  28  	}, {
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  29  		.mask	= _PAGE_PRESENT,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  30  		.val	= _PAGE_PRESENT,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  31  		.set	= "present",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  32  		.clear	= "       ",
3af4786eb429b2 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2020-05-19  33  	}, {
3af4786eb429b2 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2020-05-19  34  		.mask	= _PAGE_COHERENT,
3af4786eb429b2 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2020-05-19  35  		.val	= _PAGE_COHERENT,
3af4786eb429b2 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2020-05-19  36  		.set	= "coherent",
3af4786eb429b2 arch/powerpc/mm/ptdump/shared.c                Christophe Leroy 2020-05-19  37  		.clear	= "        ",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  38  	}, {
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  39  		.mask	= _PAGE_GUARDED,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  40  		.val	= _PAGE_GUARDED,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  41  		.set	= "guarded",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  42  		.clear	= "       ",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  43  	}, {
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  44  		.mask	= _PAGE_DIRTY,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  45  		.val	= _PAGE_DIRTY,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  46  		.set	= "dirty",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  47  		.clear	= "     ",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  48  	}, {
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  49  		.mask	= _PAGE_ACCESSED,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  50  		.val	= _PAGE_ACCESSED,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  51  		.set	= "accessed",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  52  		.clear	= "        ",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  53  	}, {
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  54  		.mask	= _PAGE_WRITETHRU,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  55  		.val	= _PAGE_WRITETHRU,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  56  		.set	= "write through",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  57  		.clear	= "             ",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  58  	}, {
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  59  		.mask	= _PAGE_NO_CACHE,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  60  		.val	= _PAGE_NO_CACHE,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  61  		.set	= "no cache",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  62  		.clear	= "        ",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  63  	}, {
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  64  		.mask	= _PAGE_SPECIAL,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  65  		.val	= _PAGE_SPECIAL,
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  66  		.set	= "special",
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  67  	}
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  68  };
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09  69  
97026b5a5ac265 arch/powerpc/mm/dump_linuxpagetables-generic.c Christophe Leroy 2018-10-09 @70  struct pgtable_level pg_level[5] = {

:::::: The code at line 70 was first introduced by commit
:::::: 97026b5a5ac26541b3d294146f5c941491a9e609 powerpc/mm: Split dump_pagelinuxtables flag_array table

:::::: TO: Christophe Leroy <christophe.leroy@c-s.fr>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
