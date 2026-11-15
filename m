Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784061;
	b=BSmyXIml7FmORpHy3gM0Z2xtSZhI4Xtl6eq7jKaF9UYxDRgKl+DboJhMcvYIjmcRoj6X
	 3eR6G/5dst2bTQJWNzR+hsPmNwOBsQ0OIKwdpGh5s6B6/Bf+LcwPSe8bVN+x2XepCjr0L
	 IbrrfxAdOnJXOv+1qgaALhOG/moYyDizuv+8KPCEQRBnpMnEGfDJJdaiZllURgZtVe/pg
	 ip6kbPllDW111U50rvqbXjyaLwcICz3/6JZIURw8+mkisFkj8XGoFq6xXKCr++79pgAUN
	 xc74Fo9Sxu5ydo4lvf4uAFgjl6TfQpAj07CVlzfSZGUkm4drRbv8DQysOhW+atuwj1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784061;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8971y8BjMAyggDW8ETCObk6ax7fbcDcj/Mtdeb9FC5k=;
	b=PkbVo3yG48iDJlTlmmD5aMyJGofhOBScUsw1vo69BtwahR+KIVKLmTRTsOV++KHJkDZF
	 0nyjy1xU5ZZzduQImKnW8sgl60oxRZgB4E82kxRX1/CoASMjtwFwxe/5VFbbLGUOAcLoJ
	 IwNexzFr9OrTjP0H0UXtyLyJgkBWCSiyVFcc9y/xVg0jdVGCylmhCu4IEof+LrijYgUnV
	 sOYR1WTyd2m7ByVctAJvpa3HGYQ4uICFaeEmBsaqI7HZgxgB4rUCXR2WPMj81m0DNcKnO
	 jwrefS6b1Uh4qvosa64apXOu9+2l/4GKVIgYdVZYGJe5lZv6BSkKU19V2PkdEs2FfXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GKPa0Nw5;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695F3606A32C;
	Sun, 15 Nov 2026 23:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 695F3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GKPa0Nw5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794784061; x=1826320061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vBsIBFjd51c+RtM9uJ3edtPSSE5WdmPMwKgKgqr5zaI=;
  b=GKPa0Nw5jc4RE23sFO0EzH7zRvFJGIkoA3BQZ+ZVapFKRkk/5+KGxqDD
   moPuofS5PFudx6ZGA03Xq/MwYjv7ChA9hOof85xb+pRKgxJI/GZXbUweY
   gStnsZ9XYr1cUWmKRYyPI5GtD+l4wSCLwIje+aFdOzy4sbHK9YAx+oN+e
   jcmQVwA0MjowdoIq1MMrMi7B+gb93feJs/4mu7qQEZ3TO7TMtPxes/hJu
   x/dMtp/AH6npKmUeKxDYjv6s+VUEm0HZwy5afR9LzL4OQQlbOF8gTCF82
   PZ/vlFpMp2xehYMntcvwvX3VxGd0m3Q/dk/Be0/Q+Xm3qxOUfsF28+ovO
   A==;
X-CSE-ConnectionGUID: wV1ojNqQSQ+Ta7c1aFXMTw==
X-CSE-MsgGUID: MsiHZMe2Qmi6cZgFirDuSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3507854"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3507854"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 15:07:40 -0800
X-CSE-ConnectionGUID: T0clSzB4Q+qj2I5XBNZXdA==
X-CSE-MsgGUID: oOzTsgjDSVa3mPwyHThFlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9481327"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2026 15:07:36 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSjJt-000000017Qg-0RDt;
	Sun, 15 Nov 2026 23:07:33 +0000
Date: Mon, 16 Nov 2026 07:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, dakr@kernel.org,
	aliceryhl@google.com, daniel.almeida@collabora.com,
	airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org,
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	work@onurozkan.dev, boris.brezillon@collabora.com
Subject: Re: [PATCH v8 2/3] drm/tyr: add GPU reset infrastructure
Message-ID: <202611160607.TNmf1CMV-lkp@intel.com>
References: <20261113-tyr-reset-impl-v8-2-2ee298ac9808@onurozkan.dev>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-tyr-reset-impl-v8-2-2ee298ac9808@onurozkan.dev>

Hi Onur,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.4-rc2 next-20261113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/drm-tyr-add-GPU-reset-infrastructure/20261113-173227
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261113-tyr-reset-impl-v8-2-2ee298ac9808%40onurozkan.dev
patch subject: [PATCH v8 2/3] drm/tyr: add GPU reset infrastructure
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261116/202611160607.TNmf1CMV-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160607.TNmf1CMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160607.TNmf1CMV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved imports `kernel::workqueue::OwnedQueue`, `kernel::workqueue::ScopedWork`, `kernel::workqueue::ScopedWorkItem`
   --> drivers/gpu/drm/tyr/reset.rs:49:9
   |
   49 |         OwnedQueue,
   |         ^^^^^^^^^^ no `OwnedQueue` in `workqueue`
   50 |         Queue,
   51 |         ScopedWork,
   |         ^^^^^^^^^^ no `ScopedWork` in `workqueue`
   52 |         ScopedWorkItem, //
   |         ^^^^^^^^^^^^^^ no `ScopedWorkItem` in `workqueue`
--
>> error[E0433]: cannot find `new_scoped_work` in `kernel`
   --> drivers/gpu/drm/tyr/reset.rs:185:25
   |
   185 |                 kernel::new_scoped_work!("tyr::reset", Controller::new(pdev, iomem))
   |                         ^^^^^^^^^^^^^^^ could not find `new_scoped_work` in `kernel`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
