Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FFC31329D
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849466; cv=none; b=n//ngHxfnk3NxegsRe8GdbXVzNDI9iTeKo992mXGF689LGQuM3BfzDSwIpDkFFVXTZGaWMPa7hnMyYOlNxWhnkxhIeztWMNFwsmPt29US7NgsRErZDZE3PbAbSm/RLpUR3PLC31ia80DwHsQFDEqqO09JJcYGr5wrtDf77AN2HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849466; c=relaxed/simple;
	bh=pphVR1kisW1rn59IwFVxryo0TAPKvUFI46MwfIkrRm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KX7Nx/wzdlljtAPKDV5fYT/iOn5ntUIEsSFKcqM/7LXBU6aJNu9dNwrmGdlNbfYq+7B+IiP/och9YgtHTlnieN0TtZDGBugcDPY88aHEWuIpBggASGrnnOvi/Bcbf6v40LVdsahfKpbFEgmtboaKWs5KB2brScQIrm9wd9/3HkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBYt4qyf; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBYt4qyf"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7ab689d3fa0so83025b3a.0
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 03:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764849463; x=1765454263; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy74VhsBG2iXSHso83Jci8BnfjXIZJpeGjIa5hx2ujU=;
        b=SBYt4qyfIrvD621N0CTw9sWykx4uilKxwyBWSMDUG4JqJMncYtO9WDJKhx8p/95AB9
         JXrDtsNFtVcGHOp4QZctj+/Eq3jtoIYsvvu+LTM8q1eWlpM7padYOD/oCOP7ce3Y3+wf
         krn4XTV3cNXW9be/2DH0t0J/TMrJzgeTjMPJ+l16TXkl7heZSJ7FSK8cRnDEn4ElmnZi
         WrrLs45sE49HF48DqcIfD+sX+pdPRNXBzYhd/h7753CfisNjv1Ixhf/HcxyBkkTtpoML
         VauNhmwiXAjPIelKmbewmNXc6IA8RG7jWdmVkcK/nDOeFNO7vPDg+kjXFXTF1k8z/J7A
         bh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764849463; x=1765454263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jy74VhsBG2iXSHso83Jci8BnfjXIZJpeGjIa5hx2ujU=;
        b=E54S1yPE6j2UHMetzQPQIp9k8s4PNtmNZRhrtKTId6qZt7P6vzervAb9e9wajZcLcU
         ZOVPQ5IpNZK/B2WHSi88GkcunlwYBPUsR1WF0WsXm7ePxUek4/KjZM1oS0UBhmemNPym
         t/OcCyDqzQLycpbjtBvH9mwRRJpbx9uYuRxpbBKpmqLxIcvdl+nWzkMp8uJk6oCajfor
         NhtjkQpoHBo6yTjP5sYotpuPRdFEWmJ6i/HgXqdmZWDlhvx4T9RfLv9EtL5IMY4GVxjp
         Y8fGCwV0vc7NXpllR2X0xtYmg5TMLGBumprQZ0VlOdO31TMDcpj0Chah5T33YPPLyhCr
         PlRg==
X-Forwarded-Encrypted: i=1; AJvYcCUB4grPU1BuaYB7UfDcBdXSSqanl0jboqDgZsOPrsxhBuw2rCNuNhUsG5ogJAQsIYUVBs9X@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx48KL9Wz9IvQSqEg/rdU2B3jfbhgJg8fOAap9AtpcWSq0zvRg
	snsOmAqs4riKl6jPIrtD5riNP+TOcuw2pdekBX/BHZnKPrDEOoa3/DAMjB50RNjiCnylyWeEYt9
	koH4kKT8XiWd9Er9nhuxJvvB38TLgA64=
X-Gm-Gg: ASbGncsP+QWgqNS3v9xGRzrAkt3Gcwu/cy87UeMB230tqGhftQgb3J7ODDz1cTAZPf/
	zWA3fRejW+z+p8Q4vwkcXtqJEjnT78VTNkRuJRMdX/azSFTfwv0cqPCTR9MKXncyo5bVRfJsfQ0
	ZiYkG6UiGLdIRM9i/1R7fnV5m9MjlxHe6TBUCA9nQ9NR6OLgUwEIvCzmLWzosRi90jFbQar1Of9
	AYx78UHyRs59KWZum+oq5eD97GmEt97euVrAxQfB/eIiS2P347O3i1u6oLzv5f+ag4q5w7fTf0N
	G49ccNh9cuTwWk2mLVQ12MuSlgoONCcwEx5TdN4Hi/7rPiVIdivWWMLT4Dl1lOdTw7cyg0cYqaQ
	WhjeUlZJz03mhfA==
X-Google-Smtp-Source: AGHT+IGeyoDrjBm9pUlwr3L1lIhuYxiVR/nMKBo3Q8beIteuq1z76e1BQfFIgP3nnV9ieQFXYxZbKA8xY2mkFTTQZGc=
X-Received: by 2002:a05:7022:49a:b0:11b:98e8:624e with SMTP id
 a92af1059eb24-11df25f6eb3mr3361650c88.4.1764849463230; Thu, 04 Dec 2025
 03:57:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com> <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
In-Reply-To: <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Dec 2025 12:57:31 +0100
X-Gm-Features: AWmQ_bndz8ZZuXxUaBe-jxDMfOtEPNEq7y8MIf5_IqbpeKBzcbrA6kGhc4U4gvc
Message-ID: <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Peter Zijlstra <peterz@infradead.org>, Antoni Boucher <bouanto@zoho.com>, 
	=?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>, 
	Arthur Cohen <arthur.cohen@embecosm.com>, Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Josh Triplett <josh@joshtriplett.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Right. Earlier I also proposed using libclang to parse the C header and
> inject that. This might be a little simpler, in that..

Yeah, that would be closer to the `bindgen` route in that `libclang`
gets already involved.

> ... if you build rustc against libclang they are necessarily from the
> same LLVM build.

So currently there are 3 "LLVMs" that get involved:

  - The one Clang uses (in LLVM=3D1 builds).
  - The one `rustc` uses (the LLVM backend).
  - The one `bindgen` uses (via libclang).

If that is all done within `rustc` (so no `bindgen`), then there may
still be `rustc` vs. Clang mismatches, which are harder to resolve in
the Rust side at least (it is easier to pick another Clang version to
match).

For those using builds from distros, that shouldn't be a problem.
Others using external `rustc` builds, e.g. from `rustup` (e.g. for
testing different Rust versions) it would be harder.

But I mean, anything approach that gets us into a better position is
welcome and I think requiring people to match LLVM everywhere should
be easier now that distributions are starting to enable Rust (even
Debian).

We have been talking about this since the very beginning of the
project -- e.g. I remember Wedson and I talking to Josh et al. about
improving the situation here (in particular, talking about integrating
a solution into `rustc` directly) long before Rust was merged into the
kernel. Even on things like a `rustc cc` or `cImport` like Zig (but
Zig moved on the other direction since then), which I recall Gary
having opinions about too.

There is also the question about GCC. A deeper integration into
`rustc` would ideally need to have a way (perhaps depending on the
backend picked?) to support GCC builds properly (to read the header
and flags as expected, as you mention).

And finally there is the question of what GCC Rust would do in such a
case. Things have substantially changed on the GCC Rust in the last
years, and they are now closer to build the kernel, thus I think their
side of things is getting important to consider too.

Cc'ing Emilio (`bindgen`), Antoni (GCC backend) and Arthur (GCC Rust)
so that they are in the loop -- context at:

    https://lore.kernel.org/rust-for-linux/20251204111124.GJ2528459@noisy.p=
rogramming.kicks-ass.net/

Cheers,
Miguel
