Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F93D7A
	for <llvm@lists.linux.dev>; Mon, 23 May 2022 21:04:18 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id c19so14558138lfv.5
        for <llvm@lists.linux.dev>; Mon, 23 May 2022 14:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eOT6/IEEvL647FHmiCg7MRICtIFsZAtUMIfvYbPx3SA=;
        b=TB/AO84lC0LITUBGehrw8rhOuiDSejBSA9Qz+lEc73w+ju8dHPmXn5PMLWT3SRdJrU
         suS0JTx8GWUPOYH/AS5OeqGcjMJNPJXACAtcFXCFsCXYe6Wbnv4pDhnB44c73UUzHCQ0
         PeCR2iNZ4GvbK+YZKJ3VW+i/zlDerIASKR9O3+qm/zq5vRzAmqvEVuPlRypYI/469BWA
         EN03DN0SpFnK9+5MrULChGKPma7zq6vsVSYZroWCVM3zKA5Mx1xJRPnT8a7cmvOAag+4
         ZdTyJdVFRW+/HnPRZy9TJdVxANnzklWvZyv8mPVgMxt+deT1r5U3HKxECduTDfkAer/M
         Q71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eOT6/IEEvL647FHmiCg7MRICtIFsZAtUMIfvYbPx3SA=;
        b=gK0gtHAF6wLijOdDjb2A7DlduXtIs1RxEidOMwF0AFy3fPUZycF5Zp9AwjQ/8bndkF
         bFbEmXsAaxo9Rq00Ajwd/z998DLwLlWc2zCp4QokZwfme2bve9/v7JXPE13lH67cPQ5r
         XrvEUcHUoxn2ulZROMLLo+OibT91nml9TNtwmqy86TCsrlgvfaDq9+o9mPZI6wX9PrWF
         nTv5v5+GJz9urGaP5ZaRK4RVJIqDrCacbRr2KGMBzxeEzsSkT/FPNJFB/TSoV34LjN+4
         CdntH/+fGVZDOW4CwcUguHVKkmWjJr92UjQh7S1rWj1/vBy++Hc1Jxr7+V9Z1L9j6Mcb
         8tzw==
X-Gm-Message-State: AOAM530cJ0ULrC2v1q0pVNpMxbYUFG0R4mY97ryHphcnaw43qG2fMxDC
	jjJitBZ+hIVuleSy8QlHMuTVzUPChwZpvW4/+Yx1+w==
X-Google-Smtp-Source: ABdhPJwiiG4XoO6s8TxJDH+8amPPG6CcR3JcQv0U+ZDwF04t01N4pXb7x0yQtfESBBKBxKqDAER8pmvL0qGIg+evkxM=
X-Received: by 2002:a05:6512:48e:b0:477:c024:1a1c with SMTP id
 v14-20020a056512048e00b00477c0241a1cmr17906274lfq.100.1653339855792; Mon, 23
 May 2022 14:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220522160117.599023-1-masahiroy@kernel.org>
In-Reply-To: <20220522160117.599023-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 May 2022 14:04:04 -0700
Message-ID: <CAKwvOdnTFvDKDr_tr5digM1HguSQw65Eq+TT=mhr_AUcVGVLpQ@mail.gmail.com>
Subject: Re: [PATCH] fixup! kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Zijlstra <peterz@infradead.org>, linux-modules@vger.kernel.org, llvm@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 22, 2022 at 9:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I will squash this into
>
>   https://patchwork.kernel.org/project/linux-kbuild/patch/20220513113930.10488-3-masahiroy@kernel.org/
>
> Sedat Reported an error:
>
>   https://lore.kernel.org/linux-kbuild/CA+icZUWttwjhDNPO1VuVyiMoReH5e83nsYDd0rEoY8-Uwv6pHw@mail.gmail.com/T/#md82f561e348b7959b7270c33ac86fa3edb0d773a
>
> __used is needed to make the combination of
> CONFIG_MODVERSIONS and CONFIG_LTO_CLANG working.

Yep, vaguely reminiscent of
commit f3751ad0116f ("tracepoint: Mark __tracepoint_string's __used")

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  include/linux/export-internal.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
> index 77175d561058..c2b1d4fd5987 100644
> --- a/include/linux/export-internal.h
> +++ b/include/linux/export-internal.h
> @@ -10,7 +10,8 @@
>  #include <linux/compiler.h>
>  #include <linux/types.h>
>
> +/* __used is needed to keep __crc_* for LTO */
>  #define SYMBOL_CRC(sym, crc, sec)   \
> -       u32 __section("___kcrctab" sec "+" #sym) __crc_##sym = crc
> +       u32 __section("___kcrctab" sec "+" #sym) __used __crc_##sym = crc
>
>  #endif /* __LINUX_EXPORT_INTERNAL_H__ */
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
