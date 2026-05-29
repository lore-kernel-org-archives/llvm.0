Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD4367B95;
	Fri, 29 May 2026 02:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780023211; cv=none; b=V2sgJL2ehqFjMq2RKjDNn4auujfXHPln6BQsZPlBGJCepvLNhRJuEUEBtlb8knrivZ7zjUUxOChtu8pvDeR3WVcWShSZ2zWCg5vYaF0Vt3Kgioi8olJKChnvCsW1ES1fA8vsCdF8AJokpldrmNww+XMqGybWpn1NoDqhwmak8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780023211; c=relaxed/simple;
	bh=MMv/5NSwkzggm38CTPziMZDIPfS+SFR/ssIwAbMQIok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RGVNDfkZrYBUsLJfvpZAQM67fZbCBxANsHjl5f9hY4eFj+trKy/Kg23d0snFQLo7vE1tmWhAIxcT0TvQyJPXW8qTKAP9GL8xy1tukIHdCYTukv4SX+Znr5LRgs1RgeKZDIE6rZ76xxKYEjSay9wGfap6seFn+4GdO+n0uj+HjAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ri/PcGuI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ri/PcGuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780023210; x=1811559210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MMv/5NSwkzggm38CTPziMZDIPfS+SFR/ssIwAbMQIok=;
  b=Ri/PcGuIe6JDjfKSaIzYQrys4DgM0QNgFugG3EHwzj3N1094TE+9bPgQ
   +1pHuOTYa6tiaaypFo4A0IRgC5tl+fDan6bs8/JrnErfY88bbZrqQcQIe
   z3gSihul6U2VSOsUg0qNWjdpYtIEzwW5KfGYhdmzuPhh3GMHIj55aRpin
   ZNVATv5ppptfXsACTU7gcnXJQ0ord1HvlpFUQeOHuOzRf8m2e78q4vzZX
   UQsu+QnWi/4auJzTVopnlvU+lx+TtNcuIkLZQvKnzX5Lf41HZHP0lyG3I
   QLl/78jVthFC73z6qpjR/hsgwm4QAbG/iDgpUBue9AKmly6w/HfBp+2mN
   g==;
X-CSE-ConnectionGUID: QQnPFaX/QYSeJ1YFk0+P7w==
X-CSE-MsgGUID: l4/MzLGxSBG4d/5RfrsQQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="68410256"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="68410256"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 19:53:29 -0700
X-CSE-ConnectionGUID: AgeBxSw7TzarERMK2arMWg==
X-CSE-MsgGUID: TB2LUYupRcCFmj0x7eobpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="266603015"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 May 2026 19:53:27 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSnLg-000000006hu-3OzL;
	Fri, 29 May 2026 02:53:24 +0000
Date: Fri, 29 May 2026 10:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alice Ryhl <aliceryhl@google.com>
Subject: [linux-next:master 3728/9137]
 samples/rust/rust_driver_auxiliary.o: warning: objtool:
 =?us-ascii?Q?=5FRINvXs5=5FNtNtCshc5sK6KjdJJ=5F6kernel5alloc4kboxINtB6?=
 =?us-ascii?Q?=5F3BoxINtNtNtCsbsbRiabPlh9=5F4core3mem12maybe=5Funinit11M?=
 =?us-ascii?Q?aybeUninitINtNtBa=5F9auxiliary16RegistrationDataNtCseULRbg?=
 =?us-ascii?Q?TYaTO=5F21rust=5Fdriver=5Fauxiliary4DataEENtNtB...?=
Message-ID: <202605291041.seNEWvLQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: auxiliary: add registration data to auxiliary devices
config: x86_64-randconfig-004-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWvLQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module_dtor+0x1: call without frame pointer save/setup
>> samples/rust/rust_driver_auxiliary.o: warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3y_10___internal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11InPlaceInitB1L_E8pin_initB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3newNtNtBX_7convert10InfallibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name too long, can't create __pfx_ symbol

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
