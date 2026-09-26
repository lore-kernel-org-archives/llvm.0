Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E436F8E7;
	Sat, 26 Sep 2026 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790408458; cv=none; b=dN2yUOcMAslBV9gzF9VGcxd9qN4yGeORqTbiKE4M4KgHJQTxFC5NgCCsvLGe9b/tLc/GFrrq/Be4xNVdvDKWw9sBz3aKQkAZ36LpsCb5t88+alPn2pksWDw4I0DAQqKQfObU3uaKkmU41hgSTHXybbvX96/OtlZez1BZlk4GKhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790408458; c=relaxed/simple;
	bh=RN2yRayKyAN3NSwzQmjxdbbM68ld7/qQsfF8Rq/kg/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AIY/mYVR9nN67SOszulxKUhjf3rDvY/QuPABZZV+MPNu0yfKWmtLkn02qjqILsXPIcn6bc8g+N98RpC/9P+0C5py65d8JmmSBuLTWeHur/8LUTLC+KXB0EmBaFrAEHpnJjc58ipWBaY7Rm1u8RETnvs8dW7JQxAI0CEvMIIgoRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4sv1flZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4sv1flZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790408456; x=1821944456;
  h=date:from:to:cc:subject:message-id;
  bh=RN2yRayKyAN3NSwzQmjxdbbM68ld7/qQsfF8Rq/kg/U=;
  b=R4sv1flZ3vP+xNftX6sdyDsAkLPubuVtXF5Dxct5qW//1aMqXoNiMpar
   pUrfnxpWxda2wkkfIg0fbNM+P5iRstMTNs0vfU4DP21ksOhl4UiB9bD1P
   Nq8pAR2U5QpSHY24KMncnHFoWmAo1emch2dHpiK4tw1NZGvvikxa0MSLj
   b2GkOLcDZZmCYEUlakw6+ElNVQR1dH7oWyBGziyDcT187/xuzzROyeEhK
   +5qayDjA6UHLKL8tpEkVXF39X6xwQkRT6z71p6L51ECXoqtQuFgcys/Ly
   r41mvrBRfaN8NWHHUZw3ui2AQSyzkhqizcScomSgPk2Vmfksj5XrydISV
   Q==;
X-CSE-ConnectionGUID: fhVN2Ff2TEmExmEPal5gRw==
X-CSE-MsgGUID: odBASBgvRCyQiDUpbe8iXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116716175"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="116716175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 00:40:55 -0700
X-CSE-ConnectionGUID: Z6fLPruDS0S6+Y2hv3RmfQ==
X-CSE-MsgGUID: 95ED0OWPROmcm29vL2Ta5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="274093487"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Sep 2026 00:40:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAN1f-00000000LdB-2rqf;
	Sat, 26 Sep 2026 07:40:51 +0000
Date: Sat, 26 Sep 2026 15:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:dmabuf-size-ceiling-v7.3-rc3 28/29]
 include/linux/sunrpc/xdrgen/_defs.h:13:9: warning: 'TRUE' macro redefined
Message-ID: <202609261528.3V2sJvs1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git dmabuf-size-ceiling-v7.3-rc3
head:   837ed875be1a747823a663f160a8122b60c0c88a
commit: c5e054ccaedf0778bd70baf19cc9200fe5a7acc1 [28/29] drm/amdkfd: port AMD Infinity Storage file I/O from the amdgpu driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260926/202609261528.3V2sJvs1-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261528.3V2sJvs1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261528.3V2sJvs1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_ais.c:57:
   In file included from include/linux/nfs_fs.h:41:
   In file included from include/linux/nfs4.h:20:
   In file included from include/linux/sunrpc/xdrgen/nfs4_1.h:10:
>> include/linux/sunrpc/xdrgen/_defs.h:13:9: warning: 'TRUE' macro redefined [-Wmacro-redefined]
      13 | #define TRUE    (true)
         |         ^
   include/acpi/actypes.h:412:9: note: previous definition is here
     412 | #define TRUE                            (1 == 1)
         |         ^
   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_ais.c:57:
   In file included from include/linux/nfs_fs.h:41:
   In file included from include/linux/nfs4.h:20:
   In file included from include/linux/sunrpc/xdrgen/nfs4_1.h:10:
>> include/linux/sunrpc/xdrgen/_defs.h:14:9: warning: 'FALSE' macro redefined [-Wmacro-redefined]
      14 | #define FALSE   (false)
         |         ^
   include/acpi/actypes.h:407:9: note: previous definition is here
     407 | #define FALSE                           (1 == 0)
         |         ^
   2 warnings generated.


vim +/TRUE +13 include/linux/sunrpc/xdrgen/_defs.h

4b132aacb0768ac Chuck Lever 2024-09-13  12  
4b132aacb0768ac Chuck Lever 2024-09-13 @13  #define TRUE	(true)
4b132aacb0768ac Chuck Lever 2024-09-13 @14  #define FALSE	(false)
4b132aacb0768ac Chuck Lever 2024-09-13  15  

:::::: The code at line 13 was first introduced by commit
:::::: 4b132aacb0768ac1e652cf517097ea6f237214b9 tools: Add xdrgen

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Chuck Lever <chuck.lever@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
