Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896349;
	b=awuD8VxER0ZOBkfIH50+RRIVwlYrExXPkhGm3tzeJV+lesV+piQw84gXHPEjhayq0aj1
	 9sl1heV02F4ocD5o/bOoIFRxd5jkCFQL7YNr9OwKp/C7laHJHidyBdf84zXYq2PYgxAAL
	 PaEmUcq/jUTYKiv/fi7zUcEFU/wTRwZpElQZ66KVn5r7p7PmeGf8RvN4SwetoXTgSsk8X
	 qh0dY53Nc/MlB57ttkFQ7xEwB+Q2VHavXYLyC20Mhs+5Hdy8NFkVk9w99+uRDaG9iNz+q
	 bZiEE/bLbhChwS32p7G1ttAbEk7cjwS7uWZWw52/qcokmoKHDGPv1ajkaxXrHu4YS5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
	b=B0HclJOIW4oPl5y/2Zg4J13tQYfAXBO9SD1aqigG38cwBs1DGJxXyHd7sHg4sHZAGy+E
	 rblfOp7LS8l8qzNPHBnjn7wlByQP32jlWyrmw+H/EaQ449EsplykMjYQZOSyei98MMh1G
	 CvEf3gkriRz+8/OupdE16V+8m17vyH7CjRsykm7rQyJybe2K/O2/bCUtd0kodVMacTXSd
	 lUMeC0Cd6J9voX+/yw+QbrLrnshu0VIYAxT8U2CzgTjFf8/xvSRO7zAIinKU4xOKKRcIU
	 uj5tKmuWDT8L3XNVhpsM2LWwaN44OhsM1SdAHfohuIVh/jKRO8II7y70avpGEM73sHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y19V3NqJ;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36166083614
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 16:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36166083614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y19V3NqJ
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab4c608a6dso25830891fa.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 08:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793896347; x=1794501147; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
        b=Y19V3NqJ/xkhP2r8Ck+rMqR9C4qBFmPC63eaNV29xKwSrCxdJPxgbygaECcI4fhYR5
         r/H9FSLGyNrE5dv3xjuBrT/zPfODNA/mMoNOFxgFFpLYIpJmuZzJt97tsVHotCez8H3c
         Y80ACgTChfCR2GishjIjThHxcLJ0pFpXEjwmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896347; x=1794501147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5prWUgliJcOAr4R1nMCKAcSyRg6dSeYd31zgPiidQv4=;
        b=QwDdvtAZaaFt4zKCwGj6NoHUaGDQjREJltykDUs/sdmfbe/fhqZrmM5Ug2wM7UmRb8
         8ar2rtsGROabDbtSXzmDQF3yTYa7GvnxubVnCHjvhk941CohxkpdXbNwDkbd0+7+eE8D
         m+Y+LajUSZ4iE36z8qJ5MWEamawtYHtoQVDZQDEWNJcG9LZGhWoWQ6ExhLCN2bBgld3p
         9LvAoJh1orrIqhZKOve/jnkjntb2zpcx9s5HPExkUbgrgcKY/Gaktu9KLRU1ER5zZcgF
         M/5yjCefX4ghmQKR0NOmDijGRxdvbU98eJSjVdrkL4vnPuj11ZVZKGkY2Xo750C+KeRP
         f06A==
X-Gm-Message-State: APuU4Z9Iphj/RgY87wuAP0z6yZIvfUCTJIgV50M+/JXrq5QBdN037iLj
	e4+764jPyesXJVGyGNfriN3xVqC05+BPTLHKjtvyaluQ2I59cUja81VepsevAXJ+f69T/fXFgLC
	19AEGD31Y
X-Gm-Gg: AYBFou15lTp6TPbDnOrkynWpjBNONxg7USZRXrW5JiXS2MlhT4B8Y/dTKGk1jM4ytlX
	ekQy8wxurz3Nmjs4y6J9toF+r5IE1087q5JGUaFpVGmpclYfOiueQmtINn5Yp8nrIwZfJdIUU72
	hntgIrC1al6kt4ShQhmcQBi0aOXTaANdsy29dTr+4i3NP6z70iS3aKUW1vekrpKH/Eo/hnN+eal
	6KW+rGdzwxby8zcUytRZJRmmGx80baAKMf2CBNcjui+i8l9ItBp8nnEaVEyT9IMS0j1qXjfVMbP
	zU7S+OrMVUPESBL/yrM0GMKM/plAhoox7fJ9NpZwt+/7MvioQZhxqCQ8WtAHnCj0VZDy8wDtvZw
	Pf5iEr57A+w0R05dpgi/gm4AFBFIlLtf8wbW3kCsSpF8RWTr4J7lBpfJOkX/VV0U/iScgPcmrwu
	CuMuj0vm97RDY7h62pRf90kh9793K1FKJpMVW/BJ46dOIcaIydkZ9tgkg1RG5e5VX/SKMsIfc/c
	3aZfhMgHw68kPE79FoyA95ghhtfXMyk68OgB/1kcIs29ysXKk9RkNN1tUql77KAp29g1rhne7q3
	aNNXoFOmHEMsOiYmkIjdy4QRIsbUxIMiTLunKK758clnOMllr4rMS+LzLBMIG0NujdQ=
X-Received: by 2002:a2e:a556:0:b0:3ac:8e61:fd7a with SMTP id 38308e7fff4ca-3acb7ac1f08mr45466071fa.16.1793896346758;
        Thu, 05 Nov 2026 08:32:26 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e3b1fsm10784711fa.31.2026.11.05.08.32.26
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:32:26 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be416e603cso1436334e87.2
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 08:32:26 -0800 (PST)
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id
 5b1f17b1804b1-4acaae665a6mr332973265e9.13.1793895857514; Thu, 05 Nov 2026
 08:24:17 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162>
In-Reply-To: <20261105052401.GA862715@ax162>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 08:24:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
X-Gm-Features: AclHuK8NKe2Ice8G3ieACvjOY5cRy1bgQZ2ikhne4c6q9f8t2mnwrvferc3g3-I
Message-ID: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Wed, Nov 4, 2026 at 9:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Wed, Nov 04, 2026 at 05:45:55PM -0800, Douglas Anderson wrote:
> > From: Han Wang <nesthanwang@google.com>
> >
> > AutoFDO profiles are commonly collected on one kernel revision and
> > reused across subsequent commits or stable merges before a fresh
> > profile is generated. While AutoFDO uses function-relative line
> > numbers to tolerate edits above a function, adding or removing lines
> > inside a function (or an inlined helper) shifts all subsequent
> > relative line offsets within that function. Without stale profile
> > salvaging, shifted callsites fail to match their nested inlinee
> > profiles in SampleProfileLoader (dropping profile-guided inlining for
> > those callees) and basic block sample counts are misattributed to the
> > wrong instructions, degrading branch probability estimation and
> > machine function splitting.
> >
> > Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> > since LLVM 17) for C, Rust, and ThinLTO builds when
> > CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatcher
> > to use lexical callsite anchors within functions to fuzzy-match and
> > remap shifted line offsets when querying the profile.
> >
> > While -salvage-stale-profile is not enabled by default in LLVM due to
> > the minor compile-time/memory cost of sequence-matching callsite
> > anchors (which is unnecessary when profiles are freshly generated on
> > the exact commit being built) and the heuristic nature of fuzzy
> > matching on heavily rewritten functions, enabling it makes sense for
> > the kernel: hardware PMU profiles are rarely regenerated on every
> > commit, and anchoring on callsite names is strictly more resilient
> > than blind line-offset lookup when functions are edited.
> >
> > As a side benefit, remapping shifted line offsets also avoids feeding
> > mismatched weights from stale profiles into MIRProfileLoader's flow
> > inference solver (applyFlowInference), working around a compiler bug
> > [1] where a small intra-function line shift (such as in
> > __vm_normal_page() in mm/memory.c) can cause applyFlowInference to
> > spend 30+ minutes compiling unmap_page_range().
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
> > Signed-off-by: Han Wang <nesthanwang@google.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Much of the commit-message justification here is AI-generated. Sorry!
> > :( Folks who know better, feel free to call bullshit.
>
> The justification does not seem wrong to me on initial read but it
> definitely feels like the first and third paragraphs could be reduced in
> verbosity since this can basically be summarized by "AutoFDO profiles
> are often reused, which can be problematic without profile salvaging
> enabled, which is designed for this exact situation".

Happy to reword or happy for upstream maintainers to reword themselves
when landing. If you want a v2 sent with shorter wording, let me know.

FWIW, I actually asked the AI to add some of this text. Specifically,
I felt it was important to explain why LLVM would not make this the
default behavior but why it was still the correct behavior for the
kernel. ;-)


> > Honestly, this patch came about because of AI analysis compiles taking
> > 30 minutes to run (see the clang bug [1]). It seems to work around the
> > problem. Obviously, we should fix the compiler. That being said, upon
> > further analysis it seemed like adding this flag was beneficial
> > anyway, so I'm posting it upstream. If folks disagree, we can simply
> > drop this patch.
>
> I would definitely like to see that issue triaged but like you say, it
> probably does not need to done before this is merged since it has
> reasonable justification on its own. I would love to get thoughts from
> other folks though.

Sounds good. Thanks for looking. Let's see what others say. :-)

-Doug
