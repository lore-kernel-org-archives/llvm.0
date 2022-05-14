Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28762565
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652545464; x=1684081464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hAZVroACW4ZY6pzQ3LUOdoKxJ25yCivehUbnsr1/0kE=;
  b=cSZvN1fkiMBA8kJam2WnoGr5j4K5yNKy/j88TZsRIut7WO33MIYz6YN9
   OrLpltF7CgefljJv4KMqSuxIozLQwtkvVNVmFdKpBwOck99a0PtMQspUA
   phNS5ao5ewtD1PQg+nkxXL5xZ+3vvMnR7CvsbuaMEY8y9YRK9dzxkEYJ/
   OTvs6CNBJRVEWW9A2pqzAjTRPbTVaLhfZTDKSGFyAg1e9DInxW1j7snTe
   YGUdxtVyvu8956q8hqPfiftgik/11ImdCudAPMCMZXoQjPqTPbQoboHAC
   jqf7y+0LMPAxG85841u6/hI36QqFJym3RBsiC9MGg5wQMXoidvu7LM3wX
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10347"; a="251054306"
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="251054306"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2022 09:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,226,1647327600"; 
   d="scan'208";a="740595778"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 May 2022 09:24:22 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npuZ3-0000pF-LU;
	Sat, 14 May 2022 16:24:21 +0000
Date: Sun, 15 May 2022 00:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9995/11651] fs/buffer.c:2254:5: warning: stack
 frame size (2144) exceeds limit (1024) in 'block_read_full_folio'
Message-ID: <202205150051.3RzuooAG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1e1b28b936aed946122b4e0991e7144fdbbfd77e
commit: 2c69e2057962b6bd76d72446453862eb59325b49 [9995/11651] fs: Convert block_read_full_page() to block_read_full_folio()
config: hexagon-randconfig-r041-20220513 (https://download.01.org/0day-ci/archive/20220515/202205150051.3RzuooAG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2c69e2057962b6bd76d72446453862eb59325b49
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2c69e2057962b6bd76d72446453862eb59325b49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/buffer.c:2254:5: warning: stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio' [-Wframe-larger-than]
   int block_read_full_folio(struct folio *folio, get_block_t *get_block)
       ^
   1 warning generated.


vim +/block_read_full_folio +2254 fs/buffer.c

  2246	
  2247	/*
  2248	 * Generic "read_folio" function for block devices that have the normal
  2249	 * get_block functionality. This is most of the block device filesystems.
  2250	 * Reads the folio asynchronously --- the unlock_buffer() and
  2251	 * set/clear_buffer_uptodate() functions propagate buffer state into the
  2252	 * folio once IO has completed.
  2253	 */
> 2254	int block_read_full_folio(struct folio *folio, get_block_t *get_block)
  2255	{
  2256		struct inode *inode = folio->mapping->host;
  2257		sector_t iblock, lblock;
  2258		struct buffer_head *bh, *head, *arr[MAX_BUF_PER_PAGE];
  2259		unsigned int blocksize, bbits;
  2260		int nr, i;
  2261		int fully_mapped = 1;
  2262	
  2263		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
  2264	
  2265		head = create_page_buffers(&folio->page, inode, 0);
  2266		blocksize = head->b_size;
  2267		bbits = block_size_bits(blocksize);
  2268	
  2269		iblock = (sector_t)folio->index << (PAGE_SHIFT - bbits);
  2270		lblock = (i_size_read(inode)+blocksize-1) >> bbits;
  2271		bh = head;
  2272		nr = 0;
  2273		i = 0;
  2274	
  2275		do {
  2276			if (buffer_uptodate(bh))
  2277				continue;
  2278	
  2279			if (!buffer_mapped(bh)) {
  2280				int err = 0;
  2281	
  2282				fully_mapped = 0;
  2283				if (iblock < lblock) {
  2284					WARN_ON(bh->b_size != blocksize);
  2285					err = get_block(inode, iblock, bh, 0);
  2286					if (err)
  2287						folio_set_error(folio);
  2288				}
  2289				if (!buffer_mapped(bh)) {
  2290					folio_zero_range(folio, i * blocksize,
  2291							blocksize);
  2292					if (!err)
  2293						set_buffer_uptodate(bh);
  2294					continue;
  2295				}
  2296				/*
  2297				 * get_block() might have updated the buffer
  2298				 * synchronously
  2299				 */
  2300				if (buffer_uptodate(bh))
  2301					continue;
  2302			}
  2303			arr[nr++] = bh;
  2304		} while (i++, iblock++, (bh = bh->b_this_page) != head);
  2305	
  2306		if (fully_mapped)
  2307			folio_set_mappedtodisk(folio);
  2308	
  2309		if (!nr) {
  2310			/*
  2311			 * All buffers are uptodate - we can set the folio uptodate
  2312			 * as well. But not if get_block() returned an error.
  2313			 */
  2314			if (!folio_test_error(folio))
  2315				folio_mark_uptodate(folio);
  2316			folio_unlock(folio);
  2317			return 0;
  2318		}
  2319	
  2320		/* Stage two: lock the buffers */
  2321		for (i = 0; i < nr; i++) {
  2322			bh = arr[i];
  2323			lock_buffer(bh);
  2324			mark_buffer_async_read(bh);
  2325		}
  2326	
  2327		/*
  2328		 * Stage 3: start the IO.  Check for uptodateness
  2329		 * inside the buffer lock in case another process reading
  2330		 * the underlying blockdev brought it uptodate (the sct fix).
  2331		 */
  2332		for (i = 0; i < nr; i++) {
  2333			bh = arr[i];
  2334			if (buffer_uptodate(bh))
  2335				end_buffer_async_read(bh, 1);
  2336			else
  2337				submit_bh(REQ_OP_READ, 0, bh);
  2338		}
  2339		return 0;
  2340	}
  2341	EXPORT_SYMBOL(block_read_full_folio);
  2342	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
