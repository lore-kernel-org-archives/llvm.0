Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837501AA69
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 20:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC47C433C7;
	Thu, 17 Aug 2023 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692303186;
	bh=aziOaixc2lJtyRiMlmlj48+cS+C2YnQu5Q+Dc0tYZJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXbMwcYfJeZgNSioEpHIUAvaMjwt2lp0UpdvmvRaAVx3iXbtYLkGVIjJANaVNu4ri
	 NEa+0Avfz2wJvexiO/a66rFmyFsFQmsQlKXMIn7YDDUfm85PeXKW7dZ+nPvBRD02Li
	 GwivvrWc3I2tNnz94wSF6KU7ZFZeUHTUwOhSFogweNAqDu2kruTE6k60IN2dK1hCVM
	 2fvHeSAjdLfEH70UxanorntRlE41DpimfTxy/vwP51hIUA9oIjebc+CeMUBnOyoxdJ
	 vSAkdNRyrDyjMhZVnbxb528+AD9k59jwYnAuVcwd7fI6HeqRIARUMZWw2XFuARhDKn
	 1ZSt1e7arKhBw==
Date: Thu, 17 Aug 2023 13:13:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Compiler Attributes: counted_by: Adjust name and
 identifier expansion
Message-ID: <20230817201304.GA2714089@dev-arch.thelio-3990X>
References: <20230817200558.never.077-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817200558.never.077-kees@kernel.org>

On Thu, Aug 17, 2023 at 01:06:03PM -0700, Kees Cook wrote:
> GCC and Clang's current RFCs name this attribute "counted_by", and have
> moved away from using a string for the member name. Update the kernel's
> macros to match. Additionally provide a UAPI no-op macro for UAPI structs
> that will gain annotations.
> 
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Fixes: dd06e72e68bc ("Compiler Attributes: Add __counted_by macro")
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

One comment below.

> ---
>  include/linux/compiler_attributes.h | 26 +++++++++++++-------------
>  include/uapi/linux/stddef.h         |  4 ++++
>  2 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index 00efa35c350f..74716a407aac 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -94,6 +94,19 @@
>  # define __copy(symbol)
>  #endif
>  
> +/*
> + * Optional: only supported since gcc >= 14
> + * Optional: only supported since clang >= 17

Since you are in the area, should the supported clang version be
optimistically updated to '18'? 17.x has already branched and I suspect
it would be too late in the release cycle to cherry-pick that change
from main if it were landed today (which seems pretty unlikely, given
there do not appear to be many reviews from high profile clang folks
yet).

> + *
> + *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
> + * clang: https://reviews.llvm.org/D148381
> + */
> +#if __has_attribute(__counted_by__)
> +# define __counted_by(member)		__attribute__((__counted_by__(member)))
> +#else
> +# define __counted_by(member)
> +#endif
> +
>  /*
>   * Optional: not supported by gcc
>   * Optional: only supported since clang >= 14.0
> @@ -129,19 +142,6 @@
>  # define __designated_init
>  #endif
>  
> -/*
> - * Optional: only supported since gcc >= 14
> - * Optional: only supported since clang >= 17
> - *
> - *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
> - * clang: https://reviews.llvm.org/D148381
> - */
> -#if __has_attribute(__element_count__)
> -# define __counted_by(member)		__attribute__((__element_count__(#member)))
> -#else
> -# define __counted_by(member)
> -#endif
> -
>  /*
>   * Optional: only supported since clang >= 14.0
>   *
> diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
> index 7837ba4fe728..7c3fc3980881 100644
> --- a/include/uapi/linux/stddef.h
> +++ b/include/uapi/linux/stddef.h
> @@ -45,3 +45,7 @@
>  		TYPE NAME[]; \
>  	}
>  #endif
> +
> +#ifndef __counted_by
> +#define __counted_by(m)
> +#endif
> -- 
> 2.34.1
> 
