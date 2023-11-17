Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0927A18C25;
	Fri, 17 Nov 2023 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7O7L1s5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700233424; x=1731769424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d9lWDv/EhYJYW1Xu0oQHyVvwmxZtqZnKqtDNb2bzAcM=;
  b=h7O7L1s5JpNa8+TK5GbGx2rC+qZQ7XCt+4MEr92y0khUnYLU15Hx2FXv
   egR7qfoCnoC6eOq1jgvif42K2DmcaLtSBi+8/vPAtlfMxYjSDcQ0cT0o2
   1U51IoBFx4Jdq60k1PoWE1HOLLElFJIDZvQ3cl6V8a6AKOQUNuGKtjr25
   HW822w3dzDi9+BDwtA6zxDDZMumFzib1HLuuTTbm1mk3STTPGl92QQRXs
   MBM4adWtUCbSH+yh7Ul4FSYPL2uhox5qu1tVt+0yzOVRC0j2Mj7RM7Ibc
   c72LXat8WB37/LHWnj/SMRgGvTEsxYq1jFlA43LpuNGJAzkoqAedOiq0o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="457808802"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457808802"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 07:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="759199571"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="759199571"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Nov 2023 07:03:41 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r40Nf-0002rl-09;
	Fri, 17 Nov 2023 15:03:39 +0000
Date: Fri, 17 Nov 2023 23:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:fraction_bits 1/3]
 drivers/media/v4l2-core/v4l2-ctrls-core.c:269:13: error: no member named
 'fraction_bits' in 'struct v4l2_ctrl'
Message-ID: <202311172208.1kCZI79A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git fraction_bits
head:   4eb67a5410cf98ca3636ddca34c61ad48f1ea0ae
commit: d1108d470aed7dd4d6f25f5e165915cb54e7211d [1/3] wip
config: hexagon-randconfig-001-20231117 (https://download.01.org/0day-ci/archive/20231117/202311172208.1kCZI79A-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231117/202311172208.1kCZI79A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311172208.1kCZI79A-lkp@intel.com/

Note: the hverkuil-media-tree/fraction_bits HEAD 4eb67a5410cf98ca3636ddca34c61ad48f1ea0ae builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from drivers/media/v4l2-core/v4l2-ctrls-core.c:11:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/media/v4l2-core/v4l2-ctrls-core.c:11:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/media/v4l2-core/v4l2-ctrls-core.c:11:
   In file included from include/media/v4l2-ctrls.h:14:
   In file included from include/media/media-request.h:20:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/media/v4l2-core/v4l2-ctrls-core.c:269:13: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     269 |                 if (ctrl->fraction_bits) {
         |                     ~~~~  ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:270:43: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     270 |                         pr_cont("%d", *ptr.p_s32 / (1 << ctrl->fraction_bits));
         |                                                          ~~~~  ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:294:13: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     294 |                 if (ctrl->fraction_bits)
         |                     ~~~~  ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:295:52: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     295 |                         pr_cont("%u.%03u", (unsigned)*ptr.p_u8 >> ctrl->fraction_bits,
         |                                                                   ~~~~  ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:296:41: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     296 |                                 (unsigned)*ptr.p_u8 & ((1U << ctrl->fraction_bits) - 1));
         |                                                               ~~~~  ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:301:13: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     301 |                 if (ctrl->fraction_bits)
         |                     ~~~~  ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:302:53: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     302 |                         pr_cont("%u.%05u", (unsigned)*ptr.p_u16 >> ctrl->fraction_bits,
         |                                                                    ~~~~  ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:303:42: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     303 |                                 (unsigned)*ptr.p_u16 & ((1U << ctrl->fraction_bits) - 1));
         |                                                                ~~~~  ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:308:13: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     308 |                 if (ctrl->fraction_bits)
         |                     ~~~~  ^
   drivers/media/v4l2-core/v4l2-ctrls-core.c:309:53: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     309 |                         pr_cont("%u.%09u", (unsigned)*ptr.p_u32 >> ctrl->fraction_bits,
         |                                                                    ~~~~  ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-ctrls-core.c:310:42: error: no member named 'fraction_bits' in 'struct v4l2_ctrl'
     310 |                                 (unsigned)*ptr.p_u32 & ((1U << ctrl->fraction_bits) - 1));
         |                                                                ~~~~  ^
   include/linux/printk.h:540:26: note: expanded from macro 'pr_cont'
     540 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   6 warnings and 11 errors generated.


vim +269 drivers/media/v4l2-core/v4l2-ctrls-core.c

   254	
   255	void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
   256	{
   257		union v4l2_ctrl_ptr ptr = ctrl->p_cur;
   258	
   259		if (ctrl->is_array) {
   260			unsigned i;
   261	
   262			for (i = 0; i < ctrl->nr_of_dims; i++)
   263				pr_cont("[%u]", ctrl->dims[i]);
   264			pr_cont(" ");
   265		}
   266	
   267		switch (ctrl->type) {
   268		case V4L2_CTRL_TYPE_INTEGER:
 > 269			if (ctrl->fraction_bits) {
   270				pr_cont("%d", *ptr.p_s32 / (1 << ctrl->fraction_bits));
   271			} else {
   272				pr_cont("%d", *ptr.p_s32);
   273			}
   274			break;
   275		case V4L2_CTRL_TYPE_BOOLEAN:
   276			pr_cont("%s", *ptr.p_s32 ? "true" : "false");
   277			break;
   278		case V4L2_CTRL_TYPE_MENU:
   279			pr_cont("%s", ctrl->qmenu[*ptr.p_s32]);
   280			break;
   281		case V4L2_CTRL_TYPE_INTEGER_MENU:
   282			pr_cont("%lld", ctrl->qmenu_int[*ptr.p_s32]);
   283			break;
   284		case V4L2_CTRL_TYPE_BITMASK:
   285			pr_cont("0x%08x", *ptr.p_s32);
   286			break;
   287		case V4L2_CTRL_TYPE_INTEGER64:
   288			pr_cont("%lld", *ptr.p_s64);
   289			break;
   290		case V4L2_CTRL_TYPE_STRING:
   291			pr_cont("%s", ptr.p_char);
   292			break;
   293		case V4L2_CTRL_TYPE_U8:
   294			if (ctrl->fraction_bits)
   295				pr_cont("%u.%03u", (unsigned)*ptr.p_u8 >> ctrl->fraction_bits,
   296					(unsigned)*ptr.p_u8 & ((1U << ctrl->fraction_bits) - 1));
   297			else
   298				pr_cont("%u", (unsigned)*ptr.p_u8);
   299			break;
   300		case V4L2_CTRL_TYPE_U16:
   301			if (ctrl->fraction_bits)
   302				pr_cont("%u.%05u", (unsigned)*ptr.p_u16 >> ctrl->fraction_bits,
   303					(unsigned)*ptr.p_u16 & ((1U << ctrl->fraction_bits) - 1));
   304			else
   305				pr_cont("%u", (unsigned)*ptr.p_u16);
   306			break;
   307		case V4L2_CTRL_TYPE_U32:
   308			if (ctrl->fraction_bits)
   309				pr_cont("%u.%09u", (unsigned)*ptr.p_u32 >> ctrl->fraction_bits,
   310					(unsigned)*ptr.p_u32 & ((1U << ctrl->fraction_bits) - 1));
   311			else
   312				pr_cont("%u", (unsigned)*ptr.p_u32);
   313			break;
   314		case V4L2_CTRL_TYPE_H264_SPS:
   315			pr_cont("H264_SPS");
   316			break;
   317		case V4L2_CTRL_TYPE_H264_PPS:
   318			pr_cont("H264_PPS");
   319			break;
   320		case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
   321			pr_cont("H264_SCALING_MATRIX");
   322			break;
   323		case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
   324			pr_cont("H264_SLICE_PARAMS");
   325			break;
   326		case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
   327			pr_cont("H264_DECODE_PARAMS");
   328			break;
   329		case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
   330			pr_cont("H264_PRED_WEIGHTS");
   331			break;
   332		case V4L2_CTRL_TYPE_FWHT_PARAMS:
   333			pr_cont("FWHT_PARAMS");
   334			break;
   335		case V4L2_CTRL_TYPE_VP8_FRAME:
   336			pr_cont("VP8_FRAME");
   337			break;
   338		case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
   339			pr_cont("HDR10_CLL_INFO");
   340			break;
   341		case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
   342			pr_cont("HDR10_MASTERING_DISPLAY");
   343			break;
   344		case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
   345			pr_cont("MPEG2_QUANTISATION");
   346			break;
   347		case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
   348			pr_cont("MPEG2_SEQUENCE");
   349			break;
   350		case V4L2_CTRL_TYPE_MPEG2_PICTURE:
   351			pr_cont("MPEG2_PICTURE");
   352			break;
   353		case V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR:
   354			pr_cont("VP9_COMPRESSED_HDR");
   355			break;
   356		case V4L2_CTRL_TYPE_VP9_FRAME:
   357			pr_cont("VP9_FRAME");
   358			break;
   359		case V4L2_CTRL_TYPE_HEVC_SPS:
   360			pr_cont("HEVC_SPS");
   361			break;
   362		case V4L2_CTRL_TYPE_HEVC_PPS:
   363			pr_cont("HEVC_PPS");
   364			break;
   365		case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
   366			pr_cont("HEVC_SLICE_PARAMS");
   367			break;
   368		case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
   369			pr_cont("HEVC_SCALING_MATRIX");
   370			break;
   371		case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
   372			pr_cont("HEVC_DECODE_PARAMS");
   373			break;
   374		case V4L2_CTRL_TYPE_AV1_SEQUENCE:
   375			pr_cont("AV1_SEQUENCE");
   376			break;
   377		case V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY:
   378			pr_cont("AV1_TILE_GROUP_ENTRY");
   379			break;
   380		case V4L2_CTRL_TYPE_AV1_FRAME:
   381			pr_cont("AV1_FRAME");
   382			break;
   383		case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
   384			pr_cont("AV1_FILM_GRAIN");
   385			break;
   386	
   387		default:
   388			pr_cont("unknown type %d", ctrl->type);
   389			break;
   390		}
   391	}
   392	EXPORT_SYMBOL(v4l2_ctrl_type_op_log);
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
