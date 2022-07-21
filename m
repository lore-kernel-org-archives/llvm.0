Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637A3441A
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 22:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FA7C3411E;
	Thu, 21 Jul 2022 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658443783;
	bh=dKUrk78OgtetuoAF/9u8g6a6j9uG5l/0XLh3R5CGxE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqgOLXT35fWkn/SmUNEBGFoC2Is9+wb2k5IUAy3Dw5xB1wB+YULbBQchWvbuKlc3E
	 3ZDmCsaNifmYf2AzVKNPTyBVPe0YgU56Eeg9MXcGDX73o8vibJ6vipFON5YsWydMps
	 rOHsEgMn1GZzNgcGeHhv581JTv9qmwZG8KSl0ddxEeolaEqNVp0hoUG+9J8jcznFBN
	 cWWjfapfHAVRsfPn+pLNHWfkbTd/Dqb7G0ZBWIBpC8ZXupVZSpnCudV6RFY+NHeH5G
	 oPhigByfiQQIT1UxFKSIEcRcPqHVOgLCRHKBg++7nJCPqdda6VTySVEHnJDqMURsQr
	 uuJfnrXmqXNMw==
Date: Thu, 21 Jul 2022 15:49:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Nikita Popov <npopov@redhat.com>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [IR] Don't use
 blockaddresses as callbr arguments
Message-ID: <YtnYBVt2OH/xqB+S@dev-arch.thelio-3990X>
References: <1533469619.2122.1658442774096@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1533469619.2122.1658442774096@jenkins.jenkins>

On Thu, Jul 21, 2022 at 10:32:53PM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: [IR] Don't use blockaddresses as callbr arguments:
> commit 2a721374aef326d4668f750d341c86d1aa1a0309
> Author: Nikita Popov <npopov@redhat.com>
> 
>     [IR] Don't use blockaddresses as callbr arguments
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
> 22762
> # First few build errors in logs:
> # 00:05:01 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
> # 00:05:01 make[1]: *** [scripts/Makefile.build:249: crypto/wp512.o] Error 1
> # 00:06:56 make: *** [Makefile:1843: crypto] Error 2
> # 00:11:00 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
> # 00:11:00 make[4]: *** [scripts/Makefile.build:249: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
> # 00:11:10 sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) exceeds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]
> # 00:11:10 make[4]: *** [scripts/Makefile.build:249: sound/soc/intel/avs/path.o] Error 1
> # 00:11:11 make[3]: *** [scripts/Makefile.build:466: drivers/gpu/drm/selftests] Error 2
> # 00:11:22 make[3]: *** [scripts/Makefile.build:466: sound/soc/intel/avs] Error 2
> # 00:11:25 make[2]: *** [scripts/Makefile.build:466: sound/soc/intel] Error 2
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
> 22764

I guess that change introduced

  ../drivers/mtd/nftlcore.c:673:12: error: stack frame size (1144) exceeds limit (1024) in 'nftl_writeblock' [-Werror,-Wframe-larger-than]
  static int nftl_writeblock(struct mtd_blktrans_dev *mbd, unsigned long block,
             ^
  1 error generated.

for ARCH=arm allmodconfig, if I am diffing the errors correctly. To be
honest, it seems like this might just be a KASAN + inlining issue like
we have seen a lot of, rather than a specific issue with that change but
I could be wrong.

Cheers,
Nathan
