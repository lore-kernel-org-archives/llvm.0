Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA25F8F68;
	Tue, 12 Sep 2023 19:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694547801; x=1726083801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3OoHMxEVK+wrimvhEkdTFCstSCMOT2UcJg98+J+qPoc=;
  b=LjoQ93Ebo2oEQxMy29iMm0o1uY/f2C5/W0qKWSLxoWYrOXfISQDBG2zQ
   OM5Ps2arET48Bo7o6SY5vkI41aAM8s3DukzYhUQZadgyOrVdTA/oZDIC+
   VTZkAEdVF7BH9Ztw9/Xrv5zLkZFPwEw0f+go1wPwv6ZrY9CgQVJzIRARF
   s+8HROBFFuMy9I4JXjCzMoSDqzKiaGPWxg2N68t5UK6rgLSGj8qPp8z6f
   acIfkDtRTEdDIh5PRdrTCvGpeZfsO8gs7uanhSPDVn7eS9GU+OySTOofU
   iddUYc+P1aP29jjErYhRATHjwbdBh7ALpnleEdwFk+TukxbhNdaeM8KTv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="381175880"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="381175880"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 12:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720533225"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="720533225"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Sep 2023 12:43:16 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg9I2-0000C9-2B;
	Tue, 12 Sep 2023 19:43:14 +0000
Date: Wed, 13 Sep 2023 03:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2726/4552]
 fs/bcachefs/buckets_waiting_for_journal.c:137:30: warning: format specifies
 type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long'
Message-ID: <202309130336.XvYzw3sO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3c13c772fc233a10342c8e1605ff0855dfdf0c89
commit: 7a82e75ddaef8b97fd1eac358d6c320dc120ec61 [2726/4552] bcachefs: New data structure for buckets waiting on journal commit
config: powerpc-randconfig-r006-20230912 (https://download.01.org/0day-ci/archive/20230913/202309130336.XvYzw3sO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130336.XvYzw3sO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130336.XvYzw3sO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/buckets_waiting_for_journal.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:211:1: note: expanded from here
     211 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
     611 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/bcachefs/buckets_waiting_for_journal.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:213:1: note: expanded from here
     213 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
     612 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/bcachefs/buckets_waiting_for_journal.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:215:1: note: expanded from here
     215 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
     613 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/bcachefs/buckets_waiting_for_journal.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:217:1: note: expanded from here
     217 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
     614 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> fs/bcachefs/buckets_waiting_for_journal.c:137:30: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     137 |         pr_debug("took %zu rehashes, table at %zu/%zu elements",
         |                                                   ~~~
         |                                                   %lu
     138 |                  nr_rehashes, nr_elements, 1UL << b->t->bits);
         |                                            ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:585:38: note: expanded from macro 'pr_debug'
     585 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: expanded from macro 'no_printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   7 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +137 fs/bcachefs/buckets_waiting_for_journal.c

    85	
    86	int bch2_set_bucket_needs_journal_commit(struct buckets_waiting_for_journal *b,
    87						 u64 flushed_seq,
    88						 unsigned dev, u64 bucket,
    89						 u64 journal_seq)
    90	{
    91		struct buckets_waiting_for_journal_table *t, *n;
    92		struct bucket_hashed tmp, new = {
    93			.dev_bucket	= (u64) dev << 56 | bucket,
    94			.journal_seq	= journal_seq,
    95		};
    96		size_t i, size, new_bits, nr_elements = 1, nr_rehashes = 0;
    97		int ret = 0;
    98	
    99		mutex_lock(&b->lock);
   100	
   101		if (likely(bucket_table_insert(b->t, &new, flushed_seq)))
   102			goto out;
   103	
   104		t = b->t;
   105		size = 1UL << t->bits;
   106		for (i = 0; i < size; i++)
   107			nr_elements += t->d[i].journal_seq > flushed_seq;
   108	
   109		new_bits = t->bits + (nr_elements * 3 > size);
   110	
   111		n = kvmalloc(sizeof(*n) + (sizeof(n->d[0]) << new_bits), GFP_KERNEL);
   112		if (!n) {
   113			ret = -ENOMEM;
   114			goto out;
   115		}
   116	
   117	retry_rehash:
   118		nr_rehashes++;
   119		bucket_table_init(n, new_bits);
   120	
   121		tmp = new;
   122		BUG_ON(!bucket_table_insert(n, &tmp, flushed_seq));
   123	
   124		for (i = 0; i < 1UL << t->bits; i++) {
   125			if (t->d[i].journal_seq <= flushed_seq)
   126				continue;
   127	
   128			tmp = t->d[i];
   129			if (!bucket_table_insert(n, &tmp, flushed_seq))
   130				goto retry_rehash;
   131		}
   132	
   133		b->t = n;
   134		kvfree(t);
   135	
   136		pr_debug("took %zu rehashes, table at %zu/%zu elements",
 > 137			 nr_rehashes, nr_elements, 1UL << b->t->bits);
   138	out:
   139		mutex_unlock(&b->lock);
   140	
   141		return ret;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
