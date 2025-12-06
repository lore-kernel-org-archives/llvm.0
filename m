Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDF71FF7C7;
	Sat,  6 Dec 2025 06:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765003489; cv=none; b=d/C4swa72tvL5Zu2JR+FoPCkosbImwGduPCiIZWF9X5Ndqo5QNj4Sd2okqvXxM8ZNx/h/giw3mXcZdNQFQww+Ma0jB55jfEtqV49wtfUlm9pF1HYkdo1yNOflf+D5U5rtqv00oA8y21Qsp+uarijyT0DvLEZvMjYvJqhX8N1lj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765003489; c=relaxed/simple;
	bh=swLj7EkEY7cR9qhhqOy/W6N8NiQmnTSlrUReGNSx9QM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j0pNa92ryCZN9OTH6WJjWu3zBu/NFkIYzMqNDa9Ut85Sspi/ZzeYeUJwUBy/BazbXhcVNIxKLn4K7lPTyb06LPL19QqUu70S4MDYblrUZ83Hp0z7S4u81qOUDYaqEg838GNgI4JBrFJbf9mgRSOPVBFH0bBo7jLwToY+Oh1rk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN4BXCJI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN4BXCJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765003487; x=1796539487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=swLj7EkEY7cR9qhhqOy/W6N8NiQmnTSlrUReGNSx9QM=;
  b=QN4BXCJIgvRorsP4VgDYfDuGKdi1WHZk/CS6aeuPCZk5KGu5MmOzO2YF
   WhO05eqvRFZgQft7n5YzLaOs2ocbgJNJdpK9vP9qYzuqktLiMvSEp/XOF
   x+SweKaKVeivCmP7OAmYMnGvJklRQsCzWUjC7crxEkO2F+yQYkzXNrarl
   BDh+RS4cQgQTtTAn1tIjXU9LVvlRLB+4iVR8OMC0omYubEyHM2FW8ODjW
   rQNBZWIoBjsFOHtYrwUoBjoUSifNptUYFV/XTLUqbC5IWbnYUcEde8CeE
   kFUigN0+HdiNXdsN2nnKGLDtz3yp829t2K9U1QMNpoNSTkXvk3syMtBl3
   g==;
X-CSE-ConnectionGUID: U6U5o0t0TCaBhW+pGqoNXg==
X-CSE-MsgGUID: SNJvCUFwQy2wekLYHO79cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78498642"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78498642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 22:44:45 -0800
X-CSE-ConnectionGUID: /TmWuIdrQnuW07XfkY2I4A==
X-CSE-MsgGUID: o91GMF49S0aI4VIDzaWglw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195108322"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Dec 2025 22:44:43 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRm24-00000000Fwj-31fb;
	Sat, 06 Dec 2025 06:44:40 +0000
Date: Sat, 6 Dec 2025 14:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>
Subject: unifdef: usr/include/linux/lockd_netlink.h.tmp: 9: unterminated
 string literal (#if line 6 depth 1)
Message-ID: <202512061432.lUsDzdMB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f19b84186d297063a1006ca9e1c8597f77a75581
commit: 9a28ac1762a7a3a6ab4f82ff655843d6ab3ca62c lockd: add netlink control interface
date:   9 months ago
config: sparc64-randconfig-001-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061432.lUsDzdMB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6d8714b52375b3b7a7f269cd1ec4cc73baece38b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061432.lUsDzdMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061432.lUsDzdMB-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/devlink.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/ethtool_netlink_generated.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ethtool_netlink_generated.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/erspan.h.tmp: 40: unterminated string literal (#if line 23 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/linux/videodev2.h.tmp: 2381: unterminated string literal (#if line 57 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/ipv6.h.tmp: 126: unterminated string literal (#if line 119 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/erspan.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/perf_event.h.tmp: 1320: unterminated string literal (#if line 1285 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/videodev2.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ipv6.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/perf_event.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/radeon_drm.h.tmp: 36: unterminated string literal (#if line 33 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/media/raspberrypi/pisp_fe_config.h.tmp: 13: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/tcp_metrics.h.tmp: 11: unterminated string literal (#if line 4 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_mark_m.h.tmp: 15: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/radeon_drm.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/media/raspberrypi/pisp_fe_config.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/tcp_metrics.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/ip_vs.h.tmp: 299: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_mark_m.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ip_vs.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/mptcp.h.tmp: 26: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/mptcp.h] Error 1 shuffle=859361486
   unifdef: usr/include/sound/asound_fm.h.tmp: 107: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/drm/amdxdna_accel.h.tmp: 10: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/sound/asound_fm.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/amdxdna_accel.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/if_bridge.h.tmp: 21: unterminated string literal (#if line 14 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_bridge.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/map_to_14segment.h.tmp: 101: unterminated string literal (#if line 10 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/map_to_14segment.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/v3d_drm.h.tmp: 27: unterminated string literal (#if line 24 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/v3d_drm.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/if_pppox.h.tmp: 148: unterminated string literal (#if line 141 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_pppox.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/drm_sarea.h.tmp: 35: unterminated string literal (#if line 32 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/patchkey.h.tmp: 15: unterminated string literal (#if line 14 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/drm_sarea.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/netfilter_bridge/ebt_log.h.tmp: 13: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/patchkey.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_log.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/drm.h.tmp: 69: unterminated string literal (#if line 68 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/linux/if_team.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/drm.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/qxl_drm.h.tmp: 27: unterminated string literal (#if line 24 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_team.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/qxl_drm.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/drm_fourcc.h.tmp: 27: unterminated string literal (#if line 24 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/drm_fourcc.h] Error 1 shuffle=859361486
   unifdef: usr/include/sound/sfnt_info.h.tmp: 180: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/sound/sfnt_info.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/msm_drm.h.tmp: 28: unterminated string literal (#if line 25 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/handshake.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/msm_drm.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/handshake.h] Error 1 shuffle=859361486
   unifdef: usr/include/regulator/regulator.h.tmp: 86: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/regulator/regulator.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/dlm_plock.h.tmp: 15: unterminated string literal (#if line 10 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/dlm_plock.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/xattr.h.tmp: 33: unterminated string literal (#if line 16 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_mark_t.h.tmp: 22: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/xattr.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_mark_t.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/nfs.h.tmp: 36: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nfs.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/igmp.h.tmp: 77: unterminated string literal (#if line 68 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/igmp.h] Error 1 shuffle=859361486
>> unifdef: usr/include/linux/lockd_netlink.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/i8k.h.tmp: 21: unterminated string literal (#if line 18 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/lockd_netlink.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/i8k.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/tegra_drm.h.tmp: 7: unterminated string literal (#if line 4 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/nbd-netlink.h.tmp: 22: unterminated string literal (#if line 19 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/tegra_drm.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nbd-netlink.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/etnaviv_drm.h.tmp: 21: unterminated string literal (#if line 18 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/etnaviv_drm.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/netdev.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netdev.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/fscrypt.h.tmp: 55: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/fscrypt.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/types.h.tmp: 10: unterminated string literal (#if line 9 depth 4)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/types.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/vdpa.h.tmp: 10: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/vdpa.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/elf.h.tmp: 348: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/elf.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/batadv_packet.h.tmp: 468: unterminated string literal (#if line 459 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/linux/nfc.h.tmp: 27: unterminated string literal (#if line 21 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/batadv_packet.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nfc.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/cyclades.h.tmp: 6: unterminated string literal (#if line 3 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cyclades.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/io_uring.h.tmp: 24: unterminated string literal (#if line 23 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_ip.h.tmp: 31: unterminated string literal (#if line 16 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/io_uring.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_ip.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/wireguard.h.tmp: 134: unterminated string literal (#if line 131 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/wireguard.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/atmdev.h.tmp: 202: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/ndctl.h.tmp: 132: unterminated string literal (#if line 13 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/atmdev.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ndctl.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/target_core_user.h.tmp: 10: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/target_core_user.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/if_macsec.h.tmp: 18: unterminated string literal (#if line 13 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_macsec.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/armada_drm.h.tmp: 13: unterminated string literal (#if line 10 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/armada_drm.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/hsi/cs-protocol.h.tmp: 18: unterminated string literal (#if line 11 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_pkttype.h.tmp: 11: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/hsi/cs-protocol.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/agpgart.h.tmp: 43: unterminated string literal (#if line 27 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_pkttype.h] Error 1 shuffle=859361486
   unifdef: usr/include/misc/uacce/hisi_qm.h.tmp: 31: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/agpgart.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/cdrom.h.tmp: 845: unterminated string literal (#if line 834 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/misc/uacce/hisi_qm.h] Error 1 shuffle=859361486
   unifdef: usr/include/scsi/fc/fc_els.h.tmp: 158: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cdrom.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/scsi/fc/fc_els.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/cycx_cfm.h.tmp: 25: unterminated string literal (#if line 19 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_among.h.tmp: 63: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cycx_cfm.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_among.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/ioam6.h.tmp: 126: unterminated string literal (#if line 41 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ioam6.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/mptcp_pm.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/mptcp_pm.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/netfilter_bridge/ebt_vlan.h.tmp: 11: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_vlan.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/cramfs_fs.h.tmp: 8: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/scsi/fc/fc_fs.h.tmp: 136: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cramfs_fs.h] Error 1 shuffle=859361486

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
