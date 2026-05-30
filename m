Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BCF393DDB
	for <llvm@lists.linux.dev>; Sat, 30 May 2026 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780126867; cv=pass; b=dR6ddXeplZWUnPgyTtkoe8QpOrywuMt3yNJJxKZ/m4tiTe6IhF9mbohS4rmwkw9MKvItJ5LB/VUTerrEzGHTHyzCHGEscldL96DfWBa8O0VWqSH9M5lplZFACPCz0gAtFKGChouo9HOrKugsc0U8RveBrtrO2PqWyNjnmRPuD1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780126867; c=relaxed/simple;
	bh=L3UEWLmXReuYoCrmgUMxQKkIqL6gBhu9SHlnPE1kURQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxJxVhraau4phEOEPBAvQUBMYvg6BUG3GB50iK16pmOsoJpBeNAsKk1vAQq8gWDKcPiJXFrs+aGILE13mAmWp56XjNvZ8lSzzFweHLlk7lP2nV4TVJqQohW3Jsi3MjMllGhg5cN6G0X0ysyDKW9pjDP06NHwy958xPZV8xZ/cfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQhidlql; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQhidlql"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so208329eec.2
        for <llvm@lists.linux.dev>; Sat, 30 May 2026 00:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780126866; cv=none;
        d=google.com; s=arc-20240605;
        b=djFZSR+Anz834mRum696f0eYSaWBv185c1XJgH+Q26QxL/Chv3m2Di2KyNbyYJCkiV
         4qhK+8Jb6PccyRuXArR2M3dj3sPGIAZ7Zzr0M1+7fI+X2IPLIgQjFyww4NR/HL8IbmCR
         RDlFEtj71tMb6nJcb3LVFmFK5el+J6M/7bg49Q/MEONnmiKYw3wxHMMjEDf7rR0Eq6Ka
         O9VH9T1Yh1Dd3o+BbOFqsaHzb7pHe3zmwPEZJDTcYhzomYq5Zwv3ViDYVvIDTH9swD/u
         KEHeEG3LbNO/Kdrw2BstUmln9CivkQRRAGmLjSy13Rejziq3eis0vsMFlx2jVe6+mPBi
         hqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=;
        fh=AfbmMews1k48N1AYScpjnGAaFzJD7zT5Yo4ZjV6rShw=;
        b=hW5vqCpMifzz3ff0JJ2k5a4RkQIK2N5CR6kNnQGOC8PWr9XSfhqBfRAKIO+Zo0W3eg
         NoaynQlt5ND496iDnk9rAU/kUJ0VK8xHJ/7uArfSwt8+gTRrfdQAKdujCs2gPRwGnUe0
         yzWW8ZOBhRZ0+htonypsHZ67903JZBSkm1SAXKmDwBv+BWnGg0X0KMeG88CLZJFeXohe
         1gcDzsljGEjxuiB2Tv45uiG8zMkE6+upKO0qH37f+i2OTjpXD1iv2UuDPqDi6KXZVn8S
         V4/a+6veTz2mF4w8xRFRTwuc61uCSUwvOK7mYlshSiXu+Wbxi4qD88wmdBFg7e7Y548b
         CkHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780126866; x=1780731666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=;
        b=jQhidlqlMHTr2xbbuxhoaF37l5SfCA3V5fynSf1dgis+/Fa2CjothCrY6vt673kWBB
         RURAg3wtx6laKpXVNgHptpLjgiuJb3aCiK6UleXCuTiaK/sSCmsWEzwj/uq7IhohRIKV
         f1cVEvY04VCshEOCRRK5Gudp1szhHl/9waPjNhpTD6PNeIZi+5wT4woKP7bpqC/k/7EE
         3Lq+t/WhToLC2eeII0G6bijywraW+ePpUjNKqjF47Z72B7NgLlTF1vOXpmQptoikpa0Q
         aMf2P7pYzo/lWD1fbhTUr8lqv5OYuOE9nZFH0NTNmVJPOsnuQNGrOOa2N3Al4ugAiKNB
         ravg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780126866; x=1780731666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=;
        b=ka1txU9WchBqMSy9g24p5dqh84OvoXPlUq+PK6qwCmorzNqdS7L3Y0PkhODY5LzcIf
         k4WA/ZTnu4YpMkEpE+IbpmfEHoiJoXwgWfO170CRzPrIDgy5hUHAT8K21voK1X9J0ZJ+
         hGvbnLKnw3V6UHCepMliZADDUs6b43QXHIM9CEFmM4Jx8JQvOztbQPy3F/FIacL7YyDh
         /yUA2iE7UWB+HZJN7RDpKa2eE2w50j6vomHx+GKpettKsjgO5iSYQ7qhiesMmPByUkRJ
         2RPckXBP6e+P2s7T204hQJwgb0AKGLUX+IOx9fS4p3OtU5U35WVgKpouLXOr+kbKTIP2
         DLvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gBiUbyd7sybRBWn2lOdsB/9FlmTK3ddn9nWs24HUrLleNmqLvWGA9HjvNXBfTd0VWGfYC@lists.linux.dev
X-Gm-Message-State: AOJu0YyS4LGNkTXbuxGRaMLB0UpnDhwy3d/XY3T0A00oLHCiSR/QY/js
	liO571/LbkK6LU+W/5lKA7Wj4HMAWw6L0WEAO2LkBDC/O/SHVM+Zatkn0Q6dTT3YM/ekQis1Z/S
	X/dk+4ejVS7DtqghEUNb4LI2PkM/JZ+k=
X-Gm-Gg: Acq92OGc1rloSnK9ZQKfYo76NBR18VeiqTyZzXaL18ZgU7ra0ehKj68NJZ7ZeNLid6m
	QY1lNFCcV8fWlhZs3n7TsxmI+7Q9bIKdeSQC5IBbHeit2rjovADDgncoWaGB+S90J/bucmvKMiF
	/+zss1hFUPkbIxKq+7zf7nXqxHRrytfrrNXCfVf4U7rbcriqqCQxIUN4XXitZ/z2jargEt9FsE6
	EF1/Wg8dY0zMycdftFsGkQSghjiGPDTqwOdABNz/i/3tmzxHyLvA/MkknWHIrlAnwLnf4L7RAbo
	iDomyJXO5TYzdZbTSASMelrQSnCV7ZT+b2O9hjXbhbBr6ImwUEp0DDsSu+Mek1Jtphsx1gnoPDE
	HPBvAPq7CKsPnEiGwIhY3XUh9pU1gEfV43w==
X-Received: by 2002:a05:693c:2c86:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-304fa4a75dbmr712153eec.1.1780126865429; Sat, 30 May 2026
 00:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
In-Reply-To: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 09:40:51 +0200
X-Gm-Features: AVHnY4LYzc72_leHtuASvRnfI_XBQ5P_tmJIekDaxm-OGvsoitOo6icCZq7qopI
Message-ID: <CANiq72ny89rMb9y1ysfbBjm=LVhO=51sRd6Ocpy-UOwFj=61vQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Due to a rustc bug [1] the -Cforce-unwind-tables=3Dy flag only emits the
> uwtable annotation for functions, but not for the module. This means
> that compiler-generated functions such as 'asan.module_ctor' do not
> receive the uwtable annotation.
>
> When CONFIG_UNWIND_PATCH_PAC_INTO_SCS is enabled, this leads to boot
> failures because the dwarf information emitted for the kasan
> constructors is wrong, which causes the SCS boot patching code to
> patch the constructor in an illegal manner. Specifically, the paciasp
> instruction is patched, but the autiasp instruction is not. This
> mismatch leads to a crash when the constructor is called during boot.
>
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         BUG: KASAN: global-out-of-bounds in do_basic_setup+0x4c/0x90
>         Read of size 8 at addr ffffffe3cc7eb488 by task swapper/0/1
>
> Specifically the faulting instruction is the (*fn)() to invoke the
> constructor in do_ctors() of the init/main.c file.
>
> Once the fix lands in rustc, this flag can be made conditional on the
> rustc version. Note that passing the flag on a rustc with the fix
> present has no effect.
>
> Fixes: d077242d68a3 ("rust: support for shadow call stack sanitizer")
> Cc: stable@kernel.org
> Link: https://github.com/rust-lang/rust/pull/156980 [1]
> Reported-by: Bo Ye <bo.ye@mediatek.com>
> Debugged-by: Isaac Manjarres <isaacmanjarres@google.com>
> Debugged-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Isaac Manjarres <isaacmanjarres@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

    [ The fix [1] has landed for Rust 1.98.0 (expected release on
      2026-08-20).

      Thus add a version check as discussed.

        - Miguel ]

    [ Adjusted link and comment. - Miguel ]

Cheers,
Miguel
