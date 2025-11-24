Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8276072628;
	Mon, 24 Nov 2025 18:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764010357; cv=none; b=TUvZ2hOdh92jgohKmC6/qGcwpqldIL/CmQ0lBXR3c7cRpTVYEfQEnlfrP4WqlF8k0N8WRQ80Z2rQLMFvLpD5jGIA06OtBidhXKaoszx9wvfsMtz39QuOf1kMhXDDgb4kJYn3wWbwb0AaIjmm6lxjUqfjXfGvaSaRzlZk40SPCTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764010357; c=relaxed/simple;
	bh=wnqYvZ4LMMuouYLTGXsXY8l4D27WCxXD1X9V+Y1A4iI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJkR7pYkFLYB17yyBULhxN/DT3SsitB7mLUOm5sGlA54O3yW87tNG00oNkfFyYMJwxOJTlLBfSJF5ReUGEPj546QwG3p4fiG+xfa1S9+/67TtZYuSHXrpzBTXi5N0aLCQEURDjlxD0SIbOTjictxF3xZcY8ZA8kdCCMul91hGLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAuiD0dj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAuiD0dj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764010357; x=1795546357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wnqYvZ4LMMuouYLTGXsXY8l4D27WCxXD1X9V+Y1A4iI=;
  b=nAuiD0dj9pnl03mRQRczH3upGNFcVPj4Yt/BSyvbB0zUUv7EQlLeB4Jo
   qbkdhu/RJLfyrzMzQeyI5bXUOcMnDnwsn5aX/O1UGuT06ri6MoytpoTRz
   gNt29EjrX0f+fGm4fmnNhdS5OTH+UqjZVpxL/X1d6SfInsL6/m1DZ6uM4
   brMMDWSoSWn6Vz95wwVPIegHSkBV9fKNWahZgyWrbdhY2A6ZMca6WnK2L
   fSxGeXLCEqOVT4EUcE5gHYR1vQMr6k6TCY1gP3ugd5Zvq2NeOWaH+T6hG
   yMQeN8hrEHa0ybZqZR6veqH115SBZZE4piRRWtFCSwwCkLT9SV8XkSYab
   Q==;
X-CSE-ConnectionGUID: oG7ZyEiMQS2UqKzTKQtdpw==
X-CSE-MsgGUID: ZMJnS7XXTFq61Fz9Fw1iFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69635311"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="69635311"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 10:52:37 -0800
X-CSE-ConnectionGUID: sUO1jVoySnK04vMMPI+tvQ==
X-CSE-MsgGUID: YJ9zdHIxRbqKwxuEf/a/7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="229698796"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Nov 2025 10:52:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNbfs-0000000012b-1An9;
	Mon, 24 Nov 2025 18:52:32 +0000
Date: Tue, 25 Nov 2025 02:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Siva Reddy Kallam <siva.kallam@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>,
	Usman Ansari <usman.ansari@broadcom.com>
Subject: [rdma-rdma:wip/leon-for-next 38/54]
 drivers/infiniband/hw/bng_re/bng_fw.c:278:2: error: call to undeclared
 function 'prefetch'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202511250215.VMVtdDPm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git wip/leon-for-next
head:   4022c7b6342a4d9a97e1e974e27efca95e79ed20
commit: 23669ca628b3c39dc3cc43a5b4b93b4b5ab4d58c [38/54] RDMA/bng_re: Add infrastructure for enabling Firmware channel
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20251125/202511250215.VMVtdDPm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250215.VMVtdDPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250215.VMVtdDPm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/bng_re/bng_fw.c:278:2: error: call to undeclared function 'prefetch'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     278 |         prefetch(bng_re_get_qe(hwq, sw_cons, NULL));
         |         ^
   1 error generated.


vim +/prefetch +278 drivers/infiniband/hw/bng_re/bng_fw.c

   266	
   267	static irqreturn_t bng_re_creq_irq(int irq, void *dev_instance)
   268	{
   269		struct bng_re_rcfw *rcfw = dev_instance;
   270		struct bng_re_creq_ctx *creq;
   271		struct bng_re_hwq *hwq;
   272		u32 sw_cons;
   273	
   274		creq = &rcfw->creq;
   275		hwq = &creq->hwq;
   276		/* Prefetch the CREQ element */
   277		sw_cons = HWQ_CMP(hwq->cons, hwq);
 > 278		prefetch(bng_re_get_qe(hwq, sw_cons, NULL));
   279	
   280		tasklet_schedule(&creq->creq_tasklet);
   281	
   282		return IRQ_HANDLED;
   283	}
   284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
