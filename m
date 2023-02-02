Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E4DAD3A
	for <llvm@lists.linux.dev>; Thu,  2 Feb 2023 22:49:02 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 74so3956429ybl.12
        for <llvm@lists.linux.dev>; Thu, 02 Feb 2023 14:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1gNA4C4UihjneUIjcFqX08gIYJikAuQ32UbK2Pru/1I=;
        b=eXEV/h9ck3KRFOC0ByQf7K9dBgY69UZLz6azXFp3xsXycbPYGy4+XbeA+lIwQ8gFPz
         T8ZcTs1vb8v2RnQgTIvkWTEaL5b0+nBGUzd68TC7jljIiOutc1V3EwFUULs1pUFJ45AV
         CcKKJiSlBY8SLLL7SpFcwclCggdDLgDKxIMqc//u6FrzcrEQ/6G4O1Jt5JkBJfRGHDKd
         3UCUso5eZg15Xs4buGiqqGRtssbGFcpBEopEn05zq7B/YmjtqtcHiwweYToTp/W5cXl5
         px2m3nQ/kpbK6joPU/xzDE+g6KOaSKlC1Mr1eUtrXpLCO8jddY1iHOQxiak/G+NC1MIE
         ujkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gNA4C4UihjneUIjcFqX08gIYJikAuQ32UbK2Pru/1I=;
        b=0TG5yqWwu3iyNaKyPII3wkV+ocnXB8hBbnXaNh9rpvch4RK1W7IOm0U5Q6TpbV2R1K
         NVVxpuFT2x7YgfeOSBbdHEIGqwxTNTMBWwTtt3eR6bAgcvvwTzDGMNaEYw20N1QEDQYf
         cB/VyspvRotdiIOGWKyBlKA2ugrnprmOtHqLmy02PqEraUMpLjbEww8XhRBsTC0L83N/
         wl9cDEsejVjh8zRGiNVe0ZmivwY5kBMpSyZ4DCl4Wr3uK0woMXPS0gePR/H2x0PiEH79
         YrWFiA/klexSEevvJURQEQtcsFBA2O4H2IV01dL3fwiZS5eXl9rz3mD7VxiG4e4IwoD2
         v1KQ==
X-Gm-Message-State: AO0yUKVR4x6ugN1RYf/4+kcp+uZN7Quhdcj0mFMrzM+QQLYZ30v70guX
	xOvyzejw3wJkDDQbcDurPy13dzg7Ygo/c6iSG86D
X-Google-Smtp-Source: AK7set8DpBR6h3vjqBWo+Zrt62eyBKF1nPb5+u0iZqS7mgjSxrSv1ddMq4XIo9cKGrMGhsBe38+jCvOh+DzpO2R2LHE=
X-Received: by 2002:a25:ace6:0:b0:84f:45b:b39c with SMTP id
 x38-20020a25ace6000000b0084f045bb39cmr652328ybd.49.1675378141857; Thu, 02 Feb
 2023 14:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230202223653.never.473-kees@kernel.org>
In-Reply-To: <20230202223653.never.473-kees@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Thu, 2 Feb 2023 14:48:50 -0800
Message-ID: <CANDhNCpz+vCqXMDES+_cu8PuTi2c9jhcFqZ8TCVJimAOABjCrg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Support Clang UBSAN trap codes for better reporting
To: Kees Cook <keescook@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yongqin Liu <yongqin.liu@linaro.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Marco Elver <elver@google.com>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 2, 2023 at 2:37 PM Kees Cook <keescook@chromium.org> wrote:
>
> On arm64, Clang encodes the UBSAN check type in the esr. Extract this
> and actually report UBSAN traps with some specificity when building with
> CONFIG_UBSAN_TRAP. Before:
>
>   Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
>
> After:
>
>   Internal error: UBSAN: shift out of bounds: 00000000f2005514 [#1] PREEMPT SMP
>

This is really great ! When I brought up the opaque error messages
just a few hours ago, I didn't imagine you'd have a solution so
quickly!

I really appreciate your lightning fast effort here!

Really, thanks so much! I think this will have a big impact for folks
running into these new bug catchers.
-john
