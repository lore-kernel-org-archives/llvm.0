Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A19A2CA1
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 19:09:41 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id c7so20268745ljr.13
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 11:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Ok0BFBVUs/aGLvZ8hIj39mJA1z2SbFZGpjd3f3p7Vg=;
        b=hX0xetF3Nl2xlWjDIF6C04FvfYjWAUNtF9/XaoMWge4H3R+tddXnppQBiNsE0QcTf2
         H1VLpE42C+1XDt+SPkmPcrXc+e5QUUVrzLLDhqapMhQ0cidbmLUZZ/2vX3Wacu7dyBxV
         Lh8kF3a4RuCGstgCCYTqIB+JyzvN46ciBhUsVNy/FS8vcwjWfECmOJNm+wgYUCFefL1M
         XUAeYfLXSWd6OTzBH/X9ZmXihVo+k4wq0R9j+D7BO9kOyjrCttYyR+72q4YPJbkP9z5o
         fWAhJ2aD/U2rBALByHUFY/TdI3p24zf2WUC2OpgmsXuJaqrlVpDqUy/pQvlF7nYYsZWG
         vbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Ok0BFBVUs/aGLvZ8hIj39mJA1z2SbFZGpjd3f3p7Vg=;
        b=mqzIFUf+6bePUngYp0nQw762tq/H44JwvTAqKjbOsabn5/hKv3H0JQ9C+cny6dnXdO
         8XiDFI+iy3R7WtWUAkgvrpFbVWvianYgwu9cQdF+d0GMGJuDABbFdmycD1NKDIcEMTF7
         CYm8OzbF4wccDtYhb9+nglT/Rqg0t7EnP2ENZ4P+UAJ2CDamESrK5qxQYPA9TXe3KdCk
         v7uFqFadkePC7kVwAjS9a50oIhRNakjCO5EHjuiRiqrkuobidJ9UcYil6TYK9N+fq3To
         NK+GOy273/n7fMygJjWQom7bEMUHFfO2rDaZFEZ+8NCALem6vFeguTTiuu8C58Viui5F
         U1uA==
X-Gm-Message-State: AOAM531qZfOk9KG0LC02FRj5BYED4BsBzVGSz0y23I3yuDD6zPlFWOpD
	hI/1nynQATAVIDomnxlAggK+LOJI6cxDcNewN+Qv6Nihg4UNnw==
X-Google-Smtp-Source: ABdhPJyfrhQq8UNHudmznONYOwVRAN5a2rNhHhfUuvRoigSmkENJcxC7SBSpqD9IcWpP8HXdLEAMEzjLZqVgJINMisE=
X-Received: by 2002:a05:651c:1253:: with SMTP id h19mr5956839ljh.338.1643656179244;
 Mon, 31 Jan 2022 11:09:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220130181616.420092-1-keescook@chromium.org>
In-Reply-To: <20220130181616.420092-1-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 31 Jan 2022 11:09:27 -0800
Message-ID: <CAKwvOdmETY-j9B9vms4d31kAc0xb1yE902KijiH2baY5-M=fLQ@mail.gmail.com>
Subject: Re: [PATCH] fortify: Update compile-time tests for Clang 14
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 30, 2022 at 10:16 AM Kees Cook <keescook@chromium.org> wrote:
>
> Clang 14 introduces support for compiletime_assert(). Update the
> compile-time warning regex to catch Clang's variant of the warning text
> in preparation for Clang supporting CONFIG_FORTIFY_SOURCE.

https://twitter.com/ifosteve/status/1190348262500421634?lang=en
error messages can change over time. More thoughts below.

>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> I'm splitting this patch out of the main Clang FORTIFY enabling patch.
> ---
>  scripts/test_fortify.sh | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/test_fortify.sh b/scripts/test_fortify.sh
> index a4da365508f0..c2688ab8281d 100644
> --- a/scripts/test_fortify.sh
> +++ b/scripts/test_fortify.sh
> @@ -46,8 +46,12 @@ if "$@" -Werror -c "$IN" -o "$OUT".o 2> "$TMP" ; then
>                 status="warning: unsafe ${FUNC}() usage lacked '$WANT' symbol in $IN"
>         fi
>  else
> -       # If the build failed, check for the warning in the stderr (gcc).
> -       if ! grep -q -m1 "error: call to .\b${WANT}\b." "$TMP" ; then
> +       # If the build failed, check for the warning in the stderr.
> +       # GCC:
> +       # ./include/linux/fortify-string.h:316:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> +       # Clang 14:
> +       # ./include/linux/fortify-string.h:316:4: error: call to __write_overflow_field declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
> +       if ! grep -Eq -m1 "error: call to .?\b${WANT}\b.?" "$TMP" ; then

Doesn't this depend on -Werror being set? I guess it did so before
hand, too, but couldn't I unset CONFIG_WERROR then this check would
still fail (since instead of `error:` we'd have `warning:`)? If we
used __attribute__((error(""))) then this would always be an error.
Right now, it is only because -Werror is set promoting the warning
diagnostic to an error.

>                 status="warning: unsafe ${FUNC}() usage lacked '$WANT' warning in $IN"
>         fi
>  fi
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
