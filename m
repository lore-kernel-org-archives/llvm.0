Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC5A59157
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711230038; cv=none; b=rsL9AVAHr8UTXiPQq5W5oTpApeHhH+uITjdZW8oFoL5tsqQ301yF9rOsYRKtVmB4UhWpwJOhc6XhhuCLK1/Q4c0cTL90GfesIHp/+UrZbJ0zrhc6ruI9EapVuWD9ugj1hKlEjZJSJaAItcCgn0QykMgiUMYhzH8Po+e8ENUc/BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711230038; c=relaxed/simple;
	bh=cxJyvYom9rYpI3v6jLA3KnXUFhHsx7mMzeaboHDdGAw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gl4MeZISYW3rpyluuP5pfbpIIYVTvopi+pQdiIHhZW7Dw5RUX19BC/VNhdLMnE9FVUKmy3cioEix+OXanPeWyZPFGebew9ZEQSzag5C+H7C79hA8Y0jFLH+djz0IsXIHXBi3othZ+np2p1yHczEmYrjjMeDl1W44o9XScZEOXfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5fkFJ1d; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5fkFJ1d"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-789dbd9a6f1so249604185a.1
        for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 14:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711230036; x=1711834836; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOFRvpRAI+VWx5nUCuNi2VPShTLUPuTZZjdFa31yQSs=;
        b=L5fkFJ1dSzXKaErRL5JOZDN35fld0irI/vxUOceVEdkD9JdTJqic/c0MlSF+tmkr4L
         ZLE1/o/Cns708Sckt3rHhMJSJ/3/9lkay8Y7UIalozU7BlLrSfnOMpG7QHBW7tGB946H
         mdvGaPKNMqmpMjdEpyIj46pToyx7Vv5fRtL+3BV+Z0/gL2jHNvwUS+dwqhpwJ8FY8NDm
         WsE3l2vfqn/HesA+Y9SqCpcJGKZfaPVo2wdqw7PYNPVFj69Kqcxm75V6tDmLFm1nxsF5
         feAj6ck2Kwobi/te8lNXoJmaNFQhof42EKbRlItEu8N9oVT1IFUyBvyMv16qnPI3Ks4Y
         /b4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711230036; x=1711834836;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOFRvpRAI+VWx5nUCuNi2VPShTLUPuTZZjdFa31yQSs=;
        b=Lq1M4Cm+hOz/SaOkVqkLkE0ClG6/T+ZED1hZ6m1bfK+/t9ETeYrt1QH+8Dj5b54ZYL
         eGCYTSUAZIAL42BSjb1THBcC6GtXewKdftWywrFeBkLVO7iCRJR1MRFsggcj8BsH7n+H
         hrzZYGBvFaCpEFlNPP+y6W6T1MLdjseiJVWw0F9JZwTcYkDbeUG8tMe6cYVbarzKChRs
         wwNSG1OmKnXKQ125VXJOWCV2jsARqQli5Lvm+X7GfA+GHc87U+UA2QY/H1NBDX/Ikjwa
         9v3uNzfUsjQh3/dayUB0NDJ5CtZfScl87gKxNAWucVJ1LEXJOPOp3VvuzqrInW8d2iI0
         55eA==
X-Forwarded-Encrypted: i=1; AJvYcCUQMqIY3HJjeoH6erfdDHX8x0WhdiIxTPeb6q+8JiAiI6WA5R7f4IJnt6HB2wbZyznar3i//Vpr9mttlt14/z7Ji6iJ2w==
X-Gm-Message-State: AOJu0YxIKb9lLJx1zDL1yK6hl/NETut15aPMxFy/5VZXgJO9wz7QwB91
	2CbWkRnx4+bHt9e1UgMpfEOSWjYL6KeBPOn6sEEZGP+69kNl/StW
X-Google-Smtp-Source: AGHT+IGOLTqbKp1+ap2QBx/UabVyQfa+NSRyVtYLu6fT31jIeVrXitOYJm1ymdmJk8ukaXuOsxroBg==
X-Received: by 2002:a05:6214:1308:b0:691:e21:736c with SMTP id pn8-20020a056214130800b006910e21736cmr3799275qvb.30.1711230035924;
        Sat, 23 Mar 2024 14:40:35 -0700 (PDT)
Received: from smtpclient.apple (pool-162-84-172-44.nycmny.fios.verizon.net. [162.84.172.44])
        by smtp.gmail.com with ESMTPSA id kc1-20020a056214410100b00695e602d356sm2450268qvb.46.2024.03.23.14.40.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Mar 2024 14:40:35 -0700 (PDT)
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
In-Reply-To: <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
Date: Sat, 23 Mar 2024 17:40:23 -0400
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
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
 Alan Stern <stern@rowland.harvard.edu>,
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
 elver@google.com,
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
Message-Id: <C85BE4F4-5847-45B4-A973-76B184B35EDE@gmail.com>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)


> On Mar 22, 2024, at 8:12=E2=80=AFPM, Linus Torvalds =
<torvalds@linux-foundation.org> wrote:
>=20
> And when the compiler itself is fundamentally buggy, you're kind of
> screwed. When you roll your own, you can work around the bugs in
> compilers.

That may be true, but the LLVM issue you cited isn=E2=80=99t a good =
example.  In that issue, the function being miscompiled doesn=E2=80=99t =
actually use any barriers or atomics itself; only the scaffolding around =
it does.  The same issue would happen even if the scaffolding used LKMM =
atomics.

For anyone curious: The problematic optimization involves an allocation =
(=E2=80=98p=E2=80=99) that is initially private to the function, but is =
returned at the end of the function.   LLVM moves a non-atomic store to =
that allocation across an external function call (to =E2=80=98foo=E2=80=99=
).  This reordering would be blatantly invalid if any other code could =
observe the contents of the allocation, but is valid if the allocation =
is private to the function.  LLVM assumes the latter: after all, the =
pointer to it hasn=E2=80=99t escaped.  Yet.  Except that in a weak =
memory model, the escape can =E2=80=98time travel=E2=80=99...=
