Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751F81FBCA7;
	Thu,  5 Mar 2026 17:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772732135; cv=none; b=Pe6rKa3aseGXW7lVxC5LIkw+0Ev+Shd6tvUEswNCOq4euqWoKIoszcvxBs6qscXc8DR89TXOnDV0GujBAZVR053p10cxEhwhFeqLbpgqI7hNtIwImMe+qojh4tTJLSZu3gCg8mbRCWugIOwCSE0Vvs9YVa8p/btLJLtFLN9F9ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772732135; c=relaxed/simple;
	bh=Rmgc5Xvk/4oOPIWh07x9phi9VRBivgu2iCU/C2I6yBA=;
	h=Date:From:Cc:Subject:Message-ID; b=W9mGoj9guaotjwgbKi97HMTRKH7LtUvUho7C1nXeLImsz5lNvU32LikcVB0pDQOTShFjZe8STS4NmEfr+ulax7PHkjnk1uSV130aY+Yrabw0cVpaXVJhhdF5G+/kitSQI59D3Lqg/l9LoACbaVg2vGHzJnVByfwLMq66LTe2ivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mCyRLDvQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mCyRLDvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772732135; x=1804268135;
  h=date:from:cc:subject:message-id;
  bh=Rmgc5Xvk/4oOPIWh07x9phi9VRBivgu2iCU/C2I6yBA=;
  b=mCyRLDvQ8xeyMl38mC3iSpMdwQyWmIO2s6sNpaRobKMv6kDlopgflLnw
   vCd7JEPB3ESCvZ6g38lYh7dM6/8fJzRILsFe2ocFbewOU+saALql5w0nY
   cOKtSpBCwKkcNU5Q6zNd1byilGqQJ7BQdxr84o45rs4H6ticSoJcOLltT
   ad8L7oYbVvVzJwg9GBJvaKLNaUkjouOCBFHEMlnl3inIhLrSMFpehZwDy
   Qz/XE1NuiIDt193ENgTqPCmNQzQ8ZzlyDYudDswoFgqvWI2bpV1Iim1iA
   3kEt+OJeaNA5vqw48XW1d81KlQ8r8cOBRErBzakm0jOVJW6vvcOHJ/waL
   g==;
X-CSE-ConnectionGUID: nJ78AILBSWadiGcXDZMriw==
X-CSE-MsgGUID: HP0LE9wESiaAu95eZh4zXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="96446712"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="96446712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:35:34 -0800
X-CSE-ConnectionGUID: ZbAlT9xXTKy68JxHW4mXqQ==
X-CSE-MsgGUID: bxhRRBLUSqiByLdW/MUClg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 09:35:32 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyCbi-0000000011C-1S5r;
	Thu, 05 Mar 2026 17:35:30 +0000
Date: Fri, 06 Mar 2026 01:35:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [axboe:rw_iter 351/467] clang: error: assembler command
 failed with exit code 1 (use -v to see invocation)
Message-ID: <202603060152.6BlNBIi6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 6fab61a5255761dcff6b35d0bd2a156e6029efd8 [351/467] hwmon: pmbus: core: convert to read/write iterators
config: sparc64-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060152.6BlNBIi6-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060152.6BlNBIi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060152.6BlNBIi6-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/pmbus_core-fe38f0.s: Assembler messages:
   /tmp/pmbus_core-fe38f0.s:3: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:4: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:5: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:6: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:7: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:8: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:9: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:10: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:11: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:12: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:13: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:14: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:15: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:16: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:17: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:18: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:19: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:20: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:21: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:22: Error: junk at end of line, first unrecognized character is `P'
   /tmp/pmbus_core-fe38f0.s:23: Error: junk at end of line, first unrecognized character is `P'
>> clang: error: assembler command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
