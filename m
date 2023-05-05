Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9420186F;
	Fri,  5 May 2023 05:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683263525; x=1714799525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GQ8xx01pfffXbTNcM6413L8UQ6sCADipSvjAmA0ewYk=;
  b=Am7/HipxVO8AFEKcRDKdASZnZdEVfCgUY0ToNnqpKz/LLVvFWoLMRrje
   EANN7LkZuxMnVQKDs+yg0bv9PN3L0xyIq84ujOWrGqyOg7JIkj5iDRvi9
   QV3YDY1N7A7c+XerUQsm499w26kPz2kOhsWGe9N4CoFRuALOvpVN+DJZA
   JJLx2VBZ++x0ItmjbtHJZkNDoLr3wC2PUbPcTFPpcFanXDQ3i7Nzb/2FU
   ig2EZO8GrSKmKmVIY3vPgpSHNHCX+y6Gwa7DUqHgXsZf79KcHqbR4r6k4
   b/q2qsQGbttDfWcSo7Zpc6QqzOVpE1P5QOrOqPQIBwU1qc5YN5qetCZo4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="349168320"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="349168320"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 22:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="871650172"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="871650172"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 May 2023 22:11:56 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1punjX-0000BN-2b;
	Fri, 05 May 2023 05:11:55 +0000
Date: Fri, 5 May 2023 13:11:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/mainline/v6-dda 11/11]
 drivers/hv/vmbus_drv.c:2001:25: warning: result of comparison of constant
 18446744073709551615 with expression of type 'resource_size_t' (aka
 'unsigned int') is always false
Message-ID: <202305051335.PUfU1qKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/mainline/v6-dda
head:   cef8eab38588585b3c876df8d1ccf5831a6bf54f
commit: c66a6025e523a389735a80e40983e17b05910469 [11/11] Drivers: hv: vmbus:  Hardcode MMIO resources in vmbus_walk_resources() when necessary
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230505/202305051335.PUfU1qKc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dcui/tdx/commit/c66a6025e523a389735a80e40983e17b05910469
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/mainline/v6-dda
        git checkout c66a6025e523a389735a80e40983e17b05910469
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051335.PUfU1qKc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/vmbus_drv.c:2001:25: warning: result of comparison of constant 18446744073709551615 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
                   if (start == 0 && end == 0xFFFFFFFFFFFFFFFF) {
                                     ~~~ ^  ~~~~~~~~~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2002:12: warning: implicit conversion from 'long long' to 'resource_size_t' (aka 'unsigned int') changes value from 68182605824 to 3758096384 [-Wconstant-conversion]
                           start = 0xFE0000000;
                                 ~ ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2003:10: warning: implicit conversion from 'long long' to 'resource_size_t' (aka 'unsigned int') changes value from 68719476735 to 4294967295 [-Wconstant-conversion]
                           end = 0xFFFFFFFFF;
                               ~ ^~~~~~~~~~~
   3 warnings generated.


vim +2001 drivers/hv/vmbus_drv.c

  1965	
  1966	#ifdef CONFIG_ACPI
  1967	/*
  1968	 * VMBUS is an acpi enumerated device. Get the information we
  1969	 * need from DSDT.
  1970	 */
  1971	static acpi_status vmbus_walk_resources(struct acpi_resource *res, void *ctx)
  1972	{
  1973		resource_size_t start = 0;
  1974		resource_size_t end = 0;
  1975		struct resource *new_res;
  1976		struct resource **old_res = &hyperv_mmio;
  1977		struct resource **prev_res = NULL;
  1978		struct resource r;
  1979	
  1980		switch (res->type) {
  1981	
  1982		/*
  1983		 * "Address" descriptors are for bus windows. Ignore
  1984		 * "memory" descriptors, which are for registers on
  1985		 * devices.
  1986		 */
  1987		case ACPI_RESOURCE_TYPE_ADDRESS32:
  1988			start = res->data.address32.address.minimum;
  1989			end = res->data.address32.address.maximum;
  1990			if (start == 0 && end == 0xFFFFFFFF) {
  1991				start = 0xF8000000;
  1992				end = 0xFFFFFFFF;
  1993				printk("vmbus_walk_resources: using a default 32-bit MMIO range\n");
  1994			}
  1995			break;
  1996	
  1997		case ACPI_RESOURCE_TYPE_ADDRESS64:
  1998			start = res->data.address64.address.minimum;
  1999			end = res->data.address64.address.maximum;
  2000	
> 2001			if (start == 0 && end == 0xFFFFFFFFFFFFFFFF) {
  2002				start = 0xFE0000000;
  2003				end = 0xFFFFFFFFF;
  2004				printk("vmbus_walk_resources: using a default 64-bit MMIO range\n");
  2005			}
  2006			break;
  2007	
  2008		/*
  2009		 * The IRQ information is needed only on ARM64, which Hyper-V
  2010		 * sets up in the extended format. IRQ information is present
  2011		 * on x86/x64 in the non-extended format but it is not used by
  2012		 * Linux. So don't bother checking for the non-extended format.
  2013		 */
  2014		case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
  2015			if (!acpi_dev_resource_interrupt(res, 0, &r)) {
  2016				pr_err("Unable to parse Hyper-V ACPI interrupt\n");
  2017				return AE_ERROR;
  2018			}
  2019			/* ARM64 INTID for VMbus */
  2020			vmbus_interrupt = res->data.extended_irq.interrupts[0];
  2021			/* Linux IRQ number */
  2022			vmbus_irq = r.start;
  2023			return AE_OK;
  2024	
  2025		default:
  2026			/* Unused resource type */
  2027			return AE_OK;
  2028	
  2029		}
  2030		/*
  2031		 * Ignore ranges that are below 1MB, as they're not
  2032		 * necessary or useful here.
  2033		 */
  2034		if (end < 0x100000)
  2035			return AE_OK;
  2036	
  2037		new_res = kzalloc(sizeof(*new_res), GFP_ATOMIC);
  2038		if (!new_res)
  2039			return AE_NO_MEMORY;
  2040	
  2041		/* If this range overlaps the virtual TPM, truncate it. */
  2042		if (end > VTPM_BASE_ADDRESS && start < VTPM_BASE_ADDRESS)
  2043			end = VTPM_BASE_ADDRESS;
  2044	
  2045		new_res->name = "hyperv mmio";
  2046		new_res->flags = IORESOURCE_MEM;
  2047		new_res->start = start;
  2048		new_res->end = end;
  2049	
  2050		/*
  2051		 * If two ranges are adjacent, merge them.
  2052		 */
  2053		do {
  2054			if (!*old_res) {
  2055				*old_res = new_res;
  2056				break;
  2057			}
  2058	
  2059			if (((*old_res)->end + 1) == new_res->start) {
  2060				(*old_res)->end = new_res->end;
  2061				kfree(new_res);
  2062				break;
  2063			}
  2064	
  2065			if ((*old_res)->start == new_res->end + 1) {
  2066				(*old_res)->start = new_res->start;
  2067				kfree(new_res);
  2068				break;
  2069			}
  2070	
  2071			if ((*old_res)->start > new_res->end) {
  2072				new_res->sibling = *old_res;
  2073				if (prev_res)
  2074					(*prev_res)->sibling = new_res;
  2075				*old_res = new_res;
  2076				break;
  2077			}
  2078	
  2079			prev_res = old_res;
  2080			old_res = &(*old_res)->sibling;
  2081	
  2082		} while (1);
  2083	
  2084		return AE_OK;
  2085	}
  2086	#endif
  2087	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
