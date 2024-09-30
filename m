Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BA42D7BF;
	Mon, 30 Sep 2024 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685065; cv=none; b=XOA3+luBvCRABIj3WMlMS/UUkns7vBuImWYmajZHYmybw5qpY9tx/BirPs0Ze4kA3nZCqYVUdOKRon2UrrZWWOp5TZlxK753wzmYeBKLYGxQDERg9kg/zKjNOvwskavNXPxsVcgdtae0wXctTqgKzZDbUjzupwQPBIWtZBC2zG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685065; c=relaxed/simple;
	bh=h/cnwDjON5lq1rSQ/MG+D8Jj7T3VSqq3OE0iiYUPMRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BKTydmLg/FLN06DrcOMzdw2yVOZhWHAGz9Li1EZJ7ltesyNUGZArUvDzx/8abEMjQUtzvyuL4lpKEKdinf8+BkL/UVZ9GI9DL7nGZbXlA5Um7NDbW+7wV9vlLw+7nHKee6Sbfpq6yYMn8FDnWlLAkwu6QtpLy0ygpV1NvsRyNH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZ6dADVL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZ6dADVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727685063; x=1759221063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h/cnwDjON5lq1rSQ/MG+D8Jj7T3VSqq3OE0iiYUPMRk=;
  b=FZ6dADVLLwf5cpP/UyK/28qUsVf7fQ/z1dqZzPebmnhuGWn5mdBSjwAa
   OrrDML7hMTOWrWBzVtUaTfoRvWWmcesOOr6mP2aKWj3XZobeFXGPbqcQs
   JZN+2t5UTo7VICYAiiweCrXBr8q0Bf815vr59KpxT4BPAPb7GEJCKhQvp
   qzKWWBrNiY4W2FdIe5uGVcpam8CHgA6hlKx3m72FIdnpz94iuwa5rrP2k
   z75H1yzAM+bv3XwqajcsmgvFcxYSJ1gZeTPckcjAgBJqlzc9hF9yR+YlH
   fJjm7s4mdM9SLsRRFVlRAqj2Vm6tdnSAzi9XFMdA+EepvpVZouwEU/7Li
   A==;
X-CSE-ConnectionGUID: 7fmjkFusSXaY5j/Ot6pm+g==
X-CSE-MsgGUID: NmzoR6EtRFexc2g43F+K2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26268623"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="26268623"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 01:31:02 -0700
X-CSE-ConnectionGUID: Ksua8EkLSaCxJP7nHQ2CEw==
X-CSE-MsgGUID: XtgZmPIDRa+vLWGY7WLjbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="77992093"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Sep 2024 01:31:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svBo2-000PE6-38;
	Mon, 30 Sep 2024 08:30:58 +0000
Date: Mon, 30 Sep 2024 16:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 23/26] error[E0425]: cannot find function
 `blk_mq_start_request` in crate `bindings`
Message-ID: <202409301658.LZMg7KLJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   2b9142b6c6241b0debfe0d21c911c3aaf0c05670
commit: 73ab629624e08a8d1fad61e724e408d71c5c107f [23/26] x86: Use PIE codegen for the core kernel
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240930/202409301658.LZMg7KLJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301658.LZMg7KLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301658.LZMg7KLJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `blk_mq_start_request` in crate `bindings`
   --> rust/kernel/block/mq/request.rs:83:28
   |
   83 |         unsafe { bindings::blk_mq_start_request(this.0.get()) };
   |                            ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `blk_mq_end_request` in crate `bindings`
   --> rust/kernel/block/mq/request.rs:121:28
   |
   121 |         unsafe { bindings::blk_mq_end_request(request_ptr, bindings::BLK_STS_OK as _) };
   |                            ^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `blk_mq_rq_to_pdu` in crate `bindings`
   --> rust/kernel/block/mq/request.rs:138:32
   |
   138 |             unsafe { bindings::blk_mq_rq_to_pdu(request_ptr).cast::<RequestDataWrapper>() };
   |                                ^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `blk_mq_alloc_tag_set` in crate `bindings`
   --> rust/kernel/block/mq/tag_set.rs:67:54
   |
   67 |                 error::to_result( unsafe { bindings::blk_mq_alloc_tag_set(tag_set.get())})
   |                                                      ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `blk_mq_free_tag_set` in crate `bindings`
   --> rust/kernel/block/mq/tag_set.rs:84:28
   |
   84 |         unsafe { bindings::blk_mq_free_tag_set(self.inner.get()) };
   |                            ^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `get_device` in crate `bindings`
   --> rust/kernel/device.rs:58:28
   |
   58 |         unsafe { bindings::get_device(ptr) };
   |                            ^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `get_device` in crate `bindings`
   --> rust/kernel/device.rs:91:28
   |
   91 |         unsafe { bindings::get_device(self.as_raw()) };
   |                            ^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `put_device` in crate `bindings`
   --> rust/kernel/device.rs:96:28
   |
   96    |         unsafe { bindings::put_device(obj.cast().as_ptr()) }
   |                            ^^^^^^^^^^ help: a static with a similar name exists: `cpu_devices`
   |
   ::: rust/bindings/bindings_generated.rs:44420:5
   |
   44420 |     pub static mut cpu_devices: cpu;
   |     ------------------------------- similarly named static `cpu_devices` defined here
--
>> error[E0425]: cannot find function `errno_to_blk_status` in crate `bindings`
   --> rust/kernel/error.rs:132:28
   |
   132 |         unsafe { bindings::errno_to_blk_status(self.0) }
   |                            ^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function, tuple struct or tuple variant `ERR_PTR` in crate `bindings`
   --> rust/kernel/error.rs:139:28
   |
   139 |         unsafe { bindings::ERR_PTR(self.0.into()) as *mut _ }
   |                            ^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `errname` in crate `bindings`
   --> rust/kernel/error.rs:146:38
   |
   146 |         let ptr = unsafe { bindings::errname(-self.0) };
   |                                      ^^^^^^^ not found in `bindings`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
