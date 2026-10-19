Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447536;
	b=JjT4oqvgNQRiLF8wH4zn6juPMIo1F5ojgXEFX+vuBbpZvzQQrlCyCCEsC8l2oFBnz6xi
	 +9KwkvmmegqCGpQ5yinMCoYRl4aWQxURDhggiOVsp3V9iTG3Cf7wxMjsDTus6sLnNTWAn
	 Y9bZ8qoYsCwwlPmsUDCfaz3uqBTmZl33mm9mFwbbXGoQdjXGtcfyccKHiVh2q5REWYt0C
	 IzmNK+Gg9CaGnm3q5RS0ZhkPUzdfX6ZLEsPA92YgPWoWbGnt9ZVL0IsXUqHpCSyfjS2p6
	 jEjTCSQs9DeHS8YX/KGjie/bOAmq/pIcDMg8eviky1PCMkCa1UKd6GxXBUvbG8kVEdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447536;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IxEzQZ4oZdZhNJ+T//+bIs/ETgLeI5GDthun8kbnDII=;
	b=FVylt5O1ErAzIr/Vk5hwZPL9ealKcOEaMMh9EHoCmVHiK86oTUQAlkvHzqcwN4Vhu/vh
	 LaUy4IPoxr8cPGPluHlVF27DQsN8/YTzkRt6ZSgBLePLqKp97+MUl7ywG7rVPoMLOfxIZ
	 bnI9eX6ff3cImRbNmL3Px3dAsFsFxCHOzmVwB2TJlJ4AqOYZPj50Rnmp+BaQ4bcmDvr0b
	 6sVS5YnP3/IjmwGZeHIl+DCiPv2hhP7JaSr4Ly3vbh1THWBUG8qugrl4n0K4nz2TBN4cj
	 Gju4JRyrOrfzvDdZyhu2sJvAugBlU2EZVL8S9catn6HzPRAMV3ednT3yf8JpCTwuEQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EEJzaUq+;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263AA606A319;
	Mon, 19 Oct 2026 22:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 263AA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EEJzaUq+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792447536; x=1823983536;
  h=date:from:to:cc:subject:message-id;
  bh=voOOTuq0esZz/NQHYTZrE/CfXHmdZHyEZsIt8Bna/bo=;
  b=EEJzaUq+5VwANXV0cuEQmHLd/zdHOC+hQitVKzFZ+1Up7BeMQdVDeG1h
   v8KqHQ/pKZW95vCIYfgC+WyxtdpYX/fCpVc2miQic27K8D5nM6Hc7Ulqp
   y6o0G9Q+UPXDe6TMdrZ/d8g7blv19e9x8JQ1M1Xz3Kc+GV9eAhLUgcXTE
   zVWIlrJI81uCX9b5o3lbj6W+ErMBDrqBGGLxrydqgDcAgefaV5gmktvce
   mH8fdwaM7M2zyZ0fVhXCAWUiOhCRD3dwU3GEahSry3ll5KXUy0QEon80m
   ZwZBbg4O+y9JQvnUfKzcoIqRRaAdBUPGVIwyfPZJ765Ibp0YMv6HOhUFB
   g==;
X-CSE-ConnectionGUID: AesPX4K7RjufR0o70HHHnA==
X-CSE-MsgGUID: 8DJTDTazTnSquoFwtonVVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1024552"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1024552"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 15:05:36 -0700
X-CSE-ConnectionGUID: z7EtxWJeQV+9zt17QEhE9w==
X-CSE-MsgGUID: rgXeF7LsQWitdHc1b5KMPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2610648"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Oct 2026 15:05:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIvU4-00000000MU6-224h;
	Mon, 19 Oct 2026 22:05:32 +0000
Date: Tue, 20 Oct 2026 06:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4 8/22] vmlinux.o: error: objtool:
 ___bpf_prog_run+0xa3: ignoring unreachables due to jump table quirk
Message-ID: <202610200604.DdZAdK7f-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4
head:   1abf4915b934f55c588e220cfc73188a5d4f13a7
commit: 20f58aa1dc32160414033482f1b4ee292279d225 [8/22] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-1015-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200604.DdZAdK7f-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200604.DdZAdK7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200604.DdZAdK7f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: ___bpf_prog_run+0xa3: ignoring unreachables due to jump table quirk

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
