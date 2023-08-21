Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA515C0;
	Mon, 21 Aug 2023 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692635392; x=1724171392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NpQsEqYT8/f2udQUJjmqmfj8QARs5K63nYzT14whewg=;
  b=ntnRYVebInFIo3T4IdGwfLzyFLA4iZymQYWxA1IauwjtB+L6vmhbxn6o
   jAKFyYe+IhzWTa2K8zSU93D/+R7rdbC9AimMOLxSCAw3gQ7OAmhJE+50j
   BHMJ6ZzHrx/nQE+WnGbY40J9d4zaz3Qpqp/5sbX38FySQxlaW9/FhZRT8
   6TPJzi05qSJGVjRQbgpH88dCENPtHt7DFfp6byoqoZrNW9y4nG20UplBK
   WPnsoYrmpvZ1LjpItDKs5ICNKdHxgQGE1UKoFSlkzv0yCBJW/R8ysfO1N
   eqJMF+tW8nUhJRdGdHtWmB3KKL8MC/gj9Xh0RmOaVC858kFWSaMxKkGky
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377380827"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="377380827"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 09:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="909772220"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="909772220"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Aug 2023 09:29:50 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY7mn-0000h2-2b;
	Mon, 21 Aug 2023 16:29:49 +0000
Date: Tue, 22 Aug 2023 00:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9545/11453] fs/fuse/dir.c:353:6: warning: no
 previous prototype for function 'fuse_valid_size'
Message-ID: <202308220022.5QFK6oAL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: 2850358b2ce3a01109f30fbb9389cc483448894d [9545/11453] fuse: implement statx
config: i386-randconfig-001-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220022.5QFK6oAL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220022.5QFK6oAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220022.5QFK6oAL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/dir.c:353:6: warning: no previous prototype for function 'fuse_valid_size' [-Wmissing-prototypes]
   bool fuse_valid_size(u64 size)
        ^
   fs/fuse/dir.c:353:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool fuse_valid_size(u64 size)
   ^
   static 
   1 warning generated.


vim +/fuse_valid_size +353 fs/fuse/dir.c

   352	
 > 353	bool fuse_valid_size(u64 size)
   354	{
   355		return size <= LLONG_MAX;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
