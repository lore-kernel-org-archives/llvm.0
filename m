Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542E318E25;
	Fri, 31 Jan 2025 19:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738352823; cv=none; b=KuN0o43137x3kygUNkGEfnH7TkcVRjr8nrxIuOEa2zNQJtFxEaX6VL0pghfojGgiwsPCX1RgMv7CxklrO4yXbg40Mwer0h/GC/wNUFogj/630I9qOgH2cZzBGWzSpP6U8vx3M0LmDgshmhI2tFQgS+tVcQT83P1jTDvl6KRRoy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738352823; c=relaxed/simple;
	bh=IX3oxXZ/4GqM0GAutc4NoG5fqaFtLWOrVLtlysxGItk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2LrWV/3UVAmInDyw93PKXDuJTjlFRgjHBP70eV5Pf9HjFGWqEiFaVmucmFkapo/AGOMX0uv56zJzf74L4U7UPwmegaXl3di9drj2+jsBQojSOXBMAIIwBD5fdaeffs0EkutfIdwU6jRtAkZjD8X0XNILBy64K+G3WB4b7mouVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOIEEswv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOIEEswv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738352822; x=1769888822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IX3oxXZ/4GqM0GAutc4NoG5fqaFtLWOrVLtlysxGItk=;
  b=IOIEEswvQ/piS6ncZ3wVBlvrDeYox4LWuLdp8k0uUuNW6pRjSKfWDx1w
   TlcVGNd8rvzhjCpos0ZwNvyvBAdeJ0NYbe9yVgV+G3OLg/sV+J9PT+0mD
   9BDn22a7vxctWyGxpauAaHuOvxRUyun5DB9zZHs6d5EhICfcBw2rPhw3K
   I13k28IRxWaYrBLVNmGGxc+774b6OiiaJILgxxu4tLCpJmnm8/j4t3h7C
   6uWL4nd4pbTlkNXuhbVErA0yaMtSm9sqM8DEA5fA136RRExB+/OTXj6k7
   +dcdHggrIDSJ3J2Bt5HorvO0r8s3WbN6qUXhdcG+KSksZjHrKIekNpgep
   g==;
X-CSE-ConnectionGUID: psUluoqpRgesgphEfeI01Q==
X-CSE-MsgGUID: t1PgsRjJTIS+P0GE95W1eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38819641"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="38819641"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 11:47:01 -0800
X-CSE-ConnectionGUID: h5c3sYcDRZGprAXZ6iXR1g==
X-CSE-MsgGUID: UeTc59qvTF+Csskw9pDT2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110593015"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jan 2025 11:46:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdwyf-000mzR-1a;
	Fri, 31 Jan 2025 19:46:57 +0000
Date: Sat, 1 Feb 2025 03:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 23/33] ld.lld: error: undefined symbol:
 rxkad_kernel_respond_to_challenge
Message-ID: <202502010335.yETC5WKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   3108d67c535aa3ea00a95b1daf8efdc15bb074b4
commit: 097df55e65b4cf8449dd5ae95fb43e55220e0c8d [23/33] rxrpc: Pass CHALLENGE packets to the call for recvmsg() to respond to
config: x86_64-buildonly-randconfig-005-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010335.yETC5WKS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010335.yETC5WKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010335.yETC5WKS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rxkad_kernel_respond_to_challenge
   >>> referenced by cm_security.c:39 (fs/afs/cm_security.c:39)
   >>>               vmlinux.o:(afs_respond_to_challenge)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
