Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0851FDF87;
	Wed, 16 Oct 2024 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071366; cv=none; b=gZFfs7P/w+ovocKCSTn4zyLEqfQEdbX6LtRHoTmNM5F+WeoPeO6lk0T4tA03lgwXRq0+qyXhHIe1Os8Ht7eOqrVuhrI248lOT8/Ww1fSdOq4EC7e+M83K051semb1Ayx1mx6mdPk6mLA6cUAu9B8iEUpGA4qwlnTi0ADzjovFto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071366; c=relaxed/simple;
	bh=Yhj6cd091kQ/pOwqBFbNErCYqoedpgLs45KQ6TSbvP0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hi43fcC9PMbMwrVPu5z7FzjO9tjB1C21YVunsydC3aBl5zt6E5xWKiky+zfMgi8E9U5cbHRmFCZW0hJW0ZrytqJ6QYHcC0U03N5E9OA9mDtT8SAHClWxK/CxSaRoEUvV2JrXquEZGek6gngpyEjat+2iomc+53OuemsfnjBmRPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0nQKbje; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0nQKbje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729071365; x=1760607365;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Yhj6cd091kQ/pOwqBFbNErCYqoedpgLs45KQ6TSbvP0=;
  b=G0nQKbje76fmjUfc9Wg9pfuzqSvwGja/ENi/1CwAjl9ITPRSpkvGKBlY
   JVKxA+M958ZaGRe0/xKcVkaRqsk5lAbfTebsSSsZC1lpu8erUMHfKbVWJ
   +hlnNAeqA0EhAKCKdSY4LFw0D5yqeDjn9vv2wtUfwnpdgw+Jykx07cp15
   BOCyxm0BTo8ZEqE8bcaBvID9zWZxvgNtHu34qj2bn8ZWBD7fpgeDG/Wc4
   d+mjAqeFlqGY+SIQR+XUOihFty3MkzizcbVKwxFh+gMdYaZN/EZ4Rdfod
   6wLk5KdTXVOWyNy+LZoM3wbCnS6VRatCxH98ffskOxG0VktEAjGDWWQC0
   w==;
X-CSE-ConnectionGUID: OmoaRT14QXKDWk4LQi6Mcg==
X-CSE-MsgGUID: lesV8+rdQJCZKu1KYuRz7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="31376578"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="31376578"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 02:36:04 -0700
X-CSE-ConnectionGUID: aS1IdZqbQW++Ly42c+pkXA==
X-CSE-MsgGUID: QLHPNtTJQUS/MZnqiNr8uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="115618430"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2024 02:36:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t10Rk-000KhH-2b;
	Wed, 16 Oct 2024 09:36:00 +0000
Date: Wed, 16 Oct 2024 17:35:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 1848/4954] vmlinux.o: warning: objtool:
 hid_open_report+0x849: sibling call from callable instruction with modified
 stack frame
Message-ID: <202410161730.CRySyFey-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Benjamin Tissoires <bentiss@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e7d45e786a62a211dd0098fee7c57f84f8c681
commit: 2370acea1fa43deace47467ede6c400a4640d224 [1848/4954] Merge branch 'for-6.13/bpf' into for-next
config: x86_64-randconfig-003-20241016 (https://download.01.org/0day-ci/archive/20241016/202410161730.CRySyFey-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161730.CRySyFey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410161730.CRySyFey-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: hid_open_report+0x849: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: hid_scan_report() falls through to next function __cfi_hid_allocate_device()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
