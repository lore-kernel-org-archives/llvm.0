Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A6199949;
	Mon,  1 Dec 2025 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599637; cv=none; b=odjgKdO70J58W6ZsHxI7bEDjI02QboAByAPkNWnLLHzfuoFTAnst2zfYqD26vfNZmSVUa+r9vnuchZBHJkzVcnz+dyj5ScAVTGYjFLOKDa9AHD6xOHfirONe6J/QGQxCP+cI9RjXKk68VNn3jG8hwZ/JBZsiIKYo8xJUpJtqktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599637; c=relaxed/simple;
	bh=yne6KQuShtCQ7x+U9JYugotd5EaFO19y4CABwq5nuZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HH2W2JIsS+5lW4RGtYuEKbaKlXOei6s1HKzVya8T49Sg9oSf1Nl0kAw9/ufV7yWTTwx7dQSeuvV7EAzQKWweQyBTZU2MCSnMAuhUpuf3/883zSWqaVvdj/mM+Nw1Ga42JaTjK5PYygrj/RGFdGncSgryqk/nMeOeMn39suEHLk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZOHbkBp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZOHbkBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764599636; x=1796135636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yne6KQuShtCQ7x+U9JYugotd5EaFO19y4CABwq5nuZE=;
  b=IZOHbkBpq++OnmWgvelTp3gMGmvx2E+J3YF0nLR/xA8QgxAAGCS1G1bR
   qGb1d9Tw5HEwbbr4nrvYht3LZHP9kdD/69sHREuLyfjSB3lmf/SLmBPi2
   oR693GCnKXBkLktNuhuJVMQdthfh+qd5C7sUWXjDGL95Ghd8cti/fQYGJ
   UqPqJF045MLsnI1rg90Ao9il0dWS780+LjofoBYfOVLoyF9dZK/CXmexJ
   JVrJ8JNfUaeIcMm3QD77/cFZWUD8RwG1soADo00AT1yOpzAAzEqCG/1ix
   2Ur7UCUO8tkkFVpeIpLo5xB3iyZYekI4WYSjhIAmungpMJmvi5z8Ll9Z/
   A==;
X-CSE-ConnectionGUID: 5jclYYLxSE6tSJAtnuev8g==
X-CSE-MsgGUID: iVrnsoLFSxOVwAOXKA6jvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="92016309"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="92016309"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 06:33:55 -0800
X-CSE-ConnectionGUID: 6myoGbDbTL6AbT1tShcARg==
X-CSE-MsgGUID: YP7VIhTCQBCya+DYgo8pOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193212770"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Dec 2025 06:32:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ4xT-000000008pN-3PFK;
	Mon, 01 Dec 2025 14:32:55 +0000
Date: Mon, 1 Dec 2025 22:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [linux-next:master 1229/13171] error[E0425]: cannot find function
 `pci_alloc_irq_vectors` in crate `bindings`
Message-ID: <202512012238.YgVvRRUx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 340ccc973544a6e7e331729bc4944603085cafab [1229/13171] rust: pci: Allocate and manage PCI interrupt vectors
config: x86_64-randconfig-006-20251201 (https://download.01.org/0day-ci/archive/20251201/202512012238.YgVvRRUx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012238.YgVvRRUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512012238.YgVvRRUx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `pci_alloc_irq_vectors` in crate `bindings`
   --> rust/kernel/pci.rs:628:23
   |
   628  |             bindings::pci_alloc_irq_vectors(dev.as_raw(), min_vecs, max_vecs, irq_types.as_raw())
   |                       ^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `pci_irq_vector`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1201:5
   |
   1201 |     pub fn pci_irq_vector(pdev: *mut pci_dev, nvec: ffi::c_uint) -> ffi::c_int;
   |     --------------------------------------------------------------------------- similarly named function `pci_irq_vector` defined here
--
>> error[E0425]: cannot find function `pci_free_irq_vectors` in crate `bindings`
   --> rust/kernel/pci.rs:654:28
   |
   654  |         unsafe { bindings::pci_free_irq_vectors(self.dev.as_raw()) };
   |                            ^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `pci_irq_vector`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1201:5
   |
   1201 |     pub fn pci_irq_vector(pdev: *mut pci_dev, nvec: ffi::c_uint) -> ffi::c_int;
   |     --------------------------------------------------------------------------- similarly named function `pci_irq_vector` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
