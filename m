Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7B21E52C
	for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 22:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711576978; cv=none; b=VVR/VODt0mkjF0i7+rkGqsWr5qOe9Knrn4pCpDYCm2TYMzjgY3tlFyoS/FQdZ+E7qybzpW3PABHbUEAFE5As94B5p4y6kIXLeHPvOPjThp3sIoNL7rXwLSE/OxovcYNu6zTtJ+DaMDqL6CkxEPmBqh2E6ALYVlcMtGgmxL8WoLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711576978; c=relaxed/simple;
	bh=qCrAxiwO3Y3xJfB5K5VP4H9pbMMbTuTp4N5vA4Mo5GU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Vdo/6rJn0qqPqI+J0oq8ekaU7J/cef4GYkBIQvD585CATBD4d4iQGCnwdB4nUP71CoCMEEon20lK0yhV/oAq0pys2+NFU/sZCt1pD8dZf0lt8sNTgTuRW9ijQ0/yLTIsWkfz/hupAlcQJcLZDYU/xmg0Cv/yC8GBu7f2LltNShE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlaF6RMv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlaF6RMv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e0bec01232so3068715ad.3
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 15:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711576976; x=1712181776; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxkaKw+rfpAE85eGdYCUsNCxHsvss1V9iaOZ0vj/Dtk=;
        b=NlaF6RMvOpx+6pTzbhvEHcOvUgLVezQ28p+WhcAbBNceCs5EbY21WrFt3ownOcZ3Ui
         TszKWxmBTwwwH81MdTkA39ZXIjub0LQFW6bQR1VGv2tQj7S+p7kNrmsZdkTW7o+A5FNm
         dsi+KQmIWktoNJ1H3QGKpo3zxGzAe2sKix4Rlx/Dh1TA6yE6itZUa3oLlXLwsL8mC2D4
         zPEdMo3qvS75UpDVCmKzpJG7a2LweG7O4o9Dlbc1D+fCSOulcOaOsx62P7Zpq/w6HjCL
         4D8N4mLs4fgDGg9WSwRGo4Ifs9BsjLkGdJUWVYHjCa507ceVuSci6EJAWYIlznAk+2Jp
         XuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711576976; x=1712181776;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxkaKw+rfpAE85eGdYCUsNCxHsvss1V9iaOZ0vj/Dtk=;
        b=FP3NTv3Zh7t6livVlw/SBXyoI4iNuzY5CG8+OYadZBS97uFMXHNIvmlQRl3ZKx8KtL
         ptBNnNP8S3qbSqaJw2kpLKUWDBE7cVBcm8ooX5re1ljs+LYdLfkIMl9RuhS8dAftC/j3
         stG2Dt55mvST/dFjs6aPVxNBhGHbpIAVwgIdCuyufBJwuEM5pOu8fNIOoJk7b7DcS4lf
         BfNfV04hR/VdKBsRkjfqmgd4CSa6a55KU1i2GhuYJRBG6tlxTDY6vuIVXktDWQLHES5c
         YpqZAxeDHtgkV8fxg6xhrMjhWE4Rs/pwvut0Iy9d7RkFp+855UwY4NKkfMSlpKKFMSqy
         cThw==
X-Forwarded-Encrypted: i=1; AJvYcCWofYARX+5AkZ6wQXF1pnEQcURAqFxw3k2WYRNmXVATSGNF9ug1v6LVs+BCLLxyZc3x75xTstdIJ+TSaCSCjue+tkdnHw==
X-Gm-Message-State: AOJu0Yy2kVeSAgk8E5FS9GcmKK9UpDW4hWmRpYGib41HTYCVROFfX5f4
	yBycaj6gDkiduODlMGbXGaFPupHt9ac+RaL0BBWkWFTKbOKV0Q+9
X-Google-Smtp-Source: AGHT+IFaDb6HlSC3POSY7TW5AUU1z57wmA9MdM0r0RpaOuimMWYaaCvmMKDgxeih3R65FO4kDbGvfA==
X-Received: by 2002:a17:902:dad1:b0:1e1:1791:3681 with SMTP id q17-20020a170902dad100b001e117913681mr1131591plx.61.1711576976035;
        Wed, 27 Mar 2024 15:02:56 -0700 (PDT)
Received: from smtpclient.apple ([2601:647:4d7e:dba0:5840:a196:2bf3:3600])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b001db5fc51d71sm9469plh.160.2024.03.27.15.02.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Mar 2024 15:02:55 -0700 (PDT)
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
In-Reply-To: <5246D3E2-E503-40BA-9A72-1876BCF1186B@gmail.com>
Date: Wed, 27 Mar 2024 15:02:41 -0700
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
Message-Id: <041BE680-1715-4C9A-BBEE-7547108F04BD@gmail.com>
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
 <5246D3E2-E503-40BA-9A72-1876BCF1186B@gmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On Mar 27, 2024, at 2:56=E2=80=AFPM, comex <comexk@gmail.com> wrote:
>=20
> Right.  When I said =E2=80=9Cstrict aliasing=E2=80=9D I meant =
type-based aliasing rules, which is what GCC calls =E2=80=9Cstrict =
aliasing".  But Rust does have stricter aliasing rules than C in a =
different way.  Both mutable and immutable references are annotated with =
LLVM `noalias` by default, equivalent to C `restrict`.

=E2=80=A6oops, this should say =E2=80=9Creference-typed function =
parameters=E2=80=9D.

> On Mar 27, 2024, at 2:49=E2=80=AFPM, Kent Overstreet =
<kent.overstreet@linux.dev> wrote:
>=20
> That's not really a workable rule because in practice every data
> structure has unsafe Rust underneath. Strict aliasing would mean that
> unsafe Rust very much has to follow the aliasing rules too.


There have indeed been a lot of issues where some innocent-seeming piece =
of unsafe Rust turns out to violate the reference aliasing rules.  Miri =
helps (it=E2=80=99s a tool that can detect violations at runtime), and =
there have been attempts to loosen the rules where possible.  But it is =
definitely a case where Rust=E2=80=99s UB rules are more subtle than one =
would like.  At least it only applies to unsafe code.=
