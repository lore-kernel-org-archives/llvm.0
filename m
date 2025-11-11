Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1503370EA;
	Tue, 11 Nov 2025 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762855293; cv=none; b=EZyXCUBbIcMouRMes559ryWVq61TsjmAAww4aD/0KY13NsPx06MsrbmjvY2gDRhTkpy34W/OZF1VLEN3z3N9eTcXSM7YIf9rBHTO09BnDpewPMvMGnbueyZK/3SwpnnhXanrq4gBVrSgvTF6LDEjr2J2rHvRCyGhNXqVZco4yE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762855293; c=relaxed/simple;
	bh=/TVqiTjU5KiiPK+xQ41EdIpWWk4P2nFDrGfU+Hsk/ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOKGiW0woyT427onlNqBedTXHxirxfpxfNYA95kLwWLzOIB3of0nhGuRamKIpqhOGQnoPDELaQAxA0agmKYudZZI6ngBZj3md2mCxeiZekBx5WqoXdV3ePZCCYj2/byR3x4PtmB3sur/QKEPEH2Xy6LoeAW0GgXu2d4OPumsT0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nf9DlrVh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nf9DlrVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762855291; x=1794391291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/TVqiTjU5KiiPK+xQ41EdIpWWk4P2nFDrGfU+Hsk/ko=;
  b=Nf9DlrVhfUMLESbUXzF2TE4cBh3sMq+t/RAwS01xOF4nT4n/qfdgPh/O
   q5ik2w1CFYvgR+GWTw5sHPkIUvO5kT1kCdGNi3k0KU48bjm26r/ILK8Un
   MpCXlyAWctI4T39wSMShDL/WKjDyECQIGt+W2pZ7nAD4yzyWsIQ+raR3p
   vGhF8YszozMrYBjZO3Ypu0YbBvKf1Ftb+JpAc8oz9I28DrfGRoeVzC5l7
   kjW1CGgkDpVf4UYTmKGG99468QlUTQqDeILbzGLAwzD0eCdQuFgr1op0x
   FF91xXX6u5ohvRlCvn5kDylr4VYFetIXhyWCvCZ3GRHgBk+stuqhIzqT0
   w==;
X-CSE-ConnectionGUID: U6E6XUirRLqVrbNgHM/fcQ==
X-CSE-MsgGUID: iOyEcFhjTHG+haEfnobviQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68774963"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="68774963"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 02:01:18 -0800
X-CSE-ConnectionGUID: vibqMbh2TW2rlDAMaG/KrA==
X-CSE-MsgGUID: LteL762QT4esLeyhgjxfNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="193179539"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Nov 2025 02:01:16 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIlBa-000323-18;
	Tue, 11 Nov 2025 10:01:14 +0000
Date: Tue, 11 Nov 2025 18:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 12/13] usb: xhci: standardize multi bit-field macros
Message-ID: <202511111608.ytw8hqqD-lkp@intel.com>
References: <20251110151450.635410-13-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110151450.635410-13-niklas.neronin@linux.intel.com>

Hi Niklas,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus tegra/for-next westeri-thunderbolt/next linus/master v6.18-rc5 next-20251111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Neronin/usb-xhci-remove-deprecated-TODO-comment/20251110-233045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20251110151450.635410-13-niklas.neronin%40linux.intel.com
patch subject: [PATCH 12/13] usb: xhci: standardize multi bit-field macros
config: hexagon-randconfig-002-20251111 (https://download.01.org/0day-ci/archive/20251111/202511111608.ytw8hqqD-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111608.ytw8hqqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111608.ytw8hqqD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc3/host.c:49:27: error: called object type 'unsigned long' is not a function or function pointer
                   op_regs_base = HC_LENGTH(readl(xhci_regs));
                                  ~~~~~~~~~^
   drivers/usb/dwc3/host.c:51:27: error: called object type 'unsigned long' is not a function or function pointer
                   port_num = HCS_MAX_PORTS(reg);
                              ~~~~~~~~~~~~~^
   2 errors generated.


vim +49 drivers/usb/dwc3/host.c

2d2a3349521de1 Ran Wang      2024-01-24  24  
2d2a3349521de1 Ran Wang      2024-01-24  25  /**
2d2a3349521de1 Ran Wang      2024-01-24  26   * dwc3_power_off_all_roothub_ports - Power off all Root hub ports
2d2a3349521de1 Ran Wang      2024-01-24  27   * @dwc: Pointer to our controller context structure
2d2a3349521de1 Ran Wang      2024-01-24  28   */
2d2a3349521de1 Ran Wang      2024-01-24  29  static void dwc3_power_off_all_roothub_ports(struct dwc3 *dwc)
2d2a3349521de1 Ran Wang      2024-01-24  30  {
2d2a3349521de1 Ran Wang      2024-01-24  31  	void __iomem *xhci_regs;
2d2a3349521de1 Ran Wang      2024-01-24  32  	u32 op_regs_base;
2d2a3349521de1 Ran Wang      2024-01-24  33  	int port_num;
2d2a3349521de1 Ran Wang      2024-01-24  34  	u32 offset;
2d2a3349521de1 Ran Wang      2024-01-24  35  	u32 reg;
2d2a3349521de1 Ran Wang      2024-01-24  36  	int i;
2d2a3349521de1 Ran Wang      2024-01-24  37  
57d7a6b93822f7 Shen Lichuan  2024-09-30  38  	/* xhci regs are not mapped yet, do it temporarily here */
2d2a3349521de1 Ran Wang      2024-01-24  39  	if (dwc->xhci_resources[0].start) {
5ed9cc71432a8a Sven Peter    2025-10-15  40  		if (dwc->xhci_resources[0].flags & IORESOURCE_MEM_NONPOSTED)
5ed9cc71432a8a Sven Peter    2025-10-15  41  			xhci_regs = ioremap_np(dwc->xhci_resources[0].start, DWC3_XHCI_REGS_END);
5ed9cc71432a8a Sven Peter    2025-10-15  42  		else
2d2a3349521de1 Ran Wang      2024-01-24  43  			xhci_regs = ioremap(dwc->xhci_resources[0].start, DWC3_XHCI_REGS_END);
b65bdf7fd605eb Dan Carpenter 2024-01-31  44  		if (!xhci_regs) {
2d2a3349521de1 Ran Wang      2024-01-24  45  			dev_err(dwc->dev, "Failed to ioremap xhci_regs\n");
2d2a3349521de1 Ran Wang      2024-01-24  46  			return;
2d2a3349521de1 Ran Wang      2024-01-24  47  		}
2d2a3349521de1 Ran Wang      2024-01-24  48  
2d2a3349521de1 Ran Wang      2024-01-24 @49  		op_regs_base = HC_LENGTH(readl(xhci_regs));
2d2a3349521de1 Ran Wang      2024-01-24  50  		reg = readl(xhci_regs + XHCI_HCSPARAMS1);
2d2a3349521de1 Ran Wang      2024-01-24  51  		port_num = HCS_MAX_PORTS(reg);
2d2a3349521de1 Ran Wang      2024-01-24  52  
2d2a3349521de1 Ran Wang      2024-01-24  53  		for (i = 1; i <= port_num; i++) {
2d2a3349521de1 Ran Wang      2024-01-24  54  			offset = op_regs_base + XHCI_PORTSC_BASE + 0x10 * (i - 1);
2d2a3349521de1 Ran Wang      2024-01-24  55  			reg = readl(xhci_regs + offset);
2d2a3349521de1 Ran Wang      2024-01-24  56  			reg &= ~PORT_POWER;
2d2a3349521de1 Ran Wang      2024-01-24  57  			writel(reg, xhci_regs + offset);
2d2a3349521de1 Ran Wang      2024-01-24  58  		}
2d2a3349521de1 Ran Wang      2024-01-24  59  
2d2a3349521de1 Ran Wang      2024-01-24  60  		iounmap(xhci_regs);
2d2a3349521de1 Ran Wang      2024-01-24  61  	} else {
2d2a3349521de1 Ran Wang      2024-01-24  62  		dev_err(dwc->dev, "xhci base reg invalid\n");
2d2a3349521de1 Ran Wang      2024-01-24  63  	}
2d2a3349521de1 Ran Wang      2024-01-24  64  }
2d2a3349521de1 Ran Wang      2024-01-24  65  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
