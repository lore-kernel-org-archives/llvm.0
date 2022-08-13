Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BAE658
	for <llvm@lists.linux.dev>; Sat, 13 Aug 2022 06:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660371373; x=1691907373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sWPiV10pI/qtun318a2RsAob94gupYxoBLNej+IO/5s=;
  b=BJ69E5LtZwh8RVTCWV/MQVbfR9TJnXpiEI7n+OtUQeo0J273oHx8zEwd
   n1rVlJKmkJ79WmkJckmDZAwpf+7Lray9FXQfwEefGhaBYFhRI7P+knD90
   L1EQxlpQ7TzMQLfbqr8FuZt1VH+q6LxqpBzSrrW2fEgXelkyp0ZoPtjAx
   l/fZttx3d2cGA5JuRa400/QCPKdVZWg3aAzun7F25S2mgAPk/lrJrctn3
   pChuoXZTsAaMjR0V9qyNjUblMyTXllokj4wvx0gQb5k+rn+GbDdhg60n+
   bKrcHCtZ3K5VE7zsDyvPnVZP8Lr/24HY3q6HowuWKGjfNc+N7bnKN429W
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="274787142"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="274787142"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 23:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="609461277"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2022 23:16:10 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMkRN-0001NY-23;
	Sat, 13 Aug 2022 06:16:09 +0000
Date: Sat, 13 Aug 2022 14:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ioannis Angelakopoulos <iangelak@fb.com>, linux-btrfs@vger.kernel.org,
	kernel-team@fb.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 1/1] btrfs: Annotate the reservation space wait event
 with lockdep
Message-ID: <202208131436.QpHxeBKQ-lkp@intel.com>
References: <20220812181754.1535281-2-iangelak@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812181754.1535281-2-iangelak@fb.com>

Hi Ioannis,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on next-20220812]
[cannot apply to linus/master v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ioannis-Angelakopoulos/btrfs-Add-a-lockdep-annotation-for-the-reservation-space-wait-event/20220813-022105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220813/202208131436.QpHxeBKQ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 3329cec2f79185bafd678f310fafadba2a8c76d2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/70919e3504790a947de789ed2298275d25770f83
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ioannis-Angelakopoulos/btrfs-Add-a-lockdep-annotation-for-the-reservation-space-wait-event/20220813-022105
        git checkout 70919e3504790a947de789ed2298275d25770f83
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/btrfs/space-info.c:701:3: error: call to undeclared function 'btrfs_lockdep_acquire_nested'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
                   ^
>> fs/btrfs/space-info.c:701:41: error: use of undeclared identifier 'btrfs_reservation_space'
                   btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
                                                         ^
   fs/btrfs/space-info.c:712:41: error: use of undeclared identifier 'btrfs_reservation_space'
                   btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
                                                         ^
   fs/btrfs/space-info.c:725:41: error: use of undeclared identifier 'btrfs_reservation_space'
                   btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
                                                         ^
   fs/btrfs/space-info.c:754:41: error: use of undeclared identifier 'btrfs_reservation_space'
                   btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
                                                         ^
   fs/btrfs/space-info.c:788:41: error: use of undeclared identifier 'btrfs_reservation_space'
                   btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
                                                         ^
>> fs/btrfs/space-info.c:1462:3: error: call to undeclared function 'btrfs_might_wait_for_event_nested'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   btrfs_might_wait_for_event_nested(fs_info, btrfs_reservation_space,
                   ^
   fs/btrfs/space-info.c:1462:46: error: use of undeclared identifier 'btrfs_reservation_space'
                   btrfs_might_wait_for_event_nested(fs_info, btrfs_reservation_space,
                                                              ^
   8 errors generated.


vim +/btrfs_lockdep_acquire_nested +701 fs/btrfs/space-info.c

   673	
   674	/*
   675	 * Try to flush some data based on policy set by @state. This is only advisory
   676	 * and may fail for various reasons. The caller is supposed to examine the
   677	 * state of @space_info to detect the outcome.
   678	 */
   679	static void flush_space(struct btrfs_fs_info *fs_info,
   680			       struct btrfs_space_info *space_info, u64 num_bytes,
   681			       enum btrfs_flush_state state, bool for_preempt)
   682	{
   683		struct btrfs_root *root = fs_info->tree_root;
   684		struct btrfs_trans_handle *trans;
   685		int nr;
   686		int ret = 0;
   687	
   688		switch (state) {
   689		case FLUSH_DELAYED_ITEMS_NR:
   690		case FLUSH_DELAYED_ITEMS:
   691			if (state == FLUSH_DELAYED_ITEMS_NR)
   692				nr = calc_reclaim_items_nr(fs_info, num_bytes) * 2;
   693			else
   694				nr = -1;
   695	
   696			trans = btrfs_join_transaction(root);
   697			if (IS_ERR(trans)) {
   698				ret = PTR_ERR(trans);
   699				break;
   700			}
 > 701			btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
   702						     BTRFS_LOCKDEP_FLUSH_DELAYED_ITEMS);
   703			ret = btrfs_run_delayed_items_nr(trans, nr);
   704			btrfs_lockdep_release(fs_info, btrfs_reservation_space);
   705			btrfs_end_transaction(trans);
   706			break;
   707		case FLUSH_DELALLOC:
   708		case FLUSH_DELALLOC_WAIT:
   709		case FLUSH_DELALLOC_FULL:
   710			if (state == FLUSH_DELALLOC_FULL)
   711				num_bytes = U64_MAX;
   712			btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
   713						     BTRFS_LOCKDEP_FLUSH_DELALLOC_FULL);
   714			shrink_delalloc(fs_info, space_info, num_bytes,
   715					state != FLUSH_DELALLOC, for_preempt);
   716			btrfs_lockdep_release(fs_info, btrfs_reservation_space);
   717			break;
   718		case FLUSH_DELAYED_REFS_NR:
   719		case FLUSH_DELAYED_REFS:
   720			trans = btrfs_join_transaction(root);
   721			if (IS_ERR(trans)) {
   722				ret = PTR_ERR(trans);
   723				break;
   724			}
 > 725			btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
   726						     BTRFS_LOCKDEP_FLUSH_DELAYED_REFS);
   727			if (state == FLUSH_DELAYED_REFS_NR)
   728				nr = calc_reclaim_items_nr(fs_info, num_bytes);
   729			else
   730				nr = 0;
   731			btrfs_run_delayed_refs(trans, nr);
   732			btrfs_lockdep_release(fs_info, btrfs_reservation_space);
   733			btrfs_end_transaction(trans);
   734			break;
   735		case ALLOC_CHUNK:
   736		case ALLOC_CHUNK_FORCE:
   737			/*
   738			 * For metadata space on zoned filesystem, reaching here means we
   739			 * don't have enough space left in active_total_bytes. Try to
   740			 * activate a block group first, because we may have inactive
   741			 * block group already allocated.
   742			 */
   743			ret = btrfs_zoned_activate_one_bg(fs_info, space_info, false);
   744			if (ret < 0)
   745				break;
   746			else if (ret == 1)
   747				break;
   748	
   749			trans = btrfs_join_transaction(root);
   750			if (IS_ERR(trans)) {
   751				ret = PTR_ERR(trans);
   752				break;
   753			}
   754			btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
   755						     BTRFS_LOCKDEP_ALLOC_CHUNK_FORCE);
   756			ret = btrfs_chunk_alloc(trans,
   757					btrfs_get_alloc_profile(fs_info, space_info->flags),
   758					(state == ALLOC_CHUNK) ? CHUNK_ALLOC_NO_FORCE :
   759						CHUNK_ALLOC_FORCE);
   760			btrfs_lockdep_release(fs_info, btrfs_reservation_space);
   761			btrfs_end_transaction(trans);
   762	
   763			/*
   764			 * For metadata space on zoned filesystem, allocating a new chunk
   765			 * is not enough. We still need to activate the block * group.
   766			 * Active the newly allocated block group by (maybe) finishing
   767			 * a block group.
   768			 */
   769			if (ret == 1) {
   770				ret = btrfs_zoned_activate_one_bg(fs_info, space_info, true);
   771				/*
   772				 * Revert to the original ret regardless we could finish
   773				 * one block group or not.
   774				 */
   775				if (ret >= 0)
   776					ret = 1;
   777			}
   778	
   779			if (ret > 0 || ret == -ENOSPC)
   780				ret = 0;
   781			break;
   782		case RUN_DELAYED_IPUTS:
   783			/*
   784			 * If we have pending delayed iputs then we could free up a
   785			 * bunch of pinned space, so make sure we run the iputs before
   786			 * we do our pinned bytes check below.
   787			 */
   788			btrfs_lockdep_acquire_nested(fs_info, btrfs_reservation_space,
   789						     BTRFS_LOCKDEP_RUN_DELAYED_IPUTS);
   790			btrfs_run_delayed_iputs(fs_info);
   791			btrfs_wait_on_delayed_iputs(fs_info);
   792			btrfs_lockdep_release(fs_info, btrfs_reservation_space);
   793			break;
   794		case COMMIT_TRANS:
   795			ASSERT(current->journal_info == NULL);
   796			trans = btrfs_join_transaction(root);
   797			if (IS_ERR(trans)) {
   798				ret = PTR_ERR(trans);
   799				break;
   800			}
   801			ret = btrfs_commit_transaction(trans);
   802			break;
   803		default:
   804			ret = -ENOSPC;
   805			break;
   806		}
   807	
   808		trace_btrfs_flush_space(fs_info, space_info->flags, num_bytes, state,
   809					ret, for_preempt);
   810		return;
   811	}
   812	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
