Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4326FA9;
	Tue, 15 Aug 2023 09:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692093385; x=1723629385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/agkHo8gNGzBur/4TzbTgFoD1Y1kZhJKhbYE4EcJXQ=;
  b=R1PqNe20m11lytR6kz+XYN8+MKnLba+kLQ0NKWZrKvYKgRC9EHUJcXr1
   5QvQlx/tgvg60/+Szpkm03nMxug90f2HJUzQrjTNMwErSXwwQvnh63NCj
   9cA/qcxc+Yqt4fBfcnxwsYr+zJZWGM2aCDhhPDuz6mXWyS1V5fYjMcFr1
   uCEdkLNhGTMvDxkjsi19L/tb0z1/VVRcMRyBM4AprxqYMbOo+G9TlZfZZ
   mYoVEIUV5yhw3RLw6Sw7QSrz7K8mRHULMuk886dpk6qNlh4HXTaiI18Yv
   esmJJSz8sAcyZ96HvW50q7krA3lmluSbXxVgqzTVXG+Hz1xW6DBa9p03u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369719943"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="369719943"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 02:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="736853305"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="736853305"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Aug 2023 02:56:20 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVqmh-0000qV-1v;
	Tue, 15 Aug 2023 09:56:19 +0000
Date: Tue, 15 Aug 2023 17:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:fuse-btime 4/5] fs/fuse/dir.c:353:6: warning: no
 previous prototype for function 'fuse_valid_size'
Message-ID: <202308151724.p3WwIzNV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git fuse-btime
head:   f5e34bab17b678d1b2e3dfd2cac623988a14bbf2
commit: 05d4152f68bd292b04c6240379e8c7d0ed727460 [4/5] fuse: implement statx
config: i386-randconfig-r034-20230815 (https://download.01.org/0day-ci/archive/20230815/202308151724.p3WwIzNV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151724.p3WwIzNV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151724.p3WwIzNV-lkp@intel.com/

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
