Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB08F274FCE
	for <llvm@lists.linux.dev>; Thu,  2 Oct 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759444771; cv=none; b=IEDXNbRMRV2brrGQFrtHCP6v5kmIp0JZBO5yZLgEl+ySNU9IGDTQG2giPxU+1nxAUbCf0G3EAONXL7MnkFUAEi90JV8fgNkPwLzWpvY7BhKLyUFnkNN+D53JXSaAXC2Hd2gSTQSiX/sL1cNRYBaRXdOjGhvc/y8UCRMkcq2ho5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759444771; c=relaxed/simple;
	bh=MPv+Iwkd7lH6O3lPVcnYm0HoR2osP0+61xnq0XTVgYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kB0nTphKAcXy7sDTAQ44ORjujvoI/Ar0Oalutve/rrU6b9dAfDxtb4OM5N6+v3FdGjC/Y9YBOvbH0Q6Ul/vPYfDhUXNttHkrEANjdnE9PcywageECuAvrp+lkpcKxWI7TEDcxxY5nIbPXBopzI7WVTuckHjwByIQYfLz8VMOjQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQaYzzJu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQaYzzJu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27eca7297a7so1916765ad.1
        for <llvm@lists.linux.dev>; Thu, 02 Oct 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759444769; x=1760049569; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8E52QWTGIfO2NrRkEaHfqTdphgmYcegsGjZ94/TNcc=;
        b=DQaYzzJuKf3z6g5IG6d6hO23g6bHqHMuqjbPT5+mkSa2pr4hp0x1oNcnHBKuBtEUf2
         FB7g0TyX6lGDfoLW/upNA+6/sy9hDc0RPN9QHJYK5hfi6z0oaoGT8om69B6cL1aXa8eW
         meKArpdQlyQuUgV/BwRJ2kc6VRV0yK3zP/U2dzxjP6EBgjFV9foqkAUQF8u7oelckj9t
         hd3X9qe5XPRWWgr6MGYbNeipSJFnuV1OedpNWTJ49txkRqmhJV3FDi2b5f/mP0B8zuGo
         DDcMkEY7FS8lnDskIpAqoYlspHEiIKRwCp3g1xl/ZV2SUrf7iUHMkXimNffYVg/8YooY
         78mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759444769; x=1760049569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8E52QWTGIfO2NrRkEaHfqTdphgmYcegsGjZ94/TNcc=;
        b=M49LQbsgyaHvLVG+Rwy0EMvQH7hFx4Br3lJ4iU3fNyzxMjjxaOnpLdYT/orHJSbrMp
         MW4CNBBwFZfPIcBojAWSM5/uONdMWDh6SsqmjS6SmFiIysFdjBB4/P7pazts8Hx2XrlG
         BNUZO1Zfvf3GHaReOnhPnPd23BMjbpwTRst5ggtRmBynK+IU9lynH4+5sI2UTKjrvQdx
         zQWp1Jj7U/XhIV0itYAyUbHY0srUYoyRfcDHf08SPkbhF9GwsFejTdxOtjl0lR+7vheH
         h5cjvmmnr+f1fFi53b2GiJlefkX/eQHMZJgWZUhXFwdAGR5wl5O7LiR3hCXAfcQptMhu
         Pdgw==
X-Forwarded-Encrypted: i=1; AJvYcCXRwkDxNypkJnskkiPXiOyXf7Vaj4K8GBdPjwmaURZ454mY9Swgs1RrjfD9SKIsEq751DT4@lists.linux.dev
X-Gm-Message-State: AOJu0YwyF6+qBh5aDRd8J7pZoi3V+bLiQiZsdK87KdQ/75JFNTmCngF9
	ZG10Bz3f9J4rAi0gT6ulCkNKCqD3dO3nllqImaEnhKNKEV4aFNvB4dfC3s/ykbqdAK0f1d2JyQe
	h4mk3O7BmBVYQtDXycRuPargvyHpER1WiMLSLkjs=
X-Gm-Gg: ASbGncsQBFJgvpv5uca4UYqIz6K2B2IwEuxJZ5CDpm60sS5joI75GbawRDjmXib5Sn7
	4gCudyKJwDT7TPd15Z48juQT+eym2IE0zL2fhGz3+lO6AiOwAXRSUWlGt0kFmZuHVW8CJOYdH3v
	5Yx3J5Z0O0Gn3ktaRLIgT38WutcepRSOhyxJEn/CmkLMyXtkPj5fFHcxFUdnCUx5wR6TJLvFqzj
	J9ZiSn5j53OMwFsGLd4NvwGng1vyCmK8gDR4ehWqRbX8iLfb2XuWftJ1C+KTlMSFvisgEKOoifo
	1vXqHcbsJhFfAsug/I5CFOzSA/fSWKSyjq7i+ItWwOBosnLdW/6AUzMyaTKk
X-Google-Smtp-Source: AGHT+IEhRGnzB5EzFTBg5gYLUAKsYTD4tHz/84QxOuxiDXRxtdiTFAC2E75ntDwFb3VNaRgQPk1/fDRQR6NQmcoUJ5o=
X-Received: by 2002:a17:903:2f8c:b0:272:f27d:33bd with SMTP id
 d9443c01a7336-28e9a35324amr5544725ad.0.1759444769254; Thu, 02 Oct 2025
 15:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com> <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
In-Reply-To: <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 00:39:16 +0200
X-Gm-Features: AS18NWCqd29-UpjX1TL5yAY8ycRR0RhMhqsgiRqYfPBpAGaRn5i7wZcx5PXFDe4
Message-ID: <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:27=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> Sorry, this is rather annoying.  Rust is breaking the build for a very
> simple patch.  Many developers aren't rust-enabled and probably aren't
> even able to test a fix - my attempt to get a rust build setup working
> didn't end happily.
>
> Jakub's patch fixes a kernel crash and needs to be merged into mainline
> and -stable reasonably soon.  But that is now blocked until someone who
> knows how to fix this error and how to test it gets down and does those
> things.
>
> Jakub's patch is present in current linux-next.  Can someone please
> send us a fix?

I am not sure I follow -- the diff I gave you should work.

If you have a branch you want me to test and/or give you a formal
patch on top of that or similar, I can do that.

Cheers,
Miguel
