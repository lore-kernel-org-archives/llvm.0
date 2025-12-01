Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EA254758;
	Mon,  1 Dec 2025 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764585939; cv=none; b=quR0pdJgpsNn1ujnQSiqZLg2XiEc7iwOKy8zVjcq2H7vgs4q0NRtpoGzQAVAMGfXQXb2NTsxe5IKT6UcVz1VJO8P4+hzZCcosSe36tNF7rXWJ8d+Ej4rzGxo3u8kRTo4couvTijx0ipVY86fRQGMk39wBGcJA8Sqai7zviMovvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764585939; c=relaxed/simple;
	bh=ZMgoxer0A9bsoQPMk9d56YSEmZcP/1tXGHcKFEva5vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucgRtzAdn+BvTjKx12xBUU6TKjsP+DQtAbyCur9feutpMa39KgSzrIWRWQgE1uGrDiX/E5yiXTViBoWNS6oqZaOvt0QtKi/2bSLqEDdUIJjiPJ8Y1LS2ryAaxmciSYNJVviG7wIpDi1q45YljBr5ufbS4QuGFM9T24SMyYuwSs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fPQSae8u; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPQSae8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764585938; x=1796121938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZMgoxer0A9bsoQPMk9d56YSEmZcP/1tXGHcKFEva5vw=;
  b=fPQSae8uY52ejvWDrdNf50XFl4vqeMpygklw0AsAj4dwOVeLCnzZ3DmY
   M0FLXBXVrylE7C/COK4dWfmjUYLHMK0FOQmRdFx26j1D0c7nvK+JXs79y
   eT/6nyXEv/n5BlhDajgdaTDigX7gCiw5GSTEWvHl9zVEaXh9AQzi0hWUe
   h984IjfLL2OOaIQHTcX4TbdF35zxQZIMol3txvL4ltXRLwk24loVQvYiu
   CwvP7l8M8TVQu3s8InfDq6ghyY1H4jjPUwpm34g34T44bhwKwe/qFRZgW
   rACQx2jgTy5Ibq+FDIXQRlUgykDNfPxZjXh4UQ9fEt5fYwzi5k51i9CBi
   g==;
X-CSE-ConnectionGUID: BWNegZ4WTdCJ6RDsArNTQQ==
X-CSE-MsgGUID: mU7eozSATayv/zT5XJEoIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66592480"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="66592480"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 02:45:36 -0800
X-CSE-ConnectionGUID: UiKU1BOTQS2bJoYoZgTb0g==
X-CSE-MsgGUID: j/cfelm4RgGMNamFGIajLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194136456"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 02:45:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ1PK-000000008UT-14OD;
	Mon, 01 Dec 2025 10:45:26 +0000
Date: Mon, 1 Dec 2025 18:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Lyude Paul <lyude@redhat.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
Message-ID: <202512011741.Euw2XF0j-lkp@intel.com>
References: <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 77b686f688126a5f758b51441a03186e9eb1b0f1]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/drm-gpuvm-take-GEM-lock-inside-drm_gpuvm_bo_obtain_prealloc/20251128-221710
base:   77b686f688126a5f758b51441a03186e9eb1b0f1
patch link:    https://lore.kernel.org/r/20251128-gpuvm-rust-v1-4-ebf66bf234e0%40google.com
patch subject: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
config: x86_64-randconfig-006-20251201 (https://download.01.org/0day-ci/archive/20251201/202512011741.Euw2XF0j-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011741.Euw2XF0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512011741.Euw2XF0j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `drm_gpuvm_get` in crate `bindings`
   --> rust/kernel/drm/gpuvm/mod.rs:58:28
   |
   58    |         unsafe { bindings::drm_gpuvm_get(self.vm.get()) };
   |                            ^^^^^^^^^^^^^ help: a function with a similar name exists: `drm_gpuvm_put`
   |
   ::: rust/bindings/bindings_generated.rs:75807:5
   |
   75807 |     pub fn drm_gpuvm_put(gpuvm: *mut drm_gpuvm);
   |     -------------------------------------------- similarly named function `drm_gpuvm_put` defined here
--
>> error[E0425]: cannot find function `drm_gpuvm_is_extobj` in crate `bindings`
   --> rust/kernel/drm/gpuvm/mod.rs:217:28
   |
   217   |         unsafe { bindings::drm_gpuvm_is_extobj(self.as_raw(), obj.as_raw()) }
   |                            ^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `drm_gpuvm_bo_extobj_add`
   |
   ::: rust/bindings/bindings_generated.rs:75985:5
   |
   75985 |     pub fn drm_gpuvm_bo_extobj_add(vm_bo: *mut drm_gpuvm_bo);
   |     --------------------------------------------------------- similarly named function `drm_gpuvm_bo_extobj_add` defined here
--
>> error[E0425]: cannot find function `drm_gpuvm_exec_unlock` in crate `bindings`
   --> rust/kernel/drm/gpuvm/mod.rs:345:28
   |
   345   |         unsafe { bindings::drm_gpuvm_exec_unlock(self.exec.get()) };
   |                            ^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `drm_gpuvm_exec_lock`
   |
   ::: rust/bindings/bindings_generated.rs:75876:5
   |
   75876 |     pub fn drm_gpuvm_exec_lock(vm_exec: *mut drm_gpuvm_exec) -> ffi::c_int;
   |     ----------------------------------------------------------------------- similarly named function `drm_gpuvm_exec_lock` defined here
--
>> error[E0425]: cannot find function `dma_resv_lock` in crate `bindings`
   --> rust/kernel/drm/gpuvm/mod.rs:376:28
   |
   376   |         unsafe { bindings::dma_resv_lock(self.raw_resv_lock(), ptr::null_mut()) };
   |                            ^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_resv_fini`
   |
   ::: rust/bindings/bindings_generated.rs:74915:5
   |
   74915 |     pub fn dma_resv_fini(obj: *mut dma_resv);
   |     ----------------------------------------- similarly named function `dma_resv_fini` defined here
--
>> error[E0425]: cannot find function `dma_resv_unlock` in crate `bindings`
   --> rust/kernel/drm/gpuvm/mod.rs:392:28
   |
   392  |         unsafe { bindings::dma_resv_unlock(self.0.raw_resv_lock()) };
   |                            ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `mmap_read_unlock`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1129:5
   |
   1129 |     pub fn mmap_read_unlock(mm: *mut mm_struct);
   |     -------------------------------------------- similarly named function `mmap_read_unlock` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
