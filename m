Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2816C79E0
	for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 18:19:55 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso204135pjr.5
        for <llvm@lists.linux.dev>; Mon, 27 Feb 2023 10:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfnQo7L3hy6IE8pwdX9cAeSy43FJsV0FyB8x83SeQeM=;
        b=rWPmP+vycZsUPGG7S35v7wB6cnRGrJy6xMe+/4D/SZEInlX72UXXfiai/N9K68G8yL
         k2OUQjMGwAm0d6NrWdzUiGagK7tiqgeURmslTr7oFtxcqcs26pm5KFC0+/UNKdapjhOl
         EPXvLc/JIvQJn0gvolK/KfbCBZsL6um/osDUiEzF7hV8lx80qTu6RNRnYlEAgGw2ks+4
         p2raBH/CJha+U86cbwYAsVTrnqYq4hjSSiN11aycFLxDQryNokV7UCJ2+KDN9q5xHfTe
         z0INCL4Ejx9YtFZwvZ8Pt9dwUACgMwEFZ8TmD95OO14MMA+55B/UB0rt7c0y8lWnwr/j
         ipwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfnQo7L3hy6IE8pwdX9cAeSy43FJsV0FyB8x83SeQeM=;
        b=PdiacRUVoZ68JkK91WI8pPHcinwEHqM3yAm2+s7hRlP4Y1/g42zsMsI0q+mR6IbHs9
         mGjxrEyimnaldcQi9amt4N/7GgEwz2qlOZmm+ikmVWJ1qKDuw6lSzsscNkFVCybiMo8r
         zJl19lmXuknjTdOJGaX8i0lMbvb0ZX1BNzZHUF2pcYwF+itWsCm/S6BmCj1oYZYngqjw
         8KNNgL9NfJgpTWb5sqT8SwTm+VDmg47W9GXX21FS3FX5+HT/aZmfxf4IlFpUWJxNriS+
         mmmGryy47kKxh8EfohSkA5XORQ1LW9NioeYSL+mz42gRra/TGdj+6M3yu4fdOJJGE4aM
         l6jg==
X-Gm-Message-State: AO0yUKWpchyqge9lmQ1AnXBIuLPRfcgWArxwUsB+F0okNyQbB/mqigGf
	uQxaFaZw4JiVa+d0rf50nnacG+AkefMet9D2lGUuoQ==
X-Google-Smtp-Source: AK7set8fQkpeHF69hbC6AWofF1bMS6rWkmNS7WS1kGnH5uc5CNkUGJp0NZExeAiT3XS7mf85rfGg5OEqh2glTL/Wx7A=
X-Received: by 2002:a17:902:ab0b:b0:19b:5233:51c6 with SMTP id
 ik11-20020a170902ab0b00b0019b523351c6mr6436096plb.0.1677521994138; Mon, 27
 Feb 2023 10:19:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230225214500.7446-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20230225214500.7446-1-jiaxun.yang@flygoat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 27 Feb 2023 10:19:42 -0800
Message-ID: <CAKwvOdk=AF2nGozsiG2T1FHsJXhLGcpk1kysQ4eko1OOBvnafw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Workaround clang inline compat branch issue
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, tsbogend@alpha.franken.de, nathan@kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2023 at 1:45=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
> Clang is unable to handle the situation that a chunk of inline
> assembly ends with a compat branch instruction and then compiler
> generates another control transfer instruction immediately after
> this compat branch. The later instruction will end up in forbidden
> slot and cause exception.
>
> Workaround by add a option to control the use of compact branch.
> Currently it's selected by CC_IS_CLANG and hopefully we can change
> it to a version check in future if clang manages to fix it.
>
> Fix boot on boston board.

Hi Jiaxun,
Thanks for the patch. Have you filed (or found) a bug in LLVM's issue
tracker with more information?

https://github.com/llvm/llvm-project/issues

Please do so, then send a v2 (or reply with) a Link: tag to the
corresponding llvm issue report.

>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/Kconfig           | 3 +++
>  arch/mips/include/asm/asm.h | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 37072e15b263..adf2c5a0bdba 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3206,6 +3206,9 @@ config CC_HAS_MNO_BRANCH_LIKELY
>         def_bool y
>         depends on $(cc-option,-mno-branch-likely)
>
> +config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
> +       def_bool y if CC_IS_CLANG
> +
>  menu "Power management options"
>
>  config ARCH_HIBERNATION_POSSIBLE
> diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> index 336ac9b65235..2e99450f4228 100644
> --- a/arch/mips/include/asm/asm.h
> +++ b/arch/mips/include/asm/asm.h
> @@ -336,7 +336,7 @@ symbol              =3D       value
>   */
>  #ifdef CONFIG_WAR_R10000_LLSC
>  # define SC_BEQZ       beqzl
> -#elif MIPS_ISA_REV >=3D 6
> +#elif !defined(CONFIG_CC_HAS_BROKEN_INLINE_COMPAT_BRANCH) && MIPS_ISA_RE=
V >=3D 6
>  # define SC_BEQZ       beqzc
>  #else
>  # define SC_BEQZ       beqz
> --
> 2.37.1 (Apple Git-137.1)
>
>


--=20
Thanks,
~Nick Desaulniers
