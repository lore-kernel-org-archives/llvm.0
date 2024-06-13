Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8716586136
	for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 17:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718299393; cv=none; b=pEGUVxc6aY9I9B9ZdrhYZyCtb3PcmgZ7ypItbZi1L6c5OG8PiZ2NpYxWuoR6sWwPf302ynL+qwellAr02q5segoqnDrou38LsLPuFvfTPS1fUvd65CpD8HwkyBJHJfmjd7mV7n+XMTwPLzrpnhVWA+p73LcfphBULvighpeC2k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718299393; c=relaxed/simple;
	bh=+2OFmWNM47yOmDpYrRVafvbtoDEP6ZH+OhJE24NiP7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WdIA06eakQAImUPTQaoPl5g7V1bkxRcKShAU/SRI5jTnlxX2NlSIQi8mOgkQd01boSaSCHTFcXDY4whmAkIWJRcrRZ7zxbSiqnCeuMkXh4Kvl0BplL64Dx2e5MCaHpG5WBB1EksNaZVOT+roG+aS8RDTA9kNVMeJR0lunJEzHcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EY/HMYqZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EY/HMYqZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52962423ed8so1585985e87.2
        for <llvm@lists.linux.dev>; Thu, 13 Jun 2024 10:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718299390; x=1718904190; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2OFmWNM47yOmDpYrRVafvbtoDEP6ZH+OhJE24NiP7Q=;
        b=EY/HMYqZEvHtqc9rQonekYh0GSP+o4qt+6/2aTnf2kt2bUY79E50tERlo0cf8BdKln
         QsKrAtEp6XcLqGNjQQlr+Ym7Vo1AFq/NY5ICw9JhjQxdTO9gVQqLP81w36MV2AiYOobn
         Y+wF2hXQEN7X2y57WZBYzmklkePNIXSrk1swX3t8HfvVFVjCP71WSjthWsOpdXwNcV5K
         S+z9E9PscuwG04Dgnn8EzOrzaeUdOvsAEpYE5oYltgitTeoF/NYFIoZXNDKTB3K9+ecm
         4nFIubTvqticPyXsGtIEkDv16M8MMM1C7ftQor8N8wNS+ZcS/yIqdWnEPGdjVZ3VdbKf
         lxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718299390; x=1718904190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2OFmWNM47yOmDpYrRVafvbtoDEP6ZH+OhJE24NiP7Q=;
        b=SaN0FLDR/lvoRTq+7xQ6ibKL0WM99zutLaCeDs5TInc8hpsqBfPYIiFbc63D3cdiZw
         aqUcTfFVQfEsRArOayXgfUOY7wetKSl2gf9j2uvGbsGvmPaq5CPN8gATOyjMFCSzNVUd
         VSpYQTIvqQYOt2trivEaDg2nf2RhdRVNU2tEr9pgR/SmM9Omx3aATZVhA/xehc2WlRNU
         hnS1p12z0aaG6e4oMCt+OG0Ty6pyhE7VFXvuw5zBbOSK2Zq/qLLO8czrOLzj+bqsgvtl
         2VlIj4WyaPqTvlISQSvxtL39fpUAYSM4exOdsvcIondL34L4A7lN+JfaKan2NeQ/aTTs
         lerg==
X-Forwarded-Encrypted: i=1; AJvYcCXjcf6SpudoH4Zc1F8piMbgB7bI74llJLFaUSgUzM/cnrhcvM05rAE8k/XvvAmhEYphIwQ4cs2F6RRrC/RL80yVFlI2fw==
X-Gm-Message-State: AOJu0YwYPWs/UU6cDo47hDsMO6/xoF66IV3IorK3jYNO3HN7xiIIpMbr
	c4ZeGNq6VRhWBmUyKWmVrJ7IVtdgTkBOgvQ+rczRYdBCiPMCsK+vItGglOybQj5dJJv24irtOK8
	ygj/+d7Jfj0hPtBhuCX8UsCXNJBc=
X-Google-Smtp-Source: AGHT+IHBcqtVQqqbJMgNvgEQsiEKAsC+ECQLUgw7lRmSnRMkCyd3LvZGmOtmkguEXtv4jf53dBnmhQo3pJvMSYWBMNM=
X-Received: by 2002:a19:e013:0:b0:52c:8206:b986 with SMTP id
 2adb3069b0e04-52ca6e9b23cmr241057e87.56.1718299389509; Thu, 13 Jun 2024
 10:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240612223025.1158537-1-boqun.feng@gmail.com>
 <20240612223025.1158537-3-boqun.feng@gmail.com> <20240613144432.77711a3a@eugeo>
 <ZmseosxVQXdsQjNB@boqun-archlinux>
In-Reply-To: <ZmseosxVQXdsQjNB@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Jun 2024 19:22:54 +0200
Message-ID: <CANiq72myhoCCWs7j0eZuxfoYMbTez7cPa795T57+gz2Dpd+xAw@mail.gmail.com>
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

On Thu, Jun 13, 2024 at 6:31=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> So let's start with some basic and simple until we really have a need
> for generic `Atomic<T>`. Thoughts?

I don't want to delay this, but using generics would be more flexible,
right? e.g. it could allow us to have atomics of, say, newtypes, if
that were to be useful.

Is there a particular disadvantage of using the generics? The two
cases you mentioned would just be written explicitly, right?

One disadvantage would be that they are different from the Rust
standard library ones, e.g. in case we wanted third-party code to use
them, but could be provided if needed later on.

Cheers,
Miguel
