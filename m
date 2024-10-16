Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9842076D7;
	Wed, 16 Oct 2024 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074553; cv=none; b=Tyh6r5SkE93+QYW1leIM62k88pLQVEGjwZ6VutEPvtJjjtuyEW+EoRy0m4FUc60iVK1n5BCJ4KQ98RcFGAawKfo6+iAA0tMWRWakUUjAupnRI/JcI983D6gjOZhUOwZHwsnmqGcJQH1OIUOnhdw2nbv26U0fZ7EZ/7Ra6i0Pdh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074553; c=relaxed/simple;
	bh=5rZFoh+Y1JgPLov3W4TEp/1JpxxYqNMQAFfPZoGsZdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PxiutAVRtxpLEJbY9ix5XSAVgllKtZt0eOMHf6NTtAseveWJoEaG9SrNnjsIkvVnjlOSQdGEYxXe1h0iTxv5i5qDpdbzTlOFlDV734JMrbyPrgslgu3HXHaViNfAr2OgvFJH/Wi5GylfLzHDO40+SV5/qEKIBOtaWl/evUAsfqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxfRenl5; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxfRenl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729074552; x=1760610552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5rZFoh+Y1JgPLov3W4TEp/1JpxxYqNMQAFfPZoGsZdA=;
  b=ZxfRenl5iNZAzuFJYZ2nGiPq6sbW5HmnFTlhvYjmQLafEXC/kyAnbbjS
   DGwf36F6peycAc2pVvU4uIisWe2L+yjmQH7ffPsiVjXM+zggfOBRceLDt
   nQp7T+0ljmEfRwxd2A4U51Ne0E8WR/mqSf6ObuwrSgMjqAKyjoBJ8ILRE
   iUKosL1oAU8xh0AIL/11rfnKeoMsGedU8bieSwiPk6zzuucHN54gn0Vaz
   snwid0xU02AGeHpOLxnGtKta4p2RXWqYTwvHhw5n0ofdLsRNEMWBlAU43
   0ps4T5r0iHhia5tkAW+SeLY84zPULWU/JZJ9RIC6w17gYV3YPtINEY0O+
   A==;
X-CSE-ConnectionGUID: PUkrS7viTEiQuLmrbtDnug==
X-CSE-MsgGUID: AeOvtymjSaq1tpP0FM3eng==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="46008972"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="46008972"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 03:29:08 -0700
X-CSE-ConnectionGUID: UTCAk8eYQYChbp1boK7LiA==
X-CSE-MsgGUID: XEmuIg2sRqaLD99j5Nyoqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="78633959"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Oct 2024 03:29:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t11H6-000Km6-39;
	Wed, 16 Oct 2024 10:29:04 +0000
Date: Wed, 16 Oct 2024 18:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miklos Szeredi <mszeredi@redhat.com>
Subject: [linux-next:master 4258/4954] fs/overlayfs/file.c:234:57: warning:
 omitting the parameter name in a function definition is a C23 extension
Message-ID: <202410161847.oG293ywD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e7d45e786a62a211dd0098fee7c57f84f8c681
commit: 291f180e5929ec636ecffd8a0bba00da907e0f89 [4258/4954] fs: pass offset and result to backing_file end_write() callback
config: i386-buildonly-randconfig-001-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161847.oG293ywD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161847.oG293ywD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161847.oG293ywD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/overlayfs/file.c:234:57: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     234 | static void ovl_file_end_write(struct file *file, loff_t, ssize_t)
         |                                                         ^
   fs/overlayfs/file.c:234:66: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     234 | static void ovl_file_end_write(struct file *file, loff_t, ssize_t)
         |                                                                  ^
   2 warnings generated.


vim +234 fs/overlayfs/file.c

   233	
 > 234	static void ovl_file_end_write(struct file *file, loff_t, ssize_t)
   235	{
   236		ovl_file_modified(file);
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
