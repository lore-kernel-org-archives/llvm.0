Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A1413AC0;
	Sat, 16 Dec 2023 00:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNNeXDPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702686275; x=1734222275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4WSzyQE0V6ktb+aTbGXb6yzlsElGC8txBLORJCR/mfo=;
  b=ZNNeXDPbK7WOo+YZbi0QyKmFEo6HX6dlCvotIFJhuYy98DrRd8xwIUBr
   VWG3Pe6bbVmxwRrauJ6oIWbxG5bp+1g6Td90CMPn6RVMvd6Ol6n848Bkx
   CLH1pwwDN5COTAelsSq7oa3OcAlilr/BlgH733xUG1UVemzwvrSTszSqr
   58+/bROF9gLqbXO+eB7iWSXOsTtSY0wgLYy5YWwfDv1IposhMIlcD4ng+
   P7HnewMNpWXbXjJUTBR+wCK3JSP3B4w/bLlMFQk8jf73YOdNZd5NbFqhi
   dyAYxpuxMjGh8bgYykIRnMMPHWRhz04z7+a5EyBYNHSFlCSjvOCWXPYOE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="16901319"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="16901319"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 16:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="768167178"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="768167178"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Dec 2023 16:24:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEITl-0000wt-2Z;
	Sat, 16 Dec 2023 00:24:29 +0000
Date: Sat, 16 Dec 2023 08:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Subject: [brauner-vfs:vfs.netfs 59/64] fs/netfs/buffered_write.c:520:3:
 error: call to undeclared function 'generic_error_remove_folio'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202312160801.L9rU4U5O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.netfs
head:   361e796134214b255d35dd801451b40a68c34e11
commit: 02bf7b4afdba5ec3abddb70d5184666b97506e56 [59/64] netfs: Provide a writepages implementation
config: i386-randconfig-013-20231216 (https://download.01.org/0day-ci/archive/20231216/202312160801.L9rU4U5O-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160801.L9rU4U5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160801.L9rU4U5O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/buffered_write.c:520:3: error: call to undeclared function 'generic_error_remove_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   generic_error_remove_folio(mapping, folio);
                   ^
   fs/netfs/buffered_write.c:520:3: note: did you mean 'generic_error_remove_page'?
   include/linux/mm.h:2376:5: note: 'generic_error_remove_page' declared here
   int generic_error_remove_page(struct address_space *mapping, struct page *page);
       ^
   1 error generated.


vim +/generic_error_remove_folio +520 fs/netfs/buffered_write.c

   490	
   491	/*
   492	 * Kill all the pages in the given range
   493	 */
   494	static void netfs_kill_pages(struct address_space *mapping,
   495				     loff_t start, loff_t len)
   496	{
   497		struct folio *folio;
   498		pgoff_t index = start / PAGE_SIZE;
   499		pgoff_t last = (start + len - 1) / PAGE_SIZE, next;
   500	
   501		_enter("%llx-%llx", start, start + len - 1);
   502	
   503		do {
   504			_debug("kill %lx (to %lx)", index, last);
   505	
   506			folio = filemap_get_folio(mapping, index);
   507			if (IS_ERR(folio)) {
   508				next = index + 1;
   509				continue;
   510			}
   511	
   512			next = folio_next_index(folio);
   513	
   514			trace_netfs_folio(folio, netfs_folio_trace_kill);
   515			folio_clear_uptodate(folio);
   516			if (folio_test_fscache(folio))
   517				folio_end_fscache(folio);
   518			folio_end_writeback(folio);
   519			folio_lock(folio);
 > 520			generic_error_remove_folio(mapping, folio);
   521			folio_unlock(folio);
   522			folio_put(folio);
   523	
   524		} while (index = next, index <= last);
   525	
   526		_leave("");
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
