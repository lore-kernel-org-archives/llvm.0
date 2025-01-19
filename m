Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EBF1DFD8;
	Sun, 19 Jan 2025 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737289420; cv=none; b=aaboikV/K/fAR2SMM9rPlhIGH9DoQjMdokkr1j6U8A1ply5OcdlKsPSfV58HR9qNnfRFOqw33m82TcRnI2i/3cV5jwDzZdiVtmTSGbqUKb9VRX1PgRRYRfjrbxyQy/+ucbpWGcvSM+V1ZEGz+Rnlbyv2apofo6ORcJ4EG7GiKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737289420; c=relaxed/simple;
	bh=G7qkiKdY7o4/+y78NwZfqHgg2iTIPpjRjpuZkvRUnB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwFCY0px3yLMgxKNC4PU3kEakgxajo47DONAS2q1hKezD7TmWoO0Jlcofs8RM541fPcDPUfUVuwevPdRbojNWzAS8orB/Or9RyiNo5VSjylqt5GWUj0akaU15JH+J4ueFNwGmsmv962cHM6Foqtp4pDwJh5AKQvnHqsoLorfknw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAp12a5u; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAp12a5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737289418; x=1768825418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7qkiKdY7o4/+y78NwZfqHgg2iTIPpjRjpuZkvRUnB4=;
  b=gAp12a5uy4aYN/F0tkAWvFFGdTdfPjaBRS7cYR5F5rGKsGTvGVENyhfm
   nRLvCeYYE8cQyifkF859PEAygzAlwpyjdr90hUyxdV5x1jLgUME8sztDF
   /RvFighXc8dWAPyVuYbSxziJATd2e0hbWCzrZNuhytEwuZqZ19TWiMjur
   D4XdeVqaoiHfxfKHxtD/CtKnIhHUdwMzemRDtLYFvmGIxfY8RX4J6lXg2
   3ffpkiiw/bS1TKt/Tl6CPnxFhEc9SslDOfqcdbK5wFmDIZc7AFleAUo6s
   ZmPnIlzq3rutQxEk/bGUdXrf6td5gkvvvvSXBl9K1Z5BEVjI4BErgrs0v
   Q==;
X-CSE-ConnectionGUID: eiUGcbRsSByji56LXN/AqQ==
X-CSE-MsgGUID: Ud66KQB3TzGHelhHM0/kZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37815504"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="37815504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 04:23:38 -0800
X-CSE-ConnectionGUID: /9M6EfexQy+xQh6QxQgIpw==
X-CSE-MsgGUID: IR00JcY6Sz6HGYS1xFX+Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110847759"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2025 04:23:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZUL0-000VQs-1R;
	Sun, 19 Jan 2025 12:23:34 +0000
Date: Sun, 19 Jan 2025 20:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 49/52] sound/pci/hda/tas2781_hda_spi.c:110:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202501192006.Hm9GmKiV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   dd85bbb7fc482b5cdb78f8b5e8f9ef7a3919d6ef
commit: bb5f86ea50ffb292f42eb1ebdb99991d5c5ac3ba [49/52] ALSA: hda/tas2781: Add tas2781 hda SPI driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250119/202501192006.Hm9GmKiV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501192006.Hm9GmKiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501192006.Hm9GmKiV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/tas2781_hda_spi.c:110:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     110 |         if (tas_priv->cur_book != TASDEVICE_BOOK_ID(reg)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/tas2781_hda_spi.c:119:9: note: uninitialized use occurs here
     119 |         return ret;
         |                ^~~
   sound/pci/hda/tas2781_hda_spi.c:110:2: note: remove the 'if' if its condition is always true
     110 |         if (tas_priv->cur_book != TASDEVICE_BOOK_ID(reg)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/tas2781_hda_spi.c:108:9: note: initialize the variable 'ret' to silence this warning
     108 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +110 sound/pci/hda/tas2781_hda_spi.c

   104	
   105	static int tasdevice_spi_switch_book(struct tasdevice_priv *tas_priv, int reg)
   106	{
   107		struct regmap *map = tas_priv->regmap;
   108		int ret;
   109	
 > 110		if (tas_priv->cur_book != TASDEVICE_BOOK_ID(reg)) {
   111			ret = regmap_write(map, TASDEVICE_BOOKCTL_REG,
   112					   TASDEVICE_BOOK_ID(reg));
   113			if (ret < 0) {
   114				dev_err(tas_priv->dev, "Switch Book E=%d\n", ret);
   115				return ret;
   116			}
   117			tas_priv->cur_book = TASDEVICE_BOOK_ID(reg);
   118		}
   119		return ret;
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
