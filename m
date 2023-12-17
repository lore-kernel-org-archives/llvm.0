Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA79D44C7F;
	Sun, 17 Dec 2023 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bArXehSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702825342; x=1734361342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mVKaywtsW/644gKCBoplXHL8+7GvHRRJrCpMdT1r+3Q=;
  b=bArXehSR4bqHbpB/CnziGufhAw2n9Z3onDRMaWrt+jfHjWqT1yJs0Fj8
   JF0mLxj93kn05BmCIbrRgDqT9dE7Q2A5MQFFDoT+PQrw9E/YxaCNiWgW+
   xf+zCyYPPMcFAwn0vat7yAcSEQt2T8ri+1Geie77H5rpvEuZOjrAcM2uK
   CaU2rRNd5eb1tXO6rtNawk1ZaThcPkpvSPjE2oc08R2uYOheU0Yw3Oquj
   PZ1/ztcXchGm85kP7bSAn0I6qBq7N1o/zhpr2Ub5ktdRAPpfxv/RdIUCQ
   RCbD2J6KvHmjw06M46Is4KNQyg/pyLwMi+qjao4Iir/1JZ3O/gkKk7Cv+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="426552347"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="426552347"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 07:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="845673305"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="845673305"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2023 07:02:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEseo-00038S-0h;
	Sun, 17 Dec 2023 15:02:18 +0000
Date: Sun, 17 Dec 2023 23:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 23/50]
 drivers/gpu/drm/lima/lima_ctx.c:30:13: error: call to undeclared function
 'task_pid_nr'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202312172203.QCnaSNcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 90ffe33a843d713946918328956c4b72f662e7ce [23/50] sched.h: move pid helpers to pid.h
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231217/202312172203.QCnaSNcw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312172203.QCnaSNcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312172203.QCnaSNcw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/lima/lima_ctx.c:30:13: error: call to undeclared function 'task_pid_nr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ctx->pid = task_pid_nr(current);
                      ^
   1 error generated.


vim +/task_pid_nr +30 drivers/gpu/drm/lima/lima_ctx.c

a1d2a6339961efc Qiang Yu    2019-03-09   8  
a1d2a6339961efc Qiang Yu    2019-03-09   9  int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
a1d2a6339961efc Qiang Yu    2019-03-09  10  {
a1d2a6339961efc Qiang Yu    2019-03-09  11  	struct lima_ctx *ctx;
a1d2a6339961efc Qiang Yu    2019-03-09  12  	int i, err;
a1d2a6339961efc Qiang Yu    2019-03-09  13  
a1d2a6339961efc Qiang Yu    2019-03-09  14  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
a1d2a6339961efc Qiang Yu    2019-03-09  15  	if (!ctx)
a1d2a6339961efc Qiang Yu    2019-03-09  16  		return -ENOMEM;
a1d2a6339961efc Qiang Yu    2019-03-09  17  	ctx->dev = dev;
a1d2a6339961efc Qiang Yu    2019-03-09  18  	kref_init(&ctx->refcnt);
a1d2a6339961efc Qiang Yu    2019-03-09  19  
a1d2a6339961efc Qiang Yu    2019-03-09  20  	for (i = 0; i < lima_pipe_num; i++) {
a1d2a6339961efc Qiang Yu    2019-03-09  21  		err = lima_sched_context_init(dev->pipe + i, ctx->context + i, &ctx->guilty);
a1d2a6339961efc Qiang Yu    2019-03-09  22  		if (err)
a1d2a6339961efc Qiang Yu    2019-03-09  23  			goto err_out0;
a1d2a6339961efc Qiang Yu    2019-03-09  24  	}
a1d2a6339961efc Qiang Yu    2019-03-09  25  
14d2bd53a47a7e1 Dave Airlie 2019-04-05  26  	err = xa_alloc(&mgr->handles, id, ctx, xa_limit_32b, GFP_KERNEL);
a1d2a6339961efc Qiang Yu    2019-03-09  27  	if (err < 0)
a1d2a6339961efc Qiang Yu    2019-03-09  28  		goto err_out0;
a1d2a6339961efc Qiang Yu    2019-03-09  29  
6ebd24b6bf106d3 Qiang Yu    2020-02-22 @30  	ctx->pid = task_pid_nr(current);
6ebd24b6bf106d3 Qiang Yu    2020-02-22  31  	get_task_comm(ctx->pname, current);
6ebd24b6bf106d3 Qiang Yu    2020-02-22  32  
a1d2a6339961efc Qiang Yu    2019-03-09  33  	return 0;
a1d2a6339961efc Qiang Yu    2019-03-09  34  
a1d2a6339961efc Qiang Yu    2019-03-09  35  err_out0:
a1d2a6339961efc Qiang Yu    2019-03-09  36  	for (i--; i >= 0; i--)
a1d2a6339961efc Qiang Yu    2019-03-09  37  		lima_sched_context_fini(dev->pipe + i, ctx->context + i);
a1d2a6339961efc Qiang Yu    2019-03-09  38  	kfree(ctx);
a1d2a6339961efc Qiang Yu    2019-03-09  39  	return err;
a1d2a6339961efc Qiang Yu    2019-03-09  40  }
a1d2a6339961efc Qiang Yu    2019-03-09  41  

:::::: The code at line 30 was first introduced by commit
:::::: 6ebd24b6bf106d3195bdbfeaa1ac77571e3dc670 drm/lima: save process info for debug usage

:::::: TO: Qiang Yu <yuq825@gmail.com>
:::::: CC: Qiang Yu <yuq825@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
