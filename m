Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A7F1534E9
	for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 20:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711572367; cv=none; b=SQTb8f59hACRx2wlMQtVFZqcF3x1pskdkQmGZ23Jxy++mP9ijiSiDPIXd9ZfIjepkJYp1AvhRRcB/SnQlwa956OL2hWxUMPcqjj22hst3xD8hgXfwCilctyhQlrrKbn0TkFiKBgPicQn89DBdaBdQ7fkojPEPEaVCj28vhoXh9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711572367; c=relaxed/simple;
	bh=RuCWKtbRzqJIEwrREMPn1YstKGaBmUG9LovdmLij8Z8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E28PgP9N55TvsEBY543TPuW1muo9nIi/3AfyXEy36TdtTv/snir+lIAg5zcSvV+lfRUGJDc6DJVdhmNIerivgbCPGWMMuUkjLXXxWUz2rg2XktGcHMPUYqszNuliAowm2YDkLM1LeqA224gABvI7acIBJ5eXf0GHFZxXJSmgs2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XZ/Btlcs; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XZ/Btlcs"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56a2bb1d84eso495775a12.1
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 13:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711572363; x=1712177163; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MmaskrdbVq30uGRTY87iYuCKuy48OuaJH0qBlabGSIs=;
        b=XZ/BtlcswYQo5yMQnoVcGC8KtJjcDEPmNiJx/New6YevCmUzfln0MyQK1JDaHJ2IYY
         7zTqWStLA5m673hbTboFad0DbZoD6y//93MVQmcrKqscyIUVk2RpKyHOpcixTyZQJ+ZV
         MeURtT5oabJa/WkdHqtWQjNnAqPHCOp/nEOtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711572363; x=1712177163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmaskrdbVq30uGRTY87iYuCKuy48OuaJH0qBlabGSIs=;
        b=Nu1QjY0gVZjLzX6v0rs/uQhcgDy77CvrQbvWNknEnfr4cRk2OXgZQkbGj0m0sXU0Po
         Mt2VY60vvBGzbgYbXWQyt0hWm4d+7A/OUMJoXNM5HRojWuKg6BG7tib34BiiYXZ6uBsB
         PumqvB5bFsHEfc5psw16XB5eGQ0x/t2jIXZPofZS8/3cqxist0Ou8E+HY4Xc8WhBijFu
         NabwJ02baeQd7fx8EfFukumH7T6RzanmhC3e0GkIYRqP5+V9Rc1cwwW2JUamLlwKCgKp
         imTj2Einh3Q/BdmVw6C1yI2dg3TstXxSEBGXQadl7Hf4k5U1QyFaUApQfaLGrrOkimhH
         RYjw==
X-Forwarded-Encrypted: i=1; AJvYcCWCis33rCR8GiHuAAx1klqjUS2sB0+umjbD2EbMV+DcHiBcJyL650bNLZQeFajtMjcvPwrpPZWhkmfINs+KRnrVV/B1tg==
X-Gm-Message-State: AOJu0Yw3ckdxXLfT1a2TnBC3/jZNFDj2Y44uzlHYWMFergInXfie4cGZ
	oJfy6gzz5BZVTcIQUSdrNVk53srl0dbxYKpAkBPa2x5piqXZWQaFMYI8ujloWvy6T9zFD2QYsj6
	6RI/bzQ==
X-Google-Smtp-Source: AGHT+IHKK9Vyv4mIgxkOcznAKT8lxLBO+GvKasrbxKf8HuOPnnag3T+SrnOyXvsbl+Kft0Dnm6FMEg==
X-Received: by 2002:a50:d714:0:b0:566:624a:9e3f with SMTP id t20-20020a50d714000000b00566624a9e3fmr430061edi.3.1711572363651;
        Wed, 27 Mar 2024 13:46:03 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id g28-20020a056402321c00b0056c1c2b851esm11865eda.0.2024.03.27.13.46.03
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:46:03 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a46d0a8399aso227288966b.1
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 13:46:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2/lidODgnfXnD1GF3OrTwRZc5V25XZjveTbXPnFR4eoo6gd2KX4RiysNx/6jLr5SDDIAKqg3uQgtG0uGH2Wvhvi+JLw==
X-Received: by 2002:a17:906:ca59:b0:a45:40e4:8c8 with SMTP id
 jx25-20020a170906ca5900b00a4540e408c8mr355615ejb.16.1711572362918; Wed, 27
 Mar 2024 13:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com>
 <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
 <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
 <bu3seu56hfozsvgpdqjarbdkqo3lsjfc4lhluk5oj456xmrjc7@lfbbjxuf4rpv>
 <CAHk-=wgLGWBXvNODAkzkVHEj7zrrnTq_hzMft62nKNkaL89ZGQ@mail.gmail.com>
 <ZgIRXL5YM2AwBD0Y@gallifrey> <CAHk-=wjwxKD9CxYsf5x+K5fJbJa_JYZh1eKB4PT5cZJq1+foGw@mail.gmail.com>
 <160DB953-1588-418E-A490-381009CD8DE0@gmail.com> <qyjrex54hbhvhw4gmn7b6l2hr45o56bwt6fazfalykwcp5zzkx@vwt7k3d6kdwt>
 <CAHk-=wgQy+FRKjO_BvZgZN56w6-+jDO8p-Mt=X=zM70CG=CVBQ@mail.gmail.com> <bjorlxatlpzjlh6dfulham3u4mqsfqt7ir5wtayacaoefr2r7x@lmfcqzcobl3f>
In-Reply-To: <bjorlxatlpzjlh6dfulham3u4mqsfqt7ir5wtayacaoefr2r7x@lmfcqzcobl3f>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Mar 2024 13:45:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiSiNtf4Z=Bvfs=sGJn6SYCZ=F7hvWwsQiOX4=V0Bgp_Q@mail.gmail.com>
Message-ID: <CAHk-=wiSiNtf4Z=Bvfs=sGJn6SYCZ=F7hvWwsQiOX4=V0Bgp_Q@mail.gmail.com>
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: comex <comexk@gmail.com>, "Dr. David Alan Gilbert" <dave@treblig.org>, 
	Philipp Stanner <pstanner@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marco Elver <elver@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 12:41, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> _But_: the lack of any aliasing guarantees means that writing through
> any pointer can invalidate practically anything, and this is a real
> problem.

It's actually much less of a problem than you make it out to be.

A lot of common aliasing information is statically visible (offsets
off the same struct pointer etc).

The big problems tend to be

 (a) old in-order hardware that really wants the compiler to schedule
memory operations

 (b) vectorization and HPC

and honestly, (a) is irrelevant, and (b) is where 'restrict' and
actual real vector extensions come in. In fact, the type-based
aliasing often doesn't help (because you have arrays of the same FP
types), and so you really just need to tell the compiler that your
arrays are disjoint.

Yes, yes, possible aliasing means that the compiler won't generate
nice-looking code in many situations and will end up reloading values
from memory etc.

AND NONE OF THAT MATTERS IN REALITY.

Performance issues to a close approximation come from cache misses and
branch mispredicts. The aliasing issue just isn't the horrendous issue
people claim it is. It's most *definitely* not worth the absolute
garbage that is C type-based aliasing.

And yes, I do think it might be nice to have a nicer 'restrict' model,
because yes, I look at the generated asm and I see the silly code
generation too. But describing aliasing sanely in general is just hard
(both for humans _and_ for some sane machine interface), and it's very
very seldom worth the pain.

            Linus
