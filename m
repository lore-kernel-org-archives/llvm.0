Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250883FF885;
	Mon,  6 Jul 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327435; cv=none; b=MwHx+m57yyS68RVnVo+Dkz6aY/bAIG3S8OflRjEPnVMAHQUuw/NCj/jjL2az11U0FASLSCe6fvoistvswBQpa7kPwoab+W8aljFji5cETvrmLr7q6vWRXWKROjDXTmD0RzCSjm5CAQPIgRQp31EntnhrZtsKXRyp8VDbpyZA1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327435; c=relaxed/simple;
	bh=XAMAsXPs02gyMQchHX6dDZebPujTh3S6SDoa2JuUuIM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ojLgOvgkme/XnlRuKKnmETdO7uadotMXWGcRcL/RU+0v8ffDxlSgOxGxWprgeDf5mqQwfDRXiCo4V8QOYJcdzhgoC2uvJptHRbyGk7YM5uGxrhlBK1WxjPYUZb6rS0/gT4XLgSsV8MnVP915k4k21Uq6/7HT+xmAnSrssvncqYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6xyYIvP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6xyYIvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783327429; x=1814863429;
  h=date:from:to:cc:subject:message-id;
  bh=XAMAsXPs02gyMQchHX6dDZebPujTh3S6SDoa2JuUuIM=;
  b=l6xyYIvPftkC4MMjOruCeOEenbH68FVW4cHv6KnvWQ8SeDTaxnngHunQ
   pKkyaq36YVZwfHZiSziFMvqa0n4CQSB3jrxAKhODn6rmZi6FbzASfi6Yz
   hFw+9LyP9+5Ruzx96prFlsdinFW3S3DE/VfAdGhzDWA+o8S1hHwIhTsOk
   oxy67WjpHOE7hBmVEGSsT6hJqslvTbF4wWOkCKqdLeHx+MDGjnEvfZzUd
   XvmwhmCeZIgYx+4nq7hf0Tljelj4M9GU9thiwB6mF6bp/NbSY+B3Sed9u
   x2f7CNW2f3PcAUc4izpPyewBkCcQHRF00RPNrcgWr/4syO1vmVbJ7N/Zb
   A==;
X-CSE-ConnectionGUID: GDnYLVLTQ1S1lsrjxoehRw==
X-CSE-MsgGUID: UiMFnSCKQj6E80euEoojIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83935209"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83935209"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 01:43:41 -0700
X-CSE-ConnectionGUID: 6V++fetsSe+rZgPM8gzQUg==
X-CSE-MsgGUID: zYeFXTRtRAa730DorCIHCA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jul 2026 01:43:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgevP-00000000EDX-3uhS;
	Mon, 06 Jul 2026 08:43:35 +0000
Date: Mon, 06 Jul 2026 16:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline
 asm>:5:8: unpredictable STXR instruction, status is also a source
Message-ID: <202607061644.jD93AjWc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cdeaa50eae8dad34885515f62559ee83e7e8dda
commit: 102eab95f025b4d3f3a6c0a858400aca2af2fe52 vsock: lock down child_ns_mode as write-once
date:   4 months ago
config: arm64-randconfig-001-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061644.jD93AjWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 102eab95f025 ("vsock: lock down child_ns_mode as write-once")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061644.jD93AjWc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(af_vsock.o at 1186296) <inline asm>:5:8: unpredictable STXR instruction, status is also a source
   stlxr   w8, w8, [x21]
   ^

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
