Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D27E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 21:48:57 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id va17so5853515ejb.0
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L1iX27wFeV0T/X/fBHF2BNfaWRJqrDGUQT8DlTbAlDg=;
        b=FWC7HCmyZVead3f2O3DASZjsf1DvWU3lo55I8StLcNFNInBWNn7wtRAGdMMZc7vrOy
         4gtk6E+oaR9L65XjWqwLxsWfinSbNh3ow9dXD48q+t8QtaY3AmdJvPCbjHSn25eVEFJh
         CND1MbO0rSFNpPNls/b2Mfc4joBGdSTOm5a5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L1iX27wFeV0T/X/fBHF2BNfaWRJqrDGUQT8DlTbAlDg=;
        b=fWecv2TKMKDHWXzuxKWLaEjZpdnwJqddFd1ygLFMGSmx5l9SYkBSBGEZ9TUPU9bSEm
         RFpXMjPuaYEHsOvlkLrtNgnCVaQ3+GOjdtL7i1jfSn2PvO8mfTcy+oXTtZ15l4OchM7H
         0aKCZwtL4fNSNx5+HYETInvg5jE795Rz7SJHIOJzbG6mWGtjmPqDDbNBQFeiAxRK7RuQ
         72uITKMbUdY+Bics26jPA0OrZHfl1TRy024JZnAiydXfsWK0IKnimvu+oDi+qe5rpY2Z
         FHuCRS4M6dpHCU7kN8sqc6V6fuKSvGVFcSHilpkjHjfCY+BnCHgIipMTkFDluft6fX1h
         x/xw==
X-Gm-Message-State: AJIora9a1TYWVU1ncnNZxFhdyPdHIWSNebl3zcJ8XeSZTwYj8PsQ0Bbe
	D6xjzg9yNHvhA3TogFjHh/FmawHGUxEvtDcvnnc=
X-Google-Smtp-Source: AGRyM1uIycZOFMQuMzBlHYQ8zAQvmoUVUfdPOobt4X/lWZubpElguGra33uuNYpfTztdoySf7u8AhQ==
X-Received: by 2002:a17:906:2086:b0:712:1257:77bf with SMTP id 6-20020a170906208600b00712125777bfmr11094911ejq.655.1657835335291;
        Thu, 14 Jul 2022 14:48:55 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id ky13-20020a170907778d00b0072ae174cdd4sm1155625ejc.111.2022.07.14.14.48.53
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 14:48:54 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id v16so4261973wrd.13
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:48:53 -0700 (PDT)
X-Received: by 2002:a05:6000:180f:b0:21d:68f8:c4ac with SMTP id
 m15-20020a056000180f00b0021d68f8c4acmr10262406wrh.193.1657835333499; Thu, 14
 Jul 2022 14:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714205646.4023495-1-ndesaulniers@google.com>
 <CAHk-=whnndsMXO=32vFn9-Osw4r8-NvROV1rtsbxjw9Uvj1WPA@mail.gmail.com> <CAKwvOd=PB9Kpbnf3y0e5u6LrZ=Lv2Ex8O7y=VY63D67Jf2eyHQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=PB9Kpbnf3y0e5u6LrZ=Lv2Ex8O7y=VY63D67Jf2eyHQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 14 Jul 2022 14:48:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=whs05rO37wjdTOgppP-N+mYy70Q2ctBrp6vMoUP=OtcVA@mail.gmail.com>
Message-ID: <CAHk-=whs05rO37wjdTOgppP-N+mYy70Q2ctBrp6vMoUP=OtcVA@mail.gmail.com>
Subject: Re: [PATCH] ubsan: disable UBSAN_DIV_ZERO for clang
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Marco Elver <elver@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 2:38 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> int do_div (int dividend, int divisor) {
>   return dividend / divisor;
> }
>
> has UB should divisor ever be zero, not much different from:

So?

What about the million other '/' in the kernel?

Adding one check to 'do_div()' is just stupid. It's like using a
bottle-cap as an umbrella.

Nick, that's the whole _point_ of having compiler support for things
like this - automation. Because doing them manually one at a time is
just completely broken and stupid.

                Linus
