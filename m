Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925B646AA;
	Fri,  3 Mar 2023 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677853157; x=1709389157;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5SIRbFmbtsxb0QIHUFoEk1mA+UZ+Qg9F7I1FTRRPknY=;
  b=k3hN2/ZoaXJ0kHzkVh8ZRmU2nhoh/bnEMoM7lKD44JLKK+Vv2wHz892R
   6bt126d4EQ2Nkascq5Rb7TtR1g8FCRYPOywzUUN0+Wkzk2I8AifGufrzn
   untH75cqqclZqN6L1YdWJBoGNIn2GEZ2WleoRklXEM8WrdoEEooZGu+Te
   uVUQBkYZ/6eP3W1jHw5WhDNkf80Q6Kic4SUdIc4so3dY1hEVzupGQagTF
   4+lus0tw/2FD4FtomDesJAwcx5ljYprxseST1SZlVaXO+t41JuvFjjZ1v
   g6cDnsj5GAgVFMNHARq94m/UM+HYoetCXPeq8KMVgXl88vIwIcK3GDTFF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="336571848"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="336571848"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 06:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="705656747"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="705656747"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Mar 2023 06:19:16 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY6Ff-0001TU-19;
	Fri, 03 Mar 2023 14:19:15 +0000
Date: Fri, 3 Mar 2023 22:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: Naohiro Aota <naohiro.aota@wdc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] btrfs: zoned: count fresh BG region as zone
 unusable
Message-ID: <202303032259.R58viCRd-lkp@intel.com>
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
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Naohiro-Aota/btrfs-zoned-count-fresh-BG-region-as-zone-unusable/20230303-163006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/ae5d21d50546abaedd89d52cefdd1c61c9018ec2.1677831912.git.naohiro.aota%40wdc.com
patch subject: [RFC PATCH 1/2] btrfs: zoned: count fresh BG region as zone unusable
config: hexagon-randconfig-r002-20230303 (https://download.01.org/0day-ci/archive/20230303/202303032259.R58viCRd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aef11808b70bc7a53270e26eef4c73ae8a1de4a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Naohiro-Aota/btrfs-zoned-count-fresh-BG-region-as-zone-unusable/20230303-163006
        git checkout aef11808b70bc7a53270e26eef4c73ae8a1de4a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303032259.R58viCRd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/btrfs/free-space-cache.c:6:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/btrfs/free-space-cache.c:6:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/btrfs/free-space-cache.c:6:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/btrfs/free-space-cache.c:2700:13: error: use of undeclared identifier 'BTRFS_FS_ACTIVE_ZONE_TRACKING'
                    test_bit(BTRFS_FS_ACTIVE_ZONE_TRACKING, &block_group->fs_info->flags) &&
                             ^
>> fs/btrfs/free-space-cache.c:2700:13: error: use of undeclared identifier 'BTRFS_FS_ACTIVE_ZONE_TRACKING'
>> fs/btrfs/free-space-cache.c:2700:13: error: use of undeclared identifier 'BTRFS_FS_ACTIVE_ZONE_TRACKING'
   6 warnings and 3 errors generated.


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
