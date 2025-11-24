Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA39635
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 01:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948927; cv=none; b=cJLmNib+EhbUISdYfTUh+Wnh6hbnKdif2+BE1s7jMigB3SE6jnlgtfkcqxb6zHKZu3+cqZWyh4Vdd5YIhpDeVlppMPjpsdSo0OvF8b0XoVWyonk3l0Ik0UDo/z07mJ36gA6CjewW0Iai6XKVuwX6ojwvCrqFqid9RaeCk1LNRb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948927; c=relaxed/simple;
	bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLC9RC7Q8+nQWmWZYRqsn58ELqluDVN+sYjPRzVi75jX6M8uTIx3f6jtA7Tre/2PERKCG0vHHo+ccf4oibCEXuYqtnjWCLjjtJ9DqFeTln7IGYnKt7WilCHvul4Hyef+1VFatxZrG96HpbFhZFCCJbqQwif0Vii3NGz4LwCTx4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGj8taJz; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGj8taJz"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bd2decde440so378066a12.0
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 17:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763948925; x=1764553725; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=SGj8taJziX4ohi3shiCX3CGfJdZ4c4zPRajPRbNG5/bEa+W8otNuE6wLm8BeLsXMp5
         LEQ1JDlR9Z7FiyH4psWv4t7CTxpkunjghqJUgHzxh3KRzlM0E4dCjrKkqgTucZxhvHa4
         M3Duxum5yPA5ZYJpF8U0SfxeJOE1T0I1iyKO2M1kOCAfT5kCYQf9EIY43d1o4q6LloGc
         GLNWF9/J410ypau7G0KtQ8oIO6+EZk0wO5pH/DuDPbxzq5xaH2qqcF9dvh1eMthvqlfb
         l7YCXrftNfeqyxQbUmT9Aewf9FAXdpF/GOKEUy7O52ZKE/woaEVvg/hbSMS8DOp50+g1
         Ygbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763948925; x=1764553725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2wq7MMKK/6Pc0N5HYBRYG7GF95bXLtDuFnJAfeE0y6w=;
        b=RhyqHyJbMzQibDRf8vxWGztDKR9nZreVtAKK6sWdhgbrPgWEoKgtGJ/5Ws7NeG1ggJ
         Y3Kk8Wq3LBNa5tjOh35KxWgTVp8XpjENhn27q5aY07tyWD40kSewdYGaHzfzUSz3iYMH
         ORF7mfRiDZ58kKVkr9MJV900dM6dO7ffq5JJmRNLCuhY+p4n77hJYoodfeKmwsrHjU+e
         12sWOWxq3Qs548qkdkGqc8QOaOT9PKqrA9rEI3fkABE4/AzSqGEXn4NFqcJ/MKvEgcnF
         0J2FOxuQc/Wl4mrJ3K/w1+f1JLcGAtYUii8lEHhWAD88ye3mEawQ5MaeM9SE1q/swHh3
         hy4A==
X-Forwarded-Encrypted: i=1; AJvYcCVrs/vGZ8+7hgn4np9Am2uCprGjf8UCqjsVCwjX5t24IIcEDu8QtEuVgYfKzPrYOA1EFPHX@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8R+daLnEnZd8pNiuOmQSSU7NzCPoh9C+6kkf4qZ9JZDNvYaE9
	cdpuiOh3M1jSwh76wD1xFvvInqdoVLF/JTIMo/rl+pnPtHGZOIftfNj19gIMcHXCRbnsRa4JWqx
	VR7ZA0aikvI2ZtGz4p8VfkkdFl6VJk+o=
X-Gm-Gg: ASbGncsn1YCBgGym5ugSq7Jn4EQfvXH9SZ88C9LE9Kg5nQkPRwVq1VcYT85PwaTjdmE
	gUUb1PussC910560JQs/UuAyQphFPGXuVyEo2wIc/GhdRttQMJFpogPc8hOX5mH1UukmszWNwVW
	wHrx47KuYAAIdNCSwlWboFGuUHhy1NsB9x4c7NrkfJW7rwktv2NqZkQAZevnLYcHHD4hwCxxx1O
	EFtG9iDrYibZdKKAv10/XQZLyAGEbtI8mQXFUQlV83URxukJdGbEMZTrDl2/r/gNo/Tg0hh9JQO
	GbGZtyNlqCbCKQD+P9IdqDYQNBF6DtUHwpZHdSbZa/zSLSnegyYAxHcTjAB2NwqIIue91vS2Vfg
	spEW1fewmASrwcw==
X-Google-Smtp-Source: AGHT+IGn1fQWUtfuo1zOBYncWXTAQy3r5XJCczzktuyTrIF4ISG4pCB6BfmuhKsOzi4ofGGWNC1ayRtxHafCtO0nUC8=
X-Received: by 2002:a05:7300:ea14:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2a7243d9794mr3793745eec.0.1763948925113; Sun, 23 Nov 2025
 17:48:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:48:32 +0100
X-Gm-Features: AWmQ_bkQhmxLSFViZmcLEfniv1-_q0VIV-sH15dOpedbSpl6O0HvgiWJ0WM7vVU
Message-ID: <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Use the `BINDGEN_EXTRA_CLANG_ARGS` environment variable to pass the
> `--target` option for cross compiling, so that the function can be used
> to test both bindgen options and bindgen backend options.

It seems this explains part of how it works, but not what the commit
adds and why, i.e. could we start with "Add `rustc-bindgen-option`..."
etc.?

By the way, shouldn't this just be called `bindgen-option`? Up to the
Kbuild team.

More importantly, should we just have a separate function for backend
flags? That would be easier and would avoid having to use the
environment variable, if I understand the commit message here
correctly. And, anyway, it is actually the only function we need so
far.

> +# Return y if the Rust bindgen supports <flag>, n otherwise

Maybe just "y if bindgen supports"?

Thanks!

Cheers,
Miguel
