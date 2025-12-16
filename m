Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E511224166C
	for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 10:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880362; cv=none; b=A+yAldaybf5J57cknGmBaey11Mnx9+r4+GuDmaLcMfXK47KzXxVdZDM/ihDmm5YU2dQyNUe9chJyFf/rxZP7LoXx1JP7yehYf0aL5GEPPfdPlaAlw3CPp/2AqpGX29daS3ZrKhliP2tQ17cWhWZJBVOeuwleokdaZv2L8zCtA4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880362; c=relaxed/simple;
	bh=rqzltWnFrgLp84UVC2H4fc9hB2x2S7WGCDmakYkZEbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJI4OH+VApO3dj+/REDH0DzkyKQ/PTkkmye2aD8gs9W6FINZDEqHb+CC0PbWHhXNcg12cCdZPz1nKzs3rKm6OV5spfeAA6Xua/Mvc+bJ3cQfqcfQwkyR+zPeOCNc0xHWSDvS1g7GV7bnOJLumQQkfxWsC7irBvvnsz/xMyfuar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l5ZavQyY; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l5ZavQyY"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso3538405b3a.3
        for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 02:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765880360; x=1766485160; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OypqLsil5xBkKa5aVXNNZdJt/nIt7Du6XmfYVCVljvI=;
        b=l5ZavQyYeQdSrwOQhOjZ22wEvfhDR+PDGU22ZKBoEWlU/utGfYPbkRDvjlbHw/6xHx
         TPSGlrVOo0QykQQGvNi0SAfCwqRDI5zDWZcTRXbcMKyMXXGjEbWfhGIr00Qvx+OEQGYb
         UuhsYTp+wgPr2viTHpG4a9Tj9x4XrGR4bOHKiJWGRJ//0C1FtwgBQL4ZiIXS4lRavifI
         2WLYuuon4OMESBZ+8kET8OO+XXF1AROfYk5eSXkUwWAJrbzd9xLwYvf5NxBya3s20VHb
         zrpL2ynDQf3ivOgr4urP2XDG8nR4veStzT13A09lyrPqUtzo/JSplln2czs1ysFpc/sE
         luUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880360; x=1766485160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OypqLsil5xBkKa5aVXNNZdJt/nIt7Du6XmfYVCVljvI=;
        b=QutJERjaJwf/RCrJTeIX7yR8cFVhwqkw3fQhyoTePXqfzPwEhbuHRntjLs+NpoFBwF
         yUVSHaY7m3FmxnYECxD0PoX3vDmBg5Cz0qjV+hVu6r7ZySOTBS7iq57cDM9uxQPyJyol
         MrWD+gChfRyU6B6TpxB3sZiQRvTgHd9n1IyGVHDFDrZ//IolKwNtRkLE0UxBAsM3kJHy
         w1qKIRxTCKnS1BjAkGpIs7fiW2x/d/vfQAadAG3VJndmeXCNDWT97pIqrvSzN1WQ+rT4
         L7BIWQ7w9qdECVbYsQJOhShUo6UsgGlx8X4v9DPmLtUREp2oNFTKKMzAutd2pM+qvVZh
         omzg==
X-Forwarded-Encrypted: i=1; AJvYcCVzd1odOA6WlTLcbIFk3YDB14E7m6ehZeIK03rFg+8kZfOpYm5Yhg2iDGdTiwG9CXibQcT7@lists.linux.dev
X-Gm-Message-State: AOJu0YzC1pleXwHgIkjwcAyabzCWYtHX7uV+Bv10xBdYbukWV7o9l6e/
	fiVq8uwNgMo/MTgLaLQ8NnatQdZp0Ru0wd8IdcVccWqYl9QqLFUBHD36Wn9zjDjRCXlUyfvq+w+
	W1PGs0SIKBbClFBU5Jcmk0EAbqM6zgeqo/bIwLFnD
X-Gm-Gg: AY/fxX53inDahCdUoTJlnPkha4Oa1qkcOec4Wc4r8nHfBbH9Ui93c9hyXaq5sDyYaAR
	t8OH0i6I0dbOAnIwWuR/xL0fbmUIVPsI0uBV22DiBP35acKsCFDwEskKHeFvls/MSqVuk/K14My
	gpraHgsdoAU3QKNIVmb3nBgR19gd++pCWEqpuG9byfvMZNJpLZ2TOJaXwWPyRLNTT0TDRoJRnP7
	GTcxWNnhyXcaCNueLZinHXK1U9lQAajYlpRh3TgR/Olp2eDNmIcXn2k2tvvQ9okVBIATvFGvqso
	ItHU029LOPUN7jSZFHFEwVteaA==
X-Google-Smtp-Source: AGHT+IGrJAhLxOHth+LBtxpbfo1ppY/Umm9n5Zak3n253zmmSDe5bimWjONGvVy+0THeTV8Ii7Jy/yTHVWRCGWyKv1w=
X-Received: by 2002:a05:7022:61a5:b0:11b:9386:a389 with SMTP id
 a92af1059eb24-11f34c71006mr8757169c88.44.1765880359439; Tue, 16 Dec 2025
 02:19:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
In-Reply-To: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
From: Marco Elver <elver@google.com>
Date: Tue, 16 Dec 2025 11:18:43 +0100
X-Gm-Features: AQt7F2r-TNi3C2dkEfzWWdFLAvdsJ9j2DX6plsYqvw6Qsd-tzVkmo5-aWx03RSw
Message-ID: <CANpmjNPTdnReD1rmdyGPvpOqp0N6yc=XMfmdnNdgVrptGTTaVQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Noinstr fixes for K[CA]SAN with GCOV
To: Brendan Jackman <jackmanb@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Dec 2025 at 11:16, Brendan Jackman <jackmanb@google.com> wrote:
>
> As discussed in [2], the GCOV+*SAN issue is attacked from two angles:
> both adding __always_inline to the instrumentation helpers AND disabling
> GCOV for noinstr.c. Only one or the other of these things is needed to
> make the build error go away, but they both make sense in their own
> right and both may serve to prevent other similar errors from cropping
> up in future.
>
> Note I have not annotated !CONFIG_* stubs, only !__SANITIZE_*__ ones.
> That's because for global settings (i.e. kconfig) it remains a bug to
> call these stubs from the wrong context and we'd probably like to detect
> that bug even if it could be eliminated from the current build.
>
> Concretely, the above is talking about KMSAN, i.e. stuff like
> instrument_copy_from_user().
>
> Other than that, I think everything in include/linux/instrumented.h is
> covered now.
>
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
> Details:
>
>  - =E2=9D=AF=E2=9D=AF  clang --version
>    Debian clang version 19.1.7 (3+build5)
>    Target: x86_64-pc-linux-gnu
>    Thread model: posix
>    InstalledDir: /usr/lib/llvm-19/bin
>
>  - Kernel config:
>
>    https://gist.githubusercontent.com/bjackman/bbfdf4ec2e1dfd0e18657174f0=
537e2c/raw/a88dcc6567d14c69445e7928a7d5dfc23ca9f619/gistfile0.txt
>
> Note I also get this error:
>
> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3b: relocation to !ENDBR=
: machine_kexec_prepare+0x810
>
> That one's a total mystery to me. I guess it's better to "fix" the SEV
> one independently rather than waiting until I know how to fix them both.
>
> Note I also mentioned other similar errors in [0]. Those errors don't
> exist in Linus' master and I didn't note down where I saw them. Either
> they have since been fixed, or I observed them in Google's internal
> codebase where they were instroduced downstream.
>
> Changes in v3:
> - Also fix __kcsan_{dis,en}able_current()
> - Link to v2: https://lore.kernel.org/r/20251215-gcov-inline-noinstr-v2-0=
-6f100b94fa99@google.com

Acked-by: Marco Elver <elver@google.com>

Thanks!
