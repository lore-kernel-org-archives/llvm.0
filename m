Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE417CA12
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 16:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743179996; cv=none; b=eih+ZCYoNbqxz8J12ReQ1Fe0qyQXUCeg9iVIQMd1g48HHiUveAECvLBiy1TJR6v7gHM24shvwqhg7f86H5COOnT7MBGCT4eLEXjmwJMDJIjdAkR5zbZMDuqJl49AaQhth5QG0r/CaMvVvIyQ1G0LYfm2RZmBvqlTY+aTwptULZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743179996; c=relaxed/simple;
	bh=ZacKuhiyChdsT91YTCJru7KavN6apd7FNn7UGaUQz5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2poqaEMC7AY2+4GVn42cRNiQ6G35FB0vrvi0Vx0cljG7jl3dViXRlXKuMlpuvHoys1Wa+402G0pYNZCIyIqMoe98nZpLQE3JcEx9+72PHw1B2aMeWOLHqDGQ705L0E1go+8YsbkDsFBwrFcWW6XA96g6CZavS1cJ6lq7rrfJPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h5rbXlm5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h5rbXlm5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2242ac37caeso184865ad.1
        for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743179993; x=1743784793; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcE6ARy1rUfxvRGohneaNEBtA+LaOXSM2dLoJGL3SHA=;
        b=h5rbXlm5HtXX+L4GX4Wsndztc1HGkmb3YcVGf6sgi3koAiz7/2KAJ90y6PB/o1bxmU
         wFfFTOIpdIa9bHso36A7NRmrgtJLMH6SSTpE3UV3mVoOKkrkOJhe/8TVrrv4SnNwvv7E
         th8OCBH9SRhFmwc8HUpmpLfgn0KuWanvfmFBTPluBFFtGy4081+FngfxbiRQRvv5cc79
         08FBglCXRWtN3FwV0odw/FH9kZvV7FdNjU82qoXaCCyNf+QF7S7l8SbYbL28YYmW7oeB
         Lk2t3mH71Z/0rRvMiqicI+l8tJSNcIK79rPPMZXPYn4mmv/3MozG1TGk4TWkJHBXXDLe
         iKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743179993; x=1743784793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcE6ARy1rUfxvRGohneaNEBtA+LaOXSM2dLoJGL3SHA=;
        b=VHF8f7t5WLZvFcw30FToH2KnsDjNUQ9S9+NStXvPLQ3xTbcDQj6ddJ+zwfmbccU+IT
         WmaDzar+ke/CagqwIoMmmaOXRyZahjm1hT/FPgwFdLBYFf474ykYlT9RbjVErDHu+jQP
         m6BRzilbpKxLTJZXALSf5MeRwK5N1melfx8EJyk01wB8AQMPVpdEUL2e+rizlb2Lz6Cb
         9VjAbYbfwiXl09+rLRg436eI5/y1MprseInjoVYEQ5FPa1ZvsN7jgf9Qma6adrXRGfIJ
         TtXfTNFVhczV1rL30DeWPja4w5ohnNgir48EFU387vJQuKcycf/HZpxT2Kg8zZt5kgPT
         7p/A==
X-Forwarded-Encrypted: i=1; AJvYcCXHQ4HR7jmwret44/Ooxib6DuSVb2Bvi6fbD7UbDaCY1mDfF9tOf73TD1GqQDbHJW2SRwvC@lists.linux.dev
X-Gm-Message-State: AOJu0YzXpae8DoREunXcW5TJZMbkGFWQru6TK2jofpvykflJT2ebNCO0
	mgPVTwpDOvDdxsIydnPTuHpOwkAWoQcHOfKPJICVKWKt74s+uuOxh20SQdQsIug/YGUZjIDW/n8
	lI4sBKM/02wptke482LZE9mYoEBxWGDjKWXzu
X-Gm-Gg: ASbGnctLMyfA1jdXnOpFt/urOiWmBpqAuhPqobwbVE0uhpFZaixZGwpfF4hZDmsvhuQ
	CaPok20W7Ne8cQGIXN5RpdBbNgGuCEu2D/K68kkNH66CepDNTsp6nyOxuCCXIpd4xpnMhPgaGk0
	LTo05+R2x0neFAPUDFLpaHi/H0eEI=
X-Google-Smtp-Source: AGHT+IETTkV/cGIS2O59Mcs+/mE1owA30OPhyKUkj7VBuXWdvRUbRDBdmL0g+tZHFqn9h+WIqqqBY/9gRriAXKqSLwk=
X-Received: by 2002:a17:902:d585:b0:217:8612:b690 with SMTP id
 d9443c01a7336-22920ad2436mr3317935ad.8.1743179993199; Fri, 28 Mar 2025
 09:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250328135221.10274-1-leo.yan@arm.com>
In-Reply-To: <20250328135221.10274-1-leo.yan@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 28 Mar 2025 09:39:41 -0700
X-Gm-Features: AQ5f1JoJ2on2fM5C_xTgqBXgthup1ISLyfPcE0FmDBiCkXLSGsQ5w9qhH9dU0Qg
Message-ID: <CAP-5=fU5y_xKaWnh8tumyjTfJZdr2i+tPUaECyPs_vdhKdYWLg@mail.gmail.com>
Subject: Re: [PATCH] tools build: Use -fzero-init-padding-bits=all
To: Leo Yan <leo.yan@arm.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 6:52=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> GCC-15 release claims [1]:
>
>   {0} initializer in C or C++ for unions no longer guarantees clearing
>   of the whole union (except for static storage duration initialization),
>   it just initializes the first union member to zero. If initialization
>   of the whole union including padding bits is desirable, use {} (valid
>   in C23 or C++) or use -fzero-init-padding-bits=3Dunions option to
>   restore old GCC behavior.
>
> As a result, this new behaviour might cause unexpected data when we
> initialize a union with using the '{ 0 }' initializer.
>
> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=3Dall"),
> the kernel has enabled -fzero-init-padding-bits=3Dall to zero padding bit=
s
> in unions and structures.  This commit applies the same option for tools
> building.
>
> The option is not supported neither by any version older than GCC 15 and
> is also not supported by LLVM, this patch adds the cc-option function to
> dynamically detect the compiler option.
>
> [1] https://gcc.gnu.org/gcc-15/changes.html
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>
> This patch was originally from [1]. After consideration, the top level
> of the tools directory is a better place to accommodate this option
> rather than perf folder.
>
> [1] https://lore.kernel.org/linux-perf-users/20250320105235.3498106-1-leo=
.yan@arm.com/
>
>  tools/scripts/Makefile.include | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.incl=
ude
> index 0aa4005017c7..e912a10afd89 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -40,6 +40,19 @@ EXTRA_WARNINGS +=3D -Wwrite-strings
>  EXTRA_WARNINGS +=3D -Wformat
>  EXTRA_WARNINGS +=3D -Wno-type-limits
>

It'd be nice to bring in the comment for try-run that's in
./scripts/Makefile.compiler:
```
# try-run
# Usage: option =3D $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
# Exit code chooses option. "$$TMP" serves as a temporary file and is
# automatically cleaned up.
```

> +try-run =3D $(shell set -e;              \
> +       if ($(1)) >/dev/null 2>&1;      \
> +       then echo "$(2)";               \
> +       else echo "$(3)";               \
> +       fi)
> +
> +__cc-option =3D $(call try-run,\
> +       $(1) -Werror $(2) -c -x c /dev/null -o /dev/null,$(2),)
> +cc-option =3D $(call __cc-option, $(CC),$(1))
> +

I see differences with the ./scripts/Makefile.compiler version of
these functions:
```
# __cc-option
# Usage: MY_CFLAGS +=3D $(call
__cc-option,$(CC),$(MY_CFLAGS),-march=3Dwinchip-c6,-march=3Di586)
__cc-option =3D $(call try-run,\
       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))

cc-option =3D $(call __cc-option, $(CC),\
       $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
```
I'm just wondering why as if we need to update these in the future
it'd be easier if the two were identical.

Thanks,
Ian

> +# Explicitly clear padding bits with the initializer '{ 0 }'
> +CFLAGS +=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
> +
>  # Makefiles suck: This macro sets a default value of $(2) for the
>  # variable named by $(1), unless the variable has been set by
>  # environment or command line. This is necessary for CC and AR
> --
> 2.34.1
>
