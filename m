Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD59E48C8C1
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884330; cv=pass; b=VIlht7QiMnWjyFSWw2PBQPtnGHjP6wTXt7Wsi/Pznvn1nldP2KylsppU30yAdSO8rcVrirCaZlRdNBG+r69qOxhrm/U9wc98Qa/ez6Spvo6NM1YktJP6liwaAYN46Q56b44xMAJF14eW30DDBovn4KTsGMLtHcxU6Ae/gyREhh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884330; c=relaxed/simple;
	bh=8mVe66GEzd6sAkunACXVynKdmNft5klxWxxBXtRex2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9LNhDi1fOAte2t4NSa3HLwZYC+Lcogsa09WER0zSpupL5hlw04n4FRyYZmVAON4vwb9ekuiHNRVOcsYbdT0+be1DgEs3qCxJLIoTtb17QSWp8WVNKhhNDIREDpuW8pXp9KvJ3cc4JYW6T3KznT6o+6zUs3+CfOZ1BbUSnmQpAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oXSeNEeC; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oXSeNEeC"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-157fe9d771bso684359c88.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 02:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791884327; cv=none;
        d=google.com; s=arc-20260327;
        b=SlX9rjBoLwLQqfhd+DlR/GgVRfBz04KGtA9g4nIn8p3bi8gVnmUU3XsddIeoLh1s3O
         o5uiLDiHGb1P0NYdmFmjfMOu+4gqVgmoez0vddzzftuwgsikolQgOSRCqdaAhkyYLsn5
         w2fFoyNIoqqhmEgAPqKeG2CcQCrhzCZ1BSMQMEzdutkCpw2Ug9YMRT6D/44YNGJbu782
         Pah7VWSxb12/miwZMkS234UETn1DN1zwrolB7tTNXBq9fFIrbDIhZOsg+rxGAx/IzQXy
         K7YU52B+bMsnrnQ8y6z4ZLKV5SQCs/rOgxfqnstewq6aKbxHd2JuPOg42j8Uko2a+5P0
         J/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hjiBRpMUG3UtZRbPmQwOuJtx4+jqLwpDEaQOQPQts0M=;
        fh=teTJ3EfjV9cLqcbPKxjsrlxj2FYNwR/BXAJVGvs84IU=;
        b=LhjtmPNKtKce7J7c0bb79JOdjNjhJTfBSjH97AF+SegqkFiFhFxY/P0V+udPzmeFJm
         Y4nTIu1jsQrX+k7zBrzQYwTVCUmhBTcf41T5rw/L+I3+R37u6D5a8ZQSelejjozJo5cz
         MjjNQiGbkLMnbTh9Y2l3fEMRUhCy04vF3TEnruzUFGMPNxiMnH1q/movKBHRfjqDmcUz
         hfQv3gsPHUZHBFzVRMEj64O6ckqsjZRb9/qEavxS72+h49EBTGk46WXESDfoew4Stdbx
         XI1VOvUUsanMLCWGLi3JHtIViR5i7FGFhkhm5xF7p0UdyJ/OmiIYQea7NCFaAnpffdki
         u4IQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791884327; x=1792489127; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hjiBRpMUG3UtZRbPmQwOuJtx4+jqLwpDEaQOQPQts0M=;
        b=oXSeNEeCfKiDxm/NLo3OUA1falUrHPs5M3zm6Y5ai9rBuccnzFs5tcM0IDV8qtzowb
         JB4A0WZXIzbMxhkQXahB8+6NC7T68Wa0C6VLQhF4XlWwXCn/iavtQInPBRtvekD/jZJh
         E1Q1ynoredbhHHAQaESNKhKN5dI0sSTznFtUafSzBkT/dLEJLbAEbarSahp+lT3Xv/Q3
         4B6W2qsrYnPI9Wy/95jWKRvatMrZaV8ORgH86O6MH8tK4/CYeUTZ5kgivSjsIyLoK3zH
         jnGq/G3S7GZdfMmXhqXsSj2unofxWCMlkCny090k4MvqfkNG2lqnOtl+zBmdejgr2hbB
         uFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884327; x=1792489127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjiBRpMUG3UtZRbPmQwOuJtx4+jqLwpDEaQOQPQts0M=;
        b=MiKpAVJkENdOr0KhBfJHutxkKng2k5/uLNqOK8SuY+/C3J4AU9Ai0+Z1eLlTxR3l8d
         WTcfEtBjlI5FHYbVB8qxuC0dYaqRkSUjxD/FyFLPxgmCqNQaKsW0mHUqAPNmqX5X8f6u
         9lh/gAmSd39Vlp21RFiz+fb0FZhDMdpZQW4NoLE6VhDtspIjRQWI1VwVNeKdgU5pk/eg
         B5wNx5tO3K8TflVaYB+pDYC1yhbJCaz7+bK/4G3M5vlgonF/WfmzMGIJrseWc+BGL3tk
         GYnOEoUZ8b9Upt0uIQNtwXu/8Y3foEN34riE31g/JH5E2ijnPMmw4NTvaNnarW0vN3rE
         /d2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyzT58vGP4n5U7RlK0OcuJ09V17gqh7G+bGHt+iDMlrtMIZP3I/mps5qdDE6U+oXtqSgb3@lists.linux.dev
X-Gm-Message-State: AFq9FYKMGT+UAFB6yQM0ezRfdXMSoJZquQ00bZr7XZXD2QwIg92BusXU
	M7rpU+TBohr0SBpdVJ/ZtlHiiAja7fOTvmfTZl5DQzIkEXOo/w2XWZ2qnqWbdQWKG231Zh7fmMH
	beGWIKXxDB61OTi7ViYyDMVbnWgIMYgypuZAvjFth
X-Gm-Gg: AYBFou1+5q0FcgzfeJ1Qz/StEJPwPDT2nOwcGTu8LN2MdST3JyY00UImvHxMiOs9gcT
	kO4IMTIfAsZ6kCNwgd0aWWJmljl1ZwrvwphJf7zwr5+75GU79aMxY6Xm8EYcVmPqLf0Kf6kqjcU
	gLlG3NjK1925R0hVkFc53J5yoeOpOdt8t9pL6HeurZMon82Ej9lBrNM2ir4XqhfsQqGQSgyw7y7
	BJdrCmSzWluX4RZh4/XNdHdDMeCdKr6JOhn+/1z9D9eRK8Jceouidyb9nTuNCatiRKIJJwXO9Nt
	l4YPg1ZWcDGbbltFrOJg9AthrbnJG54IV7Ks9J62Qj5lzG86FCY2uyoJn64OaJzOtR37NCnBBot
	UF+0qxSN4WQ==
X-Received: by 2002:a05:7022:3c89:b0:164:4e36:f956 with SMTP id
 a92af1059eb24-16a5dcf688emr13638519c88.16.1791884325804; Tue, 13 Oct 2026
 02:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
In-Reply-To: <20261012134159.912183-2-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 13 Oct 2026 11:38:08 +0200
X-Gm-Features: AclHuK_RWeXl8fcFHu9JpahURaqcaQuQAyqWtIrLMC7fvirHYIMspTeFsZ9obG8
Message-ID: <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

> +        // SAFETY: `probe_console` has the signature expected by the `co=
nsole` tracepoint. Being
> +        // part of the kernel image, it and `OBSERVED` outlive the regis=
tration, so there is no
> +        // need to synchronize with in-flight probes after unregistering=
.
> +        to_result(unsafe {
> +            bindings::tracepoint_probe_register(
> +                &raw mut bindings::__tracepoint_console,
> +                probe_console as *mut c_void,
> +                ptr::null_mut(),
> +            )
> +        })?;
> +        let _unregister =3D ScopeGuard::new(|| {
> +            // SAFETY: The probe was registered above.
> +            unsafe {
> +                bindings::tracepoint_probe_unregister(
> +                    &raw mut bindings::__tracepoint_console,
> +                    probe_console as *mut c_void,
> +                    ptr::null_mut(),
> +                );
> +            }
> +        });
> +
> +        let worker =3D ctx.clone();
> +        workqueue::system_unbound().try_spawn(GFP_KERNEL, move || {

I ran this locally and got the following warning:

[  623.232012] workqueue: work func
_RNvXsb_NtCskctMpSfuwL9_6kernel9workqueueINtNtCs1G77UTwpz6o_4core3pin3PinIN=
tNtNtB7_5alloc4kbox3BoxINtB5_11ClosureWorkNCNvNtNtB7_10kcsan_test5tests9dat=
a_races_0ENtNtB1d_9allocator7KmallocEEINtB5_15WorkItemPointerKy0_E3runB7_
enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Do we need to use a different workqueue?


> +            while !worker.stop.load(Relaxed) {
> +                racy_inc();
> +            }
> +            worker.done.complete_all();
> +        })?;
> +
> +        let start =3D Instant::<Monotonic>::now();
> +        while !OBSERVED.load(Relaxed) && start.elapsed() < Delta::from_s=
ecs(10) {
> +            racy_inc();
> +        }
> +
> +        ctx.stop.store(true, Relaxed);
> +        ctx.done.wait_for_completion();
> +        drop(_unregister);
> +
> +        assert!(OBSERVED.load(Relaxed));
> +        Ok(())
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 4d5c96ddc49c..009efda9e7a4 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -94,6 +94,8 @@
>  pub mod iov;
>  pub mod irq;
>  pub mod jump_label;
> +#[cfg(CONFIG_RUST_KCSAN_KUNIT_TEST)]
> +mod kcsan_test;
>  #[cfg(CONFIG_KUNIT)]
>  pub mod kunit;
>  pub mod list;
> --
> 2.56.0.385.gd3acb90ef8-goog
>


--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
