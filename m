Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBBB14386B
	for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718359213; cv=none; b=GKXHFS2lYvRwRtTZmLyVpOKrpDIICZXZyd78SZYu5Z74TOa0UI/8vWJ3Tc5p6J6/5IUoRkvzbKn3NFuDznTqx6G/YOjnvDrGpbG6B9wBp7A+JfsQGJ8McGkcIZsYr3wb9wReTmSI7MX1RCoecH3atUC1fRNbHsqVHfRaYIc4jDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718359213; c=relaxed/simple;
	bh=CBAdIAt33/2nqpZ8vIydnCg5rpba2GT3bMlI628Yd0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMIXotHGamaub2vS3otYATeksw0w4sOUxPQ77ZxqJKB0c/YUobOEGpMZjzsKgnxDNjHIBIscE7xc36fFo8vVOxXMyUCx6SXkq5biHywGoEiLwVNoURlKal07iN3o+Vn4Aez06XUiNc7jwZND/Q3sNKH8zWt4CeN9HZuEy435XYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8yIZ8H7; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8yIZ8H7"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c195eb9af3so1601978a91.0
        for <llvm@lists.linux.dev>; Fri, 14 Jun 2024 03:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718359212; x=1718964012; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBAdIAt33/2nqpZ8vIydnCg5rpba2GT3bMlI628Yd0U=;
        b=H8yIZ8H7NLw4O9M16IdiFWjbdfFp3lmm0M7wqz0z4omcoeVbZscMvy9atnVcRFH7w2
         5ETBpQleWOyJYyrYJW7XEVqX8cIeA7e9KjInHJ2uVZ36hK8F8vn0UPOFdSCBEPGCpWqI
         W18cuHToe91+NMb62YL1mlxN0Riml+azw6JgqMqUZ1tIYabapqbe4PecAOStpMWlyB3S
         Vlg29cKIioRV/Spm/2u0lmqSQNw/FB3gvGLbVop+oHyu12XihQkGyqBoiNtAGeZ/THcC
         Qw0Mi3TphuYsBiHalaZwd310CVPIVaAoQHRysesknDnZ433PlD8m/PkyUVbUV6LJpwyu
         CURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718359212; x=1718964012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBAdIAt33/2nqpZ8vIydnCg5rpba2GT3bMlI628Yd0U=;
        b=WXh1anQTHQrycNpKsamUBoPgzsKjHwc6x9l0VADyauFMHlK46g/j6UWJ/KmVe69BNw
         lNrN0jJWVaFZ5tLEw5/uSMBe+V1tiUgPkIdo16NciNc475nF7Qv6zhCoQhLTMI8TylbL
         TbUVa2Hy8m6DoXdn/RG4SYFvTQ1BviHtFG7tKu9ehsPeM1Cg8NOTDJLWaZkh2UCOcLaD
         milEreNzO5eSoxmkItZzhIP/eIRtSB7GLS63xZzUXm6kzxjR1SlfJTFIEmIvn0N/oAJi
         JB6MXTBPTZftxvW1Y2bsbBlZVtmWpP4GWCruEZpKDpePL3lovZkzWEnKNJJruR5Pt3vu
         IGeg==
X-Forwarded-Encrypted: i=1; AJvYcCUbBgSCz26BCIeoWFOr/bTyDLM7zgj5y0fWpq2EnEiln3mJ+rHZ7k++qrYBMSoxu9sCpLhKuVr1zsDOiTS1rFsxFMKA6Q==
X-Gm-Message-State: AOJu0Yxr3nlNtTDeOcTAXGuoZuTCKn1Y4gAwF10zOppPBzwPyWGdoc6Z
	SQlUSwRs0tr4QJznVxeTW5jq6lRHI/L7WvGaDE1LIJYYbnqw+SDVGgcIYK4vJ+l/6Y8TAOzTQzs
	ijaXJjcG1DZT8uTE83Ttk+7gLBdI=
X-Google-Smtp-Source: AGHT+IHt+gI7Y4iz2Wee6JixIaqyBgOUnOLbE8M8v+YAFmEE+Srhye3lGnfgQDBv3QdFdYRKtbIcxZaM2XWpe/OGK9M=
X-Received: by 2002:a17:90a:d383:b0:2c2:f2f9:a121 with SMTP id
 98e67ed59e1d1-2c4db8589c0mr2098796a91.39.1718359210973; Fri, 14 Jun 2024
 03:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240612223025.1158537-1-boqun.feng@gmail.com>
 <20240612223025.1158537-3-boqun.feng@gmail.com> <20240613144432.77711a3a@eugeo>
 <ZmseosxVQXdsQjNB@boqun-archlinux> <CANiq72myhoCCWs7j0eZuxfoYMbTez7cPa795T57+gz2Dpd+xAw@mail.gmail.com>
 <ZmtC7h7v1t6XJ6EI@boqun-archlinux>
In-Reply-To: <ZmtC7h7v1t6XJ6EI@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Jun 2024 11:59:58 +0200
Message-ID: <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
Subject: Re: [RFC 2/2] rust: sync: Add atomic support
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, torvalds@linux-foundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, dakr@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 9:05=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Does this make sense?

Implementation-wise, if you think it is simpler or more clear/elegant
to have the extra lower level layer, then that sounds fine.

However, I was mainly talking about what we would eventually expose to
users, i.e. do we want to provide `Atomic<T>` to begin with? If yes,
then we could make the lower layer private already.

We can defer that extra layer/work if needed even if we go for
`Atomic<T>`, but it would be nice to understand if we have consensus
for an eventual user-facing API, or if someone has any other opinion
or concerns on one vs. the other.

Cheers,
Miguel
