Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E1A23D9;
	Thu, 27 Apr 2023 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682594905; x=1714130905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bn+jPFqMyZnCiD0SMVzPtcCJOD/TagAWR6RzB26J/5Y=;
  b=G+XXD2KzbUVrcEK1oDp/tK7ISxR+lg1k2vvRM2Jjh3AwVZHGcX9pBv/Q
   efmIApp6pF6rywyeG1C1oq25u4Ih4MDWuyTNU2Auy9DhU50uhctRBLW+C
   eVGf5ONrW1wp3m0KU9VjQC+Pn8BAF4n6XF1LiVtHHdSptqZF+qKNgfqov
   7m40Z5tO+0MrjdectPwrgGpoAsWd4Ju0zU21lBRQ4M2kTLUwUgZe2QSSS
   LLz7/w0Qw9WuCsEh8K4upXqeIOAXtOOHn34WUhelAStw0KvT9MaK5V/nc
   aHaJZNEArrL0lNmoDUHGRPZTGKFS45cRyjhq52SYWvZNEg0otYO4n25w4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="336359765"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="336359765"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 04:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="818495943"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="818495943"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Apr 2023 04:28:20 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prznP-0000CD-34;
	Thu, 27 Apr 2023 11:28:19 +0000
Date: Thu, 27 Apr 2023 19:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v5-dda 12/15]
 drivers/hv/vmbus_drv.c:2178:74: warning: format specifies type 'unsigned
 long long' but the argument has type 'resource_size_t' (aka 'unsigned int')
Message-ID: <202304271958.WL8xZISX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v5-dda
head:   c5a39762e134045437ecf0d75ec545ca8edc0025
commit: 65dbf0f0d0b04aba312e56e7855e2b1f9bc77d97 [12/15] [Workaround for DDA]: hardcode MMIO _CRS in vmbus_walk_resources() for now
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230427/202304271958.WL8xZISX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dcui/tdx/commit/65dbf0f0d0b04aba312e56e7855e2b1f9bc77d97
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v5-dda
        git checkout 65dbf0f0d0b04aba312e56e7855e2b1f9bc77d97
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304271958.WL8xZISX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/vmbus_drv.c:2178:74: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
                                                             ~~~~           ^~~~~
                                                             %x
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2178:81: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
                                                                   ~~~~            ^~~
                                                                   %x
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2181:76: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
                                                               ~~~~           ^~~~~
                                                               %x
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2181:83: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
                                                                     ~~~~            ^~~
                                                                     %x
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2187:74: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
                                                             ~~~~           ^~~~~
                                                             %x
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2187:81: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
                                                                   ~~~~            ^~~
                                                                   %x
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2190:76: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
                                                               ~~~~           ^~~~~
                                                               %x
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2190:83: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
                                                                     ~~~~            ^~~
                                                                     %x
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
>> drivers/hv/vmbus_drv.c:2188:25: warning: implicit conversion from 'long long' to 'resource_size_t' (aka 'unsigned int') changes value from 68182605824 to 3758096384 [-Wconstant-conversion]
                   start = 0xfe0000000;
                         ~ ^~~~~~~~~~~
   drivers/hv/vmbus_drv.c:2189:23: warning: implicit conversion from 'long long' to 'resource_size_t' (aka 'unsigned int') changes value from 68719476735 to 4294967295 [-Wconstant-conversion]
                   end = 0xfffffffff;
                       ~ ^~~~~~~~~~~
   10 warnings generated.


vim +2178 drivers/hv/vmbus_drv.c

  2153	
  2154	
  2155	/*
  2156	 * VMBUS is an acpi enumerated device. Get the information we
  2157	 * need from DSDT.
  2158	 */
  2159	static acpi_status vmbus_walk_resources(struct acpi_resource *res, void *ctx)
  2160	{
  2161		resource_size_t start = 0;
  2162		resource_size_t end = 0;
  2163		struct resource *new_res;
  2164		struct resource **old_res = &hyperv_mmio;
  2165		struct resource **prev_res = NULL;
  2166		struct resource r;
  2167	
  2168		switch (res->type) {
  2169	
  2170		/*
  2171		 * "Address" descriptors are for bus windows. Ignore
  2172		 * "memory" descriptors, which are for registers on
  2173		 * devices.
  2174		 */
  2175		case ACPI_RESOURCE_TYPE_ADDRESS32:
  2176			start = res->data.address32.address.minimum;
  2177			end = res->data.address32.address.maximum;
> 2178	                printk("cdx: vmbus_walk_resources: mem32: %llx, %llx\n", start, end);
  2179	                start = 0xf8000000;
  2180	                end = 0xffffffff;
  2181	                printk("cdx: vmbus_walk_resources: mem32-2: %llx, %llx\n", start, end);
  2182			break;
  2183	
  2184		case ACPI_RESOURCE_TYPE_ADDRESS64:
  2185			start = res->data.address64.address.minimum;
  2186			end = res->data.address64.address.maximum;
  2187	                printk("cdx: vmbus_walk_resources: mem64: %llx, %llx\n", start, end);
> 2188	                start = 0xfe0000000;
  2189	                end = 0xfffffffff;
  2190	                printk("cdx: vmbus_walk_resources: mem64-2: %llx, %llx\n", start, end);
  2191			break;
  2192	
  2193		/*
  2194		 * The IRQ information is needed only on ARM64, which Hyper-V
  2195		 * sets up in the extended format. IRQ information is present
  2196		 * on x86/x64 in the non-extended format but it is not used by
  2197		 * Linux. So don't bother checking for the non-extended format.
  2198		 */
  2199		case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
  2200			if (!acpi_dev_resource_interrupt(res, 0, &r)) {
  2201				pr_err("Unable to parse Hyper-V ACPI interrupt\n");
  2202				return AE_ERROR;
  2203			}
  2204			/* ARM64 INTID for VMbus */
  2205			vmbus_interrupt = res->data.extended_irq.interrupts[0];
  2206			/* Linux IRQ number */
  2207			vmbus_irq = r.start;
  2208	               printk("cdx: vmbus_walk_resources: irq=%d\n", vmbus_irq);
  2209			return AE_OK;
  2210	
  2211		default:
  2212			/* Unused resource type */
  2213	               printk("cdx: vmbus_walk_resources: default type=%d\n", res->type);
  2214			return AE_OK;
  2215	
  2216		}
  2217		/*
  2218		 * Ignore ranges that are below 1MB, as they're not
  2219		 * necessary or useful here.
  2220		 */
  2221		if (end < 0x100000)
  2222			return AE_OK;
  2223	
  2224		new_res = kzalloc(sizeof(*new_res), GFP_ATOMIC);
  2225		if (!new_res)
  2226			return AE_NO_MEMORY;
  2227	
  2228		/* If this range overlaps the virtual TPM, truncate it. */
  2229		if (end > VTPM_BASE_ADDRESS && start < VTPM_BASE_ADDRESS)
  2230			end = VTPM_BASE_ADDRESS;
  2231	
  2232		new_res->name = "hyperv mmio";
  2233		new_res->flags = IORESOURCE_MEM;
  2234		new_res->start = start;
  2235		new_res->end = end;
  2236	
  2237		/*
  2238		 * If two ranges are adjacent, merge them.
  2239		 */
  2240		do {
  2241			if (!*old_res) {
  2242				*old_res = new_res;
  2243				break;
  2244			}
  2245	
  2246			if (((*old_res)->end + 1) == new_res->start) {
  2247				(*old_res)->end = new_res->end;
  2248				kfree(new_res);
  2249				break;
  2250			}
  2251	
  2252			if ((*old_res)->start == new_res->end + 1) {
  2253				(*old_res)->start = new_res->start;
  2254				kfree(new_res);
  2255				break;
  2256			}
  2257	
  2258			if ((*old_res)->start > new_res->end) {
  2259				new_res->sibling = *old_res;
  2260				if (prev_res)
  2261					(*prev_res)->sibling = new_res;
  2262				*old_res = new_res;
  2263				break;
  2264			}
  2265	
  2266			prev_res = old_res;
  2267			old_res = &(*old_res)->sibling;
  2268	
  2269		} while (1);
  2270	
  2271		return AE_OK;
  2272	}
  2273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
