Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E44346798
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 19:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764876570; cv=none; b=bHUVPFYCWCpJfP9GbBcSALETRssiDS0iXAuR/GwIyw7Y0MWhFL1SyXcIfFnWnon3jvaWOsT5uCaqsoGq+xRV+ZJgZcQygCdFqoJv2TcuyyLZxkgZlb2n8uFim0rbqLiOF1GO2Uqvs3ND5uvY4S0MzQ8Qxi4CZh6CHDXm/km0CKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764876570; c=relaxed/simple;
	bh=li2jOPCpnZmjfOxkVB/u3Ntjt/9n1Mv+93gAuK1nZY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J22RMfoF0HqHz6HntB+yo6gzLZHd2jLV4la5Yz89estdnMGXSTQFNvBxNmN8nqRl7R9lLF+u9t+Ad/gHHwlol6qBc2VaOWxphOMiAz7q2tkjWzpR136JES6SO26jBvggL68vNbZYEUhj4zQL+vWF8/V2RkXmaA99NR/Cp1yUSFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cGFe05b1; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cGFe05b1"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4edb8d6e98aso83601cf.0
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 11:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764876567; x=1765481367; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li2jOPCpnZmjfOxkVB/u3Ntjt/9n1Mv+93gAuK1nZY4=;
        b=cGFe05b1OVYZZbvM5p+SGKTLS+sbnrjd3zQZH3O2rd1nGALtZpqQR7T7Nh5uTDmfDB
         V73TbYb2/IQKr8C2SoYf2XWb0fnMC/MjS9EnbhL3b8dg5AdKA2x7RgRUi0UaeuNIEY+N
         0r5xDLgisoa1naMsl0My+bSgOPrLWWV9agN0LtYNwzkhDPHv+AwpXNHxKRbF9cgvArbf
         EzuJPP781RTqKr8tUrIU5KKdF/gFgS0bawS/xw1jJdXNP9AOCCeJyedY/9L1hQL2TOXw
         4jl30kVyr9YBa3r8ADAr6quWSsrLBh42DmcGxFIXsmbS3y7gBY6Hwn0jXHv7mXTyxDtF
         pMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764876567; x=1765481367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=li2jOPCpnZmjfOxkVB/u3Ntjt/9n1Mv+93gAuK1nZY4=;
        b=HCbX2q3Al1IOTjOEQdoaeA9lyb+XdQFiu7qteZbb7BsecLtBu9X416Lg36x9HkVsm2
         B2EvT7Saok+U3cjsKggpQXEBNVyUB4KPvMURRaMUQkudny2nXAtEyt9PWWyyqPciq2Ia
         dAYRbVGasc5GIK4K4V+iKhCKkhF+G4Zckc2v9AJGUNexWqS76hwCRdMwfemsm7d91A1f
         SBY4oNwInb4G6JB07uCxDkYwDJjdsUW7vrZizhCNEh2FdEkj5USaZxVOwhzZUfLb0HpX
         lky1d4XJ0m0/RyZajpMFmzIDkV1KFbijBCA0nxcJc7OPjXSxih8rzFRoLOWiFQEuMFyb
         rNtA==
X-Forwarded-Encrypted: i=1; AJvYcCXtNwXv52Vm6aBGnBKAwpP1fqWTfow9aDzuZFDAGq4Q4vmaXTnu0QAiG5wIpMEiZB6jpHET@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9sBwjUWdqbbSqTA6+oHyuBehEwAAZKgiMIwF1JFxJiYAM5WUm
	cicMwfZmC78bVf4RPsW8smKN+QmTCqWorKvBwnl3W7xiJA3rR9EZ41oMFNeF+8gy7zhKQSR8kEB
	bX2ZLXFzujMEUqaVrguuo0YlFA2TCzE/A5s2IUVTV
X-Gm-Gg: ASbGncsC1jjjyMltLhxS68itAIEmYb987ON9bAv66Vzrm82U09GIjDcuCFDf8gdrkmL
	+7wG/BjNckUSglotwSqk6Wcr+ZKGwbFhL7oeQr6aYCMNAd7khkQuZTEtKIShTZ85PYgq1VBVGlL
	Yj5s4gOlkWDyNYPgLihErQLwhV4iHhC9A/IcZbuk0yW/h0cnNZLyObqUo5VIJ0EK9sJ4A16Iooy
	1XsJVE/LIVHU92++a78nzW8T28yGobyoA9y32b3/X5TcdukjL3sGglR2/WfxaNk+SaDzHIC+94A
	AHKdV+OTHU0OsQgCr/YyPF2LAA==
X-Google-Smtp-Source: AGHT+IG/7kUZxd/9UMd9RxOWK7oRJw6LsWkyhbSwzHRq9dv3XGK3gE0ZwwYu8Q59dnHZWlQ+QWACJNmSaDdEdt4GFj0=
X-Received: by 2002:ac8:7d91:0:b0:4ed:ff77:1a87 with SMTP id
 d75a77b69052e-4f0310036bbmr1019101cf.19.1764876567093; Thu, 04 Dec 2025
 11:29:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com> <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
 <dd5856a8-e120-4884-8828-9d0c9edc60f0@crisal.io> <aTGJdlwMRxGg2iZ1@google.com>
 <20251204142742.GM2528459@noisy.programming.kicks-ass.net>
In-Reply-To: <20251204142742.GM2528459@noisy.programming.kicks-ass.net>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 4 Dec 2025 11:29:13 -0800
X-Gm-Features: AWmQ_blF4lJt3BfO2o2NOJRf3_Ss0kAS-vrqLdfp0qFcfHcQVmwUbXFySwWbsjc
Message-ID: <CAGSQo01Am_rNeZqnqZU3hY7SwWG=dTHtzcksPSHUTiasgex+cA@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Antoni Boucher <bouanto@zoho.com>, 
	Arthur Cohen <arthur.cohen@embecosm.com>, Gary Guo <gary@garyguo.net>, 
	Josh Triplett <josh@joshtriplett.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 6:27=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Dec 04, 2025 at 01:15:34PM +0000, Alice Ryhl wrote:
> > On Thu, Dec 04, 2025 at 01:49:28PM +0100, Emilio Cobos =C3=81lvarez wro=
te:
> > > On 12/4/25 12:57 PM, Miguel Ojeda wrote:
> > > > On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infr=
adead.org> wrote:
> > > > >
> > > > > Right. Earlier I also proposed using libclang to parse the C head=
er and
> > > > > inject that. This might be a little simpler, in that..
> > > >
> > > > Yeah, that would be closer to the `bindgen` route in that `libclang=
`
> > > > gets already involved.
> > >
> > > Yeah, so... there are existing tools (c2rust [0] being the actively
> > > maintained one IIUC) that in theory could do something like that (tra=
nslate
> > > the bodies of the functions from C to Rust so that rustc could consum=
e them
> > > directly rather than via LLVM LTO).
> > >
> > > I think the intended use case is more "translate a whole C project in=
to
> > > rust", but it could be interesting to test how well / poorly it perfo=
rms
> > > with the kernel helpers / with a single header translated to Rust.
> > >
> > > I personally haven't tried it because for work I need to deal with C+=
+,
> > > which means that automatic translation to Rust is a lot harder / prob=
ably
> > > impossible in general. So for Firefox we end up relying on bindgen +
> > > cross-language LTO for this kind of thing, and it works well for us.
> > >
> > > If I'm understanding correctly, it seems the kernel needs this extra =
bit of
> > > help (__always_inline) to push LLVM to inline C functions into rust, =
which
> > > is a bit unfortunate... But this approach seems sensible to me, for n=
ow at
> > > least.
> > >
> > > FWIW Bindgen recently gained an option to generate inline functions [=
1],
> > > which could help avoid at least the bindgen ifdef in the patch series=
?
> > >
> > > Anyways, it might be interesting to give c2rust a go on the kernel he=
lpers
> > > if nobody has done so, and see how well / poorly it works in practice=
? Of
> > > course probably introducing a new dependency would be kind of a pain,=
 but
> > > could be a good data point for pushing into adding something like it =
built
> > > into rustc...
> >
> > I already tried c2rust as an alternative to this patch. It works okay
> > for many functions, but it's missing support for some features such as
> > asm goto, though this is fixable. But a larger issue is that some thing=
s
> > simply do not translate to Rust right now. For example:
> >
> > * Atomics use the Ir operand.
> > * static_branch uses the i operand.
> >
> > neither of which translate directly to Rust.

I took a shot at `c2rust` as well, the summary was that `c2rust` was missin=
g:
* Asm goto support
* __builtin_types_compatible_p
* Deduced types
* __count
* _Generic

I was adding hacky implementations along the way to see if things
could be made to work, but the %l and %i missing in Rust itself that
Alice pointed out were not things that could really be worked around.

I also think that the bitcode-based approach is more future proof -
the kernel may pick up new C features that `c2rust` hasn't yet learned
about. If `clang` is in charge of generating the bitcode for the
to-be-inlined helpers, we don't risk any desync in terms of what
features are supported either by `c2rust` or by `rustc` relative to
what's in use by the rest of the kernel.

>
> Right this. AFAIK Rust simply does not have feature parity with inline
> asm. Them having picked a wildly different syntax for inline asm didn't
> help either of course. But Rust is Rust, must have terrible syntax :-)
