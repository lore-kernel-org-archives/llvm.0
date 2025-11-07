Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE11A221D87;
	Fri,  7 Nov 2025 00:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762474418; cv=none; b=TttE0dOFqNd077jFT27hOiy8josu+x1n/wxXVJ7KSHtwCTJHIy5uxp6PTUhQ+Z3wI5P2h/PLZTvUP5zAce2RLfGE3R+oeTv763YMtcVdnXe3CuwHmYUyccFCWCRKAVokIf7/KdToK0GeNPPUgu/AhMwAqCRJOElRTkX/UvXJJZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762474418; c=relaxed/simple;
	bh=2u4onrW1UIHYO/vrNYmY+JJnCXuAk11e42H3y3FcxMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzIqgXxpSr4GxTnILKkScPsXG55rumq1qLBRz0hNYHM81kC0f92QhP87kVF3wcKvo2HCaXQqZ6igEDdau7flBqJNP9bmcLHq4t27NqLNaRGXcIB+6iTqnuCVHDFiHclKEVhP9RcZ0puvjS4hacadYUENQCHj9tOxlbDQG6G6Q+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nI8YaQBw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nI8YaQBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762474417; x=1794010417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2u4onrW1UIHYO/vrNYmY+JJnCXuAk11e42H3y3FcxMs=;
  b=nI8YaQBwiGaGqqX3CqyDVcwnWPO3yJYoiwrUn5bneGp2XzUMKIiy7zh2
   KC2MrQPQYBDlDGwv8I2b5HH+FU14hqemZ2NZq3jwl5ciSFPHpsIcKa5Z7
   +21WSb5x7iQWe+XjB4H8CgfFNtoA914JAR5gu2gfJyAzt17B6Uvn4aUol
   QIMKJI3Skg4mX+Bb93BZut+phen3QhqV0xY18xiDhYmIuaUTP8JC2dvOR
   b7JmxK+x2RJj5g5No1aV7Pto2Tkzysk2vbFlycNn5yexqAYYLmD7GhG8O
   wdIt0WeTc6eRDaoNYhstmQob2ethsy5eimdBJ3ycivQdW8PkzdXrngQZC
   Q==;
X-CSE-ConnectionGUID: B08xa7agSXe0sLJcqubn4Q==
X-CSE-MsgGUID: ReZ0QBwnT/q10h7LrY+8EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75977139"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="75977139"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 16:13:34 -0800
X-CSE-ConnectionGUID: DUnYCn2xS7uSIeOWmK2iaA==
X-CSE-MsgGUID: tpitvUBxSmGAnfkDhSxq3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="188060916"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Nov 2025 16:13:32 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHA6B-000UUS-36;
	Fri, 07 Nov 2025 00:13:12 +0000
Date: Fri, 7 Nov 2025 08:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, will@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, linux-arm-msm@vger.kernel.org,
	zhangsenchuan@eswincomputing.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] PCI: host-common: Add an API to check for any device
 under the Root Ports
Message-ID: <202511070717.PZBzRyQO-lkp@intel.com>
References: <20251106061326.8241-2-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106061326.8241-2-manivannan.sadhasivam@oss.qualcomm.com>

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.18-rc4 next-20251106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam/PCI-host-common-Add-an-API-to-check-for-any-device-under-the-Root-Ports/20251106-141822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20251106061326.8241-2-manivannan.sadhasivam%40oss.qualcomm.com
patch subject: [PATCH 1/3] PCI: host-common: Add an API to check for any device under the Root Ports
config: arm-randconfig-001-20251107 (https://download.01.org/0day-ci/archive/20251107/202511070717.PZBzRyQO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070717.PZBzRyQO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511070717.PZBzRyQO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/controller/pci-host-common.c:27 function parameter 'root_bus' not described in 'pci_root_ports_have_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
