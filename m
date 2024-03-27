Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968AB53360
	for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 22:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711580253; cv=none; b=p+WlqK+0rX7Wi2WtR5oeXTSsoc7el88TpipNSjvx/BZ/1wt5AHIUe+bQZKR6zY/OD3pIPK4j3E5h3l9xFZwV4up3eSlypxb2hXGRFjkLSKuhH+SPusdqxuaimZI7O4MJfHQtGEFpRZlXcDJD630lr8s6KLEYN2bGjQehapeQcUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711580253; c=relaxed/simple;
	bh=VO6BQZp9XbSQ+WsnBdem/mcXj4kD5L/TqZKDrqpZiSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZN6BDf7Qxu+Tqty99wTpKFs0k+qALXrAPYWRvYDVFev384zCmJjcn4jZwQ+7ULZniG4El2EXm42uO4waPbWulkIJuFOA8qvSv7vKp3lqtmQ9K9lTWji0wzolmQDRQY9GIdf2UzGKW4sDORPt5uCQCLqRXPeXxSt/KbHAqtw0EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MxiWYjZh; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MxiWYjZh"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d687da75c4so3340871fa.0
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711580250; x=1712185050; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ME3b1Rt51xAoj3MwQWhqtTxBw4ApU7TZHqRjbw2b7co=;
        b=MxiWYjZhlqXkQ8dywf/Wq+on0kXe43FvxEKxOC3NWHNDMZOjC+txmhgK+i2C7THtH2
         8ceCvuTLkytc4t48nNjxALOtREfWGvhb8nDFzkGeFSnNK+3R5yv2dSPQXYjK6zrFX3k5
         hNw+4qX6wrd1AHoCSM34vi/2A5nLTjvE//AAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711580250; x=1712185050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ME3b1Rt51xAoj3MwQWhqtTxBw4ApU7TZHqRjbw2b7co=;
        b=VgtuBlvBifExvycJVsBeZZaE8a8GsNL6EXxp7Thk3Ad19iG1xa63DKslPp44Km9duW
         w7AzLz2CzfwTmQAaE6w3ALxU+K7JPSteQk8K4ZtsH0h2Oi62QXrf3X50K0LH8A+SaL7i
         2g1n0KMuMtV7dxFav9nXQb3JlHDym35XuMCPxMRyp/ctL/TwL/jydoOiTYCg/weMEICK
         CKc55zl0al0o1BoXVVvMEW6nJYrKpJLbZdPOyidVDNZsJwPJ6Zm5Ko72ojgNbyA32LyX
         Oiashkam12XrTaVH4OQIaV7swJvBSgpEgsp6FL/a9wY07f69O41NFZURfN2cR85F2L/l
         /IwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDFMLLT8CUHS3s2RqTZbZVWYxYVtuG/Dgxi+aVgXaWGOUZ/XMhnwFCHJsvEAhjz5r0XSRnjDaaP040CE/MGqcu50rJ7A==
X-Gm-Message-State: AOJu0Yxb0CpvTBq+TAbAU23fVP5jB+Z2YxTSSKwbl87emrEpKa7PE4BS
	ZF+ewAXhuKjQqn2WqtzM57OakrtAXdYChQgNCnyIlieBwIq+PEnokWENlDOzecSywyC3EbVWxlZ
	dPRu+iw==
X-Google-Smtp-Source: AGHT+IGsJ81XOHNC/HfWT0ezkoMuHtxeupZFxxO1+BV56n/phaO+sqaI+6N4upRELNCt4Z6LiSsuKg==
X-Received: by 2002:a2e:720b:0:b0:2d4:a232:757 with SMTP id n11-20020a2e720b000000b002d4a2320757mr530194ljc.7.1711580249661;
        Wed, 27 Mar 2024 15:57:29 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id p28-20020a056402501c00b0056c4a5c350asm111797eda.11.2024.03.27.15.57.29
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 15:57:29 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56c1922096cso424768a12.0
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 15:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcStMRCrUAIvIUFsLudkWnzh0qf5eBBQAxueNCfm7M5X1ZJdu8vlN2wIbLZ6AjbwPS7N7m1cdcnRJ4te+Rsfpoa2eHww==
X-Received: by 2002:a17:906:1352:b0:a47:3887:db68 with SMTP id
 x18-20020a170906135200b00a473887db68mr468280ejb.38.1711580249028; Wed, 27 Mar
 2024 15:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
 <bu3seu56hfozsvgpdqjarbdkqo3lsjfc4lhluk5oj456xmrjc7@lfbbjxuf4rpv>
 <CAHk-=wgLGWBXvNODAkzkVHEj7zrrnTq_hzMft62nKNkaL89ZGQ@mail.gmail.com>
 <ZgIRXL5YM2AwBD0Y@gallifrey> <CAHk-=wjwxKD9CxYsf5x+K5fJbJa_JYZh1eKB4PT5cZJq1+foGw@mail.gmail.com>
 <160DB953-1588-418E-A490-381009CD8DE0@gmail.com> <qyjrex54hbhvhw4gmn7b6l2hr45o56bwt6fazfalykwcp5zzkx@vwt7k3d6kdwt>
 <CAHk-=wgQy+FRKjO_BvZgZN56w6-+jDO8p-Mt=X=zM70CG=CVBQ@mail.gmail.com>
 <bjorlxatlpzjlh6dfulham3u4mqsfqt7ir5wtayacaoefr2r7x@lmfcqzcobl3f>
 <CAHk-=wiSiNtf4Z=Bvfs=sGJn6SYCZ=F7hvWwsQiOX4=V0Bgp_Q@mail.gmail.com> <psy7q3fbnjeyk7fu6wyfecpvgsaxel5vcc6cudftxgyvj4zuhf@3xhjikjjy5pn>
In-Reply-To: <psy7q3fbnjeyk7fu6wyfecpvgsaxel5vcc6cudftxgyvj4zuhf@3xhjikjjy5pn>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Mar 2024 15:57:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjpos9wLwxgoUwp10C70DuOSGbC3uZiPp8ufEvM-bNtQ@mail.gmail.com>
Message-ID: <CAHk-=wgjpos9wLwxgoUwp10C70DuOSGbC3uZiPp8ufEvM-bNtQ@mail.gmail.com>
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

On Wed, 27 Mar 2024 at 14:41, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
>
> On the hardware end, the Mill guys were pointing out years ago that
> register renaming is a big power bottleneck in modern processors;

LOL.

The Mill guys took the arguments from the Itanium people, and turned
the crazy up to 11, with "the belt" and seemingly trying to do a
dataflow machine but not worrying over-much about memory accesses etc.

The whole "we'll deal with it in the compiler" is crazy talk.

In other words, I'll believe it when I see it. And I doubt we'll ever see it.

               Linus
