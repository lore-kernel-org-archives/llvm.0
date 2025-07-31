Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B7415624B;
	Thu, 31 Jul 2025 23:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754002907; cv=none; b=PS/+x9sbHtMBJuDjV5thXkG0m+99QngevDOjFGTUS1fNY8O+/fS+X3x6pTSSof+BpKUdCBRJK36ZSbxakzgjWrFWAwekukTyWnAbJnAinO/oWZrb68O3yzGyW2oZixcz3u/X8uIH87icJ8daFZWFEU1NK851gAt3VLg6WEgtB1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754002907; c=relaxed/simple;
	bh=p7zsWzWIuifycMqOxE9/EZ+RcTO2IByojMKDbMqvNCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJkzlAA/fKeU4JIdE/M89WDynpZ5Qjzk7LRm3Wbbqa9eApm4nM6OqRMeh3fof9+x+DlkwlUzcKPXliiYBw9ZQ1oTopF3KFZYbcGphD9pdJJaEIJB+KQmTDzdgRHqy2dEv37TJACO5JkkVLTLBFSzdTiNEg6uUP0ZA/2MfvK76Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AshfKbod; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AshfKbod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754002906; x=1785538906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p7zsWzWIuifycMqOxE9/EZ+RcTO2IByojMKDbMqvNCE=;
  b=AshfKbodTKqhWStAXlFg+kT0K4veYOPWTGzwwJ7RtmTscrphjBC+LwxT
   C0R5M+ydqOFeOlDpzdi1Hi1xo/nNCAvvHfj31wSQWsBwC1dEbacyFTsGt
   edbJlOIK0ZJ4s72IWMyuQaTpLW3H8NYERny2QXxnelSnA+8heJevOyhyz
   ib8x0IaNykokbIS6n9r90FjPa7reB7z9um/SINEFH3DYclstPZJZhjcRH
   c1YoUPvY8IaiIHTkCwMvH60I4/iNHHH+EiWkEMIFnSN6uZqWWbunw6N7p
   Cf5vsyYhFuUAUbOR517VBFExVUPLqwb0tlNFlkJrTACuA4vLAt5yWX60g
   g==;
X-CSE-ConnectionGUID: Ma8fUYKGSKCFiqdyA5tz7Q==
X-CSE-MsgGUID: sN8ZeMs7RHO5WiDeiAsDqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67037752"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67037752"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 16:01:43 -0700
X-CSE-ConnectionGUID: TFkWQUCnTDOmrSpT3EcLsA==
X-CSE-MsgGUID: BjiqkLXdTmeysJPCWSEtBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163100600"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2025 16:01:42 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhcHL-0004B6-2f;
	Thu, 31 Jul 2025 23:01:39 +0000
Date: Fri, 1 Aug 2025 07:01:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 237/239]
 fs/bcachefs/namei.c:763:3: error: cannot jump from this goto statement to
 its label
Message-ID: <202508010656.YhJRK3DX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   474062e5a3c6cec1b36d6d5df81a4750b8b6d6d0
commit: 0bb43b0a96be30cb01f9f830994a30ca20961f8f [237/239] bcachefs: Kill bch2_bkey_get_iter_typed()
config: x86_64-buildonly-randconfig-004-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010656.YhJRK3DX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010656.YhJRK3DX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010656.YhJRK3DX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/namei.c:763:3: error: cannot jump from this goto statement to its label
     763 |                 fsck_err_on(target->bi_flags & BCH_INODE_unlinked,
         |                 ^
   fs/bcachefs/error.h:143:2: note: expanded from macro 'fsck_err_on'
     143 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/error.h:130:20: note: expanded from macro '__fsck_err_on'
     130 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                           ^
   fs/bcachefs/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/namei.c:778:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     778 |         CLASS(btree_iter, bp_iter)(trans, BTREE_ID_dirents,
         |                           ^
   fs/bcachefs/namei.c:754:3: error: cannot jump from this goto statement to its label
     754 |                 fsck_err_on(S_ISDIR(target->bi_mode),
         |                 ^
   fs/bcachefs/error.h:143:2: note: expanded from macro 'fsck_err_on'
     143 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/error.h:130:20: note: expanded from macro '__fsck_err_on'
     130 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                           ^
   fs/bcachefs/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/namei.c:778:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
     778 |         CLASS(btree_iter, bp_iter)(trans, BTREE_ID_dirents,
         |                           ^
   2 errors generated.
--
>> fs/bcachefs/fsck.c:2170:6: error: cannot jump from this goto statement to its label
    2170 |             fsck_err_on(!ret && !bch2_snapshot_is_ancestor(c, parent_snapshot, d.k->p.snapshot),
         |             ^
   fs/bcachefs/error.h:143:2: note: expanded from macro 'fsck_err_on'
     143 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/error.h:130:20: note: expanded from macro '__fsck_err_on'
     130 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                           ^
   fs/bcachefs/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/fsck.c:2188:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2188 |         CLASS(btree_iter, subvol_iter)(trans, BTREE_ID_subvolumes, POS(0, target_subvol), 0);
         |                           ^
   fs/bcachefs/fsck.c:2166:6: error: cannot jump from this goto statement to its label
    2166 |         if (fsck_err_on(ret,
         |             ^
   fs/bcachefs/error.h:143:2: note: expanded from macro 'fsck_err_on'
     143 |         __fsck_err_on(cond, c, FSCK_CAN_FIX|FSCK_CAN_IGNORE, _err_type, __VA_ARGS__)
         |         ^
   fs/bcachefs/error.h:130:20: note: expanded from macro '__fsck_err_on'
     130 |         (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                           ^
   fs/bcachefs/error.h:117:26: note: expanded from macro '__fsck_err'
     117 | #define __fsck_err(...)         fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                 ^
   fs/bcachefs/error.h:111:3: note: expanded from macro 'fsck_err_wrap'
     111 |                 goto fsck_err;                                          \
         |                 ^
   fs/bcachefs/fsck.c:2188:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2188 |         CLASS(btree_iter, subvol_iter)(trans, BTREE_ID_subvolumes, POS(0, target_subvol), 0);
         |                           ^
   2 errors generated.


vim +763 fs/bcachefs/namei.c

758ea4ff812b4df Kent Overstreet 2025-03-20  740  
758ea4ff812b4df Kent Overstreet 2025-03-20  741  static int bch2_check_dirent_inode_dirent(struct btree_trans *trans,
758ea4ff812b4df Kent Overstreet 2025-03-20  742  					  struct bkey_s_c_dirent d,
9b0d00a3693bbab Kent Overstreet 2025-03-20  743  					  struct bch_inode_unpacked *target,
9b0d00a3693bbab Kent Overstreet 2025-03-20  744  					  bool in_fsck)
758ea4ff812b4df Kent Overstreet 2025-03-20  745  {
758ea4ff812b4df Kent Overstreet 2025-03-20  746  	struct bch_fs *c = trans->c;
600387c961b2ea6 Kent Overstreet 2025-07-14  747  	CLASS(printbuf, buf)();
758ea4ff812b4df Kent Overstreet 2025-03-20  748  	int ret = 0;
758ea4ff812b4df Kent Overstreet 2025-03-20  749  
758ea4ff812b4df Kent Overstreet 2025-03-20  750  	if (inode_points_to_dirent(target, d))
758ea4ff812b4df Kent Overstreet 2025-03-20  751  		return 0;
758ea4ff812b4df Kent Overstreet 2025-03-20  752  
bbc3a0b17a890aa Kent Overstreet 2025-06-17  753  	if (!bch2_inode_has_backpointer(target)) {
758ea4ff812b4df Kent Overstreet 2025-03-20  754  		fsck_err_on(S_ISDIR(target->bi_mode),
758ea4ff812b4df Kent Overstreet 2025-03-20  755  			    trans, inode_dir_missing_backpointer,
758ea4ff812b4df Kent Overstreet 2025-03-20  756  			    "directory with missing backpointer\n%s",
758ea4ff812b4df Kent Overstreet 2025-03-20  757  			    (printbuf_reset(&buf),
758ea4ff812b4df Kent Overstreet 2025-03-20  758  			     bch2_bkey_val_to_text(&buf, c, d.s_c),
758ea4ff812b4df Kent Overstreet 2025-03-20  759  			     prt_printf(&buf, "\n"),
758ea4ff812b4df Kent Overstreet 2025-03-20  760  			     bch2_inode_unpacked_to_text(&buf, target),
758ea4ff812b4df Kent Overstreet 2025-03-20  761  			     buf.buf));
758ea4ff812b4df Kent Overstreet 2025-03-20  762  
758ea4ff812b4df Kent Overstreet 2025-03-20 @763  		fsck_err_on(target->bi_flags & BCH_INODE_unlinked,
758ea4ff812b4df Kent Overstreet 2025-03-20  764  			    trans, inode_unlinked_but_has_dirent,
758ea4ff812b4df Kent Overstreet 2025-03-20  765  			    "inode unlinked but has dirent\n%s",
758ea4ff812b4df Kent Overstreet 2025-03-20  766  			    (printbuf_reset(&buf),
758ea4ff812b4df Kent Overstreet 2025-03-20  767  			     bch2_bkey_val_to_text(&buf, c, d.s_c),
758ea4ff812b4df Kent Overstreet 2025-03-20  768  			     prt_printf(&buf, "\n"),
758ea4ff812b4df Kent Overstreet 2025-03-20  769  			     bch2_inode_unpacked_to_text(&buf, target),
758ea4ff812b4df Kent Overstreet 2025-03-20  770  			     buf.buf));
758ea4ff812b4df Kent Overstreet 2025-03-20  771  
758ea4ff812b4df Kent Overstreet 2025-03-20  772  		target->bi_flags &= ~BCH_INODE_unlinked;
758ea4ff812b4df Kent Overstreet 2025-03-20  773  		target->bi_dir		= d.k->p.inode;
758ea4ff812b4df Kent Overstreet 2025-03-20  774  		target->bi_dir_offset	= d.k->p.offset;
758ea4ff812b4df Kent Overstreet 2025-03-20  775  		return __bch2_fsck_write_inode(trans, target);
758ea4ff812b4df Kent Overstreet 2025-03-20  776  	}
758ea4ff812b4df Kent Overstreet 2025-03-20  777  
0bb43b0a96be30c Kent Overstreet 2025-07-31  778  	CLASS(btree_iter, bp_iter)(trans, BTREE_ID_dirents,
0bb43b0a96be30c Kent Overstreet 2025-07-31  779  			      SPOS(target->bi_dir, target->bi_dir_offset, target->bi_snapshot), 0);
0bb43b0a96be30c Kent Overstreet 2025-07-31  780  	struct bkey_s_c_dirent bp_dirent = bch2_bkey_get_typed(&bp_iter, dirent);
758ea4ff812b4df Kent Overstreet 2025-03-20  781  	ret = bkey_err(bp_dirent);
758ea4ff812b4df Kent Overstreet 2025-03-20  782  	if (ret && !bch2_err_matches(ret, ENOENT))
758ea4ff812b4df Kent Overstreet 2025-03-20  783  		goto err;
758ea4ff812b4df Kent Overstreet 2025-03-20  784  
758ea4ff812b4df Kent Overstreet 2025-03-20  785  	bool backpointer_exists = !ret;
758ea4ff812b4df Kent Overstreet 2025-03-20  786  	ret = 0;
758ea4ff812b4df Kent Overstreet 2025-03-20  787  
9b0d00a3693bbab Kent Overstreet 2025-03-20  788  	if (!backpointer_exists) {
9b0d00a3693bbab Kent Overstreet 2025-03-20  789  		if (fsck_err(trans, inode_wrong_backpointer,
758ea4ff812b4df Kent Overstreet 2025-03-20  790  			     "inode %llu:%u has wrong backpointer:\n"
758ea4ff812b4df Kent Overstreet 2025-03-20  791  			     "got       %llu:%llu\n"
758ea4ff812b4df Kent Overstreet 2025-03-20  792  			     "should be %llu:%llu",
758ea4ff812b4df Kent Overstreet 2025-03-20  793  			     target->bi_inum, target->bi_snapshot,
758ea4ff812b4df Kent Overstreet 2025-03-20  794  			     target->bi_dir,
758ea4ff812b4df Kent Overstreet 2025-03-20  795  			     target->bi_dir_offset,
758ea4ff812b4df Kent Overstreet 2025-03-20  796  			     d.k->p.inode,
758ea4ff812b4df Kent Overstreet 2025-03-20  797  			     d.k->p.offset)) {
758ea4ff812b4df Kent Overstreet 2025-03-20  798  			target->bi_dir		= d.k->p.inode;
758ea4ff812b4df Kent Overstreet 2025-03-20  799  			target->bi_dir_offset	= d.k->p.offset;
758ea4ff812b4df Kent Overstreet 2025-03-20  800  			ret = __bch2_fsck_write_inode(trans, target);
758ea4ff812b4df Kent Overstreet 2025-03-20  801  		}
9b0d00a3693bbab Kent Overstreet 2025-03-20  802  	} else {
66621f016d79215 Kent Overstreet 2025-05-29  803  		printbuf_reset(&buf);
758ea4ff812b4df Kent Overstreet 2025-03-20  804  		bch2_bkey_val_to_text(&buf, c, d.s_c);
758ea4ff812b4df Kent Overstreet 2025-03-20  805  		prt_newline(&buf);
758ea4ff812b4df Kent Overstreet 2025-03-20  806  		bch2_bkey_val_to_text(&buf, c, bp_dirent.s_c);
758ea4ff812b4df Kent Overstreet 2025-03-20  807  
9b0d00a3693bbab Kent Overstreet 2025-03-20  808  		if (S_ISDIR(target->bi_mode) || target->bi_subvol) {
9b0d00a3693bbab Kent Overstreet 2025-03-20  809  			/*
9b0d00a3693bbab Kent Overstreet 2025-03-20  810  			 * XXX: verify connectivity of the other dirent
9b0d00a3693bbab Kent Overstreet 2025-03-20  811  			 * up to the root before removing this one
9b0d00a3693bbab Kent Overstreet 2025-03-20  812  			 *
9b0d00a3693bbab Kent Overstreet 2025-03-20  813  			 * Additionally, bch2_lookup would need to cope with the
9b0d00a3693bbab Kent Overstreet 2025-03-20  814  			 * dirent it found being removed - or should we remove
9b0d00a3693bbab Kent Overstreet 2025-03-20  815  			 * the other one, even though the inode points to it?
9b0d00a3693bbab Kent Overstreet 2025-03-20  816  			 */
9b0d00a3693bbab Kent Overstreet 2025-03-20  817  			if (in_fsck) {
9b0d00a3693bbab Kent Overstreet 2025-03-20  818  				if (fsck_err(trans, inode_dir_multiple_links,
758ea4ff812b4df Kent Overstreet 2025-03-20  819  					     "%s %llu:%u with multiple links\n%s",
758ea4ff812b4df Kent Overstreet 2025-03-20  820  					     S_ISDIR(target->bi_mode) ? "directory" : "subvolume",
9b0d00a3693bbab Kent Overstreet 2025-03-20  821  					     target->bi_inum, target->bi_snapshot, buf.buf))
758ea4ff812b4df Kent Overstreet 2025-03-20  822  					ret = bch2_fsck_remove_dirent(trans, d.k->p);
9b0d00a3693bbab Kent Overstreet 2025-03-20  823  			} else {
9b0d00a3693bbab Kent Overstreet 2025-03-20  824  				bch2_fs_inconsistent(c,
9b0d00a3693bbab Kent Overstreet 2025-03-20  825  						"%s %llu:%u with multiple links\n%s",
9b0d00a3693bbab Kent Overstreet 2025-03-20  826  						S_ISDIR(target->bi_mode) ? "directory" : "subvolume",
9b0d00a3693bbab Kent Overstreet 2025-03-20  827  						target->bi_inum, target->bi_snapshot, buf.buf);
758ea4ff812b4df Kent Overstreet 2025-03-20  828  			}
9b0d00a3693bbab Kent Overstreet 2025-03-20  829  		} else {
758ea4ff812b4df Kent Overstreet 2025-03-20  830  			/*
758ea4ff812b4df Kent Overstreet 2025-03-20  831  			 * hardlinked file with nlink 0:
758ea4ff812b4df Kent Overstreet 2025-03-20  832  			 * We're just adjusting nlink here so check_nlinks() will pick
758ea4ff812b4df Kent Overstreet 2025-03-20  833  			 * it up, it ignores inodes with nlink 0
758ea4ff812b4df Kent Overstreet 2025-03-20  834  			 */
9b0d00a3693bbab Kent Overstreet 2025-03-20  835  			if (fsck_err_on(!target->bi_nlink,
758ea4ff812b4df Kent Overstreet 2025-03-20  836  					trans, inode_multiple_links_but_nlink_0,
758ea4ff812b4df Kent Overstreet 2025-03-20  837  					"inode %llu:%u type %s has multiple links but i_nlink 0\n%s",
758ea4ff812b4df Kent Overstreet 2025-03-20  838  					target->bi_inum, target->bi_snapshot, bch2_d_types[d.v->d_type], buf.buf)) {
758ea4ff812b4df Kent Overstreet 2025-03-20  839  				target->bi_nlink++;
758ea4ff812b4df Kent Overstreet 2025-03-20  840  				target->bi_flags &= ~BCH_INODE_unlinked;
758ea4ff812b4df Kent Overstreet 2025-03-20  841  				ret = __bch2_fsck_write_inode(trans, target);
758ea4ff812b4df Kent Overstreet 2025-03-20  842  			}
9b0d00a3693bbab Kent Overstreet 2025-03-20  843  		}
9b0d00a3693bbab Kent Overstreet 2025-03-20  844  	}
758ea4ff812b4df Kent Overstreet 2025-03-20  845  err:
758ea4ff812b4df Kent Overstreet 2025-03-20  846  fsck_err:
758ea4ff812b4df Kent Overstreet 2025-03-20  847  	bch_err_fn(c, ret);
758ea4ff812b4df Kent Overstreet 2025-03-20  848  	return ret;
758ea4ff812b4df Kent Overstreet 2025-03-20  849  }
758ea4ff812b4df Kent Overstreet 2025-03-20  850  

:::::: The code at line 763 was first introduced by commit
:::::: 758ea4ff812b4dfd4cef6dba0eb4b0025a7b147e bcachefs: Move bch2_check_dirent_target() to namei.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
