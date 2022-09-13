Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96117B
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 08:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F449C433D6;
	Tue, 13 Sep 2022 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663057433;
	bh=u9m2OnqWVhcUZaNttDqjurVTaOz5YBoTyN8mmbaGZCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0ZFi/uiP5o85WS236ZsGgE43OcT5sT6gUaALPqkKsouWJQYxZtCUpHfzZWuE5HFi
	 gSzOjF6LvcDiIGs/q0QawJBsR6QCplhLCJp1x3gF5mCWNX9sToS9Mw6QTlDWpsQPkF
	 dGtdD1Bs1jEO7t/F3AKP4iLwU73PJq+ifqunnZU2dun6eZShFc20Gu+PQwbt1R+AT1
	 wJoCFv9LHnc+O572+IKsQT2MZpesc7WPg+x2vs8mu7UT6reJvlh3JZV4kxPuU39qz7
	 x15y5392nt5WauVRb1yY4QLAUllHoHx1PqkIIqcVtKaakJ+XqwiYVgjylVMHR3q3QL
	 eTPtO07PCHWUQ==
Date: Tue, 13 Sep 2022 01:23:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
	arnd@linaro.org
Subject: Re: [TCWG CI] Failure after v6.0-rc4-215-ge35ff25f9fda: Merge tag
 'linux-kselftest-kunit-fixes-6.0-rc5' of
 git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest
Message-ID: <YyA+F3TOjEbQckeO@dev-arch.thelio-3990X>
References: <1365091032.18272.1663040624336@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365091032.18272.1663040624336@jenkins.jenkins>

On Tue, Sep 13, 2022 at 03:43:43AM +0000, ci_notify@linaro.org wrote:
> Failure after v6.0-rc4-215-ge35ff25f9fda: Merge tag 'linux-kselftest-kunit-fixes-6.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest:
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
> 23021
> # First few build errors in logs:
> # 00:05:09 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
> # 00:05:09 make[1]: *** [scripts/Makefile.build:249: crypto/wp512.o] Error 1
> # 00:08:22 make: *** [Makefile:1853: crypto] Error 2
> # 00:15:17 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
> # 00:15:17 make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
> # 00:15:42 make[3]: *** [scripts/Makefile.build:465: drivers/gpu/drm/selftests] Error 2
> # 00:31:04 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1434:12: error: stack frame size (1080) exceeds limit (1024) in 'smu_v13_0_7_get_power_profile_mode' [-Werror,-Wframe-larger-than]
> # 00:31:04 make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.o] Error 1
> # 00:33:33 drivers/staging/rtl8723bs/core/rtw_security.c:1288:5: error: stack frame size (1040) exceeds limit (1024) in 'rtw_aes_decrypt' [-Werror,-Wframe-larger-than]
> # 00:33:34 make[3]: *** [scripts/Makefile.build:249: drivers/staging/rtl8723bs/core/rtw_security.o] Error 1
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
> 23022

This appears to have a similar cause as before [1]. This is allmodconfig
so I suspect the restriction of CONFIG_USB4_KUNIT_TEST causes
drivers/thunderbolt/test.o to be dropped from the build.

TL;DR: Bot's heuristic for determining a regression (fewer nunber of
objects built plus a build error) was falsely triggered.

[1]: https://lore.kernel.org/YxwwUuznBOqxPBR+@dev-arch.thelio-3990X/

Cheers,
Nathan
