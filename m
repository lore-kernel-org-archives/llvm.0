Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E4337B9C;
	Thu, 30 Oct 2025 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761814152; cv=none; b=H+r9R6eCGchbQHGK1PgO7LfpdrpuADjh4ggPoZQH5BikHps2zUbxvKbs2QZUlW7KoYzbf9X3Nnqd4wwpYldz3mOf1x0odQ7UKZQ0TFqJPnFxFemWLLcBVqxsP65Dys+YUPnKg/hSCGEt9zMdUvSD+d2bOMyTzVhvBLlZxS+MBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761814152; c=relaxed/simple;
	bh=XOcAKXs6ecw5o1CNczF5owOinf7M6QvDc6JsKOLQLKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OY5Guy949V3CW90t2x9nupO2/x13WGo5vIwgzcBU21Q/kMBExlvCi11JhDC/FXr3cB137URJnq2uqbv3fcehiSsOMjd5fiwrrwB+FH05F8hXosZSvyLYPdImoxJtW6kQnLdQDUJB9vVmd9i6/L4jeOQEUyfvNbKDIgXpfQGQa0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igCWR5Z0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igCWR5Z0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761814151; x=1793350151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XOcAKXs6ecw5o1CNczF5owOinf7M6QvDc6JsKOLQLKs=;
  b=igCWR5Z0FQ6JfAJlFJPofS5+hAPJ41NJ1Bd+k2GlepyiKgWa7UNEuqkt
   dHNkFqhrcQAq7liFV7zuuDuTPF7WuQj4LdZgVlY8JteMYvwrPkrOcqGgl
   Mipry4oIIUZFwNYt6KIeEowt1MfWUcpJbBeosX5KDQs0/VCbuDXrwuVtJ
   WJPJyuQn0eX2Ww3NuP/kqktFQr1RGg5pPeMc0kuiB35BOMKVfA+C1hWwN
   bYc0wASArEAGvG+ifmbTSfVhUYNLAQ+FxUhIdNnNTsrfhMwxZS4J4bWoN
   cTvbT9VeT1yZz9v1s7BMqcyFoI2UvyJjoti0S1JpEZMUDG6RheZdrzVFC
   A==;
X-CSE-ConnectionGUID: YGo5F7BSQ96R+nZvBCjuVg==
X-CSE-MsgGUID: 4LzVT1rAS2mjW5ECdbDs6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63153802"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="63153802"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 01:49:10 -0700
X-CSE-ConnectionGUID: kpHQ2AiQRiiCGNxdg+MuXA==
X-CSE-MsgGUID: ioFqTrm6S42gQe7z1uoR7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="185776857"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Oct 2025 01:49:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEOLC-000Liw-1F;
	Thu, 30 Oct 2025 08:49:06 +0000
Date: Thu, 30 Oct 2025 16:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:clist-proto 2/2] error[E0425]: cannot find value `c_list` in
 this scope
Message-ID: <202510301610.6Qyw9VN3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git clist-proto
head:   84ed07eee17164cb7fbeceb33321d1432f1ece15
commit: 84ed07eee17164cb7fbeceb33321d1432f1ece15 [2/2] clist proto
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251030/202510301610.6Qyw9VN3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301610.6Qyw9VN3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301610.6Qyw9VN3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0412]: cannot find type `drm_buddy_block` in crate `bindings`
   --> rust/doctests_kernel_generated.rs:3595:28
   |
   3595 |     ptr: NonNull<bindings::drm_buddy_block>,
   |                            ^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0412]: cannot find type `drm_buddy_block` in crate `bindings`
   --> rust/doctests_kernel_generated.rs:3600:55
   |
   3600 |         let block_ptr = container_of!(link, bindings::drm_buddy_block, link) as *mut _;
   |                                                       ^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find value `c_list` in this scope
   --> rust/doctests_kernel_generated.rs:3787:46
   |
   3787 | let list = unsafe { CList::<Block>::from_raw(c_list) };
   |                                              ^^^^^^ not found in this scope
--
>> error[E0433]: failed to resolve: use of undeclared type `CList`
   --> rust/doctests_kernel_generated.rs:3837:12
   |
   3837 | let list = CList::<Block>::new()?;
   |            ^^^^^ use of undeclared type `CList`
   |
   help: consider importing this struct
   |
   3    + use kernel::clist::CList;
   |
--
>> error[E0412]: cannot find type `Block` in this scope
   --> rust/doctests_kernel_generated.rs:3837:20
   |
   3837 | let list = CList::<Block>::new()?;
   |                    ^^^^^ not found in this scope
   |
   help: you might be missing a type parameter
   |
   3836 | fn main() { #[allow(non_snake_case)] fn _doctest_main__kbuild_src_consumer_rust_kernel_clist_rs_253_0<Block>() {
   |                                                                                                      +++++++
--
>> error[E0425]: cannot find value `list` in this scope
   --> rust/doctests_kernel_generated.rs:3888:13
   |
   3888 | for item in list.iter() {
   |             ^^^^ not found in this scope
--
>> error[E0433]: failed to resolve: use of unresolved module or unlinked crate `clist`
   --> rust/doctests_kernel_generated.rs:3941:14
   |
   3941 | for block in clist::iter_list_head::<Block>(&list_head) {
   |              ^^^^^ use of unresolved module or unlinked crate `clist`
   |
   = help: you might be missing a crate named `clist`
   help: consider importing this module
   |
   3    + use kernel::clist;
   |
--
>> error[E0412]: cannot find type `Block` in this scope
   --> rust/doctests_kernel_generated.rs:3941:38
   |
   3941 | for block in clist::iter_list_head::<Block>(&list_head) {
   |                                      ^^^^^ not found in this scope
   |
   help: you might be missing a type parameter
   |
   3939 | fn main() { #[allow(non_snake_case)] fn _doctest_main__kbuild_src_consumer_rust_kernel_clist_rs_89_0<Block>() {
   |                                                                                                     +++++++
--
>> error[E0425]: cannot find value `list_head` in this scope
   --> rust/doctests_kernel_generated.rs:3941:46
   |
   3941 | for block in clist::iter_list_head::<Block>(&list_head) {
   |                                              ^^^^^^^^^ not found in this scope
--
>> error[E0599]: no function or associated item named `from_raw` found for struct `CList` in the current scope
   --> rust/doctests_kernel_generated.rs:3613:44
   |
   3613 | let list = unsafe { clist::CList::<Block>::from_raw(c_list_head) };
   |                                            ^^^^^^^^ function or associated item not found in `CList<Block>`
   |
   note: if you're trying to build a new `CList<Block>`, consider using `CList::<T>::new` which returns `CList<_>`
   --> rust/kernel/clist.rs:242:5
   |
   242  |     pub unsafe fn new(head: *mut bindings::list_head) -> Self {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   help: there is an associated function `from` with a similar name
   |
   3613 - let list = unsafe { clist::CList::<Block>::from_raw(c_list_head) };
   3613 + let list = unsafe { clist::CList::<Block>::from(c_list_head) };
   |
--
>> error[E0425]: cannot find value `c_list_head` in this scope
   --> rust/doctests_kernel_generated.rs:3613:53
   |
   3613 | let list = unsafe { clist::CList::<Block>::from_raw(c_list_head) };
   |                                                     ^^^^^^^^^^^ not found in this scope
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
