Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DAE211C;
	Wed,  1 May 2024 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714588506; cv=none; b=kRaRACrbowJQm/hEsvwe8vv2kyXFOxqBkaNB1ABw86u2PDEBDXpb8mKYCH2xMwCVmGvNxOOb/6kOhZAMbpqVFA3ndZ+0ntbOW1T0ejmPeddp2XvMTKbJQeTZb9sl7DgOk9BpkLZa/eSx0qmWd59SB69cmHAwJE6ieNT02Qwaj1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714588506; c=relaxed/simple;
	bh=fCDzTzZbjGb6uqT6kSzbkYEbmAneq8Yq+jzepX8va1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTATsrqiQVt7q6JbglX72G3LYMmxnPkhVa+zfgkm7bxNP/ZBoyCEFCXAbDf3p+P4ciPYhRL4Ue944cbj1WWsbr4GZTBf6ojCTfppEgm5DI+ujjELv1sTl1sKKyQ+Ov1zZwdejgiqCIcfeDlbZor/7YHRQD2u29yaUgOx2zck58k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePI5eO3D; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePI5eO3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714588504; x=1746124504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fCDzTzZbjGb6uqT6kSzbkYEbmAneq8Yq+jzepX8va1k=;
  b=ePI5eO3DDxfXrikyicknIXZBIUpVkfchrDIry1ZPXXvjtBGzN2FBD3on
   +NAzKlJhP5ldOsE/tVPnyQ+yZtdVX5wHIn5fqFWU+niT72+0sXlQG8ads
   Q2m+QRNZKA+zV360Qe+Hrp7Jq6IkrmpoT9ViXfXOm7iLAjTVEddt6dkkg
   pyGGMGiob5WVnq4WWMNq9ODugaSo8fEfGOGp1ug/d8j8mI5GFdOWfjwdq
   M3sUp2qIGeRvdgRi+1aZLOKZUVXvlGJW9G5h6NK0sgdCmH7pxlSXNHeNM
   QPD5kFJEfslU1HczkBTTzlX8GFFKWbOOgkWmJ+PpTYUZ7R4l5wkVnV7GC
   A==;
X-CSE-ConnectionGUID: CfaR/6eURxK4cpAZ5/FIAw==
X-CSE-MsgGUID: 8uKXjPUOR5OZ+ZksgnltXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="35720565"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="35720565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 11:35:02 -0700
X-CSE-ConnectionGUID: d+R5C+YhSvKYPrEH+M9+ig==
X-CSE-MsgGUID: kZzV5MX4TyKLpBwDNOu+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; 
   d="scan'208";a="27361187"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2024 11:35:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2EnC-0009tG-0C;
	Wed, 01 May 2024 18:34:58 +0000
Date: Thu, 2 May 2024 02:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kailang Yang <kailang@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-linus 1/4] sound/pci/hda/patch_realtek.c:7222:8:
 error: no member named 'power_hook' in 'struct alc_spec'
Message-ID: <202405020226.ddBTVUNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
head:   9b3c22ab3929672b117f5c46d718692abb65da0b
commit: 1e707769df072757bdcafab158bb159ead73daa4 [1/4] ALSA: hda/realtek - Set GPIO3 to default at S4 state for Thinkpad with ALC1318
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240502/202405020226.ddBTVUNI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240502/202405020226.ddBTVUNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405020226.ddBTVUNI-lkp@intel.com/

Note: the tiwai-sound/for-linus HEAD 9b3c22ab3929672b117f5c46d718692abb65da0b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from sound/pci/hda/patch_realtek.c:17:
   In file included from include/linux/pci.h:38:
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
   In file included from sound/pci/hda/patch_realtek.c:17:
   In file included from include/linux/pci.h:38:
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
   In file included from sound/pci/hda/patch_realtek.c:17:
   In file included from include/linux/pci.h:38:
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
   In file included from sound/pci/hda/patch_realtek.c:17:
   In file included from include/linux/pci.h:2693:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/pci/hda/patch_realtek.c:7222:8: error: no member named 'power_hook' in 'struct alc_spec'
    7222 |         spec->power_hook = alc287_s4_power_gpio3_default;
         |         ~~~~  ^
   7 warnings and 1 error generated.


vim +7222 sound/pci/hda/patch_realtek.c

  7214	
  7215	static void alc287_fixup_lenovo_thinkpad_with_alc1318(struct hda_codec *codec,
  7216				       const struct hda_fixup *fix, int action)
  7217	{
  7218		struct alc_spec *spec = codec->spec;
  7219	
  7220		if (action != HDA_FIXUP_ACT_PRE_PROBE)
  7221			return;
> 7222		spec->power_hook = alc287_s4_power_gpio3_default;
  7223		spec->gen.pcm_playback_hook = alc287_alc1318_playback_pcm_hook;
  7224	}
  7225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
