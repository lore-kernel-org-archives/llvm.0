Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7E13B6363;
	Thu,  4 Jun 2026 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590726; cv=none; b=BEr+bw9cAFUwyOpAGFffE59SLq+gPOqaZRa8LU7QbWyicl+71S98ia4XFZsEkt/ul3rs8uSxG8Rf86crF7AuZNb/EsW99wR+2A19ukzZORuGa9ln3GD98f7AE7g3Tg5YxwpDaAuIGNzGayaMC9vBiAY2YA/PrbPnvig4lzIF6Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590726; c=relaxed/simple;
	bh=fXpBxqROFPJ4zku8Z90PN5SeF6qExYaF4VgwNxixemE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gh8jvDLlWerGzXHUYHXEHfKSkIWpAmrRwZ08XwUoedqBSMudOO1qcbAJsKCIjUS7e3mVf/a7N5TNybkJTYtW3ciay4qUaDyiIvWqzG4CDKm2oH/PcI445ezZq2AvyhZSlZ3F2cXi+fUtATxXaZ+b6tFSTsr2WoPleiDIqbbFoMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LGFbL41j; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LGFbL41j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780590725; x=1812126725;
  h=date:from:to:cc:subject:message-id;
  bh=fXpBxqROFPJ4zku8Z90PN5SeF6qExYaF4VgwNxixemE=;
  b=LGFbL41jGfa9iblQobkfo3dgMgK+jx7fH3ax1LYhm7d91ptaP1zT2OU7
   IDOpMEfEM4pFnv+gHcnZwrPatNhQPPmlXef4YCPnxvqvCn2krP5l73BMG
   wI9+n7OT9FFSIpz6I2NGdhIRJl94lXMzqkWV27Y7fnoF7bSC3cRhvXwHz
   vy/UjbdZBEhi5ddG6MFqO+TZsNqtniHhyKqQuUR68BVOlUKi6eyYmDHZb
   zMuQPVaqeqkj4DaX9Lbw9Vxy9DVX9slRRx8R5Fwim78lLXF6uAhjx6p+7
   n4JWV3RbCrrG0PqkbqxRAttKGkd00FUwkDFwm452JytUHaitzpXsy3Qn7
   g==;
X-CSE-ConnectionGUID: elvmvi/ER+GPHilqivYOCw==
X-CSE-MsgGUID: Bu/Eh0Z2Q7ax4dlC9BW7pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92530672"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="92530672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 09:32:04 -0700
X-CSE-ConnectionGUID: EtyvINlqTimj/izOU8Aydg==
X-CSE-MsgGUID: vC5BHr4aSJiOUyunkQqPhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="240124070"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jun 2026 09:32:01 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVAz9-000000002M5-1swo;
	Thu, 04 Jun 2026 16:31:59 +0000
Date: Thu, 04 Jun 2026 18:31:09 +0200
From: kernel test robot <lkp@intel.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Harald Mommer <harald.mommer@oss.qualcomm.com>,
 "Mikhail Golubev-Ciuchea" <mikhail.golubev-ciuchea@oss.qualcomm.com>,
 "Marc Kleine-Budde" <mkl@pengutronix.de>,
 Francesco Valla <francesco@valla.it>
Subject: [mst-vhost:vhost 5/37]
 ./usr/include/linux/virtio_can.h:29:35: error: // comments are not allowed in
 this language
Message-ID: <202606041812.lddXUy2x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   7a85231f762aa97b945878abb9a26683486836c6
commit: 2b6b4bb7d96f407e42bfe28c4cd9ce8f7a59ab69 [5/37] can: virtio: Add virtio CAN driver
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260604/202606041812.lddXUy2x-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606041812.lddXUy2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606041812.lddXUy2x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/virtio_can.h:29:35: error: // comments are not allowed in this language [-Werror,-Wcomment]
      29 | #define VIRTIO_CAN_MAX_DLEN    64 // this is like CANFD_MAX_DLEN
         |                                   ^
   1 error generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
