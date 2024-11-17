Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244191D90C8;
	Sun, 17 Nov 2024 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731857988; cv=none; b=D4B8OEyoMTuaKwwfwTnWGSQ3zXTZ+KWJwyRI+0UMJjBMagwrijkLn0Nt/FUJGtqv84mEIkPeIOuXN/vKdvHrU4M1nPmKDeEnrQM4sYB1C1docYicPBONwkcQWJyI9Uj3juWiDzrUKEoyePzFhM5cDOZ2GzwOU0wNDDiTs6tzEjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731857988; c=relaxed/simple;
	bh=tPwf9yEXlJb7dNUwTZjFQyFwDEWbQSJ2X2Pp5H64usg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k12ZBl0fpvS51JOJWhW5ifzB4EmAzMVGY1kXIRWdfvd/GnDVv4k8jLPgtj+fLsv9H9+JRH9XUYzHjXOIk2SwnyyN1kFSoEkkrkeOEPKLU4ERbF+PCUCdghXwS83lPjAniE8Zo+69qq4NmlJsJ5Lt0mdWmwwsMazlW6y9DyRG7dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQzKkElt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQzKkElt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731857987; x=1763393987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tPwf9yEXlJb7dNUwTZjFQyFwDEWbQSJ2X2Pp5H64usg=;
  b=DQzKkElt3SP8o37s90IygeFQ+hGKwfoFWNHduuaTeOp5TWCfFoBf7JZy
   329hsUfUhOfeotPADYJHBQApW58fuFHRt4W2XVjDVLVIr3s4+J4w6nH59
   7kRboVVJ+u6cKlpV8myaaOAhRtUpV15FrCfLwRdTYuEVjurac45gg5lA/
   19gCBDZngeRu2PzsB3dh9RdHpehWpUoax9kCH76l8z2a4HfGe0VyCEU4f
   89qOPzjs1wz1rWsLuyf428Fz8OCz0c0M9KrJKLd/kdn/fBS280qTml4W/
   7H9tatZABM1t1pTodpCRi3Q+JaPoFZ/oUH+ftPscEKsM2WN3GtqveI4jU
   Q==;
X-CSE-ConnectionGUID: bdfFnVmYR1+K4hi81BpcfA==
X-CSE-MsgGUID: KlcGyRlbS0S9vj+jqIDaeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="34672994"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="34672994"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 07:39:46 -0800
X-CSE-ConnectionGUID: g4pJEps3RzayD75UlAqPfQ==
X-CSE-MsgGUID: ALT6p9poSwi1ACr7ikk0gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="93841306"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2024 07:39:45 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tChNH-0001pX-0M;
	Sun, 17 Nov 2024 15:39:43 +0000
Date: Sun, 17 Nov 2024 23:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?unknown-8bit?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 13/119] sound/soc/soc-ops.c:818:5:
 warning: stack frame size (1048) exceeds limit (1024) in
 'snd_soc_set_enum_kctl'
Message-ID: <202411172317.qgns9ocB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   3a76f715b4795098c50db9f139c961b292cb13a6
commit: 803c133cd9230b5594141c688e7b81d61b5886b7 [13/119] ASoC: ops: Introduce 'soc_set_enum_kctl'
config: arm-defconfig (https://download.01.org/0day-ci/archive/20241117/202411172317.qgns9ocB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172317.qgns9ocB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411172317.qgns9ocB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-ops.c:818:5: warning: stack frame size (1048) exceeds limit (1024) in 'snd_soc_set_enum_kctl' [-Wframe-larger-than]
   int snd_soc_set_enum_kctl(struct snd_soc_card *card,
       ^
   1 warning generated.


vim +/snd_soc_set_enum_kctl +818 sound/soc/soc-ops.c

   807	
   808	/**
   809	 * snd_soc_set_enum_kctl - Set enumerated controls matching a pattern
   810	 *
   811	 * @card: where to look for the controls
   812	 * @name: name pattern
   813	 * @value: string value to set the controls to
   814	 *
   815	 * Return number of matching and set controls on success, else error.
   816	 * No controls need to match.
   817	 */
 > 818	int snd_soc_set_enum_kctl(struct snd_soc_card *card,
   819		const char *name, const char *value)
   820	{
   821		struct snd_kcontrol *kctl;
   822		int hits = 0;
   823		int ret;
   824	
   825		/* Sanity check for name */
   826		if (unlikely(!name))
   827			return -EINVAL;
   828	
   829		list_for_each_entry(kctl, &card->snd_card->controls, list) {
   830			if (!soc_control_matches(kctl, name))
   831				continue;
   832	
   833			ret = soc_set_enum_kctl(kctl, value);
   834			if (ret < 0)
   835				return ret;
   836			hits++;
   837		}
   838	
   839		if (!hits)
   840			return -EINVAL;
   841	
   842		return hits;
   843	}
   844	EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
   845	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
