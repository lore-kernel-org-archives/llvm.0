Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B487356764;
	Sat, 16 May 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946694; cv=none; b=VpYtZkcP4ixRKWtHOMdXJHdwiRtRIDtncGOLhQCwW7XGIZH0bQm21yQHNvxKDd1+Oed4Ter5pkquPYm60nuZpoBMvAghhdzBNbKfoGnZ/jqDo/6YpyRXh+rOVoui9e3f+t/XaltyaYixcjw+guJCChHgw2xkRA+a0EJQjLMJilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946694; c=relaxed/simple;
	bh=kC0HBT9SarchGoqwLfiVYhk8mE+purbVYzNJ74o83Fk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N1hwsT5W3Ekn0k3tBBKt4KNPmuQ4ESXPo1Qw6KBBB56vjG43OIqu/il7vvBDZowrCOvUhZh+SoQ88LWo5hi3+s6QrQFOEa4USZXAucUFbWFu8hPqeW6x+N//lSZWXJUY8Gdzjgaw17OOpypJnOvib8fXrI95W3u2nTjK04hT4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNpgYvGQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNpgYvGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778946692; x=1810482692;
  h=date:from:to:cc:subject:message-id;
  bh=kC0HBT9SarchGoqwLfiVYhk8mE+purbVYzNJ74o83Fk=;
  b=TNpgYvGQYm5E3JPZPuy4P8VOpCkHDHbETZc6RI26qnt1tRk7jCFDqj92
   ivW9l/cusG7DXpUbaVyg56X0aECMCv1jsFX++4hyqrQPlctj9OeBaukMB
   bSVjD/WmG1Fokl8V69p36a4OehDOfchHEq8XYXZSIuLHfZ9Rx1Ml+sJDr
   sTOZBKHpXpYv26psDAcoXh0m8yxYBXMSZ3Q/GsIBmBqTD36+BGvQgG1Fl
   5BhE2sneG1qTQ8VvSGpYtalD2fT8GlTllwrdtZsgCID2kadFCYC3Pdcbg
   8LqyQK4O1Lasa5roGx4uRetVp4QT0L8CiTmFq/2ruWP8JIPxDQZSkr1/x
   g==;
X-CSE-ConnectionGUID: SSbwLFvkSoiUW8HW/NE+gQ==
X-CSE-MsgGUID: CSoKzJ67Su+G8Ns7uyvg0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83488964"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="83488964"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 08:51:32 -0700
X-CSE-ConnectionGUID: ooCSnYcyR3yZrAJJcpRZCg==
X-CSE-MsgGUID: JAmnlCUMR0WASAvd7s6IOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="238116238"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2026 08:51:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOHIW-000000009Lx-0qAH;
	Sat, 16 May 2026 15:51:28 +0000
Date: Sat, 16 May 2026 17:51:08 +0200
From: kernel test robot <lkp@intel.com>
To: Manos Pitsidianakis <manos@pitsidianak.is>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: warning: variable does not need to be mutable
Message-ID: <202605161734.3uEaaFFK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Manos-Pitsidianakis/rust-bindings-generate-virtio-bindings/20260513-065912
head:   dcbb217532e1f25cb932bf8b1019d1085373a6df
commit: dcbb217532e1f25cb932bf8b1019d1085373a6df samples/rust: Add sample virtio-rtc driver [WIP]
date:   4 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260516/202605161734.3uEaaFFK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161734.3uEaaFFK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161734.3uEaaFFK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: variable does not need to be mutable
   --> samples/rust/rust_virtio_rtc.rs:338:17
   |
   338 |             let mut is_exposed = false;
   |                 ----^^^^^^^^^^
   |                 |
   |                 help: remove this `mut`
   |
   = note: `#[warn(unused_mut)]` on by default
--
>> warning: variants `Tai` and `Monotonic` are never constructed
   --> samples/rust/rust_virtio_rtc.rs:113:5
   |
   109 | enum ClockType {
   |      --------- variants in this enum
   ...
   113 |     Tai = 1,
   |     ^^^
   114 |     #[doc(alias = "VIRTIO_RTC_CLOCK_MONOTONIC")]
   115 |     Monotonic = 2,
   |     ^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
