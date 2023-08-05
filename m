Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BB417C6;
	Sat,  5 Aug 2023 05:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691213000; x=1722749000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kTNNG0obHMz95xVo7VYy0eCJ7d7oTkTiy8k4b3fMJCg=;
  b=LYZ8BQR6f5G+0DWdU/XBrpltWDsJi0FkUzOehW+WJtJayZaVORvrl6s7
   fr95eGXeWaazLAE/QtfIdlKzQt26oYxVlmLEpoJJdmgH+U1x3OkiptcO3
   psGeRSjl4ToG0KinElKOd+EzIY6rLvtfwCSOCei23ZPtkUR80ppzzOOW1
   1xCj7IXDXQg21PFHQQMnMg11KleOCTmowTDr1jL1jsolZ/9/dlBmvDmKm
   4i/bbrbxsHeSycz02NroulLD1+eWZA9Sn4jW0u113oY9Ira4AiZFoV+1f
   0zDOsAmdz55kZmVox8gMf+QgKQ2KXnYtZbSEqfyamkvCINVWr1l5tZ0N7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="370281327"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="370281327"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 22:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733515439"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="733515439"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Aug 2023 22:23:16 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS9kx-0003Kx-2q;
	Sat, 05 Aug 2023 05:23:15 +0000
Date: Sat, 5 Aug 2023 13:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-acpi@vger.kernel.org,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Iain Lane <iain@orangesquash.org.uk>,
	Shyam-sundar S-k <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v10 7/7] PCI: Use device constraints to decide PCI target
 state fallback policy
Message-ID: <202308051340.k7mCXXL3-lkp@intel.com>
References: <20230804210129.5356-8-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804210129.5356-8-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on pci/next pci/for-linus westeri-thunderbolt/next linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-Add-comments-to-clarify-some-ifdef-statements/20230805-050559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230804210129.5356-8-mario.limonciello%40amd.com
patch subject: [PATCH v10 7/7] PCI: Use device constraints to decide PCI target state fallback policy
config: mips-randconfig-r032-20230731 (https://download.01.org/0day-ci/archive/20230805/202308051340.k7mCXXL3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051340.k7mCXXL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051340.k7mCXXL3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pci.c:1090:9: error: call to undeclared function 'acpi_get_lps0_constraint'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1090 |         return acpi_get_lps0_constraint(&dev->dev);
         |                ^
   1 error generated.


vim +/acpi_get_lps0_constraint +1090 drivers/pci/pci.c

  1084	
  1085	static inline int platform_get_constraint(struct pci_dev *dev)
  1086	{
  1087		if (pci_use_mid_pm())
  1088			return -ENODEV;
  1089	
> 1090		return acpi_get_lps0_constraint(&dev->dev);
  1091	}
  1092	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
