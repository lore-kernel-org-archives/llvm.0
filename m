Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C2435A95F
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521421; cv=none; b=k8oxPUaeUhspOSN8T3gXYJMos1hgKc6sp/NQMQ8GeC80N//obiGNCq/CNG9OsuokWFr23HCZg9aARuNtpzMjcxRanMxJ5Su5j6G4v9c8ooOhb0ERbVqvCwKQbPNjGoa1h9tKyq6dKL8AFGFKyduHAjgHPKoZJerILSVOdFQjfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521421; c=relaxed/simple;
	bh=YWQoXaW3cKZqhpo+aBWzcCqTRm9Ks5colNnv68yZEYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVA/vg/6MuVwy442eRbJOe82HqQF478fs2rb+r1wqApTwwKn7Q1s+IsLp2nVOn4uzQ3xl0lsE6j2s2dM9Q2SKJJIr4ItNa2FjvQ37vRmkaPxheZCFCg/Z0MgYOc1Hv027A6pTFKkpdkGV/OiU4XtyifqQvgrBdlujqiLyHtJeEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7unuYEf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7unuYEf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EBDC16AAE
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 13:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769521421;
	bh=YWQoXaW3cKZqhpo+aBWzcCqTRm9Ks5colNnv68yZEYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Q7unuYEfWr6mqYKCEyfbl+1InrUxO65kJwc4PnSI/oLY1U88qMhdeV0M/9wsPiGfh
	 ShLvd8W0O7at6E5YVhah8FgF44iJ1amKJM5RPuQRUBMuafTXWQz2kiAqBMdBaGdZvk
	 xjNGj5H8n0rxfkLA9LmenQSwUqjfdHkVHWr8pHMuMXXrMcc7kMc6n4qutiNI3gPEI0
	 TdqUdKgAHaTozu4fJFNVaAPQd9FL0A+z86yz3nMDNmubFy28KGOKryZBQq2IFRsJse
	 +qUzgDIR2T5G5B9XnrtdK1aLx28WyD6o/Je7nM2ZrHmVlXClTODjy5DRm3KiGIV3/O
	 /+UdVRGPiERvw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-385bdc72422so47104711fa.1
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 05:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1ayBc3iqbEe/kXKWTwA+q7Z7pY3YucTEbZstwqdUafJoIPjOiMYzddCOSblBNau0yURdD@lists.linux.dev
X-Gm-Message-State: AOJu0YzBfiCsgjNiczhEBZwOG80ChUqIqSJomoDfv9XGGjwyaGUcr/8J
	TUo2MOOmuXxgDr+I+Col4jLBr33gZ+tEFBWbuPOVDCBCR1znc2/vaEvURH5eIBUD9CFJTLYqwLP
	RGsqe4QQU3/pTkZCYXT+XzN0GQUY7hQk=
X-Received: by 2002:a2e:a9a3:0:b0:385:c99c:b09c with SMTP id
 38308e7fff4ca-3861ca34906mr9358151fa.40.1769521419792; Tue, 27 Jan 2026
 05:43:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org> <aXEBTl-LhCvLdXlj@smile.fi.intel.com>
In-Reply-To: <aXEBTl-LhCvLdXlj@smile.fi.intel.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 08:43:03 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=qXn2xqra1hDRcKTkuQn421_mXyaBCQBuFO4HqmtLYOQ@mail.gmail.com>
X-Gm-Features: AZwV_Qh4iQFlGFEZq8FlYX5km0bfB02CKfwwKyoCAf2e9bX-y58q1Jhv_i7-kaw
Message-ID: <CAJ-ks9=qXn2xqra1hDRcKTkuQn421_mXyaBCQBuFO4HqmtLYOQ@mail.gmail.com>
Subject: Re: [PATCH v3] printf: convert test_hashed into macro
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 11:39=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jan 21, 2026 at 11:10:08AM -0500, Tamir Duberstein wrote:
> > This allows the compiler to check the arguments against the __printf()
> > attribute on __test(). This produces better diagnostics when incorrect
> > inputs are passed.
>
> Seems there is a consensus about this version, FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks Andy. Anything further required before this can be taken through pri=
ntk?

Cheers,
Tamir
