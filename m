Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37321C6AF;
	Sat, 13 Apr 2024 07:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712991851; cv=none; b=mxdCkBPRALAQWgUldjcS3m7lhHvJgHPMQzdkUAhOF0IkqR+1jz/wlweb4NsLCDrfoHMXj5z1btzhRLQWwmYGC+pX4YtWbPVHG93sR8B8yiBVYxLllDDgvyTRqO+50J4b7ynjtImvkYJ/C+GfrMPe6FihT5JyQm2uDXNGX367EtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712991851; c=relaxed/simple;
	bh=aW9wxNKqRJSeX4y280z8ZkAPeC+1lDwGPIApSV5fVEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tOBEKcmJxKcOTle811vVqi19P6tTWH9DI+voa9DiB5n/72iKYyX2Zcy3nGlVB+dXAmAwDcl8O8JC2iseFqb6GAkdvVVdSJ08jRe/HuGYjWQEmWZa39O36VP/7Bl9ctShAVSkYbUOEgvmZ8ATj26OYMkJjYQ7xx/53eIbM7H+HvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hk7mVdtL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hk7mVdtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712991849; x=1744527849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aW9wxNKqRJSeX4y280z8ZkAPeC+1lDwGPIApSV5fVEc=;
  b=hk7mVdtLVl1YDkiiCIvg4E9MTq7upu8Vz/Uc8qNQ6r63oRsfJmQedLDf
   f3aK2NVPSH84N/L6cHNtJr0YJa6LYd/TTmUARTX9VwjU6XpGOmsoRnrfr
   i1NLkcANeZK3mOOrZIldv/IXwGB/cUzPrG9p13CScshrMAju2dogGVz2i
   /ujHnSV09qX6xwm45jgc6ysIVoqYSGrGmLBX7PHHnsy4ckpJIZnJ2NukN
   ThGET8JNfBlE/ccC/aaKpDwhXEmsevFawdF8likr2DjYwHRBeYG1TyAhD
   cTRnT9wvN8kaZxI99P5pjnGM0vs25w7+COKOrvyq2DPt1cJsSZ+JLXByG
   Q==;
X-CSE-ConnectionGUID: 1wq3gJjzT9yDZwZromwxtw==
X-CSE-MsgGUID: sXhKN8pLTwOKE6WEqEMN8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8312570"
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="8312570"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 00:04:08 -0700
X-CSE-ConnectionGUID: hYR7rHi9SOiSBX/7wJMA+w==
X-CSE-MsgGUID: DU+6UBnvRYy4nqYsR+66yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,198,1708416000"; 
   d="scan'208";a="21455636"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2024 00:04:06 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvXQi-0001zU-0A;
	Sat, 13 Apr 2024 07:04:04 +0000
Date: Sat, 13 Apr 2024 15:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 79/139] fs/bcachefs/btree_io.c:893:6:
 warning: format specifies type 'unsigned long' but the argument has type
 'unsigned int'
Message-ID: <202404131536.HdAMBOVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   c5ff0e7dfafa4898b8cc873266d71b465bb062dc
commit: efa71a63d7d88348ef4dc6421e353f5bb8dd3662 [79/139] bcachefs: Check for packed bkeys that are too big
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240413/202404131536.HdAMBOVc-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240413/202404131536.HdAMBOVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131536.HdAMBOVc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_io.c:3:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
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
   In file included from arch/hexagon/include/asm/io.h:328:
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
   In file included from arch/hexagon/include/asm/io.h:328:
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
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/bcachefs/btree_io.c:893:6: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     887 |                 if (btree_err_on(!bkeyp_u64s_valid(&b->format, k),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     888 |                                  -BCH_ERR_btree_node_read_err_fixable,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     889 |                                  c, NULL, b, i,
         |                                  ~~~~~~~~~~~~~~
     890 |                                  btree_node_bkey_bad_u64s,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~
     891 |                                  "bad k->u64s %u (min %u max %lu)", k->u64s,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                              %u
     892 |                                  bkeyp_key_u64s(&b->format, k),
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     893 |                                  U8_MAX - BKEY_U64s + bkeyp_key_u64s(&b->format, k)))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/limits.h:15:17: note: expanded from macro 'U8_MAX'
      15 | #define U8_MAX          ((u8)~0U)
         |                         ^
   fs/bcachefs/btree_io.c:613:53: note: expanded from macro 'btree_err_on'
     613 | #define btree_err_on(cond, ...) ((cond) ? btree_err(__VA_ARGS__) : false)
         |                                           ~~~~~~~~~~^~~~~~~~~~~~
   fs/bcachefs/btree_io.c:603:18: note: expanded from macro 'btree_err'
     603 |                                msg, ##__VA_ARGS__);                     \
         |                                ~~~    ^~~~~~~~~~~
   fs/bcachefs/btree_io.c:1870:36: warning: bitwise operation between different enumeration types ('enum bch_watermark' and 'enum bch_trans_commit_flags') [-Wenum-enum-conversion]
    1870 |                                         BCH_WATERMARK_interior_updates|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
    1871 |                                         BCH_TRANS_COMMIT_journal_reclaim|
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_update.h:188:71: note: expanded from macro 'bch2_trans_do'
     188 |         bch2_trans_run(_c, commit_do(trans, _disk_res, _journal_seq, _flags, _do))
         |                                                                              ^~~
   fs/bcachefs/btree_update.h:172:25: note: expanded from macro 'commit_do'
     172 |         lockrestart_do(_trans, _do ?: bch2_trans_commit(_trans, (_disk_res),\
         |                                ^~~
   fs/bcachefs/btree_iter.h:662:11: note: expanded from macro 'lockrestart_do'
     662 |         _ret2 = (_do);                                                  \
         |                  ^~~
   fs/bcachefs/btree_update.h:182:14: note: expanded from macro 'bch2_trans_run'
     182 |         int _ret = (_do);                                               \
         |                     ^~~
   9 warnings generated.


vim +893 fs/bcachefs/btree_io.c

   853	
   854	static int validate_bset_keys(struct bch_fs *c, struct btree *b,
   855				 struct bset *i, int write,
   856				 bool have_retry, bool *saw_error)
   857	{
   858		unsigned version = le16_to_cpu(i->version);
   859		struct bkey_packed *k, *prev = NULL;
   860		struct printbuf buf = PRINTBUF;
   861		bool updated_range = b->key.k.type == KEY_TYPE_btree_ptr_v2 &&
   862			BTREE_PTR_RANGE_UPDATED(&bkey_i_to_btree_ptr_v2(&b->key)->v);
   863		int ret = 0;
   864	
   865		for (k = i->start;
   866		     k != vstruct_last(i);) {
   867			struct bkey_s u;
   868			struct bkey tmp;
   869			unsigned next_good_key;
   870	
   871			if (btree_err_on(bkey_p_next(k) > vstruct_last(i),
   872					 -BCH_ERR_btree_node_read_err_fixable,
   873					 c, NULL, b, i,
   874					 btree_node_bkey_past_bset_end,
   875					 "key extends past end of bset")) {
   876				i->u64s = cpu_to_le16((u64 *) k - i->_data);
   877				break;
   878			}
   879	
   880			if (btree_err_on(k->format > KEY_FORMAT_CURRENT,
   881					 -BCH_ERR_btree_node_read_err_fixable,
   882					 c, NULL, b, i,
   883					 btree_node_bkey_bad_format,
   884					 "invalid bkey format %u", k->format))
   885				goto drop_this_key;
   886	
   887			if (btree_err_on(!bkeyp_u64s_valid(&b->format, k),
   888					 -BCH_ERR_btree_node_read_err_fixable,
   889					 c, NULL, b, i,
   890					 btree_node_bkey_bad_u64s,
   891					 "bad k->u64s %u (min %u max %lu)", k->u64s,
   892					 bkeyp_key_u64s(&b->format, k),
 > 893					 U8_MAX - BKEY_U64s + bkeyp_key_u64s(&b->format, k)))
   894				goto drop_this_key;
   895	
   896			if (!write)
   897				bch2_bkey_compat(b->c.level, b->c.btree_id, version,
   898					    BSET_BIG_ENDIAN(i), write,
   899					    &b->format, k);
   900	
   901			u = __bkey_disassemble(b, k, &tmp);
   902	
   903			printbuf_reset(&buf);
   904			if (bset_key_invalid(c, b, u.s_c, updated_range, write, &buf)) {
   905				printbuf_reset(&buf);
   906				bset_key_invalid(c, b, u.s_c, updated_range, write, &buf);
   907				prt_printf(&buf, "\n  ");
   908				bch2_bkey_val_to_text(&buf, c, u.s_c);
   909	
   910				btree_err(-BCH_ERR_btree_node_read_err_fixable,
   911					  c, NULL, b, i,
   912					  btree_node_bad_bkey,
   913					  "invalid bkey: %s", buf.buf);
   914				goto drop_this_key;
   915			}
   916	
   917			if (write)
   918				bch2_bkey_compat(b->c.level, b->c.btree_id, version,
   919					    BSET_BIG_ENDIAN(i), write,
   920					    &b->format, k);
   921	
   922			if (prev && bkey_iter_cmp(b, prev, k) > 0) {
   923				struct bkey up = bkey_unpack_key(b, prev);
   924	
   925				printbuf_reset(&buf);
   926				prt_printf(&buf, "keys out of order: ");
   927				bch2_bkey_to_text(&buf, &up);
   928				prt_printf(&buf, " > ");
   929				bch2_bkey_to_text(&buf, u.k);
   930	
   931				if (btree_err(-BCH_ERR_btree_node_read_err_fixable,
   932					      c, NULL, b, i,
   933					      btree_node_bkey_out_of_order,
   934					      "%s", buf.buf))
   935					goto drop_this_key;
   936			}
   937	
   938			prev = k;
   939			k = bkey_p_next(k);
   940			continue;
   941	drop_this_key:
   942			next_good_key = k->u64s;
   943	
   944			if (!next_good_key ||
   945			    (BSET_BIG_ENDIAN(i) == CPU_BIG_ENDIAN &&
   946			     version >= bcachefs_metadata_version_snapshot)) {
   947				/*
   948				 * only do scanning if bch2_bkey_compat() has nothing to
   949				 * do
   950				 */
   951	
   952				if (!bkey_packed_valid(c, b, i, (void *) ((u64 *) k + next_good_key))) {
   953					for (next_good_key = 1;
   954					     next_good_key < (u64 *) vstruct_last(i) - (u64 *) k;
   955					     next_good_key++)
   956						if (bkey_packed_valid(c, b, i, (void *) ((u64 *) k + next_good_key)))
   957							goto got_good_key;
   958				}
   959	
   960				/*
   961				 * didn't find a good key, have to truncate the rest of
   962				 * the bset
   963				 */
   964				next_good_key = (u64 *) vstruct_last(i) - (u64 *) k;
   965			}
   966	got_good_key:
   967			le16_add_cpu(&i->u64s, -next_good_key);
   968			memmove_u64s_down(k, bkey_p_next(k), (u64 *) vstruct_end(i) - (u64 *) k);
   969		}
   970	fsck_err:
   971		printbuf_exit(&buf);
   972		return ret;
   973	}
   974	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
