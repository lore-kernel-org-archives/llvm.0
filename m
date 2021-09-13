Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33EF3FD0
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 16:28:40 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id 5so6187080plo.5
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=snLhTAZZ8mV9205gGLjuCjWcda3VmzZbuUm4gtYTcyQ=;
        b=IBkwnS8+MqgvS8IEyrao3x4kK53haBMPflE5veA3TazxGdf9xz91TghEVwzpcfEJVA
         j2O4/XPA4XVvCx1Lh5MS8UbslhC00r/RjoD5WqPrH7K0GFxlqbLEyb6lO+gcvpSVQwFu
         xLaYpnpDLNY3gbJEc8gxkG1cn+wlZqladYtUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=snLhTAZZ8mV9205gGLjuCjWcda3VmzZbuUm4gtYTcyQ=;
        b=s+iRL1coz7lSZkkvCsjiN/soerxtoBGgwLQpWO81VVjQ2/9Z4QYmtwsZ+j4lYU18ZN
         u9/GAnqFhTkogRqaJrVGMjPMkOVUh+xsQs+xXc7qQ+UM1ucakHnNvmgFUnNW3VGXmI2n
         gLW6lFOmrgYo5Pxdv35P1I132HNV/66Y0lEsg3sm6TTi39cHZaDiPA5VHZamrTTijVpN
         2oS9GsQIzgvVfAofZ2JnIyQ2JxNOjBOjUQECGjjQjnFkdEc/VUaS1XtyTP8tV1cMtxIi
         DHzepQvDhP1L2ZqlkHRFwW30BsZhgvMZr2pBd0mFbYJxeLqmyzGc++2xDdy7M9475b8D
         RmrA==
X-Gm-Message-State: AOAM533Anhy/lMourDm7zy1L4FkFzuEgM0z+nGtQBs6ciVmqHkBmzed6
	r4pDXRGeiGG0rnlX+Dh+DIA1kw==
X-Google-Smtp-Source: ABdhPJzkaeDbhgspAY/Gf3N1YyCl39+Lgo1gmEg7Mf8Mdhiwe+2LLQuroVbM7OOb94SO+4Qbzo+WJQ==
X-Received: by 2002:a17:90b:3b8b:: with SMTP id pc11mr406421pjb.153.1631550520097;
        Mon, 13 Sep 2021 09:28:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o10sm8195671pgp.68.2021.09.13.09.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 09:28:39 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:28:38 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 10/10] vmlinux.lds.h: remove old check for GCC 4.9
Message-ID: <202109130927.6E5447B04C@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-11-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-11-ndesaulniers@google.com>

On Fri, Sep 10, 2021 at 04:40:47PM -0700, Nick Desaulniers wrote:
> Now that GCC 5.1 is the minimally supported version of GCC, we can
> effectively revert
> 
> commit 85c2ce9104eb ("sched, vmlinux.lds: Increase STRUCT_ALIGNMENT to
> 64 bytes for GCC-4.9")
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  include/asm-generic/vmlinux.lds.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index aa50bf2959fe..f2984af2b85b 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -116,11 +116,7 @@
>   * GCC 4.5 and later have a 32 bytes section alignment for structures.
>   * Except GCC 4.9, that feels the need to align on 64 bytes.
>   */
> -#if __GNUC__ == 4 && __GNUC_MINOR__ == 9
> -#define STRUCT_ALIGNMENT 64
> -#else
>  #define STRUCT_ALIGNMENT 32
> -#endif
>  #define STRUCT_ALIGN() . = ALIGN(STRUCT_ALIGNMENT)

Yeah, looking at users of the macro, I think it's best to keep the macro
instead of hard-coding it everywhere.

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
