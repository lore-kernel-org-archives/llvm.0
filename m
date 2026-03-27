Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083DE3597B;
	Fri, 27 Mar 2026 20:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774641856; cv=none; b=VTMcvMYA3UPsY3MGQje2CPiFfUnQp8zyiZTCBeNSsb1JHGxN5Yx3hk2grhs3Vgpcsw78saaRjn3mOG90ZpG1lq+8tBN6HXb7HqP2MH1VI1KpPLoKlPEFGe5ekMT4WLm4uMZzj5YU4GqJDrQlplluYhRehNKPO9dG7U9YsdLiyTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774641856; c=relaxed/simple;
	bh=ifxJQiV/BAd1iZRjjlWQBoU0Qh3X3MZNgFKrZ5/Pzpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js1GZoeP61NoH+C0Z7+5UXp6EM7X14uk0mm51jn2YVBXvcFZ4tOOjpF1UYKzUqZojBtBqC3s8JrxDTBvsTiycsEP7G4zxJKJXzvK2mn7A4kGrCLc9VvtIYsDns11dfuvHd46rM/bHoOuv7LCcMo3EL1C3+sfpiQwKYfTDj/vZLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IatmHvzQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IatmHvzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774641856; x=1806177856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ifxJQiV/BAd1iZRjjlWQBoU0Qh3X3MZNgFKrZ5/Pzpw=;
  b=IatmHvzQX3ItmmLZEno8pgoeD5P79Rw3tUTpT8RLKk7dg5arNk2ozcs/
   8L1yp/Qd9NpW/VGpsK5hLH9uJFrODRr8nRG6MB+UM1gQZKD2e4inq+i9F
   X4KVkkg5kWEQMRsUarAZ4Nn21CSqhTF1jQ+ItoswLdYkervXpUmmrTpKR
   ixsIMu+pLdhU+XjihZgGDFHQk/9oYNj9Dim4BV8ttQTUW4YIzzCsfvwr6
   vlTAzoYz7ED93eyoCIgjQJxFQ6Iy3m8xGic7Fc3o/I9PdtvCei1xMN2jf
   PJrG6/W8tSAdoDmEXX0rcx6LJ5VAitc0vlVmagKQBjf4zXFdxmsAfW9oG
   A==;
X-CSE-ConnectionGUID: 0Vu+eNycTsWMYkvfRsoiew==
X-CSE-MsgGUID: qqyVfPCzS5mrd+sda7gJrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86799070"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="86799070"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:04:15 -0700
X-CSE-ConnectionGUID: 3TRS2icCS8maXwYpSxAeWA==
X-CSE-MsgGUID: h370f/YRRpanq+og1/SoMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="263364334"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Mar 2026 13:04:10 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6DPb-00000000Aft-3iYQ;
	Fri, 27 Mar 2026 20:04:07 +0000
Date: Sat, 28 Mar 2026 04:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3] gpu: nova-core: gsp: fix undefined behavior in
 command queue code
Message-ID: <202603280326.ucDKVaf2-lkp@intel.com>
References: <20260326-cmdq-ub-fix-v3-1-96af2148ca5c@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-cmdq-ub-fix-v3-1-96af2148ca5c@nvidia.com>

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on dff8302ca1d0e773c90dbeeb05e759f995c95482]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/gpu-nova-core-gsp-fix-undefined-behavior-in-command-queue-code/20260327-003216
base:   dff8302ca1d0e773c90dbeeb05e759f995c95482
patch link:    https://lore.kernel.org/r/20260326-cmdq-ub-fix-v3-1-96af2148ca5c%40nvidia.com
patch subject: [PATCH v3] gpu: nova-core: gsp: fix undefined behavior in command queue code
config: um-randconfig-002-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280326.ucDKVaf2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280326.ucDKVaf2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280326.ucDKVaf2-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/gpu/nova-core/nova_core.o: in function `<core::ops::range::Range<usize> as kernel::ptr::projection::ProjectIndex<[[u8; 4096]]>>::index::{closure#0}':
>> rust/kernel/build_assert.rs:28:(.text+0xfb16): undefined reference to `rust_build_error'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +28 rust/kernel/build_assert.rs

614724e780f587 Miguel Ojeda 2024-11-23   7  
0f595bab9d1c1a Gary Guo     2022-11-10   8  /// Fails the build if the code path calling `build_error!` can possibly be executed.
0f595bab9d1c1a Gary Guo     2022-11-10   9  ///
0f595bab9d1c1a Gary Guo     2022-11-10  10  /// If the macro is executed in const context, `build_error!` will panic.
0f595bab9d1c1a Gary Guo     2022-11-10  11  /// If the compiler or optimizer cannot guarantee that `build_error!` can never
0f595bab9d1c1a Gary Guo     2022-11-10  12  /// be called, a build error will be triggered.
0f595bab9d1c1a Gary Guo     2022-11-10  13  ///
0f595bab9d1c1a Gary Guo     2022-11-10  14  /// # Examples
0f595bab9d1c1a Gary Guo     2022-11-10  15  ///
0f595bab9d1c1a Gary Guo     2022-11-10  16  /// ```
0f595bab9d1c1a Gary Guo     2022-11-10  17  /// #[inline]
0f595bab9d1c1a Gary Guo     2022-11-10  18  /// fn foo(a: usize) -> usize {
0f595bab9d1c1a Gary Guo     2022-11-10  19  ///     a.checked_add(1).unwrap_or_else(|| build_error!("overflow"))
0f595bab9d1c1a Gary Guo     2022-11-10  20  /// }
0f595bab9d1c1a Gary Guo     2022-11-10  21  ///
0f595bab9d1c1a Gary Guo     2022-11-10  22  /// assert_eq!(foo(usize::MAX - 1), usize::MAX); // OK.
0f595bab9d1c1a Gary Guo     2022-11-10  23  /// // foo(usize::MAX); // Fails to compile.
0f595bab9d1c1a Gary Guo     2022-11-10  24  /// ```
0f595bab9d1c1a Gary Guo     2022-11-10  25  #[macro_export]
0f595bab9d1c1a Gary Guo     2022-11-10  26  macro_rules! build_error {
0f595bab9d1c1a Gary Guo     2022-11-10  27      () => {{
614724e780f587 Miguel Ojeda 2024-11-23 @28          $crate::build_assert::build_error("")
0f595bab9d1c1a Gary Guo     2022-11-10  29      }};
0f595bab9d1c1a Gary Guo     2022-11-10  30      ($msg:expr) => {{
614724e780f587 Miguel Ojeda 2024-11-23  31          $crate::build_assert::build_error($msg)
0f595bab9d1c1a Gary Guo     2022-11-10  32      }};
0f595bab9d1c1a Gary Guo     2022-11-10  33  }
0f595bab9d1c1a Gary Guo     2022-11-10  34  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
