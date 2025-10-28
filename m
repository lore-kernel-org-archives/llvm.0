Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D02727FD
	for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 18:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761675314; cv=none; b=etCjsJwVLIKBGZfuYU0vkpXx8e+RtS+RVRALVOBALV0pTwy+YOt+RmOzdmavxtbTsuPZiv9EQ2o4hqZnatIcHrZIIONtupZ0AuGt3GJK+3Cr+B+OdG1G40+rTvWKngk1iV74Tt9eRO82G3A85iVtYs1ee0v9Ti/5N57pakvIwYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761675314; c=relaxed/simple;
	bh=IdoA2Hsz3DXflOJ/uWb+OTuJMtFaS4jo6XzpS3PQUeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sf857JnFfyfgXrMoUaV6i8pl3caPgF2V0yJYjrLG53Kco6zlA2NNsXraBtw7ByqQxm0dYXZ+PXrlrzc36th8Gkc6SRXwbsqRXBLiYOcAWeYpu/pmKK9eCB0VzphMP/IlcMwTbazvqGcZ5gzId+E5Z2uTSDaL8N6UdeqsbsYnmuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jfc4HqPC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jfc4HqPC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-290d48e9f1fso22735ad.1
        for <llvm@lists.linux.dev>; Tue, 28 Oct 2025 11:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761675313; x=1762280113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdoA2Hsz3DXflOJ/uWb+OTuJMtFaS4jo6XzpS3PQUeQ=;
        b=jfc4HqPCMF0fe70B4alaEIPadX5ZuCi8h6D3qOOpLBrUujwj8J9yYQUrTMYYqTYm8f
         tgGt5UhDA9dM6UjO9LRGUhmgtA6mM52Ad/gMvZ1QS4KlyB5GF9xdjTLtOZQ5xJi1EGGg
         ohzooASDAddSPTBJ0sPKBOd2u6oSVmBgF/RZXC45ZG3f057d+GzAHs/oS8ndqPQKUNpf
         yhXWRLCrigwAp8nrkEp0HnCcDBMcAk9AYBnx1D624cmdfU+Fa5u+2/sdEWUXIcilg2oZ
         ZqjcOjVzEh6xx7GOJo+Z0AIHdNqQRMab5uoO99EZjdVgOvSlEje7Wihp4RbTQNS9XsBu
         p1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761675313; x=1762280113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdoA2Hsz3DXflOJ/uWb+OTuJMtFaS4jo6XzpS3PQUeQ=;
        b=rxbXeC+xAJhLPLQ+O5LcxF1nIxiMCVUE9puE+x9uCY5dF3NKOw9gFMStEg3K5lHmbG
         i7agY3icC77hZkBrYgI47KhPFyYIwlIzvi4x0FqJcECO8BW5f8YPTRANdaAx5df2b1PC
         ByNeMhdyjoPOB7K9AWddaG5SDAKZ1Vnk1YtGyeMukTeAAU2+FlIYXwiV/ujOe5B8rxCl
         SqRO1qlGBEkp10AkwpcrrhBBHxyh06nJTAqsP5ouF5UF/HxrdkNmfTgxJABFwE5uEE+2
         5olaVqE4+AfzDx7bTTNxJUc8TtCKei65/HG9bLmRVMuqGxUZ1zmLgtAZu3yjGo2MzBVp
         TPWA==
X-Forwarded-Encrypted: i=1; AJvYcCWtRo2ygYjerpqxqQIGf55qfNxx1vW2a+bSEbXEUlbOQ8UxtfjGzvKXokPsn8pe+IzSHTH8@lists.linux.dev
X-Gm-Message-State: AOJu0YwELIC83+P0NMn+cjudjfl0nRswmRqHfW55l5Hye2/rV9EWCvoP
	/K6OSw6J6LdPlm+Wltfk1+rj6Qfhz8lDQ5S/jh0QbmLCC6cYmnr8sahx49HR2fZDjFQNkAmRvbK
	QcYkIpwzIukvY0mYUU3630j7FYwWxj/pOs6HgkzrE
X-Gm-Gg: ASbGncsJ8uBqpmADTldxGN8OuJ/sOaFL7xghnvG/QnhLb2YAy1rrxoP96agSwVQ/tBL
	3g+odyNKq/IiweQ8QVelJj//QJUuvmoVmh04hnMY5wWlmJPobOqUlE2VkHb6JXaaMzg+m2TfMyu
	ptorz+nPNcq7eDh1Mg//tNTESnYkKnQEvPq3Fl2x5O2JcHn92P8FZ138ILmvtCTap8ikZWDglD2
	ewHcWv4SjWiBDoaxHAbPi7gtGthdg+poxv1s1WXepQV+gO2nE1NZl48lw==
X-Google-Smtp-Source: AGHT+IERGgSXUSFxn2JeNfQ2C86EuHjvzEyZOaIycK2W0jkA78IAxEYdTtDG+mA9d+7pqLJIChA0NWObPqGrobS4WTk=
X-Received: by 2002:a17:903:22c3:b0:291:6858:ee60 with SMTP id
 d9443c01a7336-294de36e83fmr559985ad.4.1761675312071; Tue, 28 Oct 2025
 11:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-2-ec57221153ae@kernel.org>
 <CABCJKuesdSH2xhm_NZOjxHWpt5M866EL_RUBdQNZ54ov7ObH-Q@mail.gmail.com>
 <CACRpkdaeOYEcK9w1oy59WBqjNrK7q5zT2rzg8pHgDdZdKWVKZg@mail.gmail.com> <20251028175243.GB1548965@ax162>
In-Reply-To: <20251028175243.GB1548965@ax162>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 28 Oct 2025 11:14:35 -0700
X-Gm-Features: AWmQ_bnDLfsfNIG5--yjR8bWyBut4gyt9iExhd25ip84kUhmdr4d3xv1vPYI1-Q
Message-ID: <CABCJKudsbd6=8B+fkzbw6TkL-dVvSoT3Co=fW+jWOnuBtxsLKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: Select ARCH_USES_CFI_GENERIC_LLVM_PASS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kees Cook <kees@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Russell King <linux@armlinux.org.uk>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 10:52=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Mon, Oct 27, 2025 at 11:56:21PM +0100, Linus Walleij wrote:
> > On Mon, Oct 27, 2025 at 4:54=E2=80=AFPM Sami Tolvanen <samitolvanen@goo=
gle.com> wrote:
> > > Instead of working around issues with the generic pass, would it make
> > > more sense to just disable arm32 CFI with older Clang versions
> > > entirely? Linus, any thoughts?
> >
> > We have people using this with the default compilers that come with
> > Debiand and Fedora. I would say as soon as the latest release of
> > the major distributions supports this, we can drop support for older
> > compilers.
>
> Okay, I think that is reasonable enough. This is not a very large
> workaround and I do not expect these type of workarounds to be necessary
> frequently so I think it is worth keeping this working if people are
> actually using it. That means we could mandate the backend version of
> kCFI for ARM with Debian Forky in 2027.

Yeah, it's a bit unfortunate, but I agree that we shouldn't break
existing users until newer Clang is actually available in distros.

Sami
