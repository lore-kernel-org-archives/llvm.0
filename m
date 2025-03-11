Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3F01EDA15
	for <llvm@lists.linux.dev>; Tue, 11 Mar 2025 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741680236; cv=none; b=XMb+Gw8VC6xZpBd6iCDmMcglEMRJmi/z8JT86c2nv24ddwaIs5i17OUKQQQp0NrAl6y1rp1f1XXCwi2f8G7b7piBR99z/zX//q4Ic7M+jppk4ado6s4xGuq21+PaPDdsO0E48nB2XzpulYuC//qc0bapfW0LfLvSMAzF2AT3i5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741680236; c=relaxed/simple;
	bh=2hLZWnCv2EtDgjR8+K6vyZNyIgHxNMcWJXvdlO7Zh1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hFrE+c4f3WlSMVAINK+KvsBmBU2CtPQcNK2rXm/BW4kFqaipMeyhJJulZ2bOGx9s/JjuXqxN7TJPSC+SdbPzPG30CzYSEgtH3LBi1OhabNYtol9SgbMRH5kOXaJGSSJFJSwi+FR0WMbQlsCSS8M3v6LDq/DQAc2fONhtu5PdHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mT2G1Iuz; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mT2G1Iuz"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d025a52c2so3488585e9.0
        for <llvm@lists.linux.dev>; Tue, 11 Mar 2025 01:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741680233; x=1742285033; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hLZWnCv2EtDgjR8+K6vyZNyIgHxNMcWJXvdlO7Zh1s=;
        b=mT2G1Iuzjp/VSZeMomqfCfdKx816fCcYHXf35c4/rXiqAZ0+5yGQX0rhzTeYtafMLO
         vUnL9j1Ur6YVoYf7l1y7g5QZoeaYekGBdpLpqatJAV0z18p16VvxSk70NwpFYlqTVYLi
         gPRxN+cgLEpLY5T6NWLaBG+YmfnXduXFKgTjI6EtFhVE8ytDPCs7rlNCkiyjXq+5RPM4
         4LB4A48hbuLIaT+YKAziNbg04dOU3qPxCXTFQEivfnlkuOUly5v/CtzXXRmXW2IV3vkZ
         +AZCXNJi8P3SLwdR5i0A6wXBXf+HYPPOXEpYiMDLpDtmijghhnq5wegDamGncrYZg/lb
         a7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741680233; x=1742285033;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2hLZWnCv2EtDgjR8+K6vyZNyIgHxNMcWJXvdlO7Zh1s=;
        b=YCoGspt1SbUsur01CnMWw8HV9MruVBI9UxMf9/ybRh2vu2utggMLkugFLmf7Z7nnks
         AwTZn2h9HJQn3LUppH8tl047PSvIcHwXRan1wi1a4FAqWh/2yjP/JAq4IyE1zk1r2xDq
         4O7Jjr13tioJSWvA8MfOmAvGBaXq/xTdIri7UejVxBehbg77Yxul3PtS3Rb/89fAjxW+
         GWCe9zaB1YdGmGzw/b5VIwFiaR66H7VLLwLxzsXOTveUv0uP81fdzMTD98L+wTdIEPr6
         5j83JI52cY4tHCprkFpE9/sjrP3pD62GgKw1yeEhreZONQra+EXPycs9WR1TD6AWJEbE
         PUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT9anLpuesvKbd3tQirf5Ntwgr0mIRFbvjsxr5nOpM/mvnpf9xMplKH6cjomBSO08MPS58@lists.linux.dev
X-Gm-Message-State: AOJu0YxK5REllzPvEBumzdeY/Xlq2PJloxGOmiYF1uucypvubGQhnv/6
	erX3Im3o1D/qVgSIbze8eimyl3ChYR0Si+3yoATIuPQ08O4qCx04XI83WssgDJogPEc3KJZj7Cz
	Za3jNDtPz5y42kQ==
X-Google-Smtp-Source: AGHT+IH2MIRvfpH4CFKMRuL5h1TKTG/FHun9wu65UOLvGgc4pnBQqob4uGqZMxl5J5g5i+cSWeiIdjJ5Uemv4L4=
X-Received: from wmbay8.prod.google.com ([2002:a05:600c:1e08:b0:43c:f482:222])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c9d:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-43cb91c5830mr108693685e9.3.1741680233073;
 Tue, 11 Mar 2025 01:03:53 -0700 (PDT)
Date: Tue, 11 Mar 2025 08:03:50 +0000
In-Reply-To: <87725b0d-42e9-4273-a51f-90c82aad2254@posteo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250310-inline-c-wrappers-v1-1-d726415e6332@posteo.net>
 <CAH5fLgi1YOP9gbXEmYfBtjWeMaqsYpNrrC1fd2rGABCKWYVcbg@mail.gmail.com> <87725b0d-42e9-4273-a51f-90c82aad2254@posteo.net>
Message-ID: <Z8_uZnW_0T24z1sn@google.com>
Subject: Re: [PATCH] rust: task: mark Task methods inline
From: Alice Ryhl <aliceryhl@google.com>
To: Panagiotis Foliadis <pfoliadis@posteo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 04:09:09PM +0000, Panagiotis Foliadis wrote:
>=20
>=20
> On 10/3/25 12:23, Alice Ryhl wrote:
> > On Mon, Mar 10, 2025 at 10:40=E2=80=AFAM Panagiotis Foliadis
> > <pfoliadis@posteo.net> wrote:
> > > When you build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> > > toolchain provided by kernel.org, the following symbols are generated=
:
> > >=20
> > > $ nm vmlinux | grep ' _R'.*Task | rustfilt
> > > ffffffff817b2d30 T <kernel::task::Task>::get_pid_ns
> > > ffffffff817b2d50 T <kernel::task::Task>::tgid_nr_ns
> > > ffffffff817b2c90 T <kernel::task::Task>::current_pid_ns
> > > ffffffff817b2d00 T <kernel::task::Task>::signal_pending
> > > ffffffff817b2cc0 T <kernel::task::Task>::uid
> > > ffffffff817b2ce0 T <kernel::task::Task>::euid
> > > ffffffff817b2c70 T <kernel::task::Task>::current
> > > ffffffff817b2d70 T <kernel::task::Task>::wake_up
> > > ffffffff817b2db0 T <kernel::task::Task as kernel::types::AlwaysRefCou=
nted>::dec_ref
> > > ffffffff817b2d90 T <kernel::task::Task as kernel::types::AlwaysRefCou=
nted>::inc_ref
> > >=20
> > > Most of these Rust symbols are trivial wrappers around the C function=
s
> > > signal_pending, uid, euid, wake_up, dec_ref and inc_ref.It doesn't
> > > make sense to go through a trivial wrapper for these functions, so
> > > mark them inline.
> > There's no C function called dec_ref or inc_ref? Please use the C
> > function names instead of the Rust ones.
> >=20
> > > After applying this patch, the above command will produce this output=
:
> > >=20
> > > ffff8000805aa004 T <kernel::task::Task>::get_pid_ns
> > > ffff8000805aa01c T <kernel::task::Task>::tgid_nr_ns
> > > ffff8000805a9fe8 T <kernel::task::Task>::current_pid_ns
> > > ffff8000805a9fd0 T <kernel::task::Task>::current
> > I think it'd be nice with an explanation of why you did not mark these
> > #[inline].
>=20
> Since the issue focuses on the functions that are trivial wrappers around
> c and `do nothing that call a C function` I thought i would leave this ou=
t
> since there is some other functionality (albeit sometimes minimal) other
> that being just a c-wrapper.

As far as I can tell, all four functions will compile down to a simple
call to a C function.

get_pid_ns, tgid_nr_ns: These functions have a pointer where they say
"if the pointer is null, replace it with null, otherwise just use the
pointer". The optimizer can optimize that to "just use the pointer", and
in fact I checked that this optimization happens when we wrote
tgid_nr_ns.

current_pid_ns: If you add #[inline] to PidNamespace::from_ptr, then
this is just a call to task_active_pid_ns.

current: This is just a call to Task::current_raw which in turn is just
a call to `get_current`.

Alice
