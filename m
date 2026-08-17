Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B08E3EA947
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787007254; cv=pass; b=dnqpWpBNjN4zg4kEgUpAYz3BeL6269QQHaHh2/iIl9T9WGLLoKTN7zcyP7KyHdBdQ7CmGAp63L9Zcob0S7hPBffqcD6VJtmLe6/CxD4c2pZmPSVBIVQ2rVdui5BA1AQBXcR1l5V2FkDxG59LzOe7qO9uys8jio5ModT9M4kWjG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787007254; c=relaxed/simple;
	bh=iJ1GSAg/wc98Z92pYDWBr9C6hm164sk6lWEx3mFGpic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2R1pmjO/pMu7LlcNulVBOQd6NWEqY6kcc4jHcCVfw23ts5NUNBQ6LeJp8/vi8EJtv944GJKeKCpslKgAbUK8P5iNqXkthHfQWB3rsi9tKniFLFfz6jYqFa2kidojc7fRjmRKqGGUZ0GlZBoGBfKUp5eTgKgCmhSBCA/1MFRzIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O/JotXX5; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O/JotXX5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c197eaaab00so745408466b.0
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 15:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787007251; cv=none;
        d=google.com; s=arc-20260327;
        b=UEROS6NdYqMDZ2jF6XD3AZW2UawnlFoGqh8i05r7dS7WL1/x0W+600cKjj0oNkgmGQ
         KIk1K2dG8YQ1tZ7OyF/W65r0hS1aHxqij2lHxY2rRHtmRWVHvl6PyKXhELzJxNPA4VgB
         qucgvXzLSQyS/6ktSZoEjMpsm/2eWKmurTvG4EhZoPDzgwxty69lgEgBnMyzz6yjhHSi
         MsekGLbvJKeaLo+YPg314NqtcCT6C0TAupyNsuMG+OclVn9dV37QYXLPV8jAixMPL2ZK
         VyWXLTofzD6OF0Oi1EdQXZDlV8j9GwxhKV88tKlw/da+5dcbMrC7cHLOSthxHueR7r4y
         pOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u5dhNWMYyRmUyG6+pD3T6b5XVM3Qf6OaAA8jv9AvKJU=;
        fh=7LnF2dBckpQlQNCQylobHoWw5WoOkBnerr1AUnSGddg=;
        b=LrslTjICXujVHk9fw+6UUkuPBw4lS0tnJdSGR6wgROTpAg6pE0xxSnTiwqfIhy1qU6
         hy+/pf/9m9MHyi5hlVLzTgK5X8HVq0PwnqtS123sRtJK1ln8Chqyy410W1VwxVsrVNt4
         ek6kPYdulitrQUfk9MD84K+sOV8HB212g2i6n9bX29hbxApy5YFwNXM+LlMP6FnaL5dO
         Y3juoD9UfYrMhnHHWLQpvyLhC0H4phE5XV6+fn1VQjdDtr2Sn4D6r0BrXEH3bDBHkYlW
         4GOD3c4aLE5rkcAI7uVjhkfrbgvLBJSt7kBDl3YYUGXH7kXmuxq2dN7/5wvu6Tn5ALpd
         xOuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787007251; x=1787612051; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u5dhNWMYyRmUyG6+pD3T6b5XVM3Qf6OaAA8jv9AvKJU=;
        b=O/JotXX5rQtyUXzuAUzVe88ztzd5waVqFJ8t2kkn3vpJ6eRKZgVv+IrN3UkfMSeAj1
         k4NYI6MuybK9AoIk2pSHbpPrW9CGlo36HmB7rIHIeVTgPeyHMzA9TMZM2aUOP5HlDo99
         YOgcVfFkNBk8qKNLCZm+2qh3ShzIeRaPr/+oqNb3MFW5pnkp63nRtnBWSiNHzhSS6fJM
         CXVPMG0TVvhZGVNBlz/7LuGQlRwadwyESXED5QLqoUPKh3kSlrcaE3UrGbM0inr08phe
         2EgdWBoWLsHh7f+LxjT+4kz4IcDD7XIwrP3jzONl0GnDG/JbwvtJQjKwoETsuGfLLuSE
         4QEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787007251; x=1787612051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5dhNWMYyRmUyG6+pD3T6b5XVM3Qf6OaAA8jv9AvKJU=;
        b=PRM2odgLADQOnywQHHDw9/knujhu6KjMuboX6fDQFEpDPhuk6tvUn+W6SJBQ15sMUM
         /IN8X6AmBBXSAOooJbRvPzj9pxbwaeVdh/qhkc5fW8HNvbkLzn+sgIS4JMMrrVhs5ew6
         yeplCnYeiwMXVsMFWAT+wI6Oi0LeXswW2CUBtsLxKBfnrKU1l9e+tya447InAPoJgowc
         SkpwM1/GzNSTeBu3kve3MvOSP5/3fwlTicgnMyG+fNtZN7XjyiEzUS5xjV8DX6SZwgGH
         a4GerfvI5n9Q7lEsV+b0et1WDBSMNA/ahiHD3SFRZHtU8hcuRLpAm44KhNZl9bbCC2rL
         2k6g==
X-Forwarded-Encrypted: i=1; AHgh+RrJORvX+BN0sGtjvwNa60h+uz5TOFu/25Z6x0pWmFK7r27GzENzR0rszwbp4xNgduYZREHx@lists.linux.dev
X-Gm-Message-State: AOJu0YzeXw4BF66E+Zo+XIN9uHndO9lcMh5R6hTNzCbeayTWFLkUZ/Q/
	Jx650mdVBgIO9W5hqbjyVEyICRTaYm2SK+zeWIgbK1GKoNkvCVl2uzsOpby0LH9L1L6Wrj/4vs4
	k83D9ARkLZTMTcZ5XapLJFJkGGfX1kJd4Nkck8Ze9
X-Gm-Gg: AR+sD13sPKJNkOFw1tIoizv5EYYKR8ViIxfO8pqEoPBRHPplNaQ9RXVh3p2drmwAlyE
	FhCw5yyrYOZJzgzMSraP3vT2EHR1npo36lp6PNqJrCwcd+7kYrsUpZVeB+GB1+COjWnIaNfp8GH
	HF73gWE07XfrKJ5TXZOt+uQNBv8MwkC+dsOnUW5VLlBVzBZWGRuE1vwrfYRZb3QIrv84RraI5kA
	yICzzhxkRhqWsyg1DZQVKpjg3lMNt8i8R3Wl2DXtuhh5CGKKPtWUkTNty+XuZ4R+1B+CwT/ITR8
	mZ1b/4IuhxX5cvfZjC2IH2gLzbDkZ9LKnx1hBvYueYOKQG8YON3/PuEXd01rKnMVvLf1p76ZqS1
	W31vCIRHotGwr4jtUUiv5JBucGI/pwrHkMsVbBh1H1NNvaYoXMU1ivARM
X-Received: by 2002:a17:907:d08c:b0:c21:180c:d82d with SMTP id
 a640c23a62f3a-c212a1858femr1259170866b.20.1787007250883; Mon, 17 Aug 2026
 15:54:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813075304.75988-1-thuth@redhat.com>
In-Reply-To: <20260813075304.75988-1-thuth@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 15:53:59 -0700
X-Gm-Features: AcwNN1XLIBynaITswGLdvzxuB2Uj3-hZ60VtqOVVnBmJvH47W0N_DNVtiARsPdg
Message-ID: <CAKwvOd=B2o5bdup0YRoKdN0J3GrZh+4M6VLamDAmit0k53o=0A@mail.gmail.com>
Subject: Re: [PATCH] kselftest/riscv: Replace __ASSEMBLY__ with __ASSEMBLER__
To: Thomas Huth <thuth@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:53=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:
>
> From: Thomas Huth <thuth@redhat.com>
>
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.

Thank you for the patch.

Correct!
$ clang -dM -E -x assembler-with-cpp - < /dev/null | grep ASS
#define __ASSEMBLER__ 1
...

> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.

Yes, thanks for cleaning up this legacy cruft. Godspeed on fixing the
rest of the kernel.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tools/testing/selftests/riscv/cfi/cfi_rv_test.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h b/tools/test=
ing/selftests/riscv/cfi/cfi_rv_test.h
> index 1c8043f2b778b..184df6903d01c 100644
> --- a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
> +++ b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
> @@ -56,7 +56,7 @@
>
>  #define CSR_SSP 0x011
>
> -#ifdef __ASSEMBLY__
> +#ifdef __ASSEMBLER__
>  #define __ASM_STR(x)    x
>  #else
>  #define __ASM_STR(x)    #x
> --
> 2.55.0
>


--=20
Thanks,
~Nick Desaulniers
