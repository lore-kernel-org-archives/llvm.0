Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565EC3A1E92
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550462; cv=none; b=BX0jvCbpw1VjSZlkYc2dlR8PONVq9srETShq/+gEFUs3RSst/KqqkUpa8fRWAJMje1B8X5KYyKLC1CFgH82oxPFDlyClXSvg80bXW7NC6yJwOBBjrMSMkqtZS0y7X8HVwYdVa43MjANQmnqnZuTt6xeFTmxtW5ccdrXESad2GKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550462; c=relaxed/simple;
	bh=oXt2D3mzjY6Xh7RIQiGQbIMsGYUhXnAHlGSfko+HrVU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HanqQd4ZlABdLZTifVBRMk/by+zJRCFBn5jFgE26eVKJ7AjGmimikAFWdR4dbYTQUCjFGu+3/3bwEzky4bYnG4A4RXDgvD2RSmI5AHl2okKBcU9keWxnLI+aMZT5uVlsuQivGy4dazpq/48J5/wGT31j3aARBHRLNcf0hfutLug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qjyw77/v; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qjyw77/v"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43d121c4271so3297959f8f.3
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775550456; x=1776155256; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YfesjVc33YVbvrRgbpVhoI4lNEk3yuWGS7BHzlN2wz4=;
        b=qjyw77/vCVx3gvsDLQsne6TVTkRXk1wWjhWXxaoq/u1xDP1CzbP8iDLLivN9scb7wx
         tBJDltL1ATxs9/ZxmT0GVqCjhduYeXpqJdb8DxJxRzrcKFO+mkCjlpBooy4B7PeY7B2d
         z0BuygcTMErQrRTZ7AsIngkxVE7wkbcKVhpBncI2cwr74WKF8f9kUJYKhVDdMqLa3hDy
         QS4MFg1afgaSHtWzR1/IkxempbUeupM3gIU8X9rw40aAsIXeM+0/sMPxazuijiN3YII6
         gULdrUAjDLcTkOj8i7RDpTj0YSODGWR/ZJM+2BQVC2sUzrc27Lq5KQZoyURp6Voari9A
         0S0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550456; x=1776155256;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YfesjVc33YVbvrRgbpVhoI4lNEk3yuWGS7BHzlN2wz4=;
        b=DUVJgo+hJJwQ21sxGWpdEEto5OiPC2/Lv5E/frdKtoWxuaYDwnJNjFkw7mzOaRrDEo
         1tgdqdjWqDZEtXRK8l2IU3UzK/KdPFgZPndfGR4fwshSJs121IJEnhZFbL1snd69S5iu
         +N70vKdkFcRbaF+U0HJBQRgylnvQxCQo4See/BsHZOpMJrFnnp0ppt9Ci3k1R+cG5jrd
         HFUotIy1EXaOE35D3bmnF0BO1YFzsTvhb2ZQ5Cm3uqr99YZOHEUaoWobnCXFNywbrkiX
         iervV6bQnksd+q7SB15/fdQt3oKo1+2b+VFsu0iohIgfhtYI7Tu88+sXNaGvkLEDaB5h
         Lyug==
X-Forwarded-Encrypted: i=1; AJvYcCUeler0O1S45JO2YfwBygvZQQMOlAWaU0p5MXa1LIWUGNDoL6gFZx6lzHiOtpfW9iSiBVC0@lists.linux.dev
X-Gm-Message-State: AOJu0YyU66IAhUuSHhBnan8SJ6RRaXlN3eDu2ajpfRDA0YL5Kelm3YB5
	1oExbU/5Z2F/6+h+74KYqu469Vuun2nfBvQeG2HChNAfCIlZLbr9NWbcFPydk00Eg8a6HXFQBYI
	LWr0OvxsQfySN46bsXw==
X-Received: from wrsq11.prod.google.com ([2002:adf:fecb:0:b0:43b:4d9e:4462])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:184b:b0:439:cb9f:d635 with SMTP id ffacd0b85a97d-43d2930fa4fmr23557051f8f.46.1775550456167;
 Tue, 07 Apr 2026 01:27:36 -0700 (PDT)
Date: Tue, 7 Apr 2026 08:27:35 +0000
In-Reply-To: <20260406095820.465994-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260406095820.465994-1-ojeda@kernel.org> <20260406095820.465994-2-ojeda@kernel.org>
Message-ID: <adS_9xKmq7hvycYn@google.com>
Subject: Re: [PATCH v2 2/2] rust: std_vendor: add `likely()`, `unlikely()` and `cold_path()`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 06, 2026 at 11:58:20AM +0200, Miguel Ojeda wrote:
> `feature(cold_path)` is becoming stable [1] in the upcoming Rust 1.95.0
> (expected 2026-04-16).
> 
> `cold_path()` can be used directly, but it also allows us to provide
> `likely()` and `unlikely()`, based on `cold_path()`, similar to the C
> side ones.
> 
> For instance, given:
> 
>     fn f1(a: i32) -> i32 {
>         if a < 0 {
>             return 123;
>         }
> 
>         42
>     }
> 
>     fn f2(a: i32) -> i32 {
>         if likely(a < 0) {
>             return 124;
>         }
> 
>         42
>     }
> 
>     fn f3(a: i32) -> i32 {
>         if unlikely(a < 0) {
>             return 125;
>         }
> 
>         42
>     }
> 
> LLVM emits the same code it would for similar C functions:
> 
>     f1:
>             test   %edi,%edi
>             mov    $0x7b,%ecx
>             mov    $0x2a,%eax
>             cmovs  %ecx,%eax
>             ret
> 
>     f2:
>             mov    $0x7c,%eax
>             test   %edi,%edi
>         /-- jns    <f2+0xa>
>         |   ret
>         \-> mov    $0x2a,%eax
>             ret
> 
>     f3:
>             test   %edi,%edi
>         /-- js     <f3+0xa>
>         |   mov    $0x2a,%eax
>         |   ret
>         \-> mov    $0x7d,%eax
>             ret
> 
> The feature itself, `feature(cold_path)`, was added in Rust 1.86.0 [2].
> 
> Previously, a PR in Rust 1.84.0 [3] fixed a number of issues with the
> `likely()` and `unlikely()` intrinsics (by implementing them on top of
> the new `cold_path()` intrinsic). So we could use that, in principle,
> for Rust 1.85.0. However, it is just a single version, and it is simpler
> to avoid intrinsics. Instead, approximate it with `#[cold]` [4].
> 
> Thus add support for `cold_path()` by applying several approaches:
> 
>   - For Rust >= 1.86.0, `use` directly `core`'s `cold_path()`.
> 
>   - For Rust 1.85, provide a `#[cold]` no-op, and vendor `core`s
>     documentation.
> 
> And, for all versions, simply provide `likely()` and `unlikely()` based
> on `cold_path()`, by vendoring `core`'s unstable ones (the one from
> `intrinsics`, not the `hint` wrapper, to save a layer).
> 
> In the future, if `likely()` and `unlikely()` become stable [5], we may
> want to use them directly as well.
> 
> Now, in the C side, the `likely()` and `unlikely()` macros come
> from `compiler.h`, which means it is pretty much available everywhere
> directly. Thus just add these to the prelude (instead of e.g. re-exporting
> them in the root or in a new `hint` module).
> 
> This will also mean less churn when we can remove the `cold_path()`
> version from `std_vendor` (and potentially the other two too).
> 
> I tested that Rust 1.93.0 generate the code above and, in a previous
> version of the patch, that Rust 1.83.0 and 1.78.0 do not, as expected.
> 
> Link: https://github.com/rust-lang/rust/pull/151576 [1]
> Link: https://github.com/rust-lang/rust/pull/133695 [2]
> Link: https://github.com/rust-lang/rust/pull/120370 [3]
> Link: https://lore.kernel.org/rust-for-linux/DGA6GUR58QJ7.1XZZ0P4VZNW86@garyguo.net/ [4]
> Link: https://github.com/rust-lang/rust/issues/151619 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
