Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723D17CD;
	Wed, 24 Jan 2024 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706062611; cv=none; b=G5UboP0MpQX3fFLDEPmEVmGb2Ug23jb2MnCZKmTa/yITS8Jz7i4KTZueI4reDN3TaHjyEwpZxhb4O4IcW0XwiMMSxNIPoqxB2cbGqjmjDuIpWiuOxdz5oHOP1e4sFSJdOX9bn1LV/U2KNphR0Nr+7ndzPeB9zI530Lla33w2E7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706062611; c=relaxed/simple;
	bh=tqmVwmFx3j0FgUPnmri76pAgvPwoIiNDEUZOXNf/BNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FNiAavWaxKXvHzWCT5EjKzw73py4CXZfviYMx4uesRuGhDlD4rcO18umcoprbWnp7w8VglDtztnsSsBdjHEupPvnPGavS4nP3naQ1tgkpEERjqzj/j6jhgrhy799nSt2bF26eo2zJgbEj2/lFc3FAnyYWCabA/wFH0ya+BANG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EW8TKHO7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EW8TKHO7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706062609; x=1737598609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tqmVwmFx3j0FgUPnmri76pAgvPwoIiNDEUZOXNf/BNc=;
  b=EW8TKHO7wiHy7HYSE/M/nu7Ab6O3CqsUToKJSYyQeCqb3yWbwkNXEkgn
   5B1O8Nmkfna+BEBKhmgmmRbhri1wIJVi4GJDl+W8lb7Yx8Zp2ZvAO70O7
   c3inhClY2dlJOc0b3WwtKnkXRfFx8SsvQFG55Cm84JRHbUwJBhxYe15jm
   QMoVQ1i7VCoTXl+Z+LuF5Rx0vF8vYlfxCyxn1ZT6iIKSsj9MvG4x/Rkf9
   Jap2I9DVgdL/JS3Wb1Gqe/0OH8M+MkU4kgykXvieR8DCVFv8bdtorNzjg
   7iZsI8RimN1LnWZSI/rUK03SIYAJMgO3k3UmT3/rfx0QQoELNGXFDWkra
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8474537"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8474537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 18:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="27950651"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2024 18:16:47 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSSom-0007nd-1y;
	Wed, 24 Jan 2024 02:16:44 +0000
Date: Wed, 24 Jan 2024 10:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-rtmr 5/6] arch/x86/coco/tdx/tdx.c:91: warning:
 expecting prototype for tdg_vm_td(). Prototype was for tdg_vm_rd() instead
Message-ID: <202401241058.BAepzLFx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-rtmr
head:   69224edf428babfd955487a0de70c537098e040e
commit: 9fb6a741dc8e5c42c78c97b9762686526aa1e04c [5/6] x86/tdx: Add RTMR read/update interfaces
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240124/202401241058.BAepzLFx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241058.BAepzLFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241058.BAepzLFx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:91: warning: expecting prototype for tdg_vm_td(). Prototype was for tdg_vm_rd() instead


vim +91 arch/x86/coco/tdx/tdx.c

    79	
    80	/**
    81	 * tdg_vm_td() - Wrapper to read a TD-scope metadata field.
    82	 * @field: Metadata identifier ID
    83	 * @data: Buffer pointer to store the field value.
    84	 *
    85	 * Refer to section titled "TDG.VM.RD Leaf" in the TDX Module
    86	 * v1.0 specification for more information on TDG.VM.RD TDCALL.
    87	 *
    88	 * Return 0 on success or errno on failure.
    89	 */
    90	static int tdg_vm_rd(u64 field, u64 *data)
  > 91	{
    92		struct tdx_module_args args = {
    93			.rcx = 0,
    94			.rdx = field,
    95		};
    96		u64 ret;
    97	
    98		ret = __tdcall(TDG_VM_RD, &args);
    99		if (ret)
   100			return -EIO;
   101	
   102		*data = args.r8;
   103	
   104		return 0;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
