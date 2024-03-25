Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25BB6F533;
	Mon, 25 Mar 2024 21:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711403730; cv=none; b=ji5cxPUeZ5Wm2LuQDMgrSVtbAqO2NzgVhzYycuUKH3PcdPsZHXl6io9qdUax5kXd0AF5mB8WmgioHdsX+J3qpv5BsTPGgknt+IStBiElMoE4bXVgm3QzfQNzsieo0lo0n7uyFfr41DNTFKZsJ9Lj+CWAeSCOO/gVDL4+4W5QYGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711403730; c=relaxed/simple;
	bh=qf0xlb0YitmtJyDHzU+vOqNZ6ABbCCbv4SXwGFEZvxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kw3tHgqQUDhHNzpAUZGyxf9I1aJ4U6riX7T4JsS+yEGAQFK6rgQFFMlZHzJaezrqok0k0Mm3YFxu+aGxxVq4l3OLNijkakwBOU/gyjskFSTInzlQ8bjN7bx3sYZ/t0Y/zhuLeeFBG7QRfli343Ijd/ZSZZLUsets6W118AltbzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btnpHIPn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btnpHIPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711403729; x=1742939729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qf0xlb0YitmtJyDHzU+vOqNZ6ABbCCbv4SXwGFEZvxQ=;
  b=btnpHIPnWpPBXV8eBUvUTKylP41RPNn/FjcmUjOAuNHd8JHtgDx7sNIq
   +rSr3XZor9z2PRPSH18EGKjaN/dmdLo/DKi8BnW8xlCcSdT5hhaLSYZEe
   Q/jzlthbWNFVRwXSIYe9VYDNcf09jVVCy+7XpUa+JFNV9mQQ1SRoYge4F
   KYPclxluHmvcxVdVkJiTf86lZTuILuPFK57wzyevqyihULfXKGrx823mv
   hh/1zlsbVJXkgDg2VQ7D6jPDQB4dHTIVxcn9vbIpkM7QgF2bdFxtwnEUW
   8iiNgX8oOWQZitnYslaC8LIm3UW2cfcQaVon8fbXogK5p3D5TWiE0oeXq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17573711"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="17573711"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 14:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15838429"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Mar 2024 14:55:27 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rosHs-000Mqs-1U;
	Mon, 25 Mar 2024 21:55:24 +0000
Date: Tue, 26 Mar 2024 05:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v2_20240223_louis_chauvet_add_multi_mode_support_for_omap_mcspi
 2/3] drivers/spi/spi-omap2-mcspi.c:1265:7: warning: unused variable
 'word_delay_is_zero'
Message-ID: <202403260539.RrNU3f4c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20240223_louis_chauvet_add_multi_mode_support_for_omap_mcspi
head:   126a2dc2e634a8508e44feed1ef43cb4ebfb7ad7
commit: f2da90939a500160e17327423c937cad99299bd7 [2/3] spi: omap2-mcspi: Add support for MULTI-mode
config: x86_64-buildonly-randconfig-005-20240325 (https://download.01.org/0day-ci/archive/20240326/202403260539.RrNU3f4c-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403260539.RrNU3f4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403260539.RrNU3f4c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-omap2-mcspi.c:1280:3: warning: '/*' within block comment [-Wcomment]
    1280 |                 /*
         |                 ^
>> drivers/spi/spi-omap2-mcspi.c:1265:7: warning: unused variable 'word_delay_is_zero' [-Wunused-variable]
    1265 |         bool word_delay_is_zero;
         |              ^~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/word_delay_is_zero +1265 drivers/spi/spi-omap2-mcspi.c

  1257	
  1258	static int omap2_mcspi_prepare_message(struct spi_controller *ctlr,
  1259					       struct spi_message *msg)
  1260	{
  1261		struct omap2_mcspi	*mcspi = spi_controller_get_devdata(ctlr);
  1262		struct omap2_mcspi_regs	*ctx = &mcspi->ctx;
  1263		struct omap2_mcspi_cs	*cs;
  1264		struct spi_transfer	*tr;
> 1265		bool word_delay_is_zero;
  1266		u8 bits_per_word;
  1267	
  1268		/*
  1269		 * The conditions are strict, it is mandatory to check each transfer of the list to see if
  1270		 * multi-mode is applicable.
  1271		 */
  1272		mcspi->use_multi_mode = true;
  1273		list_for_each_entry(tr, &msg->transfers, transfer_list) {
  1274			if (!tr->bits_per_word)
  1275				bits_per_word = msg->spi->bits_per_word;
  1276			else
  1277				bits_per_word = tr->bits_per_word;
  1278	
  1279		/* Only a single channel can have the FORCE bit enabled
> 1280			/*
  1281			 * Check if this transfer contains only one word;
  1282			 */
  1283			if (bits_per_word < 8 && tr->len == 1) {
  1284				/* multi-mode is applicable, only one word (1..7 bits) */
  1285			} else if (bits_per_word >= 8 && tr->len == bits_per_word / 8) {
  1286				/* multi-mode is applicable, only one word (8..32 bits) */
  1287			} else {
  1288				/* multi-mode is not applicable: more than one word in the transfer */
  1289				mcspi->use_multi_mode = false;
  1290			}
  1291	
  1292			/* Check if transfer asks to change the CS status after the transfer */
  1293			if (!tr->cs_change)
  1294				mcspi->use_multi_mode = false;
  1295	
  1296			/*
  1297			 * If at least one message is not compatible, switch back to single mode
  1298			 *
  1299			 * The bits_per_word of certain transfer can be different, but it will have no
  1300			 * impact on the signal itself.
  1301			 */
  1302			if (!mcspi->use_multi_mode)
  1303				break;
  1304		}
  1305	
  1306		omap2_mcspi_set_mode(ctlr);
  1307	
  1308		/* In single mode only a single channel can have the FORCE bit enabled
  1309		 * in its chconf0 register.
  1310		 * Scan all channels and disable them except the current one.
  1311		 * A FORCE can remain from a last transfer having cs_change enabled
  1312		 *
  1313		 * In multi mode all FORCE bits must be disabled.
  1314		 */
  1315		list_for_each_entry(cs, &ctx->cs, node) {
  1316			if (msg->spi->controller_state == cs && !mcspi->use_multi_mode) {
  1317				continue;
  1318			}
  1319	
  1320			if ((cs->chconf0 & OMAP2_MCSPI_CHCONF_FORCE)) {
  1321				cs->chconf0 &= ~OMAP2_MCSPI_CHCONF_FORCE;
  1322				writel_relaxed(cs->chconf0,
  1323						cs->base + OMAP2_MCSPI_CHCONF0);
  1324				readl_relaxed(cs->base + OMAP2_MCSPI_CHCONF0);
  1325			}
  1326		}
  1327	
  1328		return 0;
  1329	}
  1330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
