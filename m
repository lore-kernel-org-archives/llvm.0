Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6A014B08A;
	Wed,  6 May 2026 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778055920; cv=none; b=AqgJhJeU7YStxVDczoRGI9lf6Vl7eOcVaZv+faFqfunmJ8N/dvTM9tPym+EEwiSLcD3S7XLgfE69DwbhfiyLaLb1S4PE/n5ZwpguFq6FeJZo3AxyIPQBUFH9KIEnCloHwTFn3rL7cK84OGMGV4kAJBVJlcMHEiiQ9Ueqp2hHWYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778055920; c=relaxed/simple;
	bh=b7kzQ5q3oRPlmU+6fpkix+iXMnYQkTEzOhESLNazfX0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=heucQUl3cbRk8HvssXcjHrIne8Og/8/Ch37yNihiam1BsIR+u0Elo8JhOveNWG3+KyExZkNc7fpfkoiV5ezCYAUBiBTmBk2FcKQeWvEjm312AY9D2o+uqnPD6dJ9w3gav/QwLAcKYnb/BO1hlBsLN2vt8FV+Vw3Smj/vup/eeCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVwMLNEz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVwMLNEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778055918; x=1809591918;
  h=date:from:to:cc:subject:message-id;
  bh=b7kzQ5q3oRPlmU+6fpkix+iXMnYQkTEzOhESLNazfX0=;
  b=lVwMLNEzJAh3js1OEv5yBAuuDtPidK0FjKeU08s3bHq5hH+I8f0dLgkv
   cJYlxTqGKG1SnOX4pMog1J1L9ufiRiL04WnurRWR0R4zRzi8Q47creMLN
   yNJmgW+KdSmobYrRJCtzAhJlN5WOS1mHhmkM5uYiaYICuOB4HIChbn70b
   +2KQXDPJorWVadZ4qfsY0+7rItqSPuf057JVdguMW+5Fle7H4mZJpFb2y
   bR2gBSOgfXSNmULp7Pk3E4IX/okgvlHwOJIiuy9PL4YVyhlWANaglnL/O
   NgfL3tVIY7Dk7ScYq2Dn0Oam6uIRbOtl9iJ2NBfqbtgg6ddRUZUsEUUx9
   w==;
X-CSE-ConnectionGUID: bI+niOpzSH6HAggrKph/Zw==
X-CSE-MsgGUID: EBti+FVDTNqOy0EujrB7RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="66509682"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="66509682"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 01:25:15 -0700
X-CSE-ConnectionGUID: q25M+tGKQu2YFnz0kkI79g==
X-CSE-MsgGUID: bMfPx7oCQxSV6TkJcTWaPg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2026 01:25:14 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKXZA-000000000op-0D3f;
	Wed, 06 May 2026 08:25:12 +0000
Date: Wed, 06 May 2026 16:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_transport_instance_handle_V1 5/5]
 drivers/firmware/arm_scmi/transports/optee.c:224:29: error: use of undeclared
 identifier 'mutexname'; did you mean 'putname'?
Message-ID: <202605061623.56IAmep6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_transport_instance_handle_V1
head:   13190d4c752c9adc3184690ccf035795be170fb9
commit: 13190d4c752c9adc3184690ccf035795be170fb9 [5/5] firmware: arm_scmi: optee: Rework transport probe sequence
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260506/202605061623.56IAmep6-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061623.56IAmep6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061623.56IAmep6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/transports/optee.c:224:29: error: use of undeclared identifier 'mutexname'; did you mean 'putname'?
     224 |         .mtx = __MUTEX_INITIALIZER(mutexname),
         |                                    ^~~~~~~~~
         |                                    putname
   include/linux/mutex.h:83:29: note: expanded from macro '__MUTEX_INITIALIZER'
      83 |                 __DEBUG_MUTEX_INITIALIZER(lockname) \
         |                                           ^
   include/linux/mutex.h:40:14: note: expanded from macro '__DEBUG_MUTEX_INITIALIZER'
      40 |         , .magic = &lockname
         |                     ^
   include/linux/fs.h:2539:13: note: 'putname' declared here
    2539 | extern void putname(struct filename *name);
         |             ^
   1 error generated.


vim +224 drivers/firmware/arm_scmi/transports/optee.c

   222	
   223	static struct scmi_optee_suppliers scmi_transport_suppliers = {
 > 224		.mtx = __MUTEX_INITIALIZER(mutexname),
   225		.available = INIT_ERR_PTR(-EPROBE_DEFER),
   226		.th.supplier_get = scmi_optee_supplier_get,
   227		.th.supplier_put = scmi_optee_supplier_put,
   228	};
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
