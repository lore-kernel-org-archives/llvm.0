Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A02B3403F2;
	Thu, 28 May 2026 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995163; cv=none; b=fc01gEESRw0nr/rMekVBK6gC24uXoTvIjzrJVvdq6kp0ewuSbWx2R66ZaYlEu9VvXDG2PgQB4MdJX9SS+mpIzDJDZ7g+qjkgT0tkLhYYIzCQR4EI7cfmgCk78N8tOUFJkOCCLz+8NpMNa10e2eb2sgNHqXxCitOX3D6Te7ACBz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995163; c=relaxed/simple;
	bh=anQ8OJT5GTv0hVKtaWQt+naWkUEdz19IAZ349SGU+4M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dBU7DCVRxeGGGT7AenC00NMdA1rwJKkDyBnTvtwIdttCu32qqmM1b3AWrkBbvcMFBAvFw51LL9O8NRgQZWTHx0PegoPOWxebbg3F+xG8Jypd3aC8/6hLlv9RqTF3I80wFhAQStfR4nuTojFTNc5n4ZFZ2W/raW9KcNvOFpglv04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLTregCZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLTregCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779995160; x=1811531160;
  h=date:from:to:cc:subject:message-id;
  bh=anQ8OJT5GTv0hVKtaWQt+naWkUEdz19IAZ349SGU+4M=;
  b=WLTregCZa2ZUxICbAS///8FuDkeNI3h9DAra+bI8K2n+9a54Vk9P1uoG
   fg3d5v5eU1x9lwGm2EkiV+liZxWwuSSaR0JgqkzB4Pc/zs24zp6DB6D8P
   qpUqi7yRt6JKvnrkXlgz2uyU2yng09+yeabZ3U3hWyU5MSP1fPc6zsg4b
   8r5Rh0T7sSoFov0aC8qbNl0oge2Pz9CT7BIlkKhxkXLHty3sfQAxJfUhj
   aSXBN9Wy3FXdfmfpU7i62uQwJnCj1qomSQIp3uv3zG1SPLjG4jR4pg42d
   wlGzT65YAIk5TS6RaVEho3OTJpZh0VWxX8S94+wGYQ3UQbcuk8qqXYQEr
   Q==;
X-CSE-ConnectionGUID: ek0WPorpRdOFjPyItNY/oQ==
X-CSE-MsgGUID: mslGfxhATeuLgOnxbVofgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="79994519"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="79994519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 12:05:59 -0700
X-CSE-ConnectionGUID: 8WpzH+ZaR4q27p8Xl11AAQ==
X-CSE-MsgGUID: so02ljK8TSiSetNAqGKXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="242789558"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 May 2026 12:05:58 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSg3H-000000006Kk-2ucr;
	Thu, 28 May 2026 19:05:55 +0000
Date: Fri, 29 May 2026 03:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 20/26] ERROR: modpost:
 "from_mnt_ns" [fs/configfs/configfs.ko] undefined!
Message-ID: <202605290308.MPMO0DbP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   ef344c27d4d9d0e8ba46f599a08ab287a95e132b
commit: e5d46cb06d256eea6614d4e022faeafde94edfd7 [20/26] fs/configfs: make configfs namespace aware
config: powerpc64-randconfig-001 (https://download.01.org/0day-ci/archive/20260529/202605290308.MPMO0DbP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290308.MPMO0DbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290308.MPMO0DbP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "from_mnt_ns" [fs/configfs/configfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
