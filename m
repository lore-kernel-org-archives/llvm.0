Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1790522F0F;
	Fri, 24 May 2024 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716572578; cv=none; b=WnZG2TVZ6sagl4ShobFkdj7Vn5OSFUfy6Ub2ZDw13VK0fyqDa5HwHyhUZ7mN3zMHQyN+d6mHoMPOjZVyox2KOUTfZcxCig73R4LGhpsEIEXVV+CuGwS3qmYHIKBy7bQoDdJZMC/nP74TYHxZc6wq4rXKxSLhEA7z0sO6hy6WMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716572578; c=relaxed/simple;
	bh=Vt9WG4RjE0QI+CxeJSDF2lyAEOIQRCKue7JYBLqohNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2Xa9EpVmL5zWbjGuWH1u3x9zdFN6EGr8dk+V8buqgHSfBEVWUMDuAiuUmmS35jdbjRmSAfHNne9L3m1NrQDNHjzODKx2vKEMU6KK31tTlaxoyseEQawYJwBdqt5sUCBDGWipMYwMmES6RyjL9Vd+zFjIrG9kAXxxC4b85G/EbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWZ+R/JA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWZ+R/JA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716572576; x=1748108576;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vt9WG4RjE0QI+CxeJSDF2lyAEOIQRCKue7JYBLqohNw=;
  b=JWZ+R/JAxMLgEzYE2yCJH/X6s19tjBJmiDmP3JBKC4n4C66tNNiIyubR
   9jtM2kMjhL+hj24GZ1OQiNwJTLHZxnZtXgzY7MW7V7wY1CiYK3/28Gjwp
   8deKPoKIk5N+X48/GNDCnXzeFfa//6lbGOsciz99w3Y/H7jKqGylDoi6a
   Xj0j06JiqBSsDbXKxNDRPrrAwYzw4puVgJEBmDKDv91I1oM11uKn4Yyoi
   AcKZbTm+4X4BGdbwO+fzfAJE5IrkyJeR85qZyfYFPkFZfHaKhXRNHFLo5
   FdJHEb1ajq9l0Q3hO6OtdmScVYLjsTxcyj9Rew5YpvkbhU7UFWiDJsxk8
   w==;
X-CSE-ConnectionGUID: lZHEtvQLSnObn1G7Dn2oig==
X-CSE-MsgGUID: majm1tDNQsqjPHsvtQ5ozA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12835627"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="12835627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 10:42:53 -0700
X-CSE-ConnectionGUID: rz0wayrjT4GP7CdlUOtxUg==
X-CSE-MsgGUID: YIefQKfHS9WX4xXL9mHsqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; 
   d="scan'208";a="34613828"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 May 2024 10:42:50 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAYwJ-0005kf-2O;
	Fri, 24 May 2024 17:42:47 +0000
Date: Sat, 25 May 2024 01:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Wang <charles.goodix@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jingliang@chromium.org, hbarnor@chromium.org, dianders@chromium.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: Re: [PATCH] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <202405250142.ZtT610HW-lkp@intel.com>
References: <20240524103407.36861-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524103407.36861-1-charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.9 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240524-183743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240524103407.36861-1-charles.goodix%40gmail.com
patch subject: [PATCH] HID: hid-goodix: Add Goodix HID-over-SPI driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240525/202405250142.ZtT610HW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250142.ZtT610HW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250142.ZtT610HW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hid/hid-goodix.c:9:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hid/hid-goodix.c:9:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
   In file included from drivers/hid/hid-goodix.c:9:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hid/hid-goodix.c:9:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
>> drivers/hid/hid-goodix.c:627:36: warning: unused variable 'goodix_spi_acpi_match' [-Wunused-const-variable]
     627 | static const struct acpi_device_id goodix_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +/goodix_spi_acpi_match +627 drivers/hid/hid-goodix.c

   626	
 > 627	static const struct acpi_device_id goodix_spi_acpi_match[] = {
   628		{ "GXTS7986" },
   629		{ },
   630	};
   631	MODULE_DEVICE_TABLE(acpi, goodix_spi_acpi_match);
   632	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
