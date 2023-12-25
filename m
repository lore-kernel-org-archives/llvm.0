Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C9D10FE;
	Mon, 25 Dec 2023 06:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKMtIqV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703484624; x=1735020624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uI57m9mGCzrlUk6+DSJtNVJaVoQP0VoLGQPuVRI2u40=;
  b=XKMtIqV2SOXmm1L4ZhoD+Q6VXwF5IwlnvztgTcXMYhYhjnxz04mEfHI1
   Jl72qUhX45FF6278OogANDJYbC6jDsOXrNSFAGEsPV1hyFu0wM9ZzvTZB
   GbqX8bJH1/b6ClzNp0cPr13BfhN+TqViFf4HU8XN2BXCcDhAQxowBTZs6
   YHBKn6YV+37tOhm8b8mgQypAZ/UyV3dZgCm+pzF0APPMCrFjhEQaz44G1
   SZ5Vy/z1l30iYksRcQz1PQCKlq5RN2PDvpGBejl3N1QfHVGTBQTydKtC2
   EYoaID47WUfoV4ZMg7t/kwQiihqtZI6opmDLVAFZkeIjFgeD4jLx9kpp9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="376409355"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="376409355"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 22:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="921285939"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="921285939"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2023 22:10:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHe8f-000D1I-38;
	Mon, 25 Dec 2023 06:09:03 +0000
Date: Mon, 25 Dec 2023 14:05:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-netfs 50/53] fs/smb/client/inode.c:38:48: error:
 too few arguments to function call, expected 3, have 2
Message-ID: <202312251331.WbrilXdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   4eaec420b0b0b7fab9042432c8a3aaf665d6052f
commit: 89290190eb6aafd8831b148797ec5f781ed1c596 [50/53] cifs: Cut over to using netfslib
config: i386-buildonly-randconfig-002-20231225 (https://download.01.org/0day-ci/archive/20231225/202312251331.WbrilXdF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312251331.WbrilXdF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312251331.WbrilXdF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/inode.c:38:48: error: too few arguments to function call, expected 3, have 2
           netfs_inode_init(&cifs_i->netfs, &cifs_req_ops);
           ~~~~~~~~~~~~~~~~                              ^
   include/linux/netfs.h:465:20: note: 'netfs_inode_init' declared here
   static inline void netfs_inode_init(struct netfs_inode *ctx,
                      ^
   1 error generated.


vim +38 fs/smb/client/inode.c

    29	
    30	/*
    31	 * Set parameters for the netfs library
    32	 */
    33	static void cifs_set_netfs_context(struct inode *inode)
    34	{
    35		struct cifsInodeInfo *cifs_i = CIFS_I(inode);
    36		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
    37	
  > 38		netfs_inode_init(&cifs_i->netfs, &cifs_req_ops);
    39		if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_STRICT_IO)
    40			__set_bit(NETFS_ICTX_WRITETHROUGH, &cifs_i->netfs.flags);
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
