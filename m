Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558521;
	b=cGtHQ618B9txObvKHZILvwLra8UsAuKc5eepXDv2lzb70NeINSzKOotL+962zZrJCZpY
	 DLbxGnvdEqFzXnuydHorPjcT4qWvWRBaGipDrzfKxUytpcWm+kS0ZHbHfxVp/AqYwcAUc
	 VSdjmx3UsMMd/i/DxYf8rHSqKcFnmr5SrHc4xbW2k5/EWyY3JjRpohGOaj2BQuco+8TDC
	 eFmhHT9JGf+3T/9OIoR99+Hx4cdLd5WaWTTgfqDjVEyBRvKXwkJ7Lda5VvMwOtKsvrE3H
	 nVr2C+19KWT5myKBH0Gym3GXXzMo1/NbTcO12o3ZTMmo9q+Z8oiKnIJG7+u5yr41fkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
	b=CE9hKcQ+lCXSH2ZzquDgisaZLEwDO7R1Nnuf5MRTe8QnE87vYqrFzOgvWl/IbcqTet9x
	 jBQHdTjd7T3+nsSxz4rLqfgLyVa3qb4JkxB1FtwZStoneGXgP6RKTittPy6ko3UdX9L1J
	 PHGx1yxWnVvFj8Ibz6gq2dkq7vfaKH1e6WMgXXAPfpN52TqzQEDZaJ1qlNkHueRUd04qz
	 /R0djTI5/xf5M5yqd53Rh66+aYsy18znGoUJ+TYk1JQeWahyDrOz+9Jib0GEwGtoVkSnQ
	 rTburo6odt/8tIfAf61F1gZLpJAsUCBQ6yMPqFMuaheHUp16q01OjBoJKUw12I7gD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DY4ltKq9;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF3B606C995
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF3B606C995
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DY4ltKq9
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so1034278a91.3
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794558520; x=1795163320; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
        b=DY4ltKq9vo54Fp7uGmu8TzwhHzw6SmAyBl4T31MxY1zaTotUvte03n+7bqFubG4QsT
         VJPFADyE6rKOWMm7lYnblxxQGQ5o2F3+O1HgZIJGsJaGT1cFf9KzMcfzuL6nX+oXu142
         XdumpR2+QvXNthcKTscigwQ6fwKS172s0CxcJXjNi46CyD+SMf9JMLqw/mktW4/IsC/t
         DkjVJDoBRfQ0Z8WoWu/A6Cd8xqsnYMJW2oSulo98mBVr0oDufgVFnkgZogC/3PIKpOZi
         9Q18KJgO5DR6A/N6UiRwHm+AiHcYlswYqXaI9rPOc/C6/IdtAjrDMUZb9H0QXPdN2kiH
         Fduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558520; x=1795163320;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
        b=Xia1h7jRsPkCBGDU+HA+dzrODH4qaKeKyMX95+bkI3VR2e7Z2p0bOYV2Dyy45ZxgBU
         g/4Vxh6DQ3mhi7QLFOxKP4F/5+/uY1rAnuTwB/V3Rb3IynVhiwLAdMLiNDgX090kMYjc
         S41VoBH65pF2vHqyqS3KEV5lsITIBOkX0nyO9gHRlxJqm/aYuw7lekzXI3MSSSwR7rAP
         4sY+7mGDKZXrjHYC0zlPh4/0kWB5dAf2hizkIWVJqNQr0qPJe3xMdeywirawkrXYs++2
         JgFs2+Ge9pbt1f2J541YgriDskSFt5Ffjng4GUVB4j6x8rxHIZQ3Ed9GLeFq5Qmj6Jt4
         h9UQ==
X-Forwarded-Encrypted: i=1; AL+hErGvZunHqQqD3uDTNk66ylsEAMGy28RHles1h5OCsow0lEa5WwAPWY/7laqjlFjSkPr5BFxk@lists.linux.dev
X-Gm-Message-State: APuU4Z/WGwYQgqPoLy/pON4X8q4J9klS/sRtnh9kOvj8L/3nk9ey+Ggx
	0oCWa7T0CWq99w3zI9PZBafhDLG4xH6hvwj5RKdYQrcBGUKk0+WDFQjQHZhRHOAn8jVx0NkrzeB
	8vqr7Zw5cJlwdKqM0EU3G2Q==
X-Received: from pjvd14.prod.google.com ([2002:a17:90a:d98e:b0:3b0:9569:4e9a])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d87:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3b1b0a3a2f9mr1460229a91.42.1794558520120;
 Fri, 13 Nov 2026 00:28:40 -0800 (PST)
Date: Fri, 13 Nov 2026 08:28:37 +0000
In-Reply-To: <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261031030807.4101384-1-jenhaochen@google.com> <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113082837.4011638-1-jenhaochen@google.com>
Subject: Re: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
From: Jenhao Chen <jenhaochen@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Rong Xu <xur@google.com>, 
	Han Shen <shenhan@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 7:48 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> This sounds reasonable, but my LLM spotted that Clang will run
> `AddDiscriminatorsPass`  again, i.e. on the optimized bitcode that
> `rustc` produced. So the profile ends up indexed by Clang's renumbered
> discriminators, and then the build that uses the profile will not find
> a match for some code (depending on inlining decisions), i.e. that
> part of the profile is silently dropped.
>
> It proposes `-mllvm -no-discriminators` in
> `CC_FLAGS_RUST_INLINE_HELPERS` so that Clang doesn't add them, i.e.
> using the `rustc` ones.
>
> Rong, Han: is that expected?

Hi Miguel,

Nice catch -- I tested this on drivers/android/binder/rust_binder_main.o
(arm64, Clang 22 + rustc 1.91) and confirmed that the duplicate
AddDiscriminatorsPass run is real and that passing
`-mllvm -no-discriminators` to the post-llvm-link $(CC) step improves
profile matching in both stages:

1. Why the second AddDiscriminatorsPass renumbers discriminators:
   In Stage 1, rustc runs AddDiscriminatorsPass on pre-inlining IR and
   then runs its optimization/inlining pipeline before emitting .bc.
   When post-llvm-link $(CC) runs AddDiscriminatorsPass again on the
   already-inlined .m.bc, llvm/lib/Transforms/Utils/AddDiscriminators.cpp
   keys blocks by (filename, line) without checking inlinedAt and
   overwrites existing base discriminators via
   cloneWithBaseDiscriminator(). On rust_binder_main.o, that second pass
   increases non-zero DWARF .debug_line discriminator rows from 6,245 to
   9,313 (+3,068 rows, +49%).

   In the profile-use build, rustc's SampleProfileLoaderPass runs before
   rustc's inliner (against pre-inlining discriminators), while Stage 3
   sees a different post-inlining CFG once Stage 1 has applied the
   profile.

2. Measured round-trip impact (42 sampled functions in
   rust_binder_main.o):
   - Stage 1 (rustc -Zprofile-sample-use): annotated branch_weights
     increase from 454 to 490 (+7.9%) when the profile is generated and
     used with `-mllvm -no-discriminators` in Stage 3.
   - Stage 3 ($(CC) -fprofile-sample-use): SampleProfileLoader record
     coverage increases from 39.3% (2,832 / 7,205) to 54.0%
     (3,707 / 6,860, +14.7 percentage points), and sample coverage
     increases from 42.9% (757.8K / 1,767.6K) to 56.4%
     (989.6K / 1,753.4K, +13.6 percentage points; 969 -> 1,035
     branch_weights). Against a hardware ETM profile, Stage 3 matched
     function entry counts also increase by +33.9%.

3. Side-effect checks:
   - C helpers: rust/helpers/helpers*.bc is compiled separately via
     cmd_rust_helper (without CC_FLAGS_RUST_INLINE_HELPERS), so C
     helpers still get their pre-inlining base discriminators before
     llvm-link.
   - Flow-sensitive discriminators: MIRAddFSDiscriminators in
     llvm/lib/CodeGen/MIRFSDiscriminator.cpp checks
     EnableFSDiscriminator and shouldEmitDebugInfoForProfiling() rather
     than NoDiscriminators, so post-link FS discriminators remain
     enabled.

Rong, Han, Miguel, Nathan: would you prefer adding
`-mllvm -no-discriminators` directly to `CC_FLAGS_RUST_INLINE_HELPERS`
in the top-level Makefile, or appending it in scripts/Makefile.autofdo
under `ifdef CONFIG_RUST_INLINE_HELPERS`? Happy to send v2 once we align
on the preferred spot.

Thanks,
Jenhao
