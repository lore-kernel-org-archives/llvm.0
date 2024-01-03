Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FCA1B26C
	for <llvm@lists.linux.dev>; Wed,  3 Jan 2024 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1CfPiwx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A0CC433C7;
	Wed,  3 Jan 2024 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704298058;
	bh=Wsz1gOscufkILbBTCI9D/MbuA3f7jJHuwM82sp6t0Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1CfPiwxGNY3ZR2RNxPlmyhBuoWoLOL/+4HURsJgv5SXZgsN0Z07xeB/9mlt9RG+L
	 vu2t68Gfj+VHpf7grjeUPZ1wZrNdX39Ozp0CeHtwbnKgFsW/dew/n6N+HSv2WMpBmf
	 luRwCYTZ7fLkXWC0KpEKhUxMRLPHtSnwpfzHrBjpFJjvHx527PPAYZ8fKIo90VYg3j
	 4/F2gvhgs5C80sJB6/9haNW1PWuJ3OrNKMpqW6bsAfkyvZbj9sqbPZ7ZJ3CleT4XSB
	 5J/Eq2ykRmrB9gbulMmssXBgCdOmSWJiF4ycOi2YKjIBvuwa5BU8MXWo0iDDiEsDoi
	 ay56rjWmKB9RA==
Date: Wed, 3 Jan 2024 09:07:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] drm/xe: Fix warning on impossible condition
Message-ID: <20240103160736.GA3837497@dev-arch.thelio-3990X>
References: <20231218163301.3453285-1-lucas.demarchi@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218163301.3453285-1-lucas.demarchi@intel.com>

On Mon, Dec 18, 2023 at 08:33:01AM -0800, Lucas De Marchi wrote:
> Having a different value for op is not possible: this is already kept
> out of user-visible warning by the check in xe_wait_user_fence_ioctl()
> if op > MAX_OP. The warning is useful as if this switch() is not update
> when a new op is added, it should be triggered.
> 
> Fix warning as reported by 0-DAY CI Kernel:
> 
> 	drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
> 
> Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I am now seeing this warning in -next, can this be applied as a fix so
that our builds are not broken?

> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index b0a7896f7fcb..a75eeba7bfe5 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -46,6 +46,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  		break;
>  	default:
>  		XE_WARN_ON("Not possible");
> +		return -EINVAL;
>  	}
>  
>  	return passed ? 0 : 1;
> -- 
> 2.40.1
> 
