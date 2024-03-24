Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A84318EB3
	for <llvm@lists.linux.dev>; Sun, 24 Mar 2024 17:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711301839; cv=none; b=ZGqCp3LgJGpMv16JUQ9uhtEOrim8gpETlnSLuRlATb6fe8ZCN+RvNYFU3IP9DnSkBDg6MESM0+a9AINEgwwnQDN7eYGlq+jof9WbjCYIU+7jmWRksuYUt8uqDhjgYaNwFDzyGyBX7wCB4w7VAGsd3hRdfEhRTMNMliu9vaZmIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711301839; c=relaxed/simple;
	bh=e8Wzt++tI0Y6lTciHZrwviD9JAPYs1UHfQ1N/92js8k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=t/DcCGNQjP4Jbxzh0x99CMd+zMX35FCDQbog2yfHxov9zoOnkHBW0KrsPFtA4xMbDrcSdgYfvnSxCPiGu270meX9FnerEN8RSCgLKFnyqFmMXML88EFYOEF2ZLk2GU8bCWvSrRGasrIYo9dZXqZztpprmjP7OGPYVfA7PiDZDQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7F9+AtQ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7F9+AtQ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-789fb1f80f5so259885385a.3
        for <llvm@lists.linux.dev>; Sun, 24 Mar 2024 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711301837; x=1711906637; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A5SUwxxd4XjDHjkrEb2n2ZXL0/7LMjpgw75QRXKPIo=;
        b=a7F9+AtQuUFiRro1ztGvggFKTvCZ68vnZk0g1t1wzI+mU7d+/gS+ran5C/lOsPDNbn
         vvaMv5fPP3FA/ra8GSMvnNbnnXK0zoKbepwM/5jjxp64Bi1Wt+jF6pFVeMESRyCwe9Nt
         SvkLdLgzzJJ03eicmp2SFfRr9pOmDXlYbbI1+RNZWZcuk3bRNaZoDHkePdkTKu61rz8V
         3ClQFfADLDtSM33xRQw44Z4s4tc8B3nu1oumEY/WgS3sLezPNkU8BwEsO/Hyvh3gp+hL
         JTvToDbwzk8gcNDTJYsM8e2aGuInkdm8PRpoeFTUl0LStf96WbsooVWABfLmnrF6k7Th
         MHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711301837; x=1711906637;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7A5SUwxxd4XjDHjkrEb2n2ZXL0/7LMjpgw75QRXKPIo=;
        b=JL7EaS2pg6/VGffriCIpLYWfv9CCOvxJMmU376Rifyzmg0tzfO1hgCLaoUV9u6SfH6
         W7XCZOMYt8DUysxI80CekSE3ntPJ9wIRx9hdCM0Y+0IlosNZOapc99FyHJbGQxWZB+yD
         83dUqwYqQHQhzSJeEPp57a/QOGa4ETGRSxOenpdYN06LDTqiS+6gL3avoeqmqD/UenTs
         zDeCSjR/OX1EmhOU4IeOvgbyGrOEZbdGIMYUzsrw4Lt0f64q0EBfdVvGroJSiWYzf5Ux
         BL9N0wFHMVVw6FYJj8DuWh9mHJ7S6nPcv1V5N3o8id7ldaoZg+HXYZNEtDCB2Ve6asF6
         vvdA==
X-Forwarded-Encrypted: i=1; AJvYcCWcit5nKMFGZU7aV2cMOWmbDIP3nzIUtFLJHxAE/KW97YUWZ6jra+5HKi8PsF3IqUGk/MZ+vNGK0xG86223Qn85MsOPKA==
X-Gm-Message-State: AOJu0YwMvTB8rp9gfYWM1eSarS6Oed33TnxKgIA1zWRb2zEBvvJFuRZU
	VtyppwCYHWdbSLpuhyMXaSwq/Os8WFSdOc/C9k/u7bWQNUWZ07UH
X-Google-Smtp-Source: AGHT+IFjpSfbEmAjCyadZ4oh3c1hlZvr8OuU2bvWGAJwDmJef8K4HA0yJIlXQ6FGAqvDYB9qnUMuMw==
X-Received: by 2002:a05:620a:5d8a:b0:78a:1e39:2674 with SMTP id xx10-20020a05620a5d8a00b0078a1e392674mr5391270qkn.39.1711301837071;
        Sun, 24 Mar 2024 10:37:17 -0700 (PDT)
Received: from smtpclient.apple ([63.115.34.165])
        by smtp.gmail.com with ESMTPSA id vq12-20020a05620a558c00b00789ea123bd5sm1491096qkn.59.2024.03.24.10.37.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Mar 2024 10:37:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
From: comex <comexk@gmail.com>
In-Reply-To: <174272a1-e21f-4d85-94ab-f0457bd1c93b@rowland.harvard.edu>
Date: Sun, 24 Mar 2024 13:37:03 -0400
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Boqun Feng <boqun.feng@gmail.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org,
 llvm@lists.linux.dev,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Andrea Parri <parri.andrea@gmail.com>,
 Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 David Howells <dhowells@redhat.com>,
 Jade Alglave <j.alglave@ucl.ac.uk>,
 Luc Maranget <luc.maranget@inria.fr>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 kent.overstreet@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3088DF9A-6507-423B-8F0A-100B78DE1A26@gmail.com>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
 <C85BE4F4-5847-45B4-A973-76B184B35EDE@gmail.com>
 <174272a1-e21f-4d85-94ab-f0457bd1c93b@rowland.harvard.edu>
To: Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On Mar 24, 2024, at 11:22=E2=80=AFAM, Alan Stern =
<stern@rowland.harvard.edu> wrote:
>=20
> I don't know if this is what you meant by "in a weak memory model, the=20=

> escape can =E2=80=98time travel'".  Regardless, it seems very clear =
that any=20
> compiler which swaps L1 and L2 in f() has a genuine bug.

Yes, that=E2=80=99s what I meant.  Clang thinks it=E2=80=99s valid to =
swap L1 and L2.  Though, for it to actually happen, they would have to =
be in a loop, since the problematic optimization is =E2=80=9Cloop-invarian=
t code motion".  Here=E2=80=99s a modified version of your f() that =
shows the optimization in action:

https://godbolt.org/z/bdaTjjvMs

Anyway, my point is just that using LKMM doesn=E2=80=99t save you from =
the bug.=
