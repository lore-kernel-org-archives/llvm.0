Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0A1A40
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 06:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C235AC433C1;
	Sat, 10 Sep 2022 06:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662791764;
	bh=kTqIu9AYnaEZeHg3CmvcDxfcqDlENkBraRekvriIHic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfuddHyKZBu5NAOPSi9n6zOdHbQL2SgbWFCWyYncglBlwJu1QZpmxVfR1qT8X8pXG
	 9qBT+YF1IoZNSAmjUA7ZLf4S/iPFwFkiLqGxTqQOvOJSKAlzpfdoayv48Twj1CQJyY
	 8SgKGegJdQoRbBgwlZ6EuyzpPQT9wSjA+Dn8zS/Od9nAPLGFZC1723XQ66Q1TjijiN
	 gdRx2PEfPZn18NdXpmXfwc/XuYgOvNqbZPuaEmt6S4hld9kZZ9hBoDubz0DStOZo5q
	 6mexcBWlqHzd7fhZ2DtX45k0Z00zy6/gxcXTJdqG4MAupARfBfXOA9i4W0auUQDJ1D
	 D8sVVOxbk5jPg==
Date: Fri, 9 Sep 2022 23:36:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Menglong Dong <imagedong@tencent.com>, llvm@lists.linux.dev,
	arnd@linaro.org
Subject: Re: [TCWG CI] Failure after v6.0-rc3-161-g9cb252c4c1c5: net: skb:
 export skb drop reaons to user by TRACE_DEFINE_ENUM
Message-ID: <YxwwUuznBOqxPBR+@dev-arch.thelio-3990X>
References: <1466385441.16156.1662758167647@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466385441.16156.1662758167647@jenkins.jenkins>

On Fri, Sep 09, 2022 at 09:16:06PM +0000, ci_notify@linaro.org wrote:
> Failure after v6.0-rc3-161-g9cb252c4c1c5: net: skb: export skb drop reaons to user by TRACE_DEFINE_ENUM:
> 
> Results changed to
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 23020
> # First few build errors in logs:
> # 00:05:23 crypto/wp512.c:782:13: error: stack frame size (1160) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
> # 00:05:23 make[1]: *** [scripts/Makefile.build:249: crypto/wp512.o] Error 1
> # 00:08:01 make: *** [Makefile:1853: crypto] Error 2
> # 00:08:21 sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
> # 00:08:21 make[3]: *** [scripts/Makefile.build:249: sound/soc/atmel/mchp-spdiftx.o] Error 1
> # 00:08:48 make[2]: *** [scripts/Makefile.build:465: sound/soc/atmel] Error 2
> # 00:15:57 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
> # 00:15:57 make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
> # 00:16:16 make[3]: *** [scripts/Makefile.build:465: drivers/gpu/drm/selftests] Error 2
> # 00:28:00 make[1]: *** [scripts/Makefile.build:465: sound/soc] Error 2
> 
> from
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 23021

I think the bisect is triggering because the number of object files
built drops from 23021 to 23020 but that is not due to a new error but
rather an object file was dropped from the build (dropreason_str.o). So
nothing to do/see here.

Cheers,
Nathan
