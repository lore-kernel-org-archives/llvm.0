Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A8A7E3
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 08:36:16 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id z25so1520440lfr.2
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 01:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BbZr2IDF5mYuV07dt5XpEzbm+CGWl8GmrLDRuGPtC7E=;
        b=dy2bPFFGYzvTFhSiBzM0TcvYpvsd486uNttfXoBkYHRYX0ZSvSi6As+Ls9jZmxoWNA
         +ItLMlT3OLXdDlumTHfrPuBqZuwqpm0OMtRjkHSpumfd60Fxsz107BbLgruvoQnDMUtf
         jSzlcm4MEjwrxMbIVpUzEYIbfhoiL+LslyTfYLItTAYJEwwHLzwsR/ZUzEzNuyVbMPgf
         Pi1hHJJXer09s60ILhb3JHjZ7TEOLraL3v4DM1R7eObD6GBv7aUQbIPYXt9Iyqou6ex9
         x2du5OYCO124XUT0K7y24O2Ycdi6Lk7N1jXH9FQ63qHSQ6Biudqq/qKCyQr2/rU1PIZl
         bqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BbZr2IDF5mYuV07dt5XpEzbm+CGWl8GmrLDRuGPtC7E=;
        b=Y0U1x3PK9nSMiU4VxSi2G2Vm0a0mUkt8LkcIOwrBnKbNr11RUA2ZjwdZsc7kiR2/fX
         fN3WyhIqDiocNtMhSk/UIbq1zrKCTaulxicMtOtcV7Ej08V7y6K2/M6Gxf1Zw78pLWdJ
         jruKtR8axvoqPCinR1GU/uLVw4FOVZcjxQfBSkUxejAG4Zox2zvuUV8T1hjOLTrcrXU0
         yLNokcuwtaiYjnksNRQ0VwYdbhlnQfQIz2/Jas5Nha9lOb5ibjNp49Ulh+k6m4McPavr
         6zCfs4ypcMoFrFXM8XeIp5zMyd3PA0p3LddpFSi5IFXqBzTrkguibx55wZr3WvywCBp6
         9A6w==
X-Gm-Message-State: ACgBeo1E5f+30tymlJqtTO8h3w093FxrkBTtZSPM82za6NALgDO/n0Mv
	mxsQ3PnBMxvdTLmBa/T/mGH0OWOHp3nk2AvMkaX1Wg==
X-Google-Smtp-Source: AA6agR45b0zHB/0PVCbyFGItE7H2cGmt2X38+vuxkMh+HTrWXlHOtyQNKUH4gGHyC7HuLNUy7Nulf7UAYBr8CNNVQJU=
X-Received: by 2002:a05:6512:401e:b0:48f:ea0d:1171 with SMTP id
 br30-20020a056512401e00b0048fea0d1171mr4372971lfb.137.1662712574759; Fri, 09
 Sep 2022 01:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909073840.45349-1-elver@google.com>
In-Reply-To: <20220909073840.45349-1-elver@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 9 Sep 2022 10:36:00 +0200
Message-ID: <CACT4Y+bY1SkME7343-EZw_C2tORWrJU0MweArrPf2om8R_wfoQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] s390: Always declare __mem functions
To: Marco Elver <elver@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Sept 2022 at 09:38, Marco Elver <elver@google.com> wrote:
>
> Like other architectures, always declare __mem*() functions if the
> architecture defines __HAVE_ARCH_MEM*.
>
> For example, this is required by sanitizer runtimes to unambiguously
> refer to the arch versions of the mem-functions, and the compiler not
> attempting any "optimizations" such as replacing the calls with builtins
> (which may later be inlined etc.).
>
> Signed-off-by: Marco Elver <elver@google.com>

Acked-by: Dmitry Vyukov <dvyukov@google.com>

> ---
> v2:
> * New patch.
> ---
>  arch/s390/include/asm/string.h | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/s390/include/asm/string.h b/arch/s390/include/asm/string.h
> index 3fae93ddb322..2c3c48d526b9 100644
> --- a/arch/s390/include/asm/string.h
> +++ b/arch/s390/include/asm/string.h
> @@ -20,8 +20,11 @@
>  #define __HAVE_ARCH_MEMSET64   /* arch function */
>
>  void *memcpy(void *dest, const void *src, size_t n);
> +void *__memcpy(void *dest, const void *src, size_t n);
>  void *memset(void *s, int c, size_t n);
> +void *__memset(void *s, int c, size_t n);
>  void *memmove(void *dest, const void *src, size_t n);
> +void *__memmove(void *dest, const void *src, size_t n);
>
>  #ifndef CONFIG_KASAN
>  #define __HAVE_ARCH_MEMCHR     /* inline & arch function */
> @@ -55,10 +58,6 @@ char *strstr(const char *s1, const char *s2);
>
>  #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
>
> -extern void *__memcpy(void *dest, const void *src, size_t n);
> -extern void *__memset(void *s, int c, size_t n);
> -extern void *__memmove(void *dest, const void *src, size_t n);
> -
>  /*
>   * For files that are not instrumented (e.g. mm/slub.c) we
>   * should use not instrumented version of mem* functions.
> --
> 2.37.2.789.g6183377224-goog
>
