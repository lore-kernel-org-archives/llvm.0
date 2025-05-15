Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A02D1DDD1
	for <llvm@lists.linux.dev>; Thu, 15 May 2025 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329725; cv=none; b=thTdybL8LKSTT3iNH+NbTwCLPCbL9x/nAPOG9gB131HLiYeN7QM0Zh/6ju5u8PFW21QAt+PXgkN3kWHh73B/ZdlfYvCendXPJQWtiH4LW5eFm5Gz596l7qO4GMoUWyPS+odRykysZ/GkF2lCvUntw3jPCvtAAnj3E1YskLKFpLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329725; c=relaxed/simple;
	bh=mfCeoOfwRJ2IubXApVWQduxn7NdySIMTBa5CH/dXP+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eX3vu0FC374Lyi4pqRGoMgto4Vc6n3g9wMyVhZCTq85a3wszSOAR5ZfJ0XbS8Dbvex6irRpVfB0NOkBbOXaz3HpJOe8okokggMig/SB8Dr2hwApT9Ihtw5n1MtexbFH+rwyznOZb1sTnVAT83M5y3tpLWAtkr6OZpCc0xnRcLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dlf2q3Z5; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dlf2q3Z5"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7424c24f88bso1673813b3a.1
        for <llvm@lists.linux.dev>; Thu, 15 May 2025 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747329722; x=1747934522; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZkQs5Y9+0MeoeQo27zBlTtClsZ5pt01lNLAK9VkB3I=;
        b=Dlf2q3Z58slqJ784LGNZr8b7ZVG901XoCGrZXls1DIGM6sx5FRGs0dPuYxm4ckRPg6
         gaiVHbA/zqiRvURgMu/xzQkvPSfhonxKNe7Y4/FxtomMOaapyfVribZXkeGOF9+cALwY
         oVpHxrDX7ZqUgb3YktV007zt0JD3tdM8BaQYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329722; x=1747934522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZkQs5Y9+0MeoeQo27zBlTtClsZ5pt01lNLAK9VkB3I=;
        b=YDXFCkLxDN2607JL/mc93qC/C1ixqBcUxLGftW8ztNbyXtVDMdiAmoO4S1xEho5vso
         wEzDiVgKVDXq3dDZLPkJWO/cPy54omyOLwygpLw1tVlQVw6y5kulrtjfDiDbiTaYOxWT
         XhIzouNj+DD289npCQg68pdu4n5SeR4e+foqiKMNQ2ftHlsW+Gm+OVKXdq5Nk2M+0o3i
         puNDvb7o1TaV9/NbcCSTLyGK3Be67oKo/KK9dHc+1lSzzCDS4eDXtXJLPzAIITYjl3bg
         6dC9JJlqn2FT/WLX63e5PAfR/FXkKzQhjageJiUfJSbpCvNFlFCVOQ1EiPM7nD+R0Kz8
         A/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDijVX9TpYQFxChYMAEOtSoV7zIiHSED5Pxl1XzhU0kiWXlP5IA8lbgRvAU926V+HpgyUS@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3AMGWtoeMKgauKXnU6pG5JXwgUo3n2vt24XOvwjokYr02yO77
	Tfp6xp4XT1780Cg7a1wIHdvy2ja5P+Qfyri5upM/iku65vu1pp97S3CbyUaHbLzKlg==
X-Gm-Gg: ASbGnct+PWENbx+LPpKdamfvwMn9baRDBBV8YBUbja9zXLMzE6zYnYL/dCLbQitphvq
	4wbvrHv1P0I+U2WO8j0VxbZ/iVy1hzg+UoJMP27ULQZBiLAu11WryESA7FA9T29hHdsyN4Nkx1w
	UZwPmBocqyVpWeO4SLhj6lyniqMTmM+ifb8HeGkcUyN5u0orWjMmLc1z3rO6NvvdwmY5cIpQuXq
	aStisCk81cBjWMbwSac4zHQMC7NdOM8joZ4zHrGqb8QjBtwjB8IYLvLfbtZIpHSNJx9WZ5QalQT
	z8yO7rnkBkeUluBR/pznUz8lLfNNiINDa3S1j1YjGLZRM9+obnTZgnOaHya0J6BPonaZaqeQe4O
	BbSFjr3XoYcQaRQ==
X-Google-Smtp-Source: AGHT+IGoidqfL8uEq7VTSHRz9j2OBbBO6mNxzWcPuV572jAmJW70jDu4s7p58cVo+XRQEqjyzJkCSw==
X-Received: by 2002:a05:6a00:1822:b0:740:a879:4f7b with SMTP id d2e1a72fcca58-742a98a0cc1mr245972b3a.18.1747329722449;
        Thu, 15 May 2025 10:22:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cd06:335b:936a:7dc1])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-742a973a261sm69730b3a.84.2025.05.15.10.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:22:01 -0700 (PDT)
Date: Thu, 15 May 2025 10:21:59 -0700
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] genirq: Add kunit tests for depth counts
Message-ID: <aCYit48N85WpjmiN@google.com>
References: <20250514201353.3481400-3-briannorris@chromium.org>
 <202505152136.y04AHovS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505152136.y04AHovS-lkp@intel.com>

Hi Thomas,

On Thu, May 15, 2025 at 10:01:18PM +0800, kernel test robot wrote:
> patch link:    https://lore.kernel.org/r/20250514201353.3481400-3-briannorris%40chromium.org
> patch subject: [PATCH v2 2/2] genirq: Add kunit tests for depth counts

First of all, thanks for the help, and for applying patch 1. I see that:
1) this bot noticed a trivial problem with patch 2; and
2) I received notification that patch 2 was applied to tip/irq/core, but
3) I can't find it there any more.

I'm not sure if #3 is because you dropped it (e.g., due to #1's report)
or some other reason, so I'm not sure what to do next. Possibilities:

(a) send the trivial fix separately, as a fixup (against what tree?)
(b) resend an improved patch 2 on its own, against tip/irq/core
(c) just drop it, because you have deeper reasons to not want these
    tests.

I'm fine with anything you'd like, although I do think there's value in
providing unit tests for corner cases like this.

See below for the trivial fix, for the record. I can send it separately
if you'd like.

> config: i386-buildonly-randconfig-004-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152136.y04AHovS-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152136.y04AHovS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505152136.y04AHovS-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ucs2_string.o
> ERROR: modpost: "irq_domain_alloc_descs" [kernel/irq/irq_test.ko] undefined!
> ERROR: modpost: "irq_to_desc" [kernel/irq/irq_test.ko] undefined!
> ERROR: modpost: "irq_shutdown_and_deactivate" [kernel/irq/irq_test.ko] undefined!
> >> ERROR: modpost: "irq_activate" [kernel/irq/irq_test.ko] undefined!
> >> ERROR: modpost: "irq_startup_managed" [kernel/irq/irq_test.ko] undefined!

The test Kconfig symbol should be bool, not tristate. Some of the
functions required for the test are non-modular.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505152136.y04AHovS-lkp@intel.com/
Signed-off-by: Brian Norris <briannorris@chromium.org>

--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -145,7 +145,7 @@ config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 	bool
 
 config IRQ_KUNIT_TEST
-	tristate "KUnit tests for IRQ management APIs" if !KUNIT_ALL_TESTS
+	bool "KUnit tests for IRQ management APIs" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
 	imply SMP
