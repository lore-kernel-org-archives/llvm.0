Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B078C08
	for <llvm@lists.linux.dev>; Fri, 16 Dec 2022 23:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AC7C433EF;
	Fri, 16 Dec 2022 23:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671232358;
	bh=lYqEm1fOBG2ZvsK3262UnpfCxKIr59xmbX4WUI9+htU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3aljbYPMsnGlPeHgiK1DUQ3xwr0d4fmiMCs/8vmBzIu1sHmTNOQohXKuiWHs1P6j
	 TlSo1xTs4gA6iuOV472eg7VdT4EFmFc8ahjLAjxkKywTKAUN39ypaKdLucRfW9Tmzw
	 90tWJIJWSTjrg2yxPtx2FLdw/qdXyHvfZm4hIU8UX3VDxcxbRTHnNceemIpwmWdqPJ
	 5JRuKD+Re771M2FAFWHkKKWtK2rnl8XKcglscbZ5sPgU/QbmmGTzeVNDwoPfecKK47
	 Gu50yb9q7pFbIzHph/83s7xWEeFCSL9vZyxUGmhswKq6DPDyXYqfd+hU/xIWjcTIqp
	 gjG9euIKIPoiA==
Date: Fri, 16 Dec 2022 16:12:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
	Daniel Latypov <dlatypov@google.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] drm/tests: reduce drm_mm_test stack usage
Message-ID: <Y5z7ZJdioD0Nyqss@dev-arch.thelio-3990X>
References: <20221215163511.266214-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215163511.266214-1-arnd@kernel.org>

On Thu, Dec 15, 2022 at 05:34:49PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The check_reserve_boundaries function uses a lot of kernel stack,
> and it gets inlined by clang, which makes __drm_test_mm_reserve
> use even more of it, to the point of hitting the warning limit:
> 
> drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame size (1048) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe-larger-than]
> 
> When building with gcc, this does not happen, but the structleak
> plugin can similarly increase the stack usage and needs to be
> disabled, as we do for all other kunit users.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/tests/Makefile      | 2 ++
>  drivers/gpu/drm/tests/drm_mm_test.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index b29ef1085cad..f896ef85c2f2 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -12,3 +12,5 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>  	drm_mm_test.o \
>  	drm_plane_helper_test.o \
>  	drm_rect_test.o
> +
> +CFLAGS_drm_mm_test.o := $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
> index 89f12d3b4a21..90a5becc99b8 100644
> --- a/drivers/gpu/drm/tests/drm_mm_test.c
> +++ b/drivers/gpu/drm/tests/drm_mm_test.c
> @@ -298,7 +298,7 @@ static bool expect_reserve_fail(struct kunit *test, struct drm_mm *mm, struct dr
>  	return false;
>  }
>  
> -static bool check_reserve_boundaries(struct kunit *test, struct drm_mm *mm,
> +static bool noinline_for_stack check_reserve_boundaries(struct kunit *test, struct drm_mm *mm,
>  				     unsigned int count,
>  				     u64 size)
>  {
> -- 
> 2.35.1
> 
