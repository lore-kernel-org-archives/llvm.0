Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9742369784;
	Tue,  5 Dec 2023 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SupDybeF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701776228; x=1733312228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=truk6o7J5oNB7+sndhrkGT5XqWbqS+n7LlBVg8vq3kY=;
  b=SupDybeFvK1CZUxDX7K/caCiIqfCKHg4P3KaHjrCwEF+bfjfQX53l4sv
   x3e7P9wqTx8a9BofWaHTyTKNgYCtJvu9npatuy28EjUPjBXWeaSWcy+xh
   r3GU6yJ7lTnEZ9h81luIghtk8CgpRDSERVwmxyfCNYCScJvQ+V8CUNbjq
   WVKoWb7pqOqQkhDLInThX3bwIi8MTePKBzv07xO846fay+LAvZZ8QbhsI
   qqk0mKHoAffhEcEi0AMAd2CVcEnrPPiOGCrhtJJHeNgiCcBU1qXd+2Hhw
   MBDM/ChNmMY8vsAQ4Qk1qUzvQyoeKmsnlM9SsyBxoQhzAoWAiAN4ZbUko
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="392747615"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="392747615"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 03:37:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836939416"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="836939416"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Dec 2023 03:37:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rATja-0008sw-2y;
	Tue, 05 Dec 2023 11:37:03 +0000
Date: Tue, 5 Dec 2023 19:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 4620/4884] kernel/irq/generic-chip.c:210:9:
 error: call to undeclared function 'ioread32be'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202312051917.ldwRetjX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: 17229c19e5bf0b5dc8b68dc4ca4e7012e7da4747 [4620/4884] mips: remove extraneous asm-generic/iomap.h include
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20231205/202312051917.ldwRetjX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051917.ldwRetjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051917.ldwRetjX-lkp@intel.com/

Note: the linux-next/master HEAD 0f5f12ac05f36f117e793656c3f560625e927f1b builds fine.
      It may have been fixed somewhere.

All error/warnings (new ones prefixed by >>):

>> kernel/irq/generic-chip.c:210:9: error: call to undeclared function 'ioread32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |         return ioread32be(addr);
         |                ^
>> kernel/irq/generic-chip.c:215:2: error: call to undeclared function 'iowrite32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     215 |         iowrite32be(val, addr);
         |         ^
   2 errors generated.
--
>> kernel/iomem.c:110:10: error: call to undeclared function 'ioremap_wt'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |                 addr = ioremap_wt(offset, size);
         |                        ^
   kernel/iomem.c:110:10: note: did you mean 'ioremap_prot'?
   arch/mips/include/asm/io.h:152:15: note: 'ioremap_prot' declared here
     152 | void __iomem *ioremap_prot(phys_addr_t offset, unsigned long size,
         |               ^
>> kernel/iomem.c:110:8: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     110 |                 addr = ioremap_wt(offset, size);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
   In file included from lib/iomap.c:7:
>> include/linux/pci.h:306:46: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
     306 | enum pci_bus_speed pcie_get_speed_cap(struct pci_dev *dev);
         |                                              ^
   include/linux/pci.h:307:48: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
     307 | enum pcie_link_width pcie_get_width_cap(struct pci_dev *dev);
         |                                                ^
>> lib/iomap.c:79:14: warning: no previous prototype for function 'ioread8' [-Wmissing-prototypes]
      79 | unsigned int ioread8(const void __iomem *addr)
         |              ^
   lib/iomap.c:79:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      79 | unsigned int ioread8(const void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:85:14: warning: no previous prototype for function 'ioread16' [-Wmissing-prototypes]
      85 | unsigned int ioread16(const void __iomem *addr)
         |              ^
   lib/iomap.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      85 | unsigned int ioread16(const void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:91:14: warning: no previous prototype for function 'ioread16be' [-Wmissing-prototypes]
      91 | unsigned int ioread16be(const void __iomem *addr)
         |              ^
   lib/iomap.c:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      91 | unsigned int ioread16be(const void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:97:14: warning: no previous prototype for function 'ioread32' [-Wmissing-prototypes]
      97 | unsigned int ioread32(const void __iomem *addr)
         |              ^
   lib/iomap.c:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | unsigned int ioread32(const void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:103:14: warning: no previous prototype for function 'ioread32be' [-Wmissing-prototypes]
     103 | unsigned int ioread32be(const void __iomem *addr)
         |              ^
   lib/iomap.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | unsigned int ioread32be(const void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:203:6: warning: no previous prototype for function 'iowrite8' [-Wmissing-prototypes]
     203 | void iowrite8(u8 val, void __iomem *addr)
         |      ^
   lib/iomap.c:203:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     203 | void iowrite8(u8 val, void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:209:6: warning: no previous prototype for function 'iowrite16' [-Wmissing-prototypes]
     209 | void iowrite16(u16 val, void __iomem *addr)
         |      ^
   lib/iomap.c:209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     209 | void iowrite16(u16 val, void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:215:6: warning: no previous prototype for function 'iowrite16be' [-Wmissing-prototypes]
     215 | void iowrite16be(u16 val, void __iomem *addr)
         |      ^
   lib/iomap.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     215 | void iowrite16be(u16 val, void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:221:6: warning: no previous prototype for function 'iowrite32' [-Wmissing-prototypes]
     221 | void iowrite32(u32 val, void __iomem *addr)
         |      ^
   lib/iomap.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     221 | void iowrite32(u32 val, void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:227:6: warning: no previous prototype for function 'iowrite32be' [-Wmissing-prototypes]
     227 | void iowrite32be(u32 val, void __iomem *addr)
         |      ^
   lib/iomap.c:227:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     227 | void iowrite32be(u32 val, void __iomem *addr)
         | ^
         | static 
>> lib/iomap.c:360:6: warning: no previous prototype for function 'ioread8_rep' [-Wmissing-prototypes]
     360 | void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
         |      ^
   lib/iomap.c:360:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     360 | void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
         | ^
         | static 
>> lib/iomap.c:366:6: warning: no previous prototype for function 'ioread16_rep' [-Wmissing-prototypes]
     366 | void ioread16_rep(const void __iomem *addr, void *dst, unsigned long count)
         |      ^
   lib/iomap.c:366:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     366 | void ioread16_rep(const void __iomem *addr, void *dst, unsigned long count)
         | ^
         | static 
>> lib/iomap.c:372:6: warning: no previous prototype for function 'ioread32_rep' [-Wmissing-prototypes]
     372 | void ioread32_rep(const void __iomem *addr, void *dst, unsigned long count)
         |      ^
   lib/iomap.c:372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     372 | void ioread32_rep(const void __iomem *addr, void *dst, unsigned long count)
         | ^
         | static 
>> lib/iomap.c:382:6: warning: no previous prototype for function 'iowrite8_rep' [-Wmissing-prototypes]
     382 | void iowrite8_rep(void __iomem *addr, const void *src, unsigned long count)
         |      ^
   lib/iomap.c:382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     382 | void iowrite8_rep(void __iomem *addr, const void *src, unsigned long count)
         | ^
         | static 
>> lib/iomap.c:388:6: warning: no previous prototype for function 'iowrite16_rep' [-Wmissing-prototypes]
     388 | void iowrite16_rep(void __iomem *addr, const void *src, unsigned long count)
         |      ^
   lib/iomap.c:388:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     388 | void iowrite16_rep(void __iomem *addr, const void *src, unsigned long count)
         | ^
         | static 
>> lib/iomap.c:394:6: warning: no previous prototype for function 'iowrite32_rep' [-Wmissing-prototypes]
     394 | void iowrite32_rep(void __iomem *addr, const void *src, unsigned long count)
         |      ^
   lib/iomap.c:394:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     394 | void iowrite32_rep(void __iomem *addr, const void *src, unsigned long count)
         | ^
         | static 
>> lib/iomap.c:406:15: warning: no previous prototype for function 'ioport_map' [-Wmissing-prototypes]
     406 | void __iomem *ioport_map(unsigned long port, unsigned int nr)
         |               ^
   lib/iomap.c:406:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     406 | void __iomem *ioport_map(unsigned long port, unsigned int nr)
         | ^
         | static 
>> lib/iomap.c:413:6: warning: no previous prototype for function 'ioport_unmap' [-Wmissing-prototypes]
     413 | void ioport_unmap(void __iomem *addr)
         |      ^
   lib/iomap.c:413:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     413 | void ioport_unmap(void __iomem *addr)
         | ^
         | static 
   20 warnings generated.
--
   In file included from lib/pci_iomap.c:7:
>> include/linux/pci.h:306:46: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
     306 | enum pci_bus_speed pcie_get_speed_cap(struct pci_dev *dev);
         |                                              ^
   include/linux/pci.h:307:48: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
     307 | enum pcie_link_width pcie_get_width_cap(struct pci_dev *dev);
         |                                                ^
   2 warnings generated.
--
   In file included from lib/devres.c:3:
>> include/linux/pci.h:306:46: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
     306 | enum pci_bus_speed pcie_get_speed_cap(struct pci_dev *dev);
         |                                              ^
   include/linux/pci.h:307:48: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
     307 | enum pcie_link_width pcie_get_width_cap(struct pci_dev *dev);
         |                                                ^
>> lib/devres.c:48:10: error: call to undeclared function 'ioremap_np'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      48 |                 addr = ioremap_np(offset, size);
         |                        ^
   lib/devres.c:48:8: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
      48 |                 addr = ioremap_np(offset, size);
         |                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/devres.c:256:2: error: call to undeclared function 'ioport_unmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     256 |         ioport_unmap(*(void __iomem **)res);
         |         ^
>> lib/devres.c:286:9: error: call to undeclared function 'ioport_map'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     286 |         addr = ioport_map(port, nr);
         |                ^
   lib/devres.c:286:7: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     286 |         addr = ioport_map(port, nr);
         |              ^ ~~~~~~~~~~~~~~~~~~~~
   lib/devres.c:307:2: error: call to undeclared function 'ioport_unmap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     307 |         ioport_unmap(addr);
         |         ^
   2 warnings and 6 errors generated.
--
>> drivers/clk/clk-divider.c:32:10: error: call to undeclared function 'ioread32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      32 |                 return ioread32be(divider->reg);
         |                        ^
>> drivers/clk/clk-divider.c:40:3: error: call to undeclared function 'iowrite32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      40 |                 iowrite32be(val, divider->reg);
         |                 ^
   2 errors generated.
--
>> drivers/clk/clk-gate.c:30:10: error: call to undeclared function 'ioread32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      30 |                 return ioread32be(gate->reg);
         |                        ^
>> drivers/clk/clk-gate.c:38:3: error: call to undeclared function 'iowrite32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      38 |                 iowrite32be(val, gate->reg);
         |                 ^
   2 errors generated.
--
>> drivers/clk/clk-multiplier.c:18:10: error: call to undeclared function 'ioread32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      18 |                 return ioread32be(mult->reg);
         |                        ^
>> drivers/clk/clk-multiplier.c:26:3: error: call to undeclared function 'iowrite32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |                 iowrite32be(val, mult->reg);
         |                 ^
   2 errors generated.
--
>> drivers/clk/clk-mux.c:30:10: error: call to undeclared function 'ioread32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      30 |                 return ioread32be(mux->reg);
         |                        ^
>> drivers/clk/clk-mux.c:38:3: error: call to undeclared function 'iowrite32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      38 |                 iowrite32be(val, mux->reg);
         |                 ^
   2 errors generated.
--
>> drivers/clk/clk-fractional-divider.c:56:10: error: call to undeclared function 'ioread32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      56 |                 return ioread32be(fd->reg);
         |                        ^
>> drivers/clk/clk-fractional-divider.c:64:3: error: call to undeclared function 'iowrite32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      64 |                 iowrite32be(val, fd->reg);
         |                 ^
   2 errors generated.
--
   In file included from drivers/of/address.c:11:
>> include/linux/pci.h:306:46: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
     306 | enum pci_bus_speed pcie_get_speed_cap(struct pci_dev *dev);
         |                                              ^
   include/linux/pci.h:307:48: warning: declaration of 'struct pci_dev' will not be visible outside of this function [-Wvisibility]
     307 | enum pcie_link_width pcie_get_width_cap(struct pci_dev *dev);
         |                                                ^
>> drivers/of/address.c:1154:10: error: call to undeclared function 'ioremap_np'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1154 |                 return ioremap_np(res.start, resource_size(&res));
         |                        ^
>> drivers/of/address.c:1154:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
    1154 |                 return ioremap_np(res.start, resource_size(&res));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/address.c:1189:9: error: call to undeclared function 'ioremap_np'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1189 |                 mem = ioremap_np(res.start, resource_size(&res));
         |                       ^
>> drivers/of/address.c:1189:7: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
    1189 |                 mem = ioremap_np(res.start, resource_size(&res));
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 4 errors generated.
..


vim +/ioread32be +210 kernel/irq/generic-chip.c

7d8280624797bbe Thomas Gleixner 2011-04-03  207  
b79055952badbd7 Kevin Cernekee  2014-11-06  208  static u32 irq_readl_be(void __iomem *addr)
b79055952badbd7 Kevin Cernekee  2014-11-06  209  {
b79055952badbd7 Kevin Cernekee  2014-11-06 @210  	return ioread32be(addr);
b79055952badbd7 Kevin Cernekee  2014-11-06  211  }
b79055952badbd7 Kevin Cernekee  2014-11-06  212  
b79055952badbd7 Kevin Cernekee  2014-11-06  213  static void irq_writel_be(u32 val, void __iomem *addr)
b79055952badbd7 Kevin Cernekee  2014-11-06  214  {
b79055952badbd7 Kevin Cernekee  2014-11-06 @215  	iowrite32be(val, addr);
b79055952badbd7 Kevin Cernekee  2014-11-06  216  }
b79055952badbd7 Kevin Cernekee  2014-11-06  217  

:::::: The code at line 210 was first introduced by commit
:::::: b79055952badbd73710685643bab44104f2509ea genirq: Generic chip: Add big endian I/O accessors

:::::: TO: Kevin Cernekee <cernekee@gmail.com>
:::::: CC: Jason Cooper <jason@lakedaemon.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
