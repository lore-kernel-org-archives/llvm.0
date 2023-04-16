Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B62723C4;
	Sun, 16 Apr 2023 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681659253; x=1713195253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjleyHKbuFASERo1ML/4CMKE4qwlrz1GsQGg0gRQq+c=;
  b=gvxDeX86FCDG4jzgNxlBI6mfV3O8z4hqSlsUn38Y7/0jPdkecpcaxYXu
   BKtINXeiRN05KmFMEot+YoY9Fgk0ZpRxd9iZkCwQbXHoBuZ/bvDFqSb7O
   ppXN5V3S/rUL8OQ/UxLgDqsNNkzybDEW8If4bMDj0DLWR4lYK3/WnuQGo
   flDzvx0HPA8tsLnQ8LNmlmFsLAohbrucUhU3rm9MduT3Ep6KWRePKwDuk
   ukibgUIuwGdmUMTzYUSRkVqoGjgn0EVh0EB0UWlYvuyUeI9il+59GblFU
   omd1cuU6Nmzv9NAWYCJpHu9JAlgs/WeDEc9dgtjYduO/hM8mjMbMs+oMY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="344739369"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="344739369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 08:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="723016835"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="723016835"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Apr 2023 08:34:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po4OI-000bjj-11;
	Sun, 16 Apr 2023 15:34:10 +0000
Date: Sun, 16 Apr 2023 23:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 8/40] sound/soc/soc-ops.c:817:5: warning:
 stack frame size (1072) exceeds limit (1024) in 'snd_soc_set_enum_kctl'
Message-ID: <202304162354.2DZAe7tk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   04466302f3a6cb36c4784f371777f254644bfff3
commit: f453a222c3ef6f741fb2ccf50274234207702c05 [8/40] ASoC: ops: Introduce 'soc_set_enum_kctl'
config: mips-randconfig-r013-20230416 (https://download.01.org/0day-ci/archive/20230416/202304162354.2DZAe7tk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/f453a222c3ef6f741fb2ccf50274234207702c05
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/070-audio
        git checkout f453a222c3ef6f741fb2ccf50274234207702c05
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304162354.2DZAe7tk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-ops.c:817:5: warning: stack frame size (1072) exceeds limit (1024) in 'snd_soc_set_enum_kctl' [-Wframe-larger-than]
   int snd_soc_set_enum_kctl(struct snd_soc_card *card,
       ^
   68/1072 (6.34%) spills, 1004/1072 (93.66%) variables
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
