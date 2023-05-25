Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A45182C1
	for <llvm@lists.linux.dev>; Thu, 25 May 2023 15:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA29C433D2;
	Thu, 25 May 2023 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685028169;
	bh=XuFszSRBPecBmPpamwhZ/3NMjsg0J7+QLWgu02J+m2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFWuJfVeWnwHtZzBgI3AfL/49wJJceB7uGiz4eZL5c/lAWCthksf9BjRL2lnRho4G
	 lKXiS9tKcTX48K5QRuR4/9NHDCmzDhv2pEVwIhXNgDfM8hyHtn+kcSvg8V6XuLfx5I
	 WEclKo5JPkdVkQRqcHkYnivbsX839L5C0g6xaZrrsq3LfPXWGwn9H7ram2ZzrZ28FZ
	 TSDYGcES6Vkss8BtV97pPw/n8eYhT9vYFm9KaSwdBYtP1XViiGR1w/wZHO5v6TGPYz
	 UbYoucAhvBCoHQ+NxUYine9U8j2zf8w5kPWXqt+0bszigsghztC6uEF3rYQHzhgbyh
	 /3SOtWoMRfhyg==
Date: Thu, 25 May 2023 08:22:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] drm/amdgpu: Mark mmhub_v1_8_mmea_err_status_reg as
 __maybe_unused
Message-ID: <20230525152247.GA187374@dev-arch.thelio-3990X>
References: <20230519124438.365184-1-srinivasan.shanmugam@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519124438.365184-1-srinivasan.shanmugam@amd.com>

On Fri, May 19, 2023 at 06:14:38PM +0530, Srinivasan Shanmugam wrote:
> Silencing the compiler from below compilation error:
> 
> drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c:704:23: error: variable 'mmhub_v1_8_mmea_err_status_reg' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
> static const uint32_t mmhub_v1_8_mmea_err_status_reg[] = {
>                       ^
> 1 error generated.
> 
> Mark the variable as __maybe_unused to make it clear to clang that this
> is expected, so there is no more warning.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

Traditionally, this attribute would go between the [] and =, but that is
a nit. Can someone please pick this up to unblock our builds on -next?

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
> index 3648994724c2..cba087e529c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
> @@ -701,6 +701,7 @@ static void mmhub_v1_8_reset_ras_error_count(struct amdgpu_device *adev)
>  		mmhub_v1_8_inst_reset_ras_error_count(adev, i);
>  }
>  
> +__maybe_unused
>  static const uint32_t mmhub_v1_8_mmea_err_status_reg[] = {
>  	regMMEA0_ERR_STATUS,
>  	regMMEA1_ERR_STATUS,
> -- 
> 2.25.1
> 
