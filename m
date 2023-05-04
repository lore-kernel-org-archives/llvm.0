Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C824C80;
	Thu,  4 May 2023 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683193521; x=1714729521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q5a9e3mnYSq9FjsodT7QCz33ZCAD93Ab7YNWb/WcGsA=;
  b=k9UV2VsR743QQkXsQpH4o9DdJe+TIO+Adydu6seRl531iEzU7XaJDI+W
   jc+HtsS4b5kdsKyQcCILeE1sJRkWSl6FnCwZJAe9JFLBbbe5r6E/0ly+n
   h+VxGBocJmGOI7CUqqp4PbXJ5juwBEqyLlw+t9Otb638uYVprdZX21k9g
   3zKJ7w4b+RQ4EJz5L8VMdZF6PtDEbv94N40qUWYdV+iy8UQkQKfwWJcFV
   8cumdRg864HXet7DLPQyqRwud113TnliSdILFoLdzSMaL3y59vaF+QLdq
   abmjGfCI7AMdocUbSrawzjYtjDB0mrer8mFazpFonzYVSz9azwBUTwcWN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348929908"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="348929908"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 02:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="761834543"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="761834543"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 May 2023 02:45:19 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puVWY-0002oY-2a;
	Thu, 04 May 2023 09:45:18 +0000
Date: Thu, 4 May 2023 17:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 06/13] media: verisilicon: Add AV1 decoder mode and
 controls
Message-ID: <202305041733.x1AsEHVR-lkp@intel.com>
References: <20230503083438.85139-7-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503083438.85139-7-benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master next-20230428]
[cannot apply to rockchip/for-next pza/reset/next pza/imx-drm/next v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230503-163702
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230503083438.85139-7-benjamin.gaignard%40collabora.com
patch subject: [PATCH v7 06/13] media: verisilicon: Add AV1 decoder mode and controls
config: hexagon-randconfig-r045-20230503 (https://download.01.org/0day-ci/archive/20230504/202305041733.x1AsEHVR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/642a5efcf056c52dfebc8243905c004ffe088065
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/dt-bindings-media-rockchip-vpu-Add-rk3588-vpu-compatible/20230503-163702
        git checkout 642a5efcf056c52dfebc8243905c004ffe088065
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041733.x1AsEHVR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/verisilicon/hantro_drv.c:23:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/media/platform/verisilicon/hantro_drv.c:23:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/media/platform/verisilicon/hantro_drv.c:23:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/media/platform/verisilicon/hantro_drv.c:531:10: error: use of undeclared identifier 'V4L2_CID_STATELESS_AV1_FRAME'
                           .id = V4L2_CID_STATELESS_AV1_FRAME,
                                 ^
>> drivers/media/platform/verisilicon/hantro_drv.c:536:10: error: use of undeclared identifier 'V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY'
                           .id = V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY,
                                 ^
>> drivers/media/platform/verisilicon/hantro_drv.c:537:14: error: use of undeclared identifier 'V4L2_AV1_MAX_TILE_COUNT'
                           .dims = { V4L2_AV1_MAX_TILE_COUNT },
                                     ^
>> drivers/media/platform/verisilicon/hantro_drv.c:542:10: error: use of undeclared identifier 'V4L2_CID_STATELESS_AV1_SEQUENCE'
                           .id = V4L2_CID_STATELESS_AV1_SEQUENCE,
                                 ^
>> drivers/media/platform/verisilicon/hantro_drv.c:547:10: error: use of undeclared identifier 'V4L2_CID_STATELESS_AV1_FILM_GRAIN'
                           .id = V4L2_CID_STATELESS_AV1_FILM_GRAIN,
                                 ^
>> drivers/media/platform/verisilicon/hantro_drv.c:556:21: error: invalid application of 'sizeof' to an incomplete type 'const struct hantro_ctrl[]'
           int i, num_ctrls = ARRAY_SIZE(controls);
                              ^~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:32: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                  ^~~~~
>> drivers/media/platform/verisilicon/hantro_drv.c:1028:46: warning: implicit conversion from 'unsigned long long' to 'unsigned int' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
           vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:40: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                          ^~~~~
   7 warnings and 6 errors generated.


vim +/V4L2_CID_STATELESS_AV1_FRAME +531 drivers/media/platform/verisilicon/hantro_drv.c

   365	
   366	#define HANTRO_JPEG_ACTIVE_MARKERS	(V4L2_JPEG_ACTIVE_MARKER_APP0 | \
   367						 V4L2_JPEG_ACTIVE_MARKER_COM | \
   368						 V4L2_JPEG_ACTIVE_MARKER_DQT | \
   369						 V4L2_JPEG_ACTIVE_MARKER_DHT)
   370	
   371	static const struct hantro_ctrl controls[] = {
   372		{
   373			.codec = HANTRO_JPEG_ENCODER,
   374			.cfg = {
   375				.id = V4L2_CID_JPEG_COMPRESSION_QUALITY,
   376				.min = 5,
   377				.max = 100,
   378				.step = 1,
   379				.def = 50,
   380				.ops = &hantro_jpeg_ctrl_ops,
   381			},
   382		}, {
   383			.codec = HANTRO_JPEG_ENCODER,
   384			.cfg = {
   385				.id = V4L2_CID_JPEG_ACTIVE_MARKER,
   386				.max = HANTRO_JPEG_ACTIVE_MARKERS,
   387				.def = HANTRO_JPEG_ACTIVE_MARKERS,
   388				/*
   389				 * Changing the set of active markers/segments also
   390				 * messes up the alignment of the JPEG header, which
   391				 * is needed to allow the hardware to write directly
   392				 * to the output buffer. Implementing this introduces
   393				 * a lot of complexity for little gain, as the markers
   394				 * enabled is already the minimum required set.
   395				 */
   396				.flags = V4L2_CTRL_FLAG_READ_ONLY,
   397			},
   398		}, {
   399			.codec = HANTRO_MPEG2_DECODER,
   400			.cfg = {
   401				.id = V4L2_CID_STATELESS_MPEG2_SEQUENCE,
   402			},
   403		}, {
   404			.codec = HANTRO_MPEG2_DECODER,
   405			.cfg = {
   406				.id = V4L2_CID_STATELESS_MPEG2_PICTURE,
   407			},
   408		}, {
   409			.codec = HANTRO_MPEG2_DECODER,
   410			.cfg = {
   411				.id = V4L2_CID_STATELESS_MPEG2_QUANTISATION,
   412			},
   413		}, {
   414			.codec = HANTRO_VP8_DECODER,
   415			.cfg = {
   416				.id = V4L2_CID_STATELESS_VP8_FRAME,
   417			},
   418		}, {
   419			.codec = HANTRO_H264_DECODER,
   420			.cfg = {
   421				.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
   422			},
   423		}, {
   424			.codec = HANTRO_H264_DECODER,
   425			.cfg = {
   426				.id = V4L2_CID_STATELESS_H264_SPS,
   427				.ops = &hantro_ctrl_ops,
   428			},
   429		}, {
   430			.codec = HANTRO_H264_DECODER,
   431			.cfg = {
   432				.id = V4L2_CID_STATELESS_H264_PPS,
   433			},
   434		}, {
   435			.codec = HANTRO_H264_DECODER,
   436			.cfg = {
   437				.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
   438			},
   439		}, {
   440			.codec = HANTRO_H264_DECODER,
   441			.cfg = {
   442				.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
   443				.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
   444				.def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
   445				.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
   446			},
   447		}, {
   448			.codec = HANTRO_H264_DECODER,
   449			.cfg = {
   450				.id = V4L2_CID_STATELESS_H264_START_CODE,
   451				.min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
   452				.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
   453				.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
   454			},
   455		}, {
   456			.codec = HANTRO_H264_DECODER,
   457			.cfg = {
   458				.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
   459				.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
   460				.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
   461				.menu_skip_mask =
   462				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
   463				.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
   464			}
   465		}, {
   466			.codec = HANTRO_HEVC_DECODER,
   467			.cfg = {
   468				.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
   469				.min = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
   470				.max = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
   471				.def = V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
   472			},
   473		}, {
   474			.codec = HANTRO_HEVC_DECODER,
   475			.cfg = {
   476				.id = V4L2_CID_STATELESS_HEVC_START_CODE,
   477				.min = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
   478				.max = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
   479				.def = V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
   480			},
   481		}, {
   482			.codec = HANTRO_HEVC_DECODER,
   483			.cfg = {
   484				.id = V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
   485				.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
   486				.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
   487				.def = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
   488			},
   489		}, {
   490			.codec = HANTRO_HEVC_DECODER,
   491			.cfg = {
   492				.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
   493				.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
   494				.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
   495			},
   496		}, {
   497			.codec = HANTRO_HEVC_DECODER,
   498			.cfg = {
   499				.id = V4L2_CID_STATELESS_HEVC_SPS,
   500				.ops = &hantro_hevc_ctrl_ops,
   501			},
   502		}, {
   503			.codec = HANTRO_HEVC_DECODER,
   504			.cfg = {
   505				.id = V4L2_CID_STATELESS_HEVC_PPS,
   506			},
   507		}, {
   508			.codec = HANTRO_HEVC_DECODER,
   509			.cfg = {
   510				.id = V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
   511			},
   512		}, {
   513			.codec = HANTRO_HEVC_DECODER,
   514			.cfg = {
   515				.id = V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
   516			},
   517		}, {
   518			.codec = HANTRO_VP9_DECODER,
   519			.cfg = {
   520				.id = V4L2_CID_STATELESS_VP9_FRAME,
   521				.ops = &hantro_vp9_ctrl_ops,
   522			},
   523		}, {
   524			.codec = HANTRO_VP9_DECODER,
   525			.cfg = {
   526				.id = V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
   527			},
   528		}, {
   529			.codec = HANTRO_AV1_DECODER,
   530			.cfg = {
 > 531				.id = V4L2_CID_STATELESS_AV1_FRAME,
   532			},
   533		}, {
   534			.codec = HANTRO_AV1_DECODER,
   535			.cfg = {
 > 536				.id = V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY,
 > 537				.dims = { V4L2_AV1_MAX_TILE_COUNT },
   538			},
   539		}, {
   540			.codec = HANTRO_AV1_DECODER,
   541			.cfg = {
 > 542				.id = V4L2_CID_STATELESS_AV1_SEQUENCE,
   543			},
   544		}, {
   545			.codec = HANTRO_AV1_DECODER,
   546			.cfg = {
 > 547				.id = V4L2_CID_STATELESS_AV1_FILM_GRAIN,
   548			},
   549		},
   550	};
   551	
   552	static int hantro_ctrls_setup(struct hantro_dev *vpu,
   553				      struct hantro_ctx *ctx,
   554				      int allowed_codecs)
   555	{
 > 556		int i, num_ctrls = ARRAY_SIZE(controls);
   557	
   558		v4l2_ctrl_handler_init(&ctx->ctrl_handler, num_ctrls);
   559	
   560		for (i = 0; i < num_ctrls; i++) {
   561			if (!(allowed_codecs & controls[i].codec))
   562				continue;
   563	
   564			v4l2_ctrl_new_custom(&ctx->ctrl_handler,
   565					     &controls[i].cfg, NULL);
   566			if (ctx->ctrl_handler.error) {
   567				vpu_err("Adding control (%d) failed %d\n",
   568					controls[i].cfg.id,
   569					ctx->ctrl_handler.error);
   570				v4l2_ctrl_handler_free(&ctx->ctrl_handler);
   571				return ctx->ctrl_handler.error;
   572			}
   573		}
   574		return v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
   575	}
   576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
