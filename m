Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A199713FE9;
	Sun,  7 Jan 2024 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7v4wce5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704650856; x=1736186856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vZLwts7n/Ynu03RNAih2zBQJgULBrJmU7Jr4i8xQ09E=;
  b=X7v4wce5rF/0TTagW9d+1Z1oFuZlrQgnTyqsMDegXSgCbAxs6VmIy49+
   OcS5PmTW2JCzaHL1kvh7eiSBVNc19CjciISasjZXy/SfeeIkN+Ru2BWUn
   qyvfAKNv4JHPWxk4TuWDIWKGcZhJHNxxgnfR6xerwmBZVMuBI5xH9FTEF
   I7ihQt3zGIeuhmb5kUBFFMs0vU5+fT+/++OQi2GHI7JmIL0pFhbW9hgOl
   B1zsEFAz/UxEvd4d6VkxuSn9C5lYZTMh+qNB/5QOI1w+uKHhKKWzKqGKr
   b6oRpAzqkv6aO0Q7n4a5ZAYR0at5NoUv0rJKJHvROjT3ve99lsnc5bhGv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="428932207"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="428932207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 10:07:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="871686270"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="871686270"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jan 2024 10:07:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMXYa-00040S-0t;
	Sun, 07 Jan 2024 18:07:32 +0000
Date: Mon, 8 Jan 2024 02:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC KERNEL PATCH v4 2/3] xen/pvh: Setup gsi for passthrough
 device
Message-ID: <202401080252.4E93RBHi-lkp@intel.com>
References: <20240105062217.349645-3-Jiqian.Chen@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105062217.349645-3-Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xen-tip/linux-next]
[also build test WARNING on pci/next pci/for-linus tip/x86/core rafael-pm/linux-next rafael-pm/acpi-bus rafael-pm/devprop linus/master v6.7-rc8 next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pci-Add-xen_reset_device_state-function/20240105-142527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20240105062217.349645-3-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v4 2/3] xen/pvh: Setup gsi for passthrough device
config: arm64-randconfig-001-20240107 (https://download.01.org/0day-ci/archive/20240108/202401080252.4E93RBHi-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401080252.4E93RBHi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401080252.4E93RBHi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/xen/xen-pciback/pci_stub.c:23:
   include/xen/acpi.h:63:37: error: too few arguments provided to function-like macro invocation
      63 |                         &xen_acpi_notify_hypervisor_sleep);
         |                                                          ^
   include/linux/acpi.h:1110:9: note: macro 'acpi_os_set_prepare_sleep' defined here
    1110 | #define acpi_os_set_prepare_sleep(func, pm1a_ctrl, pm1b_ctrl) do { } while (0)
         |         ^
   In file included from drivers/xen/xen-pciback/pci_stub.c:23:
   include/xen/acpi.h:62:3: error: use of undeclared identifier 'acpi_os_set_prepare_sleep'; did you mean 'acpi_os_enter_sleep'?
      62 |                 acpi_os_set_prepare_sleep(
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 acpi_os_enter_sleep
   include/acpi/acpiosxf.h:326:13: note: 'acpi_os_enter_sleep' declared here
     326 | acpi_status acpi_os_enter_sleep(u8 sleep_state, u32 rega_value, u32 regb_value);
         |             ^
   In file included from drivers/xen/xen-pciback/pci_stub.c:23:
   include/xen/acpi.h:64:3: error: call to undeclared function 'acpi_os_set_prepare_extended_sleep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      64 |                 acpi_os_set_prepare_extended_sleep(
         |                 ^
   include/xen/acpi.h:67:3: error: use of undeclared identifier 'acpi_suspend_lowlevel'
      67 |                 acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
         |                 ^
>> include/xen/acpi.h:62:3: warning: expression result unused [-Wunused-value]
      62 |                 acpi_os_set_prepare_sleep(
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.


vim +62 include/xen/acpi.h

068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  58  
268a207563f933 Liu Jinsong           2013-02-14  59  static inline void xen_acpi_sleep_register(void)
268a207563f933 Liu Jinsong           2013-02-14  60  {
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  61  	if (xen_initial_domain()) {
268a207563f933 Liu Jinsong           2013-02-14 @62  		acpi_os_set_prepare_sleep(
be6b25d15f5e67 Ben Guthro            2013-07-30  63  			&xen_acpi_notify_hypervisor_sleep);
be6b25d15f5e67 Ben Guthro            2013-07-30  64  		acpi_os_set_prepare_extended_sleep(
be6b25d15f5e67 Ben Guthro            2013-07-30  65  			&xen_acpi_notify_hypervisor_extended_sleep);
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  66  
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  67  		acpi_suspend_lowlevel = xen_acpi_suspend_lowlevel;
068e0dc7b7c1db Konrad Rzeszutek Wilk 2013-05-14  68  	}
268a207563f933 Liu Jinsong           2013-02-14  69  }
fa25bcf76b7984 Jiqian Chen           2024-01-05  70  int xen_pvh_passthrough_gsi(struct pci_dev *dev);
268a207563f933 Liu Jinsong           2013-02-14  71  #else
268a207563f933 Liu Jinsong           2013-02-14  72  static inline void xen_acpi_sleep_register(void)
268a207563f933 Liu Jinsong           2013-02-14  73  {
268a207563f933 Liu Jinsong           2013-02-14  74  }
fa25bcf76b7984 Jiqian Chen           2024-01-05  75  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
