Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F651BB48
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 22:06:27 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d72fca0043aso311446276.1
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 15:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692309986; x=1692914786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEagVrEGDeFW5SN5vPpOPc2eA1RFxeNwNkE6U0C7DwA=;
        b=jb/BfzOiDCWLz0fbsePFN1YWnMBu70IBbPcFr9NlJhuCD61w/5qYVXQBOrjiQpuJ2B
         GWH/76Nmvj9omdxfyLjasXMDkh9ymPzptefjOMFb/4UNNWE03pC5REQZW3riOYrifLgF
         zge81KdiCXLBe6dN/jwLiKJm+fJeRNs/tPEXtjss6JVAuhT+vCA0ETcl1vOxwXRTkYtD
         Lb0oRIl8HwlWd1XvJa5/xX4EwvmKcMHKwnlAR6xrhDE07zZt4IdtTCwg4bWSmSR9ipmj
         BbK1D/gcxD5R7jMMcqGaozLGfCoEPMbXIZBjHx7230HvThOItfJ8tmDOWF07wPdBPMEL
         cpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692309986; x=1692914786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEagVrEGDeFW5SN5vPpOPc2eA1RFxeNwNkE6U0C7DwA=;
        b=lucrksv12nf45X+EyNmxle8zXSFwgpl2dcQdxKNmHgZzIOuxNpHqSMXxSYGKmP0eVj
         UvpvPe9BpP2XgKFD45M78zWxV5rmNdS8N+iziV5xtz61oxR4KJT0wLYbHmMeH7yiQ13P
         zK/Weep4+HXJ6wViLg4t5p3pxZhMyC9/GUyBQsTKY7KFLsnIumIToMJ9ozBGqH0rsl+H
         3cLDD4RT1B76weEiFXFdQc6DTA9CroZgqj61EjYXWqvG3gu2rvLE6WPBvIhv0PUKkwO4
         XV7bcFQc1DtFRcAQrYSWVdf6NPzcBNgsmwp4xylZuZalqSBMQ5GVqpcaFqtFxd/URDru
         cMvg==
X-Gm-Message-State: AOJu0YzOiAE3qemNh75/QL1YelQvOdYR1Sc4JfiaFJYlBJmC+4lZjUhW
	xSyb8VloiJK/YTM0ELVJfxJvs1woypj5Ie1SqMM=
X-Google-Smtp-Source: AGHT+IEgYSpHAzlk0u5hqV1qyOMDcuGtnAQuKieE+kO68kfo5K6lPgyVsPLp34WPBN0mbU6xfJgn+MRL6/5KF9uL/dg=
X-Received: by 2002:a25:d348:0:b0:d1a:65c9:d98f with SMTP id
 e69-20020a25d348000000b00d1a65c9d98fmr845753ybf.56.1692309986633; Thu, 17 Aug
 2023 15:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230817200558.never.077-kees@kernel.org>
In-Reply-To: <20230817200558.never.077-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Aug 2023 00:06:15 +0200
Message-ID: <CANiq72=-DL0NV0zJrrzLmK77e6FALSupH4N-i-vfg8WrZdPDcQ@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: counted_by: Adjust name and
 identifier expansion
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 10:06=E2=80=AFPM Kees Cook <keescook@chromium.org> =
wrote:
>
> GCC and Clang's current RFCs name this attribute "counted_by", and have
> moved away from using a string for the member name. Update the kernel's
> macros to match. Additionally provide a UAPI no-op macro for UAPI structs
> that will gain annotations.
>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Fixes: dd06e72e68bc ("Compiler Attributes: Add __counted_by macro")
> Signed-off-by: Kees Cook <keescook@chromium.org>

Looks good to me, thanks. Perhaps we should split the UAPI bit into a
second patch.

I can take it into my tree; otherwise if you need this elsewhere:

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
