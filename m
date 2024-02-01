Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221C1779E2
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706804165; cv=none; b=BvoF989Qbb7YTPLzWEQYaxRDVm8DU7WO7+JSQ0Z1P05tzSqceBeY5Jk7Z1bpYEwTdo2u/no/C/iP4cSJG0uYj4JTLuLlb5AMlC5cUFC4SlQdS5O24tEqPJKjOOL6oyFNIXPpfmZF9cZUDSQyWkbxk5FiPevjw+ebYp9dZcMUDvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706804165; c=relaxed/simple;
	bh=KIv/fPGPmFB9fnYjlnfz0tTFBP50SqUKsGSXl+uC83I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIi7+nXIdE+Veyt+oN2wN1WRWhgzr9vgZzkozuOnagtHsq5JKCchjbTlvk1BkRQB1lwg3uvlhOaetcUO+4x9Ksr+y/FvV72m803s58N2r022dWu813XwhoCsCEUe9p0GjoAHpb+V2YT2FDrY+me2jofxNb7AQSNA/OpZ9TeMTxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWcvEHCk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWcvEHCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97900C43609
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706804164;
	bh=KIv/fPGPmFB9fnYjlnfz0tTFBP50SqUKsGSXl+uC83I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jWcvEHCk6NPvkAwDiApDyJCJ3CmqrBtyA67xJeSSTahG+ig0UMgVlwx4ipHbTjRwL
	 ly1hjVcT/dRWjq9SUx9m4DiDvftphyqDOjJjsSqDLFfukL2e6rCFI7i47L10TgWGgd
	 gfj0RMa+9S+J4LSimyGzUitIGJ6EgvIG+OiwU074mwA4c8n17n4P/EeH0iIvRWMTQK
	 m7WSNgRrR3U71ffPondudt0Xd+zGc12JRaGaL1/SFWxCM+73xMhA4817td3oACzFOF
	 FM5QYv4V8PiX/0qiWAvbM/gYMN7ITcAUlb6FmZ3gtTQhCBt9hNqBuXmZkBuy+FDAMc
	 kKCEiCZIfDcGA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cf33b909e8so21765821fa.0
        for <llvm@lists.linux.dev>; Thu, 01 Feb 2024 08:16:04 -0800 (PST)
X-Gm-Message-State: AOJu0YxLKOr6cW9hgk5uzV0DSfx9i7VE80rNln7o36IkAb5DIlPB/How
	SyphCehhu5cWuacqLM1uVtrkFMUf85LO4zV/PvxSOxtxDKgKrRoRu9yHpKWGIhrhfP7CIF7iwgg
	LeiYP/3yRNCwICQCQNeNpkYglFy4=
X-Google-Smtp-Source: AGHT+IGCz2AvcYNo8VPFy1Gw6nGWuB+5qmsVqWWYqW5UFbannAB2SzVvLb5a0QRqGMvdcoV5bRlxSDtXGv23RdSYYfE=
X-Received: by 2002:a2e:b546:0:b0:2cd:9e2f:c631 with SMTP id
 a6-20020a2eb546000000b002cd9e2fc631mr1571302ljn.10.1706804162761; Thu, 01 Feb
 2024 08:16:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
 <20240129180502.4069817-23-ardb+git@google.com> <20240131083511.GIZboGP8jPIrUZA8DF@fat_crate.local>
 <CAMj1kXG9W0XeEVR4tXDDg0Ai9XPsZGrTJaSRYUqgTV-xtFxjdQ@mail.gmail.com>
 <20240131092952.GCZboTECip8DbWtYtz@fat_crate.local> <8b38ef82-ec2b-4845-9732-15713a0e2a85@amd.com>
In-Reply-To: <8b38ef82-ec2b-4845-9732-15713a0e2a85@amd.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 1 Feb 2024 17:15:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH4U7X3_xgwhYUgbWqVfnzL5Dx0QaUhb_5TpZGQEh=_8g@mail.gmail.com>
Message-ID: <CAMj1kXH4U7X3_xgwhYUgbWqVfnzL5Dx0QaUhb_5TpZGQEh=_8g@mail.gmail.com>
Subject: Re: [PATCH v3 02/19] x86/boot: Move mem_encrypt= parsing to the decompressor
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Kevin Loughlin <kevinloughlin@google.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 15:17, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> On 1/31/24 03:29, Borislav Petkov wrote:
> > On Wed, Jan 31, 2024 at 10:12:13AM +0100, Ard Biesheuvel wrote:
> >> The reason we need two flags is because there is no default value to
> >> use when the command line param is absent.
> >
> > I think absent means memory encryption disabled like with every other
> > option which is not present...
> >
> >> There is CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT but that one is AMD
> >
> > ... yes, and I'm thinking that it is time we kill this. I don't think
> > anything uses it. It was meant well at the time.
> >
> > Let's wait for Tom to wake up first, though, as he might have some
> > objections...
>
> I don't know if anyone is using the AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT
> config option, but I don't have an issue removing it.
>

OK, I'll remove it in the next rev.
