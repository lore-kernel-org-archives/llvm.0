Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8717352C4F;
	Fri, 20 Mar 2026 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037177; cv=none; b=fqZsz3wizxOfGdC7BI7YkWQa2zfj29DcQWWGatlDFcL82tSVMttCsNd/0xyid25yE9FrjbhgIUJPEt626PW8m9ODiWiyn/QDdUuFgaiF8dHSxh1nsqgogNxX4nXmkY4mbkb6PRatr/g0Q4QbSiHT9PtooQsRXQf1R8JA2wnlnlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037177; c=relaxed/simple;
	bh=FX2Q6JyLxLWKr2f/WdgkLQC4tVQUKlrDxz8SR60sze4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p7cmQp2WheiRYnOHZrxdyuUvcdPjv8VT66GQCivEVJ+YEKyGmHj2SX3kGkn1PsGeyTcZK1CvFAp6slMHr15P8BEFBy74fV9G1KxDpdvZnAKHq4kVEH7APPBH3Z30Y9F1CPK+sOX9Z2Y7TfkoxE6ib9mK0oiCUteEx//a3l2iODM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOEivvCD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOEivvCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774037176; x=1805573176;
  h=date:from:to:cc:subject:message-id;
  bh=FX2Q6JyLxLWKr2f/WdgkLQC4tVQUKlrDxz8SR60sze4=;
  b=lOEivvCDwWpHUyU5as82jOoUDAIRmTtRtCcMSHadQcmxjc+VpOtqqUOZ
   aRIN/5VvOqL5UAKMXXP2Y8jD4b+v+JllkXAS4+oEphPfHLVKpAL/XqaTA
   0YVwj0uhY82mhh5ylbqZeSrctPyZAYaeLtH9R75mL3YiMXsgHXSN/Pgt5
   S6MJx34fFdFZxXqHqSzomlJKEQsW2QfuZFiOaFVdqT2tBCzOtSSJ90fKQ
   EUUIFDp9ayFVwG08FiOoTIKsGHj4vYFteMRqR1r97iLxP11RpJGj4oUtO
   e7RfH1r9zq2sLKxa8J1+ERJiC6qZ+GAzH6QBwg44CbV8o8HrVuReehjnX
   A==;
X-CSE-ConnectionGUID: TQJnr1/1RBKPLEayIvHINw==
X-CSE-MsgGUID: EguBKsjnRIasx+VeGVxWYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75099716"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75099716"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 13:06:16 -0700
X-CSE-ConnectionGUID: BBODMZAoSm+8DpGGyP8b7Q==
X-CSE-MsgGUID: CDNzfrd4R8uk8BZPcuZRPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="228323068"
Received: from lkp-server02.sh.intel.com (HELO ef9b23065726) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 20 Mar 2026 13:06:14 -0700
Received: from kbuild by ef9b23065726 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3g6D-000000000A1-0TCI;
	Fri, 20 Mar 2026 20:05:46 +0000
Date: Sat, 21 Mar 2026 04:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:dhchap-keyring.v3 4/8] ld.lld: error: undefined
 symbol: nvme_auth_extract_key
Message-ID: <202603210330.k0wPRtgU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git dhchap-keyring.v3
head:   7ffdb5e32339cf1e1ba50b8caefaca6dbab4d882
commit: 56494fb17cb0605fe7b0f49407538715a2fea547 [4/8] nvme: parse dhchap keys during option parsing
config: i386-randconfig-007-20260320 (https://download.01.org/0day-ci/archive/20260321/202603210330.k0wPRtgU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210330.k0wPRtgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210330.k0wPRtgU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nvme_auth_extract_key
   >>> referenced by fabrics.c:1097 (drivers/nvme/host/fabrics.c:1097)
   >>>               drivers/nvme/host/fabrics.o:(nvmf_dev_write) in archive vmlinux.a
   >>> referenced by fabrics.c:1112 (drivers/nvme/host/fabrics.c:1112)
   >>>               drivers/nvme/host/fabrics.o:(nvmf_dev_write) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
