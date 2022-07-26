Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10499621
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 02:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658803470; x=1690339470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/TQwusrqif/XtALjB8sGidArsgGL5jiQEVuHnGn7Ahc=;
  b=ePRczOD5PjiBTja2MoAFvIuiiXee4Br7f1JEw84JW8QGXkjb8R6KOhAF
   Xud+BPbk0vBBBqrE3AB5t+F0M/wcCW8TD6N9wOPnCQVZybEb5aUsaUbXD
   8hkIJl+3zeXyq1QOdDCwzWfkZep2e4+lTFGzuJ0LaM0BUEpl70bl04HaN
   AqZtzbROKpUN44aF4jw11Bu9cLBCJHS5JOLVfO+m6GjALv/xN3eV4rTFX
   ebHMLJ4EJFLtu2S8XNGyDjdALjJYm94FD6UajCYTtmtMoejGMa3Qdc5mf
   jiS+KT5Bl9uQYFQnNh4TmaCH4C72NGl86/nK6oxmH2JVoDwSer3yk68ue
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="374146385"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="374146385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 19:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="575305103"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Jul 2022 19:44:28 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGAYd-0005tT-1Z;
	Tue, 26 Jul 2022 02:44:27 +0000
Date: Tue, 26 Jul 2022 10:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Allison Henderson <allison.henderson@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 18/18] xfs: Add parent pointer ioctl
Message-ID: <202207261042.ZcgFn423-lkp@intel.com>
References: <20220718202022.6598-19-allison.henderson@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718202022.6598-19-allison.henderson@oracle.com>

Hi Allison,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on next-20220725]
[cannot apply to linus/master v5.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allison-Henderson/Parent-Pointers/20220719-044053
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220726/202207261042.ZcgFn423-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0a0b167e2b2c2bd8c046de4338abf8bc7f4204f1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Allison-Henderson/Parent-Pointers/20220719-044053
        git checkout 0a0b167e2b2c2bd8c046de4338abf8bc7f4204f1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_parent_utils.c:42:1: warning: no previous prototype for function 'xfs_attr_get_parent_pointer' [-Wmissing-prototypes]
   xfs_attr_get_parent_pointer(struct xfs_inode            *ip,
   ^
   fs/xfs/xfs_parent_utils.c:41:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   1 warning generated.


vim +/xfs_attr_get_parent_pointer +42 fs/xfs/xfs_parent_utils.c

    35	
    36	/*
    37	 * Get the parent pointers for a given inode
    38	 *
    39	 * Returns 0 on success and non zero on error
    40	 */
    41	int
  > 42	xfs_attr_get_parent_pointer(struct xfs_inode		*ip,
    43				    struct xfs_pptr_info	*ppi)
    44	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
