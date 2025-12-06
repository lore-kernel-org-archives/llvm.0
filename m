Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748341E32CF;
	Sat,  6 Dec 2025 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765009495; cv=none; b=iuqG7SyH54wqBCVRB6XqyviWwpMBoHnPXoioou87y+wOe9MxFyZfY44jB0pAxJMhEVQGDCab/WGTJd7aRL/rLt/ScNPVq9iFJUe//6xQfs9SYGU38ytntV3tjkK3dKIj4PkkFzBp2ib4+eEtKg8IJwmZGWYrMi050995MsUm4Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765009495; c=relaxed/simple;
	bh=WtEGE7fL567/h0x8PpSbS4j7e/EbI43FIG6m5IoZAo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PotJQ70aDTgygNJClKf++i1cYL64pnc7OMklL9iv7dHc8+CLMjXATUf9v/con/6QAIPmA5ueMNVhzcmhDCZ949vPjVBto8e6rjPPbNXDN0+O9pJiSYbvTg1S7FRHEAUzehgasa85VazoHoDQsgqsWIGHhtbsow8AKb7JEyzNmH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7rNuOgX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7rNuOgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765009493; x=1796545493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WtEGE7fL567/h0x8PpSbS4j7e/EbI43FIG6m5IoZAo0=;
  b=O7rNuOgXqSSoxf9hi58S7Ln0Q9jlkMF55Z4dFUggnkrU2My1MtkUXkzO
   yE/pjAfp5UlnhlCEHW1EJMaYtRXk9MMYps7y8S0hagONNotmOcggvG8mg
   pKwOxParBuCzgr+b/Ygmb2KLo9rGxfCzL65S8ZYSGU0twyNEn/7GMDxjp
   JWSY5HQfTO2SzSkyf7mDbPZqEbVUcBJDX9yd40718vWTgVebX/FAhPsS2
   keKjksT669BbD13TOoUOYChXcd/kCn7FrG1QVNzi+SAv1xaQQdkOovD95
   f6OT63Jvx8T1tNXmcyhd9XWDg0PYSfl/AxNOapl+jnEIynL13He43kfmi
   Q==;
X-CSE-ConnectionGUID: vID2CcZnQw2zEVBjgsOjfQ==
X-CSE-MsgGUID: XCbPXLkWRgy/O9qCo7X2Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66995946"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66995946"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 00:24:53 -0800
X-CSE-ConnectionGUID: cPSGPkpHQpyr6GqxmNcTUQ==
X-CSE-MsgGUID: PGURLv9cSRmDLakk/rZ24Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="199664874"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Dec 2025 00:24:49 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRnax-00000000G1Z-0v4o;
	Sat, 06 Dec 2025 08:24:47 +0000
Date: Sat, 6 Dec 2025 16:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Daniel Zahka <daniel.zahka@gmail.com>,
	Eric Dumazet <edumazet@google.com>
Subject: unifdef: usr/include/linux/psp.h.tmp: 9: unterminated string literal
 (#if line 6 depth 1)
Message-ID: <202512061623.6whyyAn8-lkp@intel.com>
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
commit: 00c94ca2b99e6610e483f92e531b319eeaed94aa psp: base PSP device support
date:   3 months ago
config: sparc64-randconfig-001-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061623.6whyyAn8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6d8714b52375b3b7a7f269cd1ec4cc73baece38b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061623.6whyyAn8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061623.6whyyAn8-lkp@intel.com/

All errors (new ones prefixed by >>):

   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/dpll.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/map_to_14segment.h.tmp: 101: unterminated string literal (#if line 10 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/map_to_14segment.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/asahi_drm.h.tmp: 10: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/asahi_drm.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/cdrom.h.tmp: 845: unterminated string literal (#if line 834 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cdrom.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/dm-ioctl.h.tmp: 14: unterminated string literal (#if line 9 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/dm-ioctl.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/coff.h.tmp: 177: unterminated string literal (#if line 14 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/coff.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/user_events.h.tmp: 14: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/input.h.tmp: 20: unterminated string literal (#if line 9 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/input.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/user_events.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/ila.h.tmp: 8: unterminated string literal (#if line 4 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/drm/drm.h.tmp: 69: unterminated string literal (#if line 68 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ila.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/drm.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/if_hippi.h.tmp: 102: unterminated string literal (#if line 83 depth 3)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_hippi.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/wireguard.h.tmp: 138: unterminated string literal (#if line 135 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/wireguard.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/tipc_config.h.tmp: 173: unterminated string literal (#if line 172 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/drm/radeon_drm.h.tmp: 36: unterminated string literal (#if line 33 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/tipc_config.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/radeon_drm.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/if_pppox.h.tmp: 148: unterminated string literal (#if line 141 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/if_pppox.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/vmcore.h.tmp: 7: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/vmcore.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/patchkey.h.tmp: 15: unterminated string literal (#if line 14 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/sound/asound.h.tmp: 1258: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/patchkey.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/sound/asound.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/netfilter_ipv6/ip6_tables.h.tmp: 162: unterminated string literal (#if line 16 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_ipv6/ip6_tables.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/gtp.h.tmp: 5: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/gtp.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/erspan.h.tmp: 40: unterminated string literal (#if line 23 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/erspan.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/msdos_fs.h.tmp: 58: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/cycx_cfm.h.tmp: 25: unterminated string literal (#if line 19 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/msdos_fs.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cycx_cfm.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/ivpu_accel.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/ivpu_accel.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/icmp.h.tmp: 127: unterminated string literal (#if line 120 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/icmp.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/xe_drm.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/fscrypt.h.tmp: 55: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/xe_drm.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/fscrypt.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/ioam6.h.tmp: 126: unterminated string literal (#if line 41 depth 2)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ioam6.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/omap_drm.h.tmp: 24: unterminated string literal (#if line 21 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/omap_drm.h] Error 1 shuffle=859361486
   unifdef: usr/include/drm/drm_mode.h.tmp: 30: unterminated string literal (#if line 27 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/openvswitch.h.tmp: 42: unterminated string literal (#if line 21 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/drm/drm_mode.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/nl80211.h.tmp: 45: unterminated string literal (#if line 1 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/openvswitch.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nl80211.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/media/raspberrypi/pisp_fe_config.h.tmp: 13: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/media/raspberrypi/pisp_fe_config.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/devlink.h.tmp: 18: unterminated string literal (#if line 13 depth 1)
   unifdef: output may be truncated
>> unifdef: usr/include/linux/psp.h.tmp: 9: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/devlink.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/psp.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/atmdev.h.tmp: 202: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/hsi/cs-protocol.h.tmp: 18: unterminated string literal (#if line 11 depth 1)
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/atmdev.h] Error 1 shuffle=859361486
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/hsi/cs-protocol.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/qemu_fw_cfg.h.tmp: 7: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/qemu_fw_cfg.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/seg6_genl.h.tmp: 5: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/ndctl.h.tmp: 132: unterminated string literal (#if line 13 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/seg6_genl.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/ndctl.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/nfc.h.tmp: 27: unterminated string literal (#if line 21 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/nfc.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/netfilter_bridge/ebt_nat.h.tmp: 13: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/cyclades.h.tmp: 6: unterminated string literal (#if line 3 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_nat.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/cyclades.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/media/raspberrypi/pisp_be_config.h.tmp: 13: unterminated string literal (#if line 8 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/media/raspberrypi/pisp_be_config.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/tcp.h.tmp: 55: unterminated string literal (#if line 30 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/linux/dccp.h.tmp: 32: unterminated string literal (#if line 25 depth 2)
   unifdef: output may be truncated
   unifdef: usr/include/linux/batman_adv.h.tmp: 10: unterminated string literal (#if line 7 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/tcp.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/dccp.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/batman_adv.h] Error 1 shuffle=859361486
   unifdef: usr/include/linux/netfilter_bridge/ebt_limit.h.tmp: 7: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   unifdef: usr/include/linux/netfilter_bridge/ebt_stp.h.tmp: 24: unterminated string literal (#if line 2 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_limit.h] Error 1 shuffle=859361486
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/netfilter_bridge/ebt_stp.h] Error 1 shuffle=859361486
   unifdef: usr/include/rdma/siw-abi.h.tmp: 11: unterminated string literal (#if line 6 depth 1)
   unifdef: output may be truncated
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/rdma/siw-abi.h] Error 1 shuffle=859361486
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1380: headers] Error 2 shuffle=859361486
   <stdin>:1519:2: warning: syscall clone3 not implemented [-W#warnings]
    1519 | #warning syscall clone3 not implemented
         |  ^
   1 warning generated.
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=859361486
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=859361486
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
