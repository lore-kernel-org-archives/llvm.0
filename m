Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17091332AD
	for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 18:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711044644; cv=none; b=qE4h3TIrfhofTpDah3I+OgPXNNffWGBza3rwyNf5NAbu0CPJj1HKafCv7Oao9MR9h5CyAjMqj4DVopd/UDRUoanEdFw2dyx5lUnfCuvzo0G5OQq5beih6Y4YncqQ6tKyFSq16FTqgWHLDyB9XgrnLXtukESgheweUQ6/NllzzbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711044644; c=relaxed/simple;
	bh=XgzMJ/XjredShNEfVbHnEUIphui6pHeLgNGgZLuPtKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdPKI+tTIBHV19lwt3s4TFe5ArT51jmnNNUUwlWeYRiQeOrhE03sXZ3iJNMJyec5swivEj0thnqiBVCHDXLl7jAp1o9iur7ldQ0cNu+hhNogbvoStoGY15yz3WVeyjdsa1E2JHC4E5HSL8KVNCtVJ8yctU01CeWhinwmjCHqatU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PHJzQCYt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PHJzQCYt"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so181481966b.0
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 11:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711044641; x=1711649441; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4emHCf80OrxsdWiLJNpRLTTX2dJ/UHkZ+YLYB2p4Nto=;
        b=PHJzQCYtGF5bllKWlOUTFOzQRu1/2a/RJrT8kGFmWAF/BkR1AIdM8soBKpWFHMNFLr
         GE2xiOn8zkZgI6IFnNfHxOFAYALlZNHMHofEQk7pNiI4LBuQkxCWleSeksOqFZniQirI
         YXySuxZXqHY5axNBzO3vgp0ke1bwNqtxBftUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711044641; x=1711649441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4emHCf80OrxsdWiLJNpRLTTX2dJ/UHkZ+YLYB2p4Nto=;
        b=Ku/L34Bym7v5zseK4ZkPwOP2rebTfHG70KAJlvSfNcXQDL5EhAR+X6RgSHqQ+asRqM
         tp0yIig82izyqesJBGpSvmf1cEROarHwiMJrdC8VcKST2aNKA8GHZDStBP8/emUuSVV0
         qOhHOVVs8sVzynYpI2tXE1c6YiTO0umGWBDLmL8AwhTzsmAkobNrge3q+p3ERqrPbtld
         ncVCyY2pUPxEPbl9ZePa/e0RkLcVr3DGNRVmCRbRaV8xXKOFONYkBK5x8i8E2y0VhcBd
         NyPNk4Q9MlfxsAxsZ0eHRY7tzSey0q09MWYeA9XC5c61NedrJmyhlSE2A9h7KMRLz6lb
         oDyw==
X-Forwarded-Encrypted: i=1; AJvYcCX5KsrhYClM9t/UL5CpqxX/zTjFY0DedFr14YFRrfXTD5CYJKXN8chAMdW/zW9Hju1EU3s0Ycpj6+nSZdRnqpMWwDPdWA==
X-Gm-Message-State: AOJu0YzVK7q9ysovBDBe+EoEHIm42SdS1UcpLh/9O0bc2aPDNImC+Mw+
	HpaBMO1rpvKHp6uihC0HhrRB9gc+4RB1kSSsc58uKPrIyvN5KAUJYiXYr77Er2A0zfoVm0xlxMR
	F17KL5A==
X-Google-Smtp-Source: AGHT+IGgh3hingMsBqPqVi2FXAIOOEScGyuStY5NXeUhtfYh5vNpGy7x3RepgW3vyogdiwvqOFF2hQ==
X-Received: by 2002:a17:906:5792:b0:a47:27cd:a2d6 with SMTP id k18-20020a170906579200b00a4727cda2d6mr31578ejq.36.1711044640625;
        Thu, 21 Mar 2024 11:10:40 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id va15-20020a17090711cf00b00a46778db9e3sm164486ejb.164.2024.03.21.11.10.39
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 11:10:39 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a466a27d30aso176353066b.1
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 11:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyUi4tMtrMk9odmrB5zTzvluj7g4nalY+YZWnRil1yHXp0yjMGCU4SVddIzSO82dqstmW4f5iNv/abbHTH0hlTa/no0A==
X-Received: by 2002:a17:906:3509:b0:a46:aa67:ab12 with SMTP id
 r9-20020a170906350900b00a46aa67ab12mr156355eja.9.1711044639518; Thu, 21 Mar
 2024 11:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zfwv2y7P7BneKqMZ@kroah.com> <20240321134831.GA2762840@dev-arch.thelio-3990X>
In-Reply-To: <20240321134831.GA2762840@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Mar 2024 11:10:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgGhgkEngBBureLRLKe7mQ-sRhYngUQNvxEUqR9mmc60w@mail.gmail.com>
Message-ID: <CAHk-=wgGhgkEngBBureLRLKe7mQ-sRhYngUQNvxEUqR9mmc60w@mail.gmail.com>
Subject: Re: [GIT PULL] Char/Misc driver changes for 6.9-rc1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 06:48, Nathan Chancellor <nathan@kernel.org> wrote:
>
> That build warning actually happens with clang, not GCC as far as I am
> aware, and it is actually a hard build error with older versions of
> clang

So the "labels without a statement" thing is not only a long-time gcc
behavior (admittedly due to a parsing bug), afaik it's becoming
"standard C" in C23.

Does clang have a flag to allow this?

Considering that gcc doesn't warn for it, and that it will become
official at some point anyway, I think this might be a thing that we
might be better off just accepting, rather than be in the situation
where people write code that compiles fine with gcc and don't notice
that clang will error out.

So yes, clang is being correct, but in this case it only causes problems.

              Linus
