Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878786995C;
	Fri,  1 Mar 2024 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709291708; cv=none; b=CNZ/Lu2KHZ4YlCcrICngv9XcDmqfz5XioRXiwaMrFYXERBqNNA9Cj13dPFSMWF32ZlQ2wBwTRRf4T6z3oKVtlwU0wnnFfF1XAcxnXJGBKsfYmE5yNK3z4Y/DL0m5VQqjqU0d05HFL5M8lGjenFhrSQMc7Vj+4f6/JTW6SquSBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709291708; c=relaxed/simple;
	bh=PlzhoDlPcdrwTSfhcawxgggP12bq3hBxgvfGrUnzjIM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iT7aCxb5opHOi9XHdxSqgItTeu/eEC1DLyETW1sWZ/hIx8kenPOWAh/vEopwkLhyjADh9tU+g4vm14wT7k0Aq1C2PfA53K3wBNyIpMQp5hhLrBsV9rjF1H0wgpuPAa8kMLPYVD9w6GfpZYP1gleR768hz4yWHEZS25qgFCyUJQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYKtwOk0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYKtwOk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709291706; x=1740827706;
  h=date:from:cc:subject:message-id:mime-version;
  bh=PlzhoDlPcdrwTSfhcawxgggP12bq3hBxgvfGrUnzjIM=;
  b=KYKtwOk0L/2az/M7MEmTjLigLddZwEjOKbs2kJuajr8EXS9vVH3VC7dI
   z+Ncf4PAZ9rppnCI1Xsffkt3uSJYTckFzX/bZofvQYvDiKjrgTEt5k/Dk
   6eu7X0DLg7k8j/w8WaZMuuttRERXfQlOQR8iUs/xz+QzZrpOGOWzsoI7X
   EMzJxvkzi96xjyFlSIg2kEAZJpxyA1beq5MibFVLgiZs/ZqwQ0Tv2Q0SJ
   jOiFPOHQSujRGSIVP1B8YawukkMm7oVsjz2xNqVrW+dZWLLK2kZTaOMH3
   jxGgI1swbJYpRQnevfYPPw3ZYr1+XSe5R52NemGNRb6mBjmf8PBUaCZcn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7644774"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="7644774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 03:15:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="12719365"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Mar 2024 03:15:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg0qp-000Do1-1G;
	Fri, 01 Mar 2024 11:14:54 +0000
Date: Fri, 1 Mar 2024 19:13:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/bcachefs/btree_io.c:1802:27: warning: bitwise operation between
 different enumeration types ('enum bch_watermark' and 'enum
 bch_trans_commit_flags')
Message-ID: <202403011933.ZdyUZUo6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

Hi Kent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   87adedeba51a822533649b143232418b9e26d08b
commit: cb52d23e77a6e5e9588962ba7e283b0d0d2c1976 bcachefs: Rename BTREE_INSERT flags
date:   9 weeks ago
config: hexagon-randconfig-001-20240229 (https://download.01.org/0day-ci/archive/20240301/202403011933.ZdyUZUo6-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403011933.ZdyUZUo6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403011933.ZdyUZUo6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_io.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2177:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
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
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
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
>> fs/bcachefs/btree_io.c:1802:27: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
    1802 |                                         BCH_WATERMARK_reclaim|
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
    1803 |                                         BCH_TRANS_COMMIT_journal_reclaim|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:148:71: note: expanded from macro 'bch2_trans_do'
     148 |         bch2_trans_run(_c, commit_do(trans, _disk_res, _journal_seq, _flags, _do))
         |                                                                              ^~~
   fs/bcachefs/btree_update.h:132:25: note: expanded from macro 'commit_do'
     132 |         lockrestart_do(_trans, _do ?: bch2_trans_commit(_trans, (_disk_res),\
         |                                ^~~
   fs/bcachefs/btree_iter.h:685:12: note: expanded from macro 'lockrestart_do'
     685 |                 _ret2 = (_do);                                          \
         |                          ^~~
   fs/bcachefs/btree_update.h:142:14: note: expanded from macro 'bch2_trans_run'
     142 |         int _ret = (_do);                                               \
         |                     ^~~
   8 warnings generated.


vim +1802 fs/bcachefs/btree_io.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  1774  
9f1833cadda7bb Kent Overstreet 2021-07-10  1775  static void btree_node_write_work(struct work_struct *work)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1776  {
9f1833cadda7bb Kent Overstreet 2021-07-10  1777  	struct btree_write_bio *wbio =
9f1833cadda7bb Kent Overstreet 2021-07-10  1778  		container_of(work, struct btree_write_bio, work);
9f1833cadda7bb Kent Overstreet 2021-07-10  1779  	struct bch_fs *c	= wbio->wbio.c;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1780  	struct btree *b		= wbio->wbio.bio.bi_private;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1781  	struct bch_extent_ptr *ptr;
09ebfa61130eda Kent Overstreet 2023-04-21  1782  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1783  
9f1833cadda7bb Kent Overstreet 2021-07-10  1784  	btree_bounce_free(c,
9f1833cadda7bb Kent Overstreet 2021-07-10  1785  		wbio->data_bytes,
9f1833cadda7bb Kent Overstreet 2021-07-10  1786  		wbio->wbio.used_mempool,
9f1833cadda7bb Kent Overstreet 2021-07-10  1787  		wbio->data);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1788  
9f1833cadda7bb Kent Overstreet 2021-07-10  1789  	bch2_bkey_drop_ptrs(bkey_i_to_s(&wbio->key), ptr,
a2753581f6c5c0 Kent Overstreet 2018-09-30  1790  		bch2_dev_list_has_dev(wbio->wbio.failed, ptr->dev));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1791  
9f1833cadda7bb Kent Overstreet 2021-07-10  1792  	if (!bch2_bkey_nr_ptrs(bkey_i_to_s_c(&wbio->key)))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1793  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1794  
9f1833cadda7bb Kent Overstreet 2021-07-10  1795  	if (wbio->wbio.first_btree_write) {
9f1833cadda7bb Kent Overstreet 2021-07-10  1796  		if (wbio->wbio.failed.nr) {
9f1833cadda7bb Kent Overstreet 2021-07-10  1797  
9f1833cadda7bb Kent Overstreet 2021-07-10  1798  		}
9f1833cadda7bb Kent Overstreet 2021-07-10  1799  	} else {
9f1833cadda7bb Kent Overstreet 2021-07-10  1800  		ret = bch2_trans_do(c, NULL, NULL, 0,
6bd68ec266ad71 Kent Overstreet 2023-09-12  1801  			bch2_btree_node_update_key_get_iter(trans, b, &wbio->key,
f33c58fc46a9c5 Kent Overstreet 2023-06-27 @1802  					BCH_WATERMARK_reclaim|
cb52d23e77a6e5 Kent Overstreet 2023-11-11  1803  					BCH_TRANS_COMMIT_journal_reclaim|
cb52d23e77a6e5 Kent Overstreet 2023-11-11  1804  					BCH_TRANS_COMMIT_no_enospc|
cb52d23e77a6e5 Kent Overstreet 2023-11-11  1805  					BCH_TRANS_COMMIT_no_check_rw,
9f1833cadda7bb Kent Overstreet 2021-07-10  1806  					!wbio->wbio.failed.nr));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1807  		if (ret)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1808  			goto err;
9f1833cadda7bb Kent Overstreet 2021-07-10  1809  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1810  out:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1811  	bio_put(&wbio->wbio.bio);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1812  	btree_node_write_done(c, b);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1813  	return;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1814  err:
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1815  	set_btree_node_noevict(b);
09ebfa61130eda Kent Overstreet 2023-04-21  1816  	if (!bch2_err_matches(ret, EROFS))
e4eb661d3a5764 Kent Overstreet 2023-06-27  1817  		bch2_fs_fatal_error(c, "fatal error writing btree node: %s", bch2_err_str(ret));
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1818  	goto out;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1819  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  1820  

:::::: The code at line 1802 was first introduced by commit
:::::: f33c58fc46a9c5bd6cbf90edb6ce17fa3fd912d5 bcachefs: Kill BTREE_INSERT_USE_RESERVE

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
