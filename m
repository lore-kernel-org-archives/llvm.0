Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368905387;
	Fri,  3 Mar 2023 15:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677855618; x=1709391618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1MUTRrGDXqO6HrPonqv7BZ9A54G8mcyVIPgQ+umB+pM=;
  b=Fqrtd0xmB469TAfgq9qujQuybFGFlapdaWgb0JKO5La1AfOgWTrTyUlf
   Sz1LGXsEzcvRPFBdN/p+GrYsrjXdqbQ3XX7ILS0ssLNZdzy2U3uRIf4vt
   A9uO4hqw3x8GUwNfYdKz89r9QwqzSk1iyU6hIwQc5BV/9xfwkV9GCgqL3
   w5cF6QuAjG4ujjQ04/s1QogFRhKUzaZw4m1MAEkkIN3GBVIG6TMtrqnY4
   nRcRmXvcqPZe0QuDOifMC2q1Iazao2C4neklE9IM6erM6VnRTTKEZ20og
   lL7JYr/7CzGmJWGi/7PTa27CYflX3SIY2q0TJNXd41WEv3BkH+POn0PSL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="332539967"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="332539967"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 07:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="921142118"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="921142118"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Mar 2023 07:00:16 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY6tL-0001UD-2g;
	Fri, 03 Mar 2023 15:00:15 +0000
Date: Fri, 3 Mar 2023 22:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Naohiro Aota <naohiro.aota@wdc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] btrfs: zoned: count fresh BG region as zone
 unusable
Message-ID: <202303032228.io27sUWW-lkp@intel.com>
References: <ae5d21d50546abaedd89d52cefdd1c61c9018ec2.1677831912.git.naohiro.aota@wdc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae5d21d50546abaedd89d52cefdd1c61c9018ec2.1677831912.git.naohiro.aota@wdc.com>

Hi Naohiro,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.2 next-20230303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Naohiro-Aota/btrfs-zoned-count-fresh-BG-region-as-zone-unusable/20230303-163006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/ae5d21d50546abaedd89d52cefdd1c61c9018ec2.1677831912.git.naohiro.aota%40wdc.com
patch subject: [RFC PATCH 1/2] btrfs: zoned: count fresh BG region as zone unusable
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230303/202303032228.io27sUWW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aef11808b70bc7a53270e26eef4c73ae8a1de4a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Naohiro-Aota/btrfs-zoned-count-fresh-BG-region-as-zone-unusable/20230303-163006
        git checkout aef11808b70bc7a53270e26eef4c73ae8a1de4a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303032228.io27sUWW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/free-space-cache.c:2700:13: error: use of undeclared identifier 'BTRFS_FS_ACTIVE_ZONE_TRACKING'
                    test_bit(BTRFS_FS_ACTIVE_ZONE_TRACKING, &block_group->fs_info->flags) &&
                             ^
>> fs/btrfs/free-space-cache.c:2700:13: error: use of undeclared identifier 'BTRFS_FS_ACTIVE_ZONE_TRACKING'
>> fs/btrfs/free-space-cache.c:2700:13: error: use of undeclared identifier 'BTRFS_FS_ACTIVE_ZONE_TRACKING'
   3 errors generated.
--
>> fs/btrfs/zoned.c:1586:15: error: use of undeclared identifier 'BTRFS_FS_ACTIVE_ZONE_TRACKING'
           if (test_bit(BTRFS_FS_ACTIVE_ZONE_TRACKING, &cache->fs_info->flags) &&
                        ^
>> fs/btrfs/zoned.c:1586:15: error: use of undeclared identifier 'BTRFS_FS_ACTIVE_ZONE_TRACKING'
>> fs/btrfs/zoned.c:1586:15: error: use of undeclared identifier 'BTRFS_FS_ACTIVE_ZONE_TRACKING'
   3 errors generated.


vim +/BTRFS_FS_ACTIVE_ZONE_TRACKING +2700 fs/btrfs/free-space-cache.c

  2678	
  2679	static int __btrfs_add_free_space_zoned(struct btrfs_block_group *block_group,
  2680						u64 bytenr, u64 size, bool used)
  2681	{
  2682		struct btrfs_space_info *sinfo = block_group->space_info;
  2683		struct btrfs_free_space_ctl *ctl = block_group->free_space_ctl;
  2684		u64 offset = bytenr - block_group->start;
  2685		u64 to_free, to_unusable;
  2686		int bg_reclaim_threshold = 0;
  2687		bool initial = (size == block_group->length);
  2688		u64 reclaimable_unusable;
  2689	
  2690		WARN_ON(!initial && offset + size > block_group->zone_capacity);
  2691	
  2692		if (!initial)
  2693			bg_reclaim_threshold = READ_ONCE(sinfo->bg_reclaim_threshold);
  2694	
  2695		spin_lock(&ctl->tree_lock);
  2696		/* Count initial region as zone_unusable until it gets activated. */
  2697		if (!used)
  2698			to_free = size;
  2699		else if (initial &&
> 2700			 test_bit(BTRFS_FS_ACTIVE_ZONE_TRACKING, &block_group->fs_info->flags) &&
  2701			 block_group->flags & (BTRFS_BLOCK_GROUP_METADATA | BTRFS_BLOCK_GROUP_SYSTEM))
  2702			to_free = 0;
  2703		else if (initial)
  2704			to_free = block_group->zone_capacity;
  2705		else if (offset >= block_group->alloc_offset)
  2706			to_free = size;
  2707		else if (offset + size <= block_group->alloc_offset)
  2708			to_free = 0;
  2709		else
  2710			to_free = offset + size - block_group->alloc_offset;
  2711		to_unusable = size - to_free;
  2712	
  2713		ctl->free_space += to_free;
  2714		/*
  2715		 * If the block group is read-only, we should account freed space into
  2716		 * bytes_readonly.
  2717		 */
  2718		if (!block_group->ro)
  2719			block_group->zone_unusable += to_unusable;
  2720		spin_unlock(&ctl->tree_lock);
  2721		if (!used) {
  2722			spin_lock(&block_group->lock);
  2723			block_group->alloc_offset -= size;
  2724			spin_unlock(&block_group->lock);
  2725		}
  2726	
  2727		reclaimable_unusable = block_group->zone_unusable -
  2728				       (block_group->length - block_group->zone_capacity);
  2729		/* All the region is now unusable. Mark it as unused and reclaim */
  2730		if (block_group->zone_unusable == block_group->length &&
  2731		    block_group->alloc_offset) {
  2732			btrfs_mark_bg_unused(block_group);
  2733		} else if (bg_reclaim_threshold &&
  2734			   reclaimable_unusable >=
  2735			   mult_perc(block_group->zone_capacity, bg_reclaim_threshold)) {
  2736			btrfs_mark_bg_to_reclaim(block_group);
  2737		}
  2738	
  2739		return 0;
  2740	}
  2741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
