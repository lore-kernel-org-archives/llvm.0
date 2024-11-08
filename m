Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAAA1DE8A8;
	Fri,  8 Nov 2024 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065764; cv=none; b=U73VnCmtxtCkMfA/OFQ3+qThdWyVvwl5TQeoqKNX7sZaMXBQPvZfc7YNSK6CGJIMzcmvk3poS/DU5t614UfDRDweYCwXAw61VcM616MHCO8XfC51/3FCyiSk3H2aV9rcFjytHl146ai5lwnqOWiSEybupSLwCLJ9WcASPwHq/gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065764; c=relaxed/simple;
	bh=ypBGfmpFaGuqhw9KqesCNAp9YB/9TkJjLweqAVK542g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GdR20n1atJJgHZbedy/Xc6i0s1WzsSqdYr7xZX2T6+07AABnmCHcs7TUONcQTze2hfhUZRe5IHOz/XfKwIKhmooJiEvSGiYlqJPRkcS1kvxQZPDW2iepFm8k3/75D1RhNf/nKrU+Z8lWyBDhzKuQq3TyIdYkJv2oM7EUKaxYRaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvA0sUUs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvA0sUUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731065762; x=1762601762;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ypBGfmpFaGuqhw9KqesCNAp9YB/9TkJjLweqAVK542g=;
  b=WvA0sUUsiUuR861Jl1QwBJ4lNI+HzGeIVk4jcTVdTmMAcE8pWg1/qG7z
   TdrXFpwh8REoIchQrlJMIE62zdvaggxar4cvELLo3H6Wv26B8UBQ7HN/+
   NlA34a87m0kYonvDZVYSnhc41jTZYO6DZdvLFsVbF5t2oheW4+A5rXa+t
   BZSiDgWCtUUKLQjveEuzv6IulgiyEYf75W9dGM25iIjU2pivaKR3WgO5Z
   oSRF6QBePfm/10M6wOr3Df8ZB4jvHcB75kYl9Zc9sjb/4e/E3uOO4dRNn
   soVP+JRqXwdVnG8PSz3W0lybZmK6GzQBEZ5I4lNfbFdTBD/gsUfuHBnzu
   Q==;
X-CSE-ConnectionGUID: J6OVsAYpQ3itS6S31W4pIg==
X-CSE-MsgGUID: GMCYvseNSBS8hRLVithJ2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="34883555"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="34883555"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 03:36:01 -0800
X-CSE-ConnectionGUID: 1KAVB0ljSxilb0wXZfoeBg==
X-CSE-MsgGUID: xxPKlmu7S/uxG7sdOBYoKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90390182"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Nov 2024 03:36:00 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9NHS-000rMw-20;
	Fri, 08 Nov 2024 11:35:58 +0000
Date: Fri, 8 Nov 2024 19:35:22 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 10134/10559] ld.lld: error:
 vmlinux.a(io_uring/rsrc.o):(function io_rsrc_node_alloc: .text+0x1ea):
 relocation R_RISCV_HI20 out of range: 527998 is not in [-524288, 524287];
 references 'random_kmalloc_seed'
Message-ID: <202411081905.ylTejbtc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: 6eb5109a27ed8698809c3bf5acb5df0a579f0095 [10134/10559] Merge branch 'nfsd-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
config: riscv-randconfig-001-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081905.ylTejbtc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081905.ylTejbtc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081905.ylTejbtc-lkp@intel.com/

Note: the linux-next/master HEAD 929beafbe7acce3267c06115e13e03ff6e50548a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(io_uring/rsrc.o):(function io_rsrc_node_alloc: .text+0x1ea): relocation R_RISCV_HI20 out of range: 527998 is not in [-524288, 524287]; references 'random_kmalloc_seed'
   >>> referenced by atomic-arch-fallback.h:0 (include/linux/atomic/atomic-arch-fallback.h:0)
   >>> defined in vmlinux.a(mm/slab_common.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
