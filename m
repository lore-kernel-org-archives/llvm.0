Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D761C5486;
	Fri, 21 Nov 2025 00:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763684685; cv=none; b=AMQWllpyQzy+DB5f7tQqpr1MlPlR/vmCG01oZMqf4RzZLSQcP0ordouL0Pklcvjvtjg3YjNciiK6I5sImAVv/4Ho+SCSCVNmG5YcfdRxcbw+lFSZvv1KyRStVdhFiDkN/mTSyVisW6iE4B5FSGNjr54aq1AKZOP0Qwl1RJKkuUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763684685; c=relaxed/simple;
	bh=tWf6KhCttKSc09r4mtwHfsRKdq/7gQZeSBKAk/845bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ftBMFxr21frtK+TSkPdzWiFQ7dkyE8ww6D3hrPZRcp+Y8zm0czhtt9duV+3YuQAjOrbgSkTBbDhAf2o0B9DwGTEOON2+JfcFj6bBreqqNx0kmGq8HX+ZfrUiKX8BCWyCjvbmoXyIIEtMRG3SSSkpxwZ+NFGZ6Ai9dFJ8/8Trckg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4zKMvoB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4zKMvoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763684683; x=1795220683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tWf6KhCttKSc09r4mtwHfsRKdq/7gQZeSBKAk/845bQ=;
  b=d4zKMvoBv0UkUyUUZ0LpRhuMaHkcgF0U2d8leMGI+hqn/jwN97X123gz
   K0MnN3F3mXiHGfATQF7OlTUx4nBaj+hNo7UyOmtTL0l+kIfA7QQ8ViLio
   fw+dGvF6h3PBpmtACq4aggsj3TW7OR2hhS9n9h/o7ayGMlRM3Mb/6a8U+
   YiYVZLQNE18gWkaDeqH6GdIv5SEqAVQzs9EHdESr5E894Bi6ReYnUM/pk
   nq9Mtx/rf4WSvpIucNWLS3y5Qyz+M+aWtcYwXldZOdmfoLZzA4PcHlAtc
   nHT1Hq37pq0AkmsCA6opDNdIZsyErAr8Bhlm86+eJzdznfg+2KFwH8G++
   Q==;
X-CSE-ConnectionGUID: xtuC5UbASzyXXQ8s0zWMrA==
X-CSE-MsgGUID: mgXz8Xl3RYSe21lR0LNxCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69639167"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="69639167"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:24:42 -0800
X-CSE-ConnectionGUID: 8f7zvzPhQH2LokaVH9L+Uw==
X-CSE-MsgGUID: Kgg2vUrpQwWxtzOFIHSnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191213992"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2025 16:24:41 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMEx4-0004ks-3C;
	Fri, 21 Nov 2025 00:24:38 +0000
Date: Fri, 21 Nov 2025 08:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
Subject: error[E0609]: no field `parent` on type `bindings::device`
Message-ID: <202511210820.iEznWuEM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: c4f8ac095fc91084108ec21117eb9c1fff64725d Merge tag 'nova-next-v6.16-2025-05-20' of https://gitlab.freedesktop.org/drm/nova into drm-next
date:   6 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210820.iEznWuEM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210820.iEznWuEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210820.iEznWuEM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `parent` on type `bindings::device`
   --> rust/kernel/auxiliary.rs:307:25
   |
   307 |             (*adev).dev.parent = parent.as_raw();
   |                         ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `parent` on type `bindings::device`
   --> rust/kernel/device.rs:76:48
   |
   76 |         let parent = unsafe { (*self.as_raw()).parent };
   |                                                ^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
