Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9008821;
	Sun,  2 Mar 2025 00:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740876595; cv=none; b=iyjjJpQ8NOzfpVl1IDw2PDRG9UUB2Oa+qjAqbiQXzSmIRifR8arJSfSv/v0c+a+Gp2SyVQAOGwaVkxIChSL9WApE5FnXqTkaCCpFvbqTmqhSBJAwcAWDLlkBhfE4MDjDui0xEqLfH0EDBk4D7A8CVJHYo6NDsXSAg0FkR2K9r5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740876595; c=relaxed/simple;
	bh=wjvC5JVeLCm7mRY1FCm89QWf17Vp7bI4rkc2iS+w8Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E6NwTeLt2tR2uAi8QhSrK+c15+4k7L6zhMNU19rc95sfZ/gbJaAsUx/0nC4jBqH+csr/edwkwcc9hv+y5gh6Nu4B9nqMuPNBpie3rIuJUCh7tl1CVbzAgmodj1Xn5TQ/H9XRoKCOJE79sr6dy63cqwAzN+J6KydG7iK7p9h7Vi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUjOIQ6v; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUjOIQ6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740876594; x=1772412594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjvC5JVeLCm7mRY1FCm89QWf17Vp7bI4rkc2iS+w8Lc=;
  b=jUjOIQ6vrw19aRihRQ0RMqMz4Wz/eaVG23OJHGMrI8LA/VrUwvjLiMyG
   ZMJObU+yFHkFKUdYDI92c4MWWtSaU7Nx67Xxnlw9NHgjjgCY0MNuQh8x7
   T3VvjNqNlVA6GRU56oxaEN2ntQ8pP0G70iDrK6W0mXkajB9rTWm3QMJSP
   VNroeXThLGkVkwRIwdv9ruExq9PdmS4jU2Oodg9cdCSP1vh6c2w+0FkxT
   V5FNUbliCaFz3+v78ZtSHy/eJ1rJUQ4m+7QQ7DcE44yTfyfbHolA/Oa2s
   BquxFM/ndC6EgUrYWwnxCIhKlPAMbi7NPOqaJYBys0B9vvkH7qDKJZJp0
   Q==;
X-CSE-ConnectionGUID: a8fVfzcATNSgRi+FGhLWuw==
X-CSE-MsgGUID: CuT7LTGuR/G2bE5hU6sQ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="52407281"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="52407281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 16:49:52 -0800
X-CSE-ConnectionGUID: gcZUPiVmSbmpCpc709LhPw==
X-CSE-MsgGUID: Pas+vbcvTFOUrE+3YcW6qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="148472887"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2025 16:49:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toXWe-000GuA-1U;
	Sun, 02 Mar 2025 00:49:48 +0000
Date: Sun, 2 Mar 2025 08:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/futex 21/21] kernel/futex/core.c:328:14:
 error: no member named 'vm_policy' in 'struct vm_area_struct'
Message-ID: <202503020814.w50SUTno-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   49fd6b8f5d595592bab59b1fd2bfa57d1bd8c767
commit: 49fd6b8f5d595592bab59b1fd2bfa57d1bd8c767 [21/21] futex: Implement FUTEX2_MPOL
config: x86_64-buildonly-randconfig-002-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020814.w50SUTno-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020814.w50SUTno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020814.w50SUTno-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/futex/core.c:328:14: error: no member named 'vm_policy' in 'struct vm_area_struct'
     328 |         mpol = vma->vm_policy;
         |                ~~~  ^
>> kernel/futex/core.c:332:16: error: no member named 'mode' in 'struct mempolicy'
     332 |         switch (mpol->mode) {
         |                 ~~~~  ^
>> kernel/futex/core.c:334:27: error: no member named 'nodes' in 'struct mempolicy'
     334 |                 node = first_node(mpol->nodes);
         |                                   ~~~~  ^
   include/linux/nodemask.h:263:40: note: expanded from macro 'first_node'
     263 | #define first_node(src) __first_node(&(src))
         |                                        ^~~
>> kernel/futex/core.c:338:13: error: no member named 'home_node' in 'struct mempolicy'
     338 |                 if (mpol->home_node != NUMA_NO_NODE)
         |                     ~~~~  ^
   kernel/futex/core.c:339:17: error: no member named 'home_node' in 'struct mempolicy'
     339 |                         node = mpol->home_node;
         |                                ~~~~  ^
   5 errors generated.


vim +328 kernel/futex/core.c

   318	
   319	static int __futex_key_to_node(struct mm_struct *mm, unsigned long addr)
   320	{
   321		struct vm_area_struct *vma = vma_lookup(mm, addr);
   322		struct mempolicy *mpol;
   323		int node = FUTEX_NO_NODE;
   324	
   325		if (!vma)
   326			return FUTEX_NO_NODE;
   327	
 > 328		mpol = vma->vm_policy;
   329		if (!mpol)
   330			return FUTEX_NO_NODE;
   331	
 > 332		switch (mpol->mode) {
   333		case MPOL_PREFERRED:
 > 334			node = first_node(mpol->nodes);
   335			break;
   336		case MPOL_PREFERRED_MANY:
   337		case MPOL_BIND:
 > 338			if (mpol->home_node != NUMA_NO_NODE)
   339				node = mpol->home_node;
   340			break;
   341		default:
   342			break;
   343		}
   344	
   345		return node;
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
