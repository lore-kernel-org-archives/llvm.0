Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F1E2475D0;
	Fri, 29 Aug 2025 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756451228; cv=none; b=AJuBB/bRWkhAhlD9QH9u4XkXyCF5Rqu9fub+DUu4X7Zs68GcC4sIWkFNwVIv7KH4MNLZ7dwWU3Mp+nDYtBHNS6VYwAceBvLxmF93H0j80CnQ4/AML2EXS/gVTp7RRj89+58tNspxpgq5HUZxqYuVuSR03sT75kzBwpTeWUNAyTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756451228; c=relaxed/simple;
	bh=8C95Oh38qx5E+yvpIJfsziQGhVgku3YueM1p/WlxYak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4z0BjCvEXxKiMH/DOF3AmJTrLAGeXQEJdgJo5vPy87k6BVo8v5PM7WqyxieqBq8j7miuBcBd1ywvhieDqrqcM+r6ivYoGHaxiE84vCPlRn9Krg4lLGGcIweLFcAWGlTTwqO64s9gbL5G6dPvUOcaM6ggBNxN0RK+NObTtDbIpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ovf3aG29; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ovf3aG29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756451226; x=1787987226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8C95Oh38qx5E+yvpIJfsziQGhVgku3YueM1p/WlxYak=;
  b=Ovf3aG29oDumJH7V/oRhdm8Vq3qvv+YTO+bV6vuO2xEstOXovyEMKJDf
   VSwwBf4FpFzeMt+coE7uRVFHq5uwn2QQT3tNLI3cScUEVGITlRvVQFQOk
   uppO+3fMge4cOxkRw5qB4t5RL74eLgNGTp03j07eG3Ht9rRLnQTs8XIq7
   ZxAuOSlMkrH9ht/JI3uexEcuGu6aDjMqAdHm2S2/62G9HTib0YN1yI+SU
   PNm1oS/gmXp6iRHrHczszrtA0aEFZZmcwgjzUqhG4B37rIGHhDNrOv4lu
   P93f1qhR94rgDwuI62nVLAivHBVjvgIxn4wwaSFWastXHSeWLHWIH2Ff7
   w==;
X-CSE-ConnectionGUID: //No5vusSTm4iqU8xcSnFQ==
X-CSE-MsgGUID: PjjxhAPcSVyNfUegE6C8yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="70173049"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="70173049"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 00:07:06 -0700
X-CSE-ConnectionGUID: xtN41+ixTouhiDxJUvWvHw==
X-CSE-MsgGUID: OQ3ATcJ7S6akJxCtyCeKCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="207452745"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Aug 2025 00:07:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urtCP-000UPv-2D;
	Fri, 29 Aug 2025 07:07:01 +0000
Date: Fri, 29 Aug 2025 15:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Metzmacher <metze@samba.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	Steve French <stfrench@microsoft.com>
Subject: [cifs:for-next-next 28/146] fs/smb/client/smbdirect.c:1856:25:
 warning: stack frame size (1272) exceeds limit (1024) in
 'smbd_get_connection'
Message-ID: <202508291432.M5gWPqJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next-next
head:   b79712ce1752aa38da9553b06767f68367b0d7ff
commit: 36d70a0c8405556dea3d4e9beef708d7ed3c2b07 [28/146] smb: client: make use of smbdirect_socket_init()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250829/202508291432.M5gWPqJX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508291432.M5gWPqJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508291432.M5gWPqJX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/smbdirect.c:1856:25: warning: stack frame size (1272) exceeds limit (1024) in 'smbd_get_connection' [-Wframe-larger-than]
    1856 | struct smbd_connection *smbd_get_connection(
         |                         ^
   1 warning generated.


vim +/smbd_get_connection +1856 fs/smb/client/smbdirect.c

399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1855  
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17 @1856  struct smbd_connection *smbd_get_connection(
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1857  	struct TCP_Server_Info *server, struct sockaddr *dstaddr)
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1858  {
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1859  	struct smbd_connection *ret;
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1860  	int port = SMBD_PORT;
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1861  
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1862  try_again:
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1863  	ret = _smbd_get_connection(server, dstaddr, port);
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1864  
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1865  	/* Try SMB_PORT if SMBD_PORT doesn't work */
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1866  	if (!ret && port == SMBD_PORT) {
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1867  		port = SMB_PORT;
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1868  		goto try_again;
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1869  	}
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1870  	return ret;
399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1871  }
f64b78fd1835d1d fs/cifs/smbdirect.c Long Li 2017-11-22  1872  

:::::: The code at line 1856 was first introduced by commit
:::::: 399f9539d951adf26a1078e38c1b0f10cf6c3e71 CIFS: SMBD: Implement function to create a SMB Direct connection

:::::: TO: Long Li <longli@microsoft.com>
:::::: CC: Steve French <smfrench@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
