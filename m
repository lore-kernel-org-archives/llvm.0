Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C10A3E51E2
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 10:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886207; cv=none; b=qpnLqk+OkdkPJXolRIKa3MHBQBxjKN2pp0fFIVYZ7XYidQwmdqZQAyjN2139fvVxcIGS6m/a6zvrvQhR7WEFtWOQzAu5hdNePjqi4wYF45k875hzOwguz/pfFuxND+SVoWvNfqr2MAANwvPf6jJ4NX4tQwpTKJ5Sj2FnCUS98oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886207; c=relaxed/simple;
	bh=wx1YOW8KjXNuf+3dwHeKK50OdpSvPEga59yBXcRepkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaZ8CppxI3PCG1kt/KIylGpjS3CbJzXWkUxYr8V96URipUXayMXoILWUziY1zXQm1NN/0lq4zRFTpKzg4DgxAMqLi15NCjwWjJk53dz2/50j0Frz2MYw9BOpqaIGdwEAScp+EDOFWoquesxgW25H4nX3hsPqSS4Qxa1PfyoPAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uvqR9gJ5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uvqR9gJ5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso557393a12.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 03:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791886203; x=1792491003; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LzdhV9lB9qXueovv0WwaiOHszHStN4aVPEcvSiAOmLE=;
        b=uvqR9gJ58AiIIhyf5ROYgOEb9dMvCEoXqpEJbTbG6Cpu2eJC8q7aR7dPkHLbGIT9Rk
         N7a8fMnEDp9YA1EH08ocvoJx3Dd0vMAFubKqNaDQxM5breXjZnX/BoDpXrVNVBLbjbmh
         C/aroult/4X4XhEIsDfkODN5bSnqKqe7MGyC8Zlq6AtINuvSdV3RDgSUpTGprnklfrHt
         Iz8Eq9T6UoAVXsASBQip4bQM0reY0F96Q13nBvxQJ/YKyimsZ37f4h7Z08JcPFXwp0xP
         Fj2EYnCOKdHDQD+d+VUa68xy7iEqaM8w6hGKLYaBmlClv3yZJgY0E5CHvU+r5g7Oi3Sv
         NNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886203; x=1792491003;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzdhV9lB9qXueovv0WwaiOHszHStN4aVPEcvSiAOmLE=;
        b=Q+CAclNc2V4S8YtffTW2RYsnkGsmeaBauNC0mEtA4Va39fcEftMQO2iCGGjsFhe8cp
         U2q8JTlu7dCCvTeG/Ojn0oHj54K3C1lyCDRF9qzcFlUVG1S8AVvkoRLJ7EPK/UZgGARz
         2Kt6QzUiFGsD4oZNb5Yps9THbm2oFGVephgTA0jjZzZc5LF1PklLmCMkGLRg41g5KwXu
         3hbuIIh7o/18m0d5qcyG3NWIzrwdZoSovev+Wosjzfx12fS0Jp+Pr+bxNoj63v2JwdCC
         gXMDELIollboAZ/1AapuA/Shni27P9LgPS8rKdveQg1Xt5SNjUKqWFmoQeG07oSLKV9M
         pIWA==
X-Forwarded-Encrypted: i=1; AKwUvBykymuqyNWWohA20C+7SxkRybaFCriQY+A+wdhJSe3aPUuV67HUIIU3gsbfm+mS1d+zqqKO@lists.linux.dev
X-Gm-Message-State: AFq9FYKi2HFFMmBn5VLuSUwVIqERpM4zgZ9W++ltVOUwR9RjdyENPosc
	coQHFUHe/SR7JQAEEDFlADHNoMcXRaWMrAYoZ6N0aeb7U2ksMdPwaHoak8EhKieTvQ==
X-Gm-Gg: AYBFou2yHEX9Ekpb7fklzbBi8qRw4ZCbjA/SZufWVBorOZ//7LW++iR+u7vWDCaB2Rb
	Ou2ANJxfbBrWAegh6rGky8hyRFmc9hPXp2XaoKzvcriUGuFM9ULr5qzcF/J3OlN961aSdQJPXis
	CeRrzj3CJs/llAM/XP7gQBaO8ablK1fBITOPolfXmDagbMdCv5UaDcDyuafrbQ7nv+pVtuTo6hA
	3N/wJ0mS6gKgHd+OpvdTN2rKKl/rAttbRfBYZInNQhnOBU34FHTFIu2B3gajxuKKgza+uBzC8Lr
	SvpTeMCf88gZukX8JX79EbdBcWQUaX6M1Ty+FRjiBPpztoOF8LcU0eLGdmpeaqD2aC8289rr/yp
	JetemayY21YY7UBNOXXZy5KqNIlvUYYXIuBkPoDKDHseiCuOp9x8eBQzATanusOniUwFH0BXuBu
	KSiQKXM4728gckiyLL8xhP2DUDjHEVxt+iOaT8awGhamn1e5Df/fOrnZ5BWeicou914gaE3+WvT
	MGEud6p1YOYcPXPiHdstF3Kr0U8YBGfXk84Y42jJMZj
X-Received: by 2002:a17:907:7f86:b0:c2d:cdc6:8271 with SMTP id a640c23a62f3a-c31a702da86mr1287920466b.13.1791886202849;
        Tue, 13 Oct 2026 03:10:02 -0700 (PDT)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dffb9fsm6059106a12.31.2026.10.13.03.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:10:01 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:09:57 +0000
From: Marco Elver <elver@google.com>
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Yury Norov <ynorov@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
Message-ID: <as4DdRqFKxuJNDnS@elver.google.com>
References: <20261012134159.912183-1-elver@google.com>
 <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Oct 13, 2026 at 11:38AM +0200, Alexander Potapenko wrote:
> > +        // SAFETY: `probe_console` has the signature expected by the `console` tracepoint. Being
> > +        // part of the kernel image, it and `OBSERVED` outlive the registration, so there is no
> > +        // need to synchronize with in-flight probes after unregistering.
> > +        to_result(unsafe {
> > +            bindings::tracepoint_probe_register(
> > +                &raw mut bindings::__tracepoint_console,
> > +                probe_console as *mut c_void,
> > +                ptr::null_mut(),
> > +            )
> > +        })?;
> > +        let _unregister = ScopeGuard::new(|| {
> > +            // SAFETY: The probe was registered above.
> > +            unsafe {
> > +                bindings::tracepoint_probe_unregister(
> > +                    &raw mut bindings::__tracepoint_console,
> > +                    probe_console as *mut c_void,
> > +                    ptr::null_mut(),
> > +                );
> > +            }
> > +        });
> > +
> > +        let worker = ctx.clone();
> > +        workqueue::system_unbound().try_spawn(GFP_KERNEL, move || {
> 
> I ran this locally and got the following warning:
> 
> [  623.232012] workqueue: work func
> _RNvXsb_NtCskctMpSfuwL9_6kernel9workqueueINtNtCs1G77UTwpz6o_4core3pin3PinINtNtNtB7_5alloc4kbox3BoxINtB5_11ClosureWorkNCNvNtNtB7_10kcsan_test5tests9data_races_0ENtNtB1d_9allocator7KmallocEEINtB5_15WorkItemPointerKy0_E3runB7_
> enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
> 
> Do we need to use a different workqueue?

Looks like it, and we need this patch to use system_dfl_wq:


From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 10:05:52 +0000
Subject: [PATCH] rust: workqueue: add system_dfl()

The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
(commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
system_{unbound}_wq is used")).

Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.

Signed-off-by: Marco Elver <elver@google.com>
---
 rust/kernel/workqueue.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..e46d3acf903d 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
     unsafe { Queue::from_raw(bindings::system_unbound_wq) }
 }
 
+/// Returns the system default work queue (`system_dfl_wq`).
+///
+/// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
+/// are executed immediately as long as `max_active` limit is not reached and resources are
+/// available.
+pub fn system_dfl() -> &'static Queue {
+    // SAFETY: `system_dfl_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
+}
+
 /// Returns the system freezable work queue (`system_freezable_wq`).
 ///
 /// It is equivalent to the one returned by [`system`] except that it's freezable.
-- 
2.56.0.385.gd3acb90ef8-goog

