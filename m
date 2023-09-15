Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A811C8D;
	Fri, 15 Sep 2023 16:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694794124; x=1726330124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBcnDpv1Q/x5SiyaP+3OUxHd/F4czCm9XSC3VZ3iVFI=;
  b=erFHwYJJcUacAV4t+R8H9kjCpgPgNuc8yLVxDCy/iWE9dt5033dCwy7V
   CKR3+wCtTk0dKsYc1IZhYJ6tWjcqxZD+uddHj+lLnrisG9evUV4WH08HS
   pcAdOjuww84WI1yzQPJdZwvK6CvMnlVwUI1TEiNHDnpLOud/dmsG6Nc61
   uEQmeIydLMY+tJJCfHUItOL995UeZW5TT9byPVqlgfxOyWfSeAMb41ZTF
   n6pxvF1Hnb/iIIhCRzp5+xIK1z958+2pibdf460c6hfLluqkBmjD/7mw1
   pRWer847HbmIZVa/pvmk5WiV95XudTc1jLV4MNMuXtnWofp5odTQvSEI6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369598216"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="369598216"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 09:08:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="835258222"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="835258222"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2023 09:08:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhBMd-0003AN-2m;
	Fri, 15 Sep 2023 16:08:15 +0000
Date: Sat, 16 Sep 2023 00:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3785/5666] fs/bcachefs/btree_key_cache.c:113:7:
 warning: result of comparison of constant 9223372036854775807 with
 expression of type 'u32' (aka 'unsigned int') is always true
Message-ID: <202309160053.sFDnNiu4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dfa449a58323de195773cf928d99db4130702bf7
commit: 85f806bc565e84adee272fe250c99ce94215ddf5 [3785/5666] bcachefs: Btree key cache shrinker fix
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230916/202309160053.sFDnNiu4-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160053.sFDnNiu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160053.sFDnNiu4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_key_cache.c:4:
   fs/bcachefs/btree_iter.h:220:8: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
   static inline int btree_trans_restart_nounlock(struct btree_trans *trans, int err)
          ^
   include/linux/compiler_types.h:215:16: note: expanded from macro 'inline'
   #define inline inline __gnu_inline __inline_maybe_unused notrace
                  ^
   In file included from fs/bcachefs/btree_key_cache.c:4:
   fs/bcachefs/btree_iter.h:230:8: warning: duplicate 'inline' declaration specifier [-Wduplicate-decl-specifier]
   static inline int btree_trans_restart(struct btree_trans *trans, int err)
          ^
   include/linux/compiler_types.h:215:16: note: expanded from macro 'inline'
   #define inline inline __gnu_inline __inline_maybe_unused notrace
                  ^
   In file included from fs/bcachefs/btree_key_cache.c:6:
   fs/bcachefs/btree_locking.h:88:46: warning: implicit conversion from enumeration type 'enum six_lock_type' to different enumeration type 'enum btree_node_locked_type' [-Wenum-conversion]
           mark_btree_node_locked_noreset(path, level, type);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~              ^~~~
   fs/bcachefs/btree_locking.h:175:51: warning: implicit conversion from enumeration type 'enum six_lock_type' to different enumeration type 'enum btree_node_locked_type' [-Wenum-conversion]
           mark_btree_node_locked_noreset(path, b->c.level, SIX_LOCK_intent);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                   ^~~~~~~~~~~~~~~
   fs/bcachefs/btree_locking.h:239:33: warning: implicit conversion from enumeration type 'enum btree_node_locked_type' to different enumeration type 'enum six_lock_type' [-Wenum-conversion]
                           six_lock_increment(&b->lock, want);
                           ~~~~~~~~~~~~~~~~~~           ^~~~
   fs/bcachefs/btree_locking.h:259:49: warning: implicit conversion from enumeration type 'enum six_lock_type' to different enumeration type 'enum btree_node_locked_type' [-Wenum-conversion]
               btree_node_lock_increment(trans, b, level, type) ||
               ~~~~~~~~~~~~~~~~~~~~~~~~~                  ^~~~
   fs/bcachefs/btree_locking.h:286:49: warning: implicit conversion from enumeration type 'enum six_lock_type' to different enumeration type 'enum btree_node_locked_type' [-Wenum-conversion]
           mark_btree_node_locked_noreset(path, b->level, SIX_LOCK_write);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                 ^~~~~~~~~~~~~~
>> fs/bcachefs/btree_key_cache.c:113:7: warning: result of comparison of constant 9223372036854775807 with expression of type 'u32' (aka 'unsigned int') is always true [-Wtautological-constant-out-of-range-compare]
                   if (ULONG_CMP_GE(ck->btree_trans_barrier_seq,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:35:43: note: expanded from macro 'ULONG_CMP_GE'
   #define ULONG_CMP_GE(a, b)      (ULONG_MAX / 2 >= (a) - (b))
                                    ~~~~~~~~~~~~~ ^  ~~~~~~~~~
   8 warnings generated.


vim +113 fs/bcachefs/btree_key_cache.c

   105	
   106	#ifdef __KERNEL__
   107	static void __bkey_cached_move_to_freelist_ordered(struct btree_key_cache *bc,
   108							   struct bkey_cached *ck)
   109	{
   110		struct bkey_cached *pos;
   111	
   112		list_for_each_entry_reverse(pos, &bc->freed_nonpcpu, list) {
 > 113			if (ULONG_CMP_GE(ck->btree_trans_barrier_seq,
   114					 pos->btree_trans_barrier_seq)) {
   115				list_move(&ck->list, &pos->list);
   116				return;
   117			}
   118		}
   119	
   120		list_move(&ck->list, &bc->freed_nonpcpu);
   121	}
   122	#endif
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
