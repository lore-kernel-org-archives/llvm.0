Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE138C1F;
	Fri, 31 Jul 2026 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785464979; cv=none; b=kZQGjrgLCdBk7W7hDaxfmL94BFcP5+4q3wzeg+G5oMC8Q5DE7AAabmBXU2bEKx7zTmB8MK5IinA1Lsaly/YpWqMYH1i3f7ATNkAXwFE1F5ESW+M0QiS7mnRi4g/xbKsScJOuANumcKBt+h4H4lUqlxq3KPOuEDs97w0isvWiP44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785464979; c=relaxed/simple;
	bh=qqR2lcN/cd5hMGFxtlebkULzgYxBv6yaEt+GJ3jks58=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aIxrtMncjetc/1tsMuY9bP+4LFdzUivcrHRqd5dRQZYuqp6ALQg0gGMeH3jCZSA1cB9ulf6sTRLJxn479lInILo9EozfXChh553lLiZjnphixd8C5BmBGotXKznUt+JCqhNX5flVYN6FDRb6/XLNapey8arzYf/cu3GEAV5p4rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMN7v7mU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMN7v7mU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785464978; x=1817000978;
  h=date:from:to:cc:subject:message-id;
  bh=qqR2lcN/cd5hMGFxtlebkULzgYxBv6yaEt+GJ3jks58=;
  b=mMN7v7mUS9pYqiHTDFlVSXuWiUwPYpKKulEClx346E2m4O3EJlTCFjLQ
   c+Hg5JFYUued9jtpxOOM2Qqk2yzcYgV+acJ81T/v7GoxvP/sX8PBO/3Ek
   cxm+GynWy1KPs/XaQNeSOdd0V9ip3w3Kx36QyVpL0CUh/yN35LQENhCK2
   zNlBQ3m904Jwk95TsSztlce6r0uACQhXZx595GW2GlD0Ox4Gpzn6NikMf
   KvOHZzu2zl4Zndq9OGlXyZ8s3hjlvDr9X/hqqDSUiDNr/98YfT5NcHhuS
   FHsvFBmDbBNSfFEfpoq8yveTnNKjed2vJCeFB88v1jjO3gY5XYxkUeaAq
   g==;
X-CSE-ConnectionGUID: ivVEcQNiR2yItX8w/ghByg==
X-CSE-MsgGUID: MKAaJ1q6T72gP+sgO+K4/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97465468"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="97465468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 19:29:38 -0700
X-CSE-ConnectionGUID: hULPKEfbSB6W9+Q2/UhWBQ==
X-CSE-MsgGUID: /UjXZTV3QEOlqGtEMEdRIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="256150035"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2026 19:29:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpd01-00000000hpc-3B81;
	Fri, 31 Jul 2026 02:29:28 +0000
Date: Fri, 31 Jul 2026 10:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 John Johansen <john.johansen@canonical.com>
Subject: [jj-apparmor:apparmor-next 5/8] ld.lld: error: undefined
 symbol: zstd_decompress_dctx
Message-ID: <202607311033.uUUNjZol-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   9e4c1ef73b4301c5f9dc918982dd4f1ffb3e1052
commit: c431011ab65fd4ef205e3ce8cfc4b031c67768d9 [5/8] apparmor: replace decompress_zstd() prototype with its entity
config: arm-randconfig-002-20260731 (https://download.01.org/0day-ci/archive/20260731/202607311033.uUUNjZol-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311033.uUUNjZol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311033.uUUNjZol-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: zstd_decompress_dctx
   >>> referenced by apparmorfs.c:506 (security/apparmor/apparmorfs.c:506)
   >>>               security/apparmor/apparmorfs.o:(decompress_zstd) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: zstd_is_error
   >>> referenced by apparmorfs.c:507 (security/apparmor/apparmorfs.c:507)
   >>>               security/apparmor/apparmorfs.o:(decompress_zstd) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
