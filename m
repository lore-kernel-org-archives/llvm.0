Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6B219A8A
	for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 11:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379654; cv=none; b=s9ncBGCTqQT4oMVswnT8vCH5s64D9wo0eomWGWRa+K2v9SalNXcqdBpCI8/Sw1OKVwSW+jzUGBBoB0jcCqjeBG6+aooI8IunSsHVHyaXT8TeZ8CwlkmOLyTkF5N+OPlB+kMCP3UpM2Du1FIxiJMpdPzIVzUztuun+d3MRat1oKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379654; c=relaxed/simple;
	bh=KY3x+UKXDHOVDP4T8TjPJ0X9Wo31Uv0BUOvqgG/Ystc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLaMYwI43Og8GWsp9DTavy+4tZJjFzqbm2hEAS3+iR/M3ebVoOdvg+caFX/8yBjMkpCEgbIhyC/HFX7P054MrTOeoCCyV23LTijjIWLp0QoQT/rmcJ01kHlFIIH54l8UlBOAw9sxpyxx04somWxyfps23GwpDB3BHblFNQukeYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXn19CzE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXn19CzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C475C113D0
	for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763379654;
	bh=KY3x+UKXDHOVDP4T8TjPJ0X9Wo31Uv0BUOvqgG/Ystc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IXn19CzEBYgkLFoh9Wl3Lla5e3whwclHDUQshLSrfOntkU7st9FP7O+PDBW8bEsDd
	 riEqS2pp0LcxXw7Nsc5KgaIabwSTn2vpzbVt1eutY9wpysxg7WeUGZWPd07NRkHXL2
	 7YdUc0t1ms1d0nGxk8kcqNg6OO1V/UGIVum0Y39w5UyzxRev5EocOXPmD9X5zCPp7k
	 rTloVqhVjybFY3+qx6Vsn2d17KlSrpmH9yCWUHCCSqbqAyUKJtaMVVqNn5nCKZRpTI
	 B8d93+hIjxnZU/yk9gRXwtDAZ/LbIyWBFcaR/5UJitG0G+0PL8cZUM2Jv54sgIS+/z
	 8mfHvhLDmlcOw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5942e61f001so4174738e87.1
        for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 03:40:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdFS50i0XPGJCRZcAkuWtTEJnYO7ZoLkFj7Gpr+LMqC+Z8fqazQUfPG/mg/17tAoLgwMZR@lists.linux.dev
X-Gm-Message-State: AOJu0YxZjUzPTdomDKe5rS4zU/Yx+/AzjBlDoRPPNo9t7/R4jP6moK/E
	R4+Nvo3xhHW7RVeXm7J5Lc9E7oHjTVPEFUEkX7dL8rHxLK0OeLoM3VR7rMvUDQrazZ1/HmgAZ52
	ONp+72D7WNeyU04+yfgsX6yvdP19tpPY=
X-Google-Smtp-Source: AGHT+IFVpqU4i0avKTDUllscDqWlkxDwt263lI5fKWL60lFauj4GKFjnm6NCtSha2bp1fPIW151GmfC5YOsTFr65ipA=
X-Received: by 2002:a05:6512:b0f:b0:594:51ac:13e with SMTP id
 2adb3069b0e04-595841b3f60mr4381749e87.17.1763379652618; Mon, 17 Nov 2025
 03:40:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251117-b4-sev-gcov-objtool-v1-1-54f7790d54df@google.com>
In-Reply-To: <20251117-b4-sev-gcov-objtool-v1-1-54f7790d54df@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 17 Nov 2025 12:40:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH8Yg+eeySUxJ7nRTm=nQWx5Tj4XirBjVrqXB-0Qn1=sA@mail.gmail.com>
X-Gm-Features: AWmQ_bmyagiGTa3TOA7WdFTfquMEEEc8x2n5lkPnYjapboMA58M-AGtjm6efB4w
Message-ID: <CAMj1kXH8Yg+eeySUxJ7nRTm=nQWx5Tj4XirBjVrqXB-0Qn1=sA@mail.gmail.com>
Subject: Re: [PATCH] x86/sev: Disable GCOV on noinstr object
To: Brendan Jackman <jackmanb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Nov 2025 at 12:11, Brendan Jackman <jackmanb@google.com> wrote:
>
> With Debian clang version 19.1.7 (3+build5) there are calls to
> kasan_check_write() from __sev_es_nmi_complete, which violates noinstr.
> Fix it by disabling GCOV for the noinstr object, as has been done for
> previous such instrumentation issues.
>
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
> Details:
>
>  - =E2=9D=AF=E2=9D=AF  clang --version
>    Debian clang version 19.1.7 (3+build5)
>    Target: x86_64-pc-linux-gnu
>    Thread model: posix
>    InstalledDir: /usr/lib/llvm-19/bin
>
>  - Compiling from tip/master at 6f85aad74a70d
>
>  - Kernel config:
>
>    https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e18657174f0=
537e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt
>
> Note I also get this error:
>
> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation to !ENDBR=
: machine_kexec_prepare+0x810
>
> That one's a total mystery to me. I guess it's better to "fix" the SEV
> one independently rather than waiting until I know how to fix them both.
> ---
>  arch/x86/coco/sev/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
> index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..d2ceae587b6c30b2fb17209a7=
426e7893dea988c 100644
> --- a/arch/x86/coco/sev/Makefile
> +++ b/arch/x86/coco/sev/Makefile
> @@ -8,3 +8,6 @@ UBSAN_SANITIZE_noinstr.o        :=3D n
>  # GCC may fail to respect __no_sanitize_address or __no_kcsan when inlin=
ing
>  KASAN_SANITIZE_noinstr.o       :=3D n
>  KCSAN_SANITIZE_noinstr.o       :=3D n
> +
> +# Clang 19 and older may fail to respect __no_sanitize_address when inli=
ning
> +GCOV_PROFILE_noinstr.o         :=3D n
>

After Thomas dug into this issue a while ago, I meant to follow up
with a fix, or at least something to start the discussion.

TL;DR there is nothing wrong with either compiler (as far as this
issue is concerned)

The issue is that KASAN/KCSAN enabled builds use a version of
set_bit() that unconditionally inserts a call to
