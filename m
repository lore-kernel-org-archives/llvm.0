Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0651EE014
	for <llvm@lists.linux.dev>; Wed, 12 Mar 2025 21:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741813484; cv=none; b=GkS8g+j0yMddBUwllXpOfSRYy7gOV0jZ3jaYbwavpu1reMleGxulb9zQlNIti+zk/0FiusERESBeCjxX91hpGTJ4OFpBkWhPGWvsADYpl5IxczcUESmFmo/4qO4eDv98NNHq5f1htGNm+C2kOR8zl6qlKZHsrxnbhdN2XmSpKGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741813484; c=relaxed/simple;
	bh=Ot0S7PtwawZf3AV7XLRs4qgCTdhjXmhj0iYA5pT0WQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6juD1yMyraEvvere4h1wEiYJkmv4WA9NdyzUasMy2v11QbQC6Zh7BV+1kCpmICYGmcq1U2qDnXe8Vt5I47kLQduUKaZV3HkQe350fz9aHpndw6etwB5prC3JRaS5O9Z5DOv9J2nKQula2GQP2ci6sMq2iG4IMC+mMzkF9or2fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xbEew9EW; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xbEew9EW"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2242ac37caeso11725ad.1
        for <llvm@lists.linux.dev>; Wed, 12 Mar 2025 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741813482; x=1742418282; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/NYFOGJx3+utedM/+JCynhnYYN1+cS/l3CV1O7uUWI=;
        b=xbEew9EWk13Rh7YrmHVWbHzq48GEzGlc8JyjqfdK2b0fheccC0BlRi0UhLPre/6tPp
         umYvG60T382NTwTN0ff83Tmn4J2BJxumvO+lv2k03z+YOAJucWtG7xvjL9ZKLMBbQ/15
         g4bhkUpmyd3mgAejyng4w2ODpzOdg2eaBEHF5ZBB5Ws2zyFt2VqxhBFf2WIm4FlfsCkW
         dkv3HKWixGFbZzraU3yM68Rb2GN5mZUpAKIUiN7u627b/FaL4DjuZc848cqEsrCuSrRR
         7zMpjm1AxkNdM+lwlsih+XaQ0IlDWMP+kiaTPUjqOhCdEUiytcRPQhgdnUvrBO8tlv6w
         sQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741813482; x=1742418282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/NYFOGJx3+utedM/+JCynhnYYN1+cS/l3CV1O7uUWI=;
        b=T1vHIt8s1IT2QKOfL21Nsr2w4oF1tz793mRuAOfbk5h8Ex9seYxrM/KVpVf20zkCCC
         1jsb68MseYdIn4bTAhARxZ8QTJVZ//D3xsHJ8E3DPgdVDPDepbQ4ELecJH9gAi4Qj/rc
         vNX04hncvsqkYpSm7O2F0eKKeI8Jxp+IhJ7vmDcOgPjr0C8d4zvBcaj8dfS3mfMXxhLO
         XVraBpon2wkxXBHWY4IaYFhTwZcsxL9u7X/z9KPJXUmL2GNtDkenX9XRi1UJw7nRG73B
         QZeLiSB1djK+aDphisicVN0I25wMlegpeUH06M12Cojn9llQPwz4fGdpvbRGLwU+zTNN
         MkIw==
X-Forwarded-Encrypted: i=1; AJvYcCXe1GOjTrWBmExYKODeqZ0Igts5qGUyPN5R1IE54RvoLSaafJndXlpA71QdtHFyWc5JyEUo@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1DKagwhfQoVgceXMP76alW6Lpzuueb91bzpvCj0Td4rKN9VDN
	j8SUdD4FKEEGTtp0hcZdi4MA1IT6gpIncQ1f1sQay52I58YofMDusyHfrypLIieSIfF1gJRmLEK
	Q2pAyMMKiqe1X2fLY2W3WNr7V0Ua77W0ZHEIp
X-Gm-Gg: ASbGncuCW4bIqUwAIddLne/Q9/Li0zSwuZZpcKiDILfKCMkXziM++/T0VaIyVzLP7Pq
	yv++hfnWo8P0dR3Me2Kxc36zFZeSdAZ695Kao6PPfUNpNBW6Sh/9FTSb3NAcByL5zxwCe3RsFlt
	rMpetmJu0o1yNc7Nx4A6mbTUMQWGVbX2E9B32ULzbnwCXTdLBefxYMX9c=
X-Google-Smtp-Source: AGHT+IG2QAgZZb2P1DnYtlbmBhHsH8IbYPaNLVy98uYUpBgu/L7LIECGJjf1D4pL5sBwMndKUFhgflstMybnPkqFZnA=
X-Received: by 2002:a17:903:2311:b0:216:21cb:2e14 with SMTP id
 d9443c01a7336-225c5b9ad33mr436225ad.21.1741813481661; Wed, 12 Mar 2025
 14:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250122062332.577009-1-irogers@google.com> <Z5K712McgLXkN6aR@google.com>
 <CAP-5=fX2n4nCTcSXY9+jU--X010hS9Q-chBWcwEyDzEV05D=FQ@mail.gmail.com> <CAP-5=fUHLP-vtktodVuvMEbOd+TfQPPndkajT=WNf3Mc4VEZaA@mail.gmail.com>
In-Reply-To: <CAP-5=fUHLP-vtktodVuvMEbOd+TfQPPndkajT=WNf3Mc4VEZaA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 12 Mar 2025 14:04:30 -0700
X-Gm-Features: AQ5f1Jrj8FttoWaX-jdga6H02EOp221HMf8mceTcXqVwlpfEOeFP0rT3a1IwFQk
Message-ID: <CAP-5=fV_z+Ev=wDt+QDwx8GTNXNQH30H5KXzaUXQBOG1Mb8hJg@mail.gmail.com>
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

On Mon, Feb 10, 2025 at 10:06=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> On Thu, Jan 23, 2025 at 3:36=E2=80=AFPM Ian Rogers <irogers@google.com> w=
rote:
> > On Thu, Jan 23, 2025 at 1:59=E2=80=AFPM Namhyung Kim <namhyung@kernel.o=
rg> wrote:
> > > I like changes up to this in general.  Let me take a look at the
> > > patches.
>
> So it would be nice to make progress with this series given some level
> of happiness, I don't see any actions currently on the patch series as
> is. If I may be so bold as to recap the issues that have come up:
>
> 1) Andi Kleen mentions that dlopen is inferior to linking against
> libraries and those libraries aren't a memory overhead if unused.
>
> I agree but pointed-out the data center use case means that saving
> size on binaries can be important to some (me). We've also been trying
> to reduce perf's dependencies for distributions as perf dragging in
> say the whole of libLLVM can be annoying for making minimal
> distributions that contain perf. Perhaps somebody (Arnaldo?) more
> involved with distributions can confirm or deny the distribution
> problem, I'm hoping it is self-evident.
>
> 2) Namhyung Kim was uncomfortable with the code defining
> types/constants that were in header files as the two may drift over
> time
>
> I agree but in the same way as a function name is an ABI for dlysym,
> the types/constants are too. Yes a header file may change, but in
> doing so the ABI has changed and so it would be an incompatible change
> and everything would be broken. We'd need to fix the code for this,
> say as we did when libbpf moved to version 1.0, but using a header
> file would only weakly guard against this problem. The problem with
> including the header files is that then the build either breaks
> without the header or we need to support a no linking against a
> library and not using dlopen case. I suspect a lot of distributions
> wouldn't understand the build subtlety in this, the necessary build
> options and things installed, and we'd end up not using things like
> libLLVM even when it is known to be a large performance win. I also
> hope one day we can move from parsing text out of forked commands, as
> it is slower and more brittle, to just directly using libraries.
> Making dlopen the fallback (probably with a warning on failure) seems
> like the right direction for this except we won't get it if we need to
> drag in extra dependency header files for the build to succeed (well
> we could have a no library or dlopen option, but then we'd probably
> find distributions packaging this and things like perf annotate
> getting broken as they don't even know how to dlopen a library).
>
> 3) Namhyung Kim (and I) also raises that the libcapstone patch can be
> smaller by dropping the print_capstone_detail support on x86
>
> Note, given the similarity between capstone and libLLVM for
> disassembly, it is curious that only capstone gives the extra detail.
>
> I agree. Given the capstone disassembly output will be compromised we
> should warn for this, probably in Makefile.config to avoid running
> afoul of -Werror. It isn't clear that having a warning is a good move
> given the handful of structs needed to support print_capstone_detail.
> I'd prefer to keep the structs so that we haven't got a warning that
> looks like it needs cleaning up.
>
> 4) Namhyung Kim raised concerns over #if placement
>
> Namhyung raised that he'd prefer:
> ```
> #if HAVE_LIBCAPSTONE_SUPPORT
> // lots of code
> #else
> // lots of code
> #endif
> ```
> rather than the #ifs being inside or around individual functions. I
> raised that the large #ifs is a problem in the current code as you
> lose context when trying to understand a function. You may look at a
> function but not realize it isn't being used because of a #if 10s or
> 100s of lines above. Namhyung raised that the large #ifs is closer to
> kernel style, I disagreed as I think kernel style is only doing this
> when it stubs out a bunch of API functions, not when more context
> would be useful. Hopefully as the person writing the patches the style
> choice I've made can be respected.
>
> 5) Daniel Xu raised issues with the removal of libbfd for Rust
> support, as the code implies libbfd C++ demangling is a pre-requisite
> of legacy rust symbol demangling
>
> A separate patch was posted adding Rust v0 symbol demangling with no
> libbfd dependency:
> https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com/
> The legacy support should work with the non-libbfd demanglers as
> that's what we have today. We should really clean up Rust demangling
> and have tests. This is blocked on the Rust community responding to:
> https://github.com/rust-lang/rust/issues/60705

Ping.

Thanks,
Ian
