Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8227E;
	Thu,  3 Aug 2023 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691055683; x=1722591683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RsjynlJwoyqFJ3adCtTUmQ0RI0ykyDi4RIv6/UmcrSI=;
  b=c9L9hPuhtIXPrVxaOjf+CvBEzeDRRoX9MGGVHJr3x5Z9/GB7VrkJjJL6
   5ro2Z0WMBcsjHPlVi0ywu9u13Mu2GZi+FGysxp/39GTfOvGxsPL0R7mU/
   XxNnVNONL8qxLetEwlLH4LHvQoy+xZLLDKGFzgM2sCcu44P/1y5ILBj8Y
   AiyWo++9L0vHgess2V8TaBCuZqMI1jhd3fPHc/HjzWx+FIK2ABA4jeHwt
   kE2mV6eQFjCHIVsVL3MJW8EG+DwxP/7AR3XqtYBQbS8eD200R33Pq+nxK
   IsJyKuC3i4ztKOoQ9IzUY9nRr8xrlPvD3SptFU9uxbwyXgW2gHXLrpBq+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="350120170"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="350120170"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 02:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="976002493"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="976002493"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 02:41:18 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRUpZ-00020B-14;
	Thu, 03 Aug 2023 09:41:17 +0000
Date: Thu, 3 Aug 2023 17:40:25 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, Iain Lane <iain@orangesquash.org.uk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v8 2/2] PCI/ACPI: Use device constraints instead of dates
 to opt devices into D3
Message-ID: <202308031702.maQwVjYc-lkp@intel.com>
References: <20230802201013.910-3-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802201013.910-3-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on pci/next pci/for-linus westeri-thunderbolt/next linus/master v6.5-rc4 next-20230803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/ACPI-Add-comments-to-clarify-some-ifdef-statements/20230803-041214
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230802201013.910-3-mario.limonciello%40amd.com
patch subject: [PATCH v8 2/2] PCI/ACPI: Use device constraints instead of dates to opt devices into D3
config: x86_64-randconfig-x003-20230731 (https://download.01.org/0day-ci/archive/20230803/202308031702.maQwVjYc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308031702.maQwVjYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308031702.maQwVjYc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: acpi_get_lps0_constraint
   >>> referenced by pci-acpi.c:1055 (drivers/pci/pci-acpi.c:1055)
   >>>               vmlinux.o:(pci_bridge_d3_possible)
   >>> referenced by pci-acpi.c:1055 (drivers/pci/pci-acpi.c:1055)
   >>>               vmlinux.o:(acpi_pci_device_constraint_d3)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
