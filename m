Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAEB1DFF0;
	Sun, 29 Sep 2024 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727645781; cv=none; b=rF5iUKaK8qKmIDY1o6TUllL0tz4Ptmj4+st0y36wru5JUh5p9Jk2J+0GP5bS323CEQgFM+ergZRVqB1rCyShsEGL7Uef5eFDo5marJYWAqijVRZkd771jWpWXG2bWGzZYmmM92cyoaE+MscBBW9ApXL0nXtuzNxre72/5qDm35A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727645781; c=relaxed/simple;
	bh=cJ35YExUBC6nadm+eaeXhh+ctE+7ijnS2LqrrIOwaug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cBArM1P5ivHEgCn3kO1P7267QX4AASPp1KNo55WUjBTzCSM6/91kvcZWJUl3jRizskoDMU5vAo7hvcbHvcb/ANEC1yjXt064hLdLbapD0I/IAkgmOQFPSAj5f3mFkLd84gr1QtXmR2lFBL6JpW+672jrv3mkc/A5iEX7rW1AKW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqFB93QV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqFB93QV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727645780; x=1759181780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cJ35YExUBC6nadm+eaeXhh+ctE+7ijnS2LqrrIOwaug=;
  b=LqFB93QVOObsXTPoHave/yUb3eKvp85hbA6bfNrGvqjn5xLwOxpBvxZQ
   7awcmVRTa392earu8+hCzi3ZPCOMhutVEmeopaIe0Cb/WoOG9qxgRsjG+
   bAHcn/IslNRPRr81jx+RDgNPr1iFuvJmrrEz2KBZFYI+r9q5meB2pWQmo
   7UoycYEyrXCmC5XiAK9RRmXIx+d+uKq6v9peq7HjmMiLqusJvbbNORWZi
   Ce1j7Q5g0MIvJGha8CTHSVFdf1HM/jnFW8CMo4ABZxy3FCkY3ql48x2XI
   mY/A0yhdJQE+a+DXNVwElPNrkZUbJN5068RiGk5YfGcrf+1enUaF4exjo
   w==;
X-CSE-ConnectionGUID: v9SAT/rlR/ifPOXUaXh0Jg==
X-CSE-MsgGUID: xs8RBcxWQPOhZMETF+xc7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30424166"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="30424166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 14:36:16 -0700
X-CSE-ConnectionGUID: u+1z27tkQTO3OuLNI3Dx0A==
X-CSE-MsgGUID: zrpcN4rdRimAdMGQp+4rWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73888313"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Sep 2024 14:36:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv1aO-000Ojs-1o;
	Sun, 29 Sep 2024 21:36:12 +0000
Date: Mon, 30 Sep 2024 05:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 25/26] ld.lld: error: relocation R_X86_64_64 cannot
 be used against local symbol; recompile with -fPIC
Message-ID: <202409300536.ZjxlIetO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   2b9142b6c6241b0debfe0d21c911c3aaf0c05670
commit: 8fbee41d40057c6a4cd0595475fd3c92bc7a0133 [25/26] x86/kernel: Switch to PIE linking for the core kernel
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240930/202409300536.ZjxlIetO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300536.ZjxlIetO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300536.ZjxlIetO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_X86_64_64 cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/x86/kernel/head_64.o)
   >>> referenced by arch/x86/kernel/head_64.o:(.init.rodata+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
