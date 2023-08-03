Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3D24161;
	Thu,  3 Aug 2023 18:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691086739; x=1722622739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9wCQl0gmuPYKvp9R7qZDyiOeRhl42k2yWVChyovhow=;
  b=PP1xm7KyoOzF1plVFujIyBKk8hc6U716OQXK4J6iycY054azqKk6CDQC
   2EY8Ky++8KOZvWA5FASLC9osOvnErSGS/hRyhjWIrqBqw/arJGK5cgs13
   +0Z14vXpd5FvZMVtkMrx+9G8c7NzPdD7gckPkiKXZen9XMFmClktBcgXN
   FFLDeEF6kEVC31vm5Jkw868S02HLOrNarm3iWe2HYP4P4Ec9x7j4I1oxf
   tvZOK+HP2yfP2sBkbWohGo8Du32DSXVkfLb/L4WcePX2c2hJvjMuxKtgu
   lHLF155Rj7dexqloj91QxCRoWZf2RYwbd5z2WL+xxnNi5PLBHWdB8N8wu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349552879"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="349552879"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 11:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="819783024"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="819783024"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 11:18:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRcuK-0002H9-1B;
	Thu, 03 Aug 2023 18:18:44 +0000
Date: Fri, 4 Aug 2023 02:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 8/37] sound/soc/soc-ops.c:817:5: warning:
 stack frame size (1040) exceeds limit (1024) in 'snd_soc_set_enum_kctl'
Message-ID: <202308040255.7E1u4mhz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   fd19415d77a7612b4edbe780d58328ec41019816
commit: eaf57e3237ce9c2addccb003bdc2131b889b46e0 [8/37] ASoC: ops: Introduce 'soc_set_enum_kctl'
config: arm-randconfig-r004-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040255.7E1u4mhz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040255.7E1u4mhz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040255.7E1u4mhz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-ops.c:817:5: warning: stack frame size (1040) exceeds limit (1024) in 'snd_soc_set_enum_kctl' [-Wframe-larger-than]
   int snd_soc_set_enum_kctl(struct snd_soc_card *card,
       ^
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
https://github.com/intel/lkp-tests/wiki
