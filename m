Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF19A2D61C;
	Sun,  5 Nov 2023 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJ0OrGeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699203824; x=1730739824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8WrFVxaLHbY7bOXSRqVPJZ3QK1kaEC5icXCBaYVKMbY=;
  b=UJ0OrGeMEYgzUwW9DdIldniGWMnoZOrQHPOnlhjx68+R+8yHz9lxe/fh
   XfwtqGOT+AXADA/0l/e2CWWb12Q38FrLwbINJcxBNRL1oJTRKFC/oIP2K
   yZ65cQz77tsek4P7wc9tx1Mosg1F/1QSuuvG7DrtNuKa7w3moPCQau5eZ
   FvYOtiC/pqV6dVvLjtVOokG1T0sYBk2x7s6QdamQVuytnD9FnZKouKHfg
   EAFm3vID/c8W9/ZkaBWcjJVrZeFvxTwxDxFoTseIb1XBLaMus9+BDZzmk
   vREqy3NSsR671glelJcA3XHBDNMvhKx/73yGF5jSJhDhTKFqc1Cg0GZWL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="386333759"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="386333759"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 09:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="885694529"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="885694529"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Nov 2023 09:03:42 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzgXE-0005do-0v;
	Sun, 05 Nov 2023 17:03:40 +0000
Date: Mon, 6 Nov 2023 01:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-kunit 1/10] lib/kunit_iov_iter.c:551:47: warning:
 performing pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202311060012.RojaVmD7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-kunit
head:   895a7ddefa3e00a497187cac3d4fb5e57d3059fe
commit: 5af0b69fca117e1436df04951f0a0d917f614e15 [1/10] iov_iter: Fix some checkpatch complaints in kunit tests
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060012.RojaVmD7-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060012.RojaVmD7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060012.RojaVmD7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit_iov_iter.c:551:47: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                           pagelist[i] = (void *)POISON_POINTER_DELTA + 0x5a;
                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   lib/kunit_iov_iter.c:629:47: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                           pagelist[i] = (void *)POISON_POINTER_DELTA + 0x5a;
                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   lib/kunit_iov_iter.c:712:48: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                                   pagelist[i] = (void *)POISON_POINTER_DELTA + 0x5a;
                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   3 warnings generated.


vim +551 lib/kunit_iov_iter.c

   521	
   522	/*
   523	 * Test the extraction of ITER_KVEC-type iterators.
   524	 */
   525	static void __init iov_kunit_extract_pages_kvec(struct kunit *test)
   526	{
   527		const struct kvec_test_range *pr;
   528		struct iov_iter iter;
   529		struct page **bpages, *pagelist[8], **pages = pagelist;
   530		struct kvec kvec[8];
   531		u8 *buffer;
   532		ssize_t len;
   533		size_t bufsize, size = 0, npages;
   534		int i, from;
   535	
   536		bufsize = 0x100000;
   537		npages = bufsize / PAGE_SIZE;
   538	
   539		buffer = iov_kunit_create_buffer(test, &bpages, npages);
   540	
   541		iov_kunit_load_kvec(test, &iter, READ, kvec, ARRAY_SIZE(kvec),
   542				    buffer, bufsize, kvec_test_ranges);
   543		size = iter.count;
   544	
   545		pr = kvec_test_ranges;
   546		from = pr->from;
   547		do {
   548			size_t offset0 = LONG_MAX;
   549	
   550			for (i = 0; i < ARRAY_SIZE(pagelist); i++)
 > 551				pagelist[i] = (void *)POISON_POINTER_DELTA + 0x5a;
   552	
   553			len = iov_iter_extract_pages(&iter, &pages, 100 * 1024,
   554						     ARRAY_SIZE(pagelist), 0, &offset0);
   555			KUNIT_EXPECT_GE(test, len, 0);
   556			if (len < 0)
   557				break;
   558			KUNIT_EXPECT_GE(test, (ssize_t)offset0, 0);
   559			KUNIT_EXPECT_LT(test, offset0, PAGE_SIZE);
   560			KUNIT_EXPECT_LE(test, len, size);
   561			KUNIT_EXPECT_EQ(test, iter.count, size - len);
   562			size -= len;
   563	
   564			if (len == 0)
   565				break;
   566	
   567			for (i = 0; i < ARRAY_SIZE(pagelist); i++) {
   568				struct page *p;
   569				ssize_t part = min_t(ssize_t, len, PAGE_SIZE - offset0);
   570				int ix;
   571	
   572				KUNIT_ASSERT_GE(test, part, 0);
   573				while (from == pr->to) {
   574					pr++;
   575					from = pr->from;
   576					if (from < 0)
   577						goto stop;
   578				}
   579				ix = from / PAGE_SIZE;
   580				KUNIT_ASSERT_LT(test, ix, npages);
   581				p = bpages[ix];
   582				KUNIT_EXPECT_PTR_EQ(test, pagelist[i], p);
   583				KUNIT_EXPECT_EQ(test, offset0, from % PAGE_SIZE);
   584				from += part;
   585				len -= part;
   586				KUNIT_ASSERT_GE(test, len, 0);
   587				if (len == 0)
   588					break;
   589				offset0 = 0;
   590			}
   591	
   592			if (test->status == KUNIT_FAILURE)
   593				break;
   594		} while (iov_iter_count(&iter) > 0);
   595	
   596	stop:
   597		KUNIT_EXPECT_EQ(test, size, 0);
   598		KUNIT_EXPECT_EQ(test, iter.count, 0);
   599		KUNIT_SUCCEED();
   600	}
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
