Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7E7366
	for <llvm@lists.linux.dev>; Sat, 17 Sep 2022 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663385035; x=1694921035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8gRj66gpCYrWvqme3DOmR82oPy7weACbECXx3D2voc8=;
  b=PYzi7C03svcdfHYCJ9u1NjvM+NikdaBok2Wv6ncYk3CaPa65mZSM72/E
   4aFfOj1jCML7QjDNLsatodGncT6jXGsjlnJcETbWP9SqbLpBYK33Vk0kV
   KfcYVcVO/rd853hKiNJjEUpw0TF5rz+sKfWAsEOY37WOHISl8a8b1CjBu
   PJTCmmbfMDAkbYBJFJFqxjnEtoFwG31C6v0OXpDhcSBgaJoiKk0Sq52e/
   MRS+xEALfV0dTuotb44ko1ZbgypXS8NKXxvgpdtCeNGoDzFMbZGgCF9ea
   BcLgg/D8AYKC0KRM/HL/B7fIDUBifpaMPThmKcuilmvPYyNcQa2hkqfQf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="385411283"
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="385411283"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 20:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; 
   d="scan'208";a="651077853"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Sep 2022 20:23:53 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZOQq-0002Qa-2g;
	Sat, 17 Sep 2022 03:23:52 +0000
Date: Sat, 17 Sep 2022 11:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Babrou <ivan@cloudflare.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC] proc: report open files as size in stat() for /proc/pid/fd
Message-ID: <202209171129.dnkI0XiE-lkp@intel.com>
References: <20220916230853.49056-1-ivan@cloudflare.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916230853.49056-1-ivan@cloudflare.com>

Hi Ivan,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.0-rc5 next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Babrou/proc-report-open-files-as-size-in-stat-for-proc-pid-fd/20220917-071056
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r041-20220916 (https://download.01.org/0day-ci/archive/20220917/202209171129.dnkI0XiE-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/58f6f7e4082a88ddcb4b732d386f9a4b0e1b03b4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ivan-Babrou/proc-report-open-files-as-size-in-stat-for-proc-pid-fd/20220917-071056
        git checkout 58f6f7e4082a88ddcb4b732d386f9a4b0e1b03b4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/proc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/proc/fd.c:345:5: warning: no previous prototype for function 'proc_fd_getattr' [-Wmissing-prototypes]
   int proc_fd_getattr(struct user_namespace *mnt_userns,
       ^
   fs/proc/fd.c:345:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int proc_fd_getattr(struct user_namespace *mnt_userns,
   ^
   static 
   1 warning generated.


vim +/proc_fd_getattr +345 fs/proc/fd.c

   344	
 > 345	int proc_fd_getattr(struct user_namespace *mnt_userns,
   346				const struct path *path, struct kstat *stat,
   347				u32 request_mask, unsigned int query_flags)
   348	{
   349		struct inode *inode = d_inode(path->dentry);
   350		struct proc_dir_entry *de = PDE(inode);
   351	
   352		if (de) {
   353			nlink_t nlink = READ_ONCE(de->nlink);
   354	
   355			if (nlink > 0)
   356				set_nlink(inode, nlink);
   357		}
   358	
   359		generic_fillattr(&init_user_ns, inode, stat);
   360	
   361		/* If it's a directory, put the number of open fds there */
   362		if (S_ISDIR(inode->i_mode))
   363			stat->size = proc_readfd_count(inode);
   364	
   365		return 0;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
