Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE2EA1
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 06:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655879557; x=1687415557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cJHzT0TZv6YtCDyu3duw3vw1QbLyeoEv+wTnJ86wy+4=;
  b=EuFTbLABdYX+ys06n8OqAHNFde1+GA0F8aZnaKfrDuP7/lMS2ZSEh4Ec
   OXL0bLTEjQS7BmwAhzYQhe/gS7/NkhWpwx9NtwmjAPQ/Ug8d9VHh827vZ
   76iVnveJwCuMffq6lpUQfjfHlA0tQpZEm5XrVTS168VtiXU+Htndbv6fT
   iFH357cuO4Ghrtf0mBtTv7M5h3MpbtogsEXwLxJgY4W/TwhOCgf6Q8mfN
   nvrfVaLhdOt2p0SGxHVKFOqgSqh4jmMIMxr0U8+JoQwReGUpDOmmkwmYi
   da65J929Mk0pPah8Xh59DzXCOcC2rMsKYk4J21DqD6YmE/k9w7pCEMJ2P
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260758904"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="260758904"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 23:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; 
   d="scan'208";a="655498806"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2022 23:32:35 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3tuk-0000vp-JO;
	Wed, 22 Jun 2022 06:32:34 +0000
Date: Wed, 22 Jun 2022 14:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ioannis Angelakopoulos <iangelak@fb.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 2/2] btrfs: Expose the BTRFS commit stats through sysfs
Message-ID: <202206221417.F0FRQcFP-lkp@intel.com>
References: <20220621215245.3603198-3-iangelak@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621215245.3603198-3-iangelak@fb.com>

Hi Ioannis,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19-rc3]
[also build test ERROR on linus/master]
[cannot apply to kdave/for-next next-20220621]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ioannis-Angelakopoulos/btrfs-Expose-BTRFS-commit-stats-through-sysfs/20220622-055620
base:    a111daf0c53ae91e71fd2bfe7497862d14132e3e
config: hexagon-randconfig-r045-20220622 (https://download.01.org/0day-ci/archive/20220622/202206221417.F0FRQcFP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/506de693b0d08cfdf4eca94dc0528e9f46071c6e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ioannis-Angelakopoulos/btrfs-Expose-BTRFS-commit-stats-through-sysfs/20220622-055620
        git checkout 506de693b0d08cfdf4eca94dc0528e9f46071c6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/btrfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/btrfs/sysfs.c:886:64: error: too few arguments to function call, expected 2, have 1
                   div_u64(fs_info->commit_stats.last_commit_dur / NSEC_PER_MSEC),
                   ~~~~~~~                                                      ^
   include/linux/math64.h:125:19: note: 'div_u64' declared here
   static inline u64 div_u64(u64 dividend, u32 divisor)
                     ^
   fs/btrfs/sysfs.c:887:63: error: too few arguments to function call, expected 2, have 1
                   div_u64(fs_info->commit_stats.max_commit_dur / NSEC_PER_MSEC),
                   ~~~~~~~                                                     ^
   include/linux/math64.h:125:19: note: 'div_u64' declared here
   static inline u64 div_u64(u64 dividend, u32 divisor)
                     ^
   fs/btrfs/sysfs.c:888:65: error: too few arguments to function call, expected 2, have 1
                   div_u64(fs_info->commit_stats.total_commit_dur / NSEC_PER_MSEC));
                   ~~~~~~~                                                       ^
   include/linux/math64.h:125:19: note: 'div_u64' declared here
   static inline u64 div_u64(u64 dividend, u32 divisor)
                     ^
   3 errors generated.


vim +886 fs/btrfs/sysfs.c

   874	
   875	static ssize_t btrfs_commit_stats_show(struct kobject *kobj,
   876					struct kobj_attribute *a, char *buf)
   877	{
   878		struct btrfs_fs_info *fs_info = to_fs_info(kobj);
   879	
   880		return sysfs_emit(buf,
   881			"commits %llu\n"
   882			"last_commit_dur_ms %llu\n"
   883			"max_commit_dur_ms %llu\n"
   884			"total_commit_dur_ms %llu\n",
   885			fs_info->commit_stats.commit_counter,
 > 886			div_u64(fs_info->commit_stats.last_commit_dur / NSEC_PER_MSEC),
   887			div_u64(fs_info->commit_stats.max_commit_dur / NSEC_PER_MSEC),
   888			div_u64(fs_info->commit_stats.total_commit_dur / NSEC_PER_MSEC));
   889	}
   890	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
