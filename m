Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D3B72630
	for <llvm@lists.linux.dev>; Fri, 20 Jun 2025 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424416; cv=none; b=QnD46lY/GnZ0A7AATheOyif+ehQHoqcCwEqsuhbxueAylgQ07Z4j5IHZNDtPIBSrFHeeu+GdARuUmc7XoVlLecuMO1P/9MRyRmh33l04p0+6Mw5JR0ZO2x+v7v0DV0DGYDmoUc6YDQ7gdWgnp//gB0wbyI9zp4Q0o3+vs1fCYGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424416; c=relaxed/simple;
	bh=jZZ/xkZYhg27rMIBma/CNy6BmfDLsuguSvLbtNJe22A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j26CqLB7yyhjOnu42QY5vTntHeIBxKd82ca0xAOXHtZveF8KZhe6mYs9Tb9vHB8i/BfKHCc0472dCn4GDbRd1DkJS3xzGeOJ1/rXE3L/fkop9xJU3xZ5ruDNrlNOJD9OF2exURcpbapnwszwtuDOAPSIVU3mLlOVPQMSCxP3754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfxJ9Cj/; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfxJ9Cj/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b26fabda6d9so273584a12.1
        for <llvm@lists.linux.dev>; Fri, 20 Jun 2025 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750424414; x=1751029214; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHusbDYNQFht+VhqQI20ig4TKjH1YnzOWhBaeYQa1tQ=;
        b=IfxJ9Cj//sIJQLWdiQOlxd8V0nNRuwgoeAbvqzs8Jgz6RtAgicNy0Qj2/MlWw5p/tv
         e0NuvpN4OwaLLHp0H+NRHsMBa7Bgupcdx4gP3KgWkby4ktSBI8nLhuCVYwph4rVjtXMq
         Y2urZ9cGOeeX6xiZtnWOxTLXRFdejj+6jjvLb0Sf/1/b/qcF7lECdpBnfHOvDyvsnqAB
         OIeFnzG2nNDbslkgzQ6JCeTy/Yue74pXM1M7G0mN9y7e+tMjv9shzb8Ytn//jiVdYCvs
         H1A3dzE4ZLwhtz7jyc3854VkhbOmGpWbGQ5G7UskXmt+3cUpji+4ECfz15Qeb6ROZky0
         R0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424414; x=1751029214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHusbDYNQFht+VhqQI20ig4TKjH1YnzOWhBaeYQa1tQ=;
        b=BObHTk+DTr8r/dVHdT28mbmjIzouAP9hOJJDyas0tyXBlH/55qo0WktL7O1b0BA917
         lAh/mCiaczdxVjMNlnEgjEpccD5aWJ/2ITm4L/uk/H5XrLigDDuryEohLzqNVYlpKfLk
         qXP5CmgDbmiR6Dm8VuNmXuZ8KtLOVj0ZgmuxA2vOGUyKj4kxAgsGiaquDiqDzawDQcV3
         F4jGA+7ff4GNmMc+QCMc9nV0ffZXRS2Pn1QMcY5YwSxSW/esjV3hmLMfKpTjVq/lsEO6
         9H+roGdv+JeM1XURW51ebQ9Dm+TdKoVa5hoNeEfIWWx8876wdCP3h4AhI9wI1CBYOHSv
         JmiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4HUefpKq4DAI8PAx2TuN7HKy+kB7bI9V+7VDRaudmoNuoB9tM3yQrt7k4EDu0IO87xpT7@lists.linux.dev
X-Gm-Message-State: AOJu0YxCWziph2Pr45x/YnVA//AuHPBTj87QWtmBYrKLGBIQl4N8S8IG
	lQVZed1t+08k5P05++IRuNZITcqMWeBOqrRWa1QB78BAQvjIrQS7j9saiEK0xsQ5vLAlu6AQt5i
	OF2PHB3ZPYaCwmHRe9hXb+/obatPRX24=
X-Gm-Gg: ASbGncs3bjSqI4mNkQ4+noPIpRu6DuviMJ9mslFSIL6BhdUQcGS8j5H2PeQQYe16R/V
	fqQo1zl9KEoOWblXak7zfYpMvL0T6pe9ZH3emgRY/iLycei70Wo/KpDWsae45kuicufoQvW3OFI
	1WcETXWs43sQJfUSZ1YmeZtsRAXzLn0Atuavn3esCMZHQ=
X-Google-Smtp-Source: AGHT+IGlT/p4avAw3OActY0SsgmlHfvmC7u//by9/Qs2X0j+n1a4zqlppZzYwFev8DlDQk3HtgZsp2wYIisHxJvsWIg=
X-Received: by 2002:a17:90b:2709:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3159d8dfa33mr1803795a91.5.1750424413975; Fri, 20 Jun 2025
 06:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620111406.3365763-1-arnd@kernel.org>
In-Reply-To: <20250620111406.3365763-1-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Jun 2025 15:00:01 +0200
X-Gm-Features: AX0GCFvt549YbePHDFUC5E6wMqoJqx4LlXU3Vlyz-GlYaVfKJhvMdL9vUzaIFzA
Message-ID: <CANiq72mYSPA_S6hT4B2U8Sgt2QTJekuVEKqjJDgQxGVmMX64jA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: change __retain macro for gcc-11
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tony Ambardar <tony.ambardar@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 1:14=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> Building kernels with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION using gcc-11
> causes compiler warnings:
>
> kernel/cgroup/rstat.c:65:1: error: 'retain' attribute ignored [-Werror=3D=
attributes]
>
> It appears that this version reports __has_attribute(__retain__) as true
> but doesn't actually support the feature.

Hmm... I can't reproduce the error in Compiler Explorer:

    https://godbolt.org/z/roMrfjxGM

And locally with a GCC 11.4 I can see the attribute keeping a function
in the final binary when marked as `retain` against `retain` against
`-ffunction-sections -Wl,--gc-sections`.

Is something else going on?

Cheers,
Miguel
