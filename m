Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FD82C9C
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 17:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641576965; x=1673112965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ybpt3GN3O6dZRkPTwfxRATn7d1hk335MJIDTcfvh1Ko=;
  b=i5GgklaSHK7NnPe8bUVBtZiq2uUgiAjF8rOJax3Ba36jO6tdnU66mQuF
   B1ZhupGbGUY4dTrLaZIdYcYOai1VeuqY/aG1N/yK0pHTCqeIMGawwPe0m
   tGm2uN87XOgy7Berm4RkVDblnoqyp5g0oBZ2pm7rN8xNxwjsSf/oDjLE/
   od6AVVnPY+LHkKsWWmwAIUKCTqITIWAdj4sXIs68N2AY6N1h4DNhK2I4B
   zyANVD9WuXFe5tzQHnlGDv+oJ6JmWdfkxLXD8vaExbDbwwiqZ7344iy3H
   8zy5jDKJ7lcFZeukks9trMgKhEP/d/GM838jIl5Hk8iPFk4FFByd2CuBG
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="240454440"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="240454440"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 09:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="471369128"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Jan 2022 09:33:05 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5t6u-000Itu-Vz; Fri, 07 Jan 2022 17:33:04 +0000
Date: Sat, 8 Jan 2022 01:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 3/3] cifs: Eliminate pages list from cifs_readdata,
 cifs_writedata and smb_rqst
Message-ID: <202201080142.Tton1sB4-lkp@intel.com>
References: <164150476548.2994594.12291632629854686642.stgit@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164150476548.2994594.12291632629854686642.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi David,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220106]
[cannot apply to cifs/for-next linus/master v5.16-rc8 v5.16-rc7 v5.16-rc6 v5.16-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Howells/cifs-In-progress-conversion-to-use-iov_iters-instead-of-page-lists/20220107-053700
base:    3770333b3f8cb7c9110889853afaa49777c26ea7
config: i386-randconfig-r026-20220107 (https://download.01.org/0day-ci/archive/20220108/202201080142.Tton1sB4-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167bfe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/259db76d15582dcfb2436b4f3a39a18c2bae00a6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review David-Howells/cifs-In-progress-conversion-to-use-iov_iters-instead-of-page-lists/20220107-053700
        git checkout 259db76d15582dcfb2436b4f3a39a18c2bae00a6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/ drivers/gpu/drm/i810/ drivers/i2c/busses/ drivers/pci/endpoint/functions/ fs/cifs/ sound/pci/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/cifs/file.c:2435:7: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
                   if (len < max_len)
                       ^~~
   fs/cifs/file.c:2385:30: note: initialize the variable 'len' to silence this warning
           unsigned int xid, wsize, len, max_len;
                                       ^
                                        = 0
   1 warning generated.
--
>> fs/cifs/smb2ops.c:4681:10: warning: comparison of distinct pointer types ('typeof (size) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                           seg = min(size, PAGE_SIZE);
                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4912:7: warning: variable 'length' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (rdata->result != 0) {
                       ^~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4941:9: note: uninitialized use occurs here
           return length;
                  ^~~~~~
   fs/cifs/smb2ops.c:4912:3: note: remove the 'if' if its condition is always true
                   if (rdata->result != 0) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4811:12: note: initialize the variable 'length' to silence this warning
           int length;
                     ^
                      = 0
   2 warnings generated.


vim +/len +2435 fs/cifs/file.c

  2369	
  2370	/*
  2371	 * Write back the locked page and any subsequent non-locked dirty pages.
  2372	 */
  2373	static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
  2374							 struct writeback_control *wbc,
  2375							 struct folio *folio,
  2376							 loff_t start, loff_t end)
  2377	{
  2378		struct inode *inode = mapping->host;
  2379		struct TCP_Server_Info *server;
  2380		struct cifs_writedata *wdata;
  2381		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
  2382		struct cifs_credits credits_on_stack;
  2383		struct cifs_credits *credits = &credits_on_stack;
  2384		struct cifsFileInfo *cfile = NULL;
  2385		unsigned int xid, wsize, len, max_len;
  2386		loff_t i_size = i_size_read(inode);
  2387		long count = wbc->nr_to_write;
  2388		int rc;
  2389	
  2390		if (folio_start_writeback(folio))
  2391			BUG();
  2392	
  2393		count -= folio_nr_pages(folio);
  2394	
  2395		xid = get_xid();
  2396		server = cifs_pick_channel(cifs_sb_master_tcon(cifs_sb)->ses);
  2397	
  2398		rc = cifs_get_writable_file(CIFS_I(inode), FIND_WR_ANY, &cfile);
  2399		if (rc) {
  2400			cifs_dbg(VFS, "No writable handle in writepages rc=%d\n", rc);
  2401			goto err_xid;
  2402		}
  2403	
  2404		rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->wsize,
  2405						   &wsize, credits);
  2406		if (rc != 0)
  2407			goto err_close;
  2408	
  2409		wdata = cifs_writedata_alloc(cifs_writev_complete);
  2410		if (!wdata) {
  2411			rc = -ENOMEM;
  2412			goto err_uncredit;
  2413		}
  2414	
  2415		wdata->sync_mode = wbc->sync_mode;
  2416		wdata->offset = folio_pos(folio);
  2417		wdata->pid = wdata->cfile->pid;
  2418		wdata->credits = credits_on_stack;
  2419		wdata->cfile = cfile;
  2420		wdata->server = server;
  2421		cfile = NULL;
  2422	
  2423		/* Find all consecutive lockable dirty pages, stopping when we find a
  2424		 * page that is not immediately lockable, is not dirty or is missing,
  2425		 * or we reach the end of the range.
  2426		 */
  2427		if (start < i_size) {
  2428			/* Trim the write to the EOF; the extra data is ignored.  Also
  2429			 * put an upper limit on the size of a single storedata op.
  2430			 */
  2431			max_len = wsize;
  2432			max_len = min_t(unsigned long long, max_len, end - start + 1);
  2433			max_len = min_t(unsigned long long, max_len, i_size - start);
  2434	
> 2435			if (len < max_len)
  2436				cifs_extend_writeback(mapping, &count, start,
  2437						      max_len, &len);
  2438			len = min_t(loff_t, len, max_len);
  2439		}
  2440	
  2441		wdata->bytes = len;
  2442	
  2443		/* We now have a contiguous set of dirty pages, each with writeback
  2444		 * set; the first page is still locked at this point, but all the rest
  2445		 * have been unlocked.
  2446		 */
  2447		folio_unlock(folio);
  2448	
  2449		if (start < i_size) {
  2450			iov_iter_xarray(&wdata->iter, WRITE, &mapping->i_pages, start, len);
  2451	
  2452			rc = adjust_credits(wdata->server, &wdata->credits, wdata->bytes);
  2453			if (rc)
  2454				goto err_wdata;
  2455	
  2456			if (wdata->cfile->invalidHandle)
  2457				rc = -EAGAIN;
  2458			else
  2459				rc = wdata->server->ops->async_writev(wdata,
  2460								      cifs_writedata_release);
  2461		} else {
  2462			/* The dirty region was entirely beyond the EOF. */
  2463			rc = 0;
  2464		}
  2465	
  2466	err_wdata:
  2467		kref_put(&wdata->refcount, cifs_writedata_release);
  2468	err_uncredit:
  2469		add_credits_and_wake_if(server, credits, 0);
  2470	err_close:
  2471		if (cfile)
  2472			cifsFileInfo_put(cfile);
  2473	err_xid:
  2474		free_xid(xid);
  2475		if (rc == 0) {
  2476			cifs_pages_written_back(inode, start, len);
  2477			wbc->nr_to_write = count;
  2478		} else if (is_retryable_error(rc)) {
  2479			cifs_pages_write_redirty(inode, start, len);
  2480		} else {
  2481			cifs_pages_write_failed(inode, start, len);
  2482			mapping_set_error(mapping, rc);
  2483		}
  2484		/* Indication to update ctime and mtime as close is deferred */
  2485		set_bit(CIFS_INO_MODIFIED_ATTR, &CIFS_I(inode)->flags);
  2486		return rc;
  2487	}
  2488	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
