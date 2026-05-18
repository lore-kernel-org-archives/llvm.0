Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A7338F623;
	Mon, 18 May 2026 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131626; cv=none; b=qfeYm17OZLyTdWg4EXGFrnjq82PnK3VzRJNLMClM2eCgKcw4jDdGT+Ar710plPNjlwZszNL+kpc48CtmHruZaOBSNfO7nnuwLbD2PpmNNY5bXfr/tNucNzXTG5GYPFe+g6jChVCox1yYOMSHGSJ2kWaZFGZwhGyvjrFzXUB6Ft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131626; c=relaxed/simple;
	bh=mGDHtBb9heaYOvaHNrygBEMV1kWCcpK4WMjDmN4xGc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SAL3+HuEH9ImWC5nk64/RVoTY4sJrNOp4XLi/t4wcbxFWDqxG7wcNtAtqhJR077eziaLJTxrlTvLnfxpLk4hFOefX3FTLfwv0DBfGYfZ9ZDKYRJHGbn1YUvQ4Qmw1LXdj0jjmP6cNrYhS2dQGAYv71p6rgbrlHez0h8jxIEnzoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EETM2HPr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EETM2HPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779131625; x=1810667625;
  h=date:from:to:cc:subject:message-id;
  bh=mGDHtBb9heaYOvaHNrygBEMV1kWCcpK4WMjDmN4xGc8=;
  b=EETM2HPrEDl9UgpihSgVY4zQBBmxY442eQbWxnuktfazqrddohNzs/ef
   aVtCBXe6QtiM+zhAyZIGI5otAL47upP32o8gPyA1k5LcW9Ag9gz2VY5et
   5TWsxRHg7wiNmFenAWBHq5kx1JmsB4wVyv+86KlmNBfc2ljHqXovJisMd
   VSNKIqKROUw0hc8pzvenHefJ4qaxIGOwugcLRFkr4EQh7Gs2jbd8OMzi5
   +PQUCUruEEKTSZh+h/HpQwN/vE3wwnm9djghzrVehgBhrkDBG6RwUMVYG
   WmneYbvTr4d5Owc8QTz91jqxH8ZFKtl9vya2eG0iL8WK8nqk8Efgm3fKJ
   w==;
X-CSE-ConnectionGUID: ZMI3EQURT1SbsKJecscOxQ==
X-CSE-MsgGUID: gBtzsYR4Q2adlQQNuo+99A==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79961307"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79961307"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 12:13:44 -0700
X-CSE-ConnectionGUID: g7OD8cIaRtCMz0BMp3jNHQ==
X-CSE-MsgGUID: lcMFMhAYSRCS1kQylzTZmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="239387291"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2026 12:13:42 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP3PG-000000003Im-4APF;
	Mon, 18 May 2026 19:13:38 +0000
Date: Tue, 19 May 2026 03:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 132/238]
 drivers/s390/cio/cmf.c:550:11: warning: variable 'size' set but not used
Message-ID: <202605190311.Bn30knNI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: c2abb22c9f24b8570ba3fe1c115908b142514b99 [132/238] s390/cio: replace __get_free_pages() with kmalloc()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260519/202605190311.Bn30knNI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190311.Bn30knNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190311.Bn30knNI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/s390/cio/cmf.c:550:11: warning: variable 'size' set but not used [-Wunused-but-set-variable]
     550 |                 ssize_t size;
         |                         ^
   1 warning generated.


vim +/size +550 drivers/s390/cio/cmf.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  532  
94bb063312d872 Cornelia Huck             2006-06-29  533  static void free_cmb(struct ccw_device *cdev)
^1da177e4c3f41 Linus Torvalds            2005-04-16  534  {
^1da177e4c3f41 Linus Torvalds            2005-04-16  535  	struct ccw_device_private *priv;
94bb063312d872 Cornelia Huck             2006-06-29  536  	struct cmb_data *cmb_data;
^1da177e4c3f41 Linus Torvalds            2005-04-16  537  
^1da177e4c3f41 Linus Torvalds            2005-04-16  538  	spin_lock(&cmb_area.lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  539  	spin_lock_irq(cdev->ccwlock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  540  
94bb063312d872 Cornelia Huck             2006-06-29  541  	priv = cdev->private;
94bb063312d872 Cornelia Huck             2006-06-29  542  	cmb_data = priv->cmb;
^1da177e4c3f41 Linus Torvalds            2005-04-16  543  	priv->cmb = NULL;
94bb063312d872 Cornelia Huck             2006-06-29  544  	if (cmb_data)
94bb063312d872 Cornelia Huck             2006-06-29  545  		kfree(cmb_data->last_block);
94bb063312d872 Cornelia Huck             2006-06-29  546  	kfree(cmb_data);
^1da177e4c3f41 Linus Torvalds            2005-04-16  547  	list_del_init(&priv->cmb_list);
^1da177e4c3f41 Linus Torvalds            2005-04-16  548  
^1da177e4c3f41 Linus Torvalds            2005-04-16  549  	if (list_empty(&cmb_area.list)) {
^1da177e4c3f41 Linus Torvalds            2005-04-16 @550  		ssize_t size;
^1da177e4c3f41 Linus Torvalds            2005-04-16  551  		size = sizeof(struct cmb) * cmb_area.num_channels;
7b4ff87cbf3d25 Heiko Carstens            2016-06-20  552  		cmf_activate(NULL, CMF_OFF);
c2abb22c9f24b8 Mike Rapoport (Microsoft  2026-02-10  553) 		kfree((void *)(unsigned long)cmb_area.mem);
^1da177e4c3f41 Linus Torvalds            2005-04-16  554  		cmb_area.mem = NULL;
^1da177e4c3f41 Linus Torvalds            2005-04-16  555  	}
^1da177e4c3f41 Linus Torvalds            2005-04-16  556  	spin_unlock_irq(cdev->ccwlock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  557  	spin_unlock(&cmb_area.lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  558  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  559  

:::::: The code at line 550 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
