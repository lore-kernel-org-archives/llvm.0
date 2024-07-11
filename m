Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CE54EB55;
	Thu, 11 Jul 2024 07:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720682178; cv=none; b=cIDoePgLm/2pTJXFi5vJa7QIfxsktk6J0QRa0KXwn5bmyzNPN2tJ3NR+AnFH0tUyAtc84gxeFQYgETPd/Rkf2Thdx2eAffMP/zwf0ZF5G/DCb0BmEGPeL2Qa1La8VfMTxbBdBOBMtybnj60iBzvCYyvaXj7sIK9KSGa7Mkv8gwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720682178; c=relaxed/simple;
	bh=5pvvlb/zUc7gFQTtpJNCd/4syetI4HBEPO07Uqi9e9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeehCa+iJaOBgwqp0gr+Ulj8EE1AfVTfF/MtRwa9rsqARHxwMPlKCJUQeqv3T97BpJHS09pDu9L5KvSUie6hrzJAUVIrj64fl/Q6DKx6A1sC7a0mqy2apH/sTgerq7v0+ph6X49SiJytiMo00eqxXLcUAO20KcQxGY0P76qUub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMBTziAU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMBTziAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720682176; x=1752218176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5pvvlb/zUc7gFQTtpJNCd/4syetI4HBEPO07Uqi9e9M=;
  b=NMBTziAU8tZFpd77huRZ2IoUiMiBZEo595IqRcAhMJl8t7jcBetWYx82
   KxAMz1OFUe5q9K8G4RDB0HE3Z89spjmJQgbgym6fWTUEA0aAJE14mUQk9
   7LgMaxLhW/69dIbieNDtCrM2fepgBjaUArtkTZEHPyLHG8pGQHvUTeY0A
   dRN4M7KyJn3NjCzkOg7Ka2c9U68R4QJY40dOXwHT9fgtKTtAjI9o45gNm
   5So8C0pjs0znLkpRG6cUXpmJhNL7z2y1nMeI86uXQmLtstO5dkzmQU4J6
   S8uyjhRhErO9hyElTR/9ja6zgFvNQrvLkNo79/9y/YCyfJVha/glQYwuk
   A==;
X-CSE-ConnectionGUID: Y3ml5oCXQd22IBKGsg/UqA==
X-CSE-MsgGUID: e1CFf0sKTkKsi6+wOjYr0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17658115"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="17658115"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 00:16:13 -0700
X-CSE-ConnectionGUID: m/PQZKiQRFat2MyZWcqLBA==
X-CSE-MsgGUID: fp/J6xqXSFe8qGB12vCJVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="53072397"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jul 2024 00:16:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRo2D-000YwR-0X;
	Thu, 11 Jul 2024 07:16:09 +0000
Date: Thu, 11 Jul 2024 15:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 2/3] cxl: Calculate region bandwidth of targets with
 shared upstream link
Message-ID: <202407111533.ptNkhsLL-lkp@intel.com>
References: <20240710222716.797267-3-dave.jiang@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710222716.797267-3-dave.jiang@intel.com>

Hi Dave,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.10-rc6]
[cannot apply to cxl/next linus/master cxl/pending v6.10-rc7 next-20240710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/cxl-Preserve-the-CDAT-access_coordinate-for-an-endpoint/20240711-092210
base:   v6.10-rc6
patch link:    https://lore.kernel.org/r/20240710222716.797267-3-dave.jiang%40intel.com
patch subject: [PATCH v7 2/3] cxl: Calculate region bandwidth of targets with shared upstream link
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240711/202407111533.ptNkhsLL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111533.ptNkhsLL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111533.ptNkhsLL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cxl/core/cdat.c:3:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/cxl/core/cdat.c:8:
   In file included from drivers/cxl/cxlpci.h:5:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/cxl/core/cdat.c:8:
   In file included from drivers/cxl/cxlpci.h:5:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/cxl/core/cdat.c:8:
   In file included from drivers/cxl/cxlpci.h:5:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/cxl/core/cdat.c:776:7: warning: variable 'is_root' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     776 |                 if (is_cxl_root(gp_port)) {
         |                     ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:785:7: note: uninitialized use occurs here
     785 |                 if (is_root)
         |                     ^~~~~~~
   drivers/cxl/core/cdat.c:776:3: note: remove the 'if' if its condition is always true
     776 |                 if (is_cxl_root(gp_port)) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/cdat.c:773:15: note: initialize the variable 'is_root' to silence this warning
     773 |                 bool is_root;
         |                             ^
         |                              = 0
   18 warnings generated.


vim +776 drivers/cxl/core/cdat.c

   732	
   733	/*
   734	 * cxl_switch_gather_bandwidth - collect all the bandwidth at switch level in an xarray
   735	 * @cxlr: The region being operated on
   736	 * @input_xa: xarray indexed by upstream device of a switch with data of 'struct
   737	 *	      cxl_perf_ctx'
   738	 * @gp_is_root: (output) bool of whether the grandparent is cxl root.
   739	 *
   740	 * Return: a xarray of resulting cxl_perf_ctx per parent switch or root port
   741	 *         or ERR_PTR(-errno)
   742	 *
   743	 * Iterate through the xarray. Take the minimum of the downstream calculated
   744	 * bandwidth, the upstream link bandwidth, and the SSLBIS of the upstream
   745	 * switch if exists. Sum the resulting bandwidth under the switch upstream
   746	 * device or a RP device. The function can be iterated over multiple switches
   747	 * if the switches are present.
   748	 */
   749	static struct xarray *cxl_switch_gather_bandwidth(struct cxl_region *cxlr,
   750							  struct xarray *input_xa,
   751							  bool *gp_is_root)
   752	{
   753		struct xarray *res_xa __free(free_perf_xa) =
   754			kzalloc(sizeof(*res_xa), GFP_KERNEL);
   755		struct access_coordinate coords[ACCESS_COORDINATE_MAX];
   756		struct cxl_perf_ctx *ctx, *us_ctx;
   757		unsigned long index, us_index;
   758		int dev_count = 0;
   759		int gp_count = 0;
   760		void *ptr;
   761		int rc;
   762	
   763		if (!res_xa)
   764			return ERR_PTR(-ENOMEM);
   765		xa_init(res_xa);
   766	
   767		xa_for_each(input_xa, index, ctx) {
   768			struct device *dev = (struct device *)index;
   769			struct cxl_port *port = ctx->port;
   770			struct cxl_port *parent_port = to_cxl_port(port->dev.parent);
   771			struct cxl_port *gp_port = to_cxl_port(parent_port->dev.parent);
   772			struct cxl_dport *dport = port->parent_dport;
   773			bool is_root;
   774	
   775			dev_count++;
 > 776			if (is_cxl_root(gp_port)) {
   777				is_root = true;
   778				gp_count++;
   779			}
   780	
   781			/*
   782			 * If the grandparent is cxl root, then index is the root port,
   783			 * otherwise it's the parent switch upstream device.
   784			 */
   785			if (is_root)
   786				us_index = (unsigned long)port->parent_dport->dport_dev;
   787			else
   788				us_index = (unsigned long)parent_port->uport_dev;
   789	
   790			us_ctx = xa_load(res_xa, us_index);
   791			if (!us_ctx) {
   792				struct cxl_perf_ctx *n __free(kfree) =
   793					kzalloc(sizeof(*n), GFP_KERNEL);
   794	
   795				if (!n)
   796					return ERR_PTR(-ENOMEM);
   797	
   798				ptr = xa_store(res_xa, us_index, n, GFP_KERNEL);
   799				if (xa_is_err(ptr))
   800					return ERR_PTR(xa_err(ptr));
   801				us_ctx = no_free_ptr(n);
   802				us_ctx->port = parent_port;
   803			}
   804	
   805			/*
   806			 * If the device isn't an upstream PCIe port, there's something
   807			 * wrong with the topology.
   808			 */
   809			if (!dev_is_pci(dev))
   810				return ERR_PTR(-EINVAL);
   811	
   812			/* Retrieve the upstream link bandwidth */
   813			rc = cxl_pci_get_bandwidth(to_pci_dev(dev), coords);
   814			if (rc)
   815				return ERR_PTR(-ENXIO);
   816	
   817			/*
   818			 * Take the min of downstream bandwidth and the upstream link
   819			 * bandwidth.
   820			 */
   821			cxl_coordinates_combine(coords, coords, ctx->coord);
   822	
   823			/*
   824			 * Take the min of the calculated bandwdith and the upstream
   825			 * switch SSLBIS bandwidth if there's a parent switch
   826			 */
   827			if (!is_root)
   828				cxl_coordinates_combine(coords, coords, dport->coord);
   829	
   830			/*
   831			 * Aggregate the calculated bandwidth common to an upstream
   832			 * switch.
   833			 */
   834			cxl_bandwidth_add(us_ctx->coord, us_ctx->coord, coords);
   835		}
   836	
   837		/* Asymmetric topology detected. */
   838		if (gp_count) {
   839			if (gp_count != dev_count) {
   840				dev_dbg(&cxlr->dev,
   841					"Asymmetric hierachy detected, bandwidth not updated\n");
   842				return ERR_PTR(-EOPNOTSUPP);
   843			}
   844			*gp_is_root = true;
   845		}
   846	
   847		return no_free_ptr(res_xa);
   848	}
   849	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
