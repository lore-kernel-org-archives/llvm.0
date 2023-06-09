Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66A749F;
	Fri,  9 Jun 2023 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686295370; x=1717831370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBsBJdtMQ9UhkTQdiUEcPWh5fpbO0C0Q2JNMpePK4k8=;
  b=k7pySi/p1SDriJuTl5stTRVECI17qKzs//Kk3u4dJ6szGNoHVZjhO6iT
   j7O9v/8qwOtHBXn8orQz/GuhbmlKOurdDx7Wc0KA78dZLQ8vQzBywc3J/
   sRkMlsHOg4rHKQCAx8hck3PWIu1/GxQReE1FsLyZm5dCiDGOYUcjpTF/7
   jOTxYzHL3M7TScd/YwYBuY1jLuQ45rJogo7gxSAyNTeTTyqJQN8B0ghgX
   mN32BpDaHg6Eg4VaCj271w0HzAhIQgbTCcEokRpmM2AcIz76EvYpVeyCL
   n2UzdjU7z7JcjsAH/Yp7jtff6pX0mgnvA+ROwJf4nPzAyygcBzbz6qYQz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356428308"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="356428308"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 00:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="957042612"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="957042612"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2023 00:22:48 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7WSN-0008lU-2B;
	Fri, 09 Jun 2023 07:22:47 +0000
Date: Fri, 9 Jun 2023 15:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v1-devel-v22 31/33]
 security/integrity/evm/evm_main.c:930:5: warning: no previous prototype for
 function 'evm_inode_init_security'
Message-ID: <202306091504.sUIuq27R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v1-devel-v22
head:   19f1c2b9463d5b57969d00781cbcb241ce0f2695
commit: 01aafd0066729d05a43f2bfcbfb2064ad9f37fa2 [31/33] evm: Move to LSM infrastructure
config: x86_64-randconfig-x065-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091504.sUIuq27R-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/robertosassu/linux/commit/01aafd0066729d05a43f2bfcbfb2064ad9f37fa2
        git remote add robertosassu https://github.com/robertosassu/linux
        git fetch --no-tags robertosassu ima-evm-lsms-v1-devel-v22
        git checkout 01aafd0066729d05a43f2bfcbfb2064ad9f37fa2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash security/integrity/evm/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091504.sUIuq27R-lkp@intel.com/

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
3999acefa4cce3 Roberto Sassu         2023-05-23 @930  int evm_inode_init_security(struct inode *inode, struct inode *dir,
3999acefa4cce3 Roberto Sassu         2023-05-23  931  			    const struct qstr *qstr, struct xattr *xattrs,
3999acefa4cce3 Roberto Sassu         2023-05-23  932  			    int *xattr_count)
cb72318069d5e9 Mimi Zohar            2011-03-09  933  {
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  934  	struct evm_xattr *xattr_data;
e44ab3806f0ba8 Roberto Sassu         2023-03-31  935  	struct xattr *xattr, *evm_xattr;
e44ab3806f0ba8 Roberto Sassu         2023-03-31  936  	bool evm_protected_xattrs = false;
cb72318069d5e9 Mimi Zohar            2011-03-09  937  	int rc;
cb72318069d5e9 Mimi Zohar            2011-03-09  938  
e44ab3806f0ba8 Roberto Sassu         2023-03-31  939  	if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs)
e44ab3806f0ba8 Roberto Sassu         2023-03-31  940  		return 0;
e44ab3806f0ba8 Roberto Sassu         2023-03-31  941  
e44ab3806f0ba8 Roberto Sassu         2023-03-31  942  	/*
e44ab3806f0ba8 Roberto Sassu         2023-03-31  943  	 * security_inode_init_security() makes sure that the xattrs array is
e44ab3806f0ba8 Roberto Sassu         2023-03-31  944  	 * contiguous, there is enough space for security.evm, and that there is
e44ab3806f0ba8 Roberto Sassu         2023-03-31  945  	 * a terminator at the end of the array.
e44ab3806f0ba8 Roberto Sassu         2023-03-31  946  	 */
e44ab3806f0ba8 Roberto Sassu         2023-03-31  947  	for (xattr = xattrs; xattr->name != NULL; xattr++) {
e44ab3806f0ba8 Roberto Sassu         2023-03-31  948  		if (evm_protected_xattr(xattr->name))
e44ab3806f0ba8 Roberto Sassu         2023-03-31  949  			evm_protected_xattrs = true;
e44ab3806f0ba8 Roberto Sassu         2023-03-31  950  	}
e44ab3806f0ba8 Roberto Sassu         2023-03-31  951  
e44ab3806f0ba8 Roberto Sassu         2023-03-31  952  	/* EVM xattr not needed. */
e44ab3806f0ba8 Roberto Sassu         2023-03-31  953  	if (!evm_protected_xattrs)
5a4730ba9517cf Mimi Zohar            2011-08-11  954  		return 0;
cb72318069d5e9 Mimi Zohar            2011-03-09  955  
3999acefa4cce3 Roberto Sassu         2023-05-23  956  	evm_xattr = lsm_get_xattr_slot(xattrs, xattr_count);
e44ab3806f0ba8 Roberto Sassu         2023-03-31  957  	/*
e44ab3806f0ba8 Roberto Sassu         2023-03-31  958  	 * Array terminator (xattr name = NULL) must be the first non-filled
e44ab3806f0ba8 Roberto Sassu         2023-03-31  959  	 * xattr slot.
e44ab3806f0ba8 Roberto Sassu         2023-03-31  960  	 */
e44ab3806f0ba8 Roberto Sassu         2023-03-31  961  	WARN_ONCE(evm_xattr != xattr,
e44ab3806f0ba8 Roberto Sassu         2023-03-31  962  		  "%s: xattrs terminator is not the first non-filled slot\n",
e44ab3806f0ba8 Roberto Sassu         2023-03-31  963  		  __func__);
3999acefa4cce3 Roberto Sassu         2023-05-23  964  
cb72318069d5e9 Mimi Zohar            2011-03-09  965  	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
cb72318069d5e9 Mimi Zohar            2011-03-09  966  	if (!xattr_data)
cb72318069d5e9 Mimi Zohar            2011-03-09  967  		return -ENOMEM;
cb72318069d5e9 Mimi Zohar            2011-03-09  968  
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  969  	xattr_data->data.type = EVM_XATTR_HMAC;
3999acefa4cce3 Roberto Sassu         2023-05-23  970  	rc = evm_init_hmac(inode, xattrs, xattr_data->digest);
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
:::::: 3999acefa4cce39fc8f6b8ffddc1706ff4faf369 evm: Align evm_inode_init_security() definition with LSM infrastructure

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Roberto Sassu <roberto.sassu@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
