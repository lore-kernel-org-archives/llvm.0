Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4D61552F6;
	Mon,  2 Sep 2024 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725262190; cv=none; b=D/ECWFfDpqC+MKWctOj+722JlIK+/DNfYnsFy9P68TjdJ0rQz1lKcTfS4N7kETXyV2VWLjCKmh2L5Ttp1nC9n/5djhYpp+KI32SO/KkgqW6EQ/6Rec7zIkcWU0i1z02UBUD5TgziJIiLaGh0kqUgBvgs4NlEqQjJ3uGwyxD4854=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725262190; c=relaxed/simple;
	bh=lhTaFc5ogQBNc6vanF2w9YH4+fRsbl4uXeonPitGgvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjfaSmSS5c2wkDNXDIvNzzIt5Hbkudp65/DDSyvej8K07/EQFWOVWhqSyPLUAdR5lVQHj1JCQjpGabHoF20vkyrguIASVT2/d/d7m3eglf/7Qfbduk/UIQhXjleociBV0MSsGxIjvrEHBNujOC8Kvvwj7FjbLp8R/CVtiewqZyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJJgp/9c; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJJgp/9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725262189; x=1756798189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lhTaFc5ogQBNc6vanF2w9YH4+fRsbl4uXeonPitGgvg=;
  b=OJJgp/9ccsMS2gb8ibou4zzRs8C5zBruUrvuQ+wXjmCtfl2M/VSbgpzq
   OQGabGnOHXVu10MYIHqoOkQL32AGZm9Qtnwng7EgfI9479x/nqzkl4UeJ
   AhrDceOT7kA/MWqi18TjSSXJI4OcaIONr3s9n58zrpuQ0ex3FG3mYzJG7
   RGQiEkFBSiz+yMRp99XDDu6+w96sovLjPL2evwsuz2b75VSgkaFMoWpyt
   DhIfWtqLVbE+zTjP5eHjRbZQ/iceXiiTQ+/LzjFO5CK5F3n9A7j3sMaS2
   uZXunuKoBfzMiqPmOkh1+jIXC7/3csY8CxEO0MAETJ/xK4nNWwGQdn18z
   A==;
X-CSE-ConnectionGUID: sHmf9cT9T72dNfrn92tPAw==
X-CSE-MsgGUID: UbGnVPuRQ+qF9NVjrXKvmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23990752"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23990752"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 00:29:48 -0700
X-CSE-ConnectionGUID: sqYxTiB5T5Cls08UIZ6vxQ==
X-CSE-MsgGUID: ysmC1HPUT3e9cRb9r1dJAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="68922739"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2024 00:29:46 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl1VP-0005Ee-1c;
	Mon, 02 Sep 2024 07:29:43 +0000
Date: Mon, 2 Sep 2024 15:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Geoffrey D. Bennett" <g@b4.vu>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Mark Hills <mark@xwax.org>, Arun Raghavan <arun@arunraghavan.net>,
	Cyan Nyan <cyan.vtb@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Add mixer quirk for RME Digiface USB
Message-ID: <202409021549.DbXWdqGa-lkp@intel.com>
References: <20240902-rme-digiface-v1-2-6e88472a2744@asahilina.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-rme-digiface-v1-2-6e88472a2744@asahilina.net>

Hi Asahi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Asahi-Lina/ALSA-usb-audio-Add-quirk-for-RME-Digiface-USB/20240902-054004
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240902-rme-digiface-v1-2-6e88472a2744%40asahilina.net
patch subject: [PATCH 2/2] ALSA: usb-audio: Add mixer quirk for RME Digiface USB
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20240902/202409021549.DbXWdqGa-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021549.DbXWdqGa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021549.DbXWdqGa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/usb/mixer_quirks.c:3000:42: warning: shift count >= width of type [-Wshift-count-overflow]
           bool invert = kcontrol->private_value & RME_DIGIFACE_INVERT;
                                                   ^~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:2948:29: note: expanded from macro 'RME_DIGIFACE_INVERT'
   #define RME_DIGIFACE_INVERT BIT(32)
                               ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   sound/usb/mixer_quirks.c:3063:42: warning: shift count >= width of type [-Wshift-count-overflow]
           bool invert = kcontrol->private_value & RME_DIGIFACE_INVERT;
                                                   ^~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:2948:29: note: expanded from macro 'RME_DIGIFACE_INVERT'
   #define RME_DIGIFACE_INVERT BIT(32)
                               ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   sound/usb/mixer_quirks.c:3160:4: warning: shift count >= width of type [-Wshift-count-overflow]
                           RME_DIGIFACE_INVERT,
                           ^~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:2948:29: note: expanded from macro 'RME_DIGIFACE_INVERT'
   #define RME_DIGIFACE_INVERT BIT(32)
                               ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   sound/usb/mixer_quirks.c:3185:4: warning: shift count >= width of type [-Wshift-count-overflow]
                           RME_DIGIFACE_INVERT,
                           ^~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:2948:29: note: expanded from macro 'RME_DIGIFACE_INVERT'
   #define RME_DIGIFACE_INVERT BIT(32)
                               ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   sound/usb/mixer_quirks.c:3210:4: warning: shift count >= width of type [-Wshift-count-overflow]
                           RME_DIGIFACE_INVERT,
                           ^~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:2948:29: note: expanded from macro 'RME_DIGIFACE_INVERT'
   #define RME_DIGIFACE_INVERT BIT(32)
                               ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   sound/usb/mixer_quirks.c:3235:4: warning: shift count >= width of type [-Wshift-count-overflow]
                           RME_DIGIFACE_INVERT,
                           ^~~~~~~~~~~~~~~~~~~
   sound/usb/mixer_quirks.c:2948:29: note: expanded from macro 'RME_DIGIFACE_INVERT'
   #define RME_DIGIFACE_INVERT BIT(32)
                               ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   6 warnings generated.


vim +3000 sound/usb/mixer_quirks.c

  2995	
  2996	static int snd_rme_digiface_get_status_val(struct snd_kcontrol *kcontrol)
  2997	{
  2998		int err;
  2999		u32 status[4];
> 3000		bool invert = kcontrol->private_value & RME_DIGIFACE_INVERT;
  3001		u8 reg = kcontrol->private_value >> 16;
  3002		u16 mask = kcontrol->private_value & 0xffff;
  3003		u16 val;
  3004	
  3005		err = snd_rme_digiface_read_status(kcontrol, status);
  3006		if (err < 0)
  3007			return err;
  3008	
  3009		switch (reg) {
  3010		/* Status register halfwords */
  3011		case RME_DIGIFACE_STATUS_REG0L ... RME_DIGIFACE_STATUS_REG3H:
  3012			break;
  3013		case RME_DIGIFACE_CTL_REG1: /* Control register 1, present in halfword 3L */
  3014			reg = RME_DIGIFACE_STATUS_REG3L;
  3015			break;
  3016		case RME_DIGIFACE_CTL_REG2: /* Control register 2, present in halfword 3H */
  3017			reg = RME_DIGIFACE_STATUS_REG3H;
  3018			break;
  3019		default:
  3020			return -EINVAL;
  3021		}
  3022	
  3023		if (reg & 1)
  3024			val = status[reg >> 1] >> 16;
  3025		else
  3026			val = status[reg >> 1] & 0xffff;
  3027	
  3028		if (invert)
  3029			val ^= mask;
  3030	
  3031		return field_get(mask, val);
  3032	}
  3033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
