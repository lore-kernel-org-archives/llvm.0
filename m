Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C8347BD7;
	Sun,  3 May 2026 11:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777808988; cv=none; b=ZayyZhQMrtQC5lNRnMgFDllPVi0b11dfQc90uOAwBQtrZUrgtiB+UmENELoqhRHBHhvw3qVBpcbBDo1YfqIpk18PfP5CnFAtrRszOIq5dPA+YXYllrfCfEn5S4ckygI1xqk4ZbHGOyzvf8tVm36cyuTI1bde/xIsKR42xVPfWL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777808988; c=relaxed/simple;
	bh=LLB4/00vXTuz7cbb/DkN2jps2elqbIZRAPx5Fu53oG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=An5NtWEw8V5grtvfkQ1+5iW4P03t4EBX77bwoOfX4jGtmq4OXABEkquGD4kXx76mJD1MBpRLINxouJJ15l37K5CluInIf6+yhiwK7xwoYqpdNwVf0DtZFYRKBNXuDHCS3HirXihCMW5tx23NAI36nj8UvkeSjuEeyo2IwytsMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IT7PZg+J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IT7PZg+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777808987; x=1809344987;
  h=date:from:to:cc:subject:message-id;
  bh=LLB4/00vXTuz7cbb/DkN2jps2elqbIZRAPx5Fu53oG0=;
  b=IT7PZg+JwvLzPtiHh0s7/RNvQiV44748v2Otly30iCmPtUkYtH7nKL0b
   LunxNwUX6xyxcXhFa5yPW++nuD7ufJqAPEbmBSMCDMa6+F2H6KHekjc47
   1GEbMxTB2y+TAyGXdZmTZbIZE/NH9ZuguW56Bd/SuR8BLUX3CM6P5HMRx
   o+bjYE5HsOMlJntWVUxp6Gkek5ZVCUutYZJ0zWIIjCBV20FscC2zKAQjY
   ETESoV1EvM62L5VwQrRi9E1hXKU0ayAQkPXtbXujzF835hs5IRvyAealY
   UNSVFRxXO2Ir/rwtOdxpF+N8dKKrxQSIIbP20x6jUx1Dm9DlvGgfYcUcD
   g==;
X-CSE-ConnectionGUID: Zw2i4FhLScyvg/OS6gI6iw==
X-CSE-MsgGUID: f+vA3hirTVCtWqdafOZxOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78687814"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="78687814"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 04:49:47 -0700
X-CSE-ConnectionGUID: /aKNFL0ORk2F5iahFqNvbA==
X-CSE-MsgGUID: 4zIr8pcISy+otnRokXabQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="273389160"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 May 2026 04:49:45 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJVKQ-000000002W1-1i33;
	Sun, 03 May 2026 11:49:42 +0000
Date: Sun, 03 May 2026 19:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 35/50] fs/afs/symlink.c:97:7:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202605031901.PLq38ZSR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   2c55c7cf98847d593219ef29d3fedfd551d6f55f
commit: 25e721fd0e1f943f6dedd9c4d664bbeee8e1d21e [35/50] afs: Use a bvecq to hold dir content rather than folioq
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605031901.PLq38ZSR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031901.PLq38ZSR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031901.PLq38ZSR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/symlink.c:97:7: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
      97 |                 if (ret < 0)
         |                     ^~~
   fs/afs/symlink.c:86:13: note: initialize the variable 'ret' to silence this warning
      86 |         ssize_t ret;
         |                    ^
         |                     = 0
   1 warning generated.


vim +/ret +97 fs/afs/symlink.c

ec065c80239311 David Howells 2026-04-27   78  
ec065c80239311 David Howells 2026-04-27   79  /*
ec065c80239311 David Howells 2026-04-27   80   * Read a symlink in a single download.
ec065c80239311 David Howells 2026-04-27   81   */
ec065c80239311 David Howells 2026-04-27   82  static ssize_t afs_do_read_symlink(struct afs_vnode *vnode)
ec065c80239311 David Howells 2026-04-27   83  {
ec065c80239311 David Howells 2026-04-27   84  	struct afs_symlink *symlink;
ec065c80239311 David Howells 2026-04-27   85  	struct iov_iter iter;
ec065c80239311 David Howells 2026-04-27   86  	ssize_t ret;
ec065c80239311 David Howells 2026-04-27   87  	loff_t i_size;
ec065c80239311 David Howells 2026-04-27   88  
ec065c80239311 David Howells 2026-04-27   89  	i_size = i_size_read(&vnode->netfs.inode);
ec065c80239311 David Howells 2026-04-27   90  	if (i_size > PAGE_SIZE - 1) {
ec065c80239311 David Howells 2026-04-27   91  		trace_afs_file_error(vnode, -EFBIG, afs_file_error_dir_big);
ec065c80239311 David Howells 2026-04-27   92  		return -EFBIG;
ec065c80239311 David Howells 2026-04-27   93  	}
ec065c80239311 David Howells 2026-04-27   94  
ec065c80239311 David Howells 2026-04-27   95  	if (!vnode->directory) {
25e721fd0e1f94 David Howells 2026-01-07   96  		vnode->directory = bvecq_alloc_buffer(PAGE_SIZE, 0, GFP_KERNEL);
ec065c80239311 David Howells 2026-04-27  @97  		if (ret < 0)
ec065c80239311 David Howells 2026-04-27   98  			return ret;
ec065c80239311 David Howells 2026-04-27   99  	}
ec065c80239311 David Howells 2026-04-27  100  
25e721fd0e1f94 David Howells 2026-01-07  101  	iov_iter_bvec_queue(&iter, ITER_DEST, vnode->directory, 0, 0, PAGE_SIZE);
ec065c80239311 David Howells 2026-04-27  102  
ec065c80239311 David Howells 2026-04-27  103  	/* AFS requires us to perform the read of a symlink as a single unit to
ec065c80239311 David Howells 2026-04-27  104  	 * avoid issues with the content being changed between reads.
ec065c80239311 David Howells 2026-04-27  105  	 */
ec065c80239311 David Howells 2026-04-27  106  	ret = netfs_read_single(&vnode->netfs.inode, NULL, &iter);
ec065c80239311 David Howells 2026-04-27  107  	if (ret >= 0) {
ec065c80239311 David Howells 2026-04-27  108  		i_size = ret;
ec065c80239311 David Howells 2026-04-27  109  		if (i_size > PAGE_SIZE - 1) {
ec065c80239311 David Howells 2026-04-27  110  			trace_afs_file_error(vnode, -EFBIG, afs_file_error_dir_big);
ec065c80239311 David Howells 2026-04-27  111  			return -EFBIG;
ec065c80239311 David Howells 2026-04-27  112  		}
ec065c80239311 David Howells 2026-04-27  113  		vnode->directory_size = i_size;
ec065c80239311 David Howells 2026-04-27  114  
ec065c80239311 David Howells 2026-04-27  115  		/* Copy the symlink. */
ec065c80239311 David Howells 2026-04-27  116  		symlink = kmalloc_flex(struct afs_symlink, content, i_size + 1,
ec065c80239311 David Howells 2026-04-27  117  				       GFP_KERNEL);
ec065c80239311 David Howells 2026-04-27  118  		if (!symlink)
ec065c80239311 David Howells 2026-04-27  119  			return -ENOMEM;
ec065c80239311 David Howells 2026-04-27  120  
ec065c80239311 David Howells 2026-04-27  121  		refcount_set(&symlink->ref, 1);
ec065c80239311 David Howells 2026-04-27  122  		symlink->content[i_size] = 0;
ec065c80239311 David Howells 2026-04-27  123  
25e721fd0e1f94 David Howells 2026-01-07  124  		const char *s = kmap_local_bvec(&vnode->directory->bv[0], 0);
ec065c80239311 David Howells 2026-04-27  125  
ec065c80239311 David Howells 2026-04-27  126  		memcpy(symlink->content, s, i_size);
ec065c80239311 David Howells 2026-04-27  127  		kunmap_local(s);
ec065c80239311 David Howells 2026-04-27  128  
ec065c80239311 David Howells 2026-04-27  129  		afs_replace_symlink(vnode, symlink);
ec065c80239311 David Howells 2026-04-27  130  	}
ec065c80239311 David Howells 2026-04-27  131  
ec065c80239311 David Howells 2026-04-27  132  	if (!fscache_cookie_enabled(netfs_i_cookie(&vnode->netfs))) {
25e721fd0e1f94 David Howells 2026-01-07  133  		bvecq_put(vnode->directory);
ec065c80239311 David Howells 2026-04-27  134  		vnode->directory = NULL;
ec065c80239311 David Howells 2026-04-27  135  		vnode->directory_size = 0;
ec065c80239311 David Howells 2026-04-27  136  	}
ec065c80239311 David Howells 2026-04-27  137  
ec065c80239311 David Howells 2026-04-27  138  	return ret;
ec065c80239311 David Howells 2026-04-27  139  }
ec065c80239311 David Howells 2026-04-27  140  

:::::: The code at line 97 was first introduced by commit
:::::: ec065c8023931168a4e590fda4b900860b2cdcb1 afs: Fix the locking used by afs_get_link()

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
