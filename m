Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64DC3BE629;
	Fri, 24 Apr 2026 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031531; cv=none; b=mq9vUOqhQj4cETb51syI8DagyeGtYai9ckLagGFAE+ZGyEiWMuYx49W3xUqRPa5zAAKTiBPTwhjA76IqXjXH3PhdxDAWiaP5Y8vaKKyszJE0cB1Je8ixZ4Q3fGCANRdAEJztt86Mi2HEN/uZtiXJz9iCmuhFlu1cffMd7ivbZUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031531; c=relaxed/simple;
	bh=IzJXx+zx6j4NX28LafTopFwufgCBd4WHTlSHKqEQ2gA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uqpm+UM3S9Wtvli6ZyHzIOT1da/GJtFDe2h8q7X6ST35BYTmNZy4OkPQEbDBZ9aObDZyIj4omz1nvDPoVCqmn8oEtcYjCDBqF6f7UhqHLMGZyRPmTbaXEKslI65ZM7isyv4NiIWsmT2ATr5mPWK2QVpeWlhCvDnubbRyfR76h7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l17Y1Ygb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l17Y1Ygb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777031529; x=1808567529;
  h=date:from:to:cc:subject:message-id;
  bh=IzJXx+zx6j4NX28LafTopFwufgCBd4WHTlSHKqEQ2gA=;
  b=l17Y1Ygb92vU+YkLkYNnJC58CYTX5rlHCJg8FPWpd945NPozJhALubc5
   cu6OXahsMsaBsBBMgcwt2BiudutkGsa4X9HwmzuMAv2Pv96FMrPOdlWTN
   HOFT20uJxTYH2g9n3Le2Wlp2obEiD2tRiK5plFqM/CWuGy4nEodS3EI8n
   qFU1zH9CwiBYXwJmvKdVPRhBFwhUrQ2sz0eab83dRxyTxY0BogkHTtizq
   Mu4oAIE95jBVGz15sadchOEcJYx+HhmcQsdp6fE0RF64k0RnviMkf0dRK
   RejujyhsDZk7nySx35cXMJA/D8N6mtn3x2H06AscHzJK96wLFz8if7oy1
   g==;
X-CSE-ConnectionGUID: WUNd3QcOR/SEJG/F+UWwlg==
X-CSE-MsgGUID: DWzl5kafQKisctNQ5JN7nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="103471711"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="103471711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:52:09 -0700
X-CSE-ConnectionGUID: gqpA8DrEQcCn9jrk0KscCA==
X-CSE-MsgGUID: Whx59wDnR/G5yuWXGwBxKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="256229690"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Apr 2026 04:52:07 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGF4n-000000005dh-1sLQ;
	Fri, 24 Apr 2026 11:52:05 +0000
Date: Fri, 24 Apr 2026 19:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 39/71] fs/rpdfs/dir.c:188:6:
 warning: variable 'inode' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202604241900.EP5N8dLy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   4c70e08d984665a04c3879b17ee74470846a3b47
commit: babd2186d11672777dfa3e80a446f081227ddf7f [39/71] rpdfs: access dirents with block handles
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260424/202604241900.EP5N8dLy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241900.EP5N8dLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241900.EP5N8dLy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/rpdfs/dir.c:188:6: warning: variable 'inode' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     188 |         if (ret < 0)
         |             ^~~~~~~
   fs/rpdfs/dir.c:205:24: note: uninitialized use occurs here
     205 |         return d_splice_alias(inode, dentry);
         |                               ^~~~~
   fs/rpdfs/dir.c:188:2: note: remove the 'if' if its condition is always false
     188 |         if (ret < 0)
         |         ^~~~~~~~~~~~
     189 |                 goto out;
         |                 ~~~~~~~~
   fs/rpdfs/dir.c:177:21: note: initialize the variable 'inode' to silence this warning
     177 |         struct inode *inode;
         |                            ^
         |                             = NULL
   1 warning generated.


vim +188 fs/rpdfs/dir.c

   170	
   171	static struct dentry *rpdfs_lookup(struct inode *dir, struct dentry *dentry, unsigned int flags)
   172	{
   173		struct super_block *sb = dir->i_sb;
   174		struct rpdfs_fs_info *rfi = RPDFS_INODE_FS(dir);
   175		struct rpdfs_block_handle *hnd = NULL;
   176		struct dent_cb_args da;
   177		struct inode *inode;
   178		int ret;
   179	
   180		if (dentry->d_name.len > RPDFS_NAME_MAX) {
   181			inode = ERR_PTR(-ENAMETOOLONG);
   182			goto out;
   183		}
   184	
   185		init_dent_cb_args(&da, dentry, NULL);
   186	
   187		ret = rpdfs_inode_acquire(rfi, dir, &hnd, 0);
 > 188		if (ret < 0)
   189			goto out;
   190	
   191		ret = lookup_entry(rfi, dir, &da);
   192		rpdfs_block_release(rfi, &hnd);
   193		if (ret < 0 && ret != -ENOENT) {
   194			inode = ERR_PTR(ret);
   195			goto out;
   196		}
   197	
   198		if (ret == -ENOENT)
   199			inode = NULL;
   200		else
   201			inode = rpdfs_iget(sb, &da.dent.ig);
   202	
   203	out:
   204		/* d_splice_alias passes through ERR_PTR inodes */
   205		return d_splice_alias(inode, dentry);
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
