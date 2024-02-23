Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072E1170A;
	Fri, 23 Feb 2024 04:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708663678; cv=none; b=o9uh1UK8R1aWAM6TyOkWgWX4P7/V9gDUnpwg8N3wuFi4mI9NzfL1I8JNYHIVEFedlC1nxtWScx47qNhW6AiBriXYdLxbVCU1w39UtNCBlbIsSTR9kUgU072IBdECDXOcv2HnrAm/cc8fdhgK17PgmTzxKPpK8TwxoVLkvNFUCu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708663678; c=relaxed/simple;
	bh=+haZ0qgmxCz0nbmY7lAIgz86Y4wP+pnN78uBr4Lkrwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AyAHN1uwKNlNlCdDcKg6BbNQckk1wDUi5MqumKJyHzvZIW1eTuEymLdeIAieRQYvtX2D3KxvOEPvN6hP9j6YjsJFQAiTxe2T544VhzLdzITgMSq7BGwfRssU8OEpBgFkhMcGhFreBml6eWlUbj/UadgqN41WLMq/n5o2Al0FFMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7Qqq1po; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7Qqq1po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708663672; x=1740199672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+haZ0qgmxCz0nbmY7lAIgz86Y4wP+pnN78uBr4Lkrwg=;
  b=P7Qqq1pohA/3aehFD+dObERvqIJQXcLTwNL61RJC7JRj3tdSGittVlnK
   0CfFH8o+29e43jVR95S1/LbNCjFSfPlnYP5PZIeadT7QwKXdZow/FkJki
   KQXH28atWUAvyDekY0HDem6atyAKCAtMbk14SyMbwdjhbf7i3Ec7g9UAx
   nb66LNFPSxXmHjoCPFcQI7diUJOfYiyrFxcfpH1wBgyeUBBSWIuy3SKDx
   C7Dhj2sRq2gCGHrqLA0CMyOJJW9QaCWOhf9DTLGp4XiVAGoAFa4aJY/48
   2gi+d2DtBNiJwRFLqrqvrRitwekiFNh51vWxSWtk8ymTP+aqUkxbDOqp1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20402494"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20402494"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 20:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10548713"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2024 20:47:50 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdNTM-000752-2v;
	Fri, 23 Feb 2024 04:47:45 +0000
Date: Fri, 23 Feb 2024 12:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/guard 44/62] sound/core/oss/mixer_oss.c:819:3:
 error: cannot jump from this goto statement to its label
Message-ID: <202402231259.Tx6bs1or-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/guard
head:   e4545d528ae658c35d02593567613c06f1386ffa
commit: b398454ce784b8a931d9fe80a0c1fb9dec644d29 [44/62] ALSA: mixer_oss: Use guard() for locking
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240223/202402231259.Tx6bs1or-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231259.Tx6bs1or-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231259.Tx6bs1or-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/oss/mixer_oss.c:819:3: error: cannot jump from this goto statement to its label
     819 |                 goto error;
         |                 ^
   sound/core/oss/mixer_oss.c:821:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     821 |         guard(rwsem_read)(&card->controls_rwsem);
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:36:1: note: expanded from here
      36 | __UNIQUE_ID_guard239
         | ^
   sound/core/oss/mixer_oss.c:870:3: error: cannot jump from this goto statement to its label
     870 |                 goto error;
         |                 ^
   sound/core/oss/mixer_oss.c:872:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     872 |         guard(rwsem_read)(&card->controls_rwsem);
         |         ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:180:29: note: expanded from macro '__UNIQUE_ID'
     180 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:45:1: note: expanded from here
      45 | __UNIQUE_ID_guard240
         | ^
   2 errors generated.


vim +819 sound/core/oss/mixer_oss.c

   803	
   804	static int snd_mixer_oss_get_recsrc2(struct snd_mixer_oss_file *fmixer, unsigned int *active_index)
   805	{
   806		struct snd_card *card = fmixer->card;
   807		struct snd_mixer_oss *mixer = fmixer->mixer;
   808		struct snd_kcontrol *kctl;
   809		struct snd_mixer_oss_slot *pslot;
   810		struct slot *slot;
   811		struct snd_ctl_elem_info *uinfo;
   812		struct snd_ctl_elem_value *uctl;
   813		int err, idx;
   814		
   815		uinfo = kzalloc(sizeof(*uinfo), GFP_KERNEL);
   816		uctl = kzalloc(sizeof(*uctl), GFP_KERNEL);
   817		if (uinfo == NULL || uctl == NULL) {
   818			err = -ENOMEM;
 > 819			goto error;
   820		}
   821		guard(rwsem_read)(&card->controls_rwsem);
   822		kctl = snd_mixer_oss_test_id(mixer, "Capture Source", 0);
   823		if (! kctl) {
   824			err = -ENOENT;
   825			goto error;
   826		}
   827		err = kctl->info(kctl, uinfo);
   828		if (err < 0)
   829			goto error;
   830		err = kctl->get(kctl, uctl);
   831		if (err < 0)
   832			goto error;
   833		for (idx = 0; idx < 32; idx++) {
   834			if (!(mixer->mask_recsrc & (1 << idx)))
   835				continue;
   836			pslot = &mixer->slots[idx];
   837			slot = pslot->private_data;
   838			if (slot->signature != SNDRV_MIXER_OSS_SIGNATURE)
   839				continue;
   840			if (!(slot->present & SNDRV_MIXER_OSS_PRESENT_CAPTURE))
   841				continue;
   842			if (slot->capture_item == uctl->value.enumerated.item[0]) {
   843				*active_index = idx;
   844				break;
   845			}
   846		}
   847		err = 0;
   848	error:
   849	      	kfree(uctl);
   850	      	kfree(uinfo);
   851	      	return err;
   852	}
   853	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
