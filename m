Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FAB1531C5;
	Fri,  1 Nov 2024 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471417; cv=none; b=kZo3+dWprTLYjNBeHZzn8GHdxim3hVlRMsiDrLjiCnOtu+BzHSHtT145eu2o5Q3tcCrZ/eXQn068y4Fvs1mxYwjD1L3ec/Bhkg9pRGfnDQkDj74G4odBbbugRxujfg1FF8o/UMIHN88ldriNAH2/t8VIAu+CsyrwLiErHivv9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471417; c=relaxed/simple;
	bh=TKAtd4Xz8cLFFFmnHPins+tJ+Mfne7qr3bvUedak18U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1gxU53O3VUYP0mhJMXkine4vbIOasN3AUuPe4h41dkZZxQlhMri3qZSby7bUjkPrcVcH58KBnrcmW8muuIoW8cgZ24Ralb//Gkc43m/4blRSuMsYfKHfF90YW1EjZ8ZV+vipF8Is2USw/QaWHG9y/h/UckUFKRP1fj8VxeFzTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUVda1jd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUVda1jd"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c804409b0so1581625ad.2;
        Fri, 01 Nov 2024 07:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730471414; x=1731076214; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKAtd4Xz8cLFFFmnHPins+tJ+Mfne7qr3bvUedak18U=;
        b=CUVda1jdOcxbWVDIOZJ/jaFBWypmvREDAqmxqdOk2+lViybZy81DFnO3F6q+OOjs06
         Al9RNvE2+v36OqZffhDEDg22betQjIY7wKHz7B1Apw0Lz/PI2IhXcwZ1moj1yiBYJMMi
         fnNWbuN7oKs5QLyvN3AudVixVzrwic36RodcLS8T7vCXDVi8ttGenylHmsXzO0jZTgN7
         narh1BjJ63dOwSaXg1PAJ39Cf61BXIDrLF3JWI+M79RvtMqC4konX1RL/S8t6LMPIxCZ
         Vr/jtIF2LlCRLm2dNAJBhAubMq8W1Fb80lAcVL2IrK0RcHVueDzy4QCGEyapTSTBncMG
         Lecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471414; x=1731076214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKAtd4Xz8cLFFFmnHPins+tJ+Mfne7qr3bvUedak18U=;
        b=SXQVv//vQ/lWgxLtmCov+1UHFxxTPtZsNdb4dzwtr02NpANgcKwUgXpUk+Zl2AO5VY
         xZ2Y2PcpuwGq2ZbFs+5Ea7PcUN7V6Z/ydzwftjtf4+/jJV7o7uyYVNZAFm8wJgYBBnVi
         n3zRvxq+k2afw9dT2/R9OPiy/63au/IG+leB6UVnEY0N2Uvtk76o7p/fb6EpjFERRMEb
         ZiVeFw7J6OFazlFHUsNh985tm8tFoDkDhEHHmf5TxcVNPmIsKkb5y3Cb9DKZHh6wtW3k
         PiU2dYBKGF25JDg6DEIrIXvq4KJB/2UvydTJiPR6pshuAEvs/28j3jHn4ogWvRj5TNY2
         BEcw==
X-Forwarded-Encrypted: i=1; AJvYcCWF9DLFFI92ye3zBJnb7fhuSgPUo69vhNtL/n2B00TrbhpGYIlIL70yOBDB8iC+WeWUMci4@lists.linux.dev, AJvYcCWxBl0z/QEtRHyuabsPOc+6HHKUqtg2na7lFQyOXNf/Gi0fvxHodbA9SJK1Et2ZPi/kWgoWzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYKpWLBjGJZxZc9XiK6Fnko4/wl6TlpUSE+/vJ4F0T0px6NvOu
	kyP91Q03Bgv3MaiyJE6nXR+O0vXDwL6geMpLyisTYA2JP6dMxgnxt4P+ZzUxAPkblyP+qUIlXOi
	hAgNqQpN2FOrtoybwNCDZ7rxWIK4=
X-Google-Smtp-Source: AGHT+IGOQhefEp7FLZkdniAIiiIsTLBIszMwpP4/Ctt+MCmEaSNoKLq4eMcSMtSjAgS5QbXUeuU5N7LkDLjPkosOQVw=
X-Received: by 2002:a17:902:d50c:b0:20c:5da8:47b8 with SMTP id
 d9443c01a7336-210c689759amr141323595ad.5.1730471414470; Fri, 01 Nov 2024
 07:30:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 Nov 2024 15:30:01 +0100
Message-ID: <CANiq72ndWJtzSQSFYuVkRPhdan_PvNpvGEhQXKAZKESnt7JVAA@mail.gmail.com>
Subject: Re: [RFC v2 00/13] LKMM *generic* atomics in Rust
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, lkmm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, torvalds@linux-foundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, dakr@redhat.com, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 7:03=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> This time, I try implementing a generic atomic type `Atomic<T>`, since
> Benno and Gary suggested last time, and also Rust standard library is
> also going to that direction [1].

I would like to thank Boqun for trying out this approach, even when he
wasn't (and maybe still isn't) convinced.

Cheers,
Miguel
