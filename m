Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53BC20B03;
	Tue, 16 Jan 2024 01:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IE9RZSXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705367508; x=1736903508;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVMYNw6foCty9Ir6FfumVl7b13XYgF+djCuQhWAf/Sk=;
  b=IE9RZSXwhwtj/g+v/gYA5pnzW9oZJEMNHMzsQejCeqqcZPqTxbiwefRY
   n9cmeDxVgvESTBTUVKjrh87G53hx8TQq1tc+oPzCPkHOJLjEMXuJnEcTP
   OBFdLaKWetLFkvs3ihn01okXKRP+Co9b9MQw1P/D+st4v4WWVHJxP5LFU
   PsgwRuXIUTBNQzV8Dw9AHJWLIoPumfsudd18dX8lEipwYBQsFduQkb3MQ
   TzhHDKUicRbymDZ7b/KSO+E8ZKCyfHSMGnLvDqvQT62lc1cJVO+CPokie
   ymW3eG/Yi8kRN/3QEj29gq/Zrj6wz3qxrfqVeflZ8oAi4kjY09G2177ZB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="7098796"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="7098796"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 17:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="956963657"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="956963657"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2024 17:11:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPXzT-000Crk-0r;
	Tue, 16 Jan 2024 01:11:43 +0000
Date: Tue, 16 Jan 2024 09:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [toke:xdp-queueing-08 5/10] net/core/xdp.c:939:6: warning: no
 previous prototype for function 'dev_check_flush'
Message-ID: <202401160923.IMAFouqs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Toke,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git xdp-queueing-08
head:   6b7e918c9c07efda4a33ce43d8926dfa59db82a3
commit: 96cd8dc4671edf2d40a17ed13629be341995b8f5 [5/10] xdp: Move bulk queue functions and data structures out of devmap.c
config: x86_64-randconfig-015-20240116 (https://download.01.org/0day-ci/archive/20240116/202401160923.IMAFouqs-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401160923.IMAFouqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401160923.IMAFouqs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/xdp.c:939:6: warning: no previous prototype for function 'dev_check_flush' [-Wmissing-prototypes]
     939 | bool dev_check_flush(void)
         |      ^
   net/core/xdp.c:939:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     939 | bool dev_check_flush(void)
         | ^
         | static 
   1 warning generated.


vim +/dev_check_flush +939 net/core/xdp.c

   937	
   938	#ifdef CONFIG_DEBUG_NET
 > 939	bool dev_check_flush(void)
   940	{
   941		if (list_empty(this_cpu_ptr(&dev_flush_list)))
   942			return false;
   943		__xdp_dev_flush();
   944		return true;
   945	}
   946	#endif
   947	
   948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
