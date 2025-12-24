Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA62116F6;
	Wed, 24 Dec 2025 21:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766612644; cv=none; b=WjC9k3HN5kgbaR4SWMjfsg1HRumWPTExgelbGZziIZksFDxUXaKxjcULaD/4UH/DurDxkCYw6NKVjWE0UxHdOlTkoXpxYdF8SH6252Th4ptXOEWpW58n7G6X+aNUNhA+tv2e9ZXRC+T/Ql0dp/NImE4VD6wV41ehCPX89j6+UtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766612644; c=relaxed/simple;
	bh=xEgebz0697Etlz/Hub938Pt55QNzEODhMdr3iHV9tKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4sYSp57zN7UGE3LiITqPmJ9VkJqQQw7AHcLv/P5nPDbDKonJN8VMPvxXOc5YebqcrN7ca7GGw/nSXpZBs9f45/BYkIMgnkMZzpotVmLyDSrQvuRD/jzkl2AEgW/7g3vjdsSGXhkQyax2Tp2WzSztd20xv8+SPToq5J4zC1lvbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/ZbT3aU; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/ZbT3aU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766612642; x=1798148642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xEgebz0697Etlz/Hub938Pt55QNzEODhMdr3iHV9tKM=;
  b=P/ZbT3aUrWoVUv61ZqSiCJExaSpLpY3zEdrIyZl2tj6EX5FmCQdYhbKA
   WvH1Zn5Bt/9u2S+VCQRxRmeVBejRqn27Nk6U5u2C+vf5qsT95ZnSwSYJy
   siUXpGQ86VDzA7XQZxDaPYUrO7SKs5h2vF+zWuoE3CjqeVEKAGtSAW6O8
   NlSApFjsdBhi2atYFDJAnF0cDlFaSpDqvcUVm0cvkRTpEKdSdPVtGV2pU
   xcsnD5dTMFd/pkFUJnQm2It1UMsCfSYRp9iL+VGeBo5Ni9V6UPo+EO/xi
   +EOP5zLTxvNI4wTF0mPpKTL+0BPSfXDwUZlrauFfiqGfUZzg7QK5tTPl9
   g==;
X-CSE-ConnectionGUID: jp6HEJSTSfiC2DZ/Xyy4iA==
X-CSE-MsgGUID: t5JHD6NQSjiNYFHKUFzT1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71021201"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="71021201"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 13:44:01 -0800
X-CSE-ConnectionGUID: uLeLwWNeTUm/hOeZOtMeaA==
X-CSE-MsgGUID: e6HUgQ57R4qDhaC9i3/L5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="204597067"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Dec 2025 13:44:01 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYWeD-000000003Tj-3ABM;
	Wed, 24 Dec 2025 21:43:57 +0000
Date: Thu, 25 Dec 2025 05:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] rust: implement wrapper for acpi_object
Message-ID: <202512250504.qyrkLNwy-lkp@intel.com>
References: <a28e83201e1413091333509628274807e50ec170.1766331321.git.foxido@foxido.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a28e83201e1413091333509628274807e50ec170.1766331321.git.foxido@foxido.dev>

Hi Gladyshev,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 9094662f6707d1d4b53d18baba459604e8bb0783]

url:    https://github.com/intel-lab-lkp/linux/commits/Gladyshev-Ilya/rust-implement-wrapper-for-acpi_object/20251222-064506
base:   9094662f6707d1d4b53d18baba459604e8bb0783
patch link:    https://lore.kernel.org/r/a28e83201e1413091333509628274807e50ec170.1766331321.git.foxido%40foxido.dev
patch subject: [RFC PATCH 1/3] rust: implement wrapper for acpi_object
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251225/202512250504.qyrkLNwy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250504.qyrkLNwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250504.qyrkLNwy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: expected `;`, found keyword `use`
   --> rust/doctests_kernel_generated.rs:52:23
   |
   52 | use kernel::prelude::*
   |                       ^ help: add `;` here
   53 | use kernel::acpi::{AcpiObject};
   | --- unexpected token
--
>> error[E0433]: failed to resolve: use of undeclared type `AcpiBuffer`
   --> rust/doctests_kernel_generated.rs:56:25
   |
   56 |     if obj.type_id() != AcpiBuffer::ACPI_TYPE {
   |                         ^^^^^^^^^^ use of undeclared type `AcpiBuffer`
   |
   help: consider importing this struct
   |
   3  + use kernel::acpi::AcpiBuffer;
   |
--
>> error[E0412]: cannot find type `AcpiBuffer` in this scope
   --> rust/doctests_kernel_generated.rs:60:15
   |
   60 |     let obj: &AcpiBuffer = obj.try_into()?;
   |               ^^^^^^^^^^ not found in this scope
   |
   help: consider importing this struct
   |
   3  + use kernel::acpi::AcpiBuffer;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
