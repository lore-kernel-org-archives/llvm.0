Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF3515A5;
	Sun, 31 Mar 2024 04:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711858099; cv=none; b=GEaUxPo+ynsHIXJS/B5gVu6qfWanZeVCpx7SL1K5uDJJxZmF3+v74B4JpIBMGVX+X57Hh0WW/MJwvssmFrwbXxkpLiUoD0CAipugpiLz+mvlgwwrDyscFvuytwT1pyGPBfdhhGwqgaqWMxYTF8xpmKUJjFppC65D+XGETqm2U9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711858099; c=relaxed/simple;
	bh=XJWEFG8cBuLzbsdXT8I0vTyUl7M6hr6UYWZ6WptGkp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTUZ64MBuKLXoY0lSm9FLadHms4IhjM/V0A4GMTHqJkNbAqbwSu9atbkL4GjKdLI1+1NWnAv6mryde/srgzj/E0HpQEsW3rA2r5VzrwYkFJ/5JkFFZ2dSYW0eM7hDegpKuvpGBF7rtebclLrsAq6XAcfJtZhhvFGniuU4W9Hg0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWOvOp95; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWOvOp95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711858097; x=1743394097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XJWEFG8cBuLzbsdXT8I0vTyUl7M6hr6UYWZ6WptGkp8=;
  b=RWOvOp95mDYrblg5CXcz59BO5+0aUcN0zFWUUFr5xtSc2Z9VlYhoo8sh
   EE1tOhYJmEg5TUjO2SsyQCrTxEQqM1NoMngBSPsbfP86LCTx2yiUwd308
   kz7De6KHXLnxeJ/negybs2g4ts21Jph9ptkT7BY6mqp1UF6+s8L0r9vNR
   UmmICQTI3+95t2HiWK26YQKOzyiseVfTNeOY+V84QiSQQ43GxdcvikY/L
   V4xP4xPe6LpfawdpS9BEckzIHU2jlMF1j3/G6W4jVqbz5sAHeZ79JbRZd
   XvWRQCTVFbLMO98L7E4dTRGGZfPDr4onmRJiDawh+Z8zPEVDIKyUBx1IE
   Q==;
X-CSE-ConnectionGUID: dn+XvmW+QzOH0R4QIT/rHQ==
X-CSE-MsgGUID: JdQ5vzKPQ06IG/qsi5MGQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="17626161"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17626161"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 21:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17401381"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Mar 2024 21:08:15 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqmUO-0000mO-1R;
	Sun, 31 Mar 2024 04:08:12 +0000
Date: Sun, 31 Mar 2024 12:07:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Ondrej Jirman <megi@xff.cz>
Subject: [linux-next:master 1069/2532] sound/soc/sunxi/sun8i-codec.c:1355:38:
 error: no member named 'type' in 'struct snd_jack'
Message-ID: <202403311242.2m3EXGCO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6bd6c9333397f5a0e2667d4d82fef8c970108f2
commit: 21fa98f4197bb3365dda1417708b318f403c13c1 [1069/2532] ASoC: sun8i-codec: Implement jack and accessory detection
config: hexagon-randconfig-r016-20211019 (https://download.01.org/0day-ci/archive/20240331/202403311242.2m3EXGCO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311242.2m3EXGCO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311242.2m3EXGCO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/sunxi/sun8i-codec.c:16:
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
   In file included from sound/soc/sunxi/sun8i-codec.c:16:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/sunxi/sun8i-codec.c:16:
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
>> sound/soc/sunxi/sun8i-codec.c:1355:38: error: no member named 'type' in 'struct snd_jack'
    1355 |         int type_mask = scodec->jack->jack->type;
         |                         ~~~~~~~~~~~~~~~~~~  ^
   sound/soc/sunxi/sun8i-codec.c:1494:30: error: no member named 'type' in 'struct snd_jack'
    1494 |                                             scodec->jack->jack->type);
         |                                             ~~~~~~~~~~~~~~~~~~  ^
   6 warnings and 2 errors generated.


vim +1355 sound/soc/sunxi/sun8i-codec.c

  1349	
  1350	static void sun8i_codec_jack_work(struct work_struct *work)
  1351	{
  1352		struct sun8i_codec *scodec = container_of(work, struct sun8i_codec,
  1353							  jack_work.work);
  1354		unsigned int mdata;
> 1355		int type_mask = scodec->jack->jack->type;
  1356		int type;
  1357	
  1358		guard(mutex)(&scodec->jack_mutex);
  1359	
  1360		if (scodec->jack_status == SUN8I_JACK_STATUS_DISCONNECTED) {
  1361			if (scodec->last_hmic_irq != SUN8I_HMIC_STS_JACK_IN_IRQ_ST)
  1362				return;
  1363	
  1364			scodec->jack_last_sample = -1;
  1365	
  1366			if (type_mask & SND_JACK_MICROPHONE) {
  1367				/*
  1368				 * If we were in disconnected state, we enable HBIAS and
  1369				 * wait 600ms before reading initial HDATA value.
  1370				 */
  1371				scodec->jack_hbias_ready = ktime_add_ms(ktime_get(), 600);
  1372				sun8i_codec_set_hmic_bias(scodec, true);
  1373				queue_delayed_work(system_power_efficient_wq,
  1374						   &scodec->jack_work,
  1375						   msecs_to_jiffies(610));
  1376				scodec->jack_status = SUN8I_JACK_STATUS_WAITING_HBIAS;
  1377			} else {
  1378				snd_soc_jack_report(scodec->jack, SND_JACK_HEADPHONE,
  1379						    type_mask);
  1380				scodec->jack_status = SUN8I_JACK_STATUS_CONNECTED;
  1381			}
  1382		} else if (scodec->jack_status == SUN8I_JACK_STATUS_WAITING_HBIAS) {
  1383			/*
  1384			 * If we're waiting for HBIAS to stabilize, and we get plug-out
  1385			 * interrupt and nothing more for > 100ms, just cancel the
  1386			 * initialization.
  1387			 */
  1388			if (scodec->last_hmic_irq == SUN8I_HMIC_STS_JACK_OUT_IRQ_ST) {
  1389				scodec->jack_status = SUN8I_JACK_STATUS_DISCONNECTED;
  1390				sun8i_codec_set_hmic_bias(scodec, false);
  1391				return;
  1392			}
  1393	
  1394			/*
  1395			 * If we're not done waiting for HBIAS to stabilize, wait more.
  1396			 */
  1397			if (!ktime_after(ktime_get(), scodec->jack_hbias_ready)) {
  1398				s64 msecs = ktime_ms_delta(scodec->jack_hbias_ready,
  1399							   ktime_get());
  1400	
  1401				queue_delayed_work(system_power_efficient_wq,
  1402						   &scodec->jack_work,
  1403						   msecs_to_jiffies(msecs + 10));
  1404				return;
  1405			}
  1406	
  1407			/*
  1408			 * Everything is stabilized, determine jack type and report it.
  1409			 */
  1410			regmap_read(scodec->regmap, SUN8I_HMIC_STS, &mdata);
  1411			mdata &= SUN8I_HMIC_STS_HMIC_DATA_MASK;
  1412			mdata >>= SUN8I_HMIC_STS_HMIC_DATA;
  1413	
  1414			regmap_write(scodec->regmap, SUN8I_HMIC_STS, 0);
  1415	
  1416			type = mdata < 16 ? SND_JACK_HEADPHONE : SND_JACK_HEADSET;
  1417			if (type == SND_JACK_HEADPHONE)
  1418				sun8i_codec_set_hmic_bias(scodec, false);
  1419	
  1420			snd_soc_jack_report(scodec->jack, type, type_mask);
  1421			scodec->jack_status = SUN8I_JACK_STATUS_CONNECTED;
  1422		} else if (scodec->jack_status == SUN8I_JACK_STATUS_CONNECTED) {
  1423			if (scodec->last_hmic_irq != SUN8I_HMIC_STS_JACK_OUT_IRQ_ST)
  1424				return;
  1425	
  1426			scodec->jack_status = SUN8I_JACK_STATUS_DISCONNECTED;
  1427			if (type_mask & SND_JACK_MICROPHONE)
  1428				sun8i_codec_set_hmic_bias(scodec, false);
  1429	
  1430			snd_soc_jack_report(scodec->jack, 0, type_mask);
  1431		}
  1432	}
  1433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
