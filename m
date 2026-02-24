Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E6B37A489;
	Tue, 24 Feb 2026 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930784; cv=none; b=EVZpYned7xHewdXot8bNxJkLF1c++2FQHuGeClTk04EUjZrQkozDpxm1SReVnzFjqOeKcDkB9VeKH/2msR0X4sxcUwuDrvA1TIEqHRbxZ+zYbgHXr7TBMrTC7caCHfgV+cgSYIxc5gJpS+HNmyROUVkyEOqTIPHhiU88ijBABt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930784; c=relaxed/simple;
	bh=XqaIDn9C48D+kkCrdqXPpd/ftTaMNAglLCtmy9Nq4/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjm5lEs/i4+xRnZKA5qf2EOvJjpjDZDzxOqDCe3W1elhCbwGIChWUIJHd1eUufcCyuqqhVScdlW7yXqM1EIDV05sTTQJotlm0Ay8p7DauvhsnqTt9p7lRhryEGk//43ZGQj5TFssV0gU4BhMJs5YgvW6pmLyhE+UAAyV5Rlj0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DA5E40T0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DA5E40T0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771930783; x=1803466783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XqaIDn9C48D+kkCrdqXPpd/ftTaMNAglLCtmy9Nq4/8=;
  b=DA5E40T0GqphX7R4CkYeIpYobToHt8URswJxhoZruCHz+bNCQbszx4ak
   dq+2rDimJCJXLzp3ewsG0qWSSBf6GXDeuYTXFZqM96NO9ZAE2qf2Muft6
   2Pc4CUUTb1TCdF0v/6SNKkOrH80q2iU9Ws6ueNg568Dshj3J67462HilB
   8TiwYUTVEEDzoRn0TRhW1ojnfHfkRy/w4SpEjs6ux/EL8KQzCBQhEt10V
   XBYVosP1NhjX5HouWJ7eGwTu30ZnD3TF/VLH1QNvIX5QQ1pne3I4BVKtQ
   g2u12NwFel+u9i1iKaxA4UGJxfsPGzvKOJj1ffq3eMPwpctgqVGi0mXh6
   Q==;
X-CSE-ConnectionGUID: yodzbHmPSVSK7oLzSDLmmg==
X-CSE-MsgGUID: hINIv6ljRN6GwzAIM8ScgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="71973177"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="71973177"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 02:59:42 -0800
X-CSE-ConnectionGUID: ijAm9wCcTVSsG9qugLmgvQ==
X-CSE-MsgGUID: niWxXs11R92R3xTpPw/6TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="216036294"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Feb 2026 02:59:35 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuq8a-000000001qn-2vrd;
	Tue, 24 Feb 2026 10:59:32 +0000
Date: Tue, 24 Feb 2026 18:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>,
	Jijie Shao <shaojijie@huawei.com>,
	Jian Shen <shenjian15@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 01/37] PCI/MSI: Add Devres managed IRQ vectors allocation
Message-ID: <202602241838.ucXGHodf-lkp@intel.com>
References: <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>

Hi Shawn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus andi-shyti/i2c/i2c-host drm-misc/drm-misc-next linus/master v7.0-rc1 next-20260223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/PCI-MSI-Add-Devres-managed-IRQ-vectors-allocation/20260224-161502
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/1771860581-82092-2-git-send-email-shawn.lin%40rock-chips.com
patch subject: [PATCH 01/37] PCI/MSI: Add Devres managed IRQ vectors allocation
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260224/202602241838.ucXGHodf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241838.ucXGHodf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241838.ucXGHodf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/msi/api.c:304 function parameter 'dev' not described in 'pcim_alloc_irq_vectors'
>> Warning: drivers/pci/msi/api.c:304 function parameter 'min_vecs' not described in 'pcim_alloc_irq_vectors'
>> Warning: drivers/pci/msi/api.c:304 function parameter 'max_vecs' not described in 'pcim_alloc_irq_vectors'
>> Warning: drivers/pci/msi/api.c:304 function parameter 'flags' not described in 'pcim_alloc_irq_vectors'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'dev' not described in 'pcim_alloc_irq_vectors_affinity'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'min_vecs' not described in 'pcim_alloc_irq_vectors_affinity'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'max_vecs' not described in 'pcim_alloc_irq_vectors_affinity'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'flags' not described in 'pcim_alloc_irq_vectors_affinity'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'affd' not described in 'pcim_alloc_irq_vectors_affinity'
>> Warning: drivers/pci/msi/api.c:304 function parameter 'dev' not described in 'pcim_alloc_irq_vectors'
>> Warning: drivers/pci/msi/api.c:304 function parameter 'min_vecs' not described in 'pcim_alloc_irq_vectors'
>> Warning: drivers/pci/msi/api.c:304 function parameter 'max_vecs' not described in 'pcim_alloc_irq_vectors'
>> Warning: drivers/pci/msi/api.c:304 function parameter 'flags' not described in 'pcim_alloc_irq_vectors'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'dev' not described in 'pcim_alloc_irq_vectors_affinity'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'min_vecs' not described in 'pcim_alloc_irq_vectors_affinity'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'max_vecs' not described in 'pcim_alloc_irq_vectors_affinity'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'flags' not described in 'pcim_alloc_irq_vectors_affinity'
>> Warning: drivers/pci/msi/api.c:317 function parameter 'affd' not described in 'pcim_alloc_irq_vectors_affinity'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
