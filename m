Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3422137915
	for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 21:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711576592; cv=none; b=U5aoRnSxFOj30NTqyCS0LcZesn2GJmSwAU7aj+fu7Okjzg6zD991HsBocXkCAex9KNloHJmhiEn2mZRY5uBn8dWEOeUVKEMDwH3/kf6TlxaoE393X63YMtCYUOqNi6MuQijCaM39fkpq5TLyCTY2GI2qC+zCyFFNTHp3SwvNq5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711576592; c=relaxed/simple;
	bh=f5xsXA8uoaoP6TMv4Mkq2g98eO/qBSM7LLZjWvgKBes=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=R3eAn7iCghyURLHrv4LB8jNEwP0gG0Kq/hSH3fj5dS/u16iZdZ7vjd9Uu5L99mAwDtKvgpgp/lGfwnhYLb479Vb2Vrg8wx6pe93O+NOJHbRnJArokgcG/TQrf5xBsVO995JvMs4oWcT/EpV05w8f8BRrTIjfTws6RU0XCh2FFyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbBIMweu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbBIMweu"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6ca2ac094so362462b3a.0
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 14:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711576590; x=1712181390; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nK7oGytjkYckNrpr1HYOqjdMAjgZf6eYRbl5oXGuqE=;
        b=BbBIMweukvFLVEIjoQq7pMI8AkQaG6cA5KRnGV8rdmIGPBvTKQNqYeGbxj2vp2Qt8O
         3NG/fFM89wRCfyFobgD9zJek7+I3/gwaCSbi3BVyjn4ztpf1gfv2EaAmcCW16BN52i+F
         mT+VCBpIDJSLNgNX3Ki1rVZ2Qw53OH2HuCL4Ao8XBfj8HfbQHesUp8VgE/Rnx7r1n1mE
         3PPtkQEqo9FIG77U81HjUqWHLAwlgP3VsHNUe3MGKwI/RT6lydoNWCXSLnWkKK+TCOUq
         8ONJ9K/L75lej52szQnAYgk6CI4VeBIis0M6ASIzXNOgfRF5LNg3OLgkapLDzpSYCOqA
         tsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711576590; x=1712181390;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nK7oGytjkYckNrpr1HYOqjdMAjgZf6eYRbl5oXGuqE=;
        b=k0wOR3iYIrVFhLkTfv8kAllmKIqJGn00rQz7Cd9lE6tuNlD0tcKyBuvjcqTgxfOvHA
         cpsM937OJP6+j+3bJYcKtFW3thMNE9OgiNCcGthy20ddb5a8vtNnWc2Iz87mD218AQ/x
         2AAuCI9kzQTPKS3hG3vj+7+5jE6/04li25DDKAgVHnCtZA8XVdKssqMHC1+dtxgAEBfH
         GPoCjqkhiNVIKBWHE4PN8AjdjUhgk7HS5/Hw+MlvVjqPBY9JPr/9ncQf636Jd/Pmnu0e
         QVNZnoMw2Xv4Sz3+A4OWZXmB5KK5u4rpJVPnLhsnyiLpkx0GLR5XzTeO+BU+AY2GUCmo
         Dlqw==
X-Forwarded-Encrypted: i=1; AJvYcCWtpM77AIs/PNJLy6EOSoO8pqiC5OZC6zhVaMDBg+oBWnNZkQXHqI6KknnA2z/SCjqfEgycPAN3ccNTt070GVVtr173Xg==
X-Gm-Message-State: AOJu0Yz7f7HZOjR7pZg4ATdFFnij9E/HC/k7/1g6fCMKNLhH2PNF1gYo
	QBXmZJWSTOt7ZrRsP3Nfl6eb/HApbLTQhslO9baj8itIPETdx8L3
X-Google-Smtp-Source: AGHT+IGdMR9pJlgf4CvRTiRkOkrpDFtL+V/Uc4Lolo4AeOU6/H/PL2BKoUiaYbvFxC9xrMHCeaCtlQ==
X-Received: by 2002:a05:6a00:18a9:b0:6ea:ad01:3550 with SMTP id x41-20020a056a0018a900b006eaad013550mr1304630pfh.18.1711576589327;
        Wed, 27 Mar 2024 14:56:29 -0700 (PDT)
Received: from smtpclient.apple ([2601:647:4d7e:dba0:5840:a196:2bf3:3600])
        by smtp.gmail.com with ESMTPSA id bm20-20020a056a00321400b006e740d23674sm21510pfb.140.2024.03.27.14.56.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Mar 2024 14:56:28 -0700 (PDT)
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
In-Reply-To: <ZgSNvzTkR4CY7kQC@boqun-archlinux>
Date: Wed, 27 Mar 2024 14:56:13 -0700
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Philipp Stanner <pstanner@redhat.com>,
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
Message-Id: <5246D3E2-E503-40BA-9A72-1876BCF1186B@gmail.com>
References: <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
 <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
 <bu3seu56hfozsvgpdqjarbdkqo3lsjfc4lhluk5oj456xmrjc7@lfbbjxuf4rpv>
 <CAHk-=wgLGWBXvNODAkzkVHEj7zrrnTq_hzMft62nKNkaL89ZGQ@mail.gmail.com>
 <ZgIRXL5YM2AwBD0Y@gallifrey>
 <CAHk-=wjwxKD9CxYsf5x+K5fJbJa_JYZh1eKB4PT5cZJq1+foGw@mail.gmail.com>
 <160DB953-1588-418E-A490-381009CD8DE0@gmail.com>
 <qyjrex54hbhvhw4gmn7b6l2hr45o56bwt6fazfalykwcp5zzkx@vwt7k3d6kdwt>
 <CAHk-=wgQy+FRKjO_BvZgZN56w6-+jDO8p-Mt=X=zM70CG=CVBQ@mail.gmail.com>
 <bjorlxatlpzjlh6dfulham3u4mqsfqt7ir5wtayacaoefr2r7x@lmfcqzcobl3f>
 <ZgSNvzTkR4CY7kQC@boqun-archlinux>
To: Boqun Feng <boqun.feng@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On Mar 27, 2024, at 2:21=E2=80=AFPM, Boqun Feng <boqun.feng@gmail.com> =
wrote:
>=20
> I don't know whether I'm 100% correct on this, but Rust has =
references,
> so things like "you have a unique reference to a part of memory, no =
one
> would touch it in the meanwhile" are represented by `&mut`, to get a
> `&mut` from a raw pointer, you need unsafe, where programmers can
> provide the reasoning of the safety of the accesses. More like =
"pointers
> can alias anyone but references cannot" to me.

Right.  When I said =E2=80=9Cstrict aliasing=E2=80=9D I meant type-based =
aliasing rules, which is what GCC calls =E2=80=9Cstrict aliasing".  But =
Rust does have stricter aliasing rules than C in a different way.  Both =
mutable and immutable references are annotated with LLVM `noalias` by =
default, equivalent to C `restrict`. For mutable references it=E2=80=99s =
justified because those references should be unique.  For immutable =
references it's justified because the memory behind the reference =
shouldn=E2=80=99t be mutated at all.  (There=E2=80=99s an exception for =
types with =E2=80=98interior mutability=E2=80=99, where =E2=80=98immutable=
' references actually can be used for mutation.)

The hope has always been that this gives Rust better overall =
optimizability than C or C++ and makes up for the losses from the lack =
of type-based aliasing rules.  If there=E2=80=99s any empirical data to =
justify or refute this, I=E2=80=99m not aware of it.  But that=E2=80=99s =
the hope, and by this point Rust is committed to the approach.

(Why only function parameters?  Mainly because of limitations of what =
LLVM IR can express.  =46rom the perspective of the work-in-progress =
Rust memory model spec, function parameters are special in *some* ways, =
but many of the optimizations could apply to all uses of references.  =
That's just not currently implemented.)


