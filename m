Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D591B1E0E00
	for <llvm@lists.linux.dev>; Wed,  9 Apr 2025 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744229881; cv=none; b=PTt87rK6P36o2pdlaNohljyaymGgIYpQgo2/0eYoumVMUPJI7vmrUQzutMZX9AP2qvYvNtZr7M3iQiBsn/cF3QrZIA9FkR0vhjKOfbY1WMorvYrJqE54GakVkU6WUpqDDoZe4LCeu63X4NjccAcKEwFSrkyD7DL8FVM9AC2+NQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744229881; c=relaxed/simple;
	bh=DN0wpjoBwbm62a2PojPzy9eL4TkNTyJB5bl5qwh5q5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6bImtr54WZb4hUgOIeadxBcEuhtN0Xivd5awhf768lR6G+BuIGn3HulArvCJ87HCN+cX7rnUNd80URnh18znWCo6HBIyaidGujlO9642Fc3GuW62fgq1uRv8jef5PbB9zQpHSmka+tecYE8TFX7w2qWRyZqdGyvHqz3qeQkB+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VufsG6qd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VufsG6qd"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so8511f8f.0
        for <llvm@lists.linux.dev>; Wed, 09 Apr 2025 13:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744229877; x=1744834677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bgWloY6Z/GPjOoVRp8gFI5U+gR/p1lk09lOlKvqmyk=;
        b=VufsG6qdyWvy7r71BFvd+jdmmAZubJwgJwH+HaL8/6yIrKFfqZe82+sFljehM/EDoR
         W25iidjNMPUWV8ZdLoMf0J4raGhZtdcu+8BlQ/FiNH6trD+9RHeyITGBkEq01h5Arw4X
         Yb6C1qGdgR6EUcU8S2lnu/6bkHgoo5n3ZuEljG5+ZojcG49K/wzArHae62K532gmaS9D
         0LJtL2/0ceO/sfosWV4877pH/353D3pk3h8ccG+dpJFf543lU0bJo6RGRfxGben602AQ
         nwAPUU3PxS6U5bjSkn+ttvio9Exp1PCaO0VlkH1q3eGk+TNoGraKxf5ZyhDNRGKyDKN+
         i8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744229877; x=1744834677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bgWloY6Z/GPjOoVRp8gFI5U+gR/p1lk09lOlKvqmyk=;
        b=B62JffSoK40XDhk3Gj+IjheN/s5tR/ax12ItgIiscjTTxf5lpqLEug/QANZhQPLnLZ
         ovBpNGYuhbra7qIDTSWfx1ljIzrFzusYuZPT/pD+yqGF/+rvTw6eNeXEo5XSZBWjuVde
         gpy6jx6gEdJt2CwSq8bq6QlnHUycBcPgrTkVpECsBBLI4MeRGeNxIgELJGiW/u0ZXBfE
         PX9wTYnqjUpzC0nnZEM6yc0n5VnEVQnGSYSpdkhl1aZQMoChkT4nr6WlqU0G38MTZCFN
         hEe0zvEWbzzkFfkUPAGIhDYPkCfZB8JND9b9K1MgGB/4PPhUPtPJIG32sK56I/U7MiI8
         B8hw==
X-Forwarded-Encrypted: i=1; AJvYcCVpZk1mWpQtJI3ftKmGq309LxFR4ya91g7J5cWTQ3HIhThPnMI70uwAZHuqlQSQmb4YGo7I@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp4m80S9NDie8E9IwgWuSy+1lYWj/Wm4CEf/VcvShzyABPcc3L
	DhTZUDoclbIwhFl7tFTmbejWkG33Mivc72SENKZXhf5Cy9WKCPvMtP25/L7D805pGmiiAHHLSKA
	IGqKzi7cgdjiDorf5Y35IE63lKyP2YtZr0hev
X-Gm-Gg: ASbGncsYb7sFk5RMBJl4izm9OOu/ho9XXtlp/7sYDqY3DNDiRX2b7sfl1BRis8verps
	CKPbiUvJv33njQzIKL94IgRa1pF1AbI/Qhxfy2+hscyxhPTaw7vQ1RfrRB1A4b2eE7Dziuhq9gw
	uqaXydPgvMUsnLrEic5fpQMPY=
X-Google-Smtp-Source: AGHT+IHF65zLg7feilUYDheUibZgFpivGomhAMQ9nvtXy1QRwJ0EXV2IXKYLDmuiA2LwoPriA5ZqZstTr5vam02ZaAA=
X-Received: by 2002:a05:6000:2411:b0:391:2dea:c984 with SMTP id
 ffacd0b85a97d-39d8f463cd4mr86810f8f.11.1744229877002; Wed, 09 Apr 2025
 13:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-3-gary@garyguo.net>
In-Reply-To: <20250319205141.3528424-3-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Apr 2025 22:17:44 +0200
X-Gm-Features: ATxdqUGIImZWdIXFXkMtgq_6FpLUl4WUHaHz6zPbTJ9JLlSwvxfpfqMMQQdWOGU
Message-ID: <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Daniel Xu <dxu@dxuuu.xyz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 9:53=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> A new Kconfig option, `RUST_INLINE_HELPERS` is added to allow C helpers
> (which were created to allow Rust to call into inline/macro C functions
> without having to re-implement the logic in Rust) to be inlined into
> Rust crates without performing global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is patched to add `linkonce_odr` linkage. This linkage
>   means that functions are inlineable (effect of `_odr`), and the
>   symbols generated will have weak linkage if emitted into object file
>   (important since as later described, we might have multiple copies of
>   the same symbol) and it will may be discarded if it is not invoked or
>   all invocations are inlined.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked to combine the helper bitcode with the crate
>   bitcode. This step is similar to LTO, but this is much faster since it
>   only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
>
> Some caveats with the option:
> * clang and Rust doesn't have the exact target string. Clang generates
>   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
>   complain if `-Ctarget-feature=3D+cmov,+cx8,+fxsr` is used). x86-64 alwa=
ys
>   enable these features, so they are in fact the same target string, but
>   LLVM doesn't understand this and so inlining is inhibited. This is bypa=
ssed
>   with `--ignore-tti-inline-compatible`.
> * LLVM doesn't want to inline functions compiled with
>   `-fno-delete-null-pointer-checks` with code compiled without. So we
>   remove this flag when compiling helpers. This is okay since this is one=
 of
>   the hardening features that does not change the ABI, and we shouldn't h=
ave
>   null pointer dereferences in these helpers.
>
> The checks can also be bypassed with force inlining (`__always_inline`),
> but doing so would also bypass inlining cost analysis.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Is this compatible with DEBUG_INFO_BTF? I'm concerned that we have the
same issue as in commit 5daa0c35a1f0 ("rust: Disallow BTF generation
with Rust + LTO").

The commit message should either explain why we don't have the same
issue, or this patch should prevent configurations from enabling both.

Alice
