Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BE818050;
	Sat, 23 May 2026 18:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779561465; cv=none; b=fC/7LBF0gePAjhnMZ0Rk/RpDFsMIfube3030TspuSn/5ZDzAMeWrwdfGMQwqrUtUK4ua95jiis/9pr/3hnUiSG7pT/82pgBwufBYXM3RTg77vk8QkuwKuHH757cr4HtPjJYyYy45ct8LRI5vpYGq/OqN2nFcZlvoPNbATxA2P3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779561465; c=relaxed/simple;
	bh=aHtHx7/z8afliz9XWaZoKp3YIE99cMa16gkYzhY18Fc=;
	h=Date:From:Cc:Subject:Message-ID; b=BlSf4iqMt566UPa1avgJeUTAFzenxp3uLLx5Ucl1H1zZkNozSUNs1zuTgiJSxpYx0z1O5900S7OcwaLPM8F0oAoqOHvbTVGVeAYCRyUx8Gl2pCSPDHMFEOFM0kaSpPo1XOlyMl26TUyIMI5G8VHHd3FawsdWyMFtZ++Slp/NlII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBU++ckg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBU++ckg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779561463; x=1811097463;
  h=date:from:cc:subject:message-id;
  bh=aHtHx7/z8afliz9XWaZoKp3YIE99cMa16gkYzhY18Fc=;
  b=jBU++ckgd9uzwQsQYD6aBidTpBoE6C9n37HLudHrJFsLe7pa1tEcKPUf
   npM41uPSXxmQk4q0TM5FdhiYshtQFfIPCPdJfiK/pzF5wYxUfKuUvjnYc
   n+aJ+NdvOwlNewFf0UFPL0BOB4g5m4c3kxdolOqBCA5v7KdqQKLiB6biA
   8pTCD6TRqWVB2iVIV7rA0nzQLeb25bN1R2YDjcw+dHwbS7Ccf5xYkvHT9
   X2aAgrsz3mTx5QsLTs/ihoVAdOgEzDt9KshVf3RDIdcNqXRzpNWqax18C
   wcpuzaO373pSQqzQX+Jq0330g60QxSOA+clAB9aJSuBFFO32J/RNA++Pa
   A==;
X-CSE-ConnectionGUID: wH8hmujGSlW80vNKeA7QuA==
X-CSE-MsgGUID: wwXttoN9SfWSyHryIK6QSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="80305607"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="80305607"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 11:37:43 -0700
X-CSE-ConnectionGUID: fd4H9sWnSyqveXuLDqDt7g==
X-CSE-MsgGUID: SjPkP/DZQA+jBxr8FadHLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="245487792"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2026 11:37:42 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQrEA-000000000GF-3V1W;
	Sat, 23 May 2026 18:37:38 +0000
Date: Sun, 24 May 2026 02:37:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: ld.lld: error: undefined symbol:
 xe_configfs_get_ctx_restore_mid_bb
Message-ID: <202605240206.0VogMTOm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Lucas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eed108edc1170404bbef9e7d0189d18a3cc354f5
commit: 7a4756b2fd0431f109b07b904a7442f00838abf9 drm/xe/lrc: Allow to add user commands mid context switch
date:   8 months ago
config: x86_64-randconfig-016-20260519 (https://download.01.org/0day-ci/archive/20260524/202605240206.0VogMTOm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240206.0VogMTOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context switch")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240206.0VogMTOm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_get_ctx_restore_mid_bb
   >>> referenced by xe_lrc.c:87 (drivers/gpu/drm/xe/xe_lrc.c:87)
   >>>               vmlinux.o:(xe_lrc_create)
   >>> referenced by xe_lrc.c:1151 (drivers/gpu/drm/xe/xe_lrc.c:1151)
   >>>               vmlinux.o:(setup_configfs_mid_ctx_restore_bb)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
