Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9C18023;
	Sun, 19 Nov 2023 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZBKTuBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700412788; x=1731948788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p3b3ojHSKVPRsSz9+dheb2cBmZx4YrU8T+RychSoxN8=;
  b=QZBKTuBgqN/jQMGWyrecAukITfjtxA4MmpDYhBleSXCGzS04/Fzg89Q/
   1js9PMpYkHMLA2RARXJsMIl8+2lJkbY9Z1GyHHzjbeCsMKhvsyOTa9MsZ
   AyyQv1fY3/bCu90HID8/MM/tAPxUqteygIhXYMPPjPOn9gVxGwapHkovH
   UbMLkm7cdqd1NpXksMLAKFOlMhj2gzlwie/8BLTYVdjHaZbsvVD/bWyYE
   L67PpN0GJEhqzWOKIQQfq2sLddKv94RVZM4iMKwYSP7SPZi/wB5N5Du/H
   FaqE+VyMHRNdhi/GTLzX+0i9eZUMDKnU5SD8wsHoI0YxTBaA/plc49yi+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="422603289"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="422603289"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 08:53:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="909885788"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="909885788"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2023 08:53:06 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4l2e-0005KR-1g;
	Sun, 19 Nov 2023 16:53:04 +0000
Date: Mon, 20 Nov 2023 00:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/070-audio 71/100]
 sound/soc/apple/macaudio.c:1386:5: warning: no previous prototype for
 function 'macaudio_slk_get'
Message-ID: <202311200029.mAI9eX6s-lkp@intel.com>
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
commit: ba781f688d2d45d603340b2515236cd40fb0b41c [71/100] macaudio: Add a getter for the interlock
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231120/202311200029.mAI9eX6s-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200029.mAI9eX6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200029.mAI9eX6s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/apple/macaudio.c:198:6: warning: no previous prototype for function 'macaudio_vlimit_unlock' [-Wmissing-prototypes]
   void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
        ^
   sound/soc/apple/macaudio.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool unlock)
   ^
   static 
   sound/soc/apple/macaudio.c:220:6: warning: no previous prototype for function 'macaudio_vlimit_update' [-Wmissing-prototypes]
   void macaudio_vlimit_update(struct macaudio_snd_data *ma)
        ^
   sound/soc/apple/macaudio.c:220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void macaudio_vlimit_update(struct macaudio_snd_data *ma)
   ^
   static 
   sound/soc/apple/macaudio.c:1319:5: warning: no previous prototype for function 'macaudio_sss_info' [-Wmissing-prototypes]
   int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
       ^
   sound/soc/apple/macaudio.c:1319:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_sss_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
   ^
   static 
   sound/soc/apple/macaudio.c:1329:5: warning: no previous prototype for function 'macaudio_sss_get' [-Wmissing-prototypes]
   int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
       ^
   sound/soc/apple/macaudio.c:1329:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_sss_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
   ^
   static 
   sound/soc/apple/macaudio.c:1344:5: warning: no previous prototype for function 'macaudio_slk_info' [-Wmissing-prototypes]
   int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
       ^
   sound/soc/apple/macaudio.c:1344:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_slk_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
   ^
   static 
   sound/soc/apple/macaudio.c:1354:5: warning: no previous prototype for function 'macaudio_slk_put' [-Wmissing-prototypes]
   int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
       ^
   sound/soc/apple/macaudio.c:1354:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
   ^
   static 
>> sound/soc/apple/macaudio.c:1386:5: warning: no previous prototype for function 'macaudio_slk_get' [-Wmissing-prototypes]
   int macaudio_slk_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
       ^
   sound/soc/apple/macaudio.c:1386:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_slk_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
   ^
   static 
   sound/soc/apple/macaudio.c:1396:5: warning: no previous prototype for function 'macaudio_slk_lock' [-Wmissing-prototypes]
   int macaudio_slk_lock(struct snd_kcontrol *kcontrol, struct snd_ctl_file *owner)
       ^
   sound/soc/apple/macaudio.c:1396:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int macaudio_slk_lock(struct snd_kcontrol *kcontrol, struct snd_ctl_file *owner)
   ^
   static 
   sound/soc/apple/macaudio.c:1415:6: warning: no previous prototype for function 'macaudio_slk_unlock' [-Wmissing-prototypes]
   void macaudio_slk_unlock(struct snd_kcontrol *kcontrol)
        ^
   sound/soc/apple/macaudio.c:1415:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void macaudio_slk_unlock(struct snd_kcontrol *kcontrol)
   ^
   static 
   9 warnings generated.


vim +/macaudio_slk_get +1386 sound/soc/apple/macaudio.c

  1353	
> 1354	int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1355	{
  1356		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1357		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1358	
  1359		if (!ma->speaker_lock_owner)
  1360			return -EPERM;
  1361	
  1362		if (uvalue->value.integer.value[0] != SPEAKER_MAGIC_VALUE)
  1363			return -EINVAL;
  1364	
  1365		/* Serves as a notification that the lock was lost at some point */
  1366		if (ma->speaker_volume_was_locked) {
  1367			ma->speaker_volume_was_locked = false;
  1368			return -ETIMEDOUT;
  1369		}
  1370	
  1371		cancel_delayed_work(&ma->lock_timeout_work);
  1372	
  1373		ma->speaker_lock_remain = ms_to_ktime(SPEAKER_LOCK_TIMEOUT);
  1374		ma->speaker_lock_timeout = ktime_add(ktime_get(), ma->speaker_lock_remain);
  1375		macaudio_vlimit_update(ma);
  1376	
  1377		if (ma->speaker_lock_timeout_enabled) {
  1378			dev_dbg(ma->card.dev, "Volume limit timeout ping: %ld us left\n",
  1379				(long)ktime_to_us(ma->speaker_lock_remain));
  1380			schedule_delayed_work(&ma->lock_timeout_work, usecs_to_jiffies(ktime_to_us(ma->speaker_lock_remain)));
  1381		}
  1382	
  1383		return 0;
  1384	}
  1385	
> 1386	int macaudio_slk_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *uvalue)
  1387	{
  1388		struct snd_soc_card *card = snd_kcontrol_chip(kcontrol);
  1389		struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(card);
  1390	
  1391		uvalue->value.integer.value[0] = ma->speaker_volume_unlocked ? 1 : 0;
  1392	
  1393		return 0;
  1394	}
  1395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
