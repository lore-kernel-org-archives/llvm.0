Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDDE4AB1
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 17:20:05 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id d134-20020a4a528c000000b00319244f4b04so4247663oob.8
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 09:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9CKMthUXCokgWPQMB0IqyzdQ/Xmbb9rlJivmagQi36I=;
        b=cydyiGcMci/xbRpUq63u1Hv+UdC/Vor48jhWgM7lnEFrIn3NnvwrUKdNfQL/0Fw3sF
         BPu6GRfWcYeuJIW0u0sEfSq/qHLjsHrf0Lr1QlWxT9DHzJ4CtDczMy2Ih6PCgNjqFMoe
         0Jwiw76Ky/0w+VPlCcij25Qcmzrr4WJfMVppv7iJxRlseur+qiVYeMkBO/y1cvuQqCll
         qntNTuHAjURsYJVdD8NLvjqIb56sxiqWTxTy/6IZzvOt/MtWGDXvw8lTBJ9E4rMIIT+/
         o7qHHhgWo8AD24vQQnBiC2Ygm1AUVGrIgmhYLjtfUtM431V/1dc62FN14QHkSBMze8GV
         /99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9CKMthUXCokgWPQMB0IqyzdQ/Xmbb9rlJivmagQi36I=;
        b=iLUobHDlqvtP5mZK/dV6mHPwxgtlV/ISyAg+1l0vTanFY4ihCH8GCvErnRg+a7OoBn
         JNrSWwZa76x+Miu9p/+rlhX6mqKbmLHA2sp1PCCZMTm706nRmpJ4j7+UYS8dnY/0DDhY
         eYvWTz11SWObeZOcU89Gm58QiUmpq1BvI4hzA9a6JCxsR8r3vBIYpFK84q34DMP7XAmY
         hZIanAZ1O6/zkflP75PLHFdxm6sRgLEz56DVr80PjJr2uAEI7JJpLNrJLWv8Vh2cpsNY
         gzfe1IUR2FJ+CsQhRn4bWjpzq+cbucwdmUTWvzF9qtAIhL4fa9HIPQwxPBxa4Xe5c3g0
         zQZg==
X-Gm-Message-State: AOAM530GbuqV9hhfnPZdOwYzZNkVlO641t7LXxdNFjrKpsnTj+/xw02a
	HoX11THKCYvBJc17e5KIElmIrhnF3KDnbLMLqQbTpw==
X-Google-Smtp-Source: ABdhPJy4WTc78tZjJuxIgpcdJcD0ARkv52fe0fcQtgKg4EF2No3CqEz35B6g2+kkVmHNmdLz8XExDdjk1pj92tWB4lE=
X-Received: by 2002:a05:6870:12d1:b0:ce:c0c9:6e0 with SMTP id
 17-20020a05687012d100b000cec0c906e0mr4581469oam.306.1645204802484; Fri, 18
 Feb 2022 09:20:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220218131358.3032912-1-gregkh@linuxfoundation.org>
In-Reply-To: <20220218131358.3032912-1-gregkh@linuxfoundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 18 Feb 2022 09:19:51 -0800
Message-ID: <CAKwvOd=4uwMVBwYU8XPP+cHkw5V1S_t7i8psMTRySsKEcDVZ_A@mail.gmail.com>
Subject: Re: [PATCH] slab: remove __alloc_size attribute from __kmalloc_track_caller
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, 
	Kees Cook <keescook@chromium.org>, Daniel Micay <danielmicay@gmail.com>, 
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 18, 2022 at 5:14 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Commit c37495d6254c ("slab: add __alloc_size attributes for better
> bounds checking") added __alloc_size attributes to a bunch of kmalloc
> function prototypes.  Unfortunately the change to __kmalloc_track_caller
> seems to cause clang to generate broken code and the first time this is
> called when booting, the box will crash.
>
> While the compiler problems are being reworked and attempted to be
> solved, let's just drop the attribute to solve the issue now.  Once it
> is resolved it can be added back.

Sorry about the mess; we'll get it cleaned up!
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1599

>
> Fixes: c37495d6254c ("slab: add __alloc_size attributes for better bounds checking")
> Cc: stable <stable@vger.kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Daniel Micay <danielmicay@gmail.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  include/linux/slab.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 37bde99b74af..5b6193fd8bd9 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -660,8 +660,7 @@ static inline __alloc_size(1, 2) void *kcalloc(size_t n, size_t size, gfp_t flag
>   * allocator where we care about the real place the memory allocation
>   * request comes from.
>   */
> -extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller)
> -                                  __alloc_size(1);
> +extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller);
>  #define kmalloc_track_caller(size, flags) \
>         __kmalloc_track_caller(size, flags, _RET_IP_)
>
> --
> 2.35.1
>


-- 
Thanks,
~Nick Desaulniers
