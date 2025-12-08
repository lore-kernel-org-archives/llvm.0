Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BCC31327A;
	Mon,  8 Dec 2025 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765193227; cv=none; b=BNdA00NEZj9SUEGWqZtcdNcnRg9R2dTqxWvHbvKcJPv6OEIXvdvXW6t9iIW49R9TJR4OFck5onmQAx8B3rYtJyM3aGUoX7WaYZ85rGtu5hSVYIzOEz7n1br4TxJKqLQcrY34GLJ7Thy8jyYVBxRtaUgZiHT7uuWuy4maPtoAEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765193227; c=relaxed/simple;
	bh=o8EpAk0ISY56gp9mxbstBeDyrLfeaDG/5sjZgHKsAY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxJTMGW1zflWX8TbFyey5GlX4aPe+RCvKSEeewrgln7HHtXFV5UXAmKfivWsOdtMwAx2JatMBbNhllrsAwoCdCWj1cDSPxo9IOacemBD1dL9TGM1vLEdZzEUSZONlEx1Dse/K+AHhZSQCnVTArXOUoyVO+hRcy3jErBcmUxaqA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaWt/QFU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaWt/QFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765193226; x=1796729226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o8EpAk0ISY56gp9mxbstBeDyrLfeaDG/5sjZgHKsAY0=;
  b=TaWt/QFUTwfzmSUcLJYOVJEIOtHKCINWV6Xie4h0MUey9Fl2zuaoWnGQ
   jgb469py7wGEDnYqiLLn/bj1pI9dr1Rz5GuAj+xKLuRcJs6klid9mdKjK
   CgBmA2smP4CURvZKyjlyiY2+rcHBRwYaGUzP/dmO3dsLyHFoXainnCCWu
   gcULonJzRgnLAC9RFV5tLFEgEgsx9DT/Eum1I3U205tE7cSkN7XQHOFkJ
   /AIhRkSdscGR8dVtfsE4AC/UmJRXuL42oHGR8JiLB/is9/bb9xZFfUrnP
   bWRNf1JRt0KJZ3Ei4mU/lVxCVGK8xpNUtakSlS6PZQBNNHoP3zwqWhiD2
   w==;
X-CSE-ConnectionGUID: MdDcIhZQRPa8wVguXgaSPw==
X-CSE-MsgGUID: eOr5OtT6Rpy/pDX1MbeV/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="78249127"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="78249127"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 03:27:05 -0800
X-CSE-ConnectionGUID: zP14OahgSmaENafTGW6T1w==
X-CSE-MsgGUID: MyjMDi6PQF27ugBtcrrGcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="195810991"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Dec 2025 03:26:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSZOJ-000000000BR-2eV1;
	Mon, 08 Dec 2025 11:26:55 +0000
Date: Mon, 8 Dec 2025 19:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/7] rust: pci: expose sriov_get_totalvfs() helper
Message-ID: <202512081949.0BiprpYL-lkp@intel.com>
References: <20251206124208.305963-2-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206124208.305963-2-zhiw@nvidia.com>

Hi Zhi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.18 next-20251208]
[cannot apply to drm-nova/nova-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhi-Wang/rust-pci-expose-sriov_get_totalvfs-helper/20251206-205118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251206124208.305963-2-zhiw%40nvidia.com
patch subject: [RFC 1/7] rust: pci: expose sriov_get_totalvfs() helper
config: x86_64-randconfig-071-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081949.0BiprpYL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081949.0BiprpYL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081949.0BiprpYL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `pci_sriov_get_totalvfs` in crate `bindings`
   --> rust/kernel/pci.rs:521:38
   |
   521 |         let vfs = unsafe { bindings::pci_sriov_get_totalvfs(self.as_raw()) };
   |                                      ^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
