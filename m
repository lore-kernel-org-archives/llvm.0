Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992E93D575;
	Fri, 15 Mar 2024 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710517470; cv=none; b=miCxV4X7kF6vGhAhgi1hlg8fZJBetUVM6B3oAbV9EEcHDtACHm70moPl610Lo2akf8+oNZoQA01It+BtR4YxDDERUO+3Ll3fgdrf6Vfb9xQ60S6LfFuApYqWXP+7XMJhubAZ0MOCjnJYDQ+iHKx0yfLRL84tS4FvXVyoLjfCsgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710517470; c=relaxed/simple;
	bh=zLFKLaDgu7A9t4PnNE41buDweQyJlPexb7inSJDieTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHFjLWWqBBr5DNnSVvi+mxL9hsjZdFT+tyKDJpzoxRoX9rGbcBjPwW26+d1E4ag7MGdRRxVWkd4ni6LtnAMQokvEmiXPC8YL3gggVYPEcfs0X7bawB7TFtcicg3/q8nd+bqWLPe3QCqCxXfj676hAtlKAS9XhzcjoetmOxaygkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mK+IQ6gc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mK+IQ6gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710517469; x=1742053469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zLFKLaDgu7A9t4PnNE41buDweQyJlPexb7inSJDieTs=;
  b=mK+IQ6gc2Dmu2o2pTKk1yEvGJaHenQRjjTtPgY1VHMVwTTlQV9/fPKhY
   lIYpJhqg7jBzBwI4pQrPVKfLjaZR8dh0cjg2G7Z1OL2yyEP8rJqzEaXhD
   2u/0HSRuF75xrj0L/4d8wVf1vy25M2MDR4CHL+xWxJE0d+gkZRR/z/8UA
   dngQ8zoqbjgeWrPr+jq5yh6vvLnj51jBZv0LHlrnjb61r9D2pgh7tPh3K
   bgvlrzJaPcamX4aVu1DHX99OHlGUBsm2cAKvzSswOxhOuq4vYsys+PXi2
   c0bvPo0XYMVWUI8h8eXgnXT7njRV3YUMx+Mr/iD7z4UjmvVO40aRh+bjY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5261106"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5261106"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 08:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="17324368"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2024 08:44:14 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl9jA-000EYb-0Z;
	Fri, 15 Mar 2024 15:44:12 +0000
Date: Fri, 15 Mar 2024 23:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Julien Massot <julien.massot@collabora.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: Re: [PATCH 2/4] media: i2c: st-vgxy61: Add support for embedded data
Message-ID: <202403152358.DM9q4q25-lkp@intel.com>
References: <20240315085158.1213159-3-julien.massot@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315085158.1213159-3-julien.massot@collabora.com>

Hi Julien,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master next-20240315]
[cannot apply to sailus-media-tree/streams linus/master v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Julien-Massot/media-i2c-st-vgxy61-Use-sub-device-active-state/20240315-165346
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240315085158.1213159-3-julien.massot%40collabora.com
patch subject: [PATCH 2/4] media: i2c: st-vgxy61: Add support for embedded data
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240315/202403152358.DM9q4q25-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403152358.DM9q4q25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403152358.DM9q4q25-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/i2c/st-vgxy61.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/i2c/st-vgxy61.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/i2c/st-vgxy61.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/media/i2c/st-vgxy61.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/i2c/st-vgxy61.c:709:16: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_8'
     709 |                 code->code = MEDIA_BUS_FMT_META_8;
         |                              ^
   drivers/media/i2c/st-vgxy61.c:1251:19: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_8'
    1251 |         meta_fmt->code = MEDIA_BUS_FMT_META_8;
         |                          ^
   drivers/media/i2c/st-vgxy61.c:1309:29: error: use of undeclared identifier 'MEDIA_BUS_FMT_META_8'
    1309 |         desc->entry[1].pixelcode = MEDIA_BUS_FMT_META_8;
         |                                    ^
>> drivers/media/i2c/st-vgxy61.c:1326:6: error: use of undeclared identifier 'V4L2_SUBDEV_ROUTE_FL_IMMUTABLE'
    1326 |                                  V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
         |                                  ^
>> drivers/media/i2c/st-vgxy61.c:1336:17: error: invalid application of 'sizeof' to an incomplete type 'struct v4l2_subdev_route[]'
    1336 |                 .num_routes = ARRAY_SIZE(routes),
         |                               ^~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
>> drivers/media/i2c/st-vgxy61.c:1891:23: error: use of undeclared identifier 'MEDIA_PAD_FL_INTERNAL'
    1891 |                 MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
         |                                     ^
   drivers/media/i2c/st-vgxy61.c:1893:23: error: use of undeclared identifier 'MEDIA_PAD_FL_INTERNAL'
    1893 |                 MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
         |                                     ^
   7 warnings and 7 errors generated.


vim +/MEDIA_BUS_FMT_META_8 +709 drivers/media/i2c/st-vgxy61.c

   698	
   699	static int vgxy61_enum_mbus_code(struct v4l2_subdev *sd,
   700					 struct v4l2_subdev_state *sd_state,
   701					 struct v4l2_subdev_mbus_code_enum *code)
   702	{
   703		if (code->pad == VGXY61_PAD_META ||
   704		    (code->pad == VGXY61_PAD_SOURCE &&
   705		     code->stream == VGXY61_STREAM_META)) {
   706			if (code->index > 0)
   707				return -EINVAL;
   708	
 > 709			code->code = MEDIA_BUS_FMT_META_8;
   710			return 0;
   711		}
   712	
   713		if (code->index >= ARRAY_SIZE(vgxy61_supported_codes))
   714			return -EINVAL;
   715	
   716		code->code = vgxy61_supported_codes[code->index].code;
   717	
   718		return 0;
   719	}
   720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
