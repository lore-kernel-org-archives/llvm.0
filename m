Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340F12907;
	Sat, 15 Mar 2025 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742009822; cv=none; b=kiZlhCo/tKOzF5vojOvdiQaXk4uqAdTOAxFdTNErKNq43JiRzjPvet88uP4cvG39VwOv1iowTD6egCaV0mZRYuA+GNUGj3Mi9N85vWR5Dz0E/UK7lhzQohXDqNhCqqAY3NMQk4TiOafDPtS5nvwujxTCeXvSx4+nTJS8JiEXmHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742009822; c=relaxed/simple;
	bh=DqXA52b3kyXlCggP8zs7E6lrG3AOMUR7Z4HMJOEn/wk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=USMdZfhXTQ25JFPs7Igqyh75fZ4LJ2X1NtoFmA1FQK+wxjILj4QicTY8wMMmHNjH6f1PHaicb/xKLgZd3kZuXPbd6AGml9mK2zHtMH8g8NlJipQDe6709rH0cKn/TZ/70ACaFqH4XDD+GG6I9mqPrEvquzn1mZngFzDv+L6l7Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zo2fsmIj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zo2fsmIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742009820; x=1773545820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqXA52b3kyXlCggP8zs7E6lrG3AOMUR7Z4HMJOEn/wk=;
  b=Zo2fsmIjK1VJ26xo6+0/ay4x2k8ZzQNHsu72FbKkLkF9kq8wasE3WV1N
   q39oMmF5xm7Hm4PsXWSoqwiu+9VGITQvaGsdF2Yk+KdQpOU8uSzZeZHSA
   nipkCwBQOsmwBtzOIiG3l3iPb4uvHnuZNmNAFjz6oRYGHJqEDU8NwJf2i
   VoyQ5wHwkzWkkBLdX7f5IqafGwcKbtaigpWbX0As/84+0yd3jpJc3bjQv
   CgmsZ9IdFC5OlAFYryOlGxoOcxamJ/Slg1yCHM3ejNAlOMqDtA0UcyJpa
   Vxy9yUyS05QQPkDdG28sd/8B30hKdYL2RFyAGI2ve4YGz1o6+a2Wsw91R
   g==;
X-CSE-ConnectionGUID: 0Rca9SejQp65SXnrQGox5Q==
X-CSE-MsgGUID: vKpdyG0pTj6xe6yYL1URrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54556561"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="54556561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 20:37:00 -0700
X-CSE-ConnectionGUID: OuOJnguvTFqsbtN7DFiTTg==
X-CSE-MsgGUID: ADINzkhGTgqMRU8fvuJqFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="144646467"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2025 20:36:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttIKW-000B2L-00;
	Sat, 15 Mar 2025 03:36:56 +0000
Date: Sat, 15 Mar 2025 11:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [pza:reset/next 3/4] ERROR: modpost: drivers/reset/reset-imx-scu:
 type mismatch between imx_scu_reset_ids[] and MODULE_DEVICE_TABLE(platform,
 ...)
Message-ID: <202503151155.HAQUKDAm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.pengutronix.de/git/pza/linux reset/next
head:   c361baf67200a79c878d72cc879b1217c52cec96
commit: 6b64fde5c183b5ef5b0f0f7321408caf3b876187 [3/4] reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250315/202503151155.HAQUKDAm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151155.HAQUKDAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151155.HAQUKDAm-lkp@intel.com/

Note: the pza/reset/next HEAD c361baf67200a79c878d72cc879b1217c52cec96 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/reset/reset-imx-scu: type mismatch between imx_scu_reset_ids[] and MODULE_DEVICE_TABLE(platform, ...)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
