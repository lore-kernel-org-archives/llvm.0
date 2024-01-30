Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229E578B67
	for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706656585; cv=none; b=q2QwvYg2aqk5vbh+UDIx/T5xsR/thjokguSh0KMmYwEjVgFqYw1KJV0VWv3/Ptj9O5DHDiON2ogGtUfnP9Cz/z7TUBq8MpS08SdoyBFWLxiIv0GeqgioCoOpJcwMR+BBYgemiIZFfk0Khyo/CBlp0uFuF2fAMXJyWhbhuli0QPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706656585; c=relaxed/simple;
	bh=8HUiHdc+ibKN+Ur+tXnhLRORbN73eAOd7u4PFL/scZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eu3s1Wx3/MwNB87RZpz9TmYsGJVAgqJVQMNvm8PqYoGawlTpf2A5y7MsZVUQBt76U+MryotOYx8FgRtm1w3iWHv4MXC2iSuMGxGkqF+7nz2DGokcGXAsi5qN55iEVPMAZ+nCjA2ZrSgJ6TOe7ogbSpRLB84r9xyO6xGOZ2A7hao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WcR1bHXB; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WcR1bHXB"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7d5bddb0f4cso1301807241.2
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 15:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706656581; x=1707261381; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5dtCbU1Q3SdQupNf6FgVTBSHBjEi2YVyb9X02Fgq+c=;
        b=WcR1bHXBX+8JZq03/PxChpiZhoGDbVn5B74kE1ZRZN+v1+lJ0RH+Ozbm9/5Yk/pLzD
         UcehAaaofEZ8emcm56NNyn9ezl/x8ii+AblYv1UnVfwT5Qa1Hf/eIiWByf2Pp6EtcLkH
         9pxwJVSOZvMoH5itF/A9ioNoBuj/1Q70RN/huMUTrI0kcGYVJFqK4nITpjzFxHsjubcU
         atALPqIP1fYQ1gUKqz77kvZEtes70Z8l0XhlFbT8yb1tCiSeulTGKV944WrTx43JAWKR
         Sbi3dLyc+hMGEAXCVcY10jdVschRBJfpegdEkDnAhbETKKQ7DAwNChwqkA8MaLr4irnF
         pK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706656581; x=1707261381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5dtCbU1Q3SdQupNf6FgVTBSHBjEi2YVyb9X02Fgq+c=;
        b=wYkjLVoPBSCZtndLzNhyX0XukvJoAn52KMnGHDbpWrEs19GtwyIsbt2AtYorn+aTlf
         rUHzPNVZdQp/dxMZH/sBK/MjY249SsbL7MJOq92yMFBKYPAM4KOGUAZNogy6rnZN1XiF
         20Y14L/zhCtU9hKYIxRjsOlXoi0Uhcje6V5IpPes/FFo+4G56Rz2Vd3vHtLPL1cMUHDM
         49ThGMZOpDapW/z7xOfE2I+fkpcJSoMHE0LugzHi7OxxWiFxJY7c5wqcG/9Ergc0VxJj
         smmoOJRV+EnwJpabEsgtUAfryw62LeNNZKXn1SH3Sd60o2lNh6ac+61zGOvk2iH+1iXu
         N04w==
X-Gm-Message-State: AOJu0YyqrphsLfXlNXaFQlKZo46Uz+V0FOZyfJwGPMdggAL5gTAQ/ejE
	mx3ahprV2CI/9bsxhAFwLePdXgxtHxlprfGBT8aO/NwunhaRdLWZasQEQBLWHc1stVW1fm9Tl3k
	nBLLnttn1EcBrXUP8azv608bVXoP5NmYFTytC
X-Google-Smtp-Source: AGHT+IHVeZnWZzX9x8MwziS5Z9VLveTfJkLYZmbBNObwr2EDXGgzT2Yz8dfelIQ/4Pz45SqzPUgDy83l9kcP8lU4+j0=
X-Received: by 2002:a05:6102:3bf0:b0:46b:3e99:7813 with SMTP id
 be16-20020a0561023bf000b0046b3e997813mr5251130vsb.9.1706656580881; Tue, 30
 Jan 2024 15:16:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com> <20240129180502.4069817-35-ardb+git@google.com>
In-Reply-To: <20240129180502.4069817-35-ardb+git@google.com>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Tue, 30 Jan 2024 15:16:09 -0800
Message-ID: <CAGdbjmKDZ8R+EjR-u09r9c4Y8Y0HjWaXPARSKsW0R5zVBSLPPA@mail.gmail.com>
Subject: Re: [PATCH v3 14/19] x86/coco: Make cc_set_mask() static inline
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 10:06=E2=80=AFAM Ard Biesheuvel <ardb+git@google.co=
m> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Setting the cc_mask global variable may be done early in the boot while
> running fromm a 1:1 translation. This code is built with -fPIC in order
> to support this.
>
> Make cc_set_mask() static inline so it can execute safely in this
> context as well.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/coco/core.c        | 7 +------
>  arch/x86/include/asm/coco.h | 8 +++++++-
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
> index eeec9986570e..d07be9d05cd0 100644
> --- a/arch/x86/coco/core.c
> +++ b/arch/x86/coco/core.c
> @@ -14,7 +14,7 @@
>  #include <asm/processor.h>
>
>  enum cc_vendor cc_vendor __ro_after_init =3D CC_VENDOR_NONE;
> -static u64 cc_mask __ro_after_init;
> +u64 cc_mask __ro_after_init;
>
>  static bool noinstr intel_cc_platform_has(enum cc_attr attr)
>  {
> @@ -148,8 +148,3 @@ u64 cc_mkdec(u64 val)
>         }
>  }
>  EXPORT_SYMBOL_GPL(cc_mkdec);
> -
> -__init void cc_set_mask(u64 mask)
> -{
> -       cc_mask =3D mask;
> -}
> diff --git a/arch/x86/include/asm/coco.h b/arch/x86/include/asm/coco.h
> index 6ae2d16a7613..ecc29d6136ad 100644
> --- a/arch/x86/include/asm/coco.h
> +++ b/arch/x86/include/asm/coco.h
> @@ -13,7 +13,13 @@ enum cc_vendor {
>  extern enum cc_vendor cc_vendor;
>
>  #ifdef CONFIG_ARCH_HAS_CC_PLATFORM
> -void cc_set_mask(u64 mask);
> +static inline void cc_set_mask(u64 mask)

In the inline functions I changed/added to core.c in [0], I saw an
objtool warning on clang builds when using inline instead of
__always_inline; I did not see the same warning for gcc . Should we
similarly use __always_inline to strictly-enforce here?

[0] https://lore.kernel.org/lkml/20240130220845.1978329-2-kevinloughlin@goo=
gle.com/#Z31arch:x86:coco:core.c
