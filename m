Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F453A3E98;
	Tue,  7 Apr 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558367; cv=none; b=agBOjGOeyB/q4YEQsoTWGlTrLXqmWm9Q8iqRMEICc0NDR6yX2iOVq23jz4nK1AmlI7oCdvipn+nu+HBwVH5O4MiQj4gPGeEEDQRGeDEewIm9ehGool7f3TP1hkXjzA80rPEF7TWLWptZ7lm6nsuWKQANkBOjYtcvzvil+MWHEAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558367; c=relaxed/simple;
	bh=SruMI2y79sLlPodtF2vCeK6b3gWjempRR3i3UjXYjDQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i6+/c4ZzZVOFmspXyrXfwq1LQ/UiF2imzpvKcQlpUhI2x4thDA164fWEngl9IzlhWNR/p9lAWvuac6s3K+wjs+s58KsCsQ7yMYY9ct4V/Nq9GCv0XbcPg084qD1cEa/D0nEVWDuwBwr1O+gQq1KrWvQr4Z486Rf5H+wJYEopGsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anjBdjLV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anjBdjLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775558365; x=1807094365;
  h=date:from:to:cc:subject:message-id;
  bh=SruMI2y79sLlPodtF2vCeK6b3gWjempRR3i3UjXYjDQ=;
  b=anjBdjLVOHxAnAIfeMOupC6ulrgvl1xQJ2m6taTIF0U+SeQXopwS4BLP
   zx6uShypIfiuEuWSrN9pVrXJnzlYcd62tSjtkVVh2eRaF9gUh5wkzeGHN
   RMqqPxPtMvlSfG5ebF5yZVGt61SDmhSOGX4RWVfUeu8zbzuWcGMA1iqVf
   5tb6Ucp085QFrj5favgM4l2BF3dX8UXrCyJ3CzQyVFIJalSthSNQVN05l
   IcC7zziwBwFsrwHF4TDGukb7lSpkfKfmdYXI46rTHoD0DHt4uj3gjZqL2
   SmWCTl0myW4Hl/RicEF9gJ+k8Od9zYoytM/IWWIwi9/KHxYwHk33JzWOG
   A==;
X-CSE-ConnectionGUID: zGMEQLzoQ8aV8vIOQ6EjGw==
X-CSE-MsgGUID: Kt1cPYfsQoyQLcE1ykE27Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="94098379"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="94098379"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 03:39:25 -0700
X-CSE-ConnectionGUID: ReGKmIR9Qw+hcI2lLMcPZg==
X-CSE-MsgGUID: tGHm5FQfT96kjdN/H/DECg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228405595"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Apr 2026 03:39:22 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA3q4-000000000Tt-0AK4;
	Tue, 07 Apr 2026 10:39:20 +0000
Date: Tue, 07 Apr 2026 18:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 44/51] fs/rpdfs/block.c:978:2:
 error: use of undeclared identifier 'u128'
Message-ID: <202604071828.OZaTFess-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   9a0627207ad856d2a5eb09f3458afb1e34ac10a3
commit: cd9dddd9348e8c1bbbdedf8547a6c42b73b03f82 [44/51] rpdfs: serialize write handles and flushing
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260407/202604071828.OZaTFess-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260407/202604071828.OZaTFess-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071828.OZaTFess-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/rpdfs/block.c:10:
   In file included from fs/rpdfs/balloc.h:10:
   In file included from fs/rpdfs/txn.h:7:
   In file included from fs/rpdfs/block.h:8:
   fs/rpdfs/place.h:17:15: error: unknown type name 'u128'
      17 | static inline u128 rpdfs_place_full(u8 type, u64 ino, u8 depth, u64 off)
         |               ^
   fs/rpdfs/place.h:19:11: error: use of undeclared identifier 'u128'
      19 |         return ((u128)rpdfs_place_hi(type, ino, depth) << 64) | off;
         |                  ^
   fs/rpdfs/place.h:32:65: error: unknown type name 'u128'
      32 | static inline void rpdfs_place_split_le(__le64 *lo, __le64 *hi, u128 full)
         |                                                                 ^
   fs/rpdfs/place.h:38:15: error: unknown type name 'u128'
      38 | static inline u128 rpdfs_place_combine_le(__le64 lo, __le64 hi)
         |               ^
   fs/rpdfs/place.h:40:11: error: use of undeclared identifier 'u128'
      40 |         return ((u128)le64_to_cpu(hi) << 64) | le64_to_cpu(lo);
         |                  ^
   In file included from fs/rpdfs/block.c:10:
   In file included from fs/rpdfs/balloc.h:10:
   In file included from fs/rpdfs/txn.h:7:
   fs/rpdfs/block.h:79:2: error: unknown type name 'u128'
      79 |         u128 place;
         |         ^
>> fs/rpdfs/block.c:978:2: error: use of undeclared identifier 'u128'
     978 |         u128 place;
         |         ^
>> fs/rpdfs/block.c:982:3: error: use of undeclared identifier 'place'
     982 |                 place = bk->hnd.place;
         |                 ^
   fs/rpdfs/block.c:984:3: error: use of undeclared identifier 'place'
     984 |                 place = 0;
         |                 ^
   fs/rpdfs/block.c:991:28: error: use of undeclared identifier 'place'
     991 |                         BUG_ON(bk->hnd.place == place);
         |                                                 ^
   fs/rpdfs/block.c:992:30: error: use of undeclared identifier 'place'
     992 |                         ordered = bk->hnd.place > place;
         |                                                   ^
   fs/rpdfs/block.c:1001:5: error: use of undeclared identifier 'place'
    1001 |                                 place = bk->hnd.place;
         |                                 ^
   fs/rpdfs/block.c:1012:24: error: use of undeclared identifier 'place'
    1012 |                         if (bk->hnd.place < place)
         |                                             ^
   13 errors generated.


vim +/u128 +978 fs/rpdfs/block.c

   957	
   958	/*
   959	 * Walk the clear list and set write on each block as long as they're
   960	 * sorted by place.
   961	 *
   962	 * If we hit a block in the clear list that isn't sorted by place then
   963	 * we unwind all the blocks in the set list greater than the out of
   964	 * order block.  The caller will sort the clear list and try again.
   965	 *
   966	 * As we set write we also see if we need to extend the boundary to
   967	 * cover more dependent blocks.  As the caller retries they also check
   968	 * their boundary against the dirty list.
   969	 */
   970	static bool set_write_in_order(struct list_head *set_list, struct list_head *clear_list,
   971				       struct rpdfs_dist_write *wri, struct rpdfs_dirty_boundary *bnd)
   972	{
   973		struct rpdfs_block *bk;
   974		struct rpdfs_block *_bk_;
   975		bool ordered = true;
   976		bool extended = false;
   977		bool writer;
 > 978		u128 place;
   979	
   980		if (!list_empty(set_list)) {
   981			bk = list_last_entry(set_list, struct rpdfs_block, dirty_head);
 > 982			place = bk->hnd.place;
   983		} else {
   984			place = 0;
   985		}
   986	
   987		list_for_each_entry_safe(bk, _bk_, clear_list, dirty_head) {
   988			do {
   989				write_seqlock(&bk->seqlock);
   990				/* would be.. corruption error? but we don't have io errors wired up */
   991				BUG_ON(bk->hnd.place == place);
   992				ordered = bk->hnd.place > place;
   993				writer = bk->writer;
   994				if (ordered && !writer) {
   995					bk->wri = wri;
   996					extended |= extend_boundary(bnd, &bk->dirty_bnd);
   997					list_move_tail(&bk->dirty_head, set_list);
   998				}
   999				/* save for unwinding or for continuing ordered test */
  1000				if (!ordered || !writer)
  1001					place = bk->hnd.place;
  1002				write_sequnlock(&bk->seqlock);
  1003				if (ordered && writer)
  1004					wait_event(bk->waitq, !block_has_writer(bk));
  1005			} while (ordered && writer);
  1006			if (!ordered)
  1007				break;
  1008		}
  1009	
  1010		if (!ordered) {
  1011			list_for_each_entry_safe_reverse(bk, _bk_, set_list, dirty_head) {
  1012				if (bk->hnd.place < place)
  1013					break;
  1014				write_seqlock(&bk->seqlock);
  1015				bk->wri = NULL;
  1016				list_move(&bk->dirty_head, clear_list);
  1017				write_sequnlock(&bk->seqlock);
  1018				wake_up_all(&bk->waitq);
  1019			}
  1020		}
  1021	
  1022		return extended || !ordered;
  1023	}
  1024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
