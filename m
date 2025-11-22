Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1F526ED58
	for <llvm@lists.linux.dev>; Sat, 22 Nov 2025 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763797055; cv=none; b=RjwbfU8sJp/ECkC6aT6kanZEq9zCIvZngtasJjUFuQxxQzy8ekZsNPO0GVqx8YoEopEjhmH+HB3AFP3ouGZuM4j2e9aJy/6gSfl0wblJz+BvkIEh+OizLwcmNJSwBw5fDT1LdLr/jLV0VUJDjdn/JO5LXczLYA9pJxFArjLxA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763797055; c=relaxed/simple;
	bh=3koCjdXkvafnpT6jEVh1wZykoAgCZIwu7REyUgD2Vzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K3QZn0GHLL27OpDbIjnC7EIW909lemJdbocygplkMot//ODFpLlL+APToOLoV0yliytQMXDGaJIZ9NPMuf1on7CLTyxPWBmmPLDRU/76WjqdWWdJBtKJ8Kh53Byjbu9ZDwtMJERdmVF6lWnJs9svYVyAHdt70k2uwlQilv23mA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w5B6lW7r; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w5B6lW7r"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8824ce9812cso31026156d6.0
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 23:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763797053; x=1764401853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV4GqWospvbrtUSnzynHACYrA/GyrRRftwngY7+lrAE=;
        b=w5B6lW7r2NdC5EVXIjLIUERsRvZsja1fCkmAutz/HzCFHPnbppHSxmqGrfCXvERj0S
         dJ+3j5yU8rOA3uwBdui9Eu7cfN0WYUkDKBYJc449IAhfRCB08ZYEZrUoW/WIeiKVRosL
         mFTYxPIEuYT5PTF3NHhS2ffDnSnZFxoMdFaGnaHFx4b4ChMnU9B0chboUfci1fv+8LLt
         MqeRpGj8ibb6nUD8xAV7Fp6ypVXcpvJTzp0YPkjhcB3zcXD7IwtI5CL9gZ9b7MCeVoC6
         qBetTpKO7ffHzagkQSUOwaCtIH2Sfl3e+LqazDFzVqvqYiWOLi7AGWHAUiNlj4WO3n45
         SGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763797053; x=1764401853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yV4GqWospvbrtUSnzynHACYrA/GyrRRftwngY7+lrAE=;
        b=H1yT342SzcCowOUBIoWX03aGnDo64NlWl2NpX3BYcTuuiRVOhtdvEbP+kYhhwY5MSw
         ZwdrzS6u1WhWL77zmtaNWrZkyR8jbvBY2ZyxRZ6dWbdXK+n4LUlSBNR/v8jP6TyIdDCg
         ezqMbYPHfwA4oVLOgpAILaRL84nGu6S+m92rgPtPNgT/w0Py4RBAUcVxiSIOAB9JSWE9
         UaEEQ4VwmTfZmCiiWkY8hqM18h6IgH6yaUd7nbjl4w5DF6klPITw/8lkAHFv8nh+BF5D
         XEYTqb0o5cQdy0BkXtwz4dgV2MsyhZ4YvuUugv8MrAgi/bg5JiKei5xhx5St5U7m0n7H
         Ekmg==
X-Forwarded-Encrypted: i=1; AJvYcCVK+Wo6cnmCTXZZvCm+PjFxT/6ZKP1TaT3Iq/XSzwcpy11lKCsZfpve+ieh1ezjDMLGHZ4Y@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfpz6Zyq8S4IFJeIqNg/HEy01NlxgRTLKHgjtn3ObgZwa0F3Ew
	PqVQ94ZTCiXvBAYW8nt1UoIoeifll+fgDjJFjihZiQRHG11zQDh2kS1n1k2qOTfMPh4Q6TbOtUl
	otGlFSnLqMZ1yMZ6ULymkMe3PTtgvBaNCsGVqbEEz
X-Gm-Gg: ASbGnctQhfZ0Dvb8q1pJNw9GJwaf502HI9bvTJSZpDoNWLtjWBrXIkr0zgSTTFRcFNS
	vOtfca1Om/470UK6UzBO/UAq6X25JOqR4d7uFIvH796lg1vLm1XJjdef5mddXzvtxHTXbsvQqkL
	/W91ASMYau5uc9jMrPuc+pV2x8neRquZPwpaNqGG+vCf4JS9qybRBoSSFiSgSzT++weehCnlysz
	47BpfZaol7XIjYAJpgxKrmojgZzjZwfRfdpMPpTn+sFlVgZn/tJ+9VB4hWvPi5dkTwUTg==
X-Google-Smtp-Source: AGHT+IEwPIhiknra0CXPiFnVyqZAHRThMZsJsztbTCo4AfutieyYvGR3bpwXMchvz+kxSR4Q3Mnt+sZgr0hoy96Q86E=
X-Received: by 2002:a05:6214:c84:b0:87c:a721:42f1 with SMTP id
 6a1803df08f44-8847c535a4emr66056936d6.52.1763797052760; Fri, 21 Nov 2025
 23:37:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210649.lhQnt194-lkp@intel.com> <aSAriWs68Hlng-nS@google.com>
 <CANiq72mzcvFrTXkgqcJVVrmSy-Z=69oz31KxuQicinmaodCyBQ@mail.gmail.com>
In-Reply-To: <CANiq72mzcvFrTXkgqcJVVrmSy-Z=69oz31KxuQicinmaodCyBQ@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 22 Nov 2025 15:37:20 +0800
X-Gm-Features: AWmQ_bkowa1YrvmpJ0yRoKpk1URLnjI6MEucWtYOXgHxKfz0TJsKMQ2PLm0k-k4
Message-ID: <CABVgOSn7bkTY=H_xOXWUjaN3xcenoKnEj7zd1=C0UKwBQBSMDg@mail.gmail.com>
Subject: Re: [linux-next:master 2964/10599] error[E0609]: no field `dev` on
 type `drm_gem_object`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, kernel test robot <lkp@intel.com>, Lyude Paul <lyude@redhat.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Nov 2025 at 23:26, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Nov 21, 2025 at 10:06=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Perhaps this config is just not working in general?
>
> For context (copying myself from another recent thread):
>
>     x86_64, arm64 and riscv64 should be kept working, and I also
>     build-test loongarch64, including for stable kernels.
>
>     arm32 and UML are the ones that are best-effort (on my side at least)
>     so we play catch up as time allows, but loongarch64 so far should
>     always build and it would be sad to drop that.
>

The short answer for UML is that 64-bit should be working (though
unless it breaks the KUnit configs, it's very much best-effort), and
32-bit is much more likely to break. A lot of that is due to general
32-bit issues which probably affect arm32 as well, but there
definitely could be some UML-specific ones as well.

The issue you're seeing with the Atomic{U,I}64 types, though, has a
fix which should land in 6.19:
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=3Df7=
4cf399e02e24c544b0bd4b1fe8fa2c5ae30b18


> Relatedly, on my tests, I have also been seeing in UML:
>
>    RUSTC L rust/kernel.o - due to target missing
> error[E0425]: cannot find function `dma_set_mask` in crate `bindings`
>      --> rust/kernel/dma.rs:47:38
>       |
>    47 |         to_result(unsafe {
> bindings::dma_set_mask(self.as_ref().as_raw(), mask.value()) })
>       |                                      ^^^^^^^^^^^^ help: a
> function with a similar name exists: `xa_set_mark`
>       |
>      ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:24761=
:5
>       |
> 24761 |     pub fn xa_set_mark(arg1: *mut xarray, index: ffi::c_ulong,
> arg2: xa_mark_t);
>       |     -------------------------------------------------------------=
---------------
> similarly named function `xa_set_mark` defined here
>
> error[E0425]: cannot find function `dma_set_coherent_mask` in crate `bind=
ings`
>      --> rust/kernel/dma.rs:64:38
>       |
>    64 |         to_result(unsafe {
> bindings::dma_set_coherent_mask(self.as_ref().as_raw(), mask.value())
> })
>       |                                      ^^^^^^^^^^^^^^^^^^^^^
> help: a function with a similar name exists: `dma_coherent_ok`
>       |
>      ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:51489=
:5
>       |
> 51489 |     pub fn dma_coherent_ok(dev: *mut device, phys:
> phys_addr_t, size: usize) -> bool_;
>       |     -------------------------------------------------------------=
---------------------
> similarly named function `dma_coherent_ok` defined here
>
> error[E0425]: cannot find function `dma_map_sgtable` in crate `bindings`
>     --> rust/kernel/scatterlist.rs:212:23
>      |
>  212 |               bindings::dma_map_sgtable(dev.as_raw(),
> sgt.as_ptr(), dir.into(), 0)
>      |                         ^^^^^^^^^^^^^^^ help: a function with a
> similar name exists: `dma_unmap_sgtable`
>      |
>     ::: /__w/quick/quick/linux/rust/bindings/bindings_helpers_generated.r=
s:1339:5
>      |
> 1339 | /     pub fn dma_unmap_sgtable(
> 1340 | |         dev: *mut device,
> 1341 | |         sgt: *mut sg_table,
> 1342 | |         dir: dma_data_direction,
> 1343 | |         attrs: ffi::c_ulong,
> 1344 | |     );
>      | |______- similarly named function `dma_unmap_sgtable` defined here
>
> error[E0425]: cannot find function `dma_max_mapping_size` in crate `bindi=
ngs`
>    --> rust/kernel/scatterlist.rs:356:52
>     |
> 356 |         let max_segment =3D match unsafe {
> bindings::dma_max_mapping_size(dev.as_raw()) } {
>     |
> ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
>
> Cc'ing David amd UML maintainers and Rust DMA team so that they are aware=
.

Hmm... this is interesting. There have been a bunch of issues from the
last ~day or so on UML which seem to come from things which are
missing in bindgen bindings, including some KUnit struct members, and
some to do with `vmap` members in DRM structs. The latter is a
somewhat nasty incompatibility with a hack to avoid conflicts with
libpcap on UML, but I'm yet to reproduce the others (including this
DMA one you mention).

Certainly, I can see dma_set_mask and dma_max_mapping_size in
`bindings` here, so I don't know why they'd be missing.

Cheers,
-- David
