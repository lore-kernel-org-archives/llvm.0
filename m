Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7331116EC19;
	Mon, 13 Jan 2025 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736765226; cv=none; b=MRU6KFDOJ8DiQgmRcrO/zLfkHUTkZUAUuUM2lexz8HcIRHRT0HMNQ6XU2l6joIcYyMs6EGvXO1Kr7YeXo276Ds0yaQZ0OLK8lhn66NLPj/xFzZ/okc9XFCHdb/vLEksbIJ8FuH0jF4acp9G55LwNqfZ4TIcQ3PmnWwB0OV+AC1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736765226; c=relaxed/simple;
	bh=9Dc4i80wr8V1Lqff0NY8gvdezO62vKco/yDRBbm1Vd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TfuvrOSK5yBC/enouFsxCVrBjb0T2gMyOeofZNulBlvwZG8K5VCOwXpubVs5bO/mJ4CYLXGYpypsmGbibU1gccfGIioGFSw36lyJYblIC5pGlgMhXpZXzx2iUx2/bPgdAoOhnaU03dDPYMv42lix6mEbmcwvQykfMa8INCXcS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2CMAZvl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2CMAZvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736765224; x=1768301224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Dc4i80wr8V1Lqff0NY8gvdezO62vKco/yDRBbm1Vd0=;
  b=I2CMAZvlB03TdZG6b9WcBz/T50frmjHs1AGhAIqKykiv4Eik0306bcyg
   J5o6o5cfrxCt2W8mC0aVkMETHS63Hzfp0XprJKQy9h/HKOW0U41i3OvWq
   Qh14V+kUk1l9EAoSuEEP9cIO8x3T9dbWKtiuDq1mfGajg/6IeU9l4s07O
   C7/Anxxz7XNaNMrh5/2i+qregAf9MLrB4GfoVkpbzA8jFv/WP92fau99v
   qlFpWCUkw4lzfoKfqUD0w0aTjhiJEs6Knr5li73KO/xR4VGIK0lx8zZMv
   1vD9WJjSPLCJEY1QAcwcKKQKDnJw4BXalJZxUm9+1BHuBz8G91KTZRtzF
   w==;
X-CSE-ConnectionGUID: +yjUq1GWRvyLiiEbJH3u7Q==
X-CSE-MsgGUID: vQB9rhpGRVmmsnCyrCOhFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36905394"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36905394"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 02:47:02 -0800
X-CSE-ConnectionGUID: MzBDuOY4RlWrUt4DPYNyTg==
X-CSE-MsgGUID: nzHvQ2dtR+uoHzgEBJYSnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109581297"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jan 2025 02:47:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXHyD-000N3H-1q;
	Mon, 13 Jan 2025 10:46:57 +0000
Date: Mon, 13 Jan 2025 18:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Even Xu <even.xu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jiri Kosina <jikos@kernel.org>, Xinpeng Sun <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [linux-next:master 6854/8485]
 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:63:23: error: call
 to undeclared function 'acpi_device_handle'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202501131826.sX2DubPG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   37136bf5c3a6f6b686d74f41837a6406bec6b7bc
commit: 7cb06f08ef13499105d6fe85706baf34467b43a8 [6854/8485] HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250113/202501131826.sX2DubPG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501131826.sX2DubPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131826.sX2DubPG-lkp@intel.com/

Note: the linux-next/master HEAD 37136bf5c3a6f6b686d74f41837a6406bec6b7bc builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:7:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:7:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:7:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:7:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:63:23: error: call to undeclared function 'acpi_device_handle'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      63 |         acpi_handle handle = acpi_device_handle(adev);
         |                              ^
>> drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:63:14: error: incompatible integer to pointer conversion initializing 'acpi_handle' (aka 'void *') with an expression of type 'int' [-Wint-conversion]
      63 |         acpi_handle handle = acpi_device_handle(adev);
         |                     ^        ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:242:6: warning: variable 'int_mask' set but not used [-Wunused-but-set-variable]
     242 |         int int_mask;
         |             ^
   drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c:355:46: warning: shift count >= width of type [-Wshift-count-overflow]
     355 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   15 warnings and 2 errors generated.


vim +/acpi_device_handle +63 drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c

    29	
    30	/* THC QuickSPI ACPI method to get device properties */
    31	/* HIDSPI Method: {6e2ac436-0fcf-41af-a265-b32a220dcfab} */
    32	static guid_t hidspi_guid =
    33		GUID_INIT(0x6e2ac436, 0x0fcf, 0x41af, 0xa2, 0x65, 0xb3, 0x2a,
    34			  0x22, 0x0d, 0xcf, 0xab);
    35	
    36	/* QuickSpi Method: {300D35b7-ac20-413e-8e9c-92e4dafd0afe} */
    37	static guid_t thc_quickspi_guid =
    38		GUID_INIT(0x300d35b7, 0xac20, 0x413e, 0x8e, 0x9c, 0x92, 0xe4,
    39			  0xda, 0xfd, 0x0a, 0xfe);
    40	
    41	/* Platform Method: {84005682-5b71-41a4-0x8d668130f787a138} */
    42	static guid_t thc_platform_guid =
    43		GUID_INIT(0x84005682, 0x5b71, 0x41a4, 0x8d, 0x66, 0x81, 0x30,
    44			  0xf7, 0x87, 0xa1, 0x38);
    45	
    46	/**
    47	 * thc_acpi_get_property - Query device ACPI parameter
    48	 *
    49	 * @adev: point to ACPI device
    50	 * @guid: ACPI method's guid
    51	 * @rev: ACPI method's revision
    52	 * @func: ACPI method's function number
    53	 * @type: ACPI parameter's data type
    54	 * @prop_buf: point to return buffer
    55	 *
    56	 * This is a helper function for device to query its ACPI parameters.
    57	 *
    58	 * Return: 0 if successful or ENODEV on failed.
    59	 */
    60	static int thc_acpi_get_property(struct acpi_device *adev, const guid_t *guid,
    61					 u64 rev, u64 func, acpi_object_type type, void *prop_buf)
    62	{
  > 63		acpi_handle handle = acpi_device_handle(adev);
    64		union acpi_object *obj;
    65	
    66		obj = acpi_evaluate_dsm_typed(handle, guid, rev, func, NULL, type);
    67		if (!obj) {
    68			acpi_handle_err(handle,
    69					"Error _DSM call failed, rev: %llu, func: %llu, type: %u\n",
    70					rev, func, type);
    71			return -ENODEV;
    72		}
    73	
    74		if (type == ACPI_TYPE_INTEGER)
    75			*(u32 *)prop_buf = (u32)obj->integer.value;
    76		else if (type == ACPI_TYPE_BUFFER)
    77			memcpy(prop_buf, obj->buffer.pointer, obj->buffer.length);
    78	
    79		ACPI_FREE(obj);
    80	
    81		return 0;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
