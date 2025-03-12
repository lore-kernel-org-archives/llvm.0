Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7A95684;
	Wed, 12 Mar 2025 01:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741744306; cv=none; b=E1DV+QA9dWlzCA4EUJwgCmn367O6Hl/nTj8doogTUPVZZrArG/hSUjq9kNEtOdU+VK7xErLCspbOIy5QZP6Udi2jrSCJBB8O4Up2XnuU9N2Cew+CGvilihk4277fjvpd+t9biE+DS27wdAgCP2CxK0kGwEJSTn6uzJvtNL25LSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741744306; c=relaxed/simple;
	bh=8tF1c0BMrEsjeXjFAL3/6gIyIoYa1c1UOXeWV20sKd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X7a8zFgPcC4zHZ6xqhTE/ajHbBI9dkTXxARBzPnuVPY3M8WljjIAKD/U8d7YuXutNBB9o1Ct8lbDB8e88i5RqS50SJH+yHJBapZiSEQOthOeFL9AWWfTu9CdNsrsPi0mEs6xwIl5Yp2NHp+99GT581Lx2koFDJUim30EDdxJ2QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDvsdfkb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDvsdfkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741744305; x=1773280305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8tF1c0BMrEsjeXjFAL3/6gIyIoYa1c1UOXeWV20sKd4=;
  b=gDvsdfkb7t2rALc5984cFQ09vQUdGItaV0WSiWe/f3zfLGIPJfmglzgH
   sv31T9/ChBBW6tU4emwhoKv5iNGJcNKw1AFGA1ymBxDjFYtwCFawhJ5hI
   ukFM1fUF3WPqQGZI1cSUklouS2JRPW05Bc8ttuPGtC+1DJiX2y9XTZ6fY
   UEoc68j2i160cq687y1J1r9dvEHgARMlMxhcqD0c+DAt6pZ3cN+zboYCb
   QJ0dKtvke/Khqj/Tr3zIOZlZFEIxHCEldoJQaF//iJL/omqnBdhgDUG9D
   UaJtNxeVG1nFBVDdsdbGfplbyZssh2kGwDDXayxwpjoGGBX4Dn8OtAS1n
   w==;
X-CSE-ConnectionGUID: Z2w6s01CTqaP5fS6qWlCsA==
X-CSE-MsgGUID: eQFmtMh8RFuN2PnU5ZbxSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54180183"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="54180183"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 18:51:43 -0700
X-CSE-ConnectionGUID: On05y0FMREqCTvuVDlceIA==
X-CSE-MsgGUID: mjFXunIdTR+yb3CIca8JXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="125521472"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Mar 2025 18:51:41 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsBFy-00081y-1P;
	Wed, 12 Mar 2025 01:51:38 +0000
Date: Wed, 12 Mar 2025 09:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Stuart Yoder <stuart.yoder@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [linux-next:master 9090/10334] ld.lld: error: undefined symbol:
 tpm_crb_ffa_init
Message-ID: <202503120916.TnY8Xobl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eea255893718268e1ab852fb52f70c613d109b99
commit: 9b2015ee9b5bba20097ea1e1f4188067624f4fa3 [9090/10334] tpm_crb: add support for the Arm FF-A start method
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250312/202503120916.TnY8Xobl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503120916.TnY8Xobl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503120916.TnY8Xobl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tpm_crb_ffa_init
   >>> referenced by tpm_crb.c
   >>>               drivers/char/tpm/tpm_crb.o:(crb_acpi_add) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: tpm_crb_ffa_start
   >>> referenced by tpm_crb.c
   >>>               drivers/char/tpm/tpm_crb.o:(__crb_request_locality) in archive vmlinux.a
   >>> referenced by tpm_crb.c
   >>>               drivers/char/tpm/tpm_crb.o:(__crb_relinquish_locality) in archive vmlinux.a
   >>> referenced by tpm_crb.c
   >>>               drivers/char/tpm/tpm_crb.o:(crb_send) in archive vmlinux.a
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
