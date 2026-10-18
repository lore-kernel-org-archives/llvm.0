Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686327603F;
	Sun, 18 Oct 2026 23:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792366791; cv=none; b=BNPY+Vxy1UPm3FHHqh9DsJHzG8GGSYu8K5urZ0aLwQzlHb8ZJAkgkQWpGe9QaWF815PKXA5j2AbAs9QOg5V3AMrFiHghrq+zsNoemJuzli0XJOL9InCxbpOOp/0clCYV2+W4+/M/2UgNDCxPHHTGZfo3OFghxD2PRcjrpzVap8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792366791; c=relaxed/simple;
	bh=k3ja/+GW0GyKBmsCuEbxUBEm7VSP1jo7UZtGZoRb9q0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kf8uyvow3pMI1LxO/qck4Urlr3u/LELJzX12Aqs2ZT6gIbDvMmrZSo37esF29Iujcv2vewQ9qxZ+AhGIK90kHtGnoePk/5aqZAwdC0UE32xDKHR9XCGKfPQIJng7NAmR9eoidj/htVZqJwaCUqtV3YpQnNEkJVm4PEM5+FS2oag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zk4ULOw/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zk4ULOw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792366789; x=1823902789;
  h=date:from:to:cc:subject:message-id;
  bh=k3ja/+GW0GyKBmsCuEbxUBEm7VSP1jo7UZtGZoRb9q0=;
  b=Zk4ULOw/KGgzbFrotmas2hfC44L20PZKYQ0aA+m7eFveK8SG0BC/hkli
   7ILITtxVqk4uBxVFJDITU1LPS0V3gsBxjV6Y5F22s0nt+0Pc575PYrhJQ
   0YNuS3P9X5AV4t00AiYQEQtq7n0wO9uMB0MQLXOwzfgyiU6gw7CyB8Szr
   V43EmUbnYCXbAPqKFuvRUWc3eZcICGqU1TwYLfk9fvUkdmuZsyAZWPzNm
   zlOLXKbujZw3DurtqrXJeU/GchgLvJAuTHsewt+HaUV+RMiYPACdAsxuq
   ZpvwnDrAit3gzOiDswzHrBF8SgQFYtdoDgwEnvxxqfWCekBwB9PX98cGB
   w==;
X-CSE-ConnectionGUID: LxPtx8/xRdaNDj3w5iWbdA==
X-CSE-MsgGUID: FCxSkV3wRWO0U7QnyrCBYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="943524"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="943524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 16:39:48 -0700
X-CSE-ConnectionGUID: vvuLccCaTZ+BBPI9eq5oYw==
X-CSE-MsgGUID: ahd5TdWxQFiCWNf7QKnxYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2751004"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Oct 2026 16:39:47 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIaTg-00000000KxS-35oz;
	Sun, 18 Oct 2026 23:39:44 +0000
Date: Mon, 19 Oct 2026 07:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 31/32] ld.lld: error: undefined symbol:
 regs_set_return_ip
Message-ID: <202610190744.8lQ4E3mq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: ca107dce40b82cc491ac08e03e01626956ca5eb4 [31/32] fred-entry-ssp-muck
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20261019/202610190744.8lQ4E3mq-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190744.8lQ4E3mq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190744.8lQ4E3mq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: regs_set_return_ip
   >>> referenced by extable.c
   >>>               arch/x86/mm/extable.o:(fixup_exception) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
