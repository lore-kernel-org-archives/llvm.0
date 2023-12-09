Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6469D522;
	Sat,  9 Dec 2023 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5UzyVH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702133389; x=1733669389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gdDGWwAe7qYH+o3LMHm3Vhmma3yd6Ek/r0WMoo6uth8=;
  b=P5UzyVH6PzcHa0UJmYlwcSnN2vN/CJ8G35E57kvaGEgRRmnplAPxnXbR
   sw2+3nsVzAOmycT77fRU0kp9/kvt3KujpN9bfy+84FLDg+C1w5pGAd2a6
   iJ5b9yIa6Hfav+/PUG7IyxpesOHqFTwYqCSOVKMGMOzJTgqtczQ6B40kf
   hAzFpuD9W46u4HR/LTFNDiv7cRZfb37uvr3C39NvkM+9E6ji+lLci6jpD
   8ZR862BKLzNAvxW00VDJ2Dvlnk0As0Bjr9PNuEKcS7s0YO1y4CeTVNGO1
   23C/IOX62NEcmrmxAzcYcQpLieK4F1tSPuYsJK/UMLT0tBzI2LfJ+mNPc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="458828436"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="458828436"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 06:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="842940305"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="842940305"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2023 06:49:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBye8-000FST-2u;
	Sat, 09 Dec 2023 14:49:36 +0000
Date: Sat, 9 Dec 2023 22:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [brauner-vfs:vfs.rw 21/24] include/linux/splice.h:97:30: error: use
 of undeclared identifier 'MAX_RW_COUNT'
Message-ID: <202312092257.HL3kzJ9S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.rw
head:   e5c56a33657bd9cc84d7562961b521bf6fe22e8f
commit: 4955c918c9e56c1f878359df6e71428d9d8ab2fa [21/24] fs: use splice_copy_file_range() inline helper
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231209/202312092257.HL3kzJ9S-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092257.HL3kzJ9S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092257.HL3kzJ9S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/tls/tls_sw.c:42:
>> include/linux/splice.h:97:30: error: use of undeclared identifier 'MAX_RW_COUNT'
                                         min_t(size_t, len, MAX_RW_COUNT));
                                                            ^
   1 error generated.


vim +/MAX_RW_COUNT +97 include/linux/splice.h

    65	
    66	typedef int (splice_actor)(struct pipe_inode_info *, struct pipe_buffer *,
    67				   struct splice_desc *);
    68	typedef int (splice_direct_actor)(struct pipe_inode_info *,
    69					  struct splice_desc *);
    70	
    71	extern ssize_t splice_from_pipe(struct pipe_inode_info *, struct file *,
    72					loff_t *, size_t, unsigned int,
    73					splice_actor *);
    74	extern ssize_t __splice_from_pipe(struct pipe_inode_info *,
    75					  struct splice_desc *, splice_actor *);
    76	extern ssize_t splice_to_pipe(struct pipe_inode_info *,
    77				      struct splice_pipe_desc *);
    78	extern ssize_t add_to_pipe(struct pipe_inode_info *,
    79				      struct pipe_buffer *);
    80	long vfs_splice_read(struct file *in, loff_t *ppos,
    81			     struct pipe_inode_info *pipe, size_t len,
    82			     unsigned int flags);
    83	ssize_t splice_direct_to_actor(struct file *file, struct splice_desc *sd,
    84				       splice_direct_actor *actor);
    85	long do_splice(struct file *in, loff_t *off_in, struct file *out,
    86		       loff_t *off_out, size_t len, unsigned int flags);
    87	long do_splice_direct(struct file *in, loff_t *ppos, struct file *out,
    88			      loff_t *opos, size_t len, unsigned int flags);
    89	long splice_file_range(struct file *in, loff_t *ppos, struct file *out,
    90			       loff_t *opos, size_t len);
    91	
    92	static inline long splice_copy_file_range(struct file *in, loff_t pos_in,
    93						  struct file *out, loff_t pos_out,
    94						  size_t len)
    95	{
    96		return splice_file_range(in, &pos_in, out, &pos_out,
  > 97					      min_t(size_t, len, MAX_RW_COUNT));
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
