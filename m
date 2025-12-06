Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4520D2E7BB5;
	Sat,  6 Dec 2025 07:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765006854; cv=none; b=PKxNJ5ubki2IO/c0TGtNhGEMLh8ivKHSW5cpfa+1goWU0x1kofSmahgcPlDvIGSNBEMbbKGuLT51Vhw1UkvSL60/OYhuZu2OeYAVwfehJI4lhwH3f4ooTHU4n1Yj5C6pe3HM1qolXOwuKiOZ+Z4y1pNrxN0yUR1I6/WNAO2p/+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765006854; c=relaxed/simple;
	bh=t1/dDypwyY0lIu42aCVLP+W4XO54Kv3pMZcrnZa0ZL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n/QOu7zUZ3X6KUkHnHyFT2o0BAftwNIjrPFtjf9USC+FoQEy86CMedISAxdvZ9GMTSGLS0naPNaGgfGa1jq019LA+YXnOczHdGKJG/AgzvisRf+40QZDhov+olRPfpLyCj/N5cXZ1MbrZ4NXM82J+bHBirOAmjNyvya2XrJMNi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3Aa4R8Z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3Aa4R8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765006852; x=1796542852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t1/dDypwyY0lIu42aCVLP+W4XO54Kv3pMZcrnZa0ZL0=;
  b=b3Aa4R8ZJXEnWQgjqkgyHNvelSlg0mKIJc+PPrGaty1fs6xtgXYg7c+i
   Do/9ayqLp9FLJij/PFQMheovKyaFUg3U5gLdy/dbPmxhQkoT6UeEMCRNQ
   5n867kSkxGodsP0cuq4sPUXiy8G66ZLmu9eX7PnyciZJYNv+LVFR5oCwI
   VqXf4viNyqCL6LrY+BknPL/L+F7jxnKDBxt9vZicW9pNfL6mEE5tYe7ZB
   VQMe01nuDlrq/5iK+wBr31z1UIuUH1TVE3jV/dxyR1MezkH8YD8Q1Pi49
   C7UA4IqBG3mdHsUYOauFiGtL3Q4sPxvIuBpfdrIddb6Djkh3AhW0y6NOI
   A==;
X-CSE-ConnectionGUID: 57adHdMoRJuwRLxQFMeolg==
X-CSE-MsgGUID: EGrxp3ftQ+SN6vaWm27qpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67111703"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="67111703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 23:40:50 -0800
X-CSE-ConnectionGUID: EYX/2jxOQK6i2y72qepxNg==
X-CSE-MsgGUID: 5tbcaGO7Qt21yHeAUo0oig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="200624752"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Dec 2025 23:40:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRmuM-00000000Fzz-0Xe3;
	Sat, 06 Dec 2025 07:40:46 +0000
Date: Sat, 6 Dec 2025 15:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: Antonio Quartulli <antonio@openvpn.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>
Subject: unifdef: usr/include/linux/ovpn.h.tmp: 9: unterminated string
 literal (#if line 6 depth 1)
Message-ID: <202512061538.cVMZ22N7-lkp@intel.com>
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
commit: b7a63391aa982295bbb3125e7d4470f51f31ff0f ovpn: add basic netlink support
date:   8 months ago
config: arm64-randconfig-003-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061538.cVMZ22N7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6d8714b52375b3b7a7f269cd1ec4cc73baece38b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061538.cVMZ22N7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061538.cVMZ22N7-lkp@intel.com/

All errors (new ones prefixed by >>):

   unifdef: usr/include/linux/nfc.h.tmp: 27: unterminated string literal (#if line 21 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/tipc_netlink.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nfc.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/openvswitch.h.tmp: 42: unterminated string literal (#if line 21 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/gtp.h.tmp: 5: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/openvswitch.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/gtp.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/l2tp.h.tmp: 199: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/l2tp.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/vmcore.h.tmp: 7: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/videodev2.h.tmp: 2386: unterminated string literal (#if line 57 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/vmcore.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/batadv_packet.h.tmp: 468: unterminated string literal (#if line 459 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/videodev2.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/batadv_packet.h] Error 1 shuffle=2912882599
   unifdef: usr/include/regulator/regulator.h.tmp: 86: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/regulator/regulator.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/virtgpu_drm.h.tmp: 27: unterminated string literal (#if line 24 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/virtgpu_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/scsi/fc/fc_els.h.tmp: 158: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/scsi/fc/fc_els.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_vlan.h.tmp: 11: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_vlan.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/etnaviv_drm.h.tmp: 21: unterminated string literal (#if line 18 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/etnaviv_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/drm_sarea.h.tmp: 35: unterminated string literal (#if line 32 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/virtio_balloon.h.tmp: 99: unterminated string literal (#if line 1 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/pps.h.tmp: 28: unterminated string literal (#if line 23 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/drm_sarea.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/virtio_balloon.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/pps.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/cycx_cfm.h.tmp: 25: unterminated string literal (#if line 19 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cycx_cfm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/if_team.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_team.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_ip6.h.tmp: 30: unterminated string literal (#if line 13 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_ip6.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/ila.h.tmp: 8: unterminated string literal (#if line 4 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/btrfs.h.tmp: 24: unterminated string literal (#if line 23 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ila.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/xe_drm.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/btrfs.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/xe_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/sound/sfnt_info.h.tmp: 180: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/sound/sfnt_info.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/vdpa.h.tmp: 10: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/vdpa.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/toshiba.h.tmp: 29: unterminated string literal (#if line 22 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/toshiba.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/coda.h.tmp: 748: unterminated string literal (#if line 59 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/coda.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_among.h.tmp: 63: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_arpreply.h.tmp: 11: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_among.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_arpreply.h] Error 1 shuffle=2912882599
   unifdef: usr/include/sound/sof/fw.h.tmp: 20: unterminated string literal (#if line 13 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/sound/sof/fw.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/comedi.h.tmp: 16: unterminated string literal (#if line 10 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/comedi.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/nbd-netlink.h.tmp: 22: unterminated string literal (#if line 19 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/ioam6_genl.h.tmp: 12: unterminated string literal (#if line 9 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nbd-netlink.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ioam6_genl.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/user_events.h.tmp: 14: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/user_events.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/igmp.h.tmp: 77: unterminated string literal (#if line 68 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/igmp.h] Error 1 shuffle=2912882599
>> unifdef: usr/include/linux/ovpn.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ovpn.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_redirect.h.tmp: 9: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_redirect.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/panthor_drm.h.tmp: 6: unterminated string literal (#if line 3 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/if_pppox.h.tmp: 148: unterminated string literal (#if line 141 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_pppox.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/panthor_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/if_bridge.h.tmp: 21: unterminated string literal (#if line 14 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_bridge.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/i8k.h.tmp: 21: unterminated string literal (#if line 18 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/cxl_mem.h.tmp: 53: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/i8k.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cxl_mem.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/net_shaper.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/ethtool_netlink.h.tmp: 212: unterminated string literal (#if line 9 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/net_shaper.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ethtool_netlink.h] Error 1 shuffle=2912882599
   unifdef: usr/include/rdma/siw-abi.h.tmp: 11: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/rdma/siw-abi.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/btrfs_tree.h.tmp: 360: unterminated string literal (#if line 359 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/btrfs_tree.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_pkttype.h.tmp: 11: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_pkttype.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/types.h.tmp: 10: unterminated string literal (#if line 9 depth 4)
   unifdef: unifdef: output may be truncated
   usr/include/drm/vc4_drm.h.tmp: 27: unterminated string literal (#if line 24 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/types.h] Error 1 shuffle=2912882599
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/vc4_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/iso_fs.h.tmp: 27: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/iso_fs.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/netfilter_bridge/ebt_arp.h.tmp: 19: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_arp.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/panfrost_drm.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/panfrost_drm.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/ip_vs.h.tmp: 299: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ip_vs.h] Error 1 shuffle=2912882599
   unifdef: usr/include/linux/elf.h.tmp: 366: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/elf.h] Error 1 shuffle=2912882599
   unifdef: usr/include/drm/tegra_drm.h.tmp: 7: unterminated string literal (#if line 4 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/tegra_drm.h] Error 1 shuffle=2912882599
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1378: headers] Error 2 shuffle=2912882599
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2912882599
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2912882599
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
