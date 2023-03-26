Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C336A;
	Sun, 26 Mar 2023 00:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679790386; x=1711326386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PjyW3M9gchViuMOkWKBiti9p0Vnkx+btmmxL03qkX8E=;
  b=BWzU58qOuNgr2SbpgvokHWmowt1Obi9TeBmD5eMqBKHr9FHYSAZfmX36
   0lp66oE0eYE0WGSRQ+8594KQjx2Dn4TioEc4dzPd5snwBRZIK53KPVRF5
   iimt2Om8LWHE3RhECxTABbkIZq1O/49UknIlWWSDw0nAqiEEV3RYA3DnU
   aXf+uNTLl+jrkP+KH+Im6dn0DAxryxPcfRyoN3lsVALwqembmDvoMXwIN
   RihcHSJgAgeLlECvoD4WIAbbpmjVgkv6dlmKP8DpBJ2RTujsNZsUgtgWR
   uMxkRH2G7GDRwZdRnRcZEU6I3ZSiWbvmTsGx/oXsMqISu+gduniz+PRsX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="338747827"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="338747827"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 17:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="747571641"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="747571641"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Mar 2023 17:26:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgEDH-000Gm7-3D;
	Sun, 26 Mar 2023 00:26:23 +0000
Date: Sun, 26 Mar 2023 08:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 8/39] sound/soc/soc-ops.c:817:5: warning:
 stack frame size (1072) exceeds limit (1024) in 'snd_soc_set_enum_kctl'
Message-ID: <202303260852.KupV2smW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   b4adc8d4b163c456483eded9c3b6b1082b8feb40
commit: e44f313d4ee5114ffdf399b048f8fcab0a177ba5 [8/39] ASoC: ops: Introduce 'soc_set_enum_kctl'
config: riscv-randconfig-r032-20230326 (https://download.01.org/0day-ci/archive/20230326/202303260852.KupV2smW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/e44f313d4ee5114ffdf399b048f8fcab0a177ba5
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout e44f313d4ee5114ffdf399b048f8fcab0a177ba5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303260852.KupV2smW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-ops.c:817:5: warning: stack frame size (1072) exceeds limit (1024) in 'snd_soc_set_enum_kctl' [-Wframe-larger-than]
   int snd_soc_set_enum_kctl(struct snd_soc_card *card,
       ^
   84/1072 (7.84%) spills, 988/1072 (92.16%) variables
   1 warning generated.


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
https://github.com/intel/lkp-tests
