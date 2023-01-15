Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CF110E3
	for <llvm@lists.linux.dev>; Sun, 15 Jan 2023 09:48:17 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id v6so18722890ejg.6
        for <llvm@lists.linux.dev>; Sun, 15 Jan 2023 01:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U91tZ1pcL+C5oCwSnm2ekb7b6jfm6xqHe6fUGsu0ktM=;
        b=nnDDnTlzHuKvIuOwtJ8+Uq5p94FYTsvGa/hjrDCWnj4igFQ/+5OMt9b+0VuOvJTSsF
         i7+CnSb7s3qDZ5PosseVVS+xilrMjkv66/dEb67/IwDMbVkd7NyGVdjB24XPEYyqnQ7G
         poVHSWf4P6kv4bpOGH+YVXZjL11kNMKRdc7WZptXhqg+Hqbc4efIfYqaywEeLmjDywSG
         dO0O1tWss+0Xi1jD3BdkpFUgRn/dHyE6iZY+36C0mjvBQPFYXt+LmoC08/DDGLnFNO5T
         uG1aFnm6Ik/Ma6VQ0kYR0VA6lJ3U2SM0Q/bUtuAyB73YzxZQDViaE1Ew7hh8tTSW93J2
         si4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U91tZ1pcL+C5oCwSnm2ekb7b6jfm6xqHe6fUGsu0ktM=;
        b=FG7pRbXSdTYjOMUdT3slNnWtIq+U9HcT9YOzChL4TJzQqHf5STVaod1K2wLfSgsMy/
         /j7l7GbIhx0hjlL7dX86ijc3QNd7bksrrOnzHsWcb2OWjChKGpqDpbe2AQZ4CksMiHxn
         Oiik6N+xbfaVkVnWPoyoYt1ayUJYDylUgl+rfafcQNQK8BRKNh2UADPOi6N1wd1q+0Dk
         34RgceApzlT0gors8k+GwTe4bn2jM9NSLQztDd1k6MgnVE9Q/b0tYFV9HEMwzUf37lhK
         ZOiCIj7SuiV9ujq3XRjWVkM2/j/nTUjGlEA7EXHOY/Jpq7LHJWGSohPKjOuWYA/9z0gt
         u9AA==
X-Gm-Message-State: AFqh2koDBVZja4NgCC2+rkVIzWOHn+fnYqDDFJWGR/XPzgXvtKdU8kn7
	Me+vG/n3PINttXQe8dMPl8upWnay4tPDwFpjfHY=
X-Google-Smtp-Source: AMrXdXut/jQfPnLAZ0P8wTjeVheBJGzDy1oXd+fLbIjFFvMb2cO1l1wWanUjf0idLIAT+L4AoNQ/GeLj+GyV7h2w9sI=
X-Received: by 2002:a17:906:d217:b0:7c1:8a0b:f915 with SMTP id
 w23-20020a170906d21700b007c18a0bf915mr6150975ejz.42.1673776096219; Sun, 15
 Jan 2023 01:48:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221217044436.4138642-1-davidgow@google.com> <20221217044436.4138642-3-davidgow@google.com>
In-Reply-To: <20221217044436.4138642-3-davidgow@google.com>
From: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Date: Sun, 15 Jan 2023 10:47:39 +0100
Message-ID: <CAA76j91Kn62Rqs9843njNSmuvb2XEyNLnC996Bmmz1obTbCX9w@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: arch/um: Disable FP/SIMD instruction to match x86
To: David Gow <davidgow@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, rust-for-linux@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	kunit-dev@googlegroups.com, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Daniel Latypov <dlatypov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 17 Dec 2022 at 05:49, David Gow <davidgow@google.com> wrote:
>
> The kernel disables all SSE and similar FP/SIMD instructions on
> x86-based architectures (partly because we shouldn't be using floats in
> the kernel, and partly to avoid the need for stack alignment, see:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53383 )
>
> UML does not do the same thing, which isn't in itself a problem, but
> does add to the list of differences between UML and "normal" x86 builds.
>
> In addition, there was a crash bug with LLVM < 15 / rustc < 1.65 when
> building with SSE, so disabling it fixes rust builds with earlier
> compiler versions, see:
> https://github.com/Rust-for-Linux/linux/pull/881
>
> Signed-off-by: David Gow <davidgow@google.com>
> ---
>  arch/x86/Makefile.um | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
> index b3c1ae084180..d2e95d1d4db7 100644
> --- a/arch/x86/Makefile.um
> +++ b/arch/x86/Makefile.um
> @@ -1,6 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0
>  core-y +=3D arch/x86/crypto/
>
> +#
> +# Disable SSE and other FP/SIMD instructions to match normal x86
> +#
> +KBUILD_CFLAGS +=3D -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> +KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-sse4.1=
,-sse4.2,-avx,-avx2
> +
>  ifeq ($(CONFIG_X86_32),y)
>  START :=3D 0x8048000
>
> --
> 2.39.0.314.g84b9a713c41-goog
>

Reviewed-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
