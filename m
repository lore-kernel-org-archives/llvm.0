Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF4A634;
	Sat, 11 Jan 2025 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736617771; cv=none; b=UvuGqy8A6MT9FR1P0hvBm2AkSq9gRv9cyjMzgSbdIydwxuAyChex+eYhh8wY+tquLiITu30SFilpN3ooMIpjLjagd20aU5c8ii5QYJgB+6kSdAb4T7q9OW6SJs5S3FuNKkn/Kfe8d9dVHtF4piVWohn77NN0nUzHotRgmkrvaOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736617771; c=relaxed/simple;
	bh=SOY7lUHEUVTBFbrb06nQ4jC+4knHsghiU+pTY6kODsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJ4om8qvmljy9wADSlyAdgd30xalLDIsWL+Gd9nvDcn3tRFBTvRuhmlECZVs1ahp+ENI9ZErAeBfVd6YbpmmKmu361A/8TQBUifMGhZbv3C+hOAlZ5+ByhnXBJnsh8BPO/QTZoEIC6CpHvrYZKphuudwMQYkKNTDREahaNFdtjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/8uKtNo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/8uKtNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736617770; x=1768153770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOY7lUHEUVTBFbrb06nQ4jC+4knHsghiU+pTY6kODsI=;
  b=N/8uKtNoKgwjW9XlvMZLxm4G8n44ICyLhzwuAFBwcqOTaxB7Q5rTUCPv
   Kql6Mn6r/iVehtODxOr9ACjiIe8swrrSNPqwKgfPBb7dIwLtLvEEDb5v6
   zp5C3S3vtze/q1yFBl9XKA4gm4a5ZiW0795ouvA8SWFAYNuvelWMbOlpN
   BDYIbKSnM5m08l2RvY6EMK/n9auDSpSIiHJq2WWFKNbnDeqIFDd93xIM4
   yO1BiIu66gtxeOF1XW9vUer0p/4qHODGF145KopwUzIJbjRqxnQqrBhD3
   HJgp0kuMCS348gTAXkapdMbj+ovGAUSrCZCeUUXKByuZo8TS45VwPslKG
   g==;
X-CSE-ConnectionGUID: r71raHArQiudvBbsUI9i6Q==
X-CSE-MsgGUID: V14Dq1JHRmKp+Eu0G8kjVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37055928"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="37055928"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 09:49:27 -0800
X-CSE-ConnectionGUID: s5okYAHmSM2TaKvFeIvrqA==
X-CSE-MsgGUID: kiEH4xfnSsaFuWZoGr8FjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108079436"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jan 2025 09:49:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWfbu-000L4V-2g;
	Sat, 11 Jan 2025 17:49:22 +0000
Date: Sun, 12 Jan 2025 01:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kunal Rane <kunal.rane@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Vishal Sagar <vishal.sagar@amd.co>
Subject: [xilinx-xlnx:lkp_test 286/504]
 drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:1287:9: error: call to
 undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202501120101.hNCBd3Gy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kunal,

First bad commit (maybe != root cause):

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 9be08bf6f7cab1202fc1167747dd2c79b1bf1523 [286/504] v4l2: xilinx: dprx: Add HDCP2x support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250112/202501120101.hNCBd3Gy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120101.hNCBd3Gy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120101.hNCBd3Gy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:27:
   In file included from drivers/media/platform/xilinx/xilinx-hdcp2x-rx.h:16:
   In file included from include/linux/xlnx/xlnx_hdcp2x_mmult.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:27:
   In file included from drivers/media/platform/xilinx/xilinx-hdcp2x-rx.h:16:
   In file included from include/linux/xlnx/xlnx_hdcp2x_mmult.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:27:
   In file included from drivers/media/platform/xilinx/xilinx-hdcp2x-rx.h:16:
   In file included from include/linux/xlnx/xlnx_hdcp2x_mmult.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c:1287:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1287 |                 buf = FIELD_PREP(XHDCP2X_RX_HDMI_HDCP22VERSION_EN_MASK, 1);
         |                       ^
   6 warnings and 1 error generated.


vim +/FIELD_PREP +1287 drivers/media/platform/xilinx/xilinx-hdcp2x-rx.c

7eb00f18063f8b Kunal Rane 2023-09-04  1270  
7eb00f18063f8b Kunal Rane 2023-09-04  1271  int xhdcp2x_rx_hdcp2x_version_enable(void *ref, bool enable)
7eb00f18063f8b Kunal Rane 2023-09-04  1272  {
7eb00f18063f8b Kunal Rane 2023-09-04  1273  	struct xlnx_hdcp2x_config *xhdcp2x_rx =
7eb00f18063f8b Kunal Rane 2023-09-04  1274  				 (struct xlnx_hdcp2x_config *)ref;
7eb00f18063f8b Kunal Rane 2023-09-04  1275  	int status = 0;
7eb00f18063f8b Kunal Rane 2023-09-04  1276  	u8 buf = 0;
7eb00f18063f8b Kunal Rane 2023-09-04  1277  
7eb00f18063f8b Kunal Rane 2023-09-04  1278  	if (xhdcp2x_rx->protocol != XHDCP2X_RX_HDMI)
7eb00f18063f8b Kunal Rane 2023-09-04  1279  		return -EINVAL;
7eb00f18063f8b Kunal Rane 2023-09-04  1280  
7eb00f18063f8b Kunal Rane 2023-09-04  1281  	/*
7eb00f18063f8b Kunal Rane 2023-09-04  1282  	 * Indicates the receiver is HDCP22 capable as per Sec 2.14 of
7eb00f18063f8b Kunal Rane 2023-09-04  1283  	 * HDCP to HDMI specification. Attempting to disable this register
7eb00f18063f8b Kunal Rane 2023-09-04  1284  	 * write leads to HDCP22 authentication failure.
7eb00f18063f8b Kunal Rane 2023-09-04  1285  	 */
7eb00f18063f8b Kunal Rane 2023-09-04  1286  	if (enable)
7eb00f18063f8b Kunal Rane 2023-09-04 @1287  		buf = FIELD_PREP(XHDCP2X_RX_HDMI_HDCP22VERSION_EN_MASK, 1);
7eb00f18063f8b Kunal Rane 2023-09-04  1288  
7eb00f18063f8b Kunal Rane 2023-09-04  1289  	status =
7eb00f18063f8b Kunal Rane 2023-09-04  1290  		xhdcp2x_rx->handlers.wr_handler(xhdcp2x_rx->interface_ref,
7eb00f18063f8b Kunal Rane 2023-09-04  1291  						XHDCP2X_RX_HDMI_HDCP22VERSION_REG,
7eb00f18063f8b Kunal Rane 2023-09-04  1292  						&buf,
7eb00f18063f8b Kunal Rane 2023-09-04  1293  						1);
7eb00f18063f8b Kunal Rane 2023-09-04  1294  	if (status < 0)
7eb00f18063f8b Kunal Rane 2023-09-04  1295  		return -EINVAL;
7eb00f18063f8b Kunal Rane 2023-09-04  1296  
7eb00f18063f8b Kunal Rane 2023-09-04  1297  	return status;
7eb00f18063f8b Kunal Rane 2023-09-04  1298  }
7eb00f18063f8b Kunal Rane 2023-09-04  1299  EXPORT_SYMBOL_GPL(xhdcp2x_rx_hdcp2x_version_enable);
7eb00f18063f8b Kunal Rane 2023-09-04  1300  

:::::: The code at line 1287 was first introduced by commit
:::::: 7eb00f18063f8b5d42ed11e57a81443c632dfe3e v4l2: xilinx: Add HDCP2x Rx support

:::::: TO: Kunal Rane <kunal.rane@amd.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
