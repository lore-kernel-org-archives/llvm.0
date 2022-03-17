Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1FF2F3A
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 03:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647487553; x=1679023553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CBtrPG2aEi+P4pOZ3ACtWgO4PR0oESllWQ9zy2YVNkE=;
  b=d4vYtBEPEv6pqAwEgQw3cwvfdeKPw/vlfKJr0/3WSAxM28+wTN7rXSrm
   9vYd3HqC9mILinL9yEKaJaVNs3ZP572QmT4roGrf8BhCFhiZ2uFH7lplF
   /aoozC9J/Mjba8bKl/RupO2vcMwj5B545dI2oOgsRiLuKNLg3MmeU4B2a
   NPBSXVJIMl/mw97ZFTu7c+3Zn/qxmpiGkggP/5VOgMkbYjHchW4uxo67y
   DBqpMIcSHEQxrk8JQ0FqkcmtkF+bw6hX3aZQsSQ5CyG0WmkTfbRQtN9bd
   sB+YKNBrvBKXb54q4LYrSjMzgmp8OeAy2JJ99rNDYVQwJM2CTcFBnFvOy
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="238934825"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="238934825"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 20:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="498684942"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 16 Mar 2022 20:25:51 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUglq-000DFO-Aq; Thu, 17 Mar 2022 03:25:50 +0000
Date: Thu, 17 Mar 2022 11:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/2] acpi/pci_root: negotiate CXL _OSC
Message-ID: <202203171123.Jy0945To-lkp@intel.com>
References: <20220317002704.1835870-3-vishal.l.verma@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317002704.1835870-3-vishal.l.verma@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Vishal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 74be98774dfbc5b8b795db726bd772e735d2edd4]

url:    https://github.com/0day-ci/linux/commits/Vishal-Verma/acpi-add-support-for-CXL-_OSC/20220317-082840
base:   74be98774dfbc5b8b795db726bd772e735d2edd4
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220317/202203171123.Jy0945To-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8020d862c22d52b61a590343b2202e5d05332100
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vishal-Verma/acpi-add-support-for-CXL-_OSC/20220317-082840
        git checkout 8020d862c22d52b61a590343b2202e5d05332100
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/acpi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/acpi/pci_root.c:562:3: warning: variable 'control' is uninitialized when used here [-Wuninitialized]
                   control |= OSC_CXL_ERROR_REPORTING_CONTROL;
                   ^~~~~~~
   drivers/acpi/pci_root.c:559:13: note: initialize the variable 'control' to silence this warning
           u32 control;
                      ^
                       = 0
>> drivers/acpi/pci_root.c:612:6: warning: variable 'cxl_support' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (is_cxl(root)) {
               ^~~~~~~~~~~~
   drivers/acpi/pci_root.c:619:22: note: uninitialized use occurs here
                                             &cxl_control, cxl_support);
                                                           ^~~~~~~~~~~
   drivers/acpi/pci_root.c:612:2: note: remove the 'if' if its condition is always true
           if (is_cxl(root)) {
           ^~~~~~~~~~~~~~~~~~
   drivers/acpi/pci_root.c:588:17: note: initialize the variable 'cxl_support' to silence this warning
           u32 cxl_support, cxl_control = 0, cxl_requested = 0;
                          ^
                           = 0
   2 warnings generated.


vim +/control +562 drivers/acpi/pci_root.c

   556	
   557	static u32 calculate_cxl_control(void)
   558	{
   559		u32 control;
   560	
   561		if (pci_aer_available())
 > 562			control |= OSC_CXL_ERROR_REPORTING_CONTROL;
   563	
   564		return control;
   565	}
   566	
   567	static bool os_control_query_checks(struct acpi_pci_root *root, u32 support)
   568	{
   569		struct acpi_device *device = root->device;
   570	
   571		if (pcie_ports_disabled) {
   572			dev_info(&device->dev, "PCIe port services disabled; not requesting _OSC control\n");
   573			return false;
   574		}
   575	
   576		if ((support & ACPI_PCIE_REQ_SUPPORT) != ACPI_PCIE_REQ_SUPPORT) {
   577			decode_osc_support(root, "not requesting OS control; OS requires",
   578					   ACPI_PCIE_REQ_SUPPORT);
   579			return false;
   580		}
   581	
   582		return true;
   583	}
   584	
   585	static void negotiate_os_control(struct acpi_pci_root *root, int *no_aspm)
   586	{
   587		u32 support, control = 0, requested = 0;
   588		u32 cxl_support, cxl_control = 0, cxl_requested = 0;
   589		acpi_status status;
   590		struct acpi_device *device = root->device;
   591		acpi_handle handle = device->handle;
   592	
   593		/*
   594		 * Apple always return failure on _OSC calls when _OSI("Darwin") has
   595		 * been called successfully. We know the feature set supported by the
   596		 * platform, so avoid calling _OSC at all
   597		 */
   598		if (x86_apple_machine) {
   599			root->osc_control_set = ~OSC_PCI_EXPRESS_PME_CONTROL;
   600			decode_osc_control(root, "OS assumes control of",
   601					   root->osc_control_set);
   602			return;
   603		}
   604	
   605		support = calculate_support();
   606	
   607		decode_osc_support(root, "OS supports", support);
   608	
   609		if (os_control_query_checks(root, support))
   610			requested = control = calculate_control();
   611	
 > 612		if (is_cxl(root)) {
   613			cxl_support = calculate_cxl_support();
   614			decode_cxl_osc_support(root, "OS supports", cxl_support);
   615			cxl_requested = cxl_control = calculate_cxl_control();
   616		}
   617	
   618		status = acpi_pci_osc_control_set(handle, &control, support,
   619						  &cxl_control, cxl_support);
   620		if (ACPI_SUCCESS(status)) {
   621			if (control)
   622				decode_osc_control(root, "OS now controls", control);
   623			if (cxl_control)
   624				decode_cxl_osc_control(root, "OS now controls",
   625						   cxl_control);
   626	
   627			if (acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_ASPM) {
   628				/*
   629				 * We have ASPM control, but the FADT indicates that
   630				 * it's unsupported. Leave existing configuration
   631				 * intact and prevent the OS from touching it.
   632				 */
   633				dev_info(&device->dev, "FADT indicates ASPM is unsupported, using BIOS configuration\n");
   634				*no_aspm = 1;
   635			}
   636		} else {
   637			/*
   638			 * We want to disable ASPM here, but aspm_disabled
   639			 * needs to remain in its state from boot so that we
   640			 * properly handle PCIe 1.1 devices.  So we set this
   641			 * flag here, to defer the action until after the ACPI
   642			 * root scan.
   643			 */
   644			*no_aspm = 1;
   645	
   646			/* _OSC is optional for PCI host bridges */
   647			if ((status == AE_NOT_FOUND) && !is_pcie(root))
   648				return;
   649	
   650			if (control) {
   651				decode_osc_control(root, "OS requested", requested);
   652				decode_osc_control(root, "platform willing to grant", control);
   653			}
   654			if (cxl_control) {
   655				decode_cxl_osc_control(root, "OS requested", cxl_requested);
   656				decode_cxl_osc_control(root, "platform willing to grant",
   657						   cxl_control);
   658			}
   659	
   660			dev_info(&device->dev, "_OSC: platform retains control of PCIe features (%s)\n",
   661				 acpi_format_exception(status));
   662		}
   663	}
   664	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
