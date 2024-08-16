Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10EB1B86C1;
	Fri, 16 Aug 2024 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723812305; cv=none; b=fqD2W43UnQZ1Vri5Lfklax0LOx9WX0O7IvLjVOgVXCjpo48OQ/5DSgBGe4yQjhatjIe41BBQvujsSfTVKU+JmGJkxLi0iMQirBRzqF72wD2KxmsoCd65tq6EF9hnF2gVb3oiUFcl2noesnEOto4BW5yORNT20EYd7loGBN42loU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723812305; c=relaxed/simple;
	bh=GbZk5j1hU9rUeXhfIH4BAEnyABopvZSq/c3+kqF0NHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/mQgX+mK58Dg5OwmEIPZo8U/Mcz233HV6jaWvziNvX78UWvMXEtoDDsfgkMrm+0B9HVKdfQ0PaNNsFuoHF3Pi6G7AUzvQ1ZdYOm6bmxOa7MH55VFWgPCzPLUZq6jKGsL8dZYjJ+0dic64Mf8+yK17LxWZMzAFKu4Hja5LCDMp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnTkCE9Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnTkCE9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723812301; x=1755348301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GbZk5j1hU9rUeXhfIH4BAEnyABopvZSq/c3+kqF0NHA=;
  b=MnTkCE9YT3d/+lXmXx8d9I+A8zDJIO2PQ6ixEZkEB/q4AnqjDif4T3GY
   4/zjBnO636YSOfixWoyaTvM0x37ZuOElUFXqcrftcO/yvmbxkZpuXdAAY
   /m1bVME0KqCDRzu7ygdXf77w7zLXQCedMOSfBWJvl5B1lU7iexzFRFUyV
   zUvGEP+5VcEjncQztKnO+wPrDZHDyvlrO76/q5i7fdyRu55DDqWHGNHab
   hriIhMzjYWJr/QgpU8q8QMA/4w0L09hLWHihUnRmrK5Y2qBca1+d6WvmY
   mAVyAo3aVrfezoMEOqBuWLLMmkbHCO05sQD2Qv7dOO/r0qokYW+2nSmyi
   g==;
X-CSE-ConnectionGUID: ikx0IqRlQg+IPgyYu/j2EA==
X-CSE-MsgGUID: jO8ZLOF+QLG77tGasTa7bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21919030"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="21919030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 05:44:57 -0700
X-CSE-ConnectionGUID: 6KtgMBAiS3KjBY+0cpW+Zw==
X-CSE-MsgGUID: WoUXAfjXQPWnIrXLP1cyLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="60221333"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Aug 2024 05:44:55 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sewK4-0006Q7-0x;
	Fri, 16 Aug 2024 12:44:52 +0000
Date: Fri, 16 Aug 2024 20:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
	Miao Wang <shankerwangmiao@gmail.com>
Subject: Re: [PATCH] ACPI: PCI: check if the io space is page aligned
Message-ID: <202408162021.HaTAkOvd-lkp@intel.com>
References: <20240814-check_pci_probe_res-v1-1-122ee07821ab@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-check_pci_probe_res-v1-1-122ee07821ab@gmail.com>

Hi Miao,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7c626ce4bae1ac14f60076d00eafe71af30450ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Miao-Wang-via-B4-Relay/ACPI-PCI-check-if-the-io-space-is-page-aligned/20240815-003833
base:   7c626ce4bae1ac14f60076d00eafe71af30450ba
patch link:    https://lore.kernel.org/r/20240814-check_pci_probe_res-v1-1-122ee07821ab%40gmail.com
patch subject: [PATCH] ACPI: PCI: check if the io space is page aligned
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240816/202408162021.HaTAkOvd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162021.HaTAkOvd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162021.HaTAkOvd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/pci_root.c:18:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/acpi/pci_root.c:873:11: error: passing 'struct device' to parameter of incompatible type 'const struct device *'; take the address with &
     873 |                 dev_err(device->dev,
         |                         ^~~~~~~~~~~
         |                         &
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   include/linux/dev_printk.h:50:36: note: passing argument to parameter 'dev' here
      50 | void _dev_err(const struct device *dev, const char *fmt, ...);
         |                                    ^
   1 warning and 1 error generated.


vim +873 drivers/acpi/pci_root.c

   860	
   861	static void acpi_pci_root_remap_iospace(struct acpi_device *device,
   862				struct resource_entry *entry)
   863	{
   864	#ifdef PCI_IOBASE
   865		struct resource *res = entry->res;
   866		resource_size_t cpu_addr = res->start;
   867		resource_size_t pci_addr = cpu_addr - entry->offset;
   868		resource_size_t length = resource_size(res);
   869		unsigned long port;
   870	
   871		if (!PAGE_ALIGNED(cpu_addr) || !PAGE_ALIGNED(length) ||
   872			!PAGE_ALIGNED(pci_addr)) {
 > 873			dev_err(device->dev,
   874				FW_BUG "I/O resource %pR or its offset %pa is not page aligned\n",
   875				res, &entry->offset);
   876			goto err;
   877		}
   878	
   879		if (pci_register_io_range(&device->fwnode, cpu_addr, length))
   880			goto err;
   881	
   882		port = pci_address_to_pio(cpu_addr);
   883		if (port == (unsigned long)-1)
   884			goto err;
   885	
   886		res->start = port;
   887		res->end = port + length - 1;
   888		entry->offset = port - pci_addr;
   889	
   890		if (pci_remap_iospace(res, cpu_addr) < 0)
   891			goto err;
   892	
   893		pr_info("Remapped I/O %pa to %pR\n", &cpu_addr, res);
   894		return;
   895	err:
   896		res->flags |= IORESOURCE_DISABLED;
   897	#endif
   898	}
   899	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
