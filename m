Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194833C65FD;
	Wed, 24 Jun 2026 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311759; cv=none; b=EhrcpbnX5klHgz2y1/gMO7c24/Z5wTOCDN1yx+6oFgl/NvWtA5TCLqMm5WZE9zTZVw28DkyMEMoVnjkOsvHTJh36CZgpxyLWqCXtNTxd85S5WfTkBwPW9p72L908DyNxniTqp50he3xBQcq0eQm5YL8x19Jyb3B0B3Bh7nqrl/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311759; c=relaxed/simple;
	bh=smE+vXNsJ1nsQc7H0/zD4gyh0Xr8z3RUcm+dMyvDFd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNMOZhmrA6ZAT6HqFVECqsT7pNzvMnemlUHePsr+tlakTwKczhhvCqKESkTfPbl3L/d2+Er2hgLmhMfOWxiLWfPyPTDc7D7vifrQZyrstQK3m2Qc2ckMYEwCFPNjYGB/ZY+WJHZjT8qhSE/6WjANIBnL5xpcba3tDYKdeZbd+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4+dC+SO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4+dC+SO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782311756; x=1813847756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=smE+vXNsJ1nsQc7H0/zD4gyh0Xr8z3RUcm+dMyvDFd4=;
  b=A4+dC+SOHAlMQ3qkbPGE7o9ogpp1j5TI2znxpgTcO8n2lWB08ROHnGC4
   en/cHC1hX5xzHzjEZd30WL5abQ5a1ctST+UpnPSafr+VYhbxHSgzzZiDW
   bV6e+k4s5ZFVQ4zOFKmWPlAHqk4myN6JwZUfAlyMtAar+kvHRyji/c1PX
   XG+WD0dW8OGEFJmhUGr0HUpKcSlkxX/yy2FhaNPPZCNgV9czVE9lHMahY
   Gt4BjX3tzesllFNK5GeCALyQX43JdPfdLoSUWwwge/OvXo4rWLUIPoIlr
   FS4foUA80tSkBlubRy6ftzYurbYtFq2v9Kqr2esD9jIcXXH81Mn9/eYmw
   Q==;
X-CSE-ConnectionGUID: P5KaoLeURje5U7pSHDBtDQ==
X-CSE-MsgGUID: J+kAw++rRq6347/+iCHefw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="93434966"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="93434966"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 07:35:54 -0700
X-CSE-ConnectionGUID: Lo+s5CNYTAWK2mQizzjKYQ==
X-CSE-MsgGUID: nIv/Lq4XS0Gf/8D4VUylsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="249912883"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2026 07:35:46 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcOhb-000000003Q1-0R48;
	Wed, 24 Jun 2026 14:35:43 +0000
Date: Wed, 24 Jun 2026 22:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Xuewen Wang <wangxuewen@kylinos.cn>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>
Subject: Re: [PATCH v1] mm: fix data-race in folio_batch_count()
Message-ID: <202606242209.fM2W0efm-lkp@intel.com>
References: <20260624092606.1083449-1-wangxuewen@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624092606.1083449-1-wangxuewen@kylinos.cn>

Hi Xuewen,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuewen-Wang/mm-fix-data-race-in-folio_batch_count/20260624-172724
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260624092606.1083449-1-wangxuewen%40kylinos.cn
patch subject: [PATCH v1] mm: fix data-race in folio_batch_count()
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260624/202606242209.fM2W0efm-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606242209.fM2W0efm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606242209.fM2W0efm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:6:
>> include/linux/folio_batch.h:56:9: error: call to undeclared function 'READ_ONCE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |         return READ_ONCE(fbatch->nr);
         |                ^
   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:7:
   In file included from include/linux/shmem_fs.h:6:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:7:
   In file included from include/linux/shmem_fs.h:6:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:7:
   In file included from include/linux/shmem_fs.h:6:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:7:
   In file included from include/linux/shmem_fs.h:6:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:7:
   In file included from include/linux/shmem_fs.h:6:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpu/drm/i915/gem/i915_gem_shmem.c:7:
   In file included from include/linux/shmem_fs.h:6:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:5:
   In file included from include/linux/fs/super.h:5:
   In file included from include/linux/fs/super_types.h:13:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&


vim +/READ_ONCE +56 include/linux/folio_batch.h

    53	
    54	static inline unsigned int folio_batch_count(const struct folio_batch *fbatch)
    55	{
  > 56		return READ_ONCE(fbatch->nr);
    57	}
    58	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
