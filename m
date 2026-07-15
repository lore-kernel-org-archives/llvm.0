Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049782D6E64;
	Wed, 15 Jul 2026 21:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151652; cv=none; b=b8gUCa67QtsgQOuuiPTo6+uNTHD1bHTMjox1Z2Mw01+GsATEiVPvmZDOLQ1TeovtBnhyaTPbwaSlQM+7/KWtNP0QcAwwhYIYUhBB0R2chW2E2Od3cVfdnjSlSfqsEjFntU7wXtQKbNc8AQkY7IP0xvKqy3XcsqfDiLWaztqTRvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151652; c=relaxed/simple;
	bh=tkhVVefCPqJ5tScp1KbZWc7Atmy844FNxHFY1z/LQQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n1ippF/aue2+5mvCKKK8qf53ZJSWyBPUuQyT8KLyKNeKwvoZtL0XPhIn6TQ+8RF566iPYSuRMwlZK5nwmZC/R9P/e4WdmBLy0aN81KaPY3NGB1DpZaFau7UwV4NOjbKg76UyGMf1iNvwoeADHOwSUtZWbMPp12g3Bj40G1p5+PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gif009dd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gif009dd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784151651; x=1815687651;
  h=date:from:to:cc:subject:message-id;
  bh=tkhVVefCPqJ5tScp1KbZWc7Atmy844FNxHFY1z/LQQo=;
  b=gif009ddRA3uWkzhLbqwbIKPpNp50nRsLic7wOnYLWwtrVUGvVyljKjG
   SfWi4m3q+wDEQ4ngnjgyzZi0jPVTFoQw7N5/b/VfGQJn4mUOwcCKVZ4Jj
   zqAo96upv7Za/rBjxIZFHp1m0mNqoZYqa93YRzFzm6pA+y5krbG7uO09l
   LgEyVR9xJYRfhiM3bZn5BR4NkTjlSbQuGghLepDM34uCCdARgtWLNOhgt
   pgluSSWJHw5vt1FDm0CRRYr69Q27plD5j+5qP4rbtvJlM6USF1t1Cv74V
   8obc+JS96OtMawpUmnJ2oEBHE8kddD2CqyFNDuye6kYGJO1z2sahMFiEK
   A==;
X-CSE-ConnectionGUID: I5pAad3DQOO2TWlfp3bGJA==
X-CSE-MsgGUID: 47LdjtocSNejV8P/FG7jOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96319750"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="96319750"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 14:40:51 -0700
X-CSE-ConnectionGUID: Wk053MJBSWOGnCaBWRbNLA==
X-CSE-MsgGUID: dIyV8pXQS4SlbnZ9TQa8Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294528595"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 14:40:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk7LS-00000000O1W-1S9i;
	Wed, 15 Jul 2026 21:40:46 +0000
Date: Thu, 16 Jul 2026 05:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [geert-renesas-drivers:master 4646/4880] Warning:
 drivers/scsi/ibmvscsi/ibmvfc-core.c:4942 function parameter 'protocol' not
 described in 'ibmvfc_alloc_target'
Message-ID: <202607160546.9qT6UbFy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   cbf4a77e77ce7c4a2907a798c7f624dfaf65da57
commit: 275460787107280d4e1f7946d6d17ea070780cef [4646/4880] scsi: ibmvfc: Allocate targets based on protocol
config: powerpc64-randconfig-002-20260715 (https://download.01.org/0day-ci/archive/20260716/202607160546.9qT6UbFy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160546.9qT6UbFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160546.9qT6UbFy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/ibmvscsi/ibmvfc-core.c:4942 function parameter 'protocol' not described in 'ibmvfc_alloc_target'
>> Warning: drivers/scsi/ibmvscsi/ibmvfc-core.c:4942 function parameter 'protocol' not described in 'ibmvfc_alloc_target'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
