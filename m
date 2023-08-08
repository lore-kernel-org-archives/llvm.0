Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5B97FB;
	Tue,  8 Aug 2023 06:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691477451; x=1723013451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ByvWNuTiET/aLAsuByo/wgnhDU+jZHMbaOZgd3ssbE=;
  b=T0BrDeM1N3XKT95iyAUZn6NEx2rI+AXGBHOcorJVf99L6pW3qkG/AXCC
   NIgaifZ7vXzWmGjmVS/yzBPpsKXJWq4bGFWkfWQd4T6HLio5Q/8Zq2CAe
   ENjNGAft0t3SqzTaNsX3PoM26vw4ZH9YZ2t45C91F0NIPeHITQ7wbWYeR
   lmfsfy27KhIYvWttHNo+xWcOQeoQJWb5/PxSapyBmaQ9dmzUkQP3onuts
   JetbjryQ7IdXa3pQxKlsXEEFijoN3uY2xPegBRvpJtxueJGuELAy+46U2
   7p07iPfkSZFWOCESFiAVgu+fxrZTZgyT3WL8EFcSTaY6GzyiyNhkpvR0r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457120321"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="457120321"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 23:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="845337822"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="845337822"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Aug 2023 23:50:49 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTGYK-0005AY-2w;
	Tue, 08 Aug 2023 06:50:48 +0000
Date: Tue, 8 Aug 2023 14:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8] vfs, security: Fix automount superblock LSM init
 problem, preventing NFS sb sharing
Message-ID: <202308081418.N12KQH93-lkp@intel.com>
References: <20230807-master-v8-1-54e249595f10@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807-master-v8-1-54e249595f10@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 52a93d39b17dc7eb98b6aa3edb93943248e03b2f]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/vfs-security-Fix-automount-superblock-LSM-init-problem-preventing-NFS-sb-sharing/20230807-212036
base:   52a93d39b17dc7eb98b6aa3edb93943248e03b2f
patch link:    https://lore.kernel.org/r/20230807-master-v8-1-54e249595f10%40kernel.org
patch subject: [PATCH v8] vfs, security: Fix automount superblock LSM init problem, preventing NFS sb sharing
config: i386-randconfig-i015-20230807 (https://download.01.org/0day-ci/archive/20230808/202308081418.N12KQH93-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081418.N12KQH93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081418.N12KQH93-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/smack/smack_lsm.c:639:26: error: incompatible pointer types passing 'struct dentry *' to parameter of type 'const struct super_block *' [-Werror,-Wincompatible-pointer-types]
           sbsp = smack_superblock(reference);
                                   ^~~~~~~~~
   security/smack/smack.h:353:32: note: passing argument to parameter 'superblock' here
                                           const struct super_block *superblock)
                                                                     ^
>> security/smack/smack_lsm.c:640:31: error: no member named 's_root' in 'struct dentry'
           isp = smack_inode(reference->s_root->d_inode);
                             ~~~~~~~~~  ^
>> security/smack/smack_lsm.c:4932:33: error: incompatible function pointer types initializing 'int (*)(struct fs_context *, struct super_block *)' with an expression of type 'int (struct fs_context *, struct dentry *)' [-Wincompatible-function-pointer-types]
           LSM_HOOK_INIT(fs_context_init, smack_fs_context_init),
                                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:57: note: expanded from macro 'LSM_HOOK_INIT'
           { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
                                                                  ^~~~
   3 errors generated.


vim +639 security/smack/smack_lsm.c

   616	
   617	/**
   618	 * smack_fs_context_init - Initialise security data for a filesystem context
   619	 * @fc: The filesystem context.
   620	 * @reference: Reference superblock (automount/reconfigure) or NULL
   621	 *
   622	 * Returns 0 on success or -ENOMEM on error.
   623	 */
   624	static int smack_fs_context_init(struct fs_context *fc,
   625					 struct dentry *reference)
   626	{
   627		struct superblock_smack *sbsp;
   628		struct smack_mnt_opts *ctx;
   629		struct inode_smack *isp;
   630	
   631		if (!reference || WARN_ON_ONCE(fc->purpose != FS_CONTEXT_FOR_SUBMOUNT))
   632			return 0;
   633	
   634		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   635		if (!ctx)
   636			return -ENOMEM;
   637		fc->security = ctx;
   638	
 > 639		sbsp = smack_superblock(reference);
 > 640		isp = smack_inode(reference->s_root->d_inode);
   641	
   642		if (sbsp->smk_default) {
   643			ctx->fsdefault = kstrdup(sbsp->smk_default->smk_known, GFP_KERNEL);
   644			if (!ctx->fsdefault)
   645				return -ENOMEM;
   646		}
   647	
   648		if (sbsp->smk_floor) {
   649			ctx->fsfloor = kstrdup(sbsp->smk_floor->smk_known, GFP_KERNEL);
   650			if (!ctx->fsfloor)
   651				return -ENOMEM;
   652		}
   653	
   654		if (sbsp->smk_hat) {
   655			ctx->fshat = kstrdup(sbsp->smk_hat->smk_known, GFP_KERNEL);
   656			if (!ctx->fshat)
   657				return -ENOMEM;
   658		}
   659	
   660		if (isp->smk_flags & SMK_INODE_TRANSMUTE) {
   661			if (sbsp->smk_root) {
   662				ctx->fstransmute = kstrdup(sbsp->smk_root->smk_known, GFP_KERNEL);
   663				if (!ctx->fstransmute)
   664					return -ENOMEM;
   665			}
   666		}
   667		return 0;
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
