Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F061214AD2B;
	Thu, 29 Aug 2024 05:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911133; cv=none; b=J/rvv6NNhGt3ZC6GUX+NxhlGho9/TGOYreM/1lg+Yp9P2tpsz/8bl6PHDXUUQCatKkMAG55jQc/lTTMtlyvTbjof1u9+W7dG9hcJ7x//P8GGs9/bDYv0QahSUsLNOTDVrF/+gU9uFik/jAsB1Du+PqKwlu8H9jT62y63LtWUkTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911133; c=relaxed/simple;
	bh=w8kdubeaRES+O2pTAbe6c1GMjiwGULVFBoXMpWKj8aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGVoTNp+wYlFTH1WNkpCHyXZpKcAIYyqmqS/iYBjvFWeZtcmMZ9+V8NFit+N7/j/w/C6v6SqSElRzf3ltTNN6ViOAqOJNkQdpYZ+PSHMDR4+rUmo6eMhU0sstx19pHddSKg7gNtb61sdAtD2OoiswrZG7EljHHfkvaL2vFJKZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbHu/kz0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbHu/kz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724911131; x=1756447131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w8kdubeaRES+O2pTAbe6c1GMjiwGULVFBoXMpWKj8aM=;
  b=CbHu/kz0nvmDWWVWw4c7z49TzqPBP4eTkgNN314Ke4DoHhT7X0dMIqRK
   YKAWxMj38McjBMYbCO5pE+9pvjhvZ/XnGimkr6HYU83Gft/R1Vaapp7Nu
   X6olPD4MmO8uiFUHNxoeQdysMjnzeenon2uCraa73PsQLua3fBgQBXiF4
   1vNCc4GNC1kCvzGzA2tYo6LHSO34F6lFPQwq4sY78/M12q/JA5K+i/S/4
   Ofcu41F/Ugc1V83+c0j3sv7JRv8+1EYodand6KKdBBfkradmaYthOPkit
   ppOzKL57LG9K7CyVHUnve6qR5bSbO9h6SEgW2WqSrfFq5E670D3k1jwwC
   g==;
X-CSE-ConnectionGUID: EV1fY9EqQHunLu22Gxaa/w==
X-CSE-MsgGUID: qs9xS0EXSla9sPTwgxeRAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34051023"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="34051023"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 22:58:48 -0700
X-CSE-ConnectionGUID: Gj0urNVGTKijjqAbRLUS0A==
X-CSE-MsgGUID: dSD2igitRueNd6nehKzH0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="86677180"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Aug 2024 22:58:46 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjYBA-000Lks-1J;
	Thu, 29 Aug 2024 05:58:44 +0000
Date: Thu, 29 Aug 2024 13:58:37 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] rust: experiment with `#[derive(SmartPointer)]`
Message-ID: <202408291322.NtNoDrv4-lkp@intel.com>
References: <20240823-derive-smart-pointer-v1-1-53769cd37239@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823-derive-smart-pointer-v1-1-53769cd37239@google.com>

Hi Alice,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on b204bbc53f958fc3119d63bf2cda5a526e7267a4]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-experiment-with-derive-SmartPointer/20240826-125309
base:   b204bbc53f958fc3119d63bf2cda5a526e7267a4
patch link:    https://lore.kernel.org/r/20240823-derive-smart-pointer-v1-1-53769cd37239%40google.com
patch subject: [PATCH RFC] rust: experiment with `#[derive(SmartPointer)]`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240829/202408291322.NtNoDrv4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291322.NtNoDrv4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291322.NtNoDrv4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `core::marker::SmartPointer`
   --> rust/kernel/list/arc.rs:10:35
   |
   10 | use core::marker::{PhantomPinned, SmartPointer};
   |                                   ^^^^^^^^^^^^ no `SmartPointer` in `marker`
--
>> error[E0432]: unresolved import `core::marker::SmartPointer`
   --> rust/kernel/sync/arc.rs:30:27
   |
   30 |     marker::{PhantomData, SmartPointer},
   |                           ^^^^^^^^^^^^ no `SmartPointer` in `marker`
--
>> error: cannot find attribute `pointee` in this scope
   --> rust/kernel/list/arc.rs:163:22
   |
   163 | pub struct ListArc<#[pointee] T, const ID: u64 = 0>
   |                      ^^^^^^^
--
>> error: cannot find attribute `pointee` in this scope
   --> rust/kernel/sync/arc.rs:131:18
   |
   131 | pub struct Arc<#[pointee] T: ?Sized> {
   |                  ^^^^^^^
--
>> error: cannot find attribute `pointee` in this scope
   --> rust/kernel/sync/arc.rs:475:28
   |
   475 | pub struct ArcBorrow<'a, #[pointee] T: ?Sized + 'a> {
   |                            ^^^^^^^
--
>> error[E0635]: unknown feature `derive_smart_pointer`
   --> rust/kernel/lib.rs:16:12
   |
   16 | #![feature(derive_smart_pointer)]
   |            ^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
