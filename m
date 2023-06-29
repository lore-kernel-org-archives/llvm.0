Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8962210784;
	Thu, 29 Jun 2023 23:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688081284; x=1719617284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tejttgQ4EyBz9Bxvk+OL8J2809bCqrZ4OrLeqzrRDt8=;
  b=YIsMUe+9z4MqH92EgM2i886hs8Nf75kiFhWkRZejXQ1bQyVD61hBPTtT
   RqGg29lvZiqewgeFUXVftXass8JUTXiHD7BlrCq/otvg4lz/xcrPYkaop
   icKyuQlmOvzjWmFTu4UGL7YLzAbjGl94kn7dvy1aZDZveh3O/0rwZKAdP
   DRg8PIVlqK3yG1nKfuVHsfh4HKWZW9pP09J/TQ6MoWqK8BzgrGDOUafOY
   /S0NPrbRQATF2mM0tLDYNmefZ3hNvW3YUjV3zOfGEbGOqoIeBD/rXogEE
   5H3HVT3+xN9zHxqgA6d1Tg6bK5v0JiCe+QmMOUXVMoAZyzbybHLCgMEtE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352081498"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="352081498"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 16:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="717594220"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="717594220"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Jun 2023 16:28:02 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF13R-000EUb-34;
	Thu, 29 Jun 2023 23:28:01 +0000
Date: Fri, 30 Jun 2023 07:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v2-devel-v5 29/31]
 security/integrity/evm/evm_main.c:928:5: warning: no previous prototype for
 function 'evm_inode_init_security'
Message-ID: <202306300758.36V96Hbv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v2-devel-v5
head:   bfb2bf0637de1448be0ddf96352a705a2f9140ac
commit: f09f34b28a814ba2d9819e3b50dfac00c06d9020 [29/31] evm: Move to LSM infrastructure
config: x86_64-randconfig-x004-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300758.36V96Hbv-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300758.36V96Hbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300758.36V96Hbv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/evm/evm_main.c:928:5: warning: no previous prototype for function 'evm_inode_init_security' [-Wmissing-prototypes]
   int evm_inode_init_security(struct inode *inode, struct inode *dir,
       ^
   security/integrity/evm/evm_main.c:928:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int evm_inode_init_security(struct inode *inode, struct inode *dir,
   ^
   static 
   1 warning generated.


vim +/evm_inode_init_security +928 security/integrity/evm/evm_main.c

66dbc325afcef9 Mimi Zohar            2011-03-15  924  
cb72318069d5e9 Mimi Zohar            2011-03-09  925  /*
9eea2904292c2d Roberto Sassu         2021-05-14  926   * evm_inode_init_security - initializes security.evm HMAC value
cb72318069d5e9 Mimi Zohar            2011-03-09  927   */
f48c517832579b Roberto Sassu         2023-05-23 @928  int evm_inode_init_security(struct inode *inode, struct inode *dir,
f48c517832579b Roberto Sassu         2023-05-23  929  			    const struct qstr *qstr, struct xattr *xattrs,
f48c517832579b Roberto Sassu         2023-05-23  930  			    int *xattr_count)
cb72318069d5e9 Mimi Zohar            2011-03-09  931  {
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  932  	struct evm_xattr *xattr_data;
36218195f215df Roberto Sassu         2023-03-31  933  	struct xattr *xattr, *evm_xattr;
36218195f215df Roberto Sassu         2023-03-31  934  	bool evm_protected_xattrs = false;
cb72318069d5e9 Mimi Zohar            2011-03-09  935  	int rc;
cb72318069d5e9 Mimi Zohar            2011-03-09  936  
36218195f215df Roberto Sassu         2023-03-31  937  	if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs)
36218195f215df Roberto Sassu         2023-03-31  938  		return 0;
36218195f215df Roberto Sassu         2023-03-31  939  
36218195f215df Roberto Sassu         2023-03-31  940  	/*
36218195f215df Roberto Sassu         2023-03-31  941  	 * security_inode_init_security() makes sure that the xattrs array is
36218195f215df Roberto Sassu         2023-03-31  942  	 * contiguous, there is enough space for security.evm, and that there is
36218195f215df Roberto Sassu         2023-03-31  943  	 * a terminator at the end of the array.
36218195f215df Roberto Sassu         2023-03-31  944  	 */
36218195f215df Roberto Sassu         2023-03-31  945  	for (xattr = xattrs; xattr->name; xattr++) {
36218195f215df Roberto Sassu         2023-03-31  946  		if (evm_protected_xattr(xattr->name))
36218195f215df Roberto Sassu         2023-03-31  947  			evm_protected_xattrs = true;
36218195f215df Roberto Sassu         2023-03-31  948  	}
36218195f215df Roberto Sassu         2023-03-31  949  
36218195f215df Roberto Sassu         2023-03-31  950  	/* EVM xattr not needed. */
36218195f215df Roberto Sassu         2023-03-31  951  	if (!evm_protected_xattrs)
5a4730ba9517cf Mimi Zohar            2011-08-11  952  		return 0;
cb72318069d5e9 Mimi Zohar            2011-03-09  953  
f48c517832579b Roberto Sassu         2023-05-23  954  	evm_xattr = lsm_get_xattr_slot(xattrs, xattr_count);
36218195f215df Roberto Sassu         2023-03-31  955  	/*
36218195f215df Roberto Sassu         2023-03-31  956  	 * Array terminator (xattr name = NULL) must be the first non-filled
36218195f215df Roberto Sassu         2023-03-31  957  	 * xattr slot.
36218195f215df Roberto Sassu         2023-03-31  958  	 */
36218195f215df Roberto Sassu         2023-03-31  959  	WARN_ONCE(evm_xattr != xattr,
36218195f215df Roberto Sassu         2023-03-31  960  		  "%s: xattrs terminator is not the first non-filled slot\n",
36218195f215df Roberto Sassu         2023-03-31  961  		  __func__);
f48c517832579b Roberto Sassu         2023-05-23  962  
cb72318069d5e9 Mimi Zohar            2011-03-09  963  	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
cb72318069d5e9 Mimi Zohar            2011-03-09  964  	if (!xattr_data)
cb72318069d5e9 Mimi Zohar            2011-03-09  965  		return -ENOMEM;
cb72318069d5e9 Mimi Zohar            2011-03-09  966  
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  967  	xattr_data->data.type = EVM_XATTR_HMAC;
f48c517832579b Roberto Sassu         2023-05-23  968  	rc = evm_init_hmac(inode, xattrs, xattr_data->digest);
cb72318069d5e9 Mimi Zohar            2011-03-09  969  	if (rc < 0)
cb72318069d5e9 Mimi Zohar            2011-03-09  970  		goto out;
cb72318069d5e9 Mimi Zohar            2011-03-09  971  
cb72318069d5e9 Mimi Zohar            2011-03-09  972  	evm_xattr->value = xattr_data;
cb72318069d5e9 Mimi Zohar            2011-03-09  973  	evm_xattr->value_len = sizeof(*xattr_data);
9548906b2bb7ff Tetsuo Handa          2013-07-25  974  	evm_xattr->name = XATTR_EVM_SUFFIX;
cb72318069d5e9 Mimi Zohar            2011-03-09  975  	return 0;
cb72318069d5e9 Mimi Zohar            2011-03-09  976  out:
cb72318069d5e9 Mimi Zohar            2011-03-09  977  	kfree(xattr_data);
cb72318069d5e9 Mimi Zohar            2011-03-09  978  	return rc;
cb72318069d5e9 Mimi Zohar            2011-03-09  979  }
cb72318069d5e9 Mimi Zohar            2011-03-09  980  EXPORT_SYMBOL_GPL(evm_inode_init_security);
cb72318069d5e9 Mimi Zohar            2011-03-09  981  

:::::: The code at line 928 was first introduced by commit
:::::: f48c517832579b520e79af7f9194fd5538f23d98 evm: Align evm_inode_init_security() definition with LSM infrastructure

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Roberto Sassu <roberto.sassu@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
