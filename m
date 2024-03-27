Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FFA2C877
	for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543952; cv=none; b=eDhSFjUoNbqVt4MJd5ehqnEy2clNon/CoaM5Ip0ByIEBvBaQo8x8xFKdELZt4TrFh/BfRnl6MMnh4Zl2dXETabz61nWRYGWeKSnbcNZAhmgZRNRolzoQasC7UefD/N9H6KKK5J5mVw0bx+wJfqWuqGcLxu4tAnxT9T6eI6bJWyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543952; c=relaxed/simple;
	bh=lAvrRvDli3MU1wwHmO9KGxOUp2wwO3ANxnE7ASg3pIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqz5VL97I0LyHOP/zYS3ssSj22InxN4U2RdwYmsuQxVFIIMAiTPk4IxrtsSQj7Eg9r7i/mGxZQEDLFeDFms0JwE0Vr/J6zyjFPCFg5foEsSyB+kOD87+nvnzA7WQMQWUURfSLqaiF+eBGTfx3ad+uPcMm1J5Q58ZCGSMUEYOFCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=haPH36mL; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="haPH36mL"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5e152c757a5so3469678a12.2
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 05:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543950; x=1712148750; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAvrRvDli3MU1wwHmO9KGxOUp2wwO3ANxnE7ASg3pIU=;
        b=haPH36mL+51Um2FIp+Z96RA/uZRCzH2KNAsjZaVKZ8KnMBvSOInfVhpN4ZWDZCEjrC
         ya+vqEQGrWa0MRV6okwOxp24tG4FYA5xF03Q3suqQc0cEr6sisbfRXIKYz0nxo2+Plw6
         Z3LuhIKwgX/fB3qp+MGtt/5O2Y7D1Np4NtFoX4sIk+TP7wqwHMFTldBi3gJfaVNgxdcI
         2Hp7zedQoXyjdnVNXRnHIbf11N8MbywPgI2qa4X7zn4gln+UVVMz0X3gwiH0wd6YHeub
         zcF1W5JWhE6LjdbT47oJZaWFcgs414+xvX5aGLNUxwX8Jm6SbyJ6ANRLrmWsIsLLKVYu
         rzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543950; x=1712148750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAvrRvDli3MU1wwHmO9KGxOUp2wwO3ANxnE7ASg3pIU=;
        b=NQTW31kzR/m8k/kpdA9t1VdIN3t8Jv4w7NMl60HZzc8z7nJubXluL3G+/xHF/mEahe
         b5JF5DuLo0wJaVNqnZmtn07tkWhYE8rXJKIGBprCJgbMkuk1tPR3kTMXXxKbBR21djJb
         bqvqZvLuzA03M8Upmbx6DVDpLl3UAHEVwlmcKaaPbpJpbK8+zvfPIIwW87EcsQV84sCo
         UTEk9a+pzDnx73uZ3xdMqv6O7w067Ul/5V8pyJxWUv3U1tJTylf563xDqPgVtMKZ9y1A
         HLF83iMDrLWtsvz9/LoeRk63Yv5iUZjBAxh5OPa5R97tNTAoLGM6PMXD0rzUmli2HBDu
         AFzg==
X-Forwarded-Encrypted: i=1; AJvYcCUqVphkm2AbMaOupWWaEVuuTz3iDXfjpzH6VHFrIXCcaEjeSHy1dsofVD/88SdqqqoQOfknVf7IwweqjQCl6mvWpC6Ljg==
X-Gm-Message-State: AOJu0YyLorsH9+jCARgx34RPLnQT94V/4Ly5Fd6ffp2ozp8XeXOJ4W6O
	GuXYsTJ51drH9jtrq3H9rYkVz0N6qvZptoa28ft0tTBKNeHC2cHFiYqeZhB7bE/C+1fEnxkB0d0
	+OQXfy5W277TcZqnIJfZT25OktNniwO4AVWMFbA==
X-Google-Smtp-Source: AGHT+IHY+2UAj74FKEtjbyT+87XUc6G/DqM4kccngP/A2LCLGbbPHvI0e9mfhKo5kTUGX5ZVCnsxWpIe0ZbpiTPyVfw=
X-Received: by 2002:a17:90a:e605:b0:2a0:1ff8:1560 with SMTP id
 j5-20020a17090ae60500b002a01ff81560mr2847472pjy.31.1711543949752; Wed, 27 Mar
 2024 05:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240326153712.1839482-2-samitolvanen@google.com>
 <a083fe56-19ba-4c12-8364-944d8bbcc043@ghiti.fr> <CABCJKudxjhbLo_2zHBcsPh42vuLUGFj9wUxk+jf5USf2mvUZGg@mail.gmail.com>
 <485d2bc5-37f5-42a7-a3f8-bd53641c0d83@ghiti.fr>
In-Reply-To: <485d2bc5-37f5-42a7-a3f8-bd53641c0d83@ghiti.fr>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Wed, 27 Mar 2024 06:52:18 -0600
Message-ID: <CAEUSe79Fb0Knk850QtqQp12_7Rrb0Hp6rNoDwtjpCmdTELyVFg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Mark __se_sys_* functions __used
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Sami Tolvanen <samitolvanen@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Tue, 26 Mar 2024 at 13:56, Alexandre Ghiti <alex@ghiti.fr> wrote:
> On 26/03/2024 19:55, Sami Tolvanen wrote:
> > On Tue, Mar 26, 2024 at 6:43=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr>=
 wrote:
> >> Do you have the link of the report? So we can add a Closes tag.
> > Sure, this was reported here:
> >
> > https://lore.kernel.org/lkml/56d3285a-ed22-44bd-8c22-ce51ad159a81@linar=
o.org/
>
> For b4:
>
> Closes:
> https://lore.kernel.org/lkml/56d3285a-ed22-44bd-8c22-ce51ad159a81@linaro.=
org/
>
> I was expecting the "direct" lkft link though, @Daniel do you have any?

No, that's the extent of that report.

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
