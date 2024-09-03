Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B914201265
	for <llvm@lists.linux.dev>; Tue,  3 Sep 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725390100; cv=none; b=PGwikJmVKElf1nQApbS/8komqfaopTaXEXWCchURUmdfj8ZmxAss0Lpm5xJIiuWlaWm/jxvWaojMWxyVZ0t4QmrpUf2ie1ygcjbVQs52RvEhGHRuZD9bmyhjjPiynEOvxqVfclYzPpoHqm0utz5c/eQgwbxXmOh6NqhsceumbcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725390100; c=relaxed/simple;
	bh=KE5xWwHnPm+WIDf2FbxryrsTqOGezFO5SQcRnazmxKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kjzu+cUWdpZgL24f0AeRZ+MaaIy3B5nZhE+/CRQEDhpCKDIGoXZDF61f1klKiT7Sm+bltNWzcZRX9aSv/fmgojehIOBQ5Hk7sLA0NBlJPT6vm3HUBue/9JYUtNIn77jmFcK2Uq7X69aRSol5EyoAJCcJDpdT9SjsElDzWjEjUso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYYgjI2d; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYYgjI2d"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d871bd95ffso396672a91.2
        for <llvm@lists.linux.dev>; Tue, 03 Sep 2024 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725390098; x=1725994898; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE5xWwHnPm+WIDf2FbxryrsTqOGezFO5SQcRnazmxKM=;
        b=eYYgjI2doQ9JWIZyScKvS4qbClfWyoam8iYfUO2TowLcKxbznoLOW6VEBPfGPJ7uAF
         OnL17GQ8RQpaxZNtxjuKnj+WPdofwZLb4Km9ekMd5Eejs5XzNMSDQenNbIV8pnVlISEt
         1+fY0xF3fZGyPnM+JPmrKyI287ud46/9k4ZyhKDY53+dkNVrNART5FZjbx0PXQZ0muWW
         zyJ3WQw1e8asi+MjvDzoprDo/KfpebVCN6WUKYrpGDHXn/NZ1pXfMcfg+iZL6Qtj/uQI
         um93pgt4GXxFe8+KlMSh065MLBN5OTPylxiYV6mGi49kEoa3T8FtCk1tADaA5oEXV/Y8
         w6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725390098; x=1725994898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE5xWwHnPm+WIDf2FbxryrsTqOGezFO5SQcRnazmxKM=;
        b=hb69Ks5YS7jduP+W1Z3U/srAWqpONuP1nz0cvIe/kJJRhW55qNDyA/nZkqk2tkIrSh
         fkGJ9Bt5XyqRdt1DgAqXNkc0bcHf7csSgMdMrt9gveDGZwXiRVH4h1PxFKADkQMrztkT
         cdC6xDKhDXZyC+6JQGD8TEeMqjToBR66rYLZFP5bzLmxib5LG1XPnYjzueopoaB1BmZ0
         Ohk/Eq9+tfoXc0maaOEfIliqp7rmFgUpkG/XWXpWpqIGVK7XdYvzLj3UKsGQlrsEIOz4
         6tjtIsu8v3qNuzTgE5GbIwID2jX4A7EBwoCqSy1kFtv+vNBz8L+38U0T6IOek3P+lpBl
         Ofag==
X-Forwarded-Encrypted: i=1; AJvYcCXfiyBf54ibaK8wSOJA1AKnDbN8f51Y6sTjLFND9SnH5K2jcJ0MHkdeMSlN1ZNcEFAcVgzJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0CucMFra/kY2b5xi5u/843UG29GniIdwfQc0WjM4MHRRV5wIN
	VaPWgAQmwKGFp9EpGBjR0ycmAwkfYOIcBsGsyKjnemh0hV5XWw4SfFo6VoyWoGMRiD8piIogfZu
	ngQwv0upSj5ijoUn52TcTN6DSq58=
X-Google-Smtp-Source: AGHT+IGRHnvtSIMPglv/36A6hpMPDiFKSZKiUYGzC4lWBAVbp+fP4jGwB7yTCWBdu31Z0QsqEhbQ0JnFGvwe1zJu2gc=
X-Received: by 2002:a17:90a:dd88:b0:2c9:863c:604 with SMTP id
 98e67ed59e1d1-2d86b82a57amr8603316a91.3.1725390098481; Tue, 03 Sep 2024
 12:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
 <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com> <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
 <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com> <CANiq72m5iFcqRU_qdUCZkoV8ayPhtQQq3TTEDRUYfMEsnNqTDg@mail.gmail.com>
 <6f6f04d7-55b3-4714-9bcd-cb4e1ae6c86a@app.fastmail.com>
In-Reply-To: <6f6f04d7-55b3-4714-9bcd-cb4e1ae6c86a@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 21:01:23 +0200
Message-ID: <CANiq72mvTTgyTjDCWBz_kOdY1f4gopAtWxyC4P4c+Lr0YVkzLA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: Enable for MIPS
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 8:32=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> Ahh thanks for the elaboration.

You're welcome!

> However, kernel supports many ISA variants that are not defined by any ru=
st target
> triple, I'm not really sure if it's appropriate to define them all in ups=
tream.

They need to be in upstream Rust somehow, because upstream Rust does
not want to stabilize `target.json` since it is too tied to LLVM (as
far as we have been told). Whether that is via `-Ctarget-feature`, or a
new `-Cglobal-target-feature`, or specific flags like `-Zfixed-x18`
(originally `-Ctarget-feature=3D+reserve-x18`), or (many) new target
triples for different combinations, or something else, it depends on
the case and what upstream Rust wants to do.

That is why we should tell them what is needed, ideally in a new issue
in upstream Rust, and link it in
https://github.com/Rust-for-Linux/linux/issues/355 (please see that
list for similar examples).

I hope that explains a bit more the context.

Cheers,
Miguel
