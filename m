Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD09749B;
	Wed, 30 Aug 2023 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693430721; x=1724966721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6lo26TGp16wt6IzBr8zfYIWEs49kDFnEEHdZUMXh0MA=;
  b=cYQBcczHbjUp3mhIeqpSiGYd5BwqptkYdO/nGR0VNRAe7Xd4S2XBCOJl
   rmgDq423mgCjqMOgdIbGMcxytSbrMyeM3XE4gArceZQPvUxPSVL26Dg+n
   9F35k19nblKu+QS7jChG229DlNaK3xjGXoxKq4D3Mv1shEQ/UiwHkw73j
   USCgJNdpAAreIHoY3UG/2AwxjLOp7RRRUW3uMkl7BtMs5fB9zY2g5Y66q
   fg24fVhbQNdDRtjXnLCf0utabnIUhwT5SmOfezk3wui8QOMsUrluayY6L
   BmQNNX1s6Il+GR09ytyB7RVi4D7iLxaieqGUeqbKpLh2hwyWqKOhCDoP0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374665315"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="374665315"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 14:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804700874"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="804700874"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 14:25:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbSgU-000AEt-2a;
	Wed, 30 Aug 2023 21:25:13 +0000
Date: Thu, 31 Aug 2023 05:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctl-next 3/5] ipc/ipc_sysctl.c:25:28: error: incomplete
 definition of type 'struct file'
Message-ID: <202308310502.bphhRFPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctl-next
head:   5db649a3f876dee97af2da8462e4314424a04675
commit: 6055635008ed77b08ba85ebaba87e9e3548a7a3a [3/5] ipc: Convert ipc_sysctls to static array
config: i386-randconfig-r012-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310502.bphhRFPk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310502.bphhRFPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310502.bphhRFPk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ipc/ipc_sysctl.c:25:28: error: incomplete definition of type 'struct file'
           struct ctl_context *ctx = SYSCTL_CTX(file);
                                     ^          ~~~~
   include/linux/sysctl.h:176:56: note: expanded from macro 'SYSCTL_CTX'
   #define SYSCTL_CTX(filep) ((struct ctl_context *)(filep->private_data))
                                                     ~~~~~^
   arch/x86/include/asm/pgtable_types.h:503:8: note: forward declaration of 'struct file'
   struct file;
          ^
   ipc/ipc_sysctl.c:47:28: error: incomplete definition of type 'struct file'
           struct ctl_context *ctx = SYSCTL_CTX(file);
                                     ^          ~~~~
   include/linux/sysctl.h:176:56: note: expanded from macro 'SYSCTL_CTX'
   #define SYSCTL_CTX(filep) ((struct ctl_context *)(filep->private_data))
                                                     ~~~~~^
   arch/x86/include/asm/pgtable_types.h:503:8: note: forward declaration of 'struct file'
   struct file;
          ^
   ipc/ipc_sysctl.c:218:28: error: incomplete definition of type 'struct file'
           struct ctl_context *ctx = SYSCTL_CTX(file);
                                     ^          ~~~~
   include/linux/sysctl.h:176:56: note: expanded from macro 'SYSCTL_CTX'
   #define SYSCTL_CTX(filep) ((struct ctl_context *)(filep->private_data))
                                                     ~~~~~^
   arch/x86/include/asm/pgtable_types.h:503:8: note: forward declaration of 'struct file'
   struct file;
          ^
   ipc/ipc_sysctl.c:222:10: error: incomplete definition of type 'struct file'
           if (file->f_cred->user_ns != &init_user_ns)
               ~~~~^
   arch/x86/include/asm/pgtable_types.h:503:8: note: forward declaration of 'struct file'
   struct file;
          ^
   4 errors generated.


vim +25 ipc/ipc_sysctl.c

    22	
    23	static ssize_t proc_write_intvec_orphans(struct file *file, char *buffer, size_t *lenp, loff_t *ppos)
    24	{
  > 25		struct ctl_context *ctx = SYSCTL_CTX(file);
    26		ssize_t err;
    27	
    28		err = proc_write_intvec_minmax(file, buffer, lenp, ppos);
    29	
    30		if (err < 0)
    31			return err;
    32		if (ctx->ipc_ns->shm_rmid_forced)
    33			shm_destroy_orphaned(ctx->ipc_ns);
    34		return err;
    35	}
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
