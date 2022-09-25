Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA320EB
	for <llvm@lists.linux.dev>; Sun, 25 Sep 2022 04:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A1CC433C1;
	Sun, 25 Sep 2022 04:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664081200;
	bh=srWY5Gkt9C75yfEBhkuv5mWJQUWlfvKd/f76X9C1/68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuJf8VcG/Uolx+EZczJ8fB3iiivW2xR+T95k0Q6CqtxM1VB/A0j6vh16boZrRtdgo
	 ncumpPXypzDmHiTlvjFmYzinzle6BkT8BPYlXOnGQ9/h9Q79J6LcVXVQT6mNgO8B2c
	 yTUBPeWl4kzL0pOJFtwm4QyktTZ8fC633H9Hfl4Zf+OgVCvQpoqxyoN6KSC62M32Uq
	 vbl7UtkDZ0gU6v5Cn+LSdqkz/tEb5ORJl6GqwXzT2gwZz7o6fYMh7qmo3TLud60nzH
	 427ofDx7b13oarIRKhMV2cj3rS6C4DbbStTngezRFCtm1zJlWvAHyF0RpJD3JpPVMJ
	 8k361kOKd03+Q==
Date: Sat, 24 Sep 2022 21:46:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] Compiler Attributes: Introduce __access_*() function
 attribute
Message-ID: <Yy/dLihBWSFzZdyq@dev-arch.thelio-3990X>
References: <20220924150715.247417-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924150715.247417-1-keescook@chromium.org>

On Sat, Sep 24, 2022 at 08:07:15AM -0700, Kees Cook wrote:
> Added in GCC 10.1, the "access" function attribute is used to mark pointer
> arguments for how they are expected to be accessed in a given function.
> Both their access type (read/write, read-only, or write-only) and bounds
> are specified.
> 
> These can improve GCC's compile-time diagnostics including -Warray-bounds,
> -Wstringop-overflow, etc, and can affect __builtin_dynamic_object_size()
> results.
> 
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Tom Rix <trix@redhat.com>
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

The GCC docs say it is 'access', instead of '__access__'. I assume it is
probably okay so:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  include/linux/compiler_attributes.h | 30 +++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index 9a9907fad6fd..465be5f072ff 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -20,6 +20,36 @@
>   * Provide links to the documentation of each supported compiler, if it exists.
>   */
>  
> +/*
> + * Optional: only supported since gcc >= 10
> + * Optional: not supported by Clang
> + *
> + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-access-function-attribute
> + *
> + * While it is legal to provide only the pointer argument position and
> + * access type, the kernel macros are designed to require also the bounds
> + * (element count) argument position; if a function has no bounds argument,
> + * refactor the code to include one.
> + *
> + * These can be used multiple times. For example:
> + *
> + * __access_wo(2, 3) __access_ro(4, 5)
> + * int copy_something(struct context *ctx, u32 *dst, size_t dst_count,
> + *		      const u8 *src, int src_len);
> + *
> + * If "dst" will also be read from, it could use __access_rw(2, 3) instead.
> + *
> + */
> +#if __has_attribute(__access__)
> +# define __access_rw(ptr, count)	__attribute__((__access__(read_write, ptr, count)))
> +# define __access_ro(ptr, count)	__attribute__((__access__(read_only,  ptr, count)))
> +# define __access_wo(ptr, count)	__attribute__((__access__(write_only, ptr, count)))
> +#else
> +# define __access_rw(ptr, count)
> +# define __access_ro(ptr, count)
> +# define __access_wo(ptr, count)
> +#endif
> +
>  /*
>   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-alias-function-attribute
>   */
> -- 
> 2.34.1
> 
