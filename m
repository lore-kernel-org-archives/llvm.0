Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F7B1EABD6
	for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728989831; cv=none; b=iqRZtB+qTp69CpDRR5Cf7FiyUNCQJy8hMifBE6quIrCeXOT7v2wBtPSP4oxSCFLZXV19k70/3k57OvFRvvheT1Qla+Lw8T4LGG9WJEw6AOPQ6Jbra46nXtV8SXVWXgmYPAB8sWuZY7Q1TYqqK7C8uptYv7HbpVabkQH/ExDVl3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728989831; c=relaxed/simple;
	bh=mBWDy+/1LsU2mdwv1xP65UODLZMmvWYLMSfi4wfkJQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQIppIEBuYWxkmUxSiNkmRZOskftZ3XaobF0NA1IFs6cLTXh5tub8RkjwQJ0hc++9klHsjbtlfx1sGZnqHJC1oIHjoi18ITLxJFIacvtzo3aBortudMV+goQ0eTNCWNEXBmjvltK60+lbFcgvejnauGl/v1WGNw5HdRSMwn/BYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmQQoh4Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmQQoh4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0693C4CED0
	for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728989830;
	bh=mBWDy+/1LsU2mdwv1xP65UODLZMmvWYLMSfi4wfkJQk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kmQQoh4YxBvbkgspgx/X973q8Bmnwb/dxh0QPJgtrtv4OL6LV1HiiqItFg8p8vNuU
	 WDckni2cX6kck54UNdTc5ptOBGtVzPy2j7x7uNmUwNAgCbgn6zep12SgPqOFLHiqgu
	 FVChmW1hYmKKgfLfdVBLApUp+1i130fdXK47Q93WZ5qfLuOq6v95Aw84pl4a5O/HKk
	 VigB64Fhopnb9x8lHMVIcBCID+vI8d52T6NNs7rCT+qfxoJ28Yztr5cnzkGkvNUPz4
	 dXloIa6rMCxrsRFz8Ue4JQHcQNoGK49JtdtRTN6T8mk408GISGsT9f9ON9idQiMeub
	 tVQcnVTOD+IKA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso2670283e87.2
        for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 03:57:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX66ybgxPyp1vn7Bjc+FfCCvsw43FhoqpD2FfByzo6E7kefCehpqnDuzn2G5za1YOgcNC8X@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3Bj3hIgSSkkY7yasFgB5kHYEaG2cRsFWFnFIUlqh5I/23x0jM
	+s0KFCyEW8EG5M27NcTGHVDrxV7ScjgWKchGVS6OKIdeTOv1ny0bptLPhDLrQm0qNrGXiGuoSZp
	6lBDsFKgZJkQXZvXm+sBm4A1fneA=
X-Google-Smtp-Source: AGHT+IHDatbRRWflHG79t76g/ZmQOloSnfcbXHBgCIHWzrSGdpAhWGwB4xFU17eSKij3R1NnXzvhVTbId4qaUTC+x1c=
X-Received: by 2002:a05:6512:2398:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-539e54e72a2mr5276430e87.14.1728989828934; Tue, 15 Oct 2024
 03:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241009124352.3105119-2-ardb+git@google.com> <202410141357.3B2A71A340@keescook>
In-Reply-To: <202410141357.3B2A71A340@keescook>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Oct 2024 12:56:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF7aFyBOOxQQsvsAsnvo3FYrkU=KA1BiMeSuKq1KHC1qA@mail.gmail.com>
Message-ID: <CAMj1kXF7aFyBOOxQQsvsAsnvo3FYrkU=KA1BiMeSuKq1KHC1qA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/stackprotector: Work around strict Clang TLS
 symbol requirements
To: Kees Cook <kees@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, x86@kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, stable@vger.kernel.org, 
	Fangrui Song <i@maskray.me>, Brian Gerst <brgerst@gmail.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Oct 2024 at 22:59, Kees Cook <kees@kernel.org> wrote:
>
> On Wed, Oct 09, 2024 at 02:43:53PM +0200, Ard Biesheuvel wrote:
> > However, if a non-TLS definition of the symbol in question is visible in
> > the same compilation unit (which amounts to the whole of vmlinux if LTO
> > is enabled), it will drop the per-CPU prefix and emit a load from a
> > bogus address.
>
> I take this to mean that x86 32-bit kernels built with the stack
> protector and using Clang LTO will crash very quickly?
>

Yeah. The linked issue is not quite clear, but it does suggest things
are pretty broken in that case.
