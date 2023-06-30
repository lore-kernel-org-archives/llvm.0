Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A1D134B5;
	Fri, 30 Jun 2023 12:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688126427; x=1719662427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5jOmnjHXIKQVYrRMQpofDCwF1+31IdyvbBMDxUzmlzM=;
  b=ERmxYh7jsYBRrYQMjpMG7J6PfV05RIu2ssYiEgGWblB7z/ThH73HqaR9
   NXwk8lamATnPktBcFT8n5LtjZOG/YVa5N2vZGbo/2TF77lN2MGtxWVDVi
   eH04WCslYHO3L5KuA9k5eI5L2eLtfD+q9/eLc9dnVUZxtKgos8+r6ktj0
   yvnB6S3VnyusYm0kpavqgwgL8yzO+teudWSwwZ/vgg+EEuAhKrHJFkYe6
   S1IH4jWc424UXmkMCLLSHL1fpxeb+8YxoGbQoZY/rrzaJsTKltWzR4ouE
   WI66dPYd+pVSxnfe3aQ2K/7QvHEw3j195VwVFww0hu4Z68xgBCqkLpIs4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="393105015"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="393105015"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 05:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711791585"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="711791585"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 05:00:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFCnY-000Ew9-1O;
	Fri, 30 Jun 2023 12:00:24 +0000
Date: Fri, 30 Jun 2023 19:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-extract 11/20] net/9p/trans_common.c:16:6: error:
 conflicting types for 'p9_unpin_pages'
Message-ID: <202306301931.4Y3Srl04-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-extract
head:   19ee2529bb48ab3bba1d2cfc7a0811ae08a22505
commit: d2c1ef131970d6dd345eebda1d47874dd2ab18ac [11/20] 9p: Pin pages rather than ref'ing if appropriate
config: hexagon-randconfig-r024-20230630 (https://download.01.org/0day-ci/archive/20230630/202306301931.4Y3Srl04-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301931.4Y3Srl04-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301931.4Y3Srl04-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/9p/trans_common.c:16:6: error: conflicting types for 'p9_unpin_pages'
      16 | void p9_unpin_pages(struct page **pages, int nr_pages,
         |      ^
   net/9p/trans_common.h:7:6: note: previous declaration is here
       7 | void p9_unpin_pages(struct page **pages, int nr_pages);
         |      ^
>> net/9p/trans_common.c:23:4: error: call to undeclared function 'page_put_unpin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      23 |                         page_put_unpin(pages[i], cleanup_mode);
         |                         ^
   net/9p/trans_common.c:23:4: note: did you mean 'page_put_link'?
   include/linux/fs.h:2887:13: note: 'page_put_link' declared here
    2887 | extern void page_put_link(void *);
         |             ^
   2 errors generated.


vim +/p9_unpin_pages +16 net/9p/trans_common.c

    10	
    11	/**
    12	 * p9_unpin_pages - Unpin pages after the transaction.
    13	 * @pages: array of pages to be put
    14	 * @nr_pages: size of array
    15	 */
  > 16	void p9_unpin_pages(struct page **pages, int nr_pages,
    17			    unsigned int cleanup_mode)
    18	{
    19		int i;
    20	
    21		for (i = 0; i < nr_pages; i++)
    22			if (pages[i])
  > 23				page_put_unpin(pages[i], cleanup_mode);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
