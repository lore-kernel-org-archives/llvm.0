Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93845EB8
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 23:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644881317; x=1676417317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W5UIWR8IMeyiFdF3gjE6OW8Sj3dciI4kypY/RklK8Aw=;
  b=Y+RdO+/Y0mfezCjfe++RlQbRv0GXzq9HQIdrYdSzFVIb89uRw4rfrIAq
   a3KEJz9bXJ24rU7m7DUL1dtAD2LpPsL6RkW4jqzcw2XQtSaXP2QIzFlbk
   z3sBLRp5Xunjd5hzEJOGCy9TdSj873PkRjYVLTXZopcaVEw6XuOabxv1E
   Nl7dbAANEX+jcVCMvfXhfL/03C5a/OGnXCRs5Qlx7sPNGUX2b1hAJYukK
   POMMigT7YcYj3pLDL6lo1hFQ7AEuOqFV8wORomKiviSccaTF+UZrre2zb
   6Ex19h3w2MmI1BCYPV0oRkC+xcBCSibl+uftR2TeRynea/h+FX+o6410k
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="237617253"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="237617253"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 15:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="603507168"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Feb 2022 15:28:22 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJklZ-00091z-Tr; Mon, 14 Feb 2022 23:28:21 +0000
Date: Tue, 15 Feb 2022 07:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Roesch <shr@fb.com>, io-uring@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	kernel-team@fb.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, shr@fb.com
Subject: Re: [PATCH v1 05/14] fs: split off __alloc_page_buffers function
Message-ID: <202202150743.R5ymlf5z-lkp@intel.com>
References: <20220214174403.4147994-6-shr@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214174403.4147994-6-shr@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stefan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on f1baf68e1383f6ed93eb9cff2866d46562607a43]

url:    https://github.com/0day-ci/linux/commits/Stefan-Roesch/Support-sync-buffered-writes-for-io-uring/20220215-014908
base:   f1baf68e1383f6ed93eb9cff2866d46562607a43
config: arm-s5pv210_defconfig (https://download.01.org/0day-ci/archive/20220215/202202150743.R5ymlf5z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/e8b24c1ab111c127cbe1daaac3b607c626fb03a8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stefan-Roesch/Support-sync-buffered-writes-for-io-uring/20220215-014908
        git checkout e8b24c1ab111c127cbe1daaac3b607c626fb03a8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/buffer.c:805:21: warning: no previous prototype for function '__alloc_page_buffers' [-Wmissing-prototypes]
   struct buffer_head *__alloc_page_buffers(struct page *page, unsigned long size,
                       ^
   fs/buffer.c:805:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct buffer_head *__alloc_page_buffers(struct page *page, unsigned long size,
   ^
   static 
   1 warning generated.


vim +/__alloc_page_buffers +805 fs/buffer.c

   804	
 > 805	struct buffer_head *__alloc_page_buffers(struct page *page, unsigned long size,
   806			gfp_t gfp)
   807	{
   808		struct buffer_head *bh, *head;
   809		long offset;
   810		struct mem_cgroup *memcg, *old_memcg;
   811	
   812		/* The page lock pins the memcg */
   813		memcg = page_memcg(page);
   814		old_memcg = set_active_memcg(memcg);
   815	
   816		head = NULL;
   817		offset = PAGE_SIZE;
   818		while ((offset -= size) >= 0) {
   819			bh = alloc_buffer_head(gfp);
   820			if (!bh)
   821				goto no_grow;
   822	
   823			bh->b_this_page = head;
   824			bh->b_blocknr = -1;
   825			head = bh;
   826	
   827			bh->b_size = size;
   828	
   829			/* Link the buffer to its page */
   830			set_bh_page(bh, page, offset);
   831		}
   832	out:
   833		set_active_memcg(old_memcg);
   834		return head;
   835	/*
   836	 * In case anything failed, we just free everything we got.
   837	 */
   838	no_grow:
   839		if (head) {
   840			do {
   841				bh = head;
   842				head = head->b_this_page;
   843				free_buffer_head(bh);
   844			} while (head);
   845		}
   846	
   847		goto out;
   848	}
   849	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
