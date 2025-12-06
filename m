Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B3329E109;
	Sat,  6 Dec 2025 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765004812; cv=none; b=aT7L3okF340hK8E05fM04VqjNB8MksU64nIna3iymtImJePmiNTRefvsHX2/R3vnDVy9e6KrKBcbTqys652a+Gr4pAViOSGJ9FPaOIO3ki+mI2DXZ3/zvwm2Yes9cjumPhDoki5Dd0Mxz4+puq/7uSG7C0OQZbNv/W2gAhvjJVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765004812; c=relaxed/simple;
	bh=qHY+vk3NBaOCbPiwQwRa+ag/wBHhZ9MJQtcoM8vBxHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e70V9uq/XZga4tj+quiCtzQJLm2eTyQHVua5W4rNWRq22G2T6WsWC71Apvl5oHPLxE+lx2XDeMLO2E6O2atbvTwpKrQjFX5jclqrvWMgulglpqiJC30dmmpsKMb2++isClSIMdqSXto8ez8q4pIVjztab+WcaEtmwD8jM2C8ujQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaLqh8Og; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaLqh8Og"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765004809; x=1796540809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qHY+vk3NBaOCbPiwQwRa+ag/wBHhZ9MJQtcoM8vBxHw=;
  b=RaLqh8Og9+8dKsMEiDK3SWHOSwq7YbDnseEBEFv9nqBT6MR1NxOHR5Ib
   JUDhbkEdXurLpUsOldXeTEEPtxnse+z/4flfweMhwMVgts2dTKHdMNg2S
   jUroaj7P5TJ8LL5ubeJprrs2GaA5XIIImjMF+Z58tBfdfsE4K4CTfPoIf
   7nc/NkutXuh65cQIrkrcuo8XT4YjWUZ27pymG+kfvFNLGjAP/uIIZNkya
   5Fqh6VlWyJlGZOLe4oHTONYncQnoXwXOoFBfEPYJihsQ9KvcCLWhxkHM7
   o/Asy5fCJ3xjoisj19Jz0DHLuO+Q/Faa5T1PyObuVV48iqk0qNMxL6dnA
   w==;
X-CSE-ConnectionGUID: SE4t6usKQ+uXEYoKiwNKAg==
X-CSE-MsgGUID: wSkD8olzReac5k4YtxwQMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="54576344"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="54576344"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 23:06:49 -0800
X-CSE-ConnectionGUID: TXM/KF8TSZisbBARk9riZQ==
X-CSE-MsgGUID: +1FxJh1rSROt+BR77o+J/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="199961259"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2025 23:06:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRmNQ-00000000Fxx-2Jsv;
	Sat, 06 Dec 2025 07:06:44 +0000
Date: Sat, 6 Dec 2025 15:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Li Li <dualli@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Carlos Llamas <cmllamas@google.com>
Subject: unifdef: usr/include/linux/android/binder_netlink.h.tmp: 9:
 unterminated string literal (#if line 6 depth 1)
Message-ID: <202512061444.391KgU9b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   416f99c3b16f582a3fc6d64a1f77f39d94b76de5
commit: 63740349eba78f242bcbf60d5244d7f2b2600853 binder: introduce transaction reports via netlink
date:   4 months ago
config: powerpc-randconfig-002-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061444.391KgU9b-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6d8714b52375b3b7a7f269cd1ec4cc73baece38b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061444.391KgU9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061444.391KgU9b-lkp@intel.com/

All errors (new ones prefixed by >>):

   unifdef: usr/include/linux/auto_dev-ioctl.h.tmp: 17: unterminated string literal (#if line 11 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/auto_dev-ioctl.h] Error 1 shuffle=4234057307
   unifdef: usr/include/drm/vmwgfx_drm.h.tmp: 32: unterminated string literal (#if line 29 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/vmwgfx_drm.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/media/raspberrypi/pisp_be_config.h.tmp: 13: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/media/raspberrypi/pisp_be_config.h] Error 1 shuffle=4234057307
>> unifdef: usr/include/linux/android/binder_netlink.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/android/binder_netlink.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/gtp.h.tmp: 5: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/gtp.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/xattr.h.tmp: 33: unterminated string literal (#if line 16 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/xattr.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/btrfs.h.tmp: 24: unterminated string literal (#if line 23 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/btrfs.h] Error 1 shuffle=4234057307
   unifdef: usr/include/drm/drm_sarea.h.tmp: 35: unterminated string literal (#if line 32 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/sound/asound_fm.h.tmp: 107: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/drm_sarea.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/sound/asound_fm.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/quota.h.tmp: 38: unterminated string literal (#if line 33 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/quota.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/if_bridge.h.tmp: 21: unterminated string literal (#if line 14 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/soundcard.h.tmp: 198: unterminated string literal (#if line 193 depth 4)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_bridge.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/soundcard.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/netfilter_bridge/ebt_among.h.tmp: 63: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/videodev2.h.tmp: 2407: unterminated string literal (#if line 57 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_among.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/videodev2.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/seg6_genl.h.tmp: 5: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/seg6_genl.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/patchkey.h.tmp: 15: unterminated string literal (#if line 14 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/patchkey.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/netfilter_bridge/ebt_mark_t.h.tmp: 22: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/agpgart.h.tmp: 43: unterminated string literal (#if line 27 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/misc/uacce/hisi_qm.h.tmp: 31: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_mark_t.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/agpgart.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/misc/uacce/hisi_qm.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/mptcp.h.tmp: 26: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/mptcp.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/cyclades.h.tmp: 6: unterminated string literal (#if line 3 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cyclades.h] Error 1 shuffle=4234057307
   unifdef: usr/include/drm/tegra_drm.h.tmp: 7: unterminated string literal (#if line 4 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/tegra_drm.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/cdrom.h.tmp: 845: unterminated string literal (#if line 834 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cdrom.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/nfs.h.tmp: 36: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter/x_tables.h.tmp: 103: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nfs.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter/x_tables.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/vmcore.h.tmp: 7: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_vlan.h.tmp: 11: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/vmcore.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_vlan.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/comedi.h.tmp: 16: unterminated string literal (#if line 10 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/comedi.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/cifs/cifs_netlink.h.tmp: 12: unterminated string literal (#if line 9 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/ovpn.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/magic.h.tmp: 62: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cifs/cifs_netlink.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ovpn.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/magic.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/genwqe/genwqe_card.h.tmp: 34: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/genwqe/genwqe_card.h] Error 1 shuffle=4234057307
   unifdef: usr/include/drm/v3d_drm.h.tmp: 27: unterminated string literal (#if line 24 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/dccp.h.tmp: 32: unterminated string literal (#if line 25 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/v3d_drm.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/dccp.h] Error 1 shuffle=4234057307
   unifdef: usr/include/linux/wireguard.h.tmp: 138: unterminated string literal (#if line 135 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_ip.h.tmp: 31: unterminated string literal (#if line 16 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_arpreply.h.tmp: 11: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/wireguard.h] Error 1 shuffle=4234057307
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_ip.h] Error 1 shuffle=4234057307

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
