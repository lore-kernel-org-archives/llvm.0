Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA3F28EF;
	Sat, 19 Oct 2024 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729318170; cv=none; b=OJkL9mweCsVqfFQPaP8QRo+IgeKLHaAx2gfMQiEabxaLBcXufkJkwokQCGnFxBgHj4tAdaV0i+C0IG9WFOm5TDp/TIe7WuRf1uiMLsU8cvBYzI8xKNLakRuMKT5aqHn3vDJZiSchNT7E5hMv+3gMQiawYbUYDtPYIK1atn7p4D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729318170; c=relaxed/simple;
	bh=l0XaHCKYiAqR0O4A9yZFaL9PW+FnfGa9m1DBVGxwkC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mbiJs59OTBLjeAJL41M4kQgT1gO9SvJsCQF7dVlof1smcc+k37u61xln0MXruSEhOT/eoxhaLmI1pn0lsp5n/TMokU6LmB2OYi5N7Yvf9LTeMfc2uSs2tgw2UAi/riJYBBoF9LXyd/GsGOVlYJJZ/BNHwWMJd44Yj7EOfG8zF4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W65FEbYr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W65FEbYr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729318166; x=1760854166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0XaHCKYiAqR0O4A9yZFaL9PW+FnfGa9m1DBVGxwkC4=;
  b=W65FEbYrp1wc6mZZpmhCrbRqpV7/UH0086Q3Cre5xt8R/RZsrBqfexr7
   vudiOMem/nGNG3Jsr/55UXwfqxSoS8gqYPA7MwclRn/CQ2xS82WJBdxuk
   pjiK8k1TixMA88Lrq77cnkduGObOqr8z187Ois1x4SF1O7QrFHTyIEbZW
   n2MX3skB9eR4My76BKpXsBSBJ7sVQtDqJXSmph4l40XRZt3d2CYlVcyB2
   kIH2sOL5fmRsxdKuKK3bBQ95U1KVOnXsNfcbOJSp9XRL5elbYE045DH0s
   7E+UEh6PIlJftr9oH4JeRUAWyvUn5YAS1GZGkPdoZKjdd4+DafLM5PxTQ
   w==;
X-CSE-ConnectionGUID: vpEosXOLRSehNDOGSC3mAQ==
X-CSE-MsgGUID: LnCCOocvQSe2LMKJrmqcIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28964275"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28964275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 23:09:25 -0700
X-CSE-ConnectionGUID: XTIGuKcdSj6OqDAkjS+tnQ==
X-CSE-MsgGUID: fOK5EzP4QgaAu5EWU4cgVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79870646"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2024 23:09:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t22eP-000Ojx-00;
	Sat, 19 Oct 2024 06:09:21 +0000
Date: Sat, 19 Oct 2024 14:09:00 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:staging/rust-pci 13/13] error[E0433]: failed to resolve: could
 not find `module_pci_driver` in `kernel`
Message-ID: <202410191436.oOXV1ArA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/rust-pci
head:   d6146e25775c14aac6abb51dfe52c06ec5de8a2e
commit: d6146e25775c14aac6abb51dfe52c06ec5de8a2e [13/13] samples: rust: add Rust PCI sample driver
config: x86_64-randconfig-016-20241017 (https://download.01.org/0day-ci/archive/20241019/202410191436.oOXV1ArA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191436.oOXV1ArA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191436.oOXV1ArA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::pci`
   --> samples/rust/rust_driver_pci.rs:7:67
   |
   7  | use kernel::{bindings, c_str, device_id::IdArray, devres::Devres, pci, prelude::*};
   |                                                                   ^^^ no `pci` in the root
   |
   note: found an item that was configured out
   --> rust/kernel/lib.rs:77:9
   |
   77 | pub mod pci;
   |         ^^^
--
>> error[E0433]: failed to resolve: could not find `module_pci_driver` in `kernel`
   --> samples/rust/rust_driver_pci.rs:96:9
   |
   96 | kernel::module_pci_driver! {
   |         ^^^^^^^^^^^^^^^^^ could not find `module_pci_driver` in `kernel`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
