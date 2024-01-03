Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C561A584;
	Wed,  3 Jan 2024 12:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5tIdj+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704285660; x=1735821660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A2KQabqJbbbQ1hT6htkxL1OGICtH3cYgW4FYrDxjLNI=;
  b=a5tIdj+ddjdTLrAt4c6C8Q4AHv5m0p4oCBMHNnoPZUEoUUsQuuUH36gV
   brYuPv3sEqgIs6ot9OxnsHn2Fz5/QWdvwobYEE6jXEPgFu4y+mOMahjSx
   Pjug+zLTJsA1Ts+qg7JpRnbNcWrEBriE1zA2HeLRpZNiIWjArWyELOrza
   Pz9YfNnH1u2F41sulPwmzFFsDaP4Q85C40gTv/zU2c0P4rYrH0JCviAv8
   t70jO9ySJIySiAsM9My8e8M6GceYM0WINmm8Spje4izXws719ezNVN14k
   Nr2QxEBUsIo67p0SqHMn89oc+ZDEPeL45DaAmg6iSzT/EPBzoRTUj5Y1T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="400813126"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="400813126"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 04:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="783501330"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="783501330"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jan 2024 04:40:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL0YJ-000M5I-3B;
	Wed, 03 Jan 2024 12:40:55 +0000
Date: Wed, 3 Jan 2024 20:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:kdevops 58/58] net/sunrpc/clnt.c:2341:9: error: no member named
 'tk_pid' in 'struct rpc_task'
Message-ID: <202401032013.Qirj77i8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux kdevops
head:   8bcbb6048716f07d335466d70ae8659d998d43c7
commit: 8bcbb6048716f07d335466d70ae8659d998d43c7 [58/58] Debugging
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20240103/202401032013.Qirj77i8-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project baf8a39aaf8b61a38b5b2b5591deb765e42eb00b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401032013.Qirj77i8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401032013.Qirj77i8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sunrpc/clnt.c:2341:9: error: no member named 'tk_pid' in 'struct rpc_task'
    2341 |                 task->tk_pid,
         |                 ~~~~  ^
   net/sunrpc/clnt.c:2357:9: error: no member named 'tk_pid' in 'struct rpc_task'
    2357 |                 task->tk_pid,
         |                 ~~~~  ^
   net/sunrpc/clnt.c:2380:9: error: no member named 'tk_pid' in 'struct rpc_task'
    2380 |                 task->tk_pid,
         |                 ~~~~  ^
   3 errors generated.


vim +2341 net/sunrpc/clnt.c

  2336	
  2337	static void
  2338	call_bc_encode(struct rpc_task *task)
  2339	{
  2340		trace_printk("%08x@%08x tk_status=%d",
> 2341			task->tk_pid,
  2342			task->tk_client ? task->tk_client->cl_clid : -1,
  2343			task->tk_status);
  2344	
  2345		xprt_request_enqueue_transmit(task);
  2346		task->tk_action = call_bc_transmit;
  2347	}
  2348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
