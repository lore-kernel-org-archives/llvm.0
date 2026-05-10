Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CCD21773D;
	Sun, 10 May 2026 01:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778376613; cv=none; b=AJeL0jobUoGQkplEryGqtlqtZTJxsfNYviBRIS1o3nN43xGFh768a1skZSZCMGtRalq3AjPCsRdto+zneSkZcW8zXvcnVbOREHqZ0ybKZZiyZEurCeNDlqfPs/bVS4sdzf3Y6zI0IRucVYuXdmKotKf76nV/SPHAaZDhq5IdCAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778376613; c=relaxed/simple;
	bh=No2rvldrDKKEoc7CxTnMudL9yU8Dac8eG6nSFYtEzVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UK6QExVZlsBrTarjH3IQ5+nHPlmb2XmZBonvM7tWgALnX0EiVHzM99FtMRdfAzlnzf2LIESOBE8LlL104pgPxr1Ub+/llnQXNBVYJGTrpLKRQ+081UX9dEvtemYkmj+/JJbP32OKbZv5Ki0EjA+jk3AnsNFZA15vQPNqENtXSlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAEjbuJF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAEjbuJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778376612; x=1809912612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=No2rvldrDKKEoc7CxTnMudL9yU8Dac8eG6nSFYtEzVc=;
  b=SAEjbuJF+JM8vQfpTObJp/sd81B7Fo9V/+JZGLph2KTgPtbJAVhHh64T
   Z3+mAYNI0As3weyKzgo+FcbTYKYipoPnOUVbHikyaG5jb52VyIR2xJ94y
   8PffdEMBuzdAOqLk+NP1QagRjzn3FgI02USBI51Jnfz2awYhrQRtp3PTf
   E7jw1uIPZLWOiaoUCgkkpZrdkWs1u7wgS4FUxaVaVswISOF17gqomOZOt
   3wXDrorB4eOsyc26VzfnST7wumlR8s3rR49xJ2PThO3Wv0GYPe//qNREb
   w3W3mYJWTgKOHh5ogDzN9RY8kzAx6DK2ke5zrB/lQiVLwxNP3LDbXhWhJ
   w==;
X-CSE-ConnectionGUID: Lf+VqOdtRF28wsbx8eJxmg==
X-CSE-MsgGUID: OJt9ZNhVR+ih1iXR42dtng==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89896240"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="89896240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 18:30:07 -0700
X-CSE-ConnectionGUID: 2qRXd513RgqpS9o1NXBYBQ==
X-CSE-MsgGUID: O8u0kS7CSJmtDDzyE51Kcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234050439"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 May 2026 18:30:05 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLszb-000000001cn-1UPw;
	Sun, 10 May 2026 01:30:03 +0000
Date: Sun, 10 May 2026 09:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>
Subject: [axboe:for-7.2/block 2/2]
 drivers/block/drbd/drbd_nl_gen.c:641:42: warning: unused variable
 'drbd_nl_mcgrps'
Message-ID: <202605100901.ZpHbtXME-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.2/block
head:   8098eeb693c4cc4e774c62fbd4875197cb5578ce
commit: 8098eeb693c4cc4e774c62fbd4875197cb5578ce [2/2] drbd: replace genl_magic with explicit netlink serialization
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260510/202605100901.ZpHbtXME-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100901.ZpHbtXME-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100901.ZpHbtXME-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/drbd/drbd_nl_gen.c:641:42: warning: unused variable 'drbd_nl_mcgrps' [-Wunused-const-variable]
     641 | static const struct genl_multicast_group drbd_nl_mcgrps[] = {
         |                                          ^~~~~~~~~~~~~~
   1 warning generated.


vim +/drbd_nl_mcgrps +641 drivers/block/drbd/drbd_nl_gen.c

   640	
 > 641	static const struct genl_multicast_group drbd_nl_mcgrps[] = {
   642		[DRBD_NLGRP_EVENTS] = { "events", },
   643	};
   644	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
