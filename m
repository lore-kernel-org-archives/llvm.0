Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D263C30;
	Sun,  1 Dec 2024 01:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733016598; cv=none; b=Xp+4R0f0R2c/XFuZaa46oOFiWCUpqgdquBARLxu1vQEpYSQJFcbXJ4UzEDohVwLDXH5rjzsgVpu9UCB9XRZijZlMqYby6z2DBSzCTBt5lkvRfDf30ZTvR7lVv4SHGmVdX4bWPTqdTI+A/clgRc7uI1ucYFrY+U+5fn/O+5l9SLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733016598; c=relaxed/simple;
	bh=haqLix7x3nJiY/ncYc4LJgNxz8hpllnB+whjs+axSAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kspo1O986R2Vwlk6vylzhnkvllC4lzARrZgGFsz5yXn0DiSpDuRl/opOmx9p+UcxWCLcdZUW63cZye0A7cvd74IxeJ2QUQZuFK3UvC98Z0DvKPLFW8U/SRWTGe+A53J58RpwbLIth3dfajhQt+4TYx9M61AQSnOhvbB63/QcEjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAnbvghC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAnbvghC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733016596; x=1764552596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=haqLix7x3nJiY/ncYc4LJgNxz8hpllnB+whjs+axSAE=;
  b=kAnbvghCM6b6U9kkluMMg0L7FIrpHohiAoD1IT6OjraNOVkVLyBEPB/Q
   7XCMd5Rs260urnpuxov3W+gPiUGjNxcsx4Sg+oavr4gu3uxze5Uy4sRVR
   C/JwBMIR7pNsnGk6Wu9aUItlSTklKM7Rf9xr2qsxcOyfuwMhdMc5svnS8
   wqNplLVLGSK/p7qicYIVvb/p6r3hvzxsIsXDvbcAUFgHjjXurPEv3W/63
   wcCGrIdov4eB9FpkMYaD8QxztAMcXveJP3yKu3/cs5va0MOlcRnXG3TQY
   Cs7i4aKKZjqTMr5BMrmUPchk5L9MKZaTS6j1k3MCywVi/naPC6gDRywV6
   w==;
X-CSE-ConnectionGUID: QfP5jdJURVa8A91dEIWsIA==
X-CSE-MsgGUID: qqY0iiw8Tbyd68YE5MaFoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="32559371"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="32559371"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 17:29:55 -0800
X-CSE-ConnectionGUID: 3iwHBxacTl+pV0q+HYp8sw==
X-CSE-MsgGUID: ZGLFqX3dR1C2XUEuGxt+Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="130253783"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 30 Nov 2024 17:29:52 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHYlx-00016v-0j;
	Sun, 01 Dec 2024 01:29:29 +0000
Date: Sun, 1 Dec 2024 09:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: Re: [PATCH 2/2] iio: light: Add support for the TI OPT4048 color
 sensor
Message-ID: <202412010950.qWyHjojX-lkp@intel.com>
References: <20241130174212.3298371-2-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130174212.3298371-2-paulk@sys-base.io>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.12 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Kocialkowski/iio-light-Add-support-for-the-TI-OPT4048-color-sensor/20241201-014458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20241130174212.3298371-2-paulk%40sys-base.io
patch subject: [PATCH 2/2] iio: light: Add support for the TI OPT4048 color sensor
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20241201/202412010950.qWyHjojX-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010950.qWyHjojX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010950.qWyHjojX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/iio/light/opt4048.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/iio/light/opt4048.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/iio/light/opt4048.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
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
   In file included from drivers/iio/light/opt4048.c:7:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iio/light/opt4048.c:576:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     576 |                 unsigned int scan_index;
         |                 ^
   drivers/iio/light/opt4048.c:615:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     615 |                 unsigned int index = 2 * state->conversion_time_index;
         |                 ^
>> drivers/iio/light/opt4048.c:808:24: error: incompatible function pointer types initializing 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, bool)' (aka 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, _Bool)') with an expression of type 'int (struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, int)' [-Wincompatible-function-pointer-types]
     808 |         .write_event_config     = opt4048_iio_write_event_config,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   15 warnings and 1 error generated.


vim +808 drivers/iio/light/opt4048.c

   800	
   801	static const struct iio_info opt4048_iio_info = {
   802		.read_raw		= opt4048_iio_read_raw,
   803		.read_avail		= opt4048_iio_read_avail,
   804		.write_raw		= opt4048_iio_write_raw,
   805		.read_event_value	= opt4048_iio_read_event_value,
   806		.write_event_value	= opt4048_iio_write_event_value,
   807		.read_event_config	= opt4048_iio_read_event_config,
 > 808		.write_event_config	= opt4048_iio_write_event_config,
   809	};
   810	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
