Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732F1362;
	Sat, 25 May 2024 01:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716600916; cv=none; b=HbVuZlQ2dudyroqiMxItOT6Za0NxMKErd8n3BTIAIR/Dh7nGidOfnCWrL2yBzeXFEwZGb7MgCVrgqm3bfVkka6OZ/iD2VM8rjfiH67eD4UoBv0RJeTH3jXcBnO7touK5PqormWJlOdbRbJY3O3FZc8uktgqCiLYh36iPStqDilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716600916; c=relaxed/simple;
	bh=NC6HMat4skw5VIQrflD3p4BkpVKSlEfdqAAuv6T4PjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xn0/GP17JafzfmXpFi4egGBnsatgK3qZd4YN5MKOjYUki19gmelvBSsk6aik5KRmfoyVozTYofWyvBozERAfGe9rDXsIf3OwnqH3DQms4AYi7qo4xQsYm3kywRgP5B9Nt+26Cn91OzPFiTB+hfrihi5QX75jH5vkKcKa3MY7bCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lpup6GQG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lpup6GQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716600914; x=1748136914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NC6HMat4skw5VIQrflD3p4BkpVKSlEfdqAAuv6T4PjU=;
  b=Lpup6GQGnAnDCBZ+qU84NNrpZ7LsgWMseQDx+v9DzRa5Ro9jL43Fv8pC
   lEMkymO5/u4GdCmeqYBVpOkhIw2d9qQ+WjQhNqtj50Nd1x6ZcwPsfasli
   CLsk9chIyStmDPDFm1K4S28QhfpsjaaxEJ7oi0qu7JPSLne5YZUy8fuQ5
   ynN+9A5RhiL1fkUnOxprQBl/9kjcBdAfKuG7XQ5pRQMyStr34zOuy9UhE
   0VyJldOWb5dccO6cCgXjNIuEldnWZGIzkauRZ9Ih5pnt0Qg0JFP4urtYz
   43V7wbq910wyzoBCYRJBG2REZlAkoomycu6IA7ciLDckc0ajh18Wsldm6
   Q==;
X-CSE-ConnectionGUID: JpcXP6SrSQOqnh50c6jcQw==
X-CSE-MsgGUID: U94yuANxSEiGLf5rNQ/RJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24120192"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="24120192"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 18:35:14 -0700
X-CSE-ConnectionGUID: KAmSgHchS1SyToSK7kNywQ==
X-CSE-MsgGUID: jEcR663lTH65RuihFcGFvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="71601267"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 May 2024 18:35:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAgJS-00069M-0A;
	Sat, 25 May 2024 01:35:10 +0000
Date: Sat, 25 May 2024 09:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 21/23] fs/bcachefs/btree_io.c:542:7:
 warning: format specifies type 'size_t' (aka 'unsigned int') but the
 argument has type 'unsigned long'
Message-ID: <202405250948.JeFBsoxZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   254510a1c2691db5fdaccbafe0e1872fd7a2e4e6
commit: ab2c3aaf4521ab863cb8efebf4139add2ccf58ae [21/23] bcachefs: Plumb bkey into __btree_err()
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240525/202405250948.JeFBsoxZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250948.JeFBsoxZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250948.JeFBsoxZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_io.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/bcachefs/btree_io.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/bcachefs/btree_io.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/bcachefs/btree_io.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/bcachefs/btree_io.c:542:7: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     541 |                 prt_printf(out, " bset byte offset %zu",
         |                                                    ~~~
         |                                                    %lu
     542 |                            (unsigned long)(void *)k -
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
     543 |                            ((unsigned long)(void *)i & ~511UL));
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/btree_io.c:1895:36: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
    1895 |                                         BCH_WATERMARK_interior_updates|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
    1896 |                                         BCH_TRANS_COMMIT_journal_reclaim|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:190:71: note: expanded from macro 'bch2_trans_do'
     190 |         bch2_trans_run(_c, commit_do(trans, _disk_res, _journal_seq, _flags, _do))
         |                                                                              ^~~
   fs/bcachefs/btree_update.h:174:25: note: expanded from macro 'commit_do'
     174 |         lockrestart_do(_trans, _do ?: bch2_trans_commit(_trans, (_disk_res),\
         |                                ^~~
   fs/bcachefs/btree_iter.h:670:11: note: expanded from macro 'lockrestart_do'
     670 |         _ret2 = (_do);                                                  \
         |                  ^~~
   fs/bcachefs/btree_update.h:184:14: note: expanded from macro 'bch2_trans_run'
     184 |         int _ret = (_do);                                               \
         |                     ^~~
   9 warnings generated.


vim +542 fs/bcachefs/btree_io.c

   519	
   520	static void btree_err_msg(struct printbuf *out, struct bch_fs *c,
   521				  struct bch_dev *ca,
   522				  struct btree *b, struct bset *i, struct bkey_packed *k,
   523				  unsigned offset, int write)
   524	{
   525		prt_printf(out, bch2_log_msg(c, "%s"),
   526			   write == READ
   527			   ? "error validating btree node "
   528			   : "corrupt btree node before write ");
   529		if (ca)
   530			prt_printf(out, "on %s ", ca->name);
   531		prt_printf(out, "at btree ");
   532		bch2_btree_pos_to_text(out, c, b);
   533	
   534		printbuf_indent_add(out, 2);
   535	
   536		prt_printf(out, "\nnode offset %u/%u",
   537			   b->written, btree_ptr_sectors_written(&b->key));
   538		if (i)
   539			prt_printf(out, " bset u64s %u", le16_to_cpu(i->u64s));
   540		if (k)
   541			prt_printf(out, " bset byte offset %zu",
 > 542				   (unsigned long)(void *)k -
   543				   ((unsigned long)(void *)i & ~511UL));
   544		prt_str(out, ": ");
   545	}
   546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
