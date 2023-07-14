Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D4D111B4
	for <llvm@lists.linux.dev>; Fri, 14 Jul 2023 10:13:40 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-cad564b45e1so1451812276.2
        for <llvm@lists.linux.dev>; Fri, 14 Jul 2023 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689329619; x=1691921619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxNp02bNCTAVyLPRZ82mLPkwbAN62CIGC9HHKgWokDk=;
        b=2F4xNUdVveqN+R5EKr8RvDc7bTWM+gLKOemIBdfkq0xCOm+Cr4UcTnXi7Ex+Z93qzm
         0Jr5cpq2w11H+0Cg6FN9ZTSvdb5obWOs5j0cgJ0bcrvXiE2RRrlmIoxST4HoWSBwgOK2
         8JD3CugG730wX57wEfvKkXfRliM7CBRRje7zXW9Eh8XpC3vlQcb8g9lC3f7RU2/c+xih
         zeerj13DLEEgAOKU8aDV2UeFmV+9cbL73eRaQL//xH4DpiXrl7+msaF7IidwNkSYAvxL
         rZh7VEifal0tY7Lt6YJ1DvF9fWQNWkiFiAlRb1vLaDscgIZXzMzIrbT3QjcbJLDqu6o/
         RHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689329619; x=1691921619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxNp02bNCTAVyLPRZ82mLPkwbAN62CIGC9HHKgWokDk=;
        b=RpV7RezgSqVELMsRAbGTieo6ZLXNPtkttp7JyygXhb0sovN16pNgXYLYBTMFfZeOaM
         89lncbEQv71mcZbLHSjSRkytVQBwANhw6bJ1z1m1GALOzxdH+nGNy2eQsiLSgkPa7tpz
         sFT7MNv8UPwRP/UA61v88l+jSUHuj07QmDSzQsUZr+K2r/b2cy6368eYN4YkQ9GNGGVz
         1hhFi7qDquDv8teh1bNvKDAZd7tfoCkxERHlGJ7POjKYxAZxbg+bGZVAZ/+iztG5U6Y+
         wDkJhAGvudhxX4jUv2f+fCZ71M+MWKa8TGjSTFdSBfzOZjsOkE9PGlfaTQApMJlNTn+C
         rd4w==
X-Gm-Message-State: ABy/qLZ1uyk/wl5SZO32tJ1sss4j0M/WsOQn4w7ACAw47rpKin0HgQio
	5P+AOURrnqQ7N15ZQl51ZXzLZh7Qp2HOQl4=
X-Google-Smtp-Source: APBJJlFQrE4sbqNmMgiT0tYYLjApKeHUUY+9Z7jWQry23roqS1du7n+Bvn1DHckLfj2QgRK2ut1rlpfSA3O9848=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:9cc8:0:b0:bac:5d2c:844b with SMTP id
 z8-20020a259cc8000000b00bac5d2c844bmr22156ybo.8.1689329619648; Fri, 14 Jul
 2023 03:13:39 -0700 (PDT)
Date: Fri, 14 Jul 2023 10:13:37 +0000
In-Reply-To: <20230714-classless_lockdep-v1-0-229b9671ce31@asahilina.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230714-classless_lockdep-v1-0-229b9671ce31@asahilina.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230714101337.2193665-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC 00/11] rust: Implicit lock class creation & Arc
 Lockdep integration
From: Alice Ryhl <aliceryhl@google.com>
To: lina@asahilina.net
Cc: alex.gaynor@gmail.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	daniel@ffwll.ch, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, marcan@marcan.st, 
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
	nicolas@fjasle.eu, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	sven@svenpeter.dev, trix@redhat.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"

Asahi Lina <lina@asahilina.net> writes:
> Begone, lock classes!
> 
> As discussed in meetings/etc, we would really like to support implicit
> lock class creation for Rust code. Right now, lock classes are created
> using macros and passed around (similar to C). Unfortunately, Rust
> macros don't look like Rust functions, which means adding lockdep to a
> type is a breaking API change. This makes Rust mutex creation rather
> ugly, with the new_mutex!() macro and friends.
> 
> Implicit lock classes have to be unique per instantiation code site.
> Notably, with Rust generics and monomorphization, this is not the same
> as unique per generated code instance. If this weren't the case, we
> could use inline functions and asm!() magic to try to create lock
> classes that have the right uniqueness semantics. But that doesn't work,
> since it would create too many lock classes for the same actual lock
> creation in the source code.
> 
> But Rust does have one trick we can use: it can track the caller
> location (as file:line:column), across multiple functions. This works
> using an implicit argument that gets passed around, which is exactly the
> thing we do for lock classes. The tricky bit is that, while the value of
> these Location objects has the semantics we want (unique value per
> source code location), there is no guarantee that they are deduplicated
> in memory.
> 
> So we use a hash table, and map Location values to lock classes. Et
> voila, implicit lock class support!
>
> This lets us clean up the Mutex & co APIs and make them look a lot more
> Rust-like, but it also means we can now throw Lockdep into more APIs
> without breaking the API. And so we can pull a neat trick: adding
> Lockdep support into Arc<T>. This catches cases where the Arc Drop
> implementation could create a locking correctness violation only when
> the reference count drops to 0 at that particular drop site, which is
> otherwise not detectable unless that condition actually happens at
> runtime. Since Drop is "magic" in Rust and Drop codepaths very difficult
> to audit, this helps a lot.
> 
> For the initial RFC, this implements the new API only for Mutex. If this
> looks good, I can extend it to CondVar & friends in the next version.
> This series also folds in a few related minor dependencies / changes
> (like the pin_init mutex stuff).

I'm not convinced that this is the right compromise. Moving lockdep
class creation to runtime sounds unfortunate, especially since this
makes them fallible due to memory allocations (I think?).

I would be inclined to keep using macros for this.

Alice

