Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8067C;
	Sun, 28 May 2023 00:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685232571; x=1716768571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UZRnujyyKniRxq6Jza54gh5dPp6YrNQDDwA3s5Cv5WQ=;
  b=Qn1SHwTtWD/w/DOtcW0A6g5wKBGlGhyGobw1QORcPn1PKYw2IZ6QVWCz
   HNfrP+pyBHPSIPUFXwB55JSmufHXqNf14BoRasPze6tjbAY/47dUDISUS
   Wxvz1XewgTGTxazrB7DEzuVf9KXAF+5xf/EbjaLo35lLcqTayLpp6jeue
   xm6SwzAS2N/CuaQGLVqBqta4ruA0uSQ0VdU7O2Wn5GB5AAJjtuslUHTud
   0Gk01iUrs45p/jdY2nTGEfxKyJMwHMvMbeg/9Lgh4+l/ZAwg4pV0frO2j
   tEJVPOgkjaPCy5/jUvc9UlTQ2t7Fsko4iJsbLKDMBVuOjk38GC13IlqUL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="334815476"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="334815476"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 17:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="849932955"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="849932955"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 May 2023 17:09:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q33yS-000KGm-2w;
	Sun, 28 May 2023 00:09:28 +0000
Date: Sun, 28 May 2023 08:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 3/6] ALSA: emu10k1: actually disassemble DSP instructions
 in /proc
Message-ID: <202305280731.yycJIsaL-lkp@intel.com>
References: <20230526101659.437969-4-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526101659.437969-4-oswald.buddenhagen@gmx.de>

Hi Oswald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.4-rc3 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/ALSA-emu10k1-hide-absent-2nd-pointer-offset-register-set-from-proc/20230526-182102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230526101659.437969-4-oswald.buddenhagen%40gmx.de
patch subject: [PATCH 3/6] ALSA: emu10k1: actually disassemble DSP instructions in /proc
config: x86_64-randconfig-a014-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280731.yycJIsaL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/13e0e28f29ed98ae73420158c2a879c4e32c694a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oswald-Buddenhagen/ALSA-emu10k1-hide-absent-2nd-pointer-offset-register-set-from-proc/20230526-182102
        git checkout 13e0e28f29ed98ae73420158c2a879c4e32c694a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/pci/emu10k1/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280731.yycJIsaL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/emu10k1/emuproc.c:417:41: warning: adding 'int' to a string does not append to the string [-Wstring-plus-int]
                               "                              " + 30 - clamp(65 - len, 0, 30),
                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   sound/pci/emu10k1/emuproc.c:417:41: note: use array indexing to silence this warning
                               "                              " + 30 - clamp(65 - len, 0, 30),
                                                                ^
                               &                                [
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^
   1 warning generated.


vim +/int +417 sound/pci/emu10k1/emuproc.c

   380	
   381	static void snd_emu10k1_proc_acode_read(struct snd_info_entry *entry,
   382					        struct snd_info_buffer *buffer)
   383	{
   384		u32 pc;
   385		struct snd_emu10k1 *emu = entry->private_data;
   386		static const char * const insns[16] = {
   387			"MAC0", "MAC1", "MAC2", "MAC3", "MACINT0", "MACINT1", "ACC3", "MACMV",
   388			"ANDXOR", "TSTNEG", "LIMITGE", "LIMITLT", "LOG", "EXP", "INTERP", "SKIP",
   389		};
   390	
   391		snd_iprintf(buffer, "FX8010 Instruction List '%s'\n", emu->fx8010.name);
   392		snd_iprintf(buffer, "  Code dump      :\n");
   393		for (pc = 0; pc < (emu->audigy ? 1024 : 512); pc++) {
   394			u32 low, high;
   395			int len;
   396			char buf[100];
   397			char *bufp = buf;
   398				
   399			low = snd_emu10k1_efx_read(emu, pc * 2);
   400			high = snd_emu10k1_efx_read(emu, pc * 2 + 1);
   401			if (emu->audigy) {
   402				bufp += sprintf(bufp, "    %-7s  ", insns[(high >> 24) & 0x0f]);
   403				bufp += disasm_audigy_reg(bufp, (high >> 12) & 0x7ff, "");
   404				bufp += disasm_audigy_reg(bufp, (high >> 0) & 0x7ff, ", ");
   405				bufp += disasm_audigy_reg(bufp, (low >> 12) & 0x7ff, ", ");
   406				bufp += disasm_audigy_reg(bufp, (low >> 0) & 0x7ff, ", ");
   407			} else {
   408				bufp += sprintf(bufp, "    %-7s  ", insns[(high >> 20) & 0x0f]);
   409				bufp += disasm_sblive_reg(bufp, (high >> 10) & 0x3ff, "");
   410				bufp += disasm_sblive_reg(bufp, (high >> 0) & 0x3ff, ", ");
   411				bufp += disasm_sblive_reg(bufp, (low >> 10) & 0x3ff, ", ");
   412				bufp += disasm_sblive_reg(bufp, (low >> 0) & 0x3ff, ", ");
   413			}
   414			len = (int)(ptrdiff_t)(bufp - buf);
   415			snd_iprintf(buffer, "%s %s /* 0x%04x: 0x%08x%08x */\n",
   416				    buf,
 > 417				    "                              " + 30 - clamp(65 - len, 0, 30),
   418				    pc, high, low);
   419		}
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
