Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA974381AE6
	for <llvm@lists.linux.dev>; Fri, 15 May 2026 06:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827043; cv=pass; b=ie+NpuO8OjXIVU10L+VBTXIyHu9ZYMsW64yoTOnQ6FwBY9t9+aP31288jdIaRflwOlev7cqeXaD0eipFRvaTpYLhgjYlPFchk33eLzAh+/MN5XojRSwpwYz56M0tbJ0OLGSIYSu3R5OiffHJZu5WDKTzR+szpTtFopCJmoeT21o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827043; c=relaxed/simple;
	bh=/jqHs8uGFL/YrVYfbB2cdUqcQe4D+MVqyjDguazmLzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVBz5ePj5X2ig5b0TPJ81JB3ozlakAcsQpaUMlfIU9wEZ5Bs1MDk+rrlaVscOat4XDu7jxaX/Ai251+OvOxKbpf6UINWHcV4QMBV98S8UJraZcTfIUEDxn3bIOgNy5xKlBAGbVWJY3ZDKSa/fG/qu/IUjWdA36A6QlYc7ZpAKoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEsgjeqg; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEsgjeqg"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bcd3c190f71so868844966b.0
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 23:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778827040; cv=none;
        d=google.com; s=arc-20240605;
        b=QlgiJNWkpi00QWkZd6h63SAlN6PHlwfzchP+M2XiHhxLFtU9gsX8wjbYIQrIUhq4A9
         InngQloVQ1nIZZW5ybI4NIMeDYo9QrNkqUZWf3Y1mFStpHvnJ81Q1VedzxHnS9czSmpN
         G/l38dKtVd6CV2BD5IxW6gcSEtnq8UBFqJcuR0fzhDngnthEHpjBqVk5OKPljKYR/jrL
         ujtkzFFsrL4G4NCJHLQlcFz9TVTmE12tE4yo//DUzsSMjoqJwxQSZkNzBPPqPHbSm0Wu
         2mCGxw2ysFoNEG9jCq54xCO6ZKuzhtT0aAXl2e9EufQh78reKHxpqh4KHJRolERsQWr8
         p8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4LMCqVFSjOu6qSrwojx1FavaW0eHqSxzlXVygC4r2vs=;
        fh=Q6DECiS2nXDrMqX5y50ko9wPbFcovxDZ3UgWPqfGo7Q=;
        b=CV0m1wN9GI1QRJzkJv5FFOx2MmEzMUtMZG+mt44oZ7HVzZDvDFlkHacBqieG2ZIX5m
         WhX7YlhYOjwjmHwAiYY+uDruLt9wabFzFJg4kq0TeuiaibIxY36OgYHPQMuDrteWjLVl
         /WT9PtAan0q+VjU8CdyFxqFTR37B5P58mXVvSRuy0F2lGHTeSlAlgmSngr0dRzh+WUHA
         udq6jNDRW0BNhSXZtqCwyt1bnGcGwVgI3GrNrt3tOTGQCJ5ONqzozKA8ShXl3LDBsPy9
         LrFIRcRMboMOy+5mTLAOmCTG8Oe5fO2MYgSQJ0L4VdsmsOMrad4Tu/NM9d4F+pUe0zen
         ERCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778827040; x=1779431840; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LMCqVFSjOu6qSrwojx1FavaW0eHqSxzlXVygC4r2vs=;
        b=BEsgjeqgG2/P5pAG+4KJHLpXiTgKyZQCiEHmqsgimve0fd528xmsG7UkvouBesyi2z
         NSxUHVTZcCgNxdH8nvQvad7hrNRT+LKVBRumAGBiHPKQbosA8+i22fCBGwDX+wEdytva
         y+qweZpGRCYhGZbEMEpiwEaTNT/XXINo4AUsWw+rCqhMZJtC0kADVxWddHhp08g0LvC8
         F0aCiwWn+bpgNXwG2SVBTHcVgh+unfWJcGmr/R1UGKRkAHd9eTCuNnBWdJB6CyY4xZDK
         vaV5m7RQcLFzMLQmblkjxreQEz1/4/2/R6EMunXEGohPs0Mq/EZsMxcT1ikRC2nuknC0
         hMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827040; x=1779431840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4LMCqVFSjOu6qSrwojx1FavaW0eHqSxzlXVygC4r2vs=;
        b=KM4NqSgTTLdkvx32feqP1H3zwEU2PZY/2YCOX1raLjaz7SUu9iKeqcr6T32Nu8S266
         GRlXl1CrcWRcN7nHZSRJyo4WpmBRS36zr8TeazlIlGIBYRfeZEXB9ZysFMWJ3658wSyl
         k/9hZxO1hTpfqw3b2PWi4/fL8FRhkZXLveJff1cEhnrtwyZ1xQ12pESh65XEEpwu82V9
         0zMOdyxCSzXeepndY7xHkgWDEykVgCT3AcR3cP1CsyhwAW64Rd7yo6Jnk2IPoPbWYErq
         FLEZ+2yjESH3ThbWIEWRf5H6G+BstMNLEiELLsRwJ55uTogJUMrPhFitUIdjq4g4etyG
         vMdg==
X-Forwarded-Encrypted: i=1; AFNElJ8MklC1Vm4PvKnC3ovuHnVOF5zSAwoaM54UfO40hRAKuioG9jGx0C8MszJCsD3rV5E56PUv@lists.linux.dev
X-Gm-Message-State: AOJu0YwpC1tYm0ny8IiIsENLAB9dT5+pdo89J/UZijNGazRPKLzVlKwl
	3gKJfKY7djNI6utNklOtL65JGYddSTjC8nK+6s0w5KNua2fmhzSYIeizgHFj+wgWxbudVagi7X1
	QIpbDYUKdOOi84FSdhc3yue84+mhL0gI=
X-Gm-Gg: Acq92OEU8m+mJs3EBqEc6mclNopDIupcCetp1QYQ9Zc5DsBuWUZcpwh1LVvXCbYWzYs
	KQsV2J2hESY6/9QUK2htqv/cSyRmhjz0+Kf2ozmUUlhSFPvgkAuuLXFQkjpgo09J8IIZXmyUIzW
	Tdf3wWzuMYhvdCpNJpBQsBkHF0ScWMPAr0yz5Uq3g4fX+KM0wBjkZ+8OLl48SBO+aK9FRIks/yl
	rxIcWXcvTZBDczVNLDIK7peHyKoE64MwtHz9gxvvCkP+WF/RfiSwNLNkIUSWmV6N4iJD8tWJ1BY
	PPEik6d0sUIR0C/2gSWCLfRt2g4h842p+pQIeQbUhEexS4CTS6uZewtd8jVVXHrHoyCQhCEIlVJ
	l9etFOwM=
X-Received: by 2002:a17:907:c247:b0:bcd:c899:904e with SMTP id
 a640c23a62f3a-bd5177d9a69mr147258366b.7.1778827039790; Thu, 14 May 2026
 23:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514121359.931999-1-milant2002@gmail.com> <20260514121359.931999-3-milant2002@gmail.com>
 <202605140916.09FBB1A4@keescook>
In-Reply-To: <202605140916.09FBB1A4@keescook>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 May 2026 09:36:43 +0300
X-Gm-Features: AVHnY4LTtUgH9l_UEKEjClBIDSN7f6fhD3s_31tgGoM3D-Skkze3R3ylHD52Z_s
Message-ID: <CAHp75Vfb=J6gQ=YbpA8OxTpti-n2CaAGh+Ro1iZJWRxwbGd8eA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] lib/string_kunit: extend benchmarks and unit test
 to memcmp()
To: Kees Cook <kees@kernel.org>
Cc: Milan Tripkovic <milant2002@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andy Shevchenko <andy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>, 
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 7:19=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Thu, May 14, 2026 at 02:13:58PM +0200, Milan Tripkovic wrote:
> > From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
> >
> > Extend the string benchmarking suite to include memcmp().
> > Extend the string unit test to include memcmp().

> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202605140827.Qg1DZpcB-lkp=
@intel.com/

What does this mean? The absence of the test cases won't ever be
reported by LKP.

...

> > +#if IS_ENABLED(CONFIG_STRING_KUNIT_BENCH)
> > +static void string_bench_memcmp(struct kunit *test)

> I think I'd prefer, instead of a ifdef stub, to do:
>
>         if (!IS_ENABLED(CONFIG_STRING_KUNIT_BENCH))
>                 kunit_skip(test, "CONFIG_STRING_KUNIT_BENCH not enabled")
>
> here.

What about having two functions?

static void do_test_string_bench_memcmp() // choose better name
{
  ...
}

static void string_bench_memcmp(struct kunit *test)
{
        if (IS_ENABLED(CONFIG_STRING_KUNIT_BENCH))
                do_test_string_bench_memcmp(...);
        else
                kunit_skip(test, "CONFIG_STRING_KUNIT_BENCH not enabled");
}

...

> > +     for (int o =3D 0; o < ARRAY_SIZE(offsets); o++) {
> > +             int off =3D offsets[o];
> > +
> > +             for (int i =3D 0; i < ARRAY_SIZE(lengths); i++) {

unsigned int i

> > +                     size_t len =3D lengths[i];
> > +                     char *p1 =3D buf1;
> > +                     char *p2 =3D buf2 + off;

> > +

Redundant blank line

> > +                     u32 iterations =3D (len < 512) ? 100000 : 10000;
> > +
> > +                     for (u32 j =3D 0; j < iterations; j++) {
> > +                             (void)memcmp(p1, p2, len);
> > +                             barrier();
> > +                     }

> > +                     u64 elapsed =3D STRING_BENCH(iterations, memcmp, =
p1, p2, len);
> > +                     u64 ns_per_call =3D div_u64(elapsed, iterations);
> > +                     u64 mbps =3D len ? div_u64((u64)len * iterations =
* 1000,

Instead of casting just make iterations to be u64.

                     mbps =3D len ? div_u64(iterations * 1000 * len,

> > +                                                                      =
elapsed) : 0;

We don't usually allow the C99 definition initialisers inside the
code, even for tests.

(With that the last will be a single line.)

> > +                     if (off =3D=3D 0) {
> > +                             kunit_info(test, "bench_memcmp_aligned: l=
en=3D%-4zu: %llu MB/s (%llu ns/call)\n",
> > +                                        len, mbps, ns_per_call);
> > +                     } else {
> > +                             kunit_info(test, "bench_memcmp_unaligned(=
off=3D%d): len=3D%-4zu: %llu MB/s (%llu ns/call)\n",
> > +                                        off, len, mbps, ns_per_call);
> > +                     }
> > +             }
> > +     }

--=20
With Best Regards,
Andy Shevchenko
