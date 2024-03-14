Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C1CDDCA;
	Thu, 14 Mar 2024 06:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710397587; cv=none; b=rNNhYo8Yd3EZVaiifoNw3zoJXS0/XaVU/+H+AHdyc0nWcddGxr/LYIsklfzBlkT4bICgaYrNLS2T02HXnE5pGbzCdPYGTMr2/I3eoTnZoWTgPDlAmiSA9fRZsMQ/tsqdEs8wwedDBT9xQWtK3AB4H8Ow+cHhPklsnA5ICdXf/g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710397587; c=relaxed/simple;
	bh=mZwZ50bVBOhjmPhgBk8fElRcUd5UbUZwTh3xhQBAgL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpQfoFVCSsVOnqyvFDyV5p9oAL7zZEu2Z86EAULCsliMaocVo55mH4+V0UPZnT1Vcey2J26+8RnSOQNoYs3zV4rTAZ8YkpVtek+s7cHQhtGNBhRpBDw+bgf/UHmwGM4TGlwj4qoNPsVF7nVf/YsvYUVUa8W6eOO8OwB/zGOIO7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHR30cEu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHR30cEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710397586; x=1741933586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mZwZ50bVBOhjmPhgBk8fElRcUd5UbUZwTh3xhQBAgL8=;
  b=CHR30cEuzlmuVN8hFzM4v9ChTY5VHvSDNindhJ40sTXK3pFUg14BtlUw
   hDOgmg8glUtVMxdorKlrWi1PcX81krCVZClLW3xaL2Gi6KOdbv80HNTew
   W56Jlj7BVB86Z0sw6Y9EC1N2DTQRs9N+T6dM0PM7inseWkhZCmVjyf6KH
   Ib+YZ0S7a5mq3Ma0izZ9dYS0qX6wlJtSkhP65/Whq75b7zN2pKFcRULcW
   Gil2+3DyAt9iIIptkSX+YPM9eJ+4s5jYKbrmzK73tu3z22WAP5gbaCpEm
   JpGVISjsrN80BtPqTcDuowz7ku9pr/EOJDvi4crmAL/WQGquGlSvEAuHz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15840534"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="15840534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 23:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16659291"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Mar 2024 23:26:19 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkeXh-000DAZ-0J;
	Thu, 14 Mar 2024 06:26:17 +0000
Date: Thu, 14 Mar 2024 14:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	willl will <will@willwhang.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	tomi.valkeinen@ideasonboard.com,
	Umang Jain <umang.jain@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add imx283 camera sensor driver
Message-ID: <202403141412.K2tNvCOL-lkp@intel.com>
References: <20240313070705.91140-3-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313070705.91140-3-umang.jain@ideasonboard.com>

Hi Umang,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umang-Jain/media-dt-bindings-media-Add-bindings-for-IMX283/20240313-151107
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240313070705.91140-3-umang.jain%40ideasonboard.com
patch subject: [PATCH v3 2/2] media: i2c: Add imx283 camera sensor driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240314/202403141412.K2tNvCOL-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141412.K2tNvCOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141412.K2tNvCOL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mp-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra194-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brcm_u-boot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/tplink_safeloader.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/spmi-pmic-arb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_pruss.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/ingenic-adc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-ams.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/counter/ftm-quaddec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/drivers/snd-pcmtest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/pci/hda/snd-hda-cirrus-scodec-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/soc-topology-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-ab8500-codec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section mismatch in reference: adc3xxx_i2c_driver+0x8 (section: .data) -> adc3xxx_i2c_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-dma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/mxs/snd-soc-mxs-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-sdw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/qdsp6/snd-q6dsp-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8m.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8ulp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/imx-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mtk-adsp-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8195/snd-sof-mt8195.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8186/snd-sof-mt8186.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-of.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/xilinx/snd-soc-xlnx-formatter-pcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mbochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kobject-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kset-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_cmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_nbyte.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_u32.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_meta.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_text.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_canid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ah4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/xfrm4_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_algo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ah6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/xfrm6_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/mip6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ip6_udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/mpoa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/6lowpan/ieee802154_6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/ieee802154_socket.o
>> ERROR: modpost: "__hexagon_udivdi3" [drivers/media/i2c/imx283.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
