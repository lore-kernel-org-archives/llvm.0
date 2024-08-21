Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600E9179652;
	Wed, 21 Aug 2024 21:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277185; cv=none; b=i/19BQDM+yYUCoT9+2N4rAIUPCGXy+AhWZvojng8RCHUs8jqW7NASqGk5kVE1o23CIk2m82PHaNxTHIchy+rVEEdJHYpvjRjmgwOE8jDbESoIO3U9NiMPXQPj8ukppa1HUdafHBuaiH3yOh4lKrLo4muHk93i51ZRFHto8v+YJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277185; c=relaxed/simple;
	bh=+QoMRUl5xXUIddGy/jNBqqOBazCSuaafR/WPvAL6Rcc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bg9XwQZWIu4+sHD+erEqtDPGJJ3YKzBdimcT4ee+xpB7XvHUoyWT5wMgOWtB1jnecA0xwY6VxC/txhVk9skbLV/KKhTUYTC5mp1pPzEt26bCrMQA+5UJxXA6L/Z4bLAzMmFJP3My69bIA9zYu3I0QWA0hlenD8xEDI3Gwafy018=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTc645cP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTc645cP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724277184; x=1755813184;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+QoMRUl5xXUIddGy/jNBqqOBazCSuaafR/WPvAL6Rcc=;
  b=OTc645cPNqwTAbXuJmzxFH/dDoKRKFAUYNRLrqTGjmll1S7TdvS0n0tK
   wM3RCzwpaDhuHBv6+Uhor9JBdYc8e+AW0zJqL2fEnlAWhVUYyt3J4yPc3
   6cBSIGp5MiGiqSZ0yj/BmWah5XK2/lLN/UuiYOGBSY8RU63JwSvoClJ5u
   P2flZtvhu0FE/oOyyWdDYMjBfUikwF+CA8JE0Zuvxn8BqyMmdkeLa5n4g
   jdz29BADoVAu3DhNi4Rnt9kistvILuQ4Bmasm41beUVOsCnIF+M57d2Ky
   8c+n/d9AiCBAwMpV2f0kQYKweiZCMmeY20b+SwZhpBrfVyXW2etZ+U8jH
   w==;
X-CSE-ConnectionGUID: NXg/bqUJSV6toYtzfUMbVg==
X-CSE-MsgGUID: HT8/BnaEQmOF0p1OeXoLWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33817555"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="33817555"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 14:53:04 -0700
X-CSE-ConnectionGUID: R30FJkyWT/KelCaPA5qgZg==
X-CSE-MsgGUID: QMUQevEGRqadYmIzXAlbQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="66169187"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2024 14:53:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgtGG-000Bzt-0W;
	Wed, 21 Aug 2024 21:53:00 +0000
Date: Thu, 22 Aug 2024 05:52:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: fs/bcachefs/bcachefs.o: warning: objtool: bch2_alloc_inode+0xc:
 unreachable instruction
Message-ID: <202408220529.SxUFXGcd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b311c1b497e51a628aa89e7cb954481e5f9dced2
commit: b769590f33dcb04cb8efc4905030f4a41df08e2b bcachefs: Clean up inode alloc
date:   4 months ago
config: x86_64-buildonly-randconfig-002-20240822 (https://download.01.org/0day-ci/archive/20240822/202408220529.SxUFXGcd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220529.SxUFXGcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220529.SxUFXGcd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/bcachefs.o: warning: objtool: bch2_alloc_inode+0xc: unreachable instruction
   fs/bcachefs/bcachefs.o: warning: objtool: BCH2_NO_SB_OPT+0xc: unreachable instruction
   fs/bcachefs/bcachefs.o: warning: objtool: SET_BCH2_NO_SB_OPT+0xc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
