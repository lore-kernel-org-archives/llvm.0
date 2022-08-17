Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB82F2E
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 14:52:51 +0000 (UTC)
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-04.nifty.com with ESMTP id 27HEjs3N008264
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 23:45:54 +0900
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 27HEjWLD026828
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 23:45:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 27HEjWLD026828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1660747533;
	bh=uSGHNJC19uOo+o4MTqX8ubojhADfhgOtyxA3oBtx0Vw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=zzx5VAh46M/Lr1np/fAfFPD43U0C9d5eXTm8lncAWE8P07ixx8EjPNTnhuJJo+cil
	 Lxvm8EbZ3QMhrejTuQbTnBNa2keGhA/KfvBeRwp0RBsApOY5Z5tnakBpMS1UyS4s5X
	 6pUAc1ry0VNea/1F72cAuKaTNYWNh5RjD1nPhTxHJ2+QLecEQMRe8yAGJxmgwYY81c
	 mZ9HhU7XchekuVUmA/Eu7YsMGMceqG4BLPijWmQ1AanUoRkD3JBQUhor1D6SJ8Jixs
	 9wT02sOzE50xfMSyjBvDfdahD29o+4TIPnU56reoZP1yfFonJV3R4LjdMGakzzKoN+
	 jmYJ0j69bNu4w==
X-Nifty-SrcIP: [209.85.221.43]
Received: by mail-wr1-f43.google.com with SMTP id h24so2405802wrb.8
        for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 07:45:33 -0700 (PDT)
X-Gm-Message-State: ACgBeo3bwdD9WBJbTrFgLYH21Mtm616NVnohuaSP5NFSNzeL+XF/Ijmw
	sYU0ebcM/xJ8zmvUU7j+PeR3An1aRm4SCa77hUs=
X-Google-Smtp-Source: AA6agR4611rLwhvJge2V5I5V2koJiMq8syWgMNxEIKfxnkhKZB+GtpMB6g0Pr+VpUQyacDmgDOMa9Ca/O/RLwbZ9EbQ=
X-Received: by 2002:a5d:6248:0:b0:222:cd3b:94c8 with SMTP id
 m8-20020a5d6248000000b00222cd3b94c8mr14909860wrv.97.1660747531856; Wed, 17
 Aug 2022 07:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220810230133.1895778-1-nathan@kernel.org>
In-Reply-To: <20220810230133.1895778-1-nathan@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 17 Aug 2022 23:44:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATMpk2F1n489mNAV7cxi8Z_E_hNjhyvX5QcUqQXUXf_4A@mail.gmail.com>
Message-ID: <CAK7LNATMpk2F1n489mNAV7cxi8Z_E_hNjhyvX5QcUqQXUXf_4A@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.extrawarn: Do not disable clang's -Wformat-zero-length
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 11, 2022 at 8:01 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> There are no instances of this warning in the tree across several
> difference architectures and configurations. This was added by
> commit 26ea6bb1fef0 ("kbuild, LLVMLinux: Supress warnings unless W=1-3")
> back in 2014, where it might have been necessary, but there are no
> instances of it now so stop disabling it to increase warning coverage
> for clang.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Applied to linux-kbuild/fixes. Thanks.



>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 9bbaf7112a9b..69cec45c4e71 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -48,7 +48,6 @@ else
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wno-initializer-overrides
>  KBUILD_CFLAGS += -Wno-sign-compare
> -KBUILD_CFLAGS += -Wno-format-zero-length
>  KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
>  KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
>  KBUILD_CFLAGS += $(call cc-disable-warning, unaligned-access)
>
> base-commit: aeb6e6ac18c73ec287b3b1e2c913520699358c13
> --
> 2.37.1
>


-- 
Best Regards
Masahiro Yamada
