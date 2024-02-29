Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB8739FD1
	for <llvm@lists.linux.dev>; Thu, 29 Feb 2024 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709213973; cv=none; b=bKP6D1dC834sKRP/euupUrEzvw4/GSo13I4Itx2OfY1VXwnHdSLvZ+u++PLSyZXW0qn4KLbUQeV9NT4qWjOCZq1ZR5F+uBaqRolq3kQbmEpb0KJW76UxgR/wYvAWprtaGHHy+mdiIUogfhbmuTvfiW8vm2k5V8SWvbp5+9ESku0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709213973; c=relaxed/simple;
	bh=VZ5Y9Ei+MIJf3FL0eONlszgY8Ic/ozZTLuYGdsjIyaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gJSLPSMeyKxi7yjD1Wzcz7IhYBxQKc3kWix1sfTF/VzWcSUioKuvkRIqxDSfKz7KFtWuP7FkX2hS5d7V9nrpi3bbAD8/jv/3+mKMRaqbE8YaXyAtzZrEBZCiWX58+PcxjTpq87KzNCdMjqpzekH9sNz2w/BDL+0nm4odyzXgLKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5Mvq8u3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5Mvq8u3"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-29a74c88f74so583673a91.3
        for <llvm@lists.linux.dev>; Thu, 29 Feb 2024 05:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709213971; x=1709818771; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ5Y9Ei+MIJf3FL0eONlszgY8Ic/ozZTLuYGdsjIyaQ=;
        b=F5Mvq8u3GDVPvjlkLGdKxdQ8YX1A79v5EsYEaH6VWAKvP/dUSFqTkB9YFepNxHwy1y
         8QIG5aSS7aIfDd6/rlVtL9fyvCyTCdxzFwY0NvNxt1BzuSTAcfHZeuhUPaMX4SjfkHi3
         AaPoEqHi56Lgr64iRS4blta141pt57rxOUoL1HUEpvZxs/31zjuwRHrHzMHeBLU1OCc3
         kYpuV+f9EI2TWk3CWb3xTmZLZx/ZHV28yACkARdAsMTKn9NOUcnsMXR0L4hUxZMVD4LA
         ysyx3gyirz5MSN4dzsMDw3kNVvippRW94Bt9qoEY4SCd6E20nHciYOoOTzu8SZTKHoo3
         oQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709213971; x=1709818771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ5Y9Ei+MIJf3FL0eONlszgY8Ic/ozZTLuYGdsjIyaQ=;
        b=voiHBIEj5KO8K+LhqXMSY+StbHKSmiFzTmEECaKpR5eTpLMaONqLNBonno+/rG3wv1
         QM/B1e6Zc6M9HI2eUYIESjy7GTdETkbtTTWQvBP/t7soF0j7M+h7Onp/Vto7+iY4OEaF
         057B6BV1Clu1tVzdram6p8XD0vq47d2XxxhTnKVQH6puvob1zZNHr+xlSMRMOkXlQz4m
         dzvYnI+yHejmWeSVQB98n7G32sF2AhODiD8R9407AeJ34XvFqHLlD0z4x2E4hV3Q2pNX
         BEBbjelAKN6vPM8BCyBIRFEcDL3AUcQcYyivai5vVT2V09FssmnIYLY++L3svX/2J06f
         xiUQ==
X-Gm-Message-State: AOJu0YyusekHfydky01spHMR2/51fdDngvtNiut9+Vyqsk2EGrSqrkq3
	Cp/NyTMmH2OxK9mSHxeMfls73JAf/sct7qHO8dZBeMMbRrC1/qkcDwzsbeziEdxcy6pOZE50t9v
	STKtUOLYtDucsZBJ3ip5oJj45fu4=
X-Google-Smtp-Source: AGHT+IGelv6RxKf9aqGK7A90j222h96pKeHWfIAlFdNLY2T7ujbgu4wSQ5mit0xxWvEu2nYQoMTFCnN12WUrXbkeIks=
X-Received: by 2002:a17:90b:3a8e:b0:29a:6436:ed59 with SMTP id
 om14-20020a17090b3a8e00b0029a6436ed59mr2134966pjb.2.1709213971151; Thu, 29
 Feb 2024 05:39:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240208002841.GA2601476@dev-arch.thelio-3990X>
 <CANiq72=G--5LW-9sg2PscTL863mFVNdnX7LUQX2Xj02qZs4crA@mail.gmail.com>
 <20240212234850.GB3221859@dev-arch.thelio-3990X> <20240213025303.GA4006766@dev-arch.thelio-3990X>
 <CANiq72npYCD-zKqcXPNOAxnKiUCCXGbFQaGo-8=0-171ni+ncQ@mail.gmail.com>
 <CANiq72kcQUuxcno00+QWrstrcfwC+2_Bvh+8dr5kgVkEtrWOEA@mail.gmail.com>
 <20240227153728.GA819789@dev-arch.thelio-3990X> <CANiq72mmDquTeoEVErwXH7bVhP0+UifCrK0n=-HD97noWLqryA@mail.gmail.com>
 <20240227215605.GA1422986@dev-arch.thelio-3990X> <20240228184358.GA139944@dev-arch.thelio-3990X>
In-Reply-To: <20240228184358.GA139944@dev-arch.thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Feb 2024 14:39:18 +0100
Message-ID: <CANiq72myA+BGb44XfCqyjLDUmG8gbqQF9z-_sk1=q2KPiJtNRg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 18.1.0-rc2 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Conor Dooley <Conor.Dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 7:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> O Tue, Feb 27, 2024 at 02:56:05PM -0700, Nathan Chancellor wrote:
> >
> > 15 through 17 is a reasonable rebuild request, I've added it to the
> > queue along with 18.1.0-rc4, which was just released. I'll message you
> > when I have them uploaded.
>
> This is now done, please let me know if there are any issues!

Thanks a ton Nathan! That was very fast.

I gave them all (15, 16, 17, 18.1.0-rc4) a test (but only x86_64), and
they worked fine -- I could boot-test in QEMU (x86_64) a Rust-enabled
kernel and load the sample modules:

CONFIG_CC_VERSION_TEXT=3D"ClangBuiltLinux clang version 15.0.7
(https://github.com/llvm/llvm-project.git
8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)"
CONFIG_CC_VERSION_TEXT=3D"ClangBuiltLinux clang version 16.0.6
(https://github.com/llvm/llvm-project.git
7cbf1a2591520c2491aa35339f227775f4d3adf6)"
CONFIG_CC_VERSION_TEXT=3D"ClangBuiltLinux clang version 17.0.6
(https://github.com/llvm/llvm-project.git
6009708b4367171ccdbf4b5905cb6a803753fe18)"
CONFIG_CC_VERSION_TEXT=3D"ClangBuiltLinux clang version 18.1.0rc
(https://github.com/llvm/llvm-project.git
461274b81d8641eab64d494accddc81d7db8a09e)"

Cheers,
Miguel
