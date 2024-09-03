Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C02218E030
	for <llvm@lists.linux.dev>; Tue,  3 Sep 2024 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385441; cv=none; b=iPZRtO7PsmdDD/dghZLfscm5n73fHJui4zDdvuQ5fwqUu+g56B7CfFk1hC7nkcFuGbGAmxMeTv0/I2talsqGjJjSfrSspCNr/0E2LZeEJL0ZVIUAHDFZDEXgtwMG4o/XMSP3O4Kv9KksiRuv+63ALVsY9Bq/FFu4yJeUmTR+Vuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385441; c=relaxed/simple;
	bh=gi+yu/z+/Fjxnn4wuJ/sFP88katAdvUnvWOv4IPfnOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n5XnMdymuF1vhVRNmEkFlwz9PjOVCkCsutnyN++2p+OKASsZN9GMqU3ju5K1ASOt4Fx4DG/rsPivoqZsrvdirqlQ2f5k+Lgl5ZF6in+UlL3G0u27emODc30UDAdzElZon6kIUlCgux1snJkROr1bReplntnYPsqaQISvGtIy8FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgHU1ZNo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgHU1ZNo"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71447da79e1so308363b3a.0
        for <llvm@lists.linux.dev>; Tue, 03 Sep 2024 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725385439; x=1725990239; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi+yu/z+/Fjxnn4wuJ/sFP88katAdvUnvWOv4IPfnOI=;
        b=bgHU1ZNoOD8w/kg/IS/3O/AC1t3jJov6SnMIKy1mFeIGfCK4aWf7j4hCT11PVurX/z
         tSlhbXBvK+U7JxvbKDmq4PM4Q+xzUBjIscfF/Te+Dnbd9GKLi0rxAOUZMRXpjIRYK01W
         IJ6QFuvAkYED8VW13r/gciD+Wc18s1hKxtmUnxFxlw+Qp86+yFyczTiTzjM0bB3DwP5f
         nWc65xuo/C7a99/ygOHIbF0J0zdHdy7+5KjNEiWfB2HXZm41XK2N6aU1a2RhRP1cSfOT
         Vx5XXBVG0ZFgt+EAOMoUf3hAuQui02gKXCSVmWp3j3i9ilmbzwt6/ab5AmSVxm+uRjW1
         OipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385439; x=1725990239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi+yu/z+/Fjxnn4wuJ/sFP88katAdvUnvWOv4IPfnOI=;
        b=FX+hQbLDi9X1krup6Gompue6HxRU1R2BVHqaBYWjSm0SUh+JJ1ao03lyQRxe8Q64vT
         zyslv4TRTA0r9EKjxoTglZ0tyKWGIkOW8pec/5S42sVhIXUozte/H/P8l2hAybi0DJrj
         Zuw7S7IzZw2YDCvAF6kXWqY5GLl7x9jfLICQ87KSPt8lepv5dn0sdACH6jhv/PYmdOs2
         Bi1ANoT0wttT9Q2F39bRpJr8vQJKvQCUO0V4ENzQhTs7XwOQuQMmwEzW62G4JvIaqxLQ
         DhVKcVOBu71Dv0uozw5mL1fW86rpwxWgGNhfnm/4AFOlnjxMOHgEaAgGyg9xOi4xtZM9
         qjfw==
X-Forwarded-Encrypted: i=1; AJvYcCUPADIdcWdZYZfksXvMOi2XRZi66n/J5d7gf2MIkAmULduS8qSGUVkpmPgAYfFfAic55GjQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yyugc19+rqohgZfPGRtVWiOZlxDf/u+86MERwncqH+6WLmu1T/u
	PoorMn38uXRAZvIPOKS2vLU80VIezZt3OwVLHjZOlwxcIt6z8+hjNzsS4ZxvMQoahS/avxJfplQ
	b9N97MWXCIbIp29qOIY1JftmQCeA=
X-Google-Smtp-Source: AGHT+IGOit+pKE1XEmbe1GmHAZjGSQFBSI/2mJn7mS7tx95JcJrV9hAXdxD2z8nbCI3vzg90VuXd/BAf95vimO+HTSw=
X-Received: by 2002:a05:6a20:c513:b0:1ce:f7fe:83ba with SMTP id
 adf61e73a8af0-1cef7fe848cmr1647514637.4.1725385438739; Tue, 03 Sep 2024
 10:43:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com> <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 19:43:46 +0200
Message-ID: <CANiq72mKZukJ+V_fXtvfBxN-WVBBOr1pZJ3iKrWgagTrJC4pdg@mail.gmail.com>
Subject: Re: [PATCH 2/3] MIPS: Rename mips_instruction type to workaround
 bindgen issue
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
	rust-for-linux@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:15=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> We have a union and a type both named after mips_instruction,
> rust bindgen is not happy with this kind of naming alias.

For this sort of thing, you may be able to add it to the block list at
`rust/bindgen_parameters`, so that you don't need to change any C
code.

I hope that helps!

Cheers,
Miguel
