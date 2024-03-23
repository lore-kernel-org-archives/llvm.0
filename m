Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB21D2E410
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 19:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711221024; cv=none; b=EOBDiFTzMyqoV7Kbbe3igBxyoWRseprbINNNN53boe2ajmOCLmhqgCf6xdktSwR8eTgWL3tqoYOM4KEUjpVP3s4uPJhXwWIpFtevBIQCn/KyuOyjK5uaGV6CSNKs/FVFmoI6bDD+6nBOR7c13HH6+nkFH6/DvNJ/uBzxh1HfpLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711221024; c=relaxed/simple;
	bh=ueCTxwBoM4hJHV9z5OKPHfj7Mct2XSkw55kGkcJ/dgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YP6nRtunY4KFRs3NqiqSxtuenCKUwcwZAaLhqsmtXVKwWwDt6ndxAs4mIq/aSvo35uvZWMwRg9ewa4oIdxyK6GZlIESgb1vT4tzPJ0NmKUzXwb08OHk7GBqlbkX6BPShNkOvfySvjy92C8xv151uLz1hI/+BKKGAWts1jgJXwqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOOcWbzX; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOOcWbzX"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a0292c4df5so1884867a91.0
        for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 12:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711221022; x=1711825822; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueCTxwBoM4hJHV9z5OKPHfj7Mct2XSkw55kGkcJ/dgY=;
        b=IOOcWbzXDRqTme341u0qBg3khPN39P6be4NXO78Qpu5weHWVrsLRpd+Ut14ccMb6rW
         1wJodITEyUNeJaH1J/9qCHHrApxK2YkJvkTDtfedL5qnr7INShVny5ZbRAE2jHmvINU/
         /Uq95nP4ludAd82u2FGXpJvaCg2vuo+uvW1PFLlRxO/AedlSfVhBcn5EsTNyJ9Wcvln+
         BQTiX9skv/0Yu63KV3G6N5M9uCb5KFWLwWjltq56fO8RXHIeUCN6UBI3LQShtW2RAp4a
         OIAl/sQtZgdMqJRAGN9dMXuhmIYre+UG2Qwy6mBq1JDdU/cPC5Q3g7LLr9IEGWOEPSQg
         GS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711221022; x=1711825822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueCTxwBoM4hJHV9z5OKPHfj7Mct2XSkw55kGkcJ/dgY=;
        b=ohLARUk/EuftbjiSNOh+Lu85hXrFIs5iau8j8nh+EHEgfQbmHvFO+NyslPpztftSBN
         bouwCkUwjhShL//9KKQJBY/utTOcmLkOWmWTG2lz2FSYYsOHvlc3Byz7O81CQlOJ+uZ+
         jrajsT04nPsAEH+iSzuysS8IFD4ejCFsD9rpgzEy85tKqFNGmT0+l84h1J/kezY7kmlj
         fgq2fowwvbP7/YldARJabzsZ9p9Ifnj6l46Bl6EI2WlcWDb7vNFSrVNAGGq4aBiX93UZ
         zK+7s+zoNgGVxVLhcAOOlyVYdktKzxjV9VGAlvXrCVg2oLU8LWVODDk1Mxw8GyxzsZt7
         ozWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxmZcJFJE8lHPNW//MtgvhqpdiK4G7gqdkGNRnfvIJfzTY5Ngj/ZTkWnZkyaOf4Sth36qjatRBJpm4Ux63aMVZp7NwAg==
X-Gm-Message-State: AOJu0YwWGMwnCdmc6U4/wh3KgHhmbdHyZa/vgzJupbdc46soBtm2eFdm
	S5Z0kDukUpQDBw25imK6AmWyoHrn53VNDt8+dX/+p0hl7nUP6Azkr7kNnziA0OAaQmv3ov7S65K
	AhhmcsoMw/o4wkgPArDyX7sj0ZXk=
X-Google-Smtp-Source: AGHT+IGwahkkdd9J1rTcWINtRLDJq4UgsSSVueZO7bQhn7sYYNOp7aQF0yI108KG9KgG8wRB0n2yrE30IMHnBoQhcjw=
X-Received: by 2002:a17:90a:4947:b0:2a0:2f8e:76fc with SMTP id
 c65-20020a17090a494700b002a02f8e76fcmr2513410pjh.28.1711221021961; Sat, 23
 Mar 2024 12:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <20240322233838.868874-2-boqun.feng@gmail.com>
 <068a5983-8216-48a5-9eb5-784a42026836@lunn.ch> <CAH5fLggdVDccDwBa3z+3YfjKFLegh7ZvcSzfhnEbAGSk=THKrw@mail.gmail.com>
 <497668ec-c2d5-4cb4-9c2d-8e6f7129a42e@lunn.ch>
In-Reply-To: <497668ec-c2d5-4cb4-9c2d-8e6f7129a42e@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Mar 2024 20:09:57 +0100
Message-ID: <CANiq72m4n2B0K5t1ZESMcL_k=Wgttuwd8=THBbOYYPq_D+4hsg@mail.gmail.com>
Subject: Re: [WIP 1/3] rust: Introduce atomic module
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, torvalds@linux-foundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2024 at 3:10=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Just looking down the road a bit, are there other features in the
> standard library which are not applicable to Linux kernel space?
> Ideally we want a solution not just for atomics but a generic solution
> which can disable a collection of features? Maybe one by one?

We requested a few of these in the past for both `core` [1] and
`alloc` [2], and we got some which we use (see the `cfg(no_*)`s). It
is what we called "modularization of `core`" too.

[1] https://github.com/Rust-for-Linux/linux/issues/514
[2] https://github.com/Rust-for-Linux/linux/issues/408

Cheers,
Miguel
