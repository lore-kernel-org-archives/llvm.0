Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875602;
	b=joRkouW8Ek0IJR8sjsLIGOhHhDxH2lZ9/CkEXoSD7hePXruWl7TbSDgI8yVSgeJnNNke
	 PmuRHXPw8JHcR1seIMpo26RNeGAUohM5dFq7cj4zWUdB457edaQ0V6XhXdaYoUf5en7nZ
	 ds+vJTv8sIkfUtggALsz0nCL/TQCOxOGGJ6m8E9JbZV6Db/9hzhE+NmOt7YC2khJ8HMkg
	 PqIT+/pWSFaP4ROXThEq8654Eg4DKtD1tNJOkEruIQGKjuhxIOhASW49pftqiTpfvEcIW
	 uBLOq1oFX3TECUBSz5orXVCjgl6Rn5Ep1+pMvmxDvxEd1Z6Xd2JoQum/1Ujx25rg9hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875602;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=EJsoRT+aFA85Dequ7VdYRVy8dj61N/k9naJ1U4hgD6Q=;
	b=WWKsFoQ3Iu285N/Im6tHuRJFNvpO9xEPC1Yt/o3ZWx5zoAV0hxCddwMdVpBXFK6OlXDD
	 zQC2O1LdiSoyZVbkxcfLLWaNAZyf2+IxpBQZa3SZqsD2S5Kf5vIYHQYfLzqVJXajt04EA
	 fclE6iC7ps45GXyStTgWtm5iNSMOCgVxRHghIDbwJyZ7BAZlkLkKHyyQO0NTB3vCAi5Xd
	 hKC9wRz2NFzu2jWVbJLgXBGuGXgEYOwUwIT6Yht3dNA7WDNOqGu/hKKveAvkQnYfUhAAS
	 pfrrlbSRGBaypkyaqer/eHsWyzFKWkCfG6gH6JGkhzbx6/HjTO3t/x96Arshhq5c25g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8x0+PFq;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4411B606A31C;
	Sat, 28 Nov 2026 14:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4411B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8x0+PFq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795875601; x=1827411601;
  h=date:from:to:cc:subject:message-id;
  bh=UGQe1PB2Uam+18b0xN23CVkLfYUuxhMpGk6EWT5dW/E=;
  b=l8x0+PFqcIiIhGUkFrDDL81HNntr9qHlr/9wuPZR023X6pfztKGm4gw6
   +o+lI+pARgY8/yz2Az59xPwmUU0OK4uHlPbDpQ8Xi166/VboaGFnWBSBO
   cf6QIAbywon2gtSWkI0q4CtWDxFxARYxpO3OcHSwVw/7z2a62ZYz6bFrA
   sIhSF0hGraQEjn/4qgJZBXQjiG4m9O/BG1ZSBEHS5YEU8b4wVJzmXJyPD
   aOTC/ldJSTC3/bXp+s+DUly1oWgW5eg0bQn3tbfw5l/pZkX01/6HFgY/0
   bmjZLqyDcxThzD9H4GajG/mPbiLePUV3eWjtkoj/xRWjnv407VrFfe2ti
   A==;
X-CSE-ConnectionGUID: zJwf7kTyQcCaX9Zwhq1QPw==
X-CSE-MsgGUID: r02OWxSdQhuJQ6RRuKBOQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11980"; a="4767332"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4767332"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2026 06:20:01 -0800
X-CSE-ConnectionGUID: 15G746GBSiKQvYICd+Jhbg==
X-CSE-MsgGUID: ocUeU7dAR6ummgVQ+oYaFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12828040"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2026 06:19:59 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXJHR-00000001XPi-07lh;
	Sat, 28 Nov 2026 14:19:57 +0000
Date: Sat, 28 Nov 2026 22:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 191/233] Warning:
 drivers/gpu/drm/apple/dcp.c:108 function parameter 'crtc' not described in
 'dcp_crtc_send_page_flip_event'
Message-ID: <20261128220726.N5tbaudU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   74341113593efea5bec6e7a775bc53e54e48d801
commit: 72151d06ba8c032016311be4ae36ef20312cd7d2 [191/233] fixup! drm: apple: Add CRTC CRC support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261128/20261128220726.N5tbaudU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a9b3c3f36e3a7aa55863319fc716f9665aa13fd1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128220726.N5tbaudU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128220726.N5tbaudU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'e' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'now' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'start' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'crtc' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'e' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'now' not described in 'dcp_crtc_send_page_flip_event'
>> Warning: drivers/gpu/drm/apple/dcp.c:108 function parameter 'start' not described in 'dcp_crtc_send_page_flip_event'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
