Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5230303A01;
	Mon, 17 Nov 2025 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763398590; cv=none; b=FmKY2AT3nHYFgdyHE10fBpCy9y9nHm6MurNFyPwotK9pUYaF4BG9q9fdNQkP/QQtO7odt1SR6SFolC+tj5tgnp+xHbWieU56G5cTgcr/XjNQ4ZZ5U/lm4zqWlU5xcHpdS3TdOtV6r20//R/9osngBFvz3Tplunkz+Dl946rPHPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763398590; c=relaxed/simple;
	bh=5WDDW0Wxpl4WiQeywrlmv7T4eoMTcPwwraPFF1Rj9Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PeOG7ZDbrOkX7AqmMVGH+JJjU4wBOKuP/eDohGCDXMw0gZJrJF0goBVh6OA+hsE9gWJayxVeR4FY9aewTyPMW6em2ZB+4cJAEY5l80MklIdhvlnu6j4/YiOwBvH7DUV5ZTvF4TX5PetNu4Kax/tbscfS3fn9UhLYqnrzI9xX+E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdUNsjj0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdUNsjj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763398588; x=1794934588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WDDW0Wxpl4WiQeywrlmv7T4eoMTcPwwraPFF1Rj9Yk=;
  b=cdUNsjj06F+4I6ngMkt/VJYnIXO2Czvd+gF/0Tj/wz6gx5ZM4btSbJ/O
   FRs3HDryiw/UZHHWVL4tTYpEBNxPWVPgWCrIqdn7OhemHWJRmmFZhaGIY
   D8VXYTFs6f7H1HXwQLUO//hG4Ij9ZO3rFXYHqT6lX/i5lmofArEWKOx90
   AXqDm6L3JWcG5ePq06f6mXyQYGe+OuDUSp99KzafnQUyCeWNlT6VFIirB
   Rvseko1/SheomVzHOUmciUIQceL4m8DDYcFQhFKNxPcBNGMO2yyKM3Qqj
   Tl0hBDUzIOtySYsqMbEKXnJ2ohzeUiJ7h8zvdKOI7KP5J0kyga79E8PpK
   w==;
X-CSE-ConnectionGUID: haSWQnsPRfCLricFbyq4sw==
X-CSE-MsgGUID: yNlnQ1d0SQ2n0eKYCv9WOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65287923"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="65287923"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 08:56:27 -0800
X-CSE-ConnectionGUID: MY2qQDTJRB++zX1eQb48nQ==
X-CSE-MsgGUID: i3EyMGDOTb609J8fm+BUhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195634784"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2025 08:56:26 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL2Wd-0000qZ-0q;
	Mon, 17 Nov 2025 16:56:23 +0000
Date: Tue, 18 Nov 2025 00:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 51/55] fs/nfsd/nfs3proc.c:769:1: warning: stack
 frame size (1056) exceeds limit (1024) in 'nfsd3_proc_link'
Message-ID: <202511180039.lMDodFzm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   6158ace3b663c4e9ab201f2cc644f4290fa30905
commit: 1a33fc0e36a7ab0f77f8a72d3ba55b9ba5f1ad9b [51/55] NFSD: Use xdrgen XDR functions for the NFSv3 LINK procedure
config: arm-footbridge_defconfig (https://download.01.org/0day-ci/archive/20251118/202511180039.lMDodFzm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180039.lMDodFzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180039.lMDodFzm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs3proc.c:769:1: warning: stack frame size (1056) exceeds limit (1024) in 'nfsd3_proc_link' [-Wframe-larger-than]
     769 | nfsd3_proc_link(struct svc_rqst *rqstp)
         | ^
   1 warning generated.


vim +/nfsd3_proc_link +769 fs/nfsd/nfs3proc.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  767  
7111c66e4e7058 Al Viro           2006-10-19  768  static __be32
a6beb73272b4c0 Christoph Hellwig 2017-05-08 @769  nfsd3_proc_link(struct svc_rqst *rqstp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  770  {
1a33fc0e36a7ab Chuck Lever       2025-10-30  771  	struct LINK3args *argp = rqstp->rq_argp;
1a33fc0e36a7ab Chuck Lever       2025-10-30  772  	struct LINK3res *resp = rqstp->rq_resp;
1a33fc0e36a7ab Chuck Lever       2025-10-30  773  	struct svc_fh ffh, tfh;
1a33fc0e36a7ab Chuck Lever       2025-10-30  774  	__be32 status;
^1da177e4c3f41 Linus Torvalds    2005-04-16  775  
1a33fc0e36a7ab Chuck Lever       2025-10-30  776  	nfsd3_fh3_to_svc_fh(&ffh, &argp->file);
1a33fc0e36a7ab Chuck Lever       2025-10-30  777  	nfsd3_fh3_to_svc_fh(&tfh, &argp->link.dir);
1a33fc0e36a7ab Chuck Lever       2025-10-30  778  
1a33fc0e36a7ab Chuck Lever       2025-10-30  779  	status = nfsd_link(rqstp, &tfh,
1a33fc0e36a7ab Chuck Lever       2025-10-30  780  			   (char *)argp->link.name.data,
1a33fc0e36a7ab Chuck Lever       2025-10-30  781  			   argp->link.name.len, &ffh);
1a33fc0e36a7ab Chuck Lever       2025-10-30  782  
1a33fc0e36a7ab Chuck Lever       2025-10-30  783  	if (status == nfs_ok) {
1a33fc0e36a7ab Chuck Lever       2025-10-30  784  		resp->status = nfs_ok;
1a33fc0e36a7ab Chuck Lever       2025-10-30  785  		nfsd3_fill_post_op_attr(rqstp, &resp->u.resok.file_attributes,
1a33fc0e36a7ab Chuck Lever       2025-10-30  786  					&ffh);
1a33fc0e36a7ab Chuck Lever       2025-10-30  787  		nfsd3_fill_wcc_data(rqstp, &resp->u.resok.linkdir_wcc, &tfh);
1a33fc0e36a7ab Chuck Lever       2025-10-30  788  	} else {
1a33fc0e36a7ab Chuck Lever       2025-10-30  789  		resp->status = nfsd3_map_status(status);
1a33fc0e36a7ab Chuck Lever       2025-10-30  790  		nfsd3_fill_post_op_attr(rqstp,
1a33fc0e36a7ab Chuck Lever       2025-10-30  791  					&resp->u.resfail.file_attributes,
1a33fc0e36a7ab Chuck Lever       2025-10-30  792  					&ffh);
1a33fc0e36a7ab Chuck Lever       2025-10-30  793  		nfsd3_fill_wcc_data(rqstp, &resp->u.resfail.linkdir_wcc, &tfh);
1a33fc0e36a7ab Chuck Lever       2025-10-30  794  	}
1a33fc0e36a7ab Chuck Lever       2025-10-30  795  
1a33fc0e36a7ab Chuck Lever       2025-10-30  796  	fh_put(&ffh);
1a33fc0e36a7ab Chuck Lever       2025-10-30  797  	fh_put(&tfh);
cc028a10a48c3c Chuck Lever       2020-10-02  798  	return rpc_success;
^1da177e4c3f41 Linus Torvalds    2005-04-16  799  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  800  

:::::: The code at line 769 was first introduced by commit
:::::: a6beb73272b4c0108e41bc7c7b5a447ae6c92863 sunrpc: properly type pc_func callbacks

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
