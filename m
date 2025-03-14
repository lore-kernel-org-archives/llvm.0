Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499B5145B3E
	for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 05:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741931711; cv=none; b=SYUpQLD4fltVxxIrRjGZIR00UK1mrupxOeApuX/eoM9KItl8jVzEXVj9chJ9BjXqyqSPCCgjLVMWVaK53rizNz/70fEwF/fvXlo5bUKH3J+6f7l7yVgafNEYpjBGKeM5qi1+1vjoGiaSMF8wS+8jrhucbAp7Z7q0i7z7+s5wfj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741931711; c=relaxed/simple;
	bh=urZDD7SqMI1dPeUfSX17Ch/qC8OVmVTVKPjzd7UPYPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOp9CN24/LN9juv675RX9mjy2Uk8RMhS3gjhhjaJeKjh58YFFAsFfvBnA2AvdXK2FAjBYt1tqxE93Q5VVbel2wBTgTaUrESrInFSb1NF7tMFgxetJDs6t6PlJVOQ/DFzgKoyd6Ol5V+Fm5Y597F55oOAk+O9U7SmaEkIBCErYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X+xBrHQu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X+xBrHQu"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2242aca53efso63315ad.1
        for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 22:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741931708; x=1742536508; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyhsHWhKQvd+JYS7FBXku46dzZupP9OzOBkxq4HnRPc=;
        b=X+xBrHQuvgauQdj4tBvCmiPAYII1goFXmjmf3dFfvGB6pyixKz64moQyRmDkoYBleN
         bO1uTHcZ5+pH2rL6Ev1WisjVY/4D3xYRNfC0LTq87U7E4vMtK1e31V0QyOYXg7HqGO9P
         PO5x+Kgxr8YIEMavmItCDmjP/JfAzbRv2J1ASLK1EY6DeRuZqipizulOG8PoZWw5ypOZ
         uiPAZ/RYuMfCLvx81yRAzXkXbLIHFhCDQJwyykavnPQH9jJQFkF17JGSFAtC75M75STi
         LaVthHD25t9jXAMyVL5TlxHGT5V0IiYZRLiUG2Hi5Zs2RSpryDg7kxA6DVneawcctBnX
         HJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741931708; x=1742536508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyhsHWhKQvd+JYS7FBXku46dzZupP9OzOBkxq4HnRPc=;
        b=mhjlIZ/uAQPFQFRGHhL6NGFh3Nun1O6Xxf8djfexs2XJPiIYI9Xc3QU0JjKomAW3TA
         LYJ3ktTohGwDIBZ9ZU04YvwbHUizi41rHMOq+9T1opUZfBHaAyygWdSc/efY7qzoHD56
         gbsX9aXsQbIkW7FIil35QuNQDmymTb4dtQ/Yxal7Imu2rlubvN5nqVYua8BKDHBSTnv/
         hWT0k24smbshPGxlNkduk2e29GhZIyt3NuW+pRC6N79OwHgfES1xlKlW5bI3zhOLIL2M
         TN1nUD15PUR56Vhm92Div5FP/WE5yaYurvRn1l9187ztY1fK/BTbrEVz1ArryEW4MD1B
         AeFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9HrWJAipW/dr8hytC2bXu8SwYQt0PzBGeSm5OryeRjC7NKpq1HLyG1uBMEqJrSupjuQ1M@lists.linux.dev
X-Gm-Message-State: AOJu0YxkiKS7iUyDIO0WGQYxQgjoPf3woozepVV05yBgDDoDuGFp4D2U
	/A7eRjl7+BXAp/y0UCOdGNAFo6NfitPYzGwzV0aBV7egX4GZaCWB53hE8PQ79ThfHV78u9pW1aB
	28Q8eeA7+yLaM55IIM0lRt4sr2hJqtDyjkRLQ
X-Gm-Gg: ASbGncuCEGTQkWX81kc8cxvFp5NXu9qOGkTnKomNcorDtZPWOv1RFt2yKNYR67Ne51M
	fGfGb/O2AUqqWYYTFiUEZ+kN9W6q+OEaolqHmoSC4cXrRb9nMpaYx3QTwi7c+kKeWpJKFqa4sTp
	1iyiL4ONUkb20D8MFByaMK/2VkxGA=
X-Google-Smtp-Source: AGHT+IEgLWIAjxCjYNH0X+NtNqkuwI/bPH4Uumyk01Hxp41RAM67Lx0FYNOYHRHcAIdc8VeJeEOB7hLlngI/eMqwcbI=
X-Received: by 2002:a17:902:d509:b0:21f:4986:c7d5 with SMTP id
 d9443c01a7336-225de74a016mr2010415ad.8.1741931708229; Thu, 13 Mar 2025
 22:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250122062332.577009-1-irogers@google.com> <Z5K712McgLXkN6aR@google.com>
 <CAP-5=fX2n4nCTcSXY9+jU--X010hS9Q-chBWcwEyDzEV05D=FQ@mail.gmail.com>
 <CAP-5=fUHLP-vtktodVuvMEbOd+TfQPPndkajT=WNf3Mc4VEZaA@mail.gmail.com>
 <CAP-5=fV_z+Ev=wDt+QDwx8GTNXNQH30H5KXzaUXQBOG1Mb8hJg@mail.gmail.com> <Z9NbFqaDQMjvYxcc@google.com>
In-Reply-To: <Z9NbFqaDQMjvYxcc@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 13 Mar 2025 22:54:57 -0700
X-Gm-Features: AQ5f1JpmtjskMcZorXzTagF_PQQ_b8arX_0AF-lPzn55eWXEmzSyGiUvOZGlAFk
Message-ID: <CAP-5=fUdXRv512ZFiQKtxouNzN+HgommWGF3Pje1Tcuxg=J78Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] Support dynamic opening of capstone/llvm remove BUILD_NONDISTRO
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
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

On Thu, Mar 13, 2025 at 3:24=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Hi Ian,
>
> On Wed, Mar 12, 2025 at 02:04:30PM -0700, Ian Rogers wrote:
> > On Mon, Feb 10, 2025 at 10:06=E2=80=AFAM Ian Rogers <irogers@google.com=
> wrote:
> > >
> > > On Thu, Jan 23, 2025 at 3:36=E2=80=AFPM Ian Rogers <irogers@google.co=
m> wrote:
> > > > On Thu, Jan 23, 2025 at 1:59=E2=80=AFPM Namhyung Kim <namhyung@kern=
el.org> wrote:
> > > > > I like changes up to this in general.  Let me take a look at the
> > > > > patches.
> > >
> > > So it would be nice to make progress with this series given some leve=
l
> > > of happiness, I don't see any actions currently on the patch series a=
s
> > > is. If I may be so bold as to recap the issues that have come up:
> > >
> > > 1) Andi Kleen mentions that dlopen is inferior to linking against
> > > libraries and those libraries aren't a memory overhead if unused.
> > >
> > > I agree but pointed-out the data center use case means that saving
> > > size on binaries can be important to some (me). We've also been tryin=
g
> > > to reduce perf's dependencies for distributions as perf dragging in
> > > say the whole of libLLVM can be annoying for making minimal
> > > distributions that contain perf. Perhaps somebody (Arnaldo?) more
> > > involved with distributions can confirm or deny the distribution
> > > problem, I'm hoping it is self-evident.
> > >
> > > 2) Namhyung Kim was uncomfortable with the code defining
> > > types/constants that were in header files as the two may drift over
> > > time
> > >
> > > I agree but in the same way as a function name is an ABI for dlysym,
> > > the types/constants are too. Yes a header file may change, but in
> > > doing so the ABI has changed and so it would be an incompatible chang=
e
> > > and everything would be broken. We'd need to fix the code for this,
> > > say as we did when libbpf moved to version 1.0, but using a header
> > > file would only weakly guard against this problem. The problem with
> > > including the header files is that then the build either breaks
> > > without the header or we need to support a no linking against a
> > > library and not using dlopen case. I suspect a lot of distributions
> > > wouldn't understand the build subtlety in this, the necessary build
> > > options and things installed, and we'd end up not using things like
> > > libLLVM even when it is known to be a large performance win. I also
> > > hope one day we can move from parsing text out of forked commands, as
> > > it is slower and more brittle, to just directly using libraries.
> > > Making dlopen the fallback (probably with a warning on failure) seems
> > > like the right direction for this except we won't get it if we need t=
o
> > > drag in extra dependency header files for the build to succeed (well
> > > we could have a no library or dlopen option, but then we'd probably
> > > find distributions packaging this and things like perf annotate
> > > getting broken as they don't even know how to dlopen a library).
> > >
> > > 3) Namhyung Kim (and I) also raises that the libcapstone patch can be
> > > smaller by dropping the print_capstone_detail support on x86
> > >
> > > Note, given the similarity between capstone and libLLVM for
> > > disassembly, it is curious that only capstone gives the extra detail.
> > >
> > > I agree. Given the capstone disassembly output will be compromised we
> > > should warn for this, probably in Makefile.config to avoid running
> > > afoul of -Werror. It isn't clear that having a warning is a good move
> > > given the handful of structs needed to support print_capstone_detail.
> > > I'd prefer to keep the structs so that we haven't got a warning that
> > > looks like it needs cleaning up.
> > >
> > > 4) Namhyung Kim raised concerns over #if placement
> > >
> > > Namhyung raised that he'd prefer:
> > > ```
> > > #if HAVE_LIBCAPSTONE_SUPPORT
> > > // lots of code
> > > #else
> > > // lots of code
> > > #endif
> > > ```
> > > rather than the #ifs being inside or around individual functions. I
> > > raised that the large #ifs is a problem in the current code as you
> > > lose context when trying to understand a function. You may look at a
> > > function but not realize it isn't being used because of a #if 10s or
> > > 100s of lines above. Namhyung raised that the large #ifs is closer to
> > > kernel style, I disagreed as I think kernel style is only doing this
> > > when it stubs out a bunch of API functions, not when more context
> > > would be useful. Hopefully as the person writing the patches the styl=
e
> > > choice I've made can be respected.
> > >
> > > 5) Daniel Xu raised issues with the removal of libbfd for Rust
> > > support, as the code implies libbfd C++ demangling is a pre-requisite
> > > of legacy rust symbol demangling
> > >
> > > A separate patch was posted adding Rust v0 symbol demangling with no
> > > libbfd dependency:
> > > https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.c=
om/
> > > The legacy support should work with the non-libbfd demanglers as
> > > that's what we have today. We should really clean up Rust demangling
> > > and have tests. This is blocked on the Rust community responding to:
> > > https://github.com/rust-lang/rust/issues/60705
>
> I think #ifdef placements is not a big deal, but I still don't want to
> pull libcapstone details into the perf tree.
>
> For LLVM, I think you should to build llvm-c-helpers anyway which means
> you still need LLVM headers and don't need to redefine the structures.
>
> Can we do the same for capstone?  I think it's best to use capstone
> headers directly and add a build option to use dlopen().

So I don't disagree. If we have headers but someone wants dlopen,
let's use the headers and let them use dlopen. Unfortunately the way
the build is set up isn't for that. The build assumes either:
1) you have libcapstone and its headers and want to link against it,
2) you don't have libcapstone and support is just removed.

In the changes the options become:
1) unchanged, if you have libcapstone then use the headers and link
against - this is Andi's preferred approach,
2) if you don't have libcapstone dlopen is used with constants derived
from pahole and baked into the sources - much as we do for vmlinux.h
in BPF programs.

One way to achieve what you are asking for is to make the build do:
1) the link against libcapstone approach that needs the headers,
2) the dlopen with capstone.h headers,
but we need a way to build without libcapstone, so we get:
3) possibly dlopen with pahole derived constants - but if we have that
then why do 2?
4) a no support option.

The problem is that if we don't do (3) then (4) will become the no
libcapstone option and frankly people who care will do (1) and so (2)
becomes redundant.
It was intentional doing the changes the way I have so that when you
don't build with libcapstone, were you later to add the library you
would gain support for it. This is with the down side of a small
number of constants being in the code. Potentially these could change
in the header files, but any such change is an ABI breakage and so
unlikely to happen. So I think the way the patches have things set up
is best.

Thanks,
Ian
