Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCFB443C
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 16:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EF4C433D7;
	Tue,  9 Aug 2022 16:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660062974;
	bh=KQIbq1M7KiQ601fejWiMxVueLyd23HzAj7uEElLFxgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAs8/xzhrFvK6sqOrZ5ZPdRMnvP1npJqlA3BIMJ/KKViTn4+sMI39HwQNNWTKoiWT
	 HHn37o1IM2dG3IABKuFEJTh8BhQOWyduIzisvHRr5fsmWBempzIBR8LOgpOvupdJra
	 mpKVzj9U16VMhNSpzkkTlN9Y3MbNPtRX+/B2tv32g6EqqubtCxbWqmizKsfyO3czUB
	 33hAk7NOEoB14XBzaEiTq9vnONrkB61Wpv0SkAJQWPr+pW9qcfMS9IKcYZTLQsID7P
	 hs/hTaLCCt0e+nciY7VNCV5uacYAw7W5V7MvfW0cEHtBaiTwBgCMUhUBpL5mczezWi
	 RKMDDywOXGrBQ==
Date: Tue, 9 Aug 2022 09:36:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Mark Brown <broonie@kernel.org>,
	kernel@collabora.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] selftests: add missing ')' in lib.mk
Message-ID: <YvKM/J5xO8gKto+p@dev-arch.thelio-3990X>
References: <7de08f7f11551d6b8195c3e5d801db2fae3f49a9.1660048017.git.guillaume.tucker@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7de08f7f11551d6b8195c3e5d801db2fae3f49a9.1660048017.git.guillaume.tucker@collabora.com>

On Tue, Aug 09, 2022 at 03:20:46PM +0200, Guillaume Tucker wrote:
> Add missing closing ')' in lib.mk in a call to $error().  This only
> affects LLVM / Clang builds.
> 
> Fixes: 795285ef2425 ("selftests: Fix clang cross compilation")
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  tools/testing/selftests/lib.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index 947fc72413e9..a87f60873e5b 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -20,7 +20,7 @@ CLANG_TARGET_FLAGS              := $(CLANG_TARGET_FLAGS_$(ARCH))
>  
>  ifeq ($(CROSS_COMPILE),)
>  ifeq ($(CLANG_TARGET_FLAGS),)
> -$(error Specify CROSS_COMPILE or add '--target=' option to lib.mk
> +$(error Specify CROSS_COMPILE or add '--target=' option to lib.mk)
>  else
>  CLANG_FLAGS     += --target=$(CLANG_TARGET_FLAGS)
>  endif # CLANG_TARGET_FLAGS
> -- 
> 2.30.2
> 
