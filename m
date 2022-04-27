Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A70A3B
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651068031; x=1682604031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Wh+0gGO+3MTvMF+x8FX4p0T0GZwlRa7GDV8Q3cg81Q=;
  b=gNtJyTnoXfiTrLw74Vo4cNl8WS6yJMUa75zozdCHZ6MNkueY7EsjHAg3
   q02ZFbxKj34oeQT42WcL47czxiZqqZt4Qq0X098xiVDCrkKfDjY7EVnox
   Tg9JqyvZsHVMYumi+aQ9eQ6mCB3+C8/wb/tq2JJn/7Hh+7yI/fM1HLJw8
   RsrKw8PzCfVexdkL/VeJ823Qc60xz8FMXMOH7XfdISLPUyJ+SoNAAVMdi
   7Udyy4GWb7ouxtxZXURQN3Pn4nccMgjrwKUBw0bhax2JaOKFwauwbri77
   FJb3QVdZHdNtQg+ZNFCOxg8UbOwGXLjryGhYjvWEgMG70ctx5jL65nzS7
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="263521727"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="263521727"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 07:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; 
   d="scan'208";a="617524875"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2022 07:00:29 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njiDU-0004hG-Lw;
	Wed, 27 Apr 2022 14:00:28 +0000
Date: Wed, 27 Apr 2022 21:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC v2 08/12] btrfs: switch buffered read to the new
 btrfs_read_repair_* based repair routine
Message-ID: <202204272153.rxJ2vPvg-lkp@intel.com>
References: <7782502d2dc775c941f2f9e5309cbb9288034a53.1651043618.git.wqu@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7782502d2dc775c941f2f9e5309cbb9288034a53.1651043618.git.wqu@suse.com>

Hi Qu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20220427]
[cannot apply to rostedt-trace/for-next v5.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-introduce-a-pure-data-checksum-checking-helper/20220427-161943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
config: hexagon-randconfig-r041-20220427 (https://download.01.org/0day-ci/archive/20220427/202204272153.rxJ2vPvg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3f389ea1be2d5c290c4b523743ca200983f45765
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Qu-Wenruo/btrfs-introduce-a-pure-data-checksum-checking-helper/20220427-161943
        git checkout 3f389ea1be2d5c290c4b523743ca200983f45765
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/btrfs/extent_io.c:3078:3: warning: variable 'nbits' is used uninitialized whenever '?:' condition is true [-Wsometimes-uninitialized]
                   ASSERT(atomic_read(&ctrl->io_bytes) == 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ctree.h:3620:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assertfail(#expr, __FILE__, __LINE__))
            ^~~~~~~~~~~~
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/extent_io.c:3098:46: note: uninitialized use occurs here
           for_each_set_bit(bit, ctrl->cur_bad_bitmap, nbits) {
                                                       ^~~~~
   include/linux/find.h:283:38: note: expanded from macro 'for_each_set_bit'
           for ((bit) = find_next_bit((addr), (size), 0);          \
                                               ^~~~
   fs/btrfs/extent_io.c:3078:3: note: remove the '?:' if its condition is always false
                   ASSERT(atomic_read(&ctrl->io_bytes) == 0);
                   ^
   fs/btrfs/ctree.h:3620:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assertfail(#expr, __FILE__, __LINE__))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/btrfs/extent_io.c:3064:20: note: initialize the variable 'nbits' to silence this warning
           unsigned int nbits;
                             ^
                              = 0
   1 warning generated.


vim +3078 fs/btrfs/extent_io.c

  3060	
  3061	static void read_repair_finish(struct btrfs_read_repair_ctrl *ctrl)
  3062	{
  3063		struct btrfs_fs_info *fs_info;
  3064		unsigned int nbits;
  3065		u32 sectorsize;
  3066		int bit;
  3067		int i;
  3068	
  3069		if (!ctrl->initialized)
  3070			return;
  3071	
  3072		/*
  3073		 * Got a critical -ENOMEM error preivously, no repair should have been
  3074		 * attempted.
  3075		 */
  3076		if (ctrl->error) {
  3077			ASSERT(bio_list_empty(&ctrl->bios));
> 3078			ASSERT(atomic_read(&ctrl->io_bytes) == 0);
  3079			goto mark_error;
  3080		}
  3081	
  3082		ASSERT(ctrl->inode);
  3083		fs_info = btrfs_sb(ctrl->inode->i_sb);
  3084		nbits = ctrl->bio_size >> fs_info->sectorsize_bits;
  3085		sectorsize = fs_info->sectorsize;
  3086	
  3087		/* Go through each remaining mirrors to do the repair */
  3088		for (i = get_next_mirror(ctrl->init_mirror, ctrl->num_copies);
  3089		     i != ctrl->init_mirror; i = get_next_mirror(i, ctrl->num_copies)) {
  3090			read_repair_from_one_mirror(ctrl, ctrl->inode, i);
  3091	
  3092			/* Check the error bitmap to see if no more corrupted sectors */
  3093			if (bitmap_all_zero(ctrl->cur_bad_bitmap, nbits))
  3094				break;
  3095		}
  3096	mark_error:
  3097		/* Finish the unrecovered bad sectors */
  3098		for_each_set_bit(bit, ctrl->cur_bad_bitmap, nbits) {
  3099			struct page *page;
  3100			unsigned int pgoff;
  3101			u64 file_offset = (bit << fs_info->sectorsize_bits) +
  3102					  ctrl->file_offset;
  3103	
  3104			page = read_repair_get_sector(ctrl, bit, &pgoff);
  3105	
  3106			end_page_read(page, false, file_offset, sectorsize);
  3107			unlock_extent_cached_atomic(&BTRFS_I(ctrl->inode)->io_tree,
  3108					file_offset, file_offset + sectorsize - 1, NULL);
  3109		}
  3110		kfree(ctrl->cur_bad_bitmap);
  3111		kfree(ctrl->prev_bad_bitmap);
  3112		ctrl->cur_bad_bitmap = NULL;
  3113		ctrl->prev_bad_bitmap = NULL;
  3114		ctrl->initialized = false;
  3115		ctrl->error = false;
  3116		ctrl->failed_bio = NULL;
  3117		ASSERT(bio_list_empty(&ctrl->bios));
  3118		ASSERT(atomic_read(&ctrl->io_bytes) == 0);
  3119	}
  3120	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
