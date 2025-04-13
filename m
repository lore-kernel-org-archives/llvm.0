Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D852F196;
	Sun, 13 Apr 2025 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744525259; cv=none; b=Xk6pVDTN1IQ9LbNaRhmZUWyfiT0DbIA2UmePRWY5bLcIOa9jjzbS3Gxod6Cd2VuYCOP4K3vWJzIVcedWqvLQW+OLfBwYpkwdWgBJUz3sYiNXlTysCCPohHJlhsuYyZ5YaaAljTtH8nKBfL5q6B7niuPFQIogTA+yb/XQQ/Dpw4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744525259; c=relaxed/simple;
	bh=DOuccFwjx3DtmFeb6i/UK1FlO9LzVaJWlKYk6DXOYH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HNdggjwD6j+9AG0TtL40Q7h7o9bgBA0qLyhk5I5566Wf/0V4FtGdBatWGBPqs9oWw2ZGLhRQKBjvzIvLo00oc9db/g3K0p+UB123mWFgotrRKIp+CI5BoSTXC6M59VFkB5340o5lXQuCd1zdgNIUunEDUTZ/xAQcVjrrIZmbbhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0MugWvZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0MugWvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744525258; x=1776061258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DOuccFwjx3DtmFeb6i/UK1FlO9LzVaJWlKYk6DXOYH0=;
  b=A0MugWvZ4FFpn/ceqKGHdFWAfnCMqQJz79sdK0dL1Oyq/H92LC+PDF1J
   i2uz+BznCZ+CelYVNHaraZKoJvfg9VGU0D2To+/3kOhY4MbJ/Jt2OlERI
   8YgD+hAwEXgbtUgcUWCSFX0Wmr1K0TZa/u5ozanXWcNdbIPlgPGfIPLWG
   yGRBUz3igCg3uQOxAyoxyYNRtJr/1NEl66O3hv1YsIMU1EJR0l13UmO4Y
   yKBGPVQn1KGzZHvVRqXuA9rReKbRC28kYkPZdq22Y3CeQy2bv+NdAXVBD
   6IYwRZHdBClnkS9uyuX+nhzBAut6Jux8d0hfr845So5lk7jlQ2yEAlVU5
   A==;
X-CSE-ConnectionGUID: KQMNQOmUSzyCoiBdBp/shQ==
X-CSE-MsgGUID: iDVXnbu6TcywAMRMINwwEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46188469"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="46188469"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 23:20:57 -0700
X-CSE-ConnectionGUID: nrxS57nhST+J5tQs2pZmxw==
X-CSE-MsgGUID: xMsMr+QsRDy2v8Ye+KO5yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="133642443"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Apr 2025 23:20:56 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3qi6-000CQg-0P;
	Sun, 13 Apr 2025 06:20:54 +0000
Date: Sun, 13 Apr 2025 14:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/x86-apx/v2.0 17/24] vmlinux.o: warning: objtool:
 dsa_switch_do_lag_fdb_add+0x8b2: stack state mismatch: cfa1=4+752 cfa2=4+552
Message-ID: <202504131415.qbvnG3Wy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/x86-apx/v2.0
head:   a8369a4fc596b6447e704431e54db866854ac7b9
commit: 1d76a2141887d4c32a7e02bdbfda7f61c8670f78 [17/24] x86/Kconfig: Add Intel Advanced Performance Extensions
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250413/202504131415.qbvnG3Wy-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504131415.qbvnG3Wy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504131415.qbvnG3Wy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: dsa_switch_do_lag_fdb_add+0x8b2: stack state mismatch: cfa1=4+752 cfa2=4+552
>> vmlinux.o: warning: objtool: dsa_switch_do_lag_fdb_del+0x918: stack state mismatch: cfa1=4+752 cfa2=4+552

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
