Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06691326927;
	Wed, 10 Dec 2025 17:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765386882; cv=none; b=Nnrk5X0cabmYRxZw2EBD/8RXegK4Cx2jaGlv6r68Q6EAXChcMqaj5+s0XVbShWhqDYwebF/wlgCiBcUClSLe3M6L4tomUZ3IKSmt8GoKMkkw6inFRroExm4yn8P57BY1IP1YZsZgME14l6CiwOqer6Ounl6LkHz/212daSzgLNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765386882; c=relaxed/simple;
	bh=hThelpXoeux76TYFkGq7N3/3xltvAZgSzmKtnGX69Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VLJfetL8I598ddmI6r3t9wd73bih+dfPEBz1QUm4RrKYJ1cbJ0nwOaHogffS7+j1PN2CEzF4jy/C2Ni6NoAU2wqLJYSC4T5oeABbVvw8C2VraKGQwa22YeH5RuB+zzbd45WzFB5q5TQEQTEZljSt5LU6wKDlFcvoFEJwskQ3tUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFOGaC7n; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFOGaC7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765386881; x=1796922881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hThelpXoeux76TYFkGq7N3/3xltvAZgSzmKtnGX69Zg=;
  b=WFOGaC7nN6G4eja1QjQgro3x+0YLvEhmGLHmv7xJrv+j0MxeHj3idgdr
   D2R24pPbzK+jYndky54j8kerw0k3LM0De+HcU7W8bQjhKl8UqkfGYuo1s
   sCFpkV9DSMTpDg/KlfmTR5FbH1ZtFSLe+iPmCiVVZLON45skry38QCBz6
   SLIwBB+BcF8APd6/ggDm4JqriFw1+JCMGET24ycQd9Fkp5zupMKGytaT+
   GiA8d2YuQGNaJxR1LUUBho58lwWbmoJvVW2G9c41+Y1QKCve98Q0RfB8n
   LGbJSP6iLJyupWai6/8lHHkM6od5h1IVgGMjKcbDBl+tvqPH5XJMq4l2d
   w==;
X-CSE-ConnectionGUID: gFG7LBbdSRyIOygdu62u0w==
X-CSE-MsgGUID: hRobtTwPQEWu/cN/1aACHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92841232"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="92841232"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 09:14:38 -0800
X-CSE-ConnectionGUID: ei7b5Kp2Ttyv9D7TRThINQ==
X-CSE-MsgGUID: uwGNSDIcRxmVlBfsMBqkHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201007935"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Dec 2025 09:14:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTNlq-000000003Ur-1lxx;
	Wed, 10 Dec 2025 17:14:34 +0000
Date: Thu, 11 Dec 2025 01:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 12/16] error[E0425]: cannot find function
 `put_device` in crate `bindings`
Message-ID: <202512110125.hSkCUVFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   a8811acb11ba01eb88a548d40735773355424255
commit: 3ba70776dd9c02b64ba2b9dd8541be5da1126f4e [12/16] x86: Use PIE codegen for the core kernel
config: x86_64-randconfig-072-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110125.hSkCUVFa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110125.hSkCUVFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110125.hSkCUVFa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `put_device` in crate `bindings`
   --> rust/kernel/auxiliary.rs:276:28
   |
   276   |         unsafe { bindings::put_device(dev) }
   |                            ^^^^^^^^^^ help: a static with a similar name exists: `cpu_devices`
   |
   ::: rust/bindings/bindings_generated.rs:64096:5
   |
   64096 |     pub static mut cpu_devices: cpu;
   |     ------------------------------- similarly named static `cpu_devices` defined here
--
>> error[E0425]: cannot find function `fwnode_property_present` in crate `bindings`
   --> rust/kernel/device/property.rs:101:28
   |
   101 |         unsafe { bindings::fwnode_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
   |                            ^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `fwnode_property_read_bool` in crate `bindings`
   --> rust/kernel/device/property.rs:109:28
   |
   109 |         unsafe { bindings::fwnode_property_read_bool(self.as_raw(), name.as_char_ptr()) }
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `fwnode_property_match_string` in crate `bindings`
   --> rust/kernel/device/property.rs:119:23
   |
   119 |             bindings::fwnode_property_match_string(
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `fwnode_get_named_child_node` in crate `bindings`
   --> rust/kernel/device/property.rs:206:32
   |
   206 |             unsafe { bindings::fwnode_get_named_child_node(self.as_raw(), name.as_char_ptr()) };
   |                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `fwnode_get_next_child_node` in crate `bindings`
   --> rust/kernel/device/property.rs:242:43
   |
   242 |             let next = unsafe { bindings::fwnode_get_next_child_node(self.as_raw(), prev_ptr) };
   |                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `fwnode_property_get_reference_args` in crate `bindings`
   --> rust/kernel/device/property.rs:284:23
   |
   284 |             bindings::fwnode_property_get_reference_args(
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `fwnode_handle_get` in crate `bindings`
   --> rust/kernel/device/property.rs:366:28
   |
   366 |         unsafe { bindings::fwnode_handle_get(self.as_raw()) };
   |                            ^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `fwnode_handle_put` in crate `bindings`
   --> rust/kernel/device/property.rs:372:28
   |
   372 |         unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
   |                            ^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `fwnode_count_parents` in crate `bindings`
   --> rust/kernel/device/property.rs:387:46
   |
   387 |         let num_parents = unsafe { bindings::fwnode_count_parents(self.as_raw()) };
   |                                              ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `fwnode_get_nth_parent` in crate `bindings`
   --> rust/kernel/device/property.rs:394:46
   |
   394 |                 let ptr = unsafe { bindings::fwnode_get_nth_parent(self.as_raw(), depth) };
   |                                              ^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
