Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1F816F26D
	for <llvm@lists.linux.dev>; Thu,  9 May 2024 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715269129; cv=none; b=fubon0FM7HxgEYtjdiC+jrN3E5mSybDpu2a0CSF347NbWB5qbEADPbnZf+DczVNKuqcErJN3YBPH3j8vZyCN6whu/t4u1I5GTRPwV5d1bwb+fgHbZgwabJKe/8Jr2N13RkpJ2vPeYY6uHg5h0kqx33MJiRD3uLgjpnkGovdosKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715269129; c=relaxed/simple;
	bh=VbUryaWATGCZ5EXBoBZLCN4tFKqA1uiKbgb/q6kse1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vC+4sezner+60sAJI4PJsKU73TAeRAXVEBvgYSvVLm1nBDpao7W219Ev18Js6wkjLaBRyC/LBYpyZniBFVVLQQI/IRL907YQa+8S8CcOdmCFEWaUdoWJ6fDDnSqbLJujKVnOpUvOj2wsj1KR/9GgxUoCxsHo1fWUt0AArgTE014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h+YR4483; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h+YR4483"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-572e48f91e9so63052a12.0
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715269126; x=1715873926; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1rcGIIRAYs5g7y2tSFAfBRRtjyll1Cgq8Dp6vv6m/q4=;
        b=h+YR4483mHuse4W3c22KnjY4kBmdeihwe0bpcpGU4EPA3HUCd8+vYw6HSrmmA75KM6
         2Q8eQ4fZkpyBFt7r3a8oJMBtyIBj96v6hVGTXoYnn1Pd7ku3XcJhzCQXnH9yFUCYaRSV
         jDhyNhm39CWDxuzulM1g8ZdegqsGIDr3eXXYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715269126; x=1715873926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rcGIIRAYs5g7y2tSFAfBRRtjyll1Cgq8Dp6vv6m/q4=;
        b=gO/shUc3XwmiTMdq0N7r8VnTHH6CYPPdxgCcnMFs7mnduoIW0NMexh8iUx4aBUol55
         LUnFMuygnvUFGKAEEutPG2MTikR9ZMlWv8ckmcMbPwBkvFcDXAkjulyV1g1o3fBR44Yt
         o5oH7z2LA6rI5gU70j6WuubvE6+r53EhSzGgs3JWOuvPgB6V/nlMyD/4/l7obVLLKlUB
         CCE+Mb/WPor4v+O/vJ1FQh5qLPSyPjGVtWBBQFK0c+k4C85bk+IJJ4IFEYC9sl+j/0uD
         VxKGygpc9lH+w0UdQbSDe0x1dCH/KC3A/8kPpbSCuQB9r14Qzy2A2c6t4I9jKle8AcLt
         C/LA==
X-Forwarded-Encrypted: i=1; AJvYcCWBP6IYLvcnyNOdKhBerdgRjPS1NPNhDINq75G7F74AAkXdPqafadn04fKMc/pNguj/Xf8ZvXMdjdlXn95ecDAU88tV7A==
X-Gm-Message-State: AOJu0YxUTLOiLN9xUygnEhmjew8EpS5fXNYtZejDhVn3QmxcSxxEeU19
	3xVHmCjsD6UI6tFMPihlr/qzAotDXeLCTIkWZpi8UwP/9ookndOYP336gcur8ZP4XSgMFsdBMB5
	u6cmZvg==
X-Google-Smtp-Source: AGHT+IFuVqHHn8jz54pPT9uGdu0VUYNtoUmTN1sHl3fNUVMYVv01TTuJ0loP/Vl4++BwGMRGj8MA5A==
X-Received: by 2002:a50:cd42:0:b0:570:5b71:4859 with SMTP id 4fb4d7f45d1cf-5734d704dc8mr27535a12.41.1715269125729;
        Thu, 09 May 2024 08:38:45 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733bea65d7sm810645a12.16.2024.05.09.08.38.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 08:38:45 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a599eedc8eeso274365366b.1
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 08:38:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5Cdp5HuTq+798xFonok0ZxNneGBijua9RWADNWSw7l0IEPhinSrdKpdBjYyHAxNoiMhuwSahWnnK1Ms6AByiNsUl9DQ==
X-Received: by 2002:a17:906:35c8:b0:a5a:1562:5187 with SMTP id
 a640c23a62f3a-a5a156255e3mr176942266b.55.1715269124579; Thu, 09 May 2024
 08:38:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404291502.612E0A10@keescook> <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
 <202405081144.D5FCC44A@keescook> <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
 <202405081354.B0A8194B3C@keescook> <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
 <202405081949.0565810E46@keescook> <20240509140854.GF3620298@mit.edu>
In-Reply-To: <20240509140854.GF3620298@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 May 2024 08:38:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgKyP2ffZPa6aKYtytzzFibiNVN5MS=D2cn7_UGCECKdw@mail.gmail.com>
Message-ID: <CAHk-=wgKyP2ffZPa6aKYtytzzFibiNVN5MS=D2cn7_UGCECKdw@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 May 2024 at 07:09, Theodore Ts'o <tytso@mit.edu> wrote:
>
> struct ext2_super {
>        ...
>        __u32    time_lo;
>        __u32    time_high;
>        ...
> }
>
>         time_t  now;
>
>         sb->time_low = now;
>         sb->time_high = now >> 32;
>
> This is obviously (to a human) correct,

Actually, it's not correct at all.

If time_t is 32-bit, that "now >> 32" is broken due to how C shifts
are defined. For a 32-bit type, only shifts of 0-31 bits are
well-defined (due to hardware differences).

> but because of stupid compiler
> tricks, in order to silence compiler-level and ubsan complaints, this
> got turned into:
>
>         sb->time_low = now & 0xffffffff;
> #if (SIZEOF_TIME_T > 4)
>         sb->time_high = (now >> 32) & EXT4_EPOCH_MASK;
> #else
>         sb->time_high = 0;
> #endi

This is the wrong solution.

But the solution to the undefined shift isn't some #ifdef.

The idiomatic C solution is to do

        high_bits = (all_bits >> 16) >> 16;

which works even if 'all_bits' is 32 bit, and the compiler will know
this idiom, and turn it into just 0.

Going the other way is similar:

        all_bits = low_bits + ((u64) high_bits << 16) << 16);

and again, the compiler will recognize this idiom and do the right
thing (and if 'all_bits' is only 32-bit, the compiler will optimize
the high bit noise away).

And yes, this is not great, but there you have it: C was designed to
be a high-level assembler, and you see the effects of "this is how
many hardware shifters work". The shift instructions on many (most?)
architectures end up being limited to the word width.

We actually have some helpers for this in <linux/wordpart.h>:

  #define upper_32_bits(n) ((u32)(((n) >> 16) >> 16))
  #define lower_32_bits(n) ((u32)((n) & 0xffffffff))

but we don't have that "combine 32 bits into 64 bits" helper. Maybe
worth adding.

                Linus
