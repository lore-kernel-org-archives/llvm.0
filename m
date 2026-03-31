Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D85F3BED6F
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 20:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774987779; cv=none; b=kn5Qs7xPUF13OM1+7p0zZTGOzb26Lei7KecCMjWbjU82PBxCSvDEUYV22S5byuYmzr0Z9koyC2yrfK/g5RSJKoFtQ56YwULHNm6ZQLnAS1DCWzbbTxhAFEEiqg7mKlHw63HGESl6z4cxqtQKGOBw4DO3psEYbPvuINHMUeS/5Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774987779; c=relaxed/simple;
	bh=d6r1zB/UdxoLPJPFYvR0HJRmpyXXRkjD3BCCWDdorSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0Xd65RvrQiWwYwnJSsPjCu5RxIccyIB6WGDVjad0dpL6J+hh4l/6as5dhOvVyMDwhHxnIIBjbzHpFiKbtPtY90M8OOC2XhZQqI3yRxvBr6umUCDcHvdTC3yn3qYXTug542qxiGfy9XYmHTroCkeibn6IxkoqJNR9MuJ8fvbjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Pb8rtoY8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Pb8rtoY8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b941ebe79so5375839a12.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774987777; x=1775592577; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv2mdBoBk4QdkqU81qWETh/yEJGWnlakuOpSzMhOmBw=;
        b=Pb8rtoY8E/ReHqLAhGpxaslp+Tsr+/avI+YIqf5fVkOT/49w5+u0j7K/w8lIc8NmK6
         BAjUoiQGNOerv4ObactN5Cs6MmlL96E7EHnJJbzwZ5JWgqTifm0W9mtSzTJu4fDHI7ZB
         TUnoTiQ89SIoAabJ8CuHKtvzZSPrSbW+coky0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774987777; x=1775592577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv2mdBoBk4QdkqU81qWETh/yEJGWnlakuOpSzMhOmBw=;
        b=QBW6Y9pyZ1pTfb20L0l+ZSbsqKlptQVcA4dERv1TTWEF3Vraugi6d8uNaC7RGOMJFP
         5dVGJOpAs/C3AjJxdZhNWPxH9HiO9npc5FWayHZ/Sa5peakioiibDkR0RvDYeiJxbGmb
         PTFtje7AG+PgK/PdtaSUAkbSw9+YSWAU7alfqiS0SwutLahtt5B65eb0LWI2tTWzZmvn
         ZRtYyW3Vkfs3/rPzkVK+aTBiWpB+rubkEoroelr0O5OOT0hH8bS96EsU0RIzSQPOWUoF
         4XZiPl31Su6YUIon/jzz8nlQpcjPM5L7HcXisloKZo/A7VeHZO6rgRbw/DZwKNTmIcdF
         Y4ew==
X-Forwarded-Encrypted: i=1; AJvYcCXWxa439KjA51xMcF5VUpdtfykF36mAKlhCSLOcnbwsOwMwlDrHes3/9XwY4Plo9hMB3czb@lists.linux.dev
X-Gm-Message-State: AOJu0YxsIs/6FVZWNmGlFjqA+iVcLdHbUGv+UcIVCaioSrrTiA0BPxNd
	pBymvLEtgmXjvLFy3EP647hnxRBYd+TZWwekhkZHO76w0XY+TDZQDuWmKUk+Qz8CSzhxwXMTD/W
	KtZqaeOTOWw==
X-Gm-Gg: ATEYQzwdtGD7fYOa/5uepIxX+Amdo87GufItWiGRRm/66SlF7Uahuq1oIEk6/hEqjCC
	fNnrNaeczkM16d0Js+KvGV0/FwM4qIAIlb4wnv+5gfVyYQrfJU7sDbStJVCP1suX2+QwBjVcEdn
	o1WEe4+PEIVimZKMytYM2z9K5gC0BNYE7JTEK18fqAvysa4fOtsA2WP6/m1UGqslprhTq92AVw2
	QwLkOAvgj1jo0mf5PqF3OYiMVVgh9Obg+hJo061KRY4Y0M5HuqI67buOsjkqwknss1evsAnHcyT
	er6MoysEm/nUG5HuBipTBdj0Rgc1q9Uvc84ku1/dh+XGoBXJtRlXM9yEwicKsbm0XU3n94y0DSs
	+pKPmuIUD/9WBV3XIhvMqF7eaT4yYUKDsU9dXAGWpL1LAoFI9aScj0rP6aS2zfwM1ZDwDjEtzG+
	Ra/htihDC0gNv/a/eDlW2cs0AWaZRBwc2/zFIhwCGA/72z17lX1w5zjDPvfIRzg57l6zswmOxG
X-Received: by 2002:a17:907:6ea8:b0:b98:2845:4740 with SMTP id a640c23a62f3a-b9c13cd5d42mr70114566b.40.1774987776551;
        Tue, 31 Mar 2026 13:09:36 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66beb2d044esm2631997a12.26.2026.03.31.13.09.36
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:09:36 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66dd059785cso126070a12.2
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 13:09:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKvo36Ykgch/bwE7Vlbm2qNST9yerBuUCIerfpWn67wwn4y2F2nPcoxcRUkX/iWtaenNSA@lists.linux.dev
X-Received: by 2002:a05:6402:540d:b0:663:9739:6265 with SMTP id
 4fb4d7f45d1cf-66db02afce5mr564572a12.9.1774987334624; Tue, 31 Mar 2026
 13:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
 <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com>
 <CAHk-=wgKB5f3MM40FGGUWUm_9eyESe2PAqCa6uZ=YTi0CdPwDg@mail.gmail.com> <202603311155.503B3DA5B@keescook>
In-Reply-To: <202603311155.503B3DA5B@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:01:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh6YWV3hHs8i0P=2A2CVjCY=SOaYeayEodXYa+CMqNO4g@mail.gmail.com>
X-Gm-Features: AQROBzDJ5SIQIXss3ygEg5-CA2RDbG130aEFCjGxmwQlRnW2FPPkeTaugvbjtMA
Message-ID: <CAHk-=wh6YWV3hHs8i0P=2A2CVjCY=SOaYeayEodXYa+CMqNO4g@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 11:59, Kees Cook <kees@kernel.org> wrote:
>
> The syntax problem (as made clear by many other people, and even you
> here in the first half of this email) is that no one will use function
> based math primitives.

I don't think that's true.

It's just that they have to be made simple enough to use, and have a
good *reason* to use them without the end result becoming horrendous.

Ok, so I just spent fifteen minutes trying it out, trying to aim for a
really simple syntax.

Look at this contrieved example where there are two different overflow
things with two different exception handlers. I decided to add a
"default" label that is just called "overflow", so you can write code
like this:

        static int testme(int a, int b, int c, int d)
        {
                return addo(addmulo(a,b,c,addmul_overflow),d);
        overflow:
                return -1;
        addmul_overflow:
                return -2;
        }

which obviously isn't pretty, but it's still at least somewhat
readable. It does a "addmul" and an "add", both with overflow
handling, and returns the end result.

If the final add overflows (which doesn't have an explicit overflow
label name), it goes to the default "overflow:" label.

And if the addmul overflows, it goes to addmul_overflow. It's all kind
of obvous, and not syntactically all that onerous.

And it does work:

        #define TEST(x) printf(#x "=%d\n", x)

        #define MAX_INT 2147483647

        int main(int argc, char **argv)
        {
                TEST(testme(1,2,3,4));
                TEST(testme(MAX_INT,2,3,4));
                TEST(testme(1,2,3,MAX_INT));
                return 0;
        }

results in:

        $ gcc -O2 ov.c && ./a.out
        testme(1,2,3,4)=11
        testme(MAX_INT,2,3,4)=-2
        testme(1,2,3,MAX_INT)=-1

and in this case gcc actually did everything at compile-time, so code
generation is actually good too: the compiler will optimize this to
hell and back.

But even *without* constant arguments, the compiler can actually
generate good code too:

                .globl  testme
                .type   testme, @function
        testme:
        .LFB11:
                .cfi_startproc
                imull   %edx, %esi
                jo      .L6
                addl    %edi, %esi
                jo      .L6
                addl    %ecx, %esi
                jo      .L15
                movl    %esi, %eax
                ret
        .L6:
                movl    $-2, %eax
                ret
        .L15:
                movl    $-1, %eax
                ret

that really isn't bad.

So the code is legible, the code generation is fine, and it's pretty
flexible. And are the macros complicated? No. This is literally the
code that did all this:

        #define __default_exception(a,b,...) b
        #define default_exception(...)
__default_exception(,##__VA_ARGS__,overflow)
        #define overflow_op(op,a,b,c) __builtin_##op##_overflow(a,b,c)

        #define __overflow(op,a,b,...) ({                       \
                __typeof__(a) __res;                            \
                if (overflow_op(op,a,b,&__res))                 \
                        goto default_exception(__VA_ARGS__);    \
                __res; })

        #define addo(a,b,...) __overflow(add,a,b,##__VA_ARGS__)
        #define mulo(a,b,...) __overflow(mul,a,b,##__VA_ARGS__)
        #define addmulo(a,b,c,...) addo(a,mulo(b,c,##__VA_ARGS__),##__VA_ARGS__)

Now will people ENJOY using "addo()" and things like that? No. Clearly
it's still *easier* and even clearer to just write

        return a + b*c + d;

and yes, that is more legible.

But no, I really *really* don't want people to be able to just
randomly say "I'm just going to kill the kernel if this overflows".

                 Linus
