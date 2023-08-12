Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55FD15C0;
	Sat, 12 Aug 2023 03:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691811622; x=1723347622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5AEkeOS6qZ2V+MDZoutexMhVmAfEp3JxnvhCcw0lwYA=;
  b=NNTgIPdZZYCm6IHnbfbpFCFlNxuSiQ2sceLLvZaK724CJuwsXbJGPSGF
   6KRpoRb2LzSPLuu42n6vHgqW9i1U6Zbdg6PtNLiqRGyP4w5Ff4nNlVqg+
   WJtXJ9ITWqbDWLvCqwVdW5kp7LUeWOpWJOxFb+bcTkdHuLDktQ0k4VQjL
   3mWJ6Eor8YRZd2QJWpZ0WSDUsgTp3dUgnm2IyB97wxebyjqC0OlJE23CZ
   /S9U+BlR4fIP/9FQagOv0Ip3OUOGrSeRe9SVSdyE6Lkb65R5kpeTJoJa1
   Wi9cuKe6rmqqC9yFn3I2HaJNcowKK4E/Bh2NqRVzaxnQ3H5WeZ8+JsBqi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="435694527"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="435694527"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 20:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="767862577"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="767862577"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Aug 2023 20:39:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUfSu-0008Ei-38;
	Sat, 12 Aug 2023 03:39:00 +0000
Date: Sat, 12 Aug 2023 11:38:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] iov_iter: Convert iterate*() to inline funcs
Message-ID: <202308121101.bFTnfifW-lkp@intel.com>
References: <3710261.1691764329@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3710261.1691764329@warthog.procyon.org.uk>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc5]
[cannot apply to hch-configfs/for-next next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/iov_iter-Convert-iterate-to-inline-funcs/20230811-224036
base:   linus/master
patch link:    https://lore.kernel.org/r/3710261.1691764329%40warthog.procyon.org.uk
patch subject: [RFC PATCH] iov_iter: Convert iterate*() to inline funcs
config: hexagon-randconfig-r026-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121101.bFTnfifW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121101.bFTnfifW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121101.bFTnfifW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/iov_iter.c:4:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from lib/iov_iter.c:4:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from lib/iov_iter.c:4:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> lib/iov_iter.c:162:11: warning: comparison of distinct pointer types ('typeof (flen) *' (aka 'unsigned int *') and 'typeof ((1UL << 14) - ((unsigned long)(offset) & ~(~((1 << 14) - 1)))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
     162 |                         part = min(flen, PAGE_SIZE - offset_in_page(offset));
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
      67 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                    ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   7 warnings generated.


vim +162 lib/iov_iter.c

   133	
   134	static __always_inline
   135	size_t iterate_xarray(struct iov_iter *iter, size_t len, void *priv, __wsum *csum,
   136			      iov_step_f step)
   137	{
   138		struct folio *folio;
   139		size_t progress = 0;
   140		loff_t start = iter->xarray_start + iter->iov_offset;
   141		pgoff_t index = start / PAGE_SIZE;
   142		XA_STATE(xas, iter->xarray, index);
   143	
   144		rcu_read_lock();
   145		xas_for_each(&xas, folio, ULONG_MAX) {
   146			size_t remain, consumed, offset, part, flen;
   147	
   148			if (xas_retry(&xas, folio))
   149				continue;
   150			if (WARN_ON(xa_is_value(folio)))
   151				break;
   152			if (WARN_ON(folio_test_hugetlb(folio)))
   153				break;
   154	
   155			offset = offset_in_folio(folio, start);
   156			flen = min(folio_size(folio) - offset, len);
   157			start += flen;
   158	
   159			while (flen) {
   160				void *base = kmap_local_folio(folio, offset);
   161	
 > 162				part = min(flen, PAGE_SIZE - offset_in_page(offset));
   163				remain = step(base, progress, part, priv, csum);
   164				kunmap_local(base);
   165	
   166				consumed = part - remain;
   167				progress += consumed;
   168				len -= consumed;
   169	
   170				if (remain || len == 0)
   171					goto out;
   172				flen -= consumed;
   173				offset += consumed;
   174			}
   175		}
   176	
   177	out:
   178		rcu_read_unlock();
   179		iter->iov_offset += progress;
   180		iter->count -= progress;
   181		return progress;
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
