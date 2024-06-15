Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F058826ACB;
	Sat, 15 Jun 2024 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718462246; cv=none; b=IOcLFAhdQ/7q3lzvFSWe6yySw0gCpXKZMfNW2SZW57Wk21iLRHQsBaMYCESd7RlmHUi1KtWzuJ3Z96G2eYYX/fJt0At8Vt29iw95MxubLkE3EstT/XIjRpm1jcgWpReuKh8A0Z5LdCHkFWyIi9ywniFbh+IxD/DHEjY6ui4Rr/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718462246; c=relaxed/simple;
	bh=08UJ5SiSS9g5bbdEdTId3IcN/Pnqg2RemH/CHhXvSOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o1MLCAa+qQOnIQRWonmtSL7Mz6JxtZruLhiR5M1wnRiOJJtWylWJLkNCAdgpKS3XGFjehmAJGmZaogj1TQ4lym3alEg2ZANLvZduxWh1XZ8pswEcHJAGdun8at5nB3KCruyfIJqrQWfktR7yKzAsQtF3fey/b4EZ3Xm42Jqx92s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHAbwVNY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHAbwVNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718462245; x=1749998245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=08UJ5SiSS9g5bbdEdTId3IcN/Pnqg2RemH/CHhXvSOY=;
  b=XHAbwVNYlGaAzDJcPuKr8U9cVY3q2DaI1QRUPh0QCUXDTjifaU1F8APj
   wZ9ak3ktkWBPiZf0Ee6YiJ5zdox75AGK9xPztYf1V9mTpsqSbYzzPyL7U
   amB01ZS2tJ3DuCv/wYEjgUk5IZNYZnM6yAg7eiz1jV7Iq1OZKh9PWe5+c
   RVvcYV45S2dyxVFpMB7kRyjCui28ljvBMorDJza4fe5ua7uMcmda+i+JS
   NRZNewrpmBvbmVv0K+FmOY1g7cjirmo7eJLyBEkeQECq3m2DodPjobmrf
   5veyHXNfPeOwAlw486cPhWscF0nYhJ8FLN2mKfdQQbQYKGmQdmvU+/uLx
   Q==;
X-CSE-ConnectionGUID: RCGZ96bwQtmqUslRqj+JnQ==
X-CSE-MsgGUID: +eLkoraJSKSE7z3YbY1Ipg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="37869941"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="37869941"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 07:37:22 -0700
X-CSE-ConnectionGUID: mQrfOByJTUGVHS1L/DgZDQ==
X-CSE-MsgGUID: Gn5POfc0RKKxqdEGk2RbIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="45709164"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jun 2024 07:37:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIUWt-00007E-0Q;
	Sat, 15 Jun 2024 14:37:19 +0000
Date: Sat, 15 Jun 2024 22:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Wedson Almeida Filho <walmeida@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 5/21] error[E0425]: cannot find value
 `THIS_MODULE` in the crate root
Message-ID: <202406152203.flX7Kviw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   2e2592fb7d2165e68073020066789bd8860678d0
commit: b7222062b14f6c9e501a405305052fe88c5ff51e [5/21] rust: introduce `InPlaceModule`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240615/202406152203.flX7Kviw-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406152203.flX7Kviw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406152203.flX7Kviw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `THIS_MODULE` in the crate root
   --> rust/doctests_kernel_generated.rs:1649:1
   |
   1649 | / kernel::module_phy_driver! {
   1650 | |     drivers: [PhySample],
   1651 | |     device_table: [
   1652 | |         DeviceId::new_with_driver::<PhySample>()
   ...    |
   1657 | |     license: "GPL",
   1658 | | }
   | |_^ not found in the crate root
   |
   = note: this error originates in the macro `$crate::prelude::module` which comes from the expansion of the macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
