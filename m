Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB222D94A1
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738796; cv=none; b=D+LGNBpI4hbmGvoHJwNYavr11aELZj9cTDhksQeaoLIa2HwP1s+Dsqb/Actunq9NYyIiImlQGHFNxlxBzr4+ygANJwWWN+jYBGWMzUTHMAD2QqFB7JkUKdjMAW3xVyCE6mZWxmS35pdBr9e3XdXhGQbm+2h4z0uJphk9098T7LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738796; c=relaxed/simple;
	bh=Fc0UFyAJPOHXd8iFvnomarrioEoDN8IWc8z4Jero9E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQ1jdLC/So5Cgniux6NSR1XDRahY9PYw1zJCe/PpDx1Aee22/cCLSbtxw2zcX39AE2yQ8Cum31SLzNR3mxW1N31jn51hLUkDyOgogkElzBmm1mVN2BFGrWUeA3dC9snH++LS1zJIz7tjSFIWcNTdi5fRyU0kwTuwBPOnjCTHX4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OM2QSoR4; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OM2QSoR4"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc0d28903c9so130179a12.1
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 07:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763738793; x=1764343593; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjIFdUaCqy+lAqlZ5vMNsJsRQN1poaYwAWhq6QbVcTs=;
        b=OM2QSoR43HRqPwZiXQIjHwk0kWHcmbBqZphKLb/qb2aVHoVAaKqJ0glwm/DusY7pDY
         Sh+CEZlKdnBRKrn7inAfd+gy/6AXcQ/99N+r6odLe/wbjZDk4s6Xzjj5/qg50jAeBGtC
         lU6vr60HE0CaABMTavfWS//houTP8bhqIOgJi9Q0rOwl9L6yVrtAVOVTUslsBXSiACu+
         AQCRW4Y1ge7AS6rHNwTzZkNynal6hJtUqduIHDlhKP9W95sxXTLNlmHGWY3T9lBoBQvn
         1hpun/vwG4kCVNgc7AQdz9bfXyMN7IjrX4/KifZ1NbiYSHlUY5wenbCRiYNFPt/nYRYV
         O69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763738793; x=1764343593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjIFdUaCqy+lAqlZ5vMNsJsRQN1poaYwAWhq6QbVcTs=;
        b=RnwGZrL4iwjH8fPmMiE8xXmtYrnkjUjjQFaR41hZBplBZsgu2PT4rAyxdyCG5UeYA3
         b/dA0OsQgsYw51cga95suzzVphYQUB/qPl4HK3yFOZ/K77BY6MAfGMPjFFYgezmXZeap
         0wvW/793vh0bHCv/hU9hhVnoma/MlB5zMScsq4XBWObRigF4a0wtZkM7jaO1AwY0bkPQ
         wV+Kd5EkPYeXPLDqUMsfDM64Ht+dKAEKhy5s6tMLy3h48QJdXCFZn/9wdIp4sIqWVZVJ
         SM00yFhnoXBBeKEZd1ZW2IXpcjWEq4bCuWW+4KkhM/OEHeheGXpT2TD9t4u6AB4FagOG
         KPZw==
X-Forwarded-Encrypted: i=1; AJvYcCX0UfHlRazI6vB72YJnBEjgA2AJ9nCr+GHHRj3kprH3JI/CRlc9V8ZubKiLuB1BFgjl9zd8@lists.linux.dev
X-Gm-Message-State: AOJu0YwzgTI/4qodvcj3UbB5075KzApwKWryR2lP4DyatEcQ8a6TdZZb
	+U4bT5yx9qZMJOxC2lymcdTZeZGzx6vDAd63zNwrw9zxpAanxJs00doclIXhz6ii4aWUtQUbn3W
	yRpAWGGRyS2DjfrOPzJTqdn2Vnarq/tU=
X-Gm-Gg: ASbGncuMoRD3Z9Z3HLOPP2j3+Gk4kn69GYnSyjsXB5EDRRck6snmATvQwiCYHarv1yH
	Fh8/qHm1Vk56aDOcuDw/Tfo4iRxaB4bTJuw+V3HKHQe9hHMTXUR1EW6sUbirQTAkBsIKHCvNdHk
	EFtvHCgmue6Sgb7QxczQCxmogX6O8g5U17xkVXPVymICpIKZDc574kligZ0uDrpUNrhl4FdJJll
	aPGIRRVIpDeAikWMkrXRJyy3DzV3RqNHQ9JeAx8nOM8DGUJOfv8UprAdUeMNEUiE2Hp962eBctr
	s2KFO/LV/N1p/qdJosS9N2o4D/5UhylOe0gPT5nNdIrBuwRqchru9Rqt8ifiCnzEEJC+H9/BPW8
	i/U7tjJLuhmjksfane0tMeV/W
X-Google-Smtp-Source: AGHT+IHOs0uUfs3Z6vGsVjFS5NcHMrZFn4kosecnYtyBzSBHGeS79+7FxbCpD6jPHvFnr+pPnm2ZtoGuYa6SN8la/WQ=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr656988eec.2.1763738792718; Fri, 21 Nov 2025
 07:26:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210649.lhQnt194-lkp@intel.com> <aSAriWs68Hlng-nS@google.com>
In-Reply-To: <aSAriWs68Hlng-nS@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 16:26:20 +0100
X-Gm-Features: AWmQ_bkpV4aJnfnvrtjBjUInHbv3MgtOpq0bndT0SvEQtlrp6KG1Zd9pD74Lni0
Message-ID: <CANiq72mzcvFrTXkgqcJVVrmSy-Z=69oz31KxuQicinmaodCyBQ@mail.gmail.com>
Subject: Re: [linux-next:master 2964/10599] error[E0609]: no field `dev` on
 type `drm_gem_object`
To: Alice Ryhl <aliceryhl@google.com>, David Gow <davidgow@google.com>
Cc: kernel test robot <lkp@intel.com>, Lyude Paul <lyude@redhat.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 10:06=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Perhaps this config is just not working in general?

For context (copying myself from another recent thread):

    x86_64, arm64 and riscv64 should be kept working, and I also
    build-test loongarch64, including for stable kernels.

    arm32 and UML are the ones that are best-effort (on my side at least)
    so we play catch up as time allows, but loongarch64 so far should
    always build and it would be sad to drop that.

Relatedly, on my tests, I have also been seeing in UML:

   RUSTC L rust/kernel.o - due to target missing
error[E0425]: cannot find function `dma_set_mask` in crate `bindings`
     --> rust/kernel/dma.rs:47:38
      |
   47 |         to_result(unsafe {
bindings::dma_set_mask(self.as_ref().as_raw(), mask.value()) })
      |                                      ^^^^^^^^^^^^ help: a
function with a similar name exists: `xa_set_mark`
      |
     ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:24761:5
      |
24761 |     pub fn xa_set_mark(arg1: *mut xarray, index: ffi::c_ulong,
arg2: xa_mark_t);
      |     ---------------------------------------------------------------=
-------------
similarly named function `xa_set_mark` defined here

error[E0425]: cannot find function `dma_set_coherent_mask` in crate `bindin=
gs`
     --> rust/kernel/dma.rs:64:38
      |
   64 |         to_result(unsafe {
bindings::dma_set_coherent_mask(self.as_ref().as_raw(), mask.value())
})
      |                                      ^^^^^^^^^^^^^^^^^^^^^
help: a function with a similar name exists: `dma_coherent_ok`
      |
     ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:51489:5
      |
51489 |     pub fn dma_coherent_ok(dev: *mut device, phys:
phys_addr_t, size: usize) -> bool_;
      |     ---------------------------------------------------------------=
-------------------
similarly named function `dma_coherent_ok` defined here

error[E0425]: cannot find function `dma_map_sgtable` in crate `bindings`
    --> rust/kernel/scatterlist.rs:212:23
     |
 212 |               bindings::dma_map_sgtable(dev.as_raw(),
sgt.as_ptr(), dir.into(), 0)
     |                         ^^^^^^^^^^^^^^^ help: a function with a
similar name exists: `dma_unmap_sgtable`
     |
    ::: /__w/quick/quick/linux/rust/bindings/bindings_helpers_generated.rs:=
1339:5
     |
1339 | /     pub fn dma_unmap_sgtable(
1340 | |         dev: *mut device,
1341 | |         sgt: *mut sg_table,
1342 | |         dir: dma_data_direction,
1343 | |         attrs: ffi::c_ulong,
1344 | |     );
     | |______- similarly named function `dma_unmap_sgtable` defined here

error[E0425]: cannot find function `dma_max_mapping_size` in crate `binding=
s`
   --> rust/kernel/scatterlist.rs:356:52
    |
356 |         let max_segment =3D match unsafe {
bindings::dma_max_mapping_size(dev.as_raw()) } {
    |
^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

Cc'ing David amd UML maintainers and Rust DMA team so that they are aware.

Cheers,
Miguel
