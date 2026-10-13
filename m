Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FA33DB33C
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890212; cv=pass; b=L3FLYWR0kwpI5VlVT61qjYBDeXs5clRbqdZnD58Zl3SoWiG2s1a4Kz2teQtb7nJ2IhCx3sucfLnOKVMeyktmhgj4wjm22cuYrluDSdVgsJAXawVX0Lg23lBNEa0McZ5OIgA4mSa2+YBbnro3STnIp+0p20K8l88rWHw6OSz0OqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890212; c=relaxed/simple;
	bh=rc9KLx7EvkpoTqaPj95lDAq+Pysu5EXwOszhQEsLWbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiDTemCl3MNAvqRseKC9vBR0Q4ZdNoIbx8l6oN8lz8hhMOTaCIJ+9aNwXlyFHYhdQFpyYaxC6yKSpDymkfJtAkeNfhc5LV6cuyffRPjSbvsurbQw3te3D7DTlnWOFXJcrXc/aBbKuOJ2Hgoet6V860tKFg/MID3mqyOitWYexcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jL1n8mvB; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jL1n8mvB"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso647099eec.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 04:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791890210; cv=none;
        d=google.com; s=arc-20260327;
        b=RlDwpR59i4yLx3GZqfj+ZPYMIBHUxG6aedBuCuJsh7HBNIK2W+ZOR10KA+9cJtWFMj
         U6WIQ5ThG58gkP/Vwc24opZdXJTqqF8p3MaLqJZHQFiuh+vzR8CYgkaFlj1xncoFyIVM
         MjSL/B+Ev5JH4c68r8mEus0Fw4QZB6VFn/HhhVn3wKdqIRIBFMlS2VCob6kVqP2lV0/Z
         TwF+IS4kKsyBY+UVQJGOqpr8nXIRrkihwiPfEAnjW7bDmvydZY7K0hl3vjcxxOUMWwCc
         3DmVASLF0UQfVhFh9ddLQOMKcaZD63FqwJhReY7+UwF+tVAE9OTxklVhUirQlh5MHiX3
         scGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        fh=Vw6OoF0CbEJrIleun309V3tIoxmWOciwaL+2f2Gmlfo=;
        b=QNcIdrVpFwb0m8zw7zuSe7ufvoRQepL3vu/jG3z9P6qCnNvWjDKrslaP0LRPS5ZJJu
         GacQIUS2pApv5S2IpN0OPo1GhN8cr/B0HVXJI+952ACStnfq+OCH0FMyDihWXC1mA7ig
         U7K+Hl06ISlK+pp77kNZpHkHqnlv32EGyfW9Pshrp+jyTfmnSJcYxpb4k0Wq+AxoRw6M
         B/L2hkaclqI9xurFV2hpfKtGI3rtNdCMXvZVd/cY83wGfhyv0ccCI1WUXF8vjaFqUGJO
         zjQ7DpNlDVsdCJh4MtK3XrEYqMPsleQ7F1CYzHnVgFzsO4TNr5KmjEw9dt7J7EzmCcGb
         C/hw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791890210; x=1792495010; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        b=jL1n8mvB6ozZVAS7g3bEZfzFZXQmKiUUeOr+NWGyZTqX3QekVJByice42UQpDf/leL
         Bqc8on3NFDizjSULF/o0rlF4VkuFjb+xARkMyYjsZ6IIXZbCB1KGBoRcCzHN/d5fE37H
         2sfgmPXkNEtV1Jkqd5XSYb+n2vcP5nO28TiMqRkRWhSnLPZXn6mIxbA3+2g9DEEl6Td7
         rPhITVPdvD/udeqep+uiTqmGeyFwRm+gjL811W5sR1ibm3yHL2zi46L9GLCA73jK7U4z
         AVk/53bcMOgfFeI0Xb6kqGd8pjVex1lnjKNpDdshsc8Cl7Ao1A2SixPU6PuT1nrUPZo/
         V7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890210; x=1792495010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        b=IGG7t5QY8fsxw+Y3f5Lq8lTRy/AtrQZoxFSjWaDf8/TWYA9044jcZY65iXmorHbTYF
         /NWaj+bO1Gd975V537wuyczrMUvkWqrhJuQaePK0q7yglves0m9OpMC5QLan3B95OqwX
         +ieAY3WyDGPmX06qDPggg8BJGKc6UjqEd8yAefqZcX6hKZXmf+KGIH1fqg70lM9J/e0U
         PA+9ih9zPl0rmZdD53joACt5ae/6zlnyeLQT46ebtCRfd1sc27xtgK26c4ooFVjrz+a/
         rUMAn+6UqsSSuVmNRk5ZLLipNoTpUKGogc2B5uJFjc4Ad1yrI90c5wuYq3IcVEo944OU
         yn6g==
X-Forwarded-Encrypted: i=1; AKwUvBzytt1nVFMdrIexUhsS5M8+1Ws++gI7oyccZZGI8Ib2c9n3LHWbM9kjfeWR4O+LDdsmHAGI@lists.linux.dev
X-Gm-Message-State: AFq9FYLJ2rSrAWbfDnU+HJ124UfhbBcbbBsJiCC+5jz/RtXB3SvFwR4R
	4b0e/tRoN5+2YoKg6d7atZjx0oGqUR0lYeXbpfIRNvjfpYXXa4zX+xtsVr9zBotc2mQQ3cNr8UU
	S+0ARvS2VgzspWcgp7QQo7culTqmmXT0bWxLcIWnp
X-Gm-Gg: AYBFou0dQnaSG/2cR/D2zjoR+ZVElhQn2P+a+fRef9dxzUTVknijGTNjv6WX73JcfxK
	dPt2pFjI8koAlU82h6rCpWR2V6kMXklRpa6TvBqD8jJ0bvI5KD3MYwRK8M0W+fg0Nh/Dv7/bpx8
	x3DdR74UuCdOZWAQCwthxo4SGWZu7QxEaWrcAwx9eNdUHP6LpqZz6TdJkFaOLYLopMP4LOjXNGa
	SegBkN6xftLx6hz7m4z7PadjboSuSuMllGKtL9ilIptJh/hS5CQIW9HguA9b7UDcZVN3AgfpOXk
	KLT93RV6wNTjZDU9wbDJDTAuLAC7haedqrktoQ6V0N/Jt7qxdM4jeXXDHm2EVkgnrzW78QC9cS4
	uqN+z8hDNng==
X-Received: by 2002:a05:7022:f50a:b0:17c:393d:a0c8 with SMTP id
 a92af1059eb24-17c393da495mr248774c88.5.1791890209700; Tue, 13 Oct 2026
 04:16:49 -0700 (PDT)
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
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 13:16:12 +0200
X-Gm-Features: AclHuK_P6PU5CrwSXdVV6i-xG77HwukstjFkP0Kjvw_NwxgzqD24Q_xKBYjksY0
Message-ID: <CANpmjNNu6VEXtr5zUWAiAP4rPiM9jgE-1ai91+Fpxg2ABeKYFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 at 12:32, Miguel Ojeda
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

But I take it that the series above is not yet merged?

So I'll keep the previous interface for my test to avoid introducing
conflicting patches.
