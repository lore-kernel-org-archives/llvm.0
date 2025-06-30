Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1B828DB68;
	Mon, 30 Jun 2025 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297286; cv=none; b=Y0sfH6zSMleDVg3Xgvj8fQE8UM0fRoEWlZDna0oUUXh4akBRh9kZt66dawdf9vKILJBwWnHoaIPCouv9BQC32Yzp75y307oeboFCFJ5xUwPtjgJpWfw5KHN+MmJCHlrJ0TGFoGl/qR5PDdpKtRebtUvbpYnX4woJS+taNRleAio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297286; c=relaxed/simple;
	bh=ch3DPYXoPcBm3zXb6VirroJ8qGEerQo9qp5nPCeSzBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ugky2U2VO2lHUYkclI87HSYUGHjy4gOl1bGAqWlnoLTZVmShsnbFER6bgyMnOQH/76diT5t9DEaioXsdOxaXlfdW6oXrz8vfoW21BUqnijja37vau7TOcjJU8HlyKMR5P7N+JCNcW0f/5N0wByuFYyfR6lYIllkMJ0M4TeVO6Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZErxdQRl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZErxdQRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751297285; x=1782833285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ch3DPYXoPcBm3zXb6VirroJ8qGEerQo9qp5nPCeSzBg=;
  b=ZErxdQRl0Rc4ZdjuVfj+PhoZYwNoMWMGzmxrqwXRcLkgRrJlQG+iUpXA
   KFHe/iuxkBDVnu3/eRWSZCjoOxTjemslLgEsphs3qRAwwhFPqSMQyfNHu
   cfyKDaezbwyhdWobV7cvWAjRTm3Sh393Uk80G30IGoPQnxD5ElB23OG7E
   obd/AaIXpVclDxnnAfYSFza1UegZw8Stee2LcArFSh0BRVD3gnHbt4HqT
   teK1SCdfXi6vQY/43dNCeDayXkGwkLw2RCa7AZ6S6S1x07EiYZ/0Nznu2
   xzUvi+UHEMhRvs+k3kpU2HWDpIbMZxQXeVlDwwwZzZxBj9n3ArCz0Zsp8
   A==;
X-CSE-ConnectionGUID: ToDY34p6RNmQzEO5VA3L+A==
X-CSE-MsgGUID: Vfu5tv4sR7KMc+ZgFMC1LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="70960610"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="70960610"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 08:28:05 -0700
X-CSE-ConnectionGUID: IB1poLFaSFOjqIcthzlNUQ==
X-CSE-MsgGUID: D7RnpAQQT/K3Iy1CqhErQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="154021445"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jun 2025 08:28:03 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWGQL-0001F9-0U;
	Mon, 30 Jun 2025 15:28:01 +0000
Date: Mon, 30 Jun 2025 17:27:43 +0200
From: kernel test robot <lkp@intel.com>
To: Konstantin Andreev <andreev@swemel.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: [linux-next:master 4581/6007] Warning:
 security/smack/smack_access.c:650 function parameter 'label' not described
 in 'smk_import_valid_label'
Message-ID: <202506301724.Q25fr1nU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1343433ed38923a21425c602e92120a1f1db5f7a
commit: 674e2b24791cbe8fd5dc8a0aed4cb4404fcd2028 [4581/6007] smack: fix bug: setting task label silently ignores input garbage
config: i386-buildonly-randconfig-2004-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301724.Q25fr1nU-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301724.Q25fr1nU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301724.Q25fr1nU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/smack/smack_access.c:650 function parameter 'label' not described in 'smk_import_valid_label'
>> Warning: security/smack/smack_access.c:650 function parameter 'label_len' not described in 'smk_import_valid_label'
>> Warning: security/smack/smack_access.c:650 function parameter 'gfp' not described in 'smk_import_valid_label'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
