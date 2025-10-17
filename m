Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01367C120;
	Fri, 17 Oct 2025 01:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760664986; cv=none; b=W+bp6ja07kQc/2ZLWKbiwMHkCwW5XUFV1iAKxlt4EfHG4S1T6YdvHyLoWIXiR8/vsINiw860H6BDJb9HnDyb5pEmxmZ7lMOFStUDWR33wDp2AXArhC73v01gZycPVTceKbuyxNArofko2iI9N8t5bWWcRhQXALhULuNPL44ab5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760664986; c=relaxed/simple;
	bh=hGa/4Qhqm5+/YdjPpgl9O1WQnWazpGpJdQO3Pyr2qHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ux/RJBFXGpy0sTz5xi2m34xLH1HUBP1+phOFzSfqj0IKxnoO9k/bVBcPRn5FNJXJrC9gYGFZ8v0pFRR5TZalXhUanB7ntFivY3dVipT9APgqK8LVLZG7DsjGg3Ewy9WTdwYeTm2aB5DWOJedIWz1iGHYo0H0BQnw9EXdXdbFEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYgUpVD/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYgUpVD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760664985; x=1792200985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGa/4Qhqm5+/YdjPpgl9O1WQnWazpGpJdQO3Pyr2qHc=;
  b=UYgUpVD/+z7WgAKiZfPoWoTm3QNfobw4YVd7tBKDh8sr4+Zl8bQHtUCL
   4N3/C1NxVQsQVgaS7xDZuH+6zaRu7zBJzkH/dw3Cai+jbUE719UdDTbfU
   tlrfSz2/iPRJMcuF8ckBKjvNLj4cxyoA8UpdnGU1JF/geHKqIq8r5AF33
   BvohzucemZ2D00ON7MFlROEqfDhkq10t/Y9zEFM6+IREVt690Ys84SuYp
   k7I4Cnnvs1P3b1fpRU9G+LFFFpR/lw8sqt0JyUcI99xcv39TCQKuzBeUE
   x7irGr5zswVR23bwpE1RgCaM4I4CcjOq5BW7ikAVCWb9E07Iu1I7dOrR7
   g==;
X-CSE-ConnectionGUID: 6KPB6yXVT2iTLwxXkwvXtw==
X-CSE-MsgGUID: FAuVSwSZQH+eZM/NDsk6Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66517862"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66517862"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 18:36:25 -0700
X-CSE-ConnectionGUID: b1idJrdPR3apl8MQDLXsEw==
X-CSE-MsgGUID: +9ZaDnjMSveYBHfCt0r9LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182405787"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Oct 2025 18:36:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9ZOG-0005PL-30;
	Fri, 17 Oct 2025 01:36:20 +0000
Date: Fri, 17 Oct 2025 09:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: [sudeep-holla:acpi_scmi_telemetry 5/15]
 ./usr/include/linux/scmi.h:43:1: error: // comments are not allowed in this
 language
Message-ID: <202510170925.PJ54bBoO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git acpi_scmi_telemetry
head:   872204541d0c298cab365d5dcd343d9cdb749d31
commit: 0720599b99004ad0ec5e0839fcbefe4bdca6b1af [5/15] uapi: Add ARM SCMI definitions
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251017/202510170925.PJ54bBoO-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170925.PJ54bBoO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170925.PJ54bBoO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/scmi.h:43:1: error: // comments are not allowed in this language [-Werror,-Wcomment]
      43 | ///TODO more flags
         | ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
