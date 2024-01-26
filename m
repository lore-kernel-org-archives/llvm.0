Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD861CD36;
	Fri, 26 Jan 2024 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706280989; cv=none; b=qLGAn/weQISvpUl+Go5Nz0driutqdDSA8NUpSVSB3KxCXoFZeWUOVRF6lxFxvGx/diCvK3iFsCPgB2TLviSX70MsVMI/JV1iUDSI+6vM/7y0moNW0i7Xg1PXHUDeeMZ3PUS6N2V0svHRIkR796Krta/9aDhIAmCrv28HhIxU5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706280989; c=relaxed/simple;
	bh=I64ObxpqFP05rSwgn1VCw28WF1nFGqRNMIIqcKbAx4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOKH7kis9Flde8azW/iIIwOKapgS/kyxAgB6bjszbKQc/dIlG5m976LOLZCqKTNVfHjHHvAPYln2pEf/y69dSsz08fBrhatV7nEDgqamI8QqMJxqguoZ39CRsVYIHwiTYP2MKkYe+zbbb8mmisTu/slEF8oCTrOD5RdPP+8Zi1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8U0AJlK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8U0AJlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706280988; x=1737816988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I64ObxpqFP05rSwgn1VCw28WF1nFGqRNMIIqcKbAx4o=;
  b=m8U0AJlKuaaPeNaEnHmkafUqqzYW1WRJzBOBnWzZMfAHhnOXbtsPNSGU
   Esdbq956oue3MmKUX1/8hXuTFFyAY+EAhszQGvDuSiJi2xdoKq3+OfhTa
   Ds1QDv4NNkms6LibZdOd+/dgX9Rqz0XsPz1TL1ahx8ufzlOwonzRJ206m
   NXg6dLVY11cD42F3Jf1LffAzzJOX4eLKv/a6Wnt2VyYt5yn3deK3ZzTfc
   ySsN0XAG0zeX4kYLfMORfHGPnmZtZJm3JNEVrJgiLHu+ZHA2Bz/toGjF4
   4YgIQxAmNG8BP781xmSdJU7xMoG6xEQ55fpyDqzDTn4m2jma5b2J5szLt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2357017"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2357017"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 06:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="877415842"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="877415842"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2024 06:56:22 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTNcy-00016j-2l;
	Fri, 26 Jan 2024 14:56:20 +0000
Date: Fri, 26 Jan 2024 22:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm 2/6] arch/x86/coco/tdx/tdx.c:935: warning:
 Function parameter or struct member 'irq' not described in
 'tdx_free_event_irq'
Message-ID: <202401262229.8XOFIbqG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm
head:   479fce1c3eaa87d98d94d78c485d9a6f0c8dd1fa
commit: ffdec3c278a0a9581481aded679ead9ff5308ef1 [2/6] x86/tdx: Add tdx_alloc_event_irq() and tdx_free_event_irq() interfaces
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240126/202401262229.8XOFIbqG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401262229.8XOFIbqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401262229.8XOFIbqG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:935: warning: Function parameter or struct member 'irq' not described in 'tdx_free_event_irq'


vim +935 arch/x86/coco/tdx/tdx.c

   929	
   930	/**
   931	 * tdx_free_event_irq() - Free the event IRQ.
   932	 *
   933	 */
   934	void tdx_free_event_irq(int irq)
 > 935	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
