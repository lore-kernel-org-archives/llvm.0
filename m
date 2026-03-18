Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D38228CA9;
	Wed, 18 Mar 2026 04:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773807509; cv=none; b=jLff0NT7BNhnKItduYczcD4qcWbo5bGsyaiNtYwxUjJumzYtaGdk1yMAiiwPWjWJGn11P2Af4S3Uh2buVRP/88BeqJt6p5a0A6mIVTEEqpRUX8xVRGH3v9Qu8SmYOtAL/uUIHvd62kbnHB1B6ZxZDCJlQU6BbztKO57jzuVGiLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773807509; c=relaxed/simple;
	bh=eu79i8I6bO/8WoakLdjfaWlp/v2uZPdzn43NszfFR0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jX3mypCcV58saXgIpk7A/85kq/jpxiBgyKc26pJSEhKdxb40+5erMrc8nQRJusnp2fZx6V1Qqh1xaOlF9PGc56bIV6zu45B/1OT6p9h+WN2bW3kHmy/JzWu12Xw+VqTs77ly+kzYBtDHbhuj5DeEIVhbGfrCXcOYiDq6kwHGAu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9EQUj71; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9EQUj71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773807507; x=1805343507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eu79i8I6bO/8WoakLdjfaWlp/v2uZPdzn43NszfFR0s=;
  b=K9EQUj7143GPhMXOhuOGJisAxfRp2nm/HQKdEQrDSxB1V+s8uSjLTiIk
   QPMYN/cRvmM4iWhd+PvQx3nYR2w7utaKKM+g1tE9B4FHbnOVI0/59QGhc
   vT59kaqJcoLDBwbr+BlPvAcmdgTGZ7fmsSK0oo4K5Y7xDPabfY2g5SvQW
   oAmAWr33HtpYVFfkQcK4bk0eqrmROeXTLlEPwrisFa/LGLDkdIFfrTvix
   qbe0BlDz+dTcqVoBI1W47GKtDd32VRFXzmuXpJbo8nhGeDyCRWvhXA31q
   p4Gb7/VBh5Wt/WKus66hHA3M1kh45yhgGnYERJEq2nPJpDxsy8Z31Jw8C
   g==;
X-CSE-ConnectionGUID: erJR0RZ+RgOr33sJKxI/BQ==
X-CSE-MsgGUID: iX5rPkcGTWCADbVHF/VNKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85487736"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85487736"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 21:18:24 -0700
X-CSE-ConnectionGUID: SxtoevY+RLKMX+d6ZtAYDg==
X-CSE-MsgGUID: 4ZbXvAxST4+8EL4NHL0JOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226944381"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 21:18:23 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2iMO-000000002V5-18ak;
	Wed, 18 Mar 2026 04:18:20 +0000
Date: Wed, 18 Mar 2026 12:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5796/6828] ERROR: modpost:
 "rdma_resolve_route" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
Message-ID: <202603181233.gIWvTNla-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: 314794b19fb4b08aba87ff06d650a1d38c86c094 [5796/6828] drbd: remove BROKEN for DRBD
config: i386-randconfig-005-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181233.gIWvTNla-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181233.gIWvTNla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181233.gIWvTNla-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__rdma_create_kernel_id" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_bind_addr" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_listen" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_destroy_id" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_destroy_qp" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_disconnect" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_reject" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_resolve_route" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
>> ERROR: modpost: "rdma_accept" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_create_qp" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
