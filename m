Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13376BE67;
	Thu,  6 Jul 2023 18:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688667945; x=1720203945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RpUpxBny2UVDXDb7xwuaQGUaM59O2CRMhqq8v/0L37Y=;
  b=EJeqSgX/ZAcxynlzy8DxPv7j33G3ibDU4loGVo6l4YKLNdrlywz0g9q9
   bvR8I1G1I9IqhAphHarXDFqg/1amUIq5lgA3d7xgDUaijlsAGkcvg3ze4
   gv5iP0smWYqvXNly8+Ez8GMmJHD+fNqKgrg1xifSD7e/M2qV2OMhVA9P4
   3YYiqeEb8m8WsJzL4gChTN24hZC9YYpLtalmkuiVcoExUIIacPxW4QN9H
   E1pOeAvsVy9lGpuugyD1ytvvZGnvY9niPNsjC0xurWmolWp0r2+TIWRzl
   ZPYxhKU+NBbwCHD6dQuoqYQjQRMPEI+p6l5cdu0eq/anm1wxC/gh2vryw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427368938"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="427368938"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 11:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="713674680"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="713674680"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jul 2023 11:25:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHTfg-0001V4-01;
	Thu, 06 Jul 2023 18:25:40 +0000
Date: Fri, 7 Jul 2023 02:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 8/37] sound/soc/soc-ops.c:817:5: warning:
 stack frame size (1048) exceeds limit (1024) in 'snd_soc_set_enum_kctl'
Message-ID: <202307070204.IjXK6Uft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   a83cba6338dc1a40eaff3acf45fadfff71e6da6b
commit: da1b763c95a09c2234123dc7745c8eec5eda96f4 [8/37] ASoC: ops: Introduce 'soc_set_enum_kctl'
config: hexagon-randconfig-r023-20230706 (https://download.01.org/0day-ci/archive/20230707/202307070204.IjXK6Uft-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070204.IjXK6Uft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070204.IjXK6Uft-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/soc-ops.c:25:
   In file included from include/sound/soc.h:18:
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
   In file included from sound/soc/soc-ops.c:25:
   In file included from include/sound/soc.h:18:
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
   In file included from sound/soc/soc-ops.c:25:
   In file included from include/sound/soc.h:18:
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
>> sound/soc/soc-ops.c:817:5: warning: stack frame size (1048) exceeds limit (1024) in 'snd_soc_set_enum_kctl' [-Wframe-larger-than]
     817 | int snd_soc_set_enum_kctl(struct snd_soc_card *card,
         |     ^
   7 warnings generated.


vim +/snd_soc_set_enum_kctl +817 sound/soc/soc-ops.c

   806	
   807	/**
   808	 * snd_soc_set_enum_kctl - Set enumerated controls matching a pattern
   809	 *
   810	 * @card: where to look for the controls
   811	 * @name: name pattern
   812	 * @value: string value to set the controls to
   813	 *
   814	 * Return number of matching and set controls on success, else error.
   815	 * No controls need to match.
   816	 */
 > 817	int snd_soc_set_enum_kctl(struct snd_soc_card *card,
   818		const char *name, const char *value)
   819	{
   820		struct snd_kcontrol *kctl;
   821		int hits = 0;
   822		int ret;
   823	
   824		/* Sanity check for name */
   825		if (unlikely(!name))
   826			return -EINVAL;
   827	
   828		list_for_each_entry(kctl, &card->snd_card->controls, list) {
   829			if (!soc_control_matches(kctl, name))
   830				continue;
   831	
   832			ret = soc_set_enum_kctl(kctl, value);
   833			if (ret < 0)
   834				return ret;
   835			hits++;
   836		}
   837	
   838		if (!hits)
   839			return -EINVAL;
   840	
   841		return hits;
   842	}
   843	EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
   844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
