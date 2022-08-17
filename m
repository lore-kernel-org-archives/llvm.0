Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01077477
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 23:40:15 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-11be650aaccso61498fac.6
        for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 16:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=daKNlzUlISpXfRKkkWFRtUiXLBWJavrHYfPtjh2uJpI=;
        b=Iyf3cvO5rvbYqgr6PC43xyQOHandKHxgBfbSVZfHQBKStNgP7AeUDKY/AvYIjcwuil
         gKDQAf8L1+FMfiFm2F0R/yvNGiqdvVeB4ZwTVZ6Xpil+4bKPW+IR4fPS6bmXUIrlQ61E
         IGeqh/9AkEgJj6Dq6du9u8QTJ+bhiKPRbLZSrVQyF04WUTEU+6Joiv1/DbnGLh9SKhhL
         Ift+3z2ymfxPk3OTDS3+kav9uoNPM0gwRn7U4HmCq0/v3ZPAgg6D7T61Ho84BuNHEjrp
         ql5EZMemsXl7nWH//eVAkD2PnKz6jNfyWHtK5ycOvbg1N71VudGoGhk2kSSfiKdPpnxt
         nKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=daKNlzUlISpXfRKkkWFRtUiXLBWJavrHYfPtjh2uJpI=;
        b=xgQgrTp0wMUB6/5BveHLKPXyGtEW5bSuJYb6ASRDc+DF0gncALeGlBCg0p3o0RS4Lt
         YMivcMrn37VPEi8xTYcwB35d6Vq68pP0WZ54b5ZVxWCGsSlU7EYErRwcksgud5bntm/J
         FSTqlVq703U3kuIhlCBAO5oytlT3feNBmu/XKTzjOc+Tgs9yp1modcTM80hnocB8A5hX
         rd2tjq/RBFlzlVLEik9oel6ZAb2j4W6LMuqCf7wdhwrgnLAd7amh6ax/LmDGDj40Yj6D
         r+fPFcHyonMjvA67Bb1tNQNXGCRX/OLiikE/7ZomVv/t+0bVgCLKomqqe+ZhBTxxLTdv
         3igw==
X-Gm-Message-State: ACgBeo16jeBH96KBwDt8czanvI0ieBygwsvitWtXsI3xxjrP06Wkjmj1
	GehlBT5FfHUyLYHzzM9vSnLkoap5YaDBQp/HBWwF3g==
X-Google-Smtp-Source: AA6agR7JztkGz0UiDLQonDNB7R4KJt4JkbhowjaMaCqhJe0/FNsjgPRFr1i6NaE3WNeRyGl0QT/y2yPeL2tieH7qkMQ=
X-Received: by 2002:a05:6870:5b86:b0:11c:67ba:71dc with SMTP id
 em6-20020a0568705b8600b0011c67ba71dcmr1969668oab.289.1660779614640; Wed, 17
 Aug 2022 16:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1659635174-2376-1-git-send-email-quic_gurus@quicinc.com>
In-Reply-To: <1659635174-2376-1-git-send-email-quic_gurus@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 17 Aug 2022 16:40:01 -0700
Message-ID: <CAKwvOdnbMs-pLRfo4O-MHOF=9=kAvDuktkeeeX7bkmnLi8LWnw@mail.gmail.com>
Subject: Re: [PATCH] scripts/clang-tools: Remove DeprecatedOrUnsafeBufferHandling
 check
To: Guru Das Srinagesh <quic_gurus@quicinc.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Elliot Berman <quic_eberman@quicinc.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 4, 2022 at 10:46 AM Guru Das Srinagesh
<quic_gurus@quicinc.com> wrote:
>
> This `clang-analyzer` check flags the use of memset(), suggesting a more
> secure version of the API, such as memset_s(), which does not exist in
> the kernel:
>
>   warning: Call to function 'memset' is insecure as it does not provide
>   security checks introduced in the C11 standard. Replace with analogous
>   functions that support length arguments or provides boundary checks such
>   as 'memset_s' in case of C11
>   [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
>
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> ---
>  scripts/clang-tools/run-clang-tools.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index f754415a..1337ced 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -51,6 +51,7 @@ def run_analysis(entry):
>          checks += "linuxkernel-*"
>      else:
>          checks += "clang-analyzer-*"
> +        checks += ",-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling"

Thanks for the patch! I think it makes sense to add this.  I suspect
the list of checks we might want to disable may grow. Maybe when it
does, we could put these in an array and join them at the end.

Anyways, LGTM
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Masahiro, would you mind picking this up for us, please?

>      p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
>                         stdout=subprocess.PIPE,
>                         stderr=subprocess.STDOUT,
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
