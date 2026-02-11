Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC62C2D372D;
	Wed, 11 Feb 2026 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770796343; cv=none; b=rKRDcjIej4MiCigifc4yff6rKZysyiz8GV0YW+Zhs3Bs/gDrRMz1ozz2OP+knBPylUT+yCqaOqnjJt1ObIID/drAd6ShANc4SZNtcAyY9iotaODK+AKZHlHU0Xf70RQS01lLt0BHdE+zDVbxt0clIIZ8gU4EGkLODR0/r98py2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770796343; c=relaxed/simple;
	bh=u9f6ol6JoWP/LJu18cvd0o2SlhCDJoE0HAJLTVePwIs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ovOYbr9LKWaDw+20TgJOU1tIvcubUqWr+GMBLKbjZFe9Bj2BJs0SpL4p0O/YlipxFoUDYqaQh9zTgvbwB/gzaicTlw+8ssWPxTH9TUfc8wFdELfcnL54gcLNSESfKe6ePsLXEUmriioDXo8Sb2jFvVOzo4uVE8+axsNDUw4Sflo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+G+sseF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+G+sseF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770796341; x=1802332341;
  h=date:from:to:cc:subject:message-id;
  bh=u9f6ol6JoWP/LJu18cvd0o2SlhCDJoE0HAJLTVePwIs=;
  b=I+G+sseFWppKQf8dE4oSj62TUjoeeW6RwaBQncgF53C6wMuoWMiu1wBr
   VHaGdj6sFxek4gdfuD2S/UuVyr2R2QPYoaBXb1MedNyBNWGs1PIVJvnmt
   qaRA7cZvC83+mAIVjGRuWw5wNfywPX6AY8dcehB1n6PHFIvOIEfOjHSjp
   +d+JZcAwv5n+kOO+8nSzHUAqISMGp6E1ETKd6JBzl8M6QwdORTz/5c12N
   C5Yqo0FwTQuy0mP8sc6IJDAk5qkVwr5/2aV2GTZ9R41yusqyw2f+XekyY
   +vBsJTqLuSxs/T16K+EgVixuvdGZM439dmXmIw9hdnHRLZ2sPr0yzA+/d
   A==;
X-CSE-ConnectionGUID: hiq6zhwzTVmJvHCwtjQwwQ==
X-CSE-MsgGUID: NTuX98hYRjS5ZG8vi307Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="97396174"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97396174"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 23:52:21 -0800
X-CSE-ConnectionGUID: l89mH3HgQqafJ5+MGZWawg==
X-CSE-MsgGUID: DQUIaVAtSVu6eF0nFkh/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211997650"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Feb 2026 23:52:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq51F-00000000pnY-0Zp6;
	Wed, 11 Feb 2026 07:52:17 +0000
Date: Wed, 11 Feb 2026 15:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: ERROR: modpost: "sysfb_primary_display"
 [drivers/video/fbdev/core/fb.ko] undefined!
Message-ID: <202602111543.Do4nkY5l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6589b3d76db2d6adbf8f2084c303fb24252a0dc6
commit: c5a8f13f1e476c90f4bc184a58751d3e7ff88f2b efi: Support EDID information
date:   8 weeks ago
config: loongarch-randconfig-002-20260211 (https://download.01.org/0day-ci/archive/20260211/202602111543.Do4nkY5l-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111543.Do4nkY5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111543.Do4nkY5l-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "sysfb_primary_display" [drivers/video/fbdev/core/fb.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
