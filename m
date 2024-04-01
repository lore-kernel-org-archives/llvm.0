Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F3D4F88B;
	Mon,  1 Apr 2024 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711997957; cv=none; b=VcldxrDcnBJWwTaDuaFXvHFE87RgPiwaR6TjMG+SZZXuURwVR+hRgxVpSnUcq90LDU8z0oTJAsCmx/0ChaTjz5NrOP+lcbsDvie8xGtxpRT1+0Qfz13W+19VmqK0K0Jd0OfTu30ewHjegwJ1QSh5DPyLvZxbceC10hVx4tT+yOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711997957; c=relaxed/simple;
	bh=E4LYyB1g+NzjiSmEYXbDoBDY5Nv9pqgj7lADa5zIguw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kf3oTgaScmgb6VGvFbSdOds6+RnF1Qy5e5z45vM3el1FuTF0FKMrVVhxEKDzWTwF0U9LAkyrKuiSfMRCdsF5mAfN2sr0NO3RhGPM6THDLe2dJKExa9ZUkwHByQ9LHrUAc4NVkmDKs7s4AeEpyE4KECLKlovcHXBlWex73lJOovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0RKNvv9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0RKNvv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711997956; x=1743533956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E4LYyB1g+NzjiSmEYXbDoBDY5Nv9pqgj7lADa5zIguw=;
  b=j0RKNvv9T0HXNoV8NJbGMlqD6fj2YT/knOxZ9dkIm7RhoGop/P/3Xpyt
   zz8QQaCSSvNwbrwPhwiKQiy0jUDm40Xf3E3KNJGi8kN9USErZlUTajNlB
   htcelCPzLEUcGM5hG5yGt41C7v2OYcBQ+cEFo5QkZHsNg08YIIuvhYpzc
   Sw/620nCl7eA1+1EGeVJkQdBvDTT5igLYizYnKlDHpjKIC5ekm9rpIWwk
   Kg74oV3WboHQKm5d1I11UAU6uestQ7mOBKRcnvAvnmmTV/UdpWLCC9INt
   LDhSR3QQRcTj+MoQYFXmussn+V+1wehMi/8IF9aBBjK6ZEcYrvmWVmT20
   w==;
X-CSE-ConnectionGUID: E4IKEk8WT0K1iwmD5qmwNQ==
X-CSE-MsgGUID: a21ALiLgSuWZEuvgBJ1n8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10922443"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="10922443"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 11:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="49009818"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2024 11:59:12 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrMsA-0000Yf-09;
	Mon, 01 Apr 2024 18:59:10 +0000
Date: Tue, 2 Apr 2024 02:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 8/18] error[E0308]: mismatched types
Message-ID: <202404020229.fdzDQ9lB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   fbe8094e2cd8106e88e348ed3ce97680d7ae9e7b
commit: 5aad7a29ba6037a224c3f8ff36bfb2c82a5d3f4d [8/18] rust: add revocable objects
config: x86_64-randconfig-003-20240401 (https://download.01.org/0day-ci/archive/20240402/202404020229.fdzDQ9lB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404020229.fdzDQ9lB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404020229.fdzDQ9lB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:2184:20
   |
   2184 | assert_eq!(add_two(&v), Some(30));
   |            ------- ^^ expected `&Revocable<Example>`, found `&impl PinInit<Revocable<Example>>`
   |            |
   |            arguments to this function are incorrect
   |
   ::: rust/kernel/revocable.rs:90:42
   |
   90   |     pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
   |                                          ------------------ the found opaque type
   |
   = note: expected reference `&Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_78_0::Example>`
   found reference `&impl rust_doctest_kernel_build_assert_rs_0::kernel::init::PinInit<Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_78_0::Example>>`
   note: function defined here
   --> rust/doctests_kernel_generated.rs:2178:4
   |
   2178 | fn add_two(v: &Revocable<Example>) -> Option<u32> {
   |    ^^^^^^^ ----------------------
--
>> error[E0599]: no method named `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the current scope
   --> rust/doctests_kernel_generated.rs:2185:3
   |
   2185 | v.revoke();
   |   ^^^^^^ method not found in `impl PinInit<Revocable<Example>>`
   |
   = note: the full type name has been written to 'rust/doctests_kernel_generated.long-type-7986498715854771358.txt'
--
>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:2186:20
   |
   2186 | assert_eq!(add_two(&v), None);
   |            ------- ^^ expected `&Revocable<Example>`, found `&impl PinInit<Revocable<Example>>`
   |            |
   |            arguments to this function are incorrect
   |
   ::: rust/kernel/revocable.rs:90:42
   |
   90   |     pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
   |                                          ------------------ the found opaque type
   |
   = note: expected reference `&Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_78_0::Example>`
   found reference `&impl rust_doctest_kernel_build_assert_rs_0::kernel::init::PinInit<Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_78_0::Example>>`
   note: function defined here
   --> rust/doctests_kernel_generated.rs:2178:4
   |
   2178 | fn add_two(v: &Revocable<Example>) -> Option<u32> {
   |    ^^^^^^^ ----------------------
--
>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:2249:20
   |
   2249 | assert_eq!(add_two(&v), Some(30));
   |            ------- ^^ expected `&Revocable<Example>`, found `&impl PinInit<Revocable<Example>>`
   |            |
   |            arguments to this function are incorrect
   |
   ::: rust/kernel/revocable.rs:90:42
   |
   90   |     pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
   |                                          ------------------ the found opaque type
   |
   = note: expected reference `&Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_99_0::Example>`
   found reference `&impl rust_doctest_kernel_build_assert_rs_0::kernel::init::PinInit<Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_99_0::Example>>`
   note: function defined here
   --> rust/doctests_kernel_generated.rs:2242:4
   |
   2242 | fn add_two(v: &Revocable<Example>) -> Option<u32> {
   |    ^^^^^^^ ----------------------
--
>> error[E0599]: no method named `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the current scope
   --> rust/doctests_kernel_generated.rs:2250:3
   |
   2250 | v.revoke();
   |   ^^^^^^ method not found in `impl PinInit<Revocable<Example>>`
   |
   = note: the full type name has been written to 'rust/doctests_kernel_generated.long-type-16004988436775023416.txt'
--
>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:2251:20
   |
   2251 | assert_eq!(add_two(&v), None);
   |            ------- ^^ expected `&Revocable<Example>`, found `&impl PinInit<Revocable<Example>>`
   |            |
   |            arguments to this function are incorrect
   |
   ::: rust/kernel/revocable.rs:90:42
   |
   90   |     pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
   |                                          ------------------ the found opaque type
   |
   = note: expected reference `&Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_99_0::Example>`
   found reference `&impl rust_doctest_kernel_build_assert_rs_0::kernel::init::PinInit<Revocable<_doctest_main__kbuild_src_consumer_rust_kernel_revocable_rs_99_0::Example>>`
   note: function defined here
   --> rust/doctests_kernel_generated.rs:2242:4
   |
   2242 | fn add_two(v: &Revocable<Example>) -> Option<u32> {
   |    ^^^^^^^ ----------------------

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
