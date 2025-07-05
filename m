Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BE82E3711;
	Sat,  5 Jul 2025 06:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751697152; cv=none; b=pzD59SXK8tS1FIl32G8aNRfizsSKnl/3wnCqZvKbyj+9e5P/k6XyO8uooWVHaY7CU+RGMBu4asTz7U1CtCIWt0yv3M1y3GgA+x7pV1bsNyZr+emkBKCXmFpiPpjqMok7/w0bKGClCvG6UiC97EHx127UpCi7ViR5kY5Qu6R931Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751697152; c=relaxed/simple;
	bh=W/mW9uDSW3QytN8mOlYBL+H60pioxaCGjkolpFAG8Js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KpiJxlvb6COAS/vUysD5jZZNCLuHA7zGipHv0EU2xj/QlUlOudIdcHRlvBL2WrsjB9LSVVVAxihQXKrb0iuSXRhMZx8D+Uoi9vIyG/eeYp8JYjiLKLUbHhyibalEqjnSVnw58TgK84XdB7eNqXuaAynjsQ7NNj2VpmOOLO+3xao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMyjS059; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMyjS059"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751697150; x=1783233150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/mW9uDSW3QytN8mOlYBL+H60pioxaCGjkolpFAG8Js=;
  b=eMyjS059YZ27niwWsefkw26xWQ/aTp5R8X6eJ7RQPUhbIOfpoRxbYgcJ
   LXfKPJJZtZ4pEOHz3/y8skD/NZBHLXJDR7v8BSVgOKJuaIuteff7yJumW
   6PHrz+ANTWUnjcghCQ/Wm4QNrmL38Zxodz1Zi2qQWDjVfEOT69IrmYpLf
   bUWGTc4t0AeXmgKQiO48PThEsthwWptGwm0uq5DLpVV/heWoUOpUO1p2D
   dmFbccAp0dfjPgEoYu+YoHWawrbIrTYrop8vb7P3yxoOrS0cLlXr0xbTH
   BYODZU79suFeIQrnTxm4+q6PXkIFiH70lGSKvyyAe+mOqx7Zqm+iGW6xU
   w==;
X-CSE-ConnectionGUID: 91c7wl8+RQ6GwFj5Jaj5Eg==
X-CSE-MsgGUID: 0WTHbnp4QyGvGx8fXhY6pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64605279"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="64605279"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 23:32:29 -0700
X-CSE-ConnectionGUID: XuXqsPzgQ7ySOhEaO6SQEA==
X-CSE-MsgGUID: VpYCxEDGQE2NJc4CS6w7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="159329031"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jul 2025 23:32:28 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXwRl-0004Lf-2P;
	Sat, 05 Jul 2025 06:32:25 +0000
Date: Sat, 5 Jul 2025 14:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/hda-reorg 29/53] sound/hda/common/hwdep.c:26:6:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202507051454.VintnWOF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/hda-reorg
head:   6119728edf86cefcbf7b20e000414c85916e900d
commit: 5b965be899c8e3286f5111b7e90207afe5124b67 [29/53] ALSA: hda: Move common codec driver into sound/hda/common directory
config: riscv-randconfig-001-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051454.VintnWOF-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051454.VintnWOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051454.VintnWOF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/hda/common/hwdep.c:10:
   In file included from include/linux/compat.h:17:
   include/linux/fs.h:3979:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    3979 |         if (unlikely(get_user(c, path)))
         |                      ^
   arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
     274 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
     244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
     207 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
     196 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
>> sound/hda/common/hwdep.c:26:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      26 |         if (get_user(verb, &arg->verb))
         |             ^
   arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
     274 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
     244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
     207 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
     196 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   sound/hda/common/hwdep.c:40:6: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      40 |         if (get_user(verb, &arg->verb))
         |             ^
   arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
     274 |                 __get_user((x), __p) :                          \
         |                 ^
   arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
     244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
         |         ^
   arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
     207 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
         |         ^
   arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
     196 |                 __get_user_8((x), __gu_ptr, label);             \
         |                 ^
   arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
     130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
         |         ^
   3 warnings generated.


vim +26 sound/hda/common/hwdep.c

2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  17  
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  18  /*
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  19   * write/read an out-of-bound verb
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  20   */
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  21  static int verb_write_ioctl(struct hda_codec *codec,
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  22  			    struct hda_verb_ioctl __user *arg)
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  23  {
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  24  	u32 verb, res;
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  25  
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27 @26  	if (get_user(verb, &arg->verb))
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  27  		return -EFAULT;
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  28  	res = snd_hda_codec_read(codec, verb >> 24, 0,
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  29  				 (verb >> 8) & 0xffff, verb & 0xff);
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  30  	if (put_user(res, &arg->res))
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  31  		return -EFAULT;
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  32  	return 0;
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  33  }
2807314d467e7d sound/pci/hda/hda_hwdep.c Takashi Iwai 2007-07-27  34  

:::::: The code at line 26 was first introduced by commit
:::::: 2807314d467e7dd929c42050031aabbd28e78f0b [ALSA] hda-intel - Add hwdep interface

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@perex.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
