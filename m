Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9516430344;
	Fri, 17 Nov 2023 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzZTcuta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700227816; x=1731763816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rhtSPekSs7KwRL5a1ctU+DiZKDMVTv8mjNGqU4u6Zhc=;
  b=NzZTcuta6Q7Dtjzzs7GuFaU5z0Htw/hZqyYnvWdDAeUHYoW0RW2eosau
   P6+ATCQS6oorn8UZbd1IA6iJHPj4nUBcPkIarc8csEPhUAzhyEJSa9PTx
   oeGPZyAdNIqmYdLxhYOnrcBpbHdMRFP5DU6vExtBJmX8idbrXrnDI9Fi+
   vUgP+KhmFoTSxuu+VOrXRod0+4jbsYRmjnN1lV7vbvoC3suLMQn5Dvy6M
   MkD02ZrIIzDzxlTmSDbMksd4/ZVD9xy0PYYeWmxXT+2uHk0uZHOt12GN9
   sBiZDoP8GKzsb/lzmetTfZyM8X5xbs5Eh7banVAYjmY2c+1SzgtIA+b4o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="9960118"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="9960118"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 05:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="939148470"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="939148470"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Nov 2023 05:30:14 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3yvE-0002pX-0X;
	Fri, 17 Nov 2023 13:30:12 +0000
Date: Fri, 17 Nov 2023 21:30:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-kunit 1/6] lib/kunit_iov_iter.c:551:47: warning:
 performing pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202311172145.ZjpSTmPw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-kunit
head:   7c85bb8bf31d419e04c93c10cc5348af1f499d77
commit: 9176b1c027c84dd5c718df009dd5ef26317d3094 [1/6] iov_iter: Fix some checkpatch complaints in kunit tests
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20231117/202311172145.ZjpSTmPw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311172145.ZjpSTmPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172145.ZjpSTmPw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/kunit_iov_iter.c:14:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from lib/kunit_iov_iter.c:14:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from lib/kunit_iov_iter.c:14:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> lib/kunit_iov_iter.c:551:47: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     551 |                         pagelist[i] = (void *)POISON_POINTER_DELTA + 0x5a;
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   lib/kunit_iov_iter.c:629:47: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     629 |                         pagelist[i] = (void *)POISON_POINTER_DELTA + 0x5a;
         |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   lib/kunit_iov_iter.c:712:48: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     712 |                                 pagelist[i] = (void *)POISON_POINTER_DELTA + 0x5a;
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   9 warnings generated.


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
