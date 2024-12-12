Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF52D210F60;
	Thu, 12 Dec 2024 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734000104; cv=none; b=NLc40PyH2ctFhEOT03bWfMHgd9FWuFtXyat7Fhxi9KQLVT7CaaS4LbWwIk6cYKlGfOHm4GmIAo1EoQEmvMS8CAUTXjCLi+8EEDtU4dIh2Is0A7DfODKeNz0w4Zhew2vRDwaXf2NOu1b40Gmu43Kuynn4P9D8R59qO1gTK/Bunjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734000104; c=relaxed/simple;
	bh=R+8aAPQmrC85WO2HETox6+Dr09Tc4Ma7Cu4nQe7zbJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iD3dsHBWjIyfcTyPD3UToPMiooxAXjEEpuymJV2+syh5ZsKyLS1eLVT3QgPer2YE2Gl9AZGy5POGkSv0yoCiuBdE2tC00mcJDk+6VLuY1nHbvWByukbiEsmm7kT3KgCD97rgVOFysdZwy9gK/4y/cCz+9mQ4L2Vju208Ul5l7WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+7XTlvd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+7XTlvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734000103; x=1765536103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+8aAPQmrC85WO2HETox6+Dr09Tc4Ma7Cu4nQe7zbJ4=;
  b=k+7XTlvdtpF6znIweIhe/n4vqEQJgYzAh4b/xhsj45rQl5/ycj5A4fYq
   lcC+n2elPhV/iJ+aHCBNMJH97Ou4hWtoU+yV0as3kSas8YqMLrCy+Bfwm
   cykRrt0jTRnCuC6wNIUEM+PsbayhEpSQHw0m9lpBzhrqM4acdTvSsfNKm
   Yx+8+Ri7uc2eF6ALnXy9lyKbTtKtf5IdyF4E/mvmpUxV9+yDpKHG+sUuv
   TaVqcaBjkAajb2rkVfeQapkThpQ/P/tfrfMIsH0zU9l7WsZ0O1utmnpvZ
   6Vq1Hbd4cCmllANofUxo/nhrtLXmhlIO+uYSdmmBI2/QHs0zo3q3izvN+
   Q==;
X-CSE-ConnectionGUID: cWUJpvdCRPqDPgBURrnvSw==
X-CSE-MsgGUID: nw+eb7kuRPy+JSJvUaZapw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51939219"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="51939219"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 02:41:41 -0800
X-CSE-ConnectionGUID: TarmyCT9SKqc/CRZeBYoqQ==
X-CSE-MsgGUID: f1mrUYLBSDOtjgrHEUD3cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="101046868"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2024 02:41:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLgdV-0007jh-00;
	Thu, 12 Dec 2024 10:41:37 +0000
Date: Thu, 12 Dec 2024 18:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Erin Shepherd <erin.shepherd@e43.eu>,
	Amir Goldstein <amir73il@gmail.com>
Subject: [brauner-github:vfs-6.14.pidfs 10/16] fs/pidfs.c:587:12: error: use
 of undeclared identifier 'EXPORT_OP_LOCAL_FILE_HANDLE'
Message-ID: <202412121817.98imfIQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.14.pidfs
head:   cb99a90ef7300b1d28d05f73ca9d8132179f2053
commit: ccb189ccdd283cf522b5112f7e5eab2817f48546 [10/16] pidfs: implement file handle support
config: s390-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121817.98imfIQi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121817.98imfIQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121817.98imfIQi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/pidfs.c:587:12: error: use of undeclared identifier 'EXPORT_OP_LOCAL_FILE_HANDLE'
     587 |         .flags          = EXPORT_OP_LOCAL_FILE_HANDLE,
         |                           ^
   1 error generated.


vim +/EXPORT_OP_LOCAL_FILE_HANDLE +587 fs/pidfs.c

   581	
   582	static const struct export_operations pidfs_export_operations = {
   583		.encode_fh	= pidfs_encode_fh,
   584		.fh_to_dentry	= pidfs_fh_to_dentry,
   585		.open		= pidfs_export_open,
   586		.permission	= pidfs_export_permission,
 > 587		.flags		= EXPORT_OP_LOCAL_FILE_HANDLE,
   588	};
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
