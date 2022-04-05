Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4270321B
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 18:05:41 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id e16so24620869lfc.13
        for <llvm@lists.linux.dev>; Tue, 05 Apr 2022 11:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X0ND6VwIEZwinAToHYv1JdQDzPnywveE91KVWFTQSKU=;
        b=RBo9gfw+D1FKrMZUzQe7qcOB2qaHge7l/8AZd+/yufIzV5iTwW+v7Gjmkr/gKOAcNR
         I2VGdF2YwGb7Zle/dZok5Yyl2CtHHebkp9lEYidiaJhOvNRNDTRQVF7A8nfj401cpygQ
         FO2NhbyaeDO4GmHuxCFSiKMxVLVZMBk0GflYWXitt5FIktd0zIcCKMjhsaq2+XV96aWQ
         ynP4oGJx6nvLzcrAbZ7wzwjeuf2QjqP3JYzssIEKsY4U3nzMObksFK1B2lE2y5EpJaSQ
         fBPtz7EBAjtN5TKpS5F13PNhDk+urTpeI9xzG4SuKlQa2s11FC4PGryTK0PeQ5RBbjZ/
         u4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X0ND6VwIEZwinAToHYv1JdQDzPnywveE91KVWFTQSKU=;
        b=kte8kBsXFiMvT9NTASvv4RRHxYpLfb3/Eaf3hqLD6EedKyjhs4Kl2A/pg2waVrvKhR
         62w/6DyartXwCbgSXm/R7WpaGLa4sA54ngj0uh+G5T/S7rKz+VBW7nX0/gcWGLczw7iY
         lnXLpFMKobKwow08KDt/06bVqvLPx6VfIPaVXbE5Gs56mlJ5e7EyCZ5BIWybQTmywOzx
         aPd5HqDxqoMbVHCXQGZyCZmS0cHIvDjdDaQxGh7RR7GMgxa9LZelOXjVGSZyrbSa1awe
         oy+V7VVcACPDL7chwWdo6XQUJOi8bGPnchickv6kGAKeQVgXFz7sccsyn0Z0HIp1ALHw
         h6Ag==
X-Gm-Message-State: AOAM533q40VKyepG7JFjWTi5MKFg6eGuyxABMmP8GN06WtszIFKVgohb
	rKQjhd6Pmq4Y1mUHGze+ihU0dthh2QKKOTVOxFqSTA==
X-Google-Smtp-Source: ABdhPJz8Ob2IFSJ2xU2SEyque7PyMmTt1CuxsFgqOZW+PCOTKSh0Ys9Ztyvr9JrHOENxXbwRXkEU1ITLIiTlI2b9UYE=
X-Received: by 2002:ac2:5223:0:b0:448:5100:e427 with SMTP id
 i3-20020ac25223000000b004485100e427mr3474419lfl.87.1649181939752; Tue, 05 Apr
 2022 11:05:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220402131546.3383578-1-trix@redhat.com>
In-Reply-To: <20220402131546.3383578-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Apr 2022 11:05:28 -0700
Message-ID: <CAKwvOdnVcXgJtJsVujXpEVOLrY_BU5BPHN4tW_ziXNB-xnZPkw@mail.gmail.com>
Subject: Re: [PATCH] lib: remove back_str initialization
To: Tom Rix <trix@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: nathan@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 2, 2022 at 6:16 AM Tom Rix <trix@redhat.com> wrote:
>
> Clang static analysis reports this false positive
> glob.c:48:32: warning: Assigned value is garbage
>   or undefined
>   char const *back_pat = NULL, *back_str = back_str;
>                                 ^~~~~~~~   ~~~~~~~~
>
> back_str is set after back_pat and it's use is
> protected by the !back_pat check.  It is not
> necessary to initialize back_str, so remove
> the initialization.
>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Andrew, would you mind picking this up for us, please?

> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  lib/glob.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/glob.c b/lib/glob.c
> index 85ecbda45cd8..15b73f490720 100644
> --- a/lib/glob.c
> +++ b/lib/glob.c
> @@ -45,7 +45,7 @@ bool __pure glob_match(char const *pat, char const *str)
>          * (no exception for /), it can be easily proved that there's
>          * never a need to backtrack multiple levels.
>          */
> -       char const *back_pat = NULL, *back_str = back_str;
> +       char const *back_pat = NULL, *back_str;
>
>         /*
>          * Loop over each token (character or class) in pat, matching
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
