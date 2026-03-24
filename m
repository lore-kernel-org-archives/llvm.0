Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C9A2D5950;
	Tue, 24 Mar 2026 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344787; cv=none; b=Pq+2aO+QRt/y6fJUx4xLXODKsOGbSaoUb23lC5axF4huEtdcpPO2469DLzNBRSi3DNRsfKyL0aigaUVRzpi2byTqir5b0PKgTLCULiiFhrGQ/GIskFNe18HAv9tKz3lJhS6QaWfRLAlKgtlzQKVM5TKG1wrcxmAYIpg5kzWMUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344787; c=relaxed/simple;
	bh=Ffayi0SqMNCb9DOa79vnAqKEz6MccYYxcrJzHKDPTCU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bUtxAetM3qjmKWita6dS8DGztkugqnmL+oi6MNOoeZPQnakJY0kM7feDdhVlIVcRQ7Mm14OeO1o4uElc06u7rFqVU7/Ssax3j2/5WedVLdvwNkqlNit1EK6EmU5lAsPBdqeaqMjXbXChQfdWQQIondLj44hXUli4zweJw0yu7IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxA01YT/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxA01YT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774344785; x=1805880785;
  h=date:from:to:cc:subject:message-id;
  bh=Ffayi0SqMNCb9DOa79vnAqKEz6MccYYxcrJzHKDPTCU=;
  b=mxA01YT/RjelrbsUhvtmu46RpUYj4SgW+uNB8kHLjA9LMLUaeS1adpXy
   AsmtCgHBGiQ/7m27XsQlhjjniZvGb5qBXi9kqEYXHwgEKV8o+6JyNJ9i1
   UMtzPRXijxMvxbkXmc3FRs3xp3VZ3uRbAl1W9IzsmQSFdIYGBERYtcgTs
   yx4bglmgW+MKk7AkRGhOSYVdqxUZgNvheF0a0LyUfa1VEodCx6uiVjSS0
   AxmwfJ/xjNXXdMjzLDscQ0VdQCt2DUcJW/gXr5WxAf3xXyfk3c0eBTZRA
   L704BOXI7l/bpLGfdUaPkz9vtM/7+v3Bpt1OecI7E205YgYnmpKxWSiPx
   A==;
X-CSE-ConnectionGUID: o8dqHdDsT36wnFpXpikEfg==
X-CSE-MsgGUID: 7Vc0aHptTPO+YhBIhlXBWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75424972"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75424972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:30:49 -0700
X-CSE-ConnectionGUID: BRyZGB+2Qy67TXYzZrhjgw==
X-CSE-MsgGUID: x6lvRXSpTV+2BsnAdrGZeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="225945166"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Mar 2026 02:30:48 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4y5z-000000004JN-32XT;
	Tue, 24 Mar 2026 09:30:43 +0000
Date: Tue, 24 Mar 2026 17:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 34/42] vmlinux.o: warning: objtool:
 netfs_prepare_write_buffer+0x974: netfs_wait_for_encryption() missing
 __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202603241714.HznaSXs5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   ae7ccdf83025020c44837849de26fb4546fbf825
commit: d045bc8a941a2f79f07a9d3fc62b3596fa4a4326 [34/42] netfs: Perform content encryption for buffered writeback
config: x86_64-randconfig-006-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241714.HznaSXs5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241714.HznaSXs5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241714.HznaSXs5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: netfs_prepare_write_buffer+0x974: netfs_wait_for_encryption() missing __noreturn in .c/.h or NORETURN() in noreturns.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
