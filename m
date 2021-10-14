Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119412C82
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 17:37:04 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id x27so30523944lfu.5
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TG82cb8k19zHpAL9FdWnZQlAfRFvy8vXZs/tg7DrT90=;
        b=PsYmOwIaA6SW28RHw4uShKZGnUBkMKs5xKslaJXBr801sbw6wiPu2+L2JyB6DSwZMn
         jRE77P/1DkPtFqr5hKnI+RM5TVXsQmOElVICMdwkGCzCY4bKx9GSImX5JFo1w1L/QBOv
         BIcViMM5K+csDr3heoSxISZSSMzT38x6HxyXs2xx26x/LgeTtqVwhc1PTrKMgQ9v0YrX
         ifBytItD9R1TTuGkFi67XEWRwfZYEBwUfEyER6+lGiSqowv/t+cCtM09Z+X4y0YFL0I0
         Bsq1kvylyj6Yspqkm1MT/vp3J+1ybR/3Df6nldo5NAHLVoVXtBBy41gOo6XQ+mdYVvUS
         Yifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TG82cb8k19zHpAL9FdWnZQlAfRFvy8vXZs/tg7DrT90=;
        b=mtOtyzaekfWR3xY4hrXbbwyLd1FDAPfXl1vrKVtPU8wzYbKQ8kx95SoNprjcmJJiTl
         ZlYebUo+hta2YSgZPTVDnzWroy71rKeM25XoMuCtDE7efwZVxu8anraa/9Us/r88n5Wo
         PfHolM0oxfospcN+ZkN6iK90FFfSIJpSfrgTIqHDvLOhsOf2yV4r0ZO/ZFXVscWXH3BS
         YVis7Hec2Pnn0/joAEU3WXzGdSWDkJnZDucRyToO4hmfNAj0O2xqlaTSSjzGt4pOmEsS
         9Gxt8DeSrhisT2R+IfE1phuEBgqxb8uRCDRanso5EOMSU+/Bl9QfqE4+lIAPN1cb0T1i
         xXrw==
X-Gm-Message-State: AOAM531u31gWwpmqfmWhJ5B3T1al38KwCIrlYsDBxAue15Jkt0gv9vsF
	WYOEXE9gtr5a/q1g+DHvjRPT2kyBkbJhTBbA3HWWhw==
X-Google-Smtp-Source: ABdhPJwLuGDqGNdh9VmnJlwA9ickYFs0m0NfCTWjKYsobjDvnlHNs6x3zmHGmKGPD9Yqp98LaxnCTLwfD0UtGenptcg=
X-Received: by 2002:a05:6512:1103:: with SMTP id l3mr6353419lfg.550.1634233022848;
 Thu, 14 Oct 2021 10:37:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211014132331.GA4811@kernel.org>
In-Reply-To: <20211014132331.GA4811@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Oct 2021 10:36:51 -0700
Message-ID: <CAKwvOdntTcMdXKCYLjPnNxgxMZTZWRFOsMEMp0MQSCoz30mOMg@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: mark __compiletime_assert failure as __noreturn
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 6:25 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> `__compiletime_assert` declares a fake `extern` function
> which appears (to the compiler) to be called when the test fails.
>
> Therefore, compilers may emit possibly-uninitialized warnings
> in some cases, even if it will be an error anyway (for compilers
> supporting the `error` attribute, e.g. GCC and Clang >= 14)
> or a link failure (for those that do not, e.g. Clang < 14).
>
> Annotating the fake function as `__noreturn` gives them
> the information they need to avoid the warning,
> e.g. see https://godbolt.org/z/x1v69jjYY.

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Link: https://lore.kernel.org/llvm/202110100514.3h9CI4s0-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  include/linux/compiler_types.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index b6ff83a714ca..ca1a66b8cd2f 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -298,7 +298,13 @@ struct ftrace_likely_data {
>  #ifdef __OPTIMIZE__
>  # define __compiletime_assert(condition, msg, prefix, suffix)          \
>         do {                                                            \
> -               extern void prefix ## suffix(void) __compiletime_error(msg); \
> +               /*                                                      \
> +                * __noreturn is needed to give the compiler enough     \
> +                * information to avoid certain possibly-uninitialized  \
> +                * warnings (regardless of the build failing).          \
> +                */                                                     \
> +               __noreturn extern void prefix ## suffix(void)           \
> +                       __compiletime_error(msg);                       \
>                 if (!(condition))                                       \
>                         prefix ## suffix();                             \
>         } while (0)
> --
> 2.33.1
>
>


-- 
Thanks,
~Nick Desaulniers
