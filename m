Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F75381A;
	Fri, 31 May 2024 15:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717170587; cv=none; b=jp8O8JRbo6UiCxrwIq/ReE3hzN2JBF5OnR4PGy3aXvg8ZrzKZc8qCnukRVva3QioqkBpZsKMc1b0EcrRo9AHJlu8EnAE/hCeHGZ6VXOSDDamJ/bU2lBVfJn3xJw/nS28MyM35ipaAJ5IQtnUzkSB91oMhwmSzGur+KohgHokGx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717170587; c=relaxed/simple;
	bh=i/GODoG/qqUw/5FjxkcYBVk33tge+/kdSkNcUIAovik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=goiA7lNO0XueAg+hHz7r9v6y+PKQrRat2uI8KsQeld2tZQSNA1s2pcfUQMzROm4IPiBIVJOvICYjlpCl3ZXBG3ikXSgFPr/r7wuxfeeebeB4gXAcKzEa9I+ORMhr+eUV/Z9CICPdrA6FUa/oj/3YqdLAXx4bDaXlLc5mOAYazO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3sZgzET; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3sZgzET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717170585; x=1748706585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i/GODoG/qqUw/5FjxkcYBVk33tge+/kdSkNcUIAovik=;
  b=A3sZgzETaDykzgiP/ucrtM9DZFjw0sINmTucIlfh1ELa3lxFYlnJ3r0o
   hhJzMfOiojonfGYDFMYj3T98qU4RWgKY8U26k7EM8RCEjVwir143sGoAl
   HG+hlWL6E8q18dQN+q0UZQ1KJX11Ef0CNKi0Ga+ENvm3pMJsMGdWHt+vI
   ZlWzd6aYQ3DcBrDQJIg7F+yP31uzld1I5BCdSoPcNUzsFoPi4+jdVuab9
   jCm/nxGi/PVdRtoBol4MJUm8IPPWZ7a4azw4cRJENn+V5rstQumQ4zMF3
   ZDv0p0C/82xY9J2XUOivJ5rGKDcBhhKZldhEdapy0dDFqSpuM6kSnC7yH
   g==;
X-CSE-ConnectionGUID: C3jGGsaVSEWEgZjL1IAaiA==
X-CSE-MsgGUID: lsK5EzBOTjmEtS5x44vLyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17565740"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="17565740"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:49:45 -0700
X-CSE-ConnectionGUID: 5YnRgS3ZT+OJq9zwDlLUuQ==
X-CSE-MsgGUID: As6LDmtJT9WXHsTGK61d1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="36143171"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2024 08:49:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD4Vb-000HIV-34;
	Fri, 31 May 2024 15:49:36 +0000
Date: Fri, 31 May 2024 23:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>,
	Bernd Schubert <bernd.schubert@fastmail.fm>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrei Vagin <avagin@google.com>, io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH] fs: sys_ringbuffer() (WIP)
Message-ID: <202405312226.yKqHcQE4-lkp@intel.com>
References: <ytprj7mx37dna3n3kbiskgvris4nfvv63u3v7wogdrlzbikkmt@chgq5hw3ny3r>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ytprj7mx37dna3n3kbiskgvris4nfvv63u3v7wogdrlzbikkmt@chgq5hw3ny3r>

Hi Kent,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.10-rc1]
[cannot apply to tip/x86/asm next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Overstreet/fs-sys_ringbuffer-WIP/20240531-115626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/ytprj7mx37dna3n3kbiskgvris4nfvv63u3v7wogdrlzbikkmt%40chgq5hw3ny3r
patch subject: [PATCH] fs: sys_ringbuffer() (WIP)
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240531/202405312226.yKqHcQE4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405312226.yKqHcQE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405312226.yKqHcQE4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/um/kernel/asm-offsets.c:1:
   In file included from arch/x86/um/shared/sysdep/kernel-offsets.h:5:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:8:10: fatal error: 'linux/darray_types.h' file not found
       8 | #include <linux/darray_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:117: arch/um/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1208: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +8 include/linux/mm_types.h

     6	
     7	#include <linux/auxvec.h>
   > 8	#include <linux/darray_types.h>
     9	#include <linux/kref.h>
    10	#include <linux/list.h>
    11	#include <linux/spinlock.h>
    12	#include <linux/rbtree.h>
    13	#include <linux/maple_tree.h>
    14	#include <linux/rwsem.h>
    15	#include <linux/completion.h>
    16	#include <linux/cpumask.h>
    17	#include <linux/uprobes.h>
    18	#include <linux/rcupdate.h>
    19	#include <linux/page-flags-layout.h>
    20	#include <linux/workqueue.h>
    21	#include <linux/seqlock.h>
    22	#include <linux/percpu_counter.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
