Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F6238DFC
	for <llvm@lists.linux.dev>; Wed,  4 Sep 2024 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725438537; cv=none; b=qioXD84bNWGEYunynYLGuu/oWT5VZI/BLalj14KGgja2hVuPwtHT9FLix71e+0GFe7xxDLI9BRtyR4y8CmMZCgJGrb7E/PHNJDXvsCNVP9Dq4RjbqHBU/2UrrkCsR9qOJILtIFo3qUbwAiaIoUPR23+9TCfvnE1IANxAcAeRG0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725438537; c=relaxed/simple;
	bh=jdt4L7B/HVtgHJTf5Ay/37Kjc9tEjPIOz23j2vKvezg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEBbS9IiGA9DA5KfbTrCe5kJ9hnCM3Kn5Zm7H3Nhy13kKpO9YrUjdA+dEreIqjc3ISMDQj8mi4vq33yWrYf3m6DQv69B0mqwfeK0RfzgVaD/AlNmu/RvLzNwfzwzoD3GN1+KPNCPe29j+QCSZvo114z/sq4IRuWmwmrCwhGJDeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5Vf8sbC; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5Vf8sbC"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70f59acf6c7so311523a34.3
        for <llvm@lists.linux.dev>; Wed, 04 Sep 2024 01:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725438535; x=1726043335; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdt4L7B/HVtgHJTf5Ay/37Kjc9tEjPIOz23j2vKvezg=;
        b=P5Vf8sbC7etx/Ld/aOgwbE6XjGawGjZeFigIOudyzRzq4CS65Q1WpurRNCDrbqlH7C
         wdZq+OJbqp2NcVnWWiIsRyBItMmRsxwUpvfhNQBZhgPyTIjOfz3G8Wj+Iv0XYCUWK6zh
         hd3F+WHGFt5pWyyN4Atgb4lqAKBcpRCWdOmInI07AGl7lEVtpOPGVERP4gjXnI4hc5t3
         idkPVgSV2hlMFdFN01uztTD4zMX/gs/tG9AxCuqzwDBwXH5Yqq1l7VTlUKxaI6+3McfC
         4hSRJ3BILQNEYretcko1rxLN6LXqaN6wZsMMvcVrRHdrsEMqKkM+P4Hf+TybZTfjmbNc
         hQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725438535; x=1726043335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdt4L7B/HVtgHJTf5Ay/37Kjc9tEjPIOz23j2vKvezg=;
        b=r5FPJqed2gxpa2wI5qEde+2y1KtAhS8Nw2y/FxTCrewH6O1CiCq06wzagKT7vMnoeY
         JKSl5fADO1pcxAmJ6f4YVf0hNxChkVUBvarXPx4LwzxqJbIZVFotWCXT+rD4Xk3bhCth
         Nv6k3cruA7ghch0hL24IKNpRgAUtLwxTrx8VgBs+epodsQp6PQsFTBcnFohrGN6gBEd+
         Lxn0+R5L1I/2/gzF+pKGe/C9PtDdtQcyzlgEBs9Xhtn3Bn/WFVcCFphIH5rBDtLWv253
         S1S4mRmFsPnw6KWaew8pSMA3KrpZIUcz8syTNB3N46P95k9LBj0d58cQxNJ9jyTpJ6SN
         2Xjg==
X-Forwarded-Encrypted: i=1; AJvYcCXL/yr9YZBqDqxS2IWwnkPlpsGyMlR7tum39qMQJO4zsJFEw8xMN/6B0cj7lHAUkx6KlSb0@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ8fRv74v0XnLQmFljwZKWOsIUOJOvh4xCbr3B7J6ONINELDQY
	KvsqG+rKJlc0TbPn6EcS0fIVZzbJMuapxYCaFv8E2Z4P3b0EPzI2BhgzxDpkuht44ml7r6dtxzt
	w7FDjXj3OlzogQeKzddKAwrd2JMI=
X-Google-Smtp-Source: AGHT+IG7ayScQVV2ACfQehNhc8C8kUzsvNWbtTACdA8kQELKf2OV6f3hSmmCq0rgCq8R7f/fWdFT+b2PvKUGt44U9CM=
X-Received: by 2002:a05:6359:4c93:b0:1ac:a26c:9e91 with SMTP id
 e5c5f4694b2df-1b7e39c063dmr1048812355d.4.1725438534828; Wed, 04 Sep 2024
 01:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
 <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com> <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
 <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com> <CANiq72m5iFcqRU_qdUCZkoV8ayPhtQQq3TTEDRUYfMEsnNqTDg@mail.gmail.com>
 <6f6f04d7-55b3-4714-9bcd-cb4e1ae6c86a@app.fastmail.com> <CANiq72mvTTgyTjDCWBz_kOdY1f4gopAtWxyC4P4c+Lr0YVkzLA@mail.gmail.com>
 <a6959bc0-f0bb-425b-b3b1-3123d3b809b5@app.fastmail.com>
In-Reply-To: <a6959bc0-f0bb-425b-b3b1-3123d3b809b5@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Sep 2024 10:28:42 +0200
Message-ID: <CANiq72mjKEpaBqKccZPiNzpsJL65jb2zp9Ve4FHK0fRd014ACw@mail.gmail.com>
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

On Wed, Sep 4, 2024 at 9:38=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> Reported at:
> https://github.com/rust-embedded/wg/issues/792#issuecomment-2328133517

Thanks for the link! Added to our bullet point about the target spec
file in https://github.com/Rust-for-Linux/linux/issues/2.

Cheers,
Miguel
