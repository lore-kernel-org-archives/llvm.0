Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5920F71B3B;
	Tue,  7 May 2024 22:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715120820; cv=none; b=gEw4mmexNlp1DFeaXSWqvLj6MLwaxZZ84xFBwMabuQvD4n3aRBrZDILqlRV6SZ1JkkjNuJuejlVNu7GZLSZs3ynf354EP4ehEvebl6s+YXFb1HE3yLmz+R7gG0mjCk5uq2Q1rM5E3PNsXwfnzdC2B125Bs4N0KmbkvBn+SShlrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715120820; c=relaxed/simple;
	bh=rHJWnvxcz9h2764Kfjdo8geuMpSH6DUv0xmpaeUY2eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiGElZttTghP+Cl8HePzZhLSUquxnlNO9HfhiA06Q3wb7i7Sb/l0nBMWnw8enpp6NSLvh7hPtIn07GTZqUSMd9PaqbO6AMUFZf+KowsjSiIkpnZbVsSXHIrUhgm1Ml0JvAhGTTBE8UpG6n0/6X7FqydK7ZN9PAWkPXXtkz3al/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL4//OBd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL4//OBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715120815; x=1746656815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rHJWnvxcz9h2764Kfjdo8geuMpSH6DUv0xmpaeUY2eA=;
  b=eL4//OBd2RUS8whVFMJywm4k9ExEFYfNl7yy8xhOs1ZwR0FWgqNIxa27
   LK+bimcXQhrLkQkQ9nOS9qJKB3E2RV8B8U/QScF0y0EU4S4S332Sc1mbv
   PhKtXffaN2TUOXggeeB2pvBINNt7AsK3xYAgS9WJwDRAiaX0s/S5ekVXx
   c5iEwKKx+ebtKU7RjBd64N3vvysrbfik1s4K7ZgI9GR/lL/Gyw1sNFGr5
   +69Va+TBHF7ao/bG3rn6JXmLZ36MyD1bqwgUxSy9d3pqNs4brfZZHvA44
   MrL6btJqSBoNRTIVVdLcOk6qwS/dHPkM48yeXvwITvVFOrICYQIjz+ci0
   Q==;
X-CSE-ConnectionGUID: f45+DDOfRvGC090UWRfveA==
X-CSE-MsgGUID: NdMI89hnSBm2iIDrbDEzjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11416582"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="11416582"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 15:26:54 -0700
X-CSE-ConnectionGUID: eoqHZktBQi6/5AkSanzDaQ==
X-CSE-MsgGUID: NGK6E8QcQnGZ2wLnon+aVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="59834223"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 May 2024 15:26:53 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4TGs-0002hQ-38;
	Tue, 07 May 2024 22:26:50 +0000
Date: Wed, 8 May 2024 06:25:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kiran K <kiran.k@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] Bluetooth: btintel_pcie: Add support for PCIe
 transport
Message-ID: <202405080647.VRBej6fA-lkp@intel.com>
References: <20240507155658.294676-2-kiran.k@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507155658.294676-2-kiran.k@intel.com>

Hi Kiran,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master linus/master v6.9-rc7 next-20240507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiran-K/Bluetooth-btintel_pcie-Add-support-for-PCIe-transport/20240507-234447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240507155658.294676-2-kiran.k%40intel.com
patch subject: [PATCH v2 2/3] Bluetooth: btintel_pcie: Add support for PCIe transport
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240508/202405080647.VRBej6fA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080647.VRBej6fA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080647.VRBej6fA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btintel_pcie.c:184:6: warning: variable 'reg' set but not used [-Wunused-but-set-variable]
           u32 reg;
               ^
>> drivers/bluetooth/btintel_pcie.c:192:26: warning: shift count >= width of type [-Wshift-count-overflow]
                                 data->ci_p_addr >> 32);
                                                 ^  ~~
>> drivers/bluetooth/btintel_pcie.c:458:15: warning: variable 'frbd' set but not used [-Wunused-but-set-variable]
           struct frbd *frbd;
                        ^
   3 warnings generated.


vim +/reg +184 drivers/bluetooth/btintel_pcie.c

   174	
   175	/* This function enables BT function by setting BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT bit in
   176	 * BTINTEL_PCIE_CSR_FUNC_CTRL_REG register and wait for MSI-X with
   177	 * BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0.
   178	 * Then the host reads firmware version from BTINTEL_CSR_F2D_MBX and the boot stage
   179	 * from BTINTEL_PCIE_CSR_BOOT_STAGE_REG.
   180	 */
   181	static int btintel_pcie_enable_bt(struct btintel_pcie_data *data)
   182	{
   183		int err;
 > 184		u32 reg;
   185	
   186		data->gp0_received = false;
   187	
   188		/* Update the DMA address of CI struct to CSR */
   189		btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_CI_ADDR_LSB_REG,
   190				      data->ci_p_addr & 0xffffffff);
   191		btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_CI_ADDR_MSB_REG,
 > 192				      data->ci_p_addr >> 32);
   193	
   194		/* Reset the cached value of boot stage. it is updated by the MSI-X
   195		 * gp0 interrupt handler.
   196		 */
   197		data->boot_stage_cache = 0x0;
   198	
   199		/* Set MAC_INIT bit to start primary bootloader */
   200		reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
   201	
   202		btintel_pcie_set_reg_bits(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
   203					  BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_INIT);
   204	
   205		/* Wait until MAC_ACCESS is granted */
   206		err = btintel_pcie_poll_bit(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
   207					    BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS,
   208					    BTINTEL_PCIE_CSR_FUNC_CTRL_MAC_ACCESS_STS,
   209					    BTINTEL_DEFAULT_MAC_ACCESS_TIMEOUT_US);
   210		if (err < 0)
   211			return -ENODEV;
   212	
   213		/* MAC is ready. Enable BT FUNC */
   214		btintel_pcie_set_reg_bits(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG,
   215					  BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_ENA |
   216					  BTINTEL_PCIE_CSR_FUNC_CTRL_FUNC_INIT);
   217	
   218		reg = btintel_pcie_rd_reg32(data, BTINTEL_PCIE_CSR_FUNC_CTRL_REG);
   219	
   220		/* wait for interrupt from the device after booting up to primary
   221		 * bootloader.
   222		 */
   223		err = wait_event_timeout(data->gp0_wait_q, data->gp0_received,
   224					 msecs_to_jiffies(BTINTEL_DEFAULT_INTR_TIMEOUT));
   225		if (!err)
   226			return -ETIME;
   227	
   228		/* Check cached boot stage is BTINTEL_PCIE_CSR_BOOT_STAGE_ROM(BIT(0)) */
   229		if (~data->boot_stage_cache & BTINTEL_PCIE_CSR_BOOT_STAGE_ROM)
   230			return -ENODEV;
   231	
   232		return 0;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
