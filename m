Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E61D37880B;
	Tue,  7 Apr 2026 04:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534563; cv=none; b=rGgNYfEwyUb4lnjXLd9lSId8MXLLaWx4To6Lq8z4Yoyx+bnz+yb+o3Zz+57/2bnufbjqPWMmshwk+OQUgZgij3iWrSVJJ8lWTqQWV57esgPzgRYKglZfVnVTxlkMgttLzkUEWWk9IXzW3dq2XlPVi3pbZ3JqhbicXRGJpIwmC8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534563; c=relaxed/simple;
	bh=bZyf8aTGjRvUAtTCX/fVYHoKib0HWebO8DvkWEfWZDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQ/G734awu++vapGXb3GAQ+DSsdruUJqah49h+yAs+JCC7L/BLjsiiY2aaesuOjhkI88/9NHsFFKvYdZrTckT+19SfKVTOpYMaHBQaFQVAmzO9iGkXxe69MAGbN+r2u9YngwMsTl5iwsViDImcR6BPIZWn3hUAEq2Yp+yro0rdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=az8PeBPP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="az8PeBPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534562; x=1807070562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bZyf8aTGjRvUAtTCX/fVYHoKib0HWebO8DvkWEfWZDw=;
  b=az8PeBPPbQtCAz5bDhAL3yApJAEPN2oVD12aNb5tU/ImwUVKxjv+6kro
   CWFLa9Emv3mUyAb04XblsT1azRKHgxsrAW+wlBWmd4A1TXfSHdwYwjrsi
   +/kAP3va7KQPsVRKm04XLwvPrxFVFecB++MPksHo5qyzg8gDCiJdRu4Nu
   S6W5xi1e00LxMnJyjUMfksYrsXe7o/DsCQiPxImz9WXwIx8zgdRz2/OCT
   T6UVvgk7X+wi4rwFRu+W1srkgRxQTWJ4hgl67yBdraG/MLYek8WLxNzb2
   azshbqcAxz2l27qP8WyVWcFza9ErrU/6WhiZg52cr9tJmzHfXSZTVAE+c
   Q==;
X-CSE-ConnectionGUID: l0oDYivKTFOGJUMU+F1HVw==
X-CSE-MsgGUID: SNYMX4rYSCmCHAiKaAn2Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76386034"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76386034"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 21:02:38 -0700
X-CSE-ConnectionGUID: IWZOo124S120ONOvf0EHuA==
X-CSE-MsgGUID: MSgBIt8UTzefnw9GUgvIKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227957145"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Apr 2026 21:02:36 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xe5-00000000083-3UAi;
	Tue, 07 Apr 2026 04:02:33 +0000
Date: Tue, 7 Apr 2026 12:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Simon Richter <Simon.Richter@hogyros.de>,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2] PCI/VGA: Move pci_set_vga_state() to vgaarb.c
Message-ID: <202604060643.IASWcNje-lkp@intel.com>
References: <20260312224713.1305228-1-bhelgaas@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312224713.1305228-1-bhelgaas@google.com>

Hi Bjorn,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.0-rc6]
[cannot apply to next-20260403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Helgaas/PCI-VGA-Move-pci_set_vga_state-to-vgaarb-c/20260314-150705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260312224713.1305228-1-bhelgaas%40google.com
patch subject: [PATCH v2] PCI/VGA: Move pci_set_vga_state() to vgaarb.c
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260406/202604060643.IASWcNje-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260406/202604060643.IASWcNje-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604060643.IASWcNje-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/vgaarb.c:229:7: error: call to undeclared function 'pci_set_vga_state_arch'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     229 |         rc = pci_set_vga_state_arch(dev, decode, command_bits, flags);
         |              ^
   drivers/pci/vgaarb.c:229:7: note: did you mean 'pci_set_vga_state'?
   drivers/pci/vgaarb.c:218:12: note: 'pci_set_vga_state' declared here
     218 | static int pci_set_vga_state(struct pci_dev *dev, bool decode,
         |            ^
     219 |                              unsigned int command_bits, u32 flags)
     220 | {
     221 |         struct pci_bus *bus;
     222 |         struct pci_dev *bridge;
     223 |         u16 cmd;
     224 |         int rc;
     225 | 
     226 |         WARN_ON((flags & PCI_VGA_STATE_CHANGE_DECODES) && (command_bits & ~(PCI_COMMAND_IO|PCI_COMMAND_MEMORY)));
     227 | 
     228 |         /* ARCH specific VGA enables */
     229 |         rc = pci_set_vga_state_arch(dev, decode, command_bits, flags);
         |              ~~~~~~~~~~~~~~~~~~~~~~
         |              pci_set_vga_state
   1 error generated.


vim +/pci_set_vga_state_arch +229 drivers/pci/vgaarb.c

   209	
   210	/**
   211	 * pci_set_vga_state - set VGA decode state on device and parents if requested
   212	 * @dev: the PCI device
   213	 * @decode: true = enable decoding, false = disable decoding
   214	 * @command_bits: PCI_COMMAND_IO and/or PCI_COMMAND_MEMORY
   215	 * @flags: traverse ancestors and change bridges
   216	 * CHANGE_BRIDGE_ONLY / CHANGE_BRIDGE
   217	 */
   218	static int pci_set_vga_state(struct pci_dev *dev, bool decode,
   219				     unsigned int command_bits, u32 flags)
   220	{
   221		struct pci_bus *bus;
   222		struct pci_dev *bridge;
   223		u16 cmd;
   224		int rc;
   225	
   226		WARN_ON((flags & PCI_VGA_STATE_CHANGE_DECODES) && (command_bits & ~(PCI_COMMAND_IO|PCI_COMMAND_MEMORY)));
   227	
   228		/* ARCH specific VGA enables */
 > 229		rc = pci_set_vga_state_arch(dev, decode, command_bits, flags);
   230		if (rc)
   231			return rc;
   232	
   233		if (flags & PCI_VGA_STATE_CHANGE_DECODES) {
   234			pci_read_config_word(dev, PCI_COMMAND, &cmd);
   235			if (decode)
   236				cmd |= command_bits;
   237			else
   238				cmd &= ~command_bits;
   239			pci_write_config_word(dev, PCI_COMMAND, cmd);
   240		}
   241	
   242		if (!(flags & PCI_VGA_STATE_CHANGE_BRIDGE))
   243			return 0;
   244	
   245		bus = dev->bus;
   246		while (bus) {
   247			bridge = bus->self;
   248			if (bridge) {
   249				pci_read_config_word(bridge, PCI_BRIDGE_CONTROL,
   250						     &cmd);
   251				if (decode)
   252					cmd |= PCI_BRIDGE_CTL_VGA;
   253				else
   254					cmd &= ~PCI_BRIDGE_CTL_VGA;
   255				pci_write_config_word(bridge, PCI_BRIDGE_CONTROL,
   256						      cmd);
   257			}
   258			bus = bus->parent;
   259		}
   260		return 0;
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
