Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124984D34;
	Thu, 30 Jan 2025 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235065; cv=none; b=n4jbG4J1ASI2Sb267n7GOzrOuVgpIfTNs2VJxDXSlwMP4WzcRpyTPOoWUM8uL94YxeLcsrJi7eBkT7h0ZypjDqdbvx+OjQxlxLahwUfjR4I85txyh44537MMlLxjMMzuDyEqPR1e7aJN+cXncomHhmTl2xxy42AYJ8/tTQ7oys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235065; c=relaxed/simple;
	bh=2k+qU0aqUeB5AVTNSg8YX84kjoXk5A4JHrsg001ZOTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+Vr1vmRxF5lMRG7tGr2uWFrirUYzH6FbKAVLEHcNX1ipQvDX8wvsbDQ9s6DAX/cfkeMRdUqLVIp+ZROTU2yJQRkJibOQHkBXi3A2akQYL3g+v4ImaBxW6MJrPM3CwTmXr1cjEaSn+2VQWzaP0VPpFwQzJkUD908VeJtIDIdCkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXsAic+6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXsAic+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738235064; x=1769771064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2k+qU0aqUeB5AVTNSg8YX84kjoXk5A4JHrsg001ZOTU=;
  b=kXsAic+6drfn9cc6X4i9U+Q7EvhLD4E4ZdOyNm0IL3pda+WCpM6v/xgR
   48igj6wLB/ZIrbDfG0r6UYnTkE3ASkRlJRStfF8qBNhmhHl2SYwAdpqCe
   w+c2NkhAxFnSS1CIBDoylCdPCgce71+M85Cu/yYyEb+stt76qWbt9yqoz
   uCt33nt+Vjh0wn6tk8O8F4BAC643vXkAelNkDnc2g7u1sHTEpGC85RP2z
   7ghJElEkIRQ5g3MqfJGXZ3opkumKW/9VUDtvpAmXCdvjv2fTnbyPFcF70
   Ms6MaRR2g1RKWSDmQJLm9ePLCVxWwQOWr51PNNzIY3m15NEsjKPUKdDLA
   Q==;
X-CSE-ConnectionGUID: Z1rloUhjQuqWq2hNH1ELxQ==
X-CSE-MsgGUID: HFwaiVfeQgO17fCMNUkvdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38661851"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="38661851"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 03:04:23 -0800
X-CSE-ConnectionGUID: BsCtKS60SXOZdLVR3sFmhQ==
X-CSE-MsgGUID: BfuIiiq1RyaL54GZlIL6Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="114329576"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2025 03:04:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdSLL-000jyR-0m;
	Thu, 30 Jan 2025 11:04:19 +0000
Date: Thu, 30 Jan 2025 19:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 38/49] ERROR: modpost: "__tty_alloc_driver"
 [drivers/tty/ttytest.ko] undefined!
Message-ID: <202501301951.JaG74RTf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   a2ea6ca94c68a7ab616969102e07614d1be0a5a8
commit: 34e336a961ca6b92723a8bed2c79c51e94911942 [38/49] ttytest: add
config: x86_64-buildonly-randconfig-004-20250130 (https://download.01.org/0day-ci/archive/20250130/202501301951.JaG74RTf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301951.JaG74RTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301951.JaG74RTf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/exportfs/exportfs.o
>> ERROR: modpost: "__tty_alloc_driver" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_std_termios" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_register_driver" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_port_init" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_port_register_device" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_port_put" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_unregister_driver" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_driver_kref_put" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_port_unregister_device" [drivers/tty/ttytest.ko] undefined!
>> ERROR: modpost: "tty_port_open" [drivers/tty/ttytest.ko] undefined!
WARNING: modpost: suppressed 4 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
