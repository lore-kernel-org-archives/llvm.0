Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAA3283151
	for <llvm@lists.linux.dev>; Fri, 31 Oct 2025 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761900023; cv=none; b=XIqS4V0NmZPPG1Vk8YzrV5f3PztPmREVKiqFw6lwpGXKf/yO7Cc2xiNRT2O66QsZu9I2zhDgCIKY1qL/Dt1+sQmO16rDAvKL+PVzpfMO9ZN5Px04knwAsZMTWtSJGZk6kK1adxINxc5eDV994NzBLfAvuRXEMUqU4Z3MOtyfRTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761900023; c=relaxed/simple;
	bh=lEobPRPLUtvLJgGm6D2oVp+iskg4CGJ/ERaKYRsF7Q8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=idsKyc1/lX1Y1WXNFDFtYJKlj7k8nK+39j2eBlHJx3yeXXAp4mK/OILHO7dsXBMmgW7P1H8OOuLSh9H4YdsKX1As9tyItKPbNEoYHr2NyXHjkdnq3wU+UbHtXObAUxtKFC728Efdr0bVDpZuG+bIXHJVLTIx9iy0X39rFz2nXQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1XXBdn7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1XXBdn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761900022; x=1793436022;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=lEobPRPLUtvLJgGm6D2oVp+iskg4CGJ/ERaKYRsF7Q8=;
  b=O1XXBdn7T0rYx3y6C58ZcOW+y8fdYlEsLkHi/A1S5kVrnRuv9CNrmpMa
   G/Zaf/nFZkpXIv05uw8KLq/7nXIjCPln3HF+gaVokxylfZAvY7pE/+2Jz
   amKuM+xHPDc0gblQJwJYWD9LNu1Ya3Lxs6XC6w3JyK7xvgcULOCXZPmlN
   Cp7UtzA4vP9eGlrF/SxnxIOw2isWcVAb+K1f6wOwkFiLLFhetAvBIm5f5
   E3F4Wr2SKQVDTggZse+8gqup/GAc/LioYcZ60y0YYiJXK9p8CLRhKVmKA
   KhfQO+FJ4cFoqfu0oBIXl7G04waK4BqecYVgfyvMJIqkERecubHCzCxaw
   g==;
X-CSE-ConnectionGUID: YHXATdEmRrijTIZ/i1w6/w==
X-CSE-MsgGUID: 409L0aljQHipPq3nYOFIMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74347235"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="74347235"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:40:21 -0700
X-CSE-ConnectionGUID: qkmpKIy1S6uCeUj21pgabA==
X-CSE-MsgGUID: VyVZpSNZQkeGHUAbFOUW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="185388996"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.37])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:40:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, LiangCheng Wang
 <zaq14760@gmail.com>
Subject: Re: [PATCH] drm/tiny: pixpaper: Prevent inlining of send helpers to
 reduce stack usage
In-Reply-To: <20251031-fix_202510270858-v1-1-6b111d475ce2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251031-fix_202510270858-v1-1-6b111d475ce2@gmail.com>
Date: Fri, 31 Oct 2025 10:40:13 +0200
Message-ID: <0d9e5bf4036dc0706fac603764276d2327d0bc69@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 31 Oct 2025, LiangCheng Wang <zaq14760@gmail.com> wrote:
> Clang reports that pixpaper_panel_hw_init() exceeds the 8 KB stack
> frame limit:
>
>     drivers/gpu/drm/tiny/pixpaper.c:579:12: warning:
>       stack frame size (20024) exceeds limit (8192)
>       in 'pixpaper_panel_hw_init'
>
> This warning occurs because the compiler aggressively inlines
> pixpaper_send_cmd() and pixpaper_send_data() into
> pixpaper_panel_hw_init(), which inflates the estimated stack usage.
>
> Mark these two helper functions as 'noinline' to prevent inlining.
> This significantly reduces the reported stack usage without changing
> runtime behavior.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510270858.1GzE6iQg-lkp@intel.com/
> Fixes: c9e70639f591 ("drm: tiny: Add support for Mayqueen Pixpaper e-ink panel")
> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
> ---
> When building with Clang and frame size warnings enabled
> (-Wframe-larger-than=8192), the compiler reports that
> pixpaper_panel_hw_init() consumes over 20 KB of stack space:
>
>     drivers/gpu/drm/tiny/pixpaper.c:579:12: warning:
>       stack frame size (20024) exceeds limit (8192)
>       in 'pixpaper_panel_hw_init'
>
> This happens because Clang aggressively inlines
> pixpaper_send_cmd() and pixpaper_send_data() into
> pixpaper_panel_hw_init(), causing the calculated stack usage
> to balloon far beyond the warning threshold.
>
> The fix is straightforward: mark these two helper functions as
> 'noinline' to prevent inlining. This reduces the reported stack
> usage to within normal limits without changing runtime behavior.

I really *really* wish we wouldn't have to go this route at all.

But if we have to, I think noinline_for_stack is the keyword to use.


BR,
Jani.

> ---
>  drivers/gpu/drm/tiny/pixpaper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
> index 32598fb2fee7fcdea3ea0696c2bf54404fcffa2e..70e3239adfd0f86f92551991872486380489fb9b 100644
> --- a/drivers/gpu/drm/tiny/pixpaper.c
> +++ b/drivers/gpu/drm/tiny/pixpaper.c
> @@ -536,7 +536,7 @@ static void pixpaper_spi_sync(struct spi_device *spi, struct spi_message *msg,
>  		err->errno_code = ret;
>  }
>  
> -static void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
> +static noinline void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
>  			      struct pixpaper_error_ctx *err)
>  {
>  	if (err->errno_code)
> @@ -556,7 +556,7 @@ static void pixpaper_send_cmd(struct pixpaper_panel *panel, u8 cmd,
>  	pixpaper_spi_sync(panel->spi, &msg, err);
>  }
>  
> -static void pixpaper_send_data(struct pixpaper_panel *panel, u8 data,
> +static noinline void pixpaper_send_data(struct pixpaper_panel *panel, u8 data,
>  			       struct pixpaper_error_ctx *err)
>  {
>  	if (err->errno_code)
>
> ---
> base-commit: d127176862a93c4b3216bda533d2bee170af5e71
> change-id: 20251031-fix_202510270858-2e4643b00545
>
> Best regards,

-- 
Jani Nikula, Intel
