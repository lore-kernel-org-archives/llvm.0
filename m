Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DF51846;
	Thu, 31 Aug 2023 05:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693460433; x=1724996433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHvOXGkPw3yE4XyDCe8NvC7RTlByibkXrEbveLr96Xk=;
  b=C9jeae/z/cBI1MYicpV+0ERafHUlCmuTxndsIcrFx2dRDSnzpitVcyxG
   Nf6tTKYkPnAbJm12W5iKS0jITevRGSK+XbeQruvblp1NuXTdU2GS9pBx5
   rZ4WTIZh64m8OrZ/1skn24OiI2uX7HB2Nv+N0Uf4DejjiZC8+cq6NTZNv
   oKMPycN81b9nVgXWjfXYi7gE7UcS2X5X1CChcmAtTdsrs1+uiX3OI9ebf
   gqvypIYk8msn9craX1h75935Tc40FnCMPr9v7TIE2KLHSa7gJbZrqe9Wa
   wXCIFDNnkQsIeI3WY+lvAzJypyX6Rz/XqeynICQtrz8XtgdvJ2uubVSzx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="462198287"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="462198287"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="804803931"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="804803931"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Aug 2023 22:40:30 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbaPt-000Ai3-2l;
	Thu, 31 Aug 2023 05:40:29 +0000
Date: Thu, 31 Aug 2023 13:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v2-devel-v6 23/25]
 security/integrity/evm/evm_main.c:930:5: warning: no previous prototype for
 function 'evm_inode_init_security'
Message-ID: <202308311311.GtN4xOFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v2-devel-v6
head:   8d3db5840032b2f14a363ad273bc13baeaec3cc5
commit: 07adc69271289ead1d641de66c78e118ce1e4672 [23/25] evm: Move to LSM infrastructure
config: hexagon-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311311.GtN4xOFb-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311311.GtN4xOFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311311.GtN4xOFb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/evm/evm_main.c:930:5: warning: no previous prototype for function 'evm_inode_init_security' [-Wmissing-prototypes]
   int evm_inode_init_security(struct inode *inode, struct inode *dir,
       ^
   security/integrity/evm/evm_main.c:930:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int evm_inode_init_security(struct inode *inode, struct inode *dir,
   ^
   static 
   1 warning generated.


vim +/evm_inode_init_security +930 security/integrity/evm/evm_main.c

66dbc325afcef9 Mimi Zohar            2011-03-15  926  
cb72318069d5e9 Mimi Zohar            2011-03-09  927  /*
9eea2904292c2d Roberto Sassu         2021-05-14  928   * evm_inode_init_security - initializes security.evm HMAC value
cb72318069d5e9 Mimi Zohar            2011-03-09  929   */
6db7d1dee80039 Roberto Sassu         2023-06-10 @930  int evm_inode_init_security(struct inode *inode, struct inode *dir,
6db7d1dee80039 Roberto Sassu         2023-06-10  931  			    const struct qstr *qstr, struct xattr *xattrs,
6db7d1dee80039 Roberto Sassu         2023-06-10  932  			    int *xattr_count)
cb72318069d5e9 Mimi Zohar            2011-03-09  933  {
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  934  	struct evm_xattr *xattr_data;
c31288e56c1a7b Roberto Sassu         2023-06-10  935  	struct xattr *xattr, *evm_xattr;
c31288e56c1a7b Roberto Sassu         2023-06-10  936  	bool evm_protected_xattrs = false;
cb72318069d5e9 Mimi Zohar            2011-03-09  937  	int rc;
cb72318069d5e9 Mimi Zohar            2011-03-09  938  
c31288e56c1a7b Roberto Sassu         2023-06-10  939  	if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs)
c31288e56c1a7b Roberto Sassu         2023-06-10  940  		return 0;
c31288e56c1a7b Roberto Sassu         2023-06-10  941  
c31288e56c1a7b Roberto Sassu         2023-06-10  942  	/*
c31288e56c1a7b Roberto Sassu         2023-06-10  943  	 * security_inode_init_security() makes sure that the xattrs array is
c31288e56c1a7b Roberto Sassu         2023-06-10  944  	 * contiguous, there is enough space for security.evm, and that there is
c31288e56c1a7b Roberto Sassu         2023-06-10  945  	 * a terminator at the end of the array.
c31288e56c1a7b Roberto Sassu         2023-06-10  946  	 */
c31288e56c1a7b Roberto Sassu         2023-06-10  947  	for (xattr = xattrs; xattr->name; xattr++) {
c31288e56c1a7b Roberto Sassu         2023-06-10  948  		if (evm_protected_xattr(xattr->name))
c31288e56c1a7b Roberto Sassu         2023-06-10  949  			evm_protected_xattrs = true;
c31288e56c1a7b Roberto Sassu         2023-06-10  950  	}
c31288e56c1a7b Roberto Sassu         2023-06-10  951  
c31288e56c1a7b Roberto Sassu         2023-06-10  952  	/* EVM xattr not needed. */
c31288e56c1a7b Roberto Sassu         2023-06-10  953  	if (!evm_protected_xattrs)
5a4730ba9517cf Mimi Zohar            2011-08-11  954  		return 0;
cb72318069d5e9 Mimi Zohar            2011-03-09  955  
6db7d1dee80039 Roberto Sassu         2023-06-10  956  	evm_xattr = lsm_get_xattr_slot(xattrs, xattr_count);
c31288e56c1a7b Roberto Sassu         2023-06-10  957  	/*
c31288e56c1a7b Roberto Sassu         2023-06-10  958  	 * Array terminator (xattr name = NULL) must be the first non-filled
c31288e56c1a7b Roberto Sassu         2023-06-10  959  	 * xattr slot.
c31288e56c1a7b Roberto Sassu         2023-06-10  960  	 */
c31288e56c1a7b Roberto Sassu         2023-06-10  961  	WARN_ONCE(evm_xattr != xattr,
c31288e56c1a7b Roberto Sassu         2023-06-10  962  		  "%s: xattrs terminator is not the first non-filled slot\n",
c31288e56c1a7b Roberto Sassu         2023-06-10  963  		  __func__);
6db7d1dee80039 Roberto Sassu         2023-06-10  964  
cb72318069d5e9 Mimi Zohar            2011-03-09  965  	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
cb72318069d5e9 Mimi Zohar            2011-03-09  966  	if (!xattr_data)
cb72318069d5e9 Mimi Zohar            2011-03-09  967  		return -ENOMEM;
cb72318069d5e9 Mimi Zohar            2011-03-09  968  
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  969  	xattr_data->data.type = EVM_XATTR_HMAC;
6db7d1dee80039 Roberto Sassu         2023-06-10  970  	rc = evm_init_hmac(inode, xattrs, xattr_data->digest);
cb72318069d5e9 Mimi Zohar            2011-03-09  971  	if (rc < 0)
cb72318069d5e9 Mimi Zohar            2011-03-09  972  		goto out;
cb72318069d5e9 Mimi Zohar            2011-03-09  973  
cb72318069d5e9 Mimi Zohar            2011-03-09  974  	evm_xattr->value = xattr_data;
cb72318069d5e9 Mimi Zohar            2011-03-09  975  	evm_xattr->value_len = sizeof(*xattr_data);
9548906b2bb7ff Tetsuo Handa          2013-07-25  976  	evm_xattr->name = XATTR_EVM_SUFFIX;
cb72318069d5e9 Mimi Zohar            2011-03-09  977  	return 0;
cb72318069d5e9 Mimi Zohar            2011-03-09  978  out:
cb72318069d5e9 Mimi Zohar            2011-03-09  979  	kfree(xattr_data);
cb72318069d5e9 Mimi Zohar            2011-03-09  980  	return rc;
cb72318069d5e9 Mimi Zohar            2011-03-09  981  }
cb72318069d5e9 Mimi Zohar            2011-03-09  982  EXPORT_SYMBOL_GPL(evm_inode_init_security);
cb72318069d5e9 Mimi Zohar            2011-03-09  983  

:::::: The code at line 930 was first introduced by commit
:::::: 6db7d1dee8003921b353d7e613471fe8995f46b5 evm: Align evm_inode_init_security() definition with LSM infrastructure

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
