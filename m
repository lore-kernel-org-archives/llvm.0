Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF936128;
	Tue,  4 Jul 2023 19:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688499187; x=1720035187;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oNIEdHaEiR8OxME2pFIicwMil9EV3QsKKDNNQ7UDEoo=;
  b=ZqLPOIM1MEy26Dxfxawobu+wWznPjMrwfDFTds4ErvVwVjzUE0H6AdMI
   FkItW2d8Fn3cMrgiAiaVjFvLm28CFIFwpqzlyYkH3zOVFLP4L3A+DF9Qi
   DtiK8iqTEHpCMV4idsGtkFV7rxiFF2ANgT7z/OFuCTrHJNjg3S8H1wosk
   HOEEKIVO7oa6NOE58R3+DLyJDZiPmDXjSDpmZXnE2/QzF/X4zcuJfvBb6
   woB34v9tWj4m9qG38B4zGXQswfybAev79UeuV4DBRVCfDZ+MTZxkrtATy
   5Kc2ncIUFXur9JniZ+OJoucOI0uvnBAwhKSiVtUWVejl/e1nTmWmD7JZ/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="429221405"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="429221405"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 12:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="788939366"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="788939366"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 12:33:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGllp-000IUJ-0B;
	Tue, 04 Jul 2023 19:33:05 +0000
Date: Wed, 5 Jul 2023 03:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 33/38]
 sound/soc/codecs/sigmadsp.c:676:45: error: no member named 'kctl' in 'struct
 sigmadsp_control'
Message-ID: <202307050346.R8ow8O6J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   6dd4ae925ae5b90ccfbcb11dce06fd505cc18bc8
commit: f6df559bc59a922fc6bd100cd018207323c3f9d1 [33/38] ASoC: sigmadsp: Simplify with snd_ctl_activate_id()
config: hexagon-randconfig-r045-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050346.R8ow8O6J-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050346.R8ow8O6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050346.R8ow8O6J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/sigmadsp.c:11:
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
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/codecs/sigmadsp.c:11:
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
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/codecs/sigmadsp.c:11:
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
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> sound/soc/codecs/sigmadsp.c:676:45: error: no member named 'kctl' in 'struct sigmadsp_control'
     676 |         changed = snd_ctl_activate_id(card, &ctrl->kctl->id, active);
         |                                              ~~~~  ^
   6 warnings and 1 error generated.


vim +676 sound/soc/codecs/sigmadsp.c

   667	
   668	static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
   669		struct sigmadsp_control *ctrl, unsigned int samplerate_mask)
   670	{
   671		struct snd_card *card = sigmadsp->component->card->snd_card;
   672		bool active;
   673		int changed;
   674	
   675		active = sigmadsp_samplerate_valid(ctrl->samplerates, samplerate_mask);
 > 676		changed = snd_ctl_activate_id(card, &ctrl->kctl->id, active);
   677		if (active && changed > 0) {
   678			mutex_lock(&sigmadsp->lock);
   679			if (ctrl->cached)
   680				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
   681			mutex_unlock(&sigmadsp->lock);
   682		}
   683	}
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
