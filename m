Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F628DB4
	for <llvm@lists.linux.dev>; Thu, 26 Oct 2023 11:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nrF17K5L"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-457e36dcab6so1260985137.0
        for <llvm@lists.linux.dev>; Thu, 26 Oct 2023 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698319023; x=1698923823; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ADQcQPFXDFUAE1kDLSEymM4GykgZRpKmE6Mqe8TDGH4=;
        b=nrF17K5LRTUKePHzEFb8S23kwwwulNRoem1g30DHV1YJhqrKfd/JS5ftNoYHgbHwn8
         u3XDVLHNZS0U6gDC387Kz2F4gflKQ16z3CZQuoEnqLFbFQZdg/p9gIm1M4+5qV0t+ljg
         0S0x5SVgS/htFVLi3vYZbTPvWNIx7vqSqw18BpngWwd4tGs9ayCanlDlRN/W7IOwwRvK
         nYuccE43tUlSDGc8iUcsoIXTC8JAQwAuvohqZt8/HgEBm7vRS8RlGQL95C6vJmz87OOh
         T4aBLD9uxhIlt9IxkgVar6gSKLF1yvneG0lPdup5Z85RLF6gRlNkZ2elVJjXd6T7GqOv
         bqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698319023; x=1698923823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADQcQPFXDFUAE1kDLSEymM4GykgZRpKmE6Mqe8TDGH4=;
        b=FEVbEwlmRk8GSB8rtJ7XMXqdFbygQFgC+IwM8NzCsBhASRDrfNc5p9c/YKVJcSRDZj
         Maed0akek6deRQDbwNJZk6TKI4V+Xzufnv22FRRi2URZhEQ0xmiQl4AOeesCYrgy8rrm
         TPS/jCKO7mOHUJbBs0voBEIeUOpBhxSBRHkgjMTE0j3Jx1kjg2A+BdaHuexsyKy0YowD
         nJZ4K4Yhg2eTaCzEec1KUw8FsBz38cs+9jyh78QF1JTNNUzCrTSdxILLVTTQMRuj+YXU
         1+Y9t/GBXURAEh6bd5u76PXvVeOJgFB6+1GYbZQLuFTJlW4tt8lZ36j+zpRidjYq3Gdc
         Pu6g==
X-Gm-Message-State: AOJu0Yxhjrr7wHvyfKE0i82Z/9OugOO/KvGXTJft7He1ndFUiTDvKHFI
	cluKctzBjHHUqEG4oL3ILMYtZtdxdGNCR0ok8rAD1Q==
X-Google-Smtp-Source: AGHT+IFL1Bi1n9i8tyu/TR0kE59uAhq0MbAYLquMr3viL391nUxuNb4eUNFXaqX2lALhkyqgTfVTxU9ppHTJB0CpVFA=
X-Received: by 2002:a67:e086:0:b0:450:cebb:4f15 with SMTP id
 f6-20020a67e086000000b00450cebb4f15mr1164753vsl.1.1698319023532; Thu, 26 Oct
 2023 04:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231025195339.1431894-1-boqun.feng@gmail.com>
In-Reply-To: <20231025195339.1431894-1-boqun.feng@gmail.com>
From: Marco Elver <elver@google.com>
Date: Thu, 26 Oct 2023 13:16:25 +0200
Message-ID: <CANpmjNN6PN7tNLuUKZXcTe5n=HOv9Po0er0cDhvP9x=uA7rTTw@mail.gmail.com>
Subject: Re: [RFC] rust: types: Add read_once and write_once
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Dave Chinner <david@fromorbit.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Oct 2023 at 21:54, Boqun Feng <boqun.feng@gmail.com> wrote:
>
> In theory, `read_volatile` and `write_volatile` in Rust can have UB in
> case of the data races [1]. However, kernel uses volatiles to implement
> READ_ONCE() and WRITE_ONCE(), and expects races on these marked accesses
> don't cause UB. And they are proven to have a lot of usages in kernel.
>
> To close this gap, `read_once` and `write_once` are introduced, they
> have the same semantics as `READ_ONCE` and `WRITE_ONCE` especially
> regarding data races under the assumption that `read_volatile` and
> `write_volatile` have the same behavior as a volatile pointer in C from
> a compiler point of view.
>
> Longer term solution is to work with Rust language side for a better way
> to implement `read_once` and `write_once`. But so far, it should be good
> enough.

One thing you may also want to address is the ability to switch
between READ_ONCE implementations depending on config. For one, arm64
with LTO will promote READ_ONCE() to acquires.
