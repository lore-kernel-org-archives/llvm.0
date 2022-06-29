Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2827B
	for <llvm@lists.linux.dev>; Wed, 29 Jun 2022 02:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656468105; x=1688004105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQkvQR2VzgqaVYrbPKi4Gw7+HM1ufl5gQO6hyb2+pZs=;
  b=Pr37H3rdz3eNu5pcE5cn6QnsUsMt7k2FSb7EL6GNspEqgqubaSw3Hg1k
   4nZg4aIaslUdXtLf7G8HOKzGxQJjAJAvN6LoHkdISfvgH9cVvjUP4vNlQ
   ZCqrwEkM2o/JxHe/YBC6+qq5XhUEr1wNIaJybMesI1IbOEI8KqG/43YeM
   TEx1lvpPXdsIWytSyATYoE/PCQzCelMLX6Bkiy1ApovLjrL+uLFpTclVH
   6OUNtZyLLSVrD8VSRrhT/ppDAaqAYK19py8StbcNUWav5JqLgytmOJkfl
   +F9Mp3lGhmbljidC5IMJxaPuAHZoXW6BaKULaRB6GLlSrvIiXk3fBDiG6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="264936129"
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="264936129"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 19:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,230,1650956400"; 
   d="scan'208";a="917411138"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jun 2022 19:01:43 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o6N1S-000Ap0-Ez;
	Wed, 29 Jun 2022 02:01:42 +0000
Date: Wed, 29 Jun 2022 10:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [gfs2:nopid 1/5] fs/gfs2/glock.c:2785:3: error: call to undeclared
 function 'fput'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202206290953.iT9zAjZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git nopid
head:   b1d0ed94e881ca5b5aee15e05f13db75445398f2
commit: 13ba8572506201aa85020970f776597fbcdcda56 [1/5] gfs2: Add glockfd debugfs file
config: arm64-buildonly-randconfig-r005-20220627 (https://download.01.org/0day-ci/archive/20220629/202206290953.iT9zAjZQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project df18167ac56d05f2ab55f9d874aee7ab6d5bc9a2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=13ba8572506201aa85020970f776597fbcdcda56
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 nopid
        git checkout 13ba8572506201aa85020970f776597fbcdcda56
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/gfs2/glock.c:2785:3: error: call to undeclared function 'fput'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   fput(i->file);
                   ^
   fs/gfs2/glock.c:2842:3: error: call to undeclared function 'fput'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   fput(i->file);
                   ^
   2 errors generated.


vim +/fput +2785 fs/gfs2/glock.c

  2781	
  2782	static struct file *gfs2_glockfd_next_file(struct gfs2_glockfd_iter *i)
  2783	{
  2784		if (i->file) {
> 2785			fput(i->file);
  2786			i->file = NULL;
  2787		}
  2788	
  2789		rcu_read_lock();
  2790		for(;; i->fd++) {
  2791			struct inode *inode;
  2792	
  2793			i->file = task_lookup_next_fd_rcu(i->task, &i->fd);
  2794			if (!i->file) {
  2795				i->fd = 0;
  2796				break;
  2797			}
  2798			inode = file_inode(i->file);
  2799			if (inode->i_sb != i->sb)
  2800				continue;
  2801			if (get_file_rcu(i->file))
  2802				break;
  2803		}
  2804		rcu_read_unlock();
  2805		return i->file;
  2806	}
  2807	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
