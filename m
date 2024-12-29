Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBE023774;
	Sun, 29 Dec 2024 06:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735453865; cv=none; b=vFEFKJDNh4bYkZ5ICZd/2CKQC46kYZqxxKMRxg38fX1GJFXr+oGYgEWOXLrXu36Zg0qGJk8jyN46x9QCH6w5nWYDDn6QnGBFKK8Vr0qTpshSQf6N89GDUXNSCL/28S1mWiXrzQtrDymZILn8EBurJqjL2E89ibujYS58eNcHWrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735453865; c=relaxed/simple;
	bh=LMSj/cD2Xl6GDpxsZazwBcFTO8kMvDOOZNB4zpDIjSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2PjomFuBSOdu3Vt3zKk/D/xTqrfpq7ThHYcBh8vd05j21hhVRBCKMVRh2McI3TtkZHvu8LfzkGlBtUWrfSXK95mYJ8JkuQYb6tnV+c0D9L4McbuwwhHExwzp+XonmQGL6TaeMMdbdbx40Bs91WJEELOtStzp5eqEZQP1aCAifk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vu+32jn/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vu+32jn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735453860; x=1766989860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LMSj/cD2Xl6GDpxsZazwBcFTO8kMvDOOZNB4zpDIjSc=;
  b=Vu+32jn/Z0MYAZRBjDYXO/KGZsEHkOjAcENvC1Q25DGmL76MKePVuopq
   wbpgvbxFCCfYrHD/1yumGo+hIafevhqYVy0V1ic3cHy+0xc73diNqE4ja
   QiAqu9xfEUmQ5QdBucYoo6oJ9EptwqscxH54ZNA/uKApRyr+K89a4rSh4
   joBW+iGj82NmYWfiZwor2Okne6vJ90/RlISvPcKzUuNwtuDXi3TgvIRii
   j10U8T3HPEytJKTcUAlUYPAYpLC/ecb6jTd3xD54U5s2TywP7aCMKisE4
   D8bFPI+TZFESJcj4zd2eZWMTP/mT3jX0YW2rGouj7g+TrTHQDqW7jVJUz
   g==;
X-CSE-ConnectionGUID: Yb3BV6NuTluU9RxZ6MSXKQ==
X-CSE-MsgGUID: kfRzGI8LRVejVf3N6GUHEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35923753"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35923753"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 22:30:59 -0800
X-CSE-ConnectionGUID: nyFoTYfhSPe1DZByzW8EjA==
X-CSE-MsgGUID: i03hrQL0SX+vfqK6bz0rmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101346047"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Dec 2024 22:30:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRmpB-0004We-32;
	Sun, 29 Dec 2024 06:30:53 +0000
Date: Sun, 29 Dec 2024 14:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.debugfs 20/20]
 drivers/net/bonding/bond_debugfs.c:66:2: error: use of undeclared identifier
 'err'
Message-ID: <202412291628.UQQUijmc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.debugfs
head:   b41a25033d7a1783290826fb565d082a0c7a55c4
commit: b41a25033d7a1783290826fb565d082a0c7a55c4 [20/20] saner replacement for debugfs_rename()
config: s390-randconfig-001-20241229 (https://download.01.org/0day-ci/archive/20241229/202412291628.UQQUijmc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412291628.UQQUijmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412291628.UQQUijmc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/bonding/bond_debugfs.c:66:2: error: use of undeclared identifier 'err'
      66 |         err = debugfs_change_name(bond->debug_dir, "%s", bond->dev->name);
         |         ^
   drivers/net/bonding/bond_debugfs.c:67:6: error: use of undeclared identifier 'err'
      67 |         if (err) {
         |             ^
   2 errors generated.


vim +/err +66 drivers/net/bonding/bond_debugfs.c

    63	
    64	void bond_debug_reregister(struct bonding *bond)
    65	{
  > 66		err = debugfs_change_name(bond->debug_dir, "%s", bond->dev->name);
    67		if (err) {
    68			netdev_warn(bond->dev, "failed to reregister, so just unregister old one\n");
    69			bond_debug_unregister(bond);
    70		}
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
