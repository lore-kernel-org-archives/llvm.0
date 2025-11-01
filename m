Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BE32F3614;
	Sat,  1 Nov 2025 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761995270; cv=none; b=tEMKlr32RfmSZ63bZVxc0Mrt8ZK1tHLYoSHRYOnNuywgabas1aiHVTFOhTy3iAutF+yWDWXvnzCjyXOuj6wRxKYFKUYCgEn86rwR4E5cc9RmRBXf6mNuqA+ic0+E3KnlPoaCVbDvlHTRHwxKTeo0wLyYmd5XssmNa1wDXG+Rwm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761995270; c=relaxed/simple;
	bh=KiBsSbViKMDxxR1+aLrfoJnj3kQ563rOF1uBzwFrkzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PADyIJ9ZuYm5qyXqU/nAxKNmIeBMIJ4rKBA8Cbkk/yp/NXKIRP+7pQ+Q13uMf+Nb8ucaq1onFgRpogUIoBWeV62vz2AiRXMb9fRpX7AvqBlY2VKdWN1yRHRzC9b3G+bvOLpEwgYBa+UVfFFUl4Rbgh4qfDdeEsaTxHF2kG5XPvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKMq41h+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKMq41h+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761995269; x=1793531269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KiBsSbViKMDxxR1+aLrfoJnj3kQ563rOF1uBzwFrkzk=;
  b=XKMq41h+J11j00KFGu1bEfjVFnvwvHPd006Tm76GKYtKImv5PRvYtpQL
   UVPQ7PaK+kgngu+0hXF+OVnWOnGwNonNV3QhwMhIPLa9UIoHbynjoZ3lu
   on6qOn0zW0z06Q4iNx01b7CgshMzWXMpHVgmYJ6U+7ezOUkamR43oItFD
   HTLyIMuIPL/Mo4Stj4mJI+muY7pJ+OaDYJL24crbWpxg7VpgY6qtAQCSR
   mB8pt4BSD3ulS8k5hLPqbXUVbyzveproRpd7fIg/pW3k4UVj1Bss/T0pq
   7PXDLFHsY+FNW61dV+WOtUvdS01g6/dnzZoaO4NOe9v9dO2idoVekqBKa
   g==;
X-CSE-ConnectionGUID: yrWV4+8OTruufeJxi1CMBw==
X-CSE-MsgGUID: kJ3zAvaaSDmYaOGBm552fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75592506"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="75592506"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 04:07:48 -0700
X-CSE-ConnectionGUID: 7NZDx6euQNyyDNaldPJczg==
X-CSE-MsgGUID: 2+Wci7r0R0ir1K52qe1bzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="185665250"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2025 04:07:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF9SL-000OAU-1R;
	Sat, 01 Nov 2025 11:07:39 +0000
Date: Sat, 1 Nov 2025 19:06:36 +0800
From: kernel test robot <lkp@intel.com>
To: Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
	Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mahesh Rao <mahesh.rao@altera.com>, devicetree@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: intel: Add Agilex5 SVC node with memory
 region
Message-ID: <202511011821.wW4mmrec-lkp@intel.com>
References: <a3182556c07839dcd9227fa6a4a9d295507f3e8e.1761643239.git.khairul.anuar.romli@altera.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3182556c07839dcd9227fa6a4a9d295507f3e8e.1761643239.git.khairul.anuar.romli@altera.com>

Hi Khairul,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khairul-Anuar-Romli/arm64-dts-intel-Add-Agilex5-SVC-node-with-memory-region/20251028-183009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/a3182556c07839dcd9227fa6a4a9d295507f3e8e.1761643239.git.khairul.anuar.romli%40altera.com
patch subject: [PATCH 2/2] arm64: dts: intel: Add Agilex5 SVC node with memory region
config: arm64-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011821.wW4mmrec-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011821.wW4mmrec-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011821.wW4mmrec-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
