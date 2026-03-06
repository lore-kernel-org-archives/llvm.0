Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9159A1DDC35;
	Fri,  6 Mar 2026 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787927; cv=none; b=AES/WOpUn8+aWWPlYZ78sHyXNFBQCV29AJPVxScIslLDPHhFmRQmj+jssPXTXJCX3LPLdfRNz0lrrJl8yW3FaTQDs9+4bpevZc6145vMlpFumJj3YSuCkQGdY5v4EHNRHMpjHuQBCzrISjiHVurxjBQOKIzAvpT6aTLJAEdsjq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787927; c=relaxed/simple;
	bh=oYOg6RRNBv3rc6NW9T++gRlp4D4A5yJsbOb2tfVFehY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZ3/wmDl4lrQvqvfHPGhyHMaGnVSTvu3NkKZ07qsMXpXarJgBsUJIqfTUnrNQhTb70CJ/rNh9JXRZo6EiQlCipHKhPOFuJkiSxXh58OFZb5O8LAtu51aC4b+7bvuBphmvdr3yAOBFfUD7t9iXOcIoVkK81+XhgzE8EVS8PIlqcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBIogwNm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBIogwNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772787926; x=1804323926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oYOg6RRNBv3rc6NW9T++gRlp4D4A5yJsbOb2tfVFehY=;
  b=iBIogwNmg7TkXu309eIE1cFrA1UHmh6FwFz2vIYy7Q87rbK4EqnneudZ
   qCkDdmej/41+mDY0Mrm6DkQyP8FOyb2bDAW+I6CS5f768JY59YflKApCb
   8IDGTJ8DXl5Le33aQsn+6Z05jRSJDWk8uOebE7RgEZQLElGcmcKe4qhoC
   OuMKV2u6jE02vDRCDL+bgOIfz1p4iIpJpn5u2qA4frT9kwQcNqVY73lgF
   saqvceBT464Q0jQ+GUT1jJPt3YWaXHwlnlYtEmNIBsAk0MMkID30+OecI
   3ABIDad4I7CPd103XSHW35BznXHAaO5ljJQOIlOX+SF281cOeh1ALQL1Z
   w==;
X-CSE-ConnectionGUID: 7Sfck/J0ToGiAb0pBFU47w==
X-CSE-MsgGUID: HFoeG4tNRZCFCf9d0nG9yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61465870"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="61465870"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 01:05:22 -0800
X-CSE-ConnectionGUID: mj7NC1KjRW+jmMgT6lhxZg==
X-CSE-MsgGUID: ggJuHujvS4KqT1x4w1zX0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218904775"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Mar 2026 01:05:20 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyR7U-000000000cF-44bn;
	Fri, 06 Mar 2026 09:05:16 +0000
Date: Fri, 6 Mar 2026 17:05:15 +0800
From: kernel test robot <lkp@intel.com>
To: javen <javen_xu@realsil.com.cn>, arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Javen Xu <javen_xu@realsil.com.cn>
Subject: Re: [PATCH v2] rtl_pci: add support for Realtek management device
Message-ID: <202603061745.9efKfvTe-lkp@intel.com>
References: <20260303061841.1431-1-javen_xu@realsil.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303061841.1431-1-javen_xu@realsil.com.cn>

Hi javen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus soc/for-next linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/javen/rtl_pci-add-support-for-Realtek-management-device/20260303-142108
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260303061841.1431-1-javen_xu%40realsil.com.cn
patch subject: [PATCH v2] rtl_pci: add support for Realtek management device
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260306/202603061745.9efKfvTe-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061745.9efKfvTe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061745.9efKfvTe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/rtl_pci.c:27:69: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
      27 |         { PCI_VDEVICE(REALTEK, PCI_DEVICE_ID_REALTEK_PCIBR), .class_mask = 0xff00 },
         |                                                                            ^~~~~~
   drivers/misc/rtl_pci.c:27:4: note: previous initialization is here
      27 |         { PCI_VDEVICE(REALTEK, PCI_DEVICE_ID_REALTEK_PCIBR), .class_mask = 0xff00 },
         |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pci.h:1123:55: note: expanded from macro 'PCI_VDEVICE'
    1123 |         .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID, 0, 0
         |                                                              ^
>> drivers/misc/rtl_pci.c:60:32: warning: unused variable 'rtl_pm_ops' [-Wunused-const-variable]
      60 | static const struct dev_pm_ops rtl_pm_ops = {
         |                                ^~~~~~~~~~
   2 warnings generated.


vim +/rtl_pm_ops +60 drivers/misc/rtl_pci.c

    20	
    21	static struct pci_device_id rtl_pci_tbl[] = {
    22		{ PCI_VDEVICE(REALTEK, PCI_DEVICE_ID_REALTEK_PTOU), },
    23		{ PCI_VDEVICE(REALTEK, PCI_DEVICE_ID_REALTEK_COM1), },
    24		{ PCI_VDEVICE(REALTEK, PCI_DEVICE_ID_REALTEK_COM2), },
    25		{ PCI_VDEVICE(REALTEK, PCI_DEVICE_ID_REALTEK_IPMI), },
    26		{ PCI_VDEVICE(REALTEK, PCI_DEVICE_ID_REALTEK_BMC), },
  > 27		{ PCI_VDEVICE(REALTEK, PCI_DEVICE_ID_REALTEK_PCIBR), .class_mask = 0xff00 },
    28		{ }
    29	};
    30	
    31	MODULE_DEVICE_TABLE(pci, rtl_pci_tbl);
    32	
    33	static int rtl_probe(struct pci_dev *pdev,
    34				 const struct pci_device_id *ent)
    35	{
    36		int rc;
    37	
    38		/* enable device (incl. PCI PM wakeup and hotplug setup) */
    39		rc = pcim_enable_device(pdev);
    40		if (rc < 0)
    41			return dev_err_probe(&pdev->dev, rc, "enable failure\n");
    42	
    43		dev_info(&pdev->dev, "enable device\n");
    44	
    45		return rc;
    46	}
    47	
    48	static void rtl_remove(struct pci_dev *pdev) {}
    49	
    50	static int rtl_pm_suspend(struct device *device)
    51	{
    52		return 0;
    53	}
    54	
    55	static int rtl_pm_resume(struct device *device)
    56	{
    57		return 0;
    58	}
    59	
  > 60	static const struct dev_pm_ops rtl_pm_ops = {
    61		SYSTEM_SLEEP_PM_OPS(rtl_pm_suspend, rtl_pm_resume)
    62	};
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
