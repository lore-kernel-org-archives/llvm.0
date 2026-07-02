Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B016B34388D;
	Thu,  2 Jul 2026 04:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782965357; cv=none; b=sVx1EVqoyyz0XnpikiIVMPohSqKZxX+gC6ssjepywyHbMlYxYyritNTuJQRpHIKWtzoGB0arHfQOOmge0RY11xvCzcYgK9nDZhgvC8kB0hKxXnnZs0DHmcEYNh2O29uiirOB8D7Pf6qsVsu9twwoc3V+dTzThgC4DgR0dJZHN0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782965357; c=relaxed/simple;
	bh=h1+6yqj0R8F6IQ/OPuARtslnjE0NHnS4aU50DcFrlU0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PfteXgv5SpVScMc2fdW3WbgHP40moW8e6BUrIx2gWrlwomELY/XSFleRyu04yy/DaJroBaNVi5GshWu4RtT48Ovs1Pk9SLP+7NotAhPtmEwFtJK/S792cERR63gKaLP7LJxXVmfjJtGNm+sXFh8kqsMD8yXgCQQ9bcS3dJMffII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YhEBVUsY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YhEBVUsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782965356; x=1814501356;
  h=date:from:to:cc:subject:message-id;
  bh=h1+6yqj0R8F6IQ/OPuARtslnjE0NHnS4aU50DcFrlU0=;
  b=YhEBVUsYutc25m+u+QScYrMXV4mEst9VQLCNJF2+po7r34Gjj4Ik4/zQ
   C3bVdimvtiv374Zh7fzNjjRuTWOUpXoHkylgF073Lx3U65SlN/512a+za
   MkbAG8B/f4ahilfoq/ZaeCFLuJbEd4WoDUmZ5utpVfkIF8oKmTb4A09J5
   v9Xnr2+ogV/XXsCSiY33mB6oqk0BW8TOMgQ8L3x9coC2+/6AInZCiAfH7
   yyXbkVlIN4yWxXjizxb32tKaXgX2dplAOeyI6OZef9HtzqwNQz9CRf3te
   pI6+qvJWGf7FlQbdwYgGxZ5O1RZbRnMq2NvurVvFfHbp/fF5V5B0iovIE
   g==;
X-CSE-ConnectionGUID: R3ZM30vITkSndm6E/X+goA==
X-CSE-MsgGUID: BH71ss4mTp6HAh5imAHBxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="106501716"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="106501716"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 21:09:16 -0700
X-CSE-ConnectionGUID: EF1vYp7HRGm4uncoggisvQ==
X-CSE-MsgGUID: 4aFK6aqAS5KPlIYNBhHvfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="252311206"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Jul 2026 21:09:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf8je-000000009yZ-30Ra;
	Thu, 02 Jul 2026 04:09:10 +0000
Date: Thu, 02 Jul 2026 12:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_scmi_pcc 22/23] Warning:
 drivers/firmware/arm_scmi/transports/pcc.c:61 Excess struct member 'shmem'
 description in 'scmi_pcc'
Message-ID: <202607021259.T67Z9ycs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Sudeep,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   bdcaa5728f17002c1091efd93dd082c9c23ddd39
commit: 3527482b5aac070ec7c5ef2b085567c531a5991e [22/23] firmware: arm_scmi: transport: Add ACPI PCC transport
config: loongarch-randconfig-001-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021259.T67Z9ycs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021259.T67Z9ycs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021259.T67Z9ycs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/firmware/arm_scmi/transports/pcc.c:61 Excess struct member 'shmem' description in 'scmi_pcc'
>> Warning: drivers/firmware/arm_scmi/transports/pcc.c:61 Excess struct member 'shmem' description in 'scmi_pcc'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
