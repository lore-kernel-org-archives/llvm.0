Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F186127;
	Thu, 14 Mar 2024 05:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710393082; cv=none; b=naB92ErQ6UcBzDeiKW0nGhaSMWghyc79lPKd0XqjnzmiaAGVzS0TpE6/Tq5Pm1Km/cbORLL+giKlBDMi9tMUBmzLWHpeiA9uI/P3qPR55Bu6jiBP2pAFk/yp2KtrnD52c4VFmRdMDmSrTf13M1MPNwXhSb+XapgymYiPtyNkEvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710393082; c=relaxed/simple;
	bh=eFIIaDvGeSy97RMlXiCtc1y+OnxCy/G5Uv7zgYTQOSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S7Mvqtel8uS6XXp7b2K2p06rrjKh6Qavac41s1YJKJqnyusnZocpSw27o6hsi+5eftdMt/4Pfcvz0L4pouEP+4gig0q3uP3XGBA86OF5AF6qwFIz2E4jtE7amjobW74oiWrhTX+BBg0hB7Sdx0uW4Q46HMAJVEmXExA7TQTv80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i96Hi6uu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i96Hi6uu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710393081; x=1741929081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFIIaDvGeSy97RMlXiCtc1y+OnxCy/G5Uv7zgYTQOSk=;
  b=i96Hi6uuN7xJmLvyfGhPmDj//QUCh0lw6qXS1JSOn7gwasY8ywfwvcZY
   Ukws3fJ+zT5gv9zZDMgO/xL9iHwoisumYZDYhij2r8+IP6oY/C2HkTSdl
   /jj8nbdc/h8p2Mm8x7MNUaJpTzp3w6t2neH871Hgcay2n9jF9qhyNfKRE
   FfH8NpENpGyEwe/+fxDg17kgkATR57bj426FqCiAjrV6l2IKOgFGuiTqb
   MOO0w6aBZXXsfKAlIrNKHwxgjzitLB/inQOpBhsLQB099xeUYnLAYIR7U
   V38cAb6ThnM9SxXZ2IR+Emd1kyroVeFjrnxo7mstFzq5f8UeDAT3xuArQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5064516"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5064516"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 22:11:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16764487"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2024 22:11:18 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkdN5-000D7n-2B;
	Thu, 14 Mar 2024 05:11:15 +0000
Date: Thu, 14 Mar 2024 13:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 16/31] fs/nfsd/nfs4proc.c:3688:14: error: invalid
 application of 'sizeof' to an incomplete type 'const struct
 nfsd4_operation[]'
Message-ID: <202403141324.JtdnkHMT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   1e8c308042a0c8ec86148101dbde9c6383fad5b7
commit: 9f66eba1a281d2ab4c921c06fe8a57b881851c3c [16/31] nfsd: wire up GET_DIR_DELEGATION handling
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240314/202403141324.JtdnkHMT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141324.JtdnkHMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141324.JtdnkHMT-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/nfs4proc.c:3517:14: error: use of undeclared identifier 'nfsd4_get_dir_delegation'
    3517 |                 .op_func = nfsd4_get_dir_delegation,
         |                            ^
>> fs/nfsd/nfs4proc.c:3688:14: error: invalid application of 'sizeof' to an incomplete type 'const struct nfsd4_operation[]'
    3688 |         if (opnum < ARRAY_SIZE(nfsd4_ops))
         |                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   fs/nfsd/nfs4proc.c:3209:37: warning: tentative array definition assumed to have one element
    3209 | static const struct nfsd4_operation nfsd4_ops[] = {
         |                                     ^
   1 warning and 2 errors generated.


vim +3688 fs/nfsd/nfs4proc.c

07d1f8020738ba J. Bruce Fields 2014-03-06  3685  
f1c7f79b6ab4f7 Adrian Bunk     2008-08-08  3686  static const char *nfsd4_op_name(unsigned opnum)
b001a1b6aa9609 Benny Halevy    2008-07-02  3687  {
b001a1b6aa9609 Benny Halevy    2008-07-02 @3688  	if (opnum < ARRAY_SIZE(nfsd4_ops))
b001a1b6aa9609 Benny Halevy    2008-07-02  3689  		return nfsd4_ops[opnum].op_name;
b001a1b6aa9609 Benny Halevy    2008-07-02  3690  	return "unknown_operation";
b001a1b6aa9609 Benny Halevy    2008-07-02  3691  }
b001a1b6aa9609 Benny Halevy    2008-07-02  3692  

:::::: The code at line 3688 was first introduced by commit
:::::: b001a1b6aa960949a24c2cdc28257dfcc9428d74 nfsd: dprint operation names

:::::: TO: Benny Halevy <bhalevy@panasas.com>
:::::: CC: J. Bruce Fields <bfields@citi.umich.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
