Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4D7182D8;
	Sat, 10 Aug 2024 11:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723289649; cv=none; b=OyKQt5Mc5Y0dDxjW2YnPYMjROll60LQQnR51D4JSSZWjPmQJQZa9IXiLI+ENB26EYvGrSbeAFzQhF2pQcVAv1sYqhmb7npHXaNjSgC5OFOObZXJ9B7tAWSJfSG2bFE+VcyhcbXtbuinw4G9u+IE8JctMpV0qsT7iPaA9lQMl4Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723289649; c=relaxed/simple;
	bh=kvUDhPNk5BpwSl3wEh5gwuoCRoQjyGlpCb954t6/yN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xgz088ZKHSwDDz22K8Muti1gVPmxCJeHVZwCPvRcxeX9Cb3t4Rqp/GlQi+aqXjltRx8qYMs+s4ETwwhnTwbZZ09H2BzPWvs4+wdNtSlVY9jVia67tHd0vO36rENfrywcHQO9zUAKo7YqkhSrVDbXSVCyGPite6TxDLMxCR4U6gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=It1SanDj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="It1SanDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723289648; x=1754825648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kvUDhPNk5BpwSl3wEh5gwuoCRoQjyGlpCb954t6/yN0=;
  b=It1SanDjKtVGEfgAY2bGUZItcJsm7ryszw9htriSqYRvLsHsw/dRMhJo
   dP7F8Zek7aFTivzWL73FgYhxnvOdHFA570h9usWztR79poYbJq9ZLxlD2
   rzwXBj66w5HM/9Xqn5bDWNb4nG5BteFsLja9yja5ZmpZ0kpnLNBVkI+Kn
   dW1COfpc8EkUjolg37us87QbELEfGr9kHXS8demQiQNG0VIg2poMM/R/k
   ZEiwgnuGyPmhmlZGU1GgprHGb8WXLJNKciuoh1tcgoKh7LYYFT1P1sqNc
   0xUBXt6tbrl1mRx501bYFUXsGteDGkEtg4Wsue8eetFTsG43ge1EwqE7J
   w==;
X-CSE-ConnectionGUID: w2/dd6NmRqqKR4zbGXGwTQ==
X-CSE-MsgGUID: IF8+wWgHQ12q8H07WE6kkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32868875"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="32868875"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 04:34:07 -0700
X-CSE-ConnectionGUID: 8FtRWophSLytCWZO3FSaMQ==
X-CSE-MsgGUID: mbaM6RRDShyHaAPqLp01wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="57710533"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 10 Aug 2024 04:34:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sckMA-0009tQ-0o;
	Sat, 10 Aug 2024 11:33:59 +0000
Date: Sat, 10 Aug 2024 19:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: Fabien Parent <fabien.parent@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>, Asahi Lina <lina@asahilina.net>
Subject: [rust:pr/1040 11/23] error[E0432]: unresolved import
 `kernel::define_id_table`
Message-ID: <202408101913.EhszKOP0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1040
head:   2419018fe244d9eaee250fc03cb145b474c575b8
commit: e890268fddcfb88b4a5378a59fd06b0ba5b02a46 [11/23] ASAHI: rust: device_id: Support passing ID tables to modpost for alias generation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240810/202408101913.EhszKOP0-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408101913.EhszKOP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408101913.EhszKOP0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::define_id_table`
   --> rust/doctests_kernel_generated.rs:715:14
   |
   715 | use kernel::{define_id_table, device_id::RawDeviceId};
   |              ^^^^^^^^^^^^^^^
   |              |
   |              no `define_id_table` in the root
   |              help: a similar name exists in the module: `driver_id_table`
--
>> error: cannot find macro `driver_id_table` in this scope
   --> rust/doctests_kernel_generated.rs:665:1
   |
   665 | driver_id_table!(BUS_ID_TABLE, Id, &'static [u8], A1);
   | ^^^^^^^^^^^^^^^
   |
   help: consider importing this macro
   |
   3   + use kernel::driver_id_table;
   |
--
>> error: cannot find macro `module_id_table` in this scope
   --> rust/doctests_kernel_generated.rs:667:1
   |
   667 | module_id_table!(MODULE_ID_TABLE, "mybus", Id, A1);
   | ^^^^^^^^^^^^^^^
   |
   help: consider importing this macro
   |
   3   + use kernel::module_id_table;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
