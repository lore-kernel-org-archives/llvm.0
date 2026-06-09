Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B484346A14;
	Tue,  9 Jun 2026 20:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035245; cv=none; b=tO+mrZNGMrx4A4ROXwiEx8VVfpBa6qCRXijzUFjz91uapVXKWJFqbgyerUuLCEd897ZOR4n1V9qLLXDMhmyR0j+jYLE1BIGAenaYzKoQ4SR1XbpWtBd21nTiYDmeAJ7FjeTs8h9S+Rv9KXOgDDhdphyptY1QUkF8kzGB3LCGCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035245; c=relaxed/simple;
	bh=1IAGt3cJ+GNLO2Mp9SN8Z7rKExCu+XTzX8q4S1h0VSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bcCg4wHd0anZ+xpidcPbnqYiXB7tz+XIiCtW3jGI1ZQIZhTDZpjY8hLOD8K6Df9Wt/LMMjC+a5EHqHSXba8pmcCbSSRmSY2Uic7QYV0ZJ/KE0RBxcz6KgBmjg26SXxvUz0crtJQP5Wh/hAjo3XYPxM0FqEKHUdcxSpFrUwAxnyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QE0mbi+5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QE0mbi+5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781035245; x=1812571245;
  h=date:from:to:cc:subject:message-id;
  bh=1IAGt3cJ+GNLO2Mp9SN8Z7rKExCu+XTzX8q4S1h0VSM=;
  b=QE0mbi+5PJ/7A81losFNSWUvmpPuyErexj3JLE26JjNtFEYx7Ho61Y0n
   0KLpbJc77l69IZSXaBQqkIkB1W4YsPe1q0JbxWZMw+ryQEN+KrI1KM9Bi
   2oo6EHlShzYTOYHxaGACXkf1yIdNyKEp3L9JmMcDqwn1PDlo2zrdQxzr2
   rc5ZFcUo0Dpe5vuto/4IcsAe/9vEvA34ygS/SkWUIWZ9sMvb6+OnPbkwA
   Fu66wFdKde/NHJwdDTpup2/mTf9CJGSftrvQ4JTL9/PkDvLZbwoalgrFu
   Hc6hOytO0Q1pDOLKKH6PqERyz5SGbhOEsz+71PiBY4T6wjZih2BkehDoO
   Q==;
X-CSE-ConnectionGUID: rlRO5SscR1e3CDWdVO5A6A==
X-CSE-MsgGUID: qSzbw75xRr+0KqpKkdH1Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92133986"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="92133986"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 13:00:42 -0700
X-CSE-ConnectionGUID: usxphOB5QBO8PbH8qm7+Iw==
X-CSE-MsgGUID: nxPVJ39ISZ+Agg97oV4HuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="249881881"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2026 13:00:40 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX2cn-00000000KUW-0pZ0;
	Tue, 09 Jun 2026 20:00:37 +0000
Date: Wed, 10 Jun 2026 03:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 11/22] fs/afs/symlink.c:97:7:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202606100329.iHRpefyn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   1d9a108be2c6acdd19dfad7fd3f536c79810dafa
commit: 169b840c161aff8f6ece83314583a409431e2824 [11/22] afs: Use a bvecq to hold dir content rather than folioq
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260610/202606100329.iHRpefyn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100329.iHRpefyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100329.iHRpefyn-lkp@intel.com/

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

c0410adf3da6db David Howells 2026-05-12   78  
c0410adf3da6db David Howells 2026-05-12   79  /*
c0410adf3da6db David Howells 2026-05-12   80   * Read a symlink in a single download.
c0410adf3da6db David Howells 2026-05-12   81   */
c0410adf3da6db David Howells 2026-05-12   82  static ssize_t afs_do_read_symlink(struct afs_vnode *vnode)
c0410adf3da6db David Howells 2026-05-12   83  {
c0410adf3da6db David Howells 2026-05-12   84  	struct afs_symlink *symlink;
c0410adf3da6db David Howells 2026-05-12   85  	struct iov_iter iter;
c0410adf3da6db David Howells 2026-05-12   86  	ssize_t ret;
c0410adf3da6db David Howells 2026-05-12   87  	loff_t i_size;
c0410adf3da6db David Howells 2026-05-12   88  
c0410adf3da6db David Howells 2026-05-12   89  	i_size = i_size_read(&vnode->netfs.inode);
c0410adf3da6db David Howells 2026-05-12   90  	if (i_size > PAGE_SIZE - 1) {
c0410adf3da6db David Howells 2026-05-12   91  		trace_afs_file_error(vnode, -EFBIG, afs_file_error_dir_big);
c0410adf3da6db David Howells 2026-05-12   92  		return -EFBIG;
c0410adf3da6db David Howells 2026-05-12   93  	}
c0410adf3da6db David Howells 2026-05-12   94  
c0410adf3da6db David Howells 2026-05-12   95  	if (!vnode->directory) {
169b840c161aff David Howells 2026-01-07   96  		vnode->directory = bvecq_alloc_buffer(PAGE_SIZE, GFP_KERNEL);
c0410adf3da6db David Howells 2026-05-12  @97  		if (ret < 0)
c0410adf3da6db David Howells 2026-05-12   98  			return ret;
c0410adf3da6db David Howells 2026-05-12   99  	}
c0410adf3da6db David Howells 2026-05-12  100  
169b840c161aff David Howells 2026-01-07  101  	iov_iter_bvec_queue(&iter, ITER_DEST, vnode->directory, 0, 0, PAGE_SIZE);
c0410adf3da6db David Howells 2026-05-12  102  
c0410adf3da6db David Howells 2026-05-12  103  	/* AFS requires us to perform the read of a symlink as a single unit to
c0410adf3da6db David Howells 2026-05-12  104  	 * avoid issues with the content being changed between reads.
c0410adf3da6db David Howells 2026-05-12  105  	 */
c0410adf3da6db David Howells 2026-05-12  106  	ret = netfs_read_single(&vnode->netfs.inode, NULL, &iter);
c0410adf3da6db David Howells 2026-05-12  107  	if (ret >= 0) {
c0410adf3da6db David Howells 2026-05-12  108  		i_size = ret;
c0410adf3da6db David Howells 2026-05-12  109  		if (i_size > PAGE_SIZE - 1) {
c0410adf3da6db David Howells 2026-05-12  110  			trace_afs_file_error(vnode, -EFBIG, afs_file_error_dir_big);
c0410adf3da6db David Howells 2026-05-12  111  			return -EFBIG;
c0410adf3da6db David Howells 2026-05-12  112  		}
c0410adf3da6db David Howells 2026-05-12  113  		vnode->directory_size = i_size;
c0410adf3da6db David Howells 2026-05-12  114  
c0410adf3da6db David Howells 2026-05-12  115  		/* Copy the symlink. */
c0410adf3da6db David Howells 2026-05-12  116  		symlink = kmalloc_flex(struct afs_symlink, content, i_size + 1,
c0410adf3da6db David Howells 2026-05-12  117  				       GFP_KERNEL);
c0410adf3da6db David Howells 2026-05-12  118  		if (!symlink)
c0410adf3da6db David Howells 2026-05-12  119  			return -ENOMEM;
c0410adf3da6db David Howells 2026-05-12  120  
c0410adf3da6db David Howells 2026-05-12  121  		refcount_set(&symlink->ref, 1);
c0410adf3da6db David Howells 2026-05-12  122  		symlink->content[i_size] = 0;
c0410adf3da6db David Howells 2026-05-12  123  
169b840c161aff David Howells 2026-01-07  124  		const char *s = bvec_kmap_partial(&vnode->directory->bv[0], 0);
c0410adf3da6db David Howells 2026-05-12  125  
c0410adf3da6db David Howells 2026-05-12  126  		memcpy(symlink->content, s, i_size);
c0410adf3da6db David Howells 2026-05-12  127  		kunmap_local(s);
c0410adf3da6db David Howells 2026-05-12  128  
c0410adf3da6db David Howells 2026-05-12  129  		afs_replace_symlink(vnode, symlink);
c0410adf3da6db David Howells 2026-05-12  130  	}
c0410adf3da6db David Howells 2026-05-12  131  
c0410adf3da6db David Howells 2026-05-12  132  	if (!fscache_cookie_enabled(netfs_i_cookie(&vnode->netfs))) {
169b840c161aff David Howells 2026-01-07  133  		bvecq_put(vnode->directory);
c0410adf3da6db David Howells 2026-05-12  134  		vnode->directory = NULL;
c0410adf3da6db David Howells 2026-05-12  135  		vnode->directory_size = 0;
c0410adf3da6db David Howells 2026-05-12  136  	}
c0410adf3da6db David Howells 2026-05-12  137  
c0410adf3da6db David Howells 2026-05-12  138  	return ret;
c0410adf3da6db David Howells 2026-05-12  139  }
c0410adf3da6db David Howells 2026-05-12  140  

:::::: The code at line 97 was first introduced by commit
:::::: c0410adf3da6db46f3513411fcf95e63c2f1d1ad afs: Fix the locking used by afs_get_link()

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
