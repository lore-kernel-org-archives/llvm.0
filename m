Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5086925C816;
	Thu, 14 Aug 2025 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156806; cv=none; b=KepimUT25Rg1mrkKYfm5f+Q+jqT4RFCU1+HXscP2eZGt8H1f4Yzrko8pWvePwqpMUVL0jZ0dIh+clFhysnkSvqlSrgI5pEPLqNYM0ago8UCdbN9zOU/I9sbt4IMr8aGSLLOzpuryBuqiE0ZveO5NOQVqHX3k1cktXOrSUP3EqVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156806; c=relaxed/simple;
	bh=tCrbKjYoX/cw3WQLoIQJno+0eV5GJ3NYDXdQF6so6CM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lqrEEXOMxOnuoWZXu5Y5ZYktcTd/o1rMIr856C0LRRRUDtg+/4DRviRPPUVXphhMDJuEKyLzILQszHXLsNUkOBGa7OYiZigDsYC1QpnqPc9ZKVUfnN/LS1sgjlqgQU6o56BWqkqAFuy+s5NcN+8Se4MMPC8/tkWRiyvf8t4M73w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTk9R0My; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTk9R0My"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755156805; x=1786692805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tCrbKjYoX/cw3WQLoIQJno+0eV5GJ3NYDXdQF6so6CM=;
  b=LTk9R0My9sL8+P2+QKIQzhAEhzpoiHTiswiX6ezHmkJHRcznZP64YJyn
   x/pJ626RX8O7SWAqA6KvsNOJXKClFO2s2n5xzhxAw9JHsymE0KwCuBv4G
   zx2xLNabkRbKCtL1024y/zKYfCPO8fV5o1Y/uCyoJPqOsbl/WKC0qnkRR
   KVFY1Ge45Qq8ziFmTbA2WlAD9OOFRoIj72M7rqji7Q4eTsAxC/L+XiYw7
   D4sVg8OAhFwWOaNUUu77HXI7RDQtfWkGQJzB1jUackha48VsWaWs9VdE4
   JiBXCDPgflHq1zZPwOp2xlSTmzf6E9mG24SVSYXFrqij0ymQtK6x73KaT
   g==;
X-CSE-ConnectionGUID: XvwDb91RSbWQ3Wwgiig9wA==
X-CSE-MsgGUID: jCLzROCQRraPTu9gk+ZKoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57387624"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57387624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 00:33:25 -0700
X-CSE-ConnectionGUID: gbOjhzdsRQuLORQlCf9cYg==
X-CSE-MsgGUID: 0X8zrGF4RXSHmme8smoM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="165907090"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2025 00:33:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umSSd-000Ahi-1Y;
	Thu, 14 Aug 2025 07:33:20 +0000
Date: Thu, 14 Aug 2025 15:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Subject: [linux-next:master 2350/2527] Warning: fs/ceph/mds_client.c:2703
 function parameter 'path_info' not described in 'ceph_mdsc_build_path'
Message-ID: <202508141518.uFdkyMsT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   931e46dcbc7e6035a90e9c4a27a84b660e083f0a
commit: 7128e41a490709c759fde32898eade197acd0978 [2350/2527] ceph: fix race condition validating r_parent before applying state
config: riscv-randconfig-001-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141518.uFdkyMsT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141518.uFdkyMsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141518.uFdkyMsT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/ceph/mds_client.c:2703 function parameter 'path_info' not described in 'ceph_mdsc_build_path'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
