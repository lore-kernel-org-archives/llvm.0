Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AF79D8;
	Sat,  5 Aug 2023 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691220381; x=1722756381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UqF/d5iiHLyiH7XIXE8R+Toinf2zfbbfnaBnMVML3rE=;
  b=YEaZtUwZqt128TITV4s4CYpPOqW1wIp0f+GGNfWElSKUA4ehzGBfNJ3r
   SARASsFTG5ZE2sG4+vwaFiaK44gHa16Rd24HVCM2NTf3hC95Q13tfg58D
   W5faNWdogYGkwKcbDqaLyAaSNz3pY1A6yspwr2/F+xNw04NmG+WllwNFl
   QGcqJgoQHzqzmXQgc0onmM8DfeV/Nm2BuCTFwe4mrfbrSmISYkRKtuPF7
   bjFruOlyFDBOAW03ZmnWtalv6JgFslavZYxGpee/YyoC+hmM9baS5g8xM
   99pnuIQ6soH8KTv5dLIogOYKo5uO7QA+dKTTQ2FHYyeRhMo1dYITkWtiw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350606243"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="350606243"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 00:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="844379742"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="844379742"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2023 00:26:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSBg2-0003Nn-1R;
	Sat, 05 Aug 2023 07:26:18 +0000
Date: Sat, 5 Aug 2023 15:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] vfs, security: Fix automount superblock LSM init
 problem, preventing NFS sb sharing
Message-ID: <202308051526.dsbiTn6m-lkp@intel.com>
References: <20230804-master-v7-1-5d4e48407298@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804-master-v7-1-5d4e48407298@kernel.org>

Hi Jeff,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/vfs-security-Fix-automount-superblock-LSM-init-problem-preventing-NFS-sb-sharing/20230805-001234
base:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
patch link:    https://lore.kernel.org/r/20230804-master-v7-1-5d4e48407298%40kernel.org
patch subject: [PATCH v7] vfs, security: Fix automount superblock LSM init problem, preventing NFS sb sharing
config: hexagon-randconfig-r041-20230801 (https://download.01.org/0day-ci/archive/20230805/202308051526.dsbiTn6m-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051526.dsbiTn6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051526.dsbiTn6m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/smack/smack_lsm.c:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from security/smack/smack_lsm.c:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from security/smack/smack_lsm.c:19:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> security/smack/smack_lsm.c:631:59: warning: if statement has empty body [-Wempty-body]
     631 |         if (!reference || fc->purpose != FS_CONTEXT_FOR_SUBMOUNT);
         |                                                                  ^
   security/smack/smack_lsm.c:631:59: note: put the semicolon on a separate line to silence this warning
   7 warnings generated.


vim +631 security/smack/smack_lsm.c

   616	
   617	/**
   618	 * smack_fs_context_init - Initialise security data for a filesystem context
   619	 * @fc: The filesystem context.
   620	 * @reference: Reference dentry (automount/reconfigure) or NULL
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
 > 631		if (!reference || fc->purpose != FS_CONTEXT_FOR_SUBMOUNT);
   632			return 0;
   633	
   634		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   635		if (!ctx)
   636			return -ENOMEM;
   637		fc->security = ctx;
   638	
   639		sbsp = smack_superblock(reference->d_sb);
   640		isp = smack_inode(reference->d_sb->s_root->d_inode);
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
