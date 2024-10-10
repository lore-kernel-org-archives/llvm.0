Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFA219884C;
	Thu, 10 Oct 2024 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588873; cv=none; b=TOX/UPZ/Fo7OBwZf8Q1iMW1gPNsMcZt4t4+c2U2mEuSp7IEihF2el1X4SROIm4nkaCyBPLIOvjU7imvVOGGG++6wTwlS1vv+JqLFrQtkJBOmJ42xeo2XzFPOdjPVUajt1/Ik1zlPrbNbSzGNNex7POzRMTPhpJMuuCRLvYohQ5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588873; c=relaxed/simple;
	bh=6qeTxHeOYFcnbKxdztI913JWcec+Zh7sWnliA0mcrds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWCIP6dOTjGL/So11iMH8WrPOKRNlIJbrdJ53Zk35Cd7GFOdLDXIEql07+MfBlNy2wu3LT+YQ/S2oxneAHzUidMWdkjiU0qJvuXPK7QFC7oUtwqA8p3glN5hqVMp5kvEsOJMwxZrm8jHD/NNwcnYYe2ss2Bpf9rBltCSyedaQ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1d7rxx5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1d7rxx5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728588872; x=1760124872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qeTxHeOYFcnbKxdztI913JWcec+Zh7sWnliA0mcrds=;
  b=m1d7rxx5j6TGhlnCK9W4HUIow9Byc2fYSCBXtbQaHdRARK6HAIck6rdk
   G3ey3e/g+m/5Q9D9vWxZhKNC4REiK0wEAy1C/Et0Vm0RpDk8Lcpa3YYMz
   xRspa0TqlHoGKygqx1Z3waVpvkIhIc9AXBFiHX9gkqvV+wTWiCpPenxBP
   fNRL1nZ6jA00wfqCDfKyGBknMJZX9+hLlsDH45E+rIK7AllF7+oqu8OPz
   +uIki2myybHWeGyQlmGSLX2nc+yrjX9GxZiA9J3c5M5m2MS/67/VBd/CA
   OIu7lqOic+p0qzfdNwmAtVOuoUuWYOd6czEzZYfwSdY0zpLLO7+wNxlRQ
   A==;
X-CSE-ConnectionGUID: e8WwA23UREiLHGRfY887Ew==
X-CSE-MsgGUID: lxqsv6p1TdmMOA1+fRg0vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39341183"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="39341183"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 12:34:31 -0700
X-CSE-ConnectionGUID: JUkGgX9kTxmHtPoUoGFPYw==
X-CSE-MsgGUID: 4vm5NpWQRuK7YDA+iSZEQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="77176888"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Oct 2024 12:34:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syyvb-000BBm-2O;
	Thu, 10 Oct 2024 19:34:27 +0000
Date: Fri, 11 Oct 2024 03:33:32 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm-generic-entry-v6.12-rc1 8/30] ld.lld: error:
 undefined symbol: __kcfi_typeid_invoke_syscall_asm
Message-ID: <202410110314.bICYyWSB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm-generic-entry-v6.12-rc1
head:   7b2eca4bdfe61b81812e6beb3afcef4be20f5575
commit: 079aa31aa4d9099001f4de64aff1cf91658f3c6a [8/30] ARM: entry: Invoke syscalls using C
config: arm-randconfig-001-20241010 (https://download.01.org/0day-ci/archive/20241011/202410110314.bICYyWSB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110314.bICYyWSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110314.bICYyWSB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kcfi_typeid_invoke_syscall_asm
   >>> referenced by entry-common.S:426 (arch/arm/kernel/entry-common.S:426)
   >>>               arch/arm/kernel/entry-common.o:(.entry.text+0x96C) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
