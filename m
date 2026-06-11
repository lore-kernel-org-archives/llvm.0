Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5F1F09A8;
	Thu, 11 Jun 2026 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179701; cv=none; b=Ahk+UuaEkLMf1RgeS7ZktZIx3vhAhMmS9T1uMzKOLmu2+JYAk295OVQIbVYkCH+S5ea8HY4bf4IMzJQxTCh4oMF3Ctq6uaOJxfu9Mg55Ll4sqa5S+D1hUTWbktFoMmWXXmRiG5fDuQ20TcsUuGGExFkDeca3DIVW2s1lMHRy1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179701; c=relaxed/simple;
	bh=1aSFGhJyLAijv+CPAmBbjaUaITH1N0I2lwQQhS8G+YA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X2rStg+9AGvC8aM+B+t8J4NSfd8rG7j3gcu/GuJxX+wbSJjLxFdjyN0UfkAy3iGA/Ri5mbuOPNvY+UBir5CX7xP0CyBeFPV00y+YM2W7iR6XcpTDZQcdgcXcDjdpJV6nOUdjYjS1JKe0GoktWdlU+LdAssuAdXWl0ZkoutcfE0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nn4DOj/W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nn4DOj/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781179700; x=1812715700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1aSFGhJyLAijv+CPAmBbjaUaITH1N0I2lwQQhS8G+YA=;
  b=Nn4DOj/WOXvFOsCQW2Ah2S5Kd5UYd6OD5hF2JAL93SEERxkYAIeywqFb
   b1SFZU2MrN2wHce2PX8YLNioDVceq2lW/fhl8Qcxeaitvo/9M0Zek8bx1
   RaSKNpPWUAtGJT4/xnCMZwd9tByI51S/sAKVrSEEG8xMOM7gSxOBACiTv
   4POLJ3knNE4otcWbeiIfSyxANR/75OCUmJo84Ap/usYOvWl0k0taop0hZ
   gQ3noPt/W//c5+Hrt6/QwA3anYqQsfRBJdmf5ZgFvUicL/23Cz3l1+6kv
   LF/RxX/UyZRjpfKKN7XOcoc8Ky6gQsd5+qY5pVcQ00z6aw+Hesibdg8xS
   w==;
X-CSE-ConnectionGUID: W3TcxiM8QvKDNtAhhqQ9jw==
X-CSE-MsgGUID: BFgiHzecTyyHe5KosTiB9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69535622"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="69535622"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 05:08:19 -0700
X-CSE-ConnectionGUID: QaVcDhjOS+y4SEkeUBbE0A==
X-CSE-MsgGUID: KzlCnAQKSay4aSX0N/Uw4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242319018"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2026 05:08:18 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXeCl-00000000Mv0-26bW;
	Thu, 11 Jun 2026 12:08:15 +0000
Date: Thu, 11 Jun 2026 20:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 3143/13002]
 drivers/block/drbd/drbd_nl_gen.c:641:42: warning: unused variable
 'drbd_nl_mcgrps'
Message-ID: <202606111922.IaJSwCrY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: 8098eeb693c4cc4e774c62fbd4875197cb5578ce [3143/13002] drbd: replace genl_magic with explicit netlink serialization
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260611/202606111922.IaJSwCrY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111922.IaJSwCrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111922.IaJSwCrY-lkp@intel.com/

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
