Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF325B672
	for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 18:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210810; cv=none; b=kUQGWfyjRFp3ae/ivaXLDPTJPIX/qNQzVME6AMWVredrbP+D1MN7t9QMdABgmLN8K0KaDcMuCN+UjrifSZD1T4qN7iGC0/DSqFawWf7nIQPNfjDU/lB6EZzbISPn2ptUGaJeAs23KUAZqqippvcr81oAjqa8G3j1v13PdcIDVQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210810; c=relaxed/simple;
	bh=zWHQ/xQzS0SVky8j3UXIWdJ6YcNh5e0HYTnqYtA1fh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkVFcYTpVN3ll2qpeEer5jag0iGfIqEWD8poZCk0JzYoZe9fr9DWFq30dOU2yMsBai1nlgeE4BLPex9Q0Wio27WDpWFEoQQ1wgh4vlW410Yu8zuNa6KxBt0x2X5gyPjrM/M4jQRNg6Hx+ukfdQaxE7aRwIPu/KmijQpuK1xwYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UpdNTFMM; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UpdNTFMM"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d146357fb2so1445ab.1
        for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 10:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739210806; x=1739815606; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLOx8uZKOqbSMHNZbZfwBaDXMWD7wne+WuTTmhB+k4g=;
        b=UpdNTFMM16AxdIN2R6M74PMPNOjOR2MphQ41PNvusmON+FeXCB5WTL/dmv+YBZymA/
         TLjTYNKa0VHE1Cg3TBPDsmkaWhUTKg6DJew5dHb2/zdldBJS6YS4Rj7VsxTfGBUW+dYc
         iEjnrlsIZdl+jxKQkdvUBWcI8D8rj+CjtoJL4/+MPpZvS/S0duKDTTm3pbP3Kj/X0MbA
         50mSs/6FYQoPv10V7lHxXmdhmZwst8ILQvNpsxk4ovofM+Bzv8hJ2AOp999+oPkxbUop
         1flizRZdxlRHLZQfX8yk/69QJC/l/ix3PDeqGg73viFZwsFPXai0t1tAw9ANb9VvUcne
         48NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210806; x=1739815606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLOx8uZKOqbSMHNZbZfwBaDXMWD7wne+WuTTmhB+k4g=;
        b=RBDrPVzt4s8AMEZLvBxD689e9bcY2lDooK/BOwj1BdIjc4DwyzaiZ1SRWsiLPuh3Yr
         SX9GTzSwAZIqG8Ooi2StAVzbO1STjLbTZUjJeTHIx7OiLY5LZo8zD+K0Q62aJTTwHddq
         XcrB1wfa3DwZdwjwUxX5MFhWe2dWzbhQYw0WjVJPdJq1IMZ1VTSzk82aJICVE9XwBenR
         14ezECnMqqmWaVJk2Tdr9gD6eCSGNcjBgkvo3lpGJdzczR3N+oh8Q5qBAq0q99FcdCbQ
         EuU3ww+pYNq892rTupQyAciOKwFNCmS3Cp8GOUuRhu4dvnQ3iGiDqjXIxPP1xBbYqIVz
         ViAg==
X-Forwarded-Encrypted: i=1; AJvYcCXZXBFRIsFDCHJjKgY3kGfICjJovtN/avjmzxch7Zk3BvbRlKpsxcvD7WkntS3C3OlNqjlm@lists.linux.dev
X-Gm-Message-State: AOJu0YwpA0ldO4iZx7FgVys8rK7Fq3EVoZ+Qy2jG+mgkcxqz9ZNdp5AL
	aHXNFAd/Ex7aj/Qtv/rNPKoD/okZynbn5GJGCny0x+0jbRIJcOY4NsfxI3iQtBwjj3yXPxG0gWT
	UgcJIUMPv6T1Ag93LaJ3lz+rca5VT75dH2OZY
X-Gm-Gg: ASbGnctCZ1zYhZuXev5Y9E2dwgKCA46uJEXdu/vItZQbkfdSPXx/CBxMm/xcQyhP7so
	/YEMnFPLexyljNlWfHcpkBt6sUgsWDln8QJrItICUzP+Kyb6m//kFjpPZims4H5Mg0AHz+Xe/9c
	g6Q5C8pVg2B2JSPil7zfxA+wau
X-Google-Smtp-Source: AGHT+IFQyFzL4toKjST54JeKC5iEPw/FRNhzC05ypK58dUkv8jG9yKJ7k/Rc5cXiBrhxLzre2Y5FkHw43ZhurdlnnSM=
X-Received: by 2002:a05:6e02:2198:b0:3cf:fbc9:5c10 with SMTP id
 e9e14a558f8ab-3d14cde2865mr7402415ab.26.1739210806086; Mon, 10 Feb 2025
 10:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250122062332.577009-1-irogers@google.com> <Z5K712McgLXkN6aR@google.com>
 <CAP-5=fX2n4nCTcSXY9+jU--X010hS9Q-chBWcwEyDzEV05D=FQ@mail.gmail.com>
In-Reply-To: <CAP-5=fX2n4nCTcSXY9+jU--X010hS9Q-chBWcwEyDzEV05D=FQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 10 Feb 2025 10:06:34 -0800
X-Gm-Features: AWEUYZmqaHEjcEf5hPT16AA9v5ALYmeBI5HqSnlIc7uBGpS_AVyNMa9dTNcQdl0
Message-ID: <CAP-5=fUHLP-vtktodVuvMEbOd+TfQPPndkajT=WNf3Mc4VEZaA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Support dynamic opening of capstone/llvm remove BUILD_NONDISTRO
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Changbin Du <changbin.du@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Kajol Jain <kjain@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Li Huafei <lihuafei1@huawei.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Chaitanya S Prakash <chaitanyas.prakash@arm.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, Song Liu <song@kernel.org>, bpf@vger.kernel.org, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 3:36=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
> On Thu, Jan 23, 2025 at 1:59=E2=80=AFPM Namhyung Kim <namhyung@kernel.org=
> wrote:
> > I like changes up to this in general.  Let me take a look at the
> > patches.

So it would be nice to make progress with this series given some level
of happiness, I don't see any actions currently on the patch series as
is. If I may be so bold as to recap the issues that have come up:

1) Andi Kleen mentions that dlopen is inferior to linking against
libraries and those libraries aren't a memory overhead if unused.

I agree but pointed-out the data center use case means that saving
size on binaries can be important to some (me). We've also been trying
to reduce perf's dependencies for distributions as perf dragging in
say the whole of libLLVM can be annoying for making minimal
distributions that contain perf. Perhaps somebody (Arnaldo?) more
involved with distributions can confirm or deny the distribution
problem, I'm hoping it is self-evident.

2) Namhyung Kim was uncomfortable with the code defining
types/constants that were in header files as the two may drift over
time

I agree but in the same way as a function name is an ABI for dlysym,
the types/constants are too. Yes a header file may change, but in
doing so the ABI has changed and so it would be an incompatible change
and everything would be broken. We'd need to fix the code for this,
say as we did when libbpf moved to version 1.0, but using a header
file would only weakly guard against this problem. The problem with
including the header files is that then the build either breaks
without the header or we need to support a no linking against a
library and not using dlopen case. I suspect a lot of distributions
wouldn't understand the build subtlety in this, the necessary build
options and things installed, and we'd end up not using things like
libLLVM even when it is known to be a large performance win. I also
hope one day we can move from parsing text out of forked commands, as
it is slower and more brittle, to just directly using libraries.
Making dlopen the fallback (probably with a warning on failure) seems
like the right direction for this except we won't get it if we need to
drag in extra dependency header files for the build to succeed (well
we could have a no library or dlopen option, but then we'd probably
find distributions packaging this and things like perf annotate
getting broken as they don't even know how to dlopen a library).

3) Namhyung Kim (and I) also raises that the libcapstone patch can be
smaller by dropping the print_capstone_detail support on x86

Note, given the similarity between capstone and libLLVM for
disassembly, it is curious that only capstone gives the extra detail.

I agree. Given the capstone disassembly output will be compromised we
should warn for this, probably in Makefile.config to avoid running
afoul of -Werror. It isn't clear that having a warning is a good move
given the handful of structs needed to support print_capstone_detail.
I'd prefer to keep the structs so that we haven't got a warning that
looks like it needs cleaning up.

4) Namhyung Kim raised concerns over #if placement

Namhyung raised that he'd prefer:
```
#if HAVE_LIBCAPSTONE_SUPPORT
// lots of code
#else
// lots of code
#endif
```
rather than the #ifs being inside or around individual functions. I
raised that the large #ifs is a problem in the current code as you
lose context when trying to understand a function. You may look at a
function but not realize it isn't being used because of a #if 10s or
100s of lines above. Namhyung raised that the large #ifs is closer to
kernel style, I disagreed as I think kernel style is only doing this
when it stubs out a bunch of API functions, not when more context
would be useful. Hopefully as the person writing the patches the style
choice I've made can be respected.

5) Daniel Xu raised issues with the removal of libbfd for Rust
support, as the code implies libbfd C++ demangling is a pre-requisite
of legacy rust symbol demangling

A separate patch was posted adding Rust v0 symbol demangling with no
libbfd dependency:
https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com/
The legacy support should work with the non-libbfd demanglers as
that's what we have today. We should really clean up Rust demangling
and have tests. This is blocked on the Rust community responding to:
https://github.com/rust-lang/rust/issues/60705

Thanks,
Ian
