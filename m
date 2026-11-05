Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793902996;
	b=YslB2OhpghGVQ3Syah8MnQxbXkpGrqTmG+Vp+hNmuiBuVouOnjlBK8AAqOGLbBTjGjKk
	 kL0b2EyvtfXRzLWoDeY4MvxmviUGkfUqNdfWTEDUCHBs3fdBRrxjsK0Nxb5NGRBfDit/j
	 T1X9YdvzTCgRsnEmLzxMdM0h41nbMRmc17wSqgfKqXUZ4tFlOoqGFQl041YaxUsUUbLlp
	 hmKKkao7lmIeL0wnlNcb9+o0xbsRERIxmuAtvxNOrS++DOFgoJtVRldTdMnNBWPvkmCBp
	 /FwKBYTG7L2AzFY2o6UzC5QlnYzFqL7XKYg7QRm5qaOAqk8uofVgtR+d4EXIDZX8lvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
	b=XfbYX/aFdZvkVYTomI0bTuQVWZMuAgbqy0cSwG8JEXCBskJGLfosCNPYPaKqJa2qYtM4
	 mR6ikFtpFcwnmNdDUUv87Rf2wqREWEwzxrnQtCG4VOlquXt6N2mSuQ0j+CmcISZr37Jon
	 uF+hAu+yzurOK9nj5ASTqW5AnjWJJqfY8Vyrxo+TjAGw5A7/zoqJptdm3WK5yJqLuRFq1
	 FNsA5nVDi87NUKMJqJAWkaZ5iaoeqSzbh3y47T8MwEJVcNFGv8cNbKWfcbxta6mYdz8Ao
	 rlFrqIvenBUaTpcnPuf3+9Qs9scVflnrBNpIgHghj89uLq3sJgv+u4px9ruWL7AAObA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n8QyuMEI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BB8606A328
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 18:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79BB8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n8QyuMEI
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso682a12.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 10:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902994; cv=none;
        d=google.com; s=arc-20260327;
        b=EDolM8WOSX3bGJVVAIeU00uLfLE9vi2YGs2VEKnbfGtqGIT1zcJ0Y24qwSWt+Sb5Lw
         rR9teTtsBe+O4X1c2wrnNP2dX7UWfLC26FWGMcoFqwKqOkoF9Cuuz/4lPM27awwn3KGG
         nhlEUd8C6uv9CUJyoc8XmDJIb22D10uRa49IyMIis1v8WrvEGqo1vOC2n4+WBmKLZxQ6
         6b1AC5YiJd93wkQ8euOSQNpahqO3OPyfUDj9lMIwEPzDiBNElTuZT3GsAGXdtoL+yUJN
         bNnFuYXFOZwF5L3deckp1rmXiNl54osoLtChIfylzOanZf0gRlIMhN6YMDIPmVtiobtA
         CM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        fh=UfLKTLJ2bJHZGre8hB655BYiMTrCUaKiD2nemd8IWSI=;
        b=jFjNw6kB02UBbmi5kwJgENbmXrleKb6JofIZJhSkOfATgZjnzL9gX0qkr7vvmQe/se
         PyC68VcBpBKCQJPMKEtXHT/1p2sqKBjt0b7KSA0ebrEdGyHBKQY1UlZpxeB4grDMWseY
         RgLLUqRZhBz/SEFyRp2Qh7rnuJzKK8abjsblYIWSyAWtKikcXb+Siu/KgTRJpA6NLoYE
         XKUgFYxz7kXPdBm6kz1ZCVF20OBdvC5Hi1/w8Gvsitz0qvVGrQ1WgrmMVKwfKisITlWc
         V2p9AWU+ceEj5KrM6MoXu0qbarLLv7gD+l9r+F4bPFGaSQjFpgJZoI+w7oGEZLqXjtaF
         848w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793902994; x=1794507794; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        b=n8QyuMEIDBWf29imWnaFwT2Qw82b3VGFeds8z0LeMkXgtH44jC5PZ0oeDY359dLrDb
         a51T0NsEuuwoakGb0XbUJNuEK+1TD/Q3I2I2t99fRnydGylZlg/92MN2kWqlNQQK5K6e
         IUFNqOTx52tCBx/ZcBieO1ikYK0mAhYXK/vDVx0muwEcgFASsnNlVQ+79rj8lyRX4IWX
         BnIjkuercn6ti9E+fc/RQbXqbc6ENe8ZZo7Ib2PrugYQVk0GfOXRrsxYjOvnvBy+rjbH
         MeICPqdzAwaK6MhgdfUuUksp7Acfd6JjEeL2a+k3nOUFFm5kONpiNtxZkx3MDwWgXFVn
         w0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902994; x=1794507794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njQ0JDtVIxygXORTpZyLAMtJ40J4BJxPAxVTSpHRfSs=;
        b=Tqa2HVxR1SJJVOvHsMbESVlfSykdRRFR4jLiBS6IdYhuq3WBoLoKvURDoquut6GMe4
         nyxYJCB6+YBRFR60s1ib330l7s98T6PLVjTdjz3ybDX/IWr1HkmfmgGaBgNn5ztOo/aP
         wh2Q0ulUOkXhWffT+ioG3jTv3hOqBYNM8JuL/a92nH/L04VeJmHv7bUtcwM9NfA3M/aT
         okF/+W1Lu0TYr5mBWoWvu1hmNkMUHX1dO6qy9POQmXzrTegbraG2YoUzbh1sgtp6ENn3
         q1hFbyU+BAaoIUp4PQ+qL7tKHY0jTNmxrGkZ9YSDuKAcMao7ZgxhgUsHFvtjQNkzJK+M
         ti6w==
X-Forwarded-Encrypted: i=1; AKwUvBzdaK8woYvnl8EyzPNrnSILkpsAJk8ImXpR7babSYgkkwoYH/kHxcUMEL9VcfjG/J8f3Qr/@lists.linux.dev
X-Gm-Message-State: APuU4Z+W1xSYYM+IHZ7330mbi1mw3yNSeaII9uhc5UpyfDUzHzedmOq9
	ffdkDMauZ9gZC7Qp2fyNl4LauOWpMh4paRYFIwibTmXxz+Akf9zsoJ01Dd0rRb1TZaBlpLBYycu
	/XO/UMdkww9acaxW+obAW1RnhIrrXBqAbmQGJQ29z
X-Gm-Gg: AYBFou2Hq807cPNtdepgBIivBXdOYVz6YfwvZJB5ESP4EdIyFDFRdbwCbW9QltRRr4Y
	rzffjYGAkmXHPaXIml0dEmTiMKNdS0geFqkGvN6G872XvKs04JDug8T2hXml7L59oXteE8q0s94
	Txr69Vi4/0ZIunyHmOpskkjgJ2TuuJFMewyvJOvorSeO/D12AXQ6Tla4DFeNMeibVEEJeLaU54s
	2Mj7U1NRVfOnnFeDbhuORnwYbAMvMVBkIdNjX5p2+WxQhuatrx7H68NWcUGgP88Z8Bk1CQftW+0
	uiCyDjWtCINwdDUMJmozYmiWe1PHoRAHMuQEp8ZhcuH3u9D4JPNL/0uzGnoRCWx6bEMehKcB2iF
	QxbPRGLKyN/qGlGX/vWFHy6U8zPVLXYD0o9wuRyPVKICpfJw84LY7YgdLUo55P1RJ
X-Received: by 2002:aa7:d0cb:0:b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b5974977bfmr2576a12.0.1793902993423; Thu, 05 Nov 2026 10:23:13
 -0800 (PST)
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
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
In-Reply-To: <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Thu, 5 Nov 2026 10:23:00 -0800
X-Gm-Features: AclHuK-iL3nM88J_jGCMxHWL2RXDHV3lXy-Du5jSeqmhM1AWFtXv6dHLUOOJdWg
Message-ID: <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
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

The issue you mentioned regarding excessive time in applyFlowInference
comes from Profi.

The AutoFDO implementation used in the kernel is FS-AFDO (which uses
FS discriminators). There are known issues when using Profi with
FS-AFDO; enabling Profi actually degrades performance compared to
original profile propagation. When we tested and worked on AutoFDO for
the kernel, we did not enable Profi.

While I haven't looked into this specific bug yet and am unsure if it
is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
to disable Profi for now.

Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
reservations about adding it for the following reasons:
1.  It is heuristic-based and not enabled by default. I am unsure how
thoroughly it has been tested, so we should assess it further before
enabling it.
2.  The recommended usage model for kernel AutoFDO (as documented) is
to use the same source. While it might help in an iterative build
model, I don't see a strong reason to use it if there is no source
drift.

Best regards,

Rong

On Thu, Nov 5, 2026 at 8:24=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi Nathan,
>
> On Wed, Nov 4, 2026 at 9:24=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
> >
> > On Wed, Nov 04, 2026 at 05:45:55PM -0800, Douglas Anderson wrote:
> > > From: Han Wang <nesthanwang@google.com>
> > >
> > > AutoFDO profiles are commonly collected on one kernel revision and
> > > reused across subsequent commits or stable merges before a fresh
> > > profile is generated. While AutoFDO uses function-relative line
> > > numbers to tolerate edits above a function, adding or removing lines
> > > inside a function (or an inlined helper) shifts all subsequent
> > > relative line offsets within that function. Without stale profile
> > > salvaging, shifted callsites fail to match their nested inlinee
> > > profiles in SampleProfileLoader (dropping profile-guided inlining for
> > > those callees) and basic block sample counts are misattributed to the
> > > wrong instructions, degrading branch probability estimation and
> > > machine function splitting.
> > >
> > > Enable LLVM stale profile salvaging (-salvage-stale-profile, supporte=
d
> > > since LLVM 17) for C, Rust, and ThinLTO builds when
> > > CLANG_AUTOFDO_PROFILE is specified. This instructs SampleProfileMatch=
er
> > > to use lexical callsite anchors within functions to fuzzy-match and
> > > remap shifted line offsets when querying the profile.
> > >
> > > While -salvage-stale-profile is not enabled by default in LLVM due to
> > > the minor compile-time/memory cost of sequence-matching callsite
> > > anchors (which is unnecessary when profiles are freshly generated on
> > > the exact commit being built) and the heuristic nature of fuzzy
> > > matching on heavily rewritten functions, enabling it makes sense for
> > > the kernel: hardware PMU profiles are rarely regenerated on every
> > > commit, and anchoring on callsite names is strictly more resilient
> > > than blind line-offset lookup when functions are edited.
> > >
> > > As a side benefit, remapping shifted line offsets also avoids feeding
> > > mismatched weights from stale profiles into MIRProfileLoader's flow
> > > inference solver (applyFlowInference), working around a compiler bug
> > > [1] where a small intra-function line shift (such as in
> > > __vm_normal_page() in mm/memory.c) can cause applyFlowInference to
> > > spend 30+ minutes compiling unmap_page_range().
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [1]
> > > Signed-off-by: Han Wang <nesthanwang@google.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > Much of the commit-message justification here is AI-generated. Sorry!
> > > :( Folks who know better, feel free to call bullshit.
> >
> > The justification does not seem wrong to me on initial read but it
> > definitely feels like the first and third paragraphs could be reduced i=
n
> > verbosity since this can basically be summarized by "AutoFDO profiles
> > are often reused, which can be problematic without profile salvaging
> > enabled, which is designed for this exact situation".
>
> Happy to reword or happy for upstream maintainers to reword themselves
> when landing. If you want a v2 sent with shorter wording, let me know.
>
> FWIW, I actually asked the AI to add some of this text. Specifically,
> I felt it was important to explain why LLVM would not make this the
> default behavior but why it was still the correct behavior for the
> kernel. ;-)
>
>
> > > Honestly, this patch came about because of AI analysis compiles takin=
g
> > > 30 minutes to run (see the clang bug [1]). It seems to work around th=
e
> > > problem. Obviously, we should fix the compiler. That being said, upon
> > > further analysis it seemed like adding this flag was beneficial
> > > anyway, so I'm posting it upstream. If folks disagree, we can simply
> > > drop this patch.
> >
> > I would definitely like to see that issue triaged but like you say, it
> > probably does not need to done before this is merged since it has
> > reasonable justification on its own. I would love to get thoughts from
> > other folks though.
>
> Sounds good. Thanks for looking. Let's see what others say. :-)
>
> -Doug
