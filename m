Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72F6211A09
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895219; cv=pass; b=QZzou25Z/jk516P5uw28NjTw0MqoUopguS5xnn+KitHvmQTlzcTnEv1XkGVeUN5FNBJ4qhF5/YmTjtukhvAZwasEBLnHV5LLTxirZuIYwZ6dgWty/1tL3+rpAn+nxXHaot2rSrVrhGKvwik/EU0fY9VjBEdoHA0weHoxhFx8F8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895219; c=relaxed/simple;
	bh=2xcKVenmsOkTL/dR7a9UaRkSdDoYvwvb2hQq8wsPR50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiUKUUjG9ss7LigCBx7DgfzkTzWsX5+1JkoqVX8WZWABwPcTrWyWY0Czw18fnGBmN2513kxAiQC1NV44v0+Vp03eW2oYUIrLAWiDfP1rPVlPKYkO8grWjE7bMLss52785g1Ku0V4+bQJBYep+wirrweIX3COILNxtWehnxy4nvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j/VJTe6j; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j/VJTe6j"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1624740f8f.3
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 05:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895216; cv=none;
        d=google.com; s=arc-20260327;
        b=aMxD+jhqAQ8up7YjiE/ZTYgzTW96xzySXySOBzy7iUfX9m8tokLdtOtzG7R05u63io
         elU2lUi0A9m74Jh5ecylNWdBIrDLOeMpJbqV3QRNqVDPVsJ9R5BXyZEC5VDxKnYfflOj
         1tBBKZUMhyM0O53Akm7afl8Cwp9+UWnb511ndb04Nse1zhMgnuv48vdKcIsg0iWyu27B
         uK44cyhlw55SecPpJv0XycqasFTzCXoCqRzXvBwF/Pm/FJ7p9xxGv7BD5wZaJ+TVTW+c
         PhJIVQaWFz5nQ2jve6I+kT9hEtOjeTFADAHpekFa/0tN7gUbwxbbHsFuefkFigNKE9KR
         Y4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        fh=MDqTQeCB+QtpURnGz/oSZNBBqw7AMy6HWRjlvfZo0K0=;
        b=ri+7ykTOiWnNdAcoGxrRX1/c5zuxXypdO0/iSD0mlDoBTDn2GmuzEZEk5UnaALL7BG
         A6O/v2HdNechsDNMIRwooTuUQBBVQKuCmsuCy3kBuVc4O6Evp696oUH5EXh8P9Vti34l
         pWXWD/k3Gn7cM3kcR2YgG7McMRsRWGGSTfjSbCi+rYH1LcwUwWnvVBy6K0UDrAdnskvl
         08jf7gnfp4zZNKjADzuMZODnEcDnMsdQZHzA1MuCHh6Ju94rZtReGc3rtj8JByNw0l/w
         Km+EZOlfN0qM3FqMXLMe4BABUni+yuAVvszH0j/siyAXteDiOHb0e+ShsPTN8nfqZfvU
         Mhjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895216; x=1792500016; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=j/VJTe6j28fxAUAEPfwB3DIARNAZYWuVhVgdKfeakQ2NDDp0QD9D9arbTX/okoZNyB
         ZwiyYQo8kJHyHvaDakhmHB0Yot0AoncViA3NvoLEbTV0iMUi60WcT2/gprzJnHMFxDSP
         QuBe/BvIWNblptefuyELsm3+hC8iHMAGeq7AKmYMgQce1QFEfTQA51VVBaObNP3Ojfpj
         hLwBVZyCjG7L4owEKz2OJvEPiIbOM26il0oHm8XQ7Qfjsp6knP71Koer8AgnCLbgRVGL
         MjrxMg/ENf7ZACvIXJVKn95Y6LF5h1OmFWQnriMp4+YhGJN9UniB+Dc7bgzsW47fFTL0
         zlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895216; x=1792500016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=ZbSte/GpoEaHubOoCy0p1+2QO6jX5rIHsNOlOuA84y84zqy/YpAUofK79+jFEOJDNp
         5tH6TJ3FkWERWLsKIriPlURibqe05JF3ITcPXHmGaHz6wogG8H76xESKipRfZY/QT0hO
         MAayv4Ldo/rwm/+7m9vWBqfEno/T/D1mGgKWz5qVItsffkLDx4Yenu+ZGZyI5TodjwEx
         J/Axcf/AY92gV+BorlSMQutB24rluTRIkbqEhzR0ZPmFyu1OtP4EJliujpJjuwqwctg/
         kMk3qeNShnVoKkQOHdxBVYwO8POhWqvH+9Ocw5d8UimhAxDRQNpZMmDNQwPoz7Xa26L9
         M8Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzTGs8WJVXukFMqm4kbODH0OrXUodVILa6ZSUYelh5QVvIjR1KfF62IZJVnDl8pWHKO4wgK@lists.linux.dev
X-Gm-Message-State: AFq9FYK5W0p2xV2/edNa19xt3FnbnGXvReEWsWjdNKTrK7VoH2XW6yce
	r8FcIrBOnGBPegLYBiMY0wvk5XjLCxT9B/PvfXMK3bWQUTk+G3yOr3PTpO5Y+LDy1SlLpww+34D
	SWhwcXjpt7az1ff4dfkGUMZmiHKsClh31jBqy44dx
X-Gm-Gg: AYBFou0umsxBkhTitiVgeK9zi1FahP5rFn0++4vcKTS+nVcUIIk9SwrI2IWjMgM24d5
	1q72re6OLrGAJRewcQh6u5v6Izu36AQFxIfMQTMbHB12cuYoaLyDNVuAwcNE9VI4GeNeBAg6xEp
	0oNuLRmCYtunmIaB2SC4z5zAmLjUthPS6SmK1bcP2w28n49GNUs0DPBNv/QDaZXGF7ZcZAdzU8Q
	/g+WSfsenilpeTU1I1bcLYxpKO1KKvfQ3X89JgOpG89tjYCEVSa+CVEW96EiTU9udFYG1T97WJD
	1zqIFvWuIC9WkDbYhlFvJ8SeXRT6kRTRKNZ7ITmC5ePv62CTQTc+nj6d2XMzBReXLeOmD661nGE
	3/S3CUq63fj8ZVE5COErDTFc=
X-Received: by 2002:a05:6000:43c5:20b0:487:27f6:a4df with SMTP id
 ffacd0b85a97d-48dbad3c1e2mr17146863f8f.47.1791895214991; Tue, 13 Oct 2026
 05:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
 <as4DdRqFKxuJNDnS@elver.google.com> <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
In-Reply-To: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Oct 2026 14:40:01 +0200
X-Gm-Features: AclHuK-baEW0UEHM2ney0XhOi65COv0qWM-kqnIhtWfQmlen933Tf5epqt03if4
Message-ID: <CAH5fLgh=TkPnycdZ8_yQKaVeufN1YUS-MTo3EoMVhZzOdpKwYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:32=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Looks like it, and we need this patch to use system_dfl_wq:
> >
> >
> > From: Marco Elver <elver@google.com>
> > Date: Tue, 13 Oct 2026 10:05:52 +0000
> > Subject: [PATCH] rust: workqueue: add system_dfl()
> >
> > The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> > (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> > system_{unbound}_wq is used")).
> >
> > Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  rust/kernel/workqueue.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > index 7e253b6f299c..e46d3acf903d 100644
> > --- a/rust/kernel/workqueue.rs
> > +++ b/rust/kernel/workqueue.rs
> > @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
> >      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
> >  }
> >
> > +/// Returns the system default work queue (`system_dfl_wq`).
> > +///
> > +/// Workers are not bound to any specific CPU, not concurrency managed=
, and all queued work items
> > +/// are executed immediately as long as `max_active` limit is not reac=
hed and resources are
> > +/// available.
> > +pub fn system_dfl() -> &'static Queue {
> > +    // SAFETY: `system_dfl_wq` is a C global, always available.
> > +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> > +}
> > +
> >  /// Returns the system freezable work queue (`system_freezable_wq`).
> >  ///
> >  /// It is equivalent to the one returned by [`system`] except that it'=
s freezable.
> > --
> > 2.56.0.385.gd3acb90ef8-goog
>
> This is:
>
>   https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@ke=
rnel.org/
>
> i.e. we have had a warning like that in one of our current tests for a
> while, it would be nice to clean it up:
>
>     workqueue: work func
>     _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtN=
tNtBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
>     enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Cc'ing workqueue: Tejun and Lai.

I was actually working on resending that workqueue patch series, but I
think this particular patch should be split out as a separate fix, so
I'll go ahead and do that.

Alice
