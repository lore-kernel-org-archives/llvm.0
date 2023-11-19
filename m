Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877D210A13;
	Sun, 19 Nov 2023 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9TIrUEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700408774; x=1731944774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=302Aflj3ws0Hxs0S8EhbF+tblRc/7wupiTjgvvQ0sxo=;
  b=D9TIrUEMD07J81Ao/nk+sij1SN+zy4OHp8BwoxrtDnX1BkC4mBqtfMMH
   JKlv0oHhUVvO9ZiFnjuHkdU9Ykj/l5lJ4pps+/IVx1Pfo+vwqIqHvDcJq
   b+WKX7fTaxMfNBslZyJ09us1g0j7CnEVyJ+45oROHEPJsKHlI5wZ9yfPO
   jWrfJHyF7NpsrcHpijqvI2QdDwXk7k9GTGeZ0z9wPFNkzvFFiGkUCpsml
   Eo4GciEUTm6jHYz/sNKYz7+lECm28mFqLyutg20eUjCCN3JuXSEhOha4L
   uRcSAMEdt3kgQ5iXOoiejBMwQbCsLMRkbc6keNshtZpidCpYUuqOeOj64
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="10168465"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="10168465"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 07:46:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="800924797"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="800924797"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Nov 2023 07:46:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4jzt-0005FD-09;
	Sun, 19 Nov 2023 15:46:09 +0000
Date: Sun, 19 Nov 2023 23:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/070-audio 69/100] sound/soc/apple/macaudio.c:198:6:
 warning: no previous prototype for function 'macaudio_vlimit_unlock'
Message-ID: <202311192331.yeJphl26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   1c71b1fa2c491cc29c94d29f1a450dba39f27557
commit: 4a448b9f1c264f3e73a32e569b519d3b0054ad30 [69/100] macaudio: speaker volume safety interlocks
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231119/202311192331.yeJphl26-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311192331.yeJphl26-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311192331.yeJphl26-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/apple/macaudio.c:198:6: warning: no previous prototype for function 'macaudio_vlimit_unlock' [-Wmissing-prototypes]
   void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
        ^
   sound/soc/apple/macaudio.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
   ^
   static 
>> sound/soc/apple/macaudio.c:220:6: warning: no previous prototype for function 'macaudio_vlimit_update' [-Wmissing-prototypes]
   void macaudio_vlimit_update(struct macaudio_snd_data *ma)
        ^
   sound/soc/apple/macaudio.c:220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void macaudio_vlimit_update(struct macaudio_snd_data *ma)
   ^
   static 
   sound/soc/apple/macaudio.c:1317:5: warning: no previous prototype for function 'macaudio_sss_info' [-Wmissing-prototypes]
   int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
       ^
   sound/soc/apple/macaudio.c:1317:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
   ^
   static 
   sound/soc/apple/macaudio.c:1327:5: warning: no previous prototype for function 'macaudio_sss_get' [-Wmissing-prototypes]
   int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
       ^
   sound/soc/apple/macaudio.c:1327:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
   ^
   static 
>> sound/soc/apple/macaudio.c:1342:5: warning: no previous prototype for function 'macaudio_slk_info' [-Wmissing-prototypes]
   int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
       ^
   sound/soc/apple/macaudio.c:1342:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
   ^
   static 
>> sound/soc/apple/macaudio.c:1352:5: warning: no previous prototype for function 'macaudio_slk_put' [-Wmissing-prototypes]
   int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
       ^
   sound/soc/apple/macaudio.c:1352:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
   ^
   static 
>> sound/soc/apple/macaudio.c:1384:5: warning: no previous prototype for function 'macaudio_slk_lock' [-Wmissing-prototypes]
   int macaudio_slk_lock(struct snd_kcontrol *kcontrol, struct snd_ctl_file *owner)
       ^
   sound/soc/apple/macaudio.c:1384:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_slk_lock(struct snd_kcontrol *kcontrol, struct snd_ctl_file *owner)
   ^
   static 
>> sound/soc/apple/macaudio.c:1403:6: warning: no previous prototype for function 'macaudio_slk_unlock' [-Wmissing-prototypes]
   void macaudio_slk_unlock(struct snd_kcontrol *kcontrol)
        ^
   sound/soc/apple/macaudio.c:1403:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void macaudio_slk_unlock(struct snd_kcontrol *kcontrol)
   ^
   static 
   8 warnings generated.


vim +/macaudio_vlimit_unlock +198 sound/soc/apple/macaudio.c

   197	
 > 198	void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
   199	{
   200		int i, ret, max;
   201	
   202		for (i = 0; i < ARRAY_SIZE(ma->cfg->limits); i++) {
   203			const struct macaudio_limit_cfg *limit = &ma->cfg->limits[i];
   204	
   205			if (!limit->match)
   206				break;
   207	
   208			if (unlock)
   209				max = limit->max_unlimited;
   210			else
   211				max = limit->max_limited;
   212	
   213			ret = snd_soc_limit_volume(&ma->card, limit->match, max);
   214			if (ret < 0)
   215				dev_err(ma->card.dev, "Failed to %slock volume %s: %d\n",
   216					unlock ? "un" : "", limit->match, ret);
   217		}
   218	}
   219	
 > 220	void macaudio_vlimit_update(struct macaudio_snd_data *ma)
   221	{
   222		int i;
   223		bool unlock = true;
   224		struct snd_kcontrol *kctl;
   225		const char *reason;
   226	
   227		/* Do nothing if there are no limits configured */
   228		if (!ma->cfg->limits[0].match)
   229			return;
   230	
   231		/* Check that someone is holding the main lock */
   232		if (!ma->speaker_lock_owner) {
   233			reason = "Main control not locked";
   234			unlock = false;
   235		}
   236	
   237		/* Check that the control has been pinged within the timeout */
   238		if (ma->speaker_lock_remain <= 0) {
   239			reason = "Lock timeout";
   240			unlock = false;
   241		}
   242	
   243		/* Check that *every* limited control is locked by the same owner */
   244		list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
   245			bool is_limit = false;
   246	
   247			for (i = 0; i < ARRAY_SIZE(ma->cfg->limits); i++) {
   248				const struct macaudio_limit_cfg *limit = &ma->cfg->limits[i];
   249				if (!limit->match)
   250					break;
   251	
   252				is_limit = snd_soc_control_matches(kctl, limit->match);
   253				if (is_limit)
   254					break;
   255			}
   256	
   257			if (!is_limit)
   258				continue;
   259	
   260			for (i = 0; i < kctl->count; i++) {
   261				if (kctl->vd[i].owner != ma->speaker_lock_owner) {
   262					reason = "Not all child controls locked by the same process";
   263					unlock = false;
   264				}
   265			}
   266		}
   267	
   268	
   269		if (unlock != ma->speaker_volume_unlocked) {
   270			if (unlock) {
   271				dev_info(ma->card.dev, "Speaker volumes unlocked\n");
   272			} else  {
   273				dev_info(ma->card.dev, "Speaker volumes locked: %s\n", reason);
   274				ma->speaker_volume_was_locked = true;
   275			}
   276	
   277			macaudio_vlimit_unlock(ma, unlock);
   278			ma->speaker_volume_unlocked = unlock;
   279		}
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
