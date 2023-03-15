Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5BC6FC3;
	Wed, 15 Mar 2023 20:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678911248; x=1710447248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qEn7eVh0qey1R5xO+bISf9zYigLUClqJeIB9C6QUd5k=;
  b=M8cK9HiPAmJW46isM1hMGcRzXsOyAierK8u8e0tQ37dArhj3NuwS3UC/
   fNQHGDiKYPu1I0QInOtncfh6xdAQUUgQolmhBSIfnMkJ9ps38jbGlY5SD
   8VKIsEqpuL3/jxsAs0gZ8AaUYPROHg1EBrz0bXh2I1PsbN9SX4gDYla+N
   Of6KM3iT0igiQh3Py2tqD02Utzzevkv/V4WMHHACbT8UTeAeGE7qv1Hh+
   Wwgeqplclrmn2CFtc7HwzLr060zX6XC5J+aLMWzi+Td1fTk6fqyZIZooG
   dPFPCt7PfqOW/oveMychlQzeE3SpitBu94M1RNLOtU7gzoB+KDDthjm66
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424080614"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="424080614"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 13:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743854712"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="743854712"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 13:14:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcXVc-00080R-0M;
	Wed, 15 Mar 2023 20:14:04 +0000
Date: Thu, 16 Mar 2023 04:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	yebin10@huawei.com
Subject: Re: [PATCH 4/4] pcpcntr: remove percpu_counter_sum_all()
Message-ID: <202303160421.bnmiVRCM-lkp@intel.com>
References: <20230315084938.2544737-5-david@fromorbit.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315084938.2544737-5-david@fromorbit.com>

Hi Dave,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc2 next-20230315]
[cannot apply to dennis-percpu/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Chinner/cpumask-introduce-for_each_cpu_or/20230315-165202
patch link:    https://lore.kernel.org/r/20230315084938.2544737-5-david%40fromorbit.com
patch subject: [PATCH 4/4] pcpcntr: remove percpu_counter_sum_all()
config: riscv-randconfig-r042-20230313 (https://download.01.org/0day-ci/archive/20230316/202303160421.bnmiVRCM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/8360dcb55f1eb08fe7a1f457f3b99bef8e306c8b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dave-Chinner/cpumask-introduce-for_each_cpu_or/20230315-165202
        git checkout 8360dcb55f1eb08fe7a1f457f3b99bef8e306c8b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160421.bnmiVRCM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_super.c:1079:9: error: call to undeclared function 'percpu_counter_sum_all'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                  percpu_counter_sum_all(&mp->m_delalloc_blks) == 0);
                  ^
   fs/xfs/xfs_super.c:1079:9: note: did you mean 'percpu_counter_sum'?
   include/linux/percpu_counter.h:193:19: note: 'percpu_counter_sum' declared here
   static inline s64 percpu_counter_sum(struct percpu_counter *fbc)
                     ^
   1 error generated.


vim +/percpu_counter_sum_all +1079 fs/xfs/xfs_super.c

8757c38f2cf6e5 Ian Kent        2019-11-04  1070  
8757c38f2cf6e5 Ian Kent        2019-11-04  1071  static void
8757c38f2cf6e5 Ian Kent        2019-11-04  1072  xfs_destroy_percpu_counters(
8757c38f2cf6e5 Ian Kent        2019-11-04  1073  	struct xfs_mount	*mp)
8757c38f2cf6e5 Ian Kent        2019-11-04  1074  {
8757c38f2cf6e5 Ian Kent        2019-11-04  1075  	percpu_counter_destroy(&mp->m_icount);
8757c38f2cf6e5 Ian Kent        2019-11-04  1076  	percpu_counter_destroy(&mp->m_ifree);
8757c38f2cf6e5 Ian Kent        2019-11-04  1077  	percpu_counter_destroy(&mp->m_fdblocks);
75c8c50fa16a23 Dave Chinner    2021-08-18  1078  	ASSERT(xfs_is_shutdown(mp) ||
c35278f526edf1 Ye Bin          2023-03-14 @1079  	       percpu_counter_sum_all(&mp->m_delalloc_blks) == 0);
8757c38f2cf6e5 Ian Kent        2019-11-04  1080  	percpu_counter_destroy(&mp->m_delalloc_blks);
2229276c528326 Darrick J. Wong 2022-04-12  1081  	percpu_counter_destroy(&mp->m_frextents);
8757c38f2cf6e5 Ian Kent        2019-11-04  1082  }
8757c38f2cf6e5 Ian Kent        2019-11-04  1083  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
