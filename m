Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D46A238C1F;
	Fri, 27 Feb 2026 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772202150; cv=none; b=emWGMXYfwJ5Ym3h8wx8omZAVdEEsqI6FoWQ7Yw79lehCxweqwtekCVvD+q5VYkoDRarsHhnUXUeyZYe9qta8lYPZp6ZZCb4hY3tg4eeoh8Bvip87C1af7asjWhoW74RM+NtGkvMlsfO1QDMrKE7KN558feRzUu/WzqYxY0C5jeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772202150; c=relaxed/simple;
	bh=MwJlippBhjbnFax4Ckg91H9M2TRxqyDMP73IKGh0OOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nH6Qsdm5t+k3SyeGKP1A/ylXn5L/7Yx/FzBfkIWq2W3toRcMX1ZKtA7o8IXXPFP3yYEyiQpoORHv1nMJGFGeaeTqe+8ikN3HHN3KqTA6r12aieohH8sAfjNLTGsrlV7rC9P+8E7LJO5hmtlFMAZCdYpj0kbnZn22cA51JZB/H7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEem9uuu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEem9uuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772202149; x=1803738149;
  h=date:from:to:cc:subject:message-id;
  bh=MwJlippBhjbnFax4Ckg91H9M2TRxqyDMP73IKGh0OOg=;
  b=XEem9uuuE6bsAHTM21ea7+B8+U7P0yFVSEsVgnP9DBoF3Gu0OJieHbtk
   ZLXvtB9Okn6ID/WkQPi9+6Fb2hK7yb5WxdnHjP+aTsd+mTJA0GHbB7pPr
   m3Bf2XFxg+kYlGU3hIk/USOJDQ7U5VyE4xPHtmf2AZB1yuLdDZeC0sOi8
   0omTFOl0oborXH5e602T7gOf7SY04MipsNpaC3Md7fS+O5KDeKPp8zQih
   gz+ohp2KRHcJ1ZJd8Bsq9MpEbR3WurmzHUNQszLofQulHQ7mPxuuswS3x
   pVnFFGM/JCYT8eAaJnazdCbZ7IkTPU6unth/rBf562Vq5pcJ80pi1ZyuZ
   w==;
X-CSE-ConnectionGUID: j42iXHmXTeyFzj8t0WwjMA==
X-CSE-MsgGUID: AqWMJXBlQsaNrOeonA7x7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83615059"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="83615059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:22:28 -0800
X-CSE-ConnectionGUID: CP22tlzfSge4RXIv1vx0HQ==
X-CSE-MsgGUID: VXDI9+0dTU2w3N0OkppbOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="215547023"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Feb 2026 06:22:26 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvyjY-00000000Aez-0YOQ;
	Fri, 27 Feb 2026 14:22:24 +0000
Date: Fri, 27 Feb 2026 22:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260226-0944 30/32] ld.lld:
 error: duplicate symbol: get_platform_config
Message-ID: <202602272222.1NdXszqv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260226-0944
head:   06fbcbb2c9e97584450614a6d14c0d0f978b8209
commit: 62158d11e11c670a30dd0becb21732fef40a1ab8 [30/32] RDMA/hfi2: Make it build
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260227/202602272222.1NdXszqv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602272222.1NdXszqv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272222.1NdXszqv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: get_platform_config
   >>> defined at platform.c:108 (drivers/infiniband/hw/hfi1/platform.c:108)
   >>>            drivers/infiniband/hw/hfi1/platform.o:(get_platform_config) in archive vmlinux.a
   >>> defined at platform.c:108 (drivers/infiniband/hw/hfi2/platform.c:108)
   >>>            drivers/infiniband/hw/hfi2/platform.o:(.text+0x40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_get_platform_config
   >>> defined at platform.c
   >>>            drivers/infiniband/hw/hfi1/platform.o:(__cfi_get_platform_config) in archive vmlinux.a
   >>> defined at platform.c
   >>>            drivers/infiniband/hw/hfi2/platform.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: qp_to_sdma_engine
   >>> defined at qp.c:540 (drivers/infiniband/hw/hfi1/qp.c:540)
   >>>            drivers/infiniband/hw/hfi1/qp.o:(qp_to_sdma_engine) in archive vmlinux.a
   >>> defined at qp.c:560 (drivers/infiniband/hw/hfi2/qp.c:560)
   >>>            drivers/infiniband/hw/hfi2/qp.o:(.text+0xd40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_qp_to_sdma_engine
   >>> defined at qp.c:0 (drivers/infiniband/hw/hfi1/qp.c:0)
   >>>            drivers/infiniband/hw/hfi1/qp.o:(__cfi_qp_to_sdma_engine) in archive vmlinux.a
   >>> defined at qp.c:0 (drivers/infiniband/hw/hfi2/qp.c:0)
   >>>            drivers/infiniband/hw/hfi2/qp.o:(.text+0xd00) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: qp_to_send_context
   >>> defined at qp.c:565 (drivers/infiniband/hw/hfi1/qp.c:565)
   >>>            drivers/infiniband/hw/hfi1/qp.o:(qp_to_send_context) in archive vmlinux.a
   >>> defined at qp.c:587 (drivers/infiniband/hw/hfi2/qp.c:587)
   >>>            drivers/infiniband/hw/hfi2/qp.o:(.text+0x1080) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_qp_to_send_context
   >>> defined at qp.c:0 (drivers/infiniband/hw/hfi1/qp.c:0)
   >>>            drivers/infiniband/hw/hfi1/qp.o:(__cfi_qp_to_send_context) in archive vmlinux.a
   >>> defined at qp.c:0 (drivers/infiniband/hw/hfi2/qp.c:0)
   >>>            drivers/infiniband/hw/hfi2/qp.o:(.text+0x1040) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: qp_iter_print
   >>> defined at qp.c:599 (drivers/infiniband/hw/hfi1/qp.c:599)
   >>>            drivers/infiniband/hw/hfi1/qp.o:(qp_iter_print) in archive vmlinux.a
   >>> defined at qp.c:622 (drivers/infiniband/hw/hfi2/qp.c:622)
   >>>            drivers/infiniband/hw/hfi2/qp.o:(.text+0x4200) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_qp_iter_print
   >>> defined at qp.c:0 (drivers/infiniband/hw/hfi1/qp.c:0)
   >>>            drivers/infiniband/hw/hfi1/qp.o:(__cfi_qp_iter_print) in archive vmlinux.a
   >>> defined at qp.c:0 (drivers/infiniband/hw/hfi2/qp.c:0)
   >>>            drivers/infiniband/hw/hfi2/qp.o:(.text+0x41c0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: qp_priv_alloc
   >>> defined at qp.c:669 (drivers/infiniband/hw/hfi1/qp.c:669)
   >>>            drivers/infiniband/hw/hfi1/qp.o:(qp_priv_alloc) in archive vmlinux.a
   >>> defined at qp.c:692 (drivers/infiniband/hw/hfi2/qp.c:692)
   >>>            drivers/infiniband/hw/hfi2/qp.o:(.text+0x5e40) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_qp_priv_alloc
   >>> defined at qp.c:0 (drivers/infiniband/hw/hfi1/qp.c:0)
   >>>            drivers/infiniband/hw/hfi1/qp.o:(__cfi_qp_priv_alloc) in archive vmlinux.a
   >>> defined at qp.c:0 (drivers/infiniband/hw/hfi2/qp.c:0)
   >>>            drivers/infiniband/hw/hfi2/qp.o:(.text+0x5e00) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: qp_priv_free
   >>> defined at qp.c:699 (drivers/infiniband/hw/hfi1/qp.c:699)
   >>>            drivers/infiniband/hw/hfi1/qp.o:(qp_priv_free) in archive vmlinux.a
   >>> defined at qp.c:722 (drivers/infiniband/hw/hfi2/qp.c:722)
   >>>            drivers/infiniband/hw/hfi2/qp.o:(.text+0x7740) in archive vmlinux.a
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
