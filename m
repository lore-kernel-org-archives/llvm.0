Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2083074AD;
	Wed, 25 Jun 2025 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750884570; cv=none; b=fdcuotw0s+aJ0oP+FAzwWzhI6FSLTlCykHkUuDv8gXHv+zYH11CERCbid2L2rzj0Y/9YmA0Y8Tp3IVJODxkwBUO2SudAEdoE2j3JvGucTEFZicRLUhfbgu1RjOhgaPm0c85mfwdj121m9fbNcthSkmHIni+/uSEcA/66Bhnce6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750884570; c=relaxed/simple;
	bh=fj6vf6b32JLP0EibMao/l/TA+kXY/3LkNqNwwrOqvuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFEJCb/+zZj1Mn/F3K1b6Hz4Yv6d2E0AQR9bEnFCsQIL7jWtz2R4PYxlBp/CrjrsvtPe+hVBx/na1ss8WkZQt4zp+bLlUdo0jD6A9v6EOSgXgrCURSQ2Mrv0zLuUz2HL63Lz+E6AISNV59VvTm+c+770uX9oPv7Dwfley8J4fjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOspIKAg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOspIKAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750884568; x=1782420568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fj6vf6b32JLP0EibMao/l/TA+kXY/3LkNqNwwrOqvuc=;
  b=QOspIKAgTCt2/PhvNpx8HXikHApwP4gqjWKX21b7aM6oA4tGOV1hEJLo
   PvJuInMFp6WfE8p8N6rLA1wUgpA+6b12jHP8ktNnf0JQQvLWqTHcD1SZB
   KeXrIqOTa0avh7BjkRtXqcgtxj/YS2kPDM7OeU8xB0XJC7W6nimZnLrKQ
   CTaebNVgAX7txPBYljFiUR5QI5xFje0lCEsrnSfCQqWxETPXNc9bdTVTk
   yiNmvo9bTXUMPweziCRKGu8KltA0gazhdWgVBvmIqcAu6J7BUjJsHkcdP
   uW9kOnpIjxiOTVg+QQmq44LVcxcSL1Jgaht5dfKKaGKQvYtEn29WDOuvE
   g==;
X-CSE-ConnectionGUID: cAXihlAMS563IW29CoDHmw==
X-CSE-MsgGUID: XTm9zC1pRvCV4MDgfsGcSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53136313"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53136313"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 13:49:27 -0700
X-CSE-ConnectionGUID: 1l18AS/mRH+KzX0fLztqTw==
X-CSE-MsgGUID: 0Q7Gbg51SziQw+juQs4o+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152622923"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jun 2025 13:49:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUX3b-000TS6-38;
	Wed, 25 Jun 2025 20:49:23 +0000
Date: Thu, 26 Jun 2025 04:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: Noah Klayman <noah.klayman@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [thesofproject:topic/sof-dev 10/10] ERROR: modpost:
 "sof_client_ipc4_find_debug_slot_offset_by_type"
 [sound/soc/sof/snd-sof-fw-gdb.ko] undefined!
Message-ID: <202506260414.Wuokr3Kr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   7a79ba9a0865c9efc5f5db3f5182ac445db67954
commit: 7a79ba9a0865c9efc5f5db3f5182ac445db67954 [10/10] ASoC: SOF: sof-client: expose Zephyr GDB stub
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250626/202506260414.Wuokr3Kr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260414.Wuokr3Kr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260414.Wuokr3Kr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.o
ERROR: modpost: "sof_of_pm" [sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko] undefined!
>> ERROR: modpost: "sof_client_ipc4_find_debug_slot_offset_by_type" [sound/soc/sof/snd-sof-fw-gdb.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
