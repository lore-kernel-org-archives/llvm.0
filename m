Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C452E3386;
	Mon, 24 Mar 2025 01:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742779718; cv=none; b=byxVtdAIas75F4RxBu5nTbxbuHLcfM6/uz3XLJLWWnmokWbdtwfQgKNGoJU7N6cronKU4Zjqp1vGIvYQIgKFCxm/ma2koPc5dHEHhCKcQNi0bWPzQt/ujdo4MlIrHbtEnLDBbT6F/2ZsW4M0LcD9xzCMQNZAxrjX+SWvc/9ykSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742779718; c=relaxed/simple;
	bh=BnO0vz1KbiZZOh9GLsOHVR4yiwDcy5FQiNqqi86Hemo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Caq/mr1jZNfeuYb3xNagI+ZUgJ1Qte/j/vZvi9qIQCT94w+0m6bF054de3SBPK8Sej57vgvUItJ51a+4py1SH9RqLj6B8NmXA/Aof+rrXBImUmHEvrxKijWJfWfIr9RcCoYJniRAEGyqA2KqeKknpnhpePE48rHfpdUzhw/Q/Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXWMIr9G; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXWMIr9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742779716; x=1774315716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BnO0vz1KbiZZOh9GLsOHVR4yiwDcy5FQiNqqi86Hemo=;
  b=DXWMIr9GhNE/uBatPLCCLFvtLAZn1RxCsWlaXmvbYPFcjP9gcvVENLRQ
   9N91+oEyNUKzYPv9dPToVlaQqSTbxZeliAXfQY/6ukjTRrIdfYwsc4W5t
   R06fQYg/jF4sfQDIIET02xCbO26ci22Jw1gRylik8X7UFzVXsKU0Z75wX
   hfQNOoo8AmhWPN0NToxzXqkUIxidbie/J3pywzDGgNUngOKhTqOZt1yZY
   y09RGvw7EhiGsPn+k/fI0XEPv9XqEjcJbDQwNzRmjVwjGZNa76uZjt72s
   VvU6m/W5e3myJf9X2NlJE0UWdXeQiZzBg7DalHINymIMcrX2dUQfUFKmG
   g==;
X-CSE-ConnectionGUID: REdXclLKS86HGlFwRrsjYw==
X-CSE-MsgGUID: G6okavPNQTifhyQLTmFaOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43896086"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="43896086"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 18:28:35 -0700
X-CSE-ConnectionGUID: ES91vooMQfOjtDZPWSbMrg==
X-CSE-MsgGUID: EjVZGUrZSt6a+Aqzzen5+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="123699956"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2025 18:28:32 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twWcA-000334-1f;
	Mon, 24 Mar 2025 01:28:30 +0000
Date: Mon, 24 Mar 2025 09:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Benno Lossin <benno.lossin@proton.me>,
	Tamir Duberstein <tamird@gmail.com>, Lyude Paul <lyude@redhat.com>
Subject: [linux-next:master 9369/13068] error[E0308]: mismatched types
Message-ID: <202503240917.0edGL8Pk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: ead76c3ac0dddf1104435e5e1458d12c29dfd187 [9369/13068] rust: hrtimer: allow timer restart from timer handler
config: um-randconfig-001-20250324 (https://download.01.org/0day-ci/archive/20250324/202503240917.0edGL8Pk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503240917.0edGL8Pk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503240917.0edGL8Pk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/time/hrtimer.rs:319:17
   |
   319 |     NoRestart = bindings::hrtimer_restart_HRTIMER_NORESTART,
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `u32`, found `i32`
--
>> error[E0308]: mismatched types
   --> rust/kernel/time/hrtimer.rs:321:15
   |
   321 |     Restart = bindings::hrtimer_restart_HRTIMER_RESTART,
   |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `u32`, found `i32`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
