Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3026C1E5711;
	Mon, 18 Nov 2024 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731962529; cv=none; b=NeGtPRZ8oYJT7UtwDDjfR0Nf2JJTPNUGIb6Dqmu9Te6kRHsblf1AZqCt5VmfJWwhDmzECCeEeX5FSXuWHDcJmzE5c7UOVFDlaMBRWrX04IXQnPdjHrfpZ7RFyR61QaGbhO54M2mVlBB4kQXLa2RCf0kWPrPbl2Vogg0o8RLkGVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731962529; c=relaxed/simple;
	bh=UkJuL8+zmGtSoHuxf0o8yRBe8ZiUwlbXINtsp7R8Cnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0aDGL7fZ+ZxBE6j9enhdsCTcFvgN9+GjOhrDp4cj+UHIbu8DE2enAQ6Qn2s0/olU6X5ePJKzJpvrJ9dgSAoUqo5++/+vRiG54c1pUXIiPzX4MqgX3eAg7a6eYbb/2Et896DJ3FZHZGgLNMAvhlq3wi6v4CggPaSMd8J4kRcHW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RP6ICOQR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RP6ICOQR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ea35c0b0b0so167469a91.1;
        Mon, 18 Nov 2024 12:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731962527; x=1732567327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+Xdj7KiBLCPRzY3Todf2snUR+C3yfhMagkENx1A3bE=;
        b=RP6ICOQR3sKcdqzIXqKqEcnufW6vRGy+NLh1PeFNdkQbauDdC1JngL0O33gHM9zdpP
         SPQAEXHJirLoAlb4WRgM7WDCR7yWN7q5WjomifWsf3uuED6lVBV2GC7CrSexdmavLpfH
         HC2lvkKziHudpmnrtFJhNuG5PzYekDjTg64yUCf7WDS7cjTi1n0dr/choZB2PAgFvUmt
         AihAMwg2RSupEh65EsSpwd0GzIou1ZwKcNzRjrVFKuusvsct12U7dF88YCXeVKcOyrTp
         Nddanz+DaHlDkbZezRvgZcuz5xjU7XBVDAtHXdg2H1m93KrFP4TQGG033hPS6mXxH7cM
         Z+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731962527; x=1732567327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+Xdj7KiBLCPRzY3Todf2snUR+C3yfhMagkENx1A3bE=;
        b=IxHI5wCZwwDcw8HXBrc+WrakUnhGHKgj7N/h3H7u1omwOb50vA4Tbt6gXeKdd6dvjh
         RtOyUaGjJzPxqq12t05tqEghDb9EGRRzre4h+c8xhGeWxrLH9XCm2AMUmfGVAyyub/5j
         w1EKVu5TjwD//6JjF34Sx+yltn1A0QbIeIdYg6zdHa2UK5Dv75t71vhvo38b2/YiSuJH
         w6xYnbr60mcYqLESedoEtI7bN1dUh7/WlBvF0VE6nSC9EX5X86bRFsblLRqAATPrNv2R
         cHC6MTDpdBNoaEdCAepXzbpdqcHk8GXTA3SQBW5YWJPaDhI3HpAqn/qXmAOyPrgdLku4
         tsmw==
X-Forwarded-Encrypted: i=1; AJvYcCV45Ev8q/RotIUNGWdMxlqJTa/2J4fFl4v8kCvVaFkDY00oigRX+UfN168ec7CcT22ku5zx@lists.linux.dev, AJvYcCVubKwtPyrfl7z7VyPHFN4TIRthxRYuvvLHpEGM0hhLB2I8YyFOJ7elC4OqayLPOiZxP9flmtrVlo2WEFCopg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9mC2IbizIMQ8mwdFuerlLiLgW7ZDP+NE1gZ6zC42CwZBGVBhG
	qh+4AXyuJyvxRDjiAKTCIm6e4Habjf0wpwHWrjSoVesLC3HinVbFx/KvsPFxa3n/gngAQgQFqdZ
	6SMukrS3/AaZxkEzVWE527rC0Axg=
X-Google-Smtp-Source: AGHT+IGxkBt0lYQ/pb92GnoB4p2dqZtFYBy874Hafj/esamMytu1A0yojsAYvUjvM/AphNdqGi/7a7NpBFxY/qLiFfc=
X-Received: by 2002:a17:90b:1e10:b0:2ea:5c01:c1a0 with SMTP id
 98e67ed59e1d1-2ea5c01c415mr3170816a91.3.1731962527424; Mon, 18 Nov 2024
 12:42:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411181440.qEdcuyh6-lkp@intel.com> <20241118202727.73646-1-aliceryhl@google.com>
In-Reply-To: <20241118202727.73646-1-aliceryhl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Nov 2024 21:41:53 +0100
Message-ID: <CANiq72kd31HsDTPNBnLrRC+mkGE-u3qTiPWuQ08TXFcr-M7k9g@mail.gmail.com>
Subject: Re: [PATCH RESEND] jump_label: rust: pass a mut ptr to `static_key_count`
To: Alice Ryhl <aliceryhl@google.com>
Cc: lkp@intel.com, boqun.feng@gmail.com, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, rostedt@goodmis.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 9:27=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When building the rust_print sample with CONFIG_JUMP_LABEL=3Dn, the Rust
> static key support falls back to using static_key_count. This function
> accepts a mutable pointer to the `struct static_key`, but the Rust
> abstractions are incorrectly passing a const pointer.
>
> This means that builds using CONFIG_JUMP_LABEL=3Dn and SAMPLE_RUST_PRINT=
=3Dy
> fail with the following error message:
>
>         error[E0308]: mismatched types
>           --> <root>/samples/rust/rust_print_main.rs:87:5
>            |
>         87 | /     kernel::declare_trace! {
>         88 | |         /// # Safety
>         89 | |         ///
>         90 | |         /// Always safe to call.
>         91 | |         unsafe fn rust_sample_loaded(magic: c_int);
>         92 | |     }
>            | |     ^
>            | |     |
>            | |_____types differ in mutability
>            |       arguments to this function are incorrect
>            |
>            =3D note: expected raw pointer `*mut kernel::bindings::static_=
key`
>                       found raw pointer `*const kernel::bindings::static_=
key`
>         note: function defined here
>           --> <root>/rust/bindings/bindings_helpers_generated.rs:33:12
>            |
>         33 |     pub fn static_key_count(key: *mut static_key) -> c_int;
>            |            ^^^^^^^^^^^^^^^^
>
> To fix this, insert a pointer cast so that the pointer is mutable.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411181440.qEdcuyh6-lkp@i=
ntel.com/
> Fixes: 169484ab6677 ("rust: add arch_static_branch")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Yeah, the original had the `.cast_mut()`.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
