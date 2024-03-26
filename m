Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7CF13D506
	for <llvm@lists.linux.dev>; Tue, 26 Mar 2024 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484709; cv=none; b=pwC6n0iSTTYYlH5VCpQJ28zDaKAmgp7NiSEUfqzAvdTB0KtNNA1OBk6O7nf4nC0ZlkLjMaU6/+mn78ab8rudxO3aCObLjJ7P7eo263T9nCw22exiXc/NcHQ5bSYtzrtP8uZBc6gCNPYYimL5RwdO2qQOa7QhkIe1UNcvVE7YSb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484709; c=relaxed/simple;
	bh=WKb/Rem+q45UacCFCZyCwdPQfAxbGriai4/va9sGbT0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kwkepBayeVKQuWkA9qrufTnBOC9x4YZ9Qtb2vv+V5dE2ZLfWIwqrcwYiUoGLchWkbHVye3lDotAkT+6R1FqPTnhWJtbHNM5hL2b/0dBVxp6fWhNRkzd4Ass5I7deDAW2tXfP84DM+gy90y5rwbbFoI5POZjftXH6WH9X16Nufh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNp2vipO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNp2vipO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711484707; x=1743020707;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=WKb/Rem+q45UacCFCZyCwdPQfAxbGriai4/va9sGbT0=;
  b=eNp2vipOe7CEWIt9Euuhl9uzf6iDqMHT14kdMkb3nCxBW4yr5i1CEC/w
   XHyx3cYi14/pDbBs3wUhfczzQcMtzFC/OUYtBpU/80/aPnb/IMlY6rlXi
   IIJT7+RAm4ms3kd7NVejdQHwoooLKS40JihmMjJRnzLagf7W893p1OJxr
   YUriiq2y2z4w3ppVFzeMrUP5GwpZsW6/yLnowlSdn6bCA6bjQkA4nusU6
   goAkhWYvNyIUctQSaWXBG6iE+l4yaqec3ZWNdTbeGeQRMCG6JqWKbc8c7
   4+mhRBhkofnri0nup+o7INl9uIsQfM0uWa8T0aS2u+7aa0sW9C6QGJZc/
   A==;
X-CSE-ConnectionGUID: dWM7QHbgSpmtetcL8/ts8Q==
X-CSE-MsgGUID: yMbLgh1FTMm7gV/J8WUABQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17288130"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="17288130"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 13:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16509223"
Received: from eldobson-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.55.140])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 13:24:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Linus Walleij <linus.walleij@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrew Morton
 <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more
 consistent
In-Reply-To: <20240326144741.3094687-2-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326144741.3094687-2-arnd@kernel.org>
Date: Tue, 26 Mar 2024 22:24:55 +0200
Message-ID: <87jzlohhbc.fsf@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 26 Mar 2024, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The -Woverride-init warn about code that may be intentional or not,
> but the inintentional ones tend to be real bugs, so there is a bit of
> disagreement on whether this warning option should be enabled by default
> and we have multiple settings in scripts/Makefile.extrawarn as well as
> individual subsystems.
>
> Older versions of clang only supported -Wno-initializer-overrides with
> the same meaning as gcc's -Woverride-init, though all supported versions
> now work with both. Because of this difference, an earlier cleanup of
> mine accidentally turned the clang warning off for W=1 builds and only
> left it on for W=2, while it's still enabled for gcc with W=1.
>
> There is also one driver that only turns the warning off for newer
> versions of gcc but not other compilers, and some but not all the
> Makefiles still use a cc-disable-warning conditional that is no
> longer needed with supported compilers here.
>
> Address all of the above by removing the special cases for clang
> and always turning the warning off unconditionally where it got
> in the way, using the syntax that is supported by both compilers.
>
> Fixes: 2cd3271b7a31 ("kbuild: avoid duplicate warning options")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/dc/dce110/Makefile |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce112/Makefile |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce120/Makefile |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce60/Makefile  |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce80/Makefile  |  2 +-
>  drivers/gpu/drm/i915/Makefile                  |  6 +++---
>  drivers/gpu/drm/xe/Makefile                    |  4 ++--
>  drivers/net/ethernet/renesas/sh_eth.c          |  2 +-
>  drivers/pinctrl/aspeed/Makefile                |  2 +-
>  fs/proc/Makefile                               |  2 +-
>  kernel/bpf/Makefile                            |  2 +-
>  mm/Makefile                                    |  3 +--
>  scripts/Makefile.extrawarn                     | 10 +++-------
>  13 files changed, 18 insertions(+), 23 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 3ef6ed41e62b..4c2f85632391 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -33,9 +33,9 @@ endif
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
>  
>  # Fine grained warnings disable
> -CFLAGS_i915_pci.o = $(call cc-disable-warning, override-init)
> -CFLAGS_display/intel_display_device.o = $(call cc-disable-warning, override-init)
> -CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> +CFLAGS_i915_pci.o = -Wno-override-init
> +CFLAGS_display/intel_display_device.o = -Wno-override-init
> +CFLAGS_display/intel_fbdev.o = -Wno-override-init
>  
>  # Support compiling the display code separately for both i915 and xe
>  # drivers. Define I915 when building i915.
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5a428ca00f10..c29a850859ad 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -172,8 +172,8 @@ subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>  	-Ddrm_i915_gem_object=xe_bo \
>  	-Ddrm_i915_private=xe_device
>  
> -CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
> -CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
> +CFLAGS_i915-display/intel_fbdev.o = -Wno-override-init
> +CFLAGS_i915-display/intel_display_device.o = -Wno-override-init

For i915 and xe parts,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>  # Rule to build SOC code shared with i915
>  $(obj)/i915-soc/%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index 475e1e8c1d35..0786eb0da391 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -50,7 +50,7 @@
>   * the macros available to do this only define GCC 8.
>   */
>  __diag_push();
> -__diag_ignore(GCC, 8, "-Woverride-init",
> +__diag_ignore_all("-Woverride-init",
>  	      "logic to initialize all and then override some is OK");

This is nice because it's more localized than the per-file
disable. However, we tried to do this in i915, but this doesn't work for
GCC versions < 8, and some defconfigs enabling -Werror forced us to
revert. See commit 290d16104575 ("Revert "drm/i915: use localized
__diag_ignore_all() instead of per file"").

BR,
Jani.


-- 
Jani Nikula, Intel
