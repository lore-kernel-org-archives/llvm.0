Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AF129CA
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 22:13:46 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id q22so5939269ljh.7
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 14:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2xJKejqFUEH0gH02bsrJyrmiS9uC9eYI5/u6Jxv0S8E=;
        b=H24z7FjJDol5wBZEbnN2Imdyd1onGd0cFpHlfJZfyL+uWUtNi2aoFXif9gUr+4s3Xv
         uBmskidnVWURLL+YtWHTjHZ9PJG9hKcRd7yQhsPw58FBd4qf0Q4eTR/0/1f4tOtdnCu1
         fDPqQqRoSiBLnGmelyqJmyFNGGvecWyqTLD4PXP1wAafPBiLwFGWOmNe+uuU6wMO8cfJ
         MRPioqayInupF70/CODAACEA0JvTFoJTv+OByl6ZVBfaxCQpBYUO/HI2TkIH1YBncuQK
         Lzw6UWJ7iq3T2kAX32oz66qtHCL6s7tKSB94chdxTr8WF7WpolWrLPftMc0su3IMkMdb
         /jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2xJKejqFUEH0gH02bsrJyrmiS9uC9eYI5/u6Jxv0S8E=;
        b=yM5n7siqz/AbpzV/rem5cMtG7RPlMq+jdxQWPjf0o8tsAU7RppIzmMSYTAzOeH3XW/
         LqSAM4UO85DBiRdp0EJYz/xIK7P7r8vr5dIp29wupvjqbF+NPNCvVqn7fL7xCbVH6Pmr
         4VbT3XcS5g2sCZJfiHmCUKRtjoK3TmA076G7qMp2uJMxreUFt+fANMjHsHc1OAmNDKH0
         DUoo81rxql/le4aCrx+1PdUjDf+/UdD6ZB/ABnDjLkg/57wZS6bPVcbqvd+5jzAneyjM
         B8OOgwsjWl1aw8o9Y3FFa8kfY2p5CJ1gu5jZEvXtTjIvTITa8dvlc4lNrP94N6Gh0N7p
         HQzw==
X-Gm-Message-State: AOAM532hbmg6GxsFH003WV/lvk/iehpO/H31myxB4X8wEeH1vTnv5Axy
	S33WnNMemKO6E00JTA5+wHQBQ2DttUgEjF0LuHvnhQ==
X-Google-Smtp-Source: ABdhPJwukk4FfgGCE9DXGX12jyqxMhXq20QnpHOQ5CsAHRtiMZ0ck8ImUh9oBxHNeO9V4ehDak2Z2QOHbbWezu5b8SI=
X-Received: by 2002:a05:651c:1305:: with SMTP id u5mr27111lja.339.1643926424857;
 Thu, 03 Feb 2022 14:13:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220202003033.704951-1-keescook@chromium.org> <20220202003033.704951-5-keescook@chromium.org>
In-Reply-To: <20220202003033.704951-5-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Feb 2022 14:13:33 -0800
Message-ID: <CAKwvOdkvd=2DcwEpQWBtS3p-hKB6Rvp4YXB4k+81Me6E5H+mqQ@mail.gmail.com>
Subject: Re: [PATCH 4/4 v5] fortify: Add Clang support
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	George Burgess IV <gbiv@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 4:30 PM Kees Cook <keescook@chromium.org> wrote:
>
> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> index c45159dbdaa1..5482536d3197 100644
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -2,7 +2,9 @@
>  #ifndef _LINUX_FORTIFY_STRING_H_
>  #define _LINUX_FORTIFY_STRING_H_
>
> -#define __FORTIFY_INLINE extern __always_inline __attribute__((gnu_inline))
> +#include <linux/const.h>
> +
> +#define __FORTIFY_INLINE extern __always_inline __attribute__((gnu_inline)) __overloadable

Sorry, I just noticed this line (already) uses a mix of open coding
__attribute__ and not. Would you mind also please changing the open
coded gnu_inline to simply __gnu_inline to make the entire line
consistent?
-- 
Thanks,
~Nick Desaulniers
