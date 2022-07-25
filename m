Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496F11873
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 15:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845A0C341C8;
	Mon, 25 Jul 2022 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658763197;
	bh=3X13M2zWSKsk9K6eMtRY6HxNjXwrwMFNjldfVjgVXv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gldGQ2ZcU5/o+uZtO3VRGEHyKadGUs7908+GD1gfKjF4O3kBAgCVPyf2qsn588USS
	 tHrBR9VDyV+8gbEDtGa+4yhFm46//azMhsb+qFZy22J+GrxcTIMHMRS2Qt1lKgpBl8
	 ULEnn70uCF97SaW1+FP+2jrEYkFJ35IgRGpuI4S+gPOkYdrnRgf2Feo4n9oBfv+eVd
	 XrMtfRYzxcO7jVDAVcua7mZbo8G8Vysq8z32vh5y9wQ/0BC8o+WCG6qL7bVUsFWV/o
	 HwP/NIoSLKlbt1U6EUk7UDQ5y41jygI4yJO9VuoXmx0LJtBPz371c+s4uQmSuxumUG
	 GGl4Xgk9mY+rA==
Date: Mon, 25 Jul 2022 08:33:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Yury Norov <yury.norov@gmail.com>, llvm@lists.linux.dev,
	arnd@linaro.org
Subject: Re: [TCWG CI] Regression caused by linux: lib/nodemask: inline
 next_node_in() and node_random()
Message-ID: <Yt63uwyLKqQl2Sak@Ryzen-9-3900X.>
References: <1255100749.2407.1658623869025@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1255100749.2407.1658623869025@jenkins.jenkins>

On Sun, Jul 24, 2022 at 12:51:08AM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by linux: lib/nodemask: inline next_node_in() and node_random():
> commit bbe8fb1a3c5301384d54cd6d722850182817358e
> Author: Yury Norov <yury.norov@gmail.com>
> 
>     lib/nodemask: inline next_node_in() and node_random()
> 
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 20659
> # First few build errors in logs:
> # 00:04:42 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
> # 00:04:42 make[1]: *** [crypto/wp512.o] Error 1
> # 00:08:42 make: *** [crypto] Error 2
> # 00:11:07 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
> # 00:11:07 make[4]: *** [drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
> # 00:11:32 make[3]: *** [drivers/gpu/drm/selftests] Error 2
> # 00:21:27 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack frame size (1096) exceeds limit (1024) in 'cfi_intelext_writev' [-Werror,-Wframe-larger-than]
> # 00:21:27 make[3]: *** [drivers/mtd/chips/cfi_cmdset_0001.o] Error 1
> # 00:21:43 make[2]: *** [drivers/mtd/chips] Error 2
> # 00:21:43 sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) exceeds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]
> 
> from
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 20660

This appears to be a false positive unless I am missing something. The
number of artifacts built does drop due to that commit but it is because
the code is being shuffled from nodemask.c to nodemask.h, dropping
nodemask.c altogether.

Between the two logs, there are an even number of errors per file.

$ rg "error: " /tmp/{good,bad}.log | string split -f 2 ' ' | string split -f 1 : | sort | uniq -c
      2 crypto/wp512.c
      4 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dce_calcs.c
      2 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c
      2 drivers/gpu/drm/selftests/test-drm_mm.c
      2 drivers/mtd/chips/cfi_cmdset_0001.c
      2 drivers/ntb/hw/idt/ntb_hw_idt.c
      4 drivers/staging/fbtft/fbtft-core.c
      2 drivers/staging/rtl8723bs/core/rtw_security.c
      2 sound/soc/intel/avs/path.c

Cheers,
Nathan
