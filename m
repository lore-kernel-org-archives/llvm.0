Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34F2E5402;
	Sat,  6 Dec 2025 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765019039; cv=none; b=Urq45tTkWSa8PjWJLpxEzHWIgAwcq+U4I+Cl8Ge+IXLzWYB8jzyk1mLa2VdD70TsEKUuLdVoA7FdtAn2lQV7jSlfB+g85J1a80fMSTxXSDT5EUsYfiPKea1W+JNR3G1c7AoelUMFOP4XCJ6jUcEpmUXMjLuh84k49R/X+baBzqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765019039; c=relaxed/simple;
	bh=uPjFjeeZboq5ol5Z/PtY4BVago+ojmvRLR4q2AyTzpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7BkS8M0U/c+IZhdUcrImk/EuSs2KXQy1gVWroegt9QZqj6/3Ag9R0j2F8FsmjM3NWgAQdVOP5B+3j0SBDjwnscnHpziziqUDATudFlQswA+SBiwpg8CDPQLDKa4zlQnMCPVI58A11ni8Vtczoh/DKunhDjT084omldm+JNTCC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ly+V0j/f; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ly+V0j/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765019038; x=1796555038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uPjFjeeZboq5ol5Z/PtY4BVago+ojmvRLR4q2AyTzpQ=;
  b=Ly+V0j/f6LuSR9RWSy6D+Zg9RGjDzjYqPcf1jBoaVCAlR4wKWS31KAXO
   G3lwY7uHSXP//nTww+hMTfHNnA1vmt08fu7CKMFsbsjnf0D4/lVhq/GMK
   iV+zWH3BEqQ5f/zMQdYPwSiRSObEtNHPypx+PIA/jWOPpAtXL/InEvUiR
   R5RkJz8/8MNIaW7TOAMaylrOx+MCSJNB4RhxCxbE1CQsVXp0exLxnRl+V
   7Ahf1C4yqdFci496cNd5nJ7bUge1sty4FTptlY3INzzu4YgrVz8IQXOCf
   Sow092vxu2t5X8PJh+RAVYEflWgKd/8Zhfmpgpx3Dk1+433VPPyA5/u+t
   g==;
X-CSE-ConnectionGUID: ihrhqg7oTjGp2SfBg9XoJg==
X-CSE-MsgGUID: 75oGnzdNTJaPy8t6cVsiuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78391421"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="78391421"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 03:03:55 -0800
X-CSE-ConnectionGUID: 49PErO39RFepqj0VIXwpDA==
X-CSE-MsgGUID: I85x+t/yQ6WAVI7cb+pXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195582695"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Dec 2025 03:03:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRq4s-00000000G6L-2ntC;
	Sat, 06 Dec 2025 11:03:50 +0000
Date: Sat, 6 Dec 2025 19:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: unifdef: usr/include/drm/ethosu_accel.h.tmp: 6: unterminated string
 literal (#if line 3 depth 1)
Message-ID: <202512061855.SOz1gpWj-lkp@intel.com>
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
commit: 5a5e9c0228e613f0ef2a58b9782d7c0ea8f1e58b accel: Add Arm Ethos-U NPU driver
date:   6 weeks ago
config: arm64-randconfig-003-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061855.SOz1gpWj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6d8714b52375b3b7a7f269cd1ec4cc73baece38b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061855.SOz1gpWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061855.SOz1gpWj-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_bridge.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_802_3.h.tmp: 11: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/tcp.h.tmp: 55: unterminated string literal (#if line 30 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_802_3.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/tcp.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/drm_sarea.h.tmp: 35: unterminated string literal (#if line 32 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/sound/asound.h.tmp: 1258: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/drm_sarea.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/sound/asound.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_limit.h.tmp: 7: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/drm/armada_drm.h.tmp: 13: unterminated string literal (#if line 10 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_limit.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/armada_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/mptcp_pm.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/toshiba.h.tmp: 29: unterminated string literal (#if line 22 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/mptcp_pm.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/toshiba.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/map_to_7segment.h.tmp: 83: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/map_to_7segment.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_arpreply.h.tmp: 11: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/android/binder_netlink.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_arpreply.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/android/binder_netlink.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/openvswitch.h.tmp: 42: unterminated string literal (#if line 21 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/drm/vgem_drm.h.tmp: 30: unterminated string literal (#if line 27 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/openvswitch.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/patchkey.h.tmp: 15: unterminated string literal (#if line 14 depth 1)
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/vgem_drm.h] Error 1 shuffle=2912882599
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/patchkey.h] Error 1 shuffle=2912882599
   unifdef: unifdef: usr/include/linux/icmpv6.h.tmp: 38: unterminated string literal (#if line 26 depth 2)
   usr/include/linux/thermal.h.tmp: 22: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/thermal.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/icmpv6.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter/x_tables.h.tmp: 103: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/scsi/fc/fc_els.h.tmp: 164: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter/x_tables.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/scsi/fc/fc_els.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/ivpu_accel.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/if_hippi.h.tmp: 102: unterminated string literal (#if line 83 depth 3)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/ivpu_accel.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_hippi.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/pvr_drm.h.tmp: 7: unterminated string literal (#if line 4 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/scsi/fc/fc_fs.h.tmp: 136: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/pvr_drm.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/scsi/fc/fc_fs.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_ipv6/ip6_tables.h.tmp: 162: unterminated string literal (#if line 16 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_ipv6/ip6_tables.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/hsi/cs-protocol.h.tmp: 18: unterminated string literal (#if line 11 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/hsi/cs-protocol.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/rocket_accel.h.tmp: 8: unterminated string literal (#if line 5 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/rocket_accel.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/smc.h.tmp: 33: unterminated string literal (#if line 12 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/smc.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netdev.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netdev.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_mark_t.h.tmp: 22: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_among.h.tmp: 63: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/comedi.h.tmp: 16: unterminated string literal (#if line 10 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_mark_t.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_among.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/comedi.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/l2tp.h.tmp: 199: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_nflog.h.tmp: 10: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/l2tp.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_nflog.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/ip_vs.h.tmp: 299: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ip_vs.h] Error 1 shuffle=2912882599
>> unifdef: usr/include/drm/ethosu_accel.h.tmp: 6: unterminated string literal (#if line 3 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/ethosu_accel.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/drm.h.tmp: 69: unterminated string literal (#if line 68 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/linux/fscrypt.h.tmp: 55: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/drm.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/fscrypt.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/target_core_user.h.tmp: 10: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/drm/panthor_drm.h.tmp: 6: unterminated string literal (#if line 3 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/panthor_drm.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/target_core_user.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/ipv6.h.tmp: 126: unterminated string literal (#if line 119 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/drm/nouveau_drm.h.tmp: 30: unterminated string literal (#if line 25 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/vmcore.h.tmp: 7: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ipv6.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/virtgpu_drm.h.tmp: 27: unterminated string literal (#if line 24 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/vmcore.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/nouveau_drm.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/virtgpu_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/gtp.h.tmp: 5: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/ethtool_netlink_generated.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/gtp.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ethtool_netlink_generated.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/tegra_drm.h.tmp: 7: unterminated string literal (#if line 4 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/tegra_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/ndctl.h.tmp: 132: unterminated string literal (#if line 13 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ndctl.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/taskstats.h.tmp: 277: unterminated string literal (#if line 17 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/drm/omap_drm.h.tmp: 24: unterminated string literal (#if line 21 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/nfs.h.tmp: 36: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/taskstats.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/omap_drm.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nfs.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/cxl_mem.h.tmp: 53: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cxl_mem.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/seg6_genl.h.tmp: 5: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/seg6_genl.h] Error 1 shuffle=2912882599
   usr/include/linux/msdos_fs.h.tmp: 58: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/msdos_fs.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/panfrost_drm.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/panfrost_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/exynos_drm.h.tmp: 19: unterminated string literal (#if line 16 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/exynos_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/msm_drm.h.tmp: 28: unterminated string literal (#if line 25 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/msm_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/pps.h.tmp: 28: unterminated string literal (#if line 23 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/pps.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/erspan.h.tmp: 40: unterminated string literal (#if line 23 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/erspan.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/if_pppox.h.tmp: 148: unterminated string literal (#if line 141 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/drm/amdxdna_accel.h.tmp: 10: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_pppox.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/amdxdna_accel.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/asahi_drm.h.tmp: 10: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/batman_adv.h.tmp: 10: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/asahi_drm.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/batman_adv.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/nl80211.h.tmp: 45: unterminated string literal (#if line 1 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nl80211.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/cycx_cfm.h.tmp: 25: unterminated string literal (#if line 19 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/videodev2.h.tmp: 2407: unterminated string literal (#if line 57 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cycx_cfm.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/videodev2.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_mark_m.h.tmp: 15: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/kfd_ioctl.h.tmp: 623: unterminated string literal (#if line 23 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/ioam6.h.tmp: 126: unterminated string literal (#if line 41 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_mark_m.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/ip.h.tmp: 95: unterminated string literal (#if line 88 depth 2)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
