Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7E1BDDC;
	Fri, 20 Oct 2023 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AimdY6mZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808735; x=1729344735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1lappJawf9QdpseUkh3M9M1cp57mIDp6pSVPbTxZMQ=;
  b=AimdY6mZJWjtxcFG0dRfeXzwRqbtWwzUN6fVe8inxZzJ2Td9zyTnw4sX
   00OQxFq3l0Ec3sVq9Gni7xd9bcykb0bnswgvuS1ZLJtEtMqn9ZCZ2DXgs
   99zVtLHpHUuCpM8DL6Mh2G396GdET7XFOgzeyHPXTv3tIcWymgcr+4V5G
   5Ldeu5meqSFsnLSp8TIAXyVhtlxx2qTMHFBI5GJhVClSlhUz0kb7vDvLQ
   wuc7tRedjPv7mOJi9Y1aAuG3y5fXGLGzR9nTAPuv/MOAwUpkDBtu3KkrT
   2FwERzE9BnzK0jtc4//JizwOe143LwmL3INJKkGt2X6ANH+VxFVrfTcm/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="8060215"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="8060215"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="707226765"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="707226765"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Oct 2023 06:32:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtpbl-0003ZP-0n;
	Fri, 20 Oct 2023 13:32:09 +0000
Date: Fri, 20 Oct 2023 21:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Kuo <louis.kuo@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>
Subject: [pinchartl:mtk/v6.6/pumpkin/camera 12/35]
 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:401:3: error:
 call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202310202107.B1ZUl70i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/pumpkin/camera
head:   c595443dd479579398aff2c7a3991dfeacb6090d
commit: 58edac54d6fd6ad03fbf9b2a590287296860f845 [12/35] media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor interface
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231020/202310202107.B1ZUl70i-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202107.B1ZUl70i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202107.B1ZUl70i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:401:3: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
                   ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:328:8: note: expanded from macro 'mtk_seninf_update'
                               FIELD_PREP(reg##_##field, val))
                               ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:415:3: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
                   ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:328:8: note: expanded from macro 'mtk_seninf_update'
                               FIELD_PREP(reg##_##field, val))
                               ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:447:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0, CSI0_BIST_LN0_MUX, lanes[0]);
           ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:340:7: note: expanded from macro 'mtk_seninf_input_update'
                                     FIELD_PREP(reg##_##field, val))
                                     ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:472:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mtk_seninf_input_update(input, SENINF_CTRL, SENINF_EN, 1);
           ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:340:7: note: expanded from macro 'mtk_seninf_input_update'
                                     FIELD_PREP(reg##_##field, val))
                                     ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:550:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);
           ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:363:5: note: expanded from macro 'mtk_seninf_mux_update'
                                   FIELD_PREP(reg##_##field, val))
                                   ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:623:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mtk_seninf_update(priv, SENINF_TOP_CTRL, MUX_LP_MODE, 0);
           ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:328:8: note: expanded from macro 'mtk_seninf_update'
                               FIELD_PREP(reg##_##field, val))
                               ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1068:27: error: field has incomplete type 'struct v4l2_async_subdev'
           struct v4l2_async_subdev asd;
                                    ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1068:9: note: forward declaration of 'struct v4l2_async_subdev'
           struct v4l2_async_subdev asd;
                  ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1101:8: error: invalid application of 'sizeof' to an incomplete type 'struct v4l2_async_subdev'
           asd = v4l2_async_nf_add_fwnode(&priv->notifier,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:196:56: note: expanded from macro 'v4l2_async_nf_add_fwnode'
           ((type *)__v4l2_async_nf_add_fwnode(notifier, fwnode, sizeof(type)))
                                                                 ^     ~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1068:9: note: forward declaration of 'struct v4l2_async_subdev'
           struct v4l2_async_subdev asd;
                  ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1215:11: error: incompatible function pointer types initializing 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' with an expression of type 'int (struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Wincompatible-function-pointer-types]
           .bound = mtk_seninf_notifier_bound,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1259:36: error: too few arguments to function call, expected 2, have 1
           v4l2_async_nf_init(&priv->notifier);
           ~~~~~~~~~~~~~~~~~~                ^
   include/media/v4l2-async.h:159:6: note: 'v4l2_async_nf_init' declared here
   void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
        ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1271:48: error: too many arguments to function call, expected single argument 'notifier', have 2 arguments
           ret = v4l2_async_nf_register(&priv->v4l2_dev, &priv->notifier);
                 ~~~~~~~~~~~~~~~~~~~~~~                  ^~~~~~~~~~~~~~~
   include/media/v4l2-async.h:281:5: note: 'v4l2_async_nf_register' declared here
   int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
       ^
   11 errors generated.


vim +/FIELD_PREP +401 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c

   360	
   361	#define mtk_seninf_mux_update(mux, reg, field, val)			\
   362		__mtk_seninf_mux_update(mux, reg, reg##_##field,	\
   363					FIELD_PREP(reg##_##field, val))
   364	
   365	/* -----------------------------------------------------------------------------
   366	 * Hardware Configuration
   367	 *
   368	 * The SENINF is the camera sensor interface. On the input side it contains
   369	 * input channels (also named SENINF), each made of a CSI-2 receiver, an
   370	 * interface for parallel sensors, and a test pattern generator. The inputs are
   371	 * routed through a N:M crossbar switch (TOP MUX) to VC/DT filters with a FIFO
   372	 * (MUX). The MUX are routed to another N:M crossbar switch (CAM MUX), whose
   373	 * output is then connected to other IP cores.
   374	 *
   375	 *            +-------------------------------------------------------+
   376	 *            | SENINF                                                |
   377	 *            |                                                       |
   378	 * +-------+  |   +----------+    TOP MUX                             |
   379	 * |       |  |   |  SENINF  |      |\                        CAM MUX |
   380	 * | D-PHY | ---> | CSI-2 RX | ---> | |      +------------+      |\   |
   381	 * |       |  |   |   TPG    |   -> | | ---> | MUX (FIFO) | ---> | | ---> CAMSV
   382	 * +-------+  |   +----------+   -> | |      +------------+   -> | |  |
   383	 *            |                     |/                        -> | |  |
   384	 *            |                                                  |/   |
   385	 *            |                                                       |
   386	 *    ...     |       ...                         ...                --->
   387	 *            |                                                       |
   388	 *            |                                                       |
   389	 *            +-------------------------------------------------------+
   390	 *
   391	 * The number of PHYs, SENINF and MUX differ between SoCs. MT8167 has a single
   392	 * MUX and thus no output CAM MUX crossbar switch.
   393	 */
   394	
   395	static void mtk_seninf_csi2_setup_phy(struct mtk_seninf *priv)
   396	{
   397		/* CSI0 */
   398		if (priv->inputs[CSI_PORT_0].phy) {
   399			struct mtk_seninf_input *input = &priv->inputs[CSI_PORT_0];
   400	
 > 401			mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
   402					  DPHY_MODE, 0 /* 4D1C*/);
   403			mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
   404					  CK_SEL_1, input->bus.clock_lane);
   405			mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
   406					  CK_SEL_2, 2);
   407			mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
   408					  PHY_SENINF_LANE_MUX_CSI0_EN, 1);
   409		}
   410	
   411		/* CSI1 */
   412		if (priv->inputs[CSI_PORT_1].phy) {
   413			struct mtk_seninf_input *input = &priv->inputs[CSI_PORT_1];
   414	
   415			mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
   416					  DPHY_MODE, 0 /* 4D1C */);
   417			mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
   418					  CK_SEL_1, input->bus.clock_lane);
   419			mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
   420					  PHY_SENINF_LANE_MUX_CSI1_EN, 1);
   421		}
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
