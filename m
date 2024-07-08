Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E22D152783
	for <llvm@lists.linux.dev>; Mon,  8 Jul 2024 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720480075; cv=none; b=GCKZqG4Ssn/iLtFC34scZjNTJeC7fuZY7263sRs8ucf1VvjP2O4RQzb/Z7W+XSqBnjm93s9Sm7KOs8cGNaf+sMFt4L8zUWrHtACet9Tm4PNHTQaXphndG+Bo2azIQRUj35qYpn64gTOcK02SkwPx17WWXoc/XQuz0wO71BTC+3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720480075; c=relaxed/simple;
	bh=H8CSN4/T3nQXfh1+RA+MR9bjuKS8ZJ2QJ6XUMZc8/pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bAnFyLPe1LyAvVwjsjxTEz5zqdGrTtLUDzACe9I0gdJ/58YlIUPWvyx5qaAuY2drENdiabiwJDBTz279LhIyz9z896VOgQUZJjC4Hlvt1P4fFta5mpmZzDMt8WthwpiR9d+p2S+gQstJ4JIffGYSqOU/1uOBRFl9inGrcqYTJAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtSuJBYk; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtSuJBYk"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c9ddc9aea7so1174801a91.2
        for <llvm@lists.linux.dev>; Mon, 08 Jul 2024 16:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720480073; x=1721084873; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkkjqlkKsOnXHPkz5QEsrE7yBqoT/wiu44Pa237OHw0=;
        b=FtSuJBYkpGjn7EvTE/gCw+XZ6tjAVpaHpOfaSqrwyeesCSneMjTeDoAp982+vfAqpH
         1fHAjEt6EtPcLIjjgw9B0j0N0CIP3LqXW4A/g+xjup6Lund5sqaCWs4IBFBasfd9pw/e
         17niuuiuRBCAfygMNz+lQeYgnoEqAkzw0WbdeV48LhCZE3HmDDdLIos/Ub6jvV6Pjx+O
         KWG3vL2TAQ82Wx5uZ3g8jrxrLoaw25JmoShjtvw6WUEbVMp0s/QItUR9/lDlvY4sZuQh
         kEtgRYcZQ4lgytECz+4SrR2qUX2cv7umOk1syLJ1rvezWKeXGJKiY9/0fIZFA51zOtBe
         grjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720480073; x=1721084873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkkjqlkKsOnXHPkz5QEsrE7yBqoT/wiu44Pa237OHw0=;
        b=thwR+e3y4DfNI9gWTFY4YFZVd/wv9F6cJmvCG8I9fJS+vZEd35K5pCnYe3fS/f4P0G
         8Mfa4mLtyDKfKYqT0STnVMXFTrdIpPu/qMUJXByYHtihZqeZKwW30kTjixsc/sbwZ7Zm
         9kT20CZxYX4zLtUKHwnE9w6aEH6p+a5pcZVr6xY3G6wQjohxCkL60GSvQ+NHPvdNuwph
         WHEE3xuNYB+KHu8FbFbU/T+P3OtoOibKzGNG6QLTmBngGgRWWgRv70fZOJ0am34/eiWy
         g7wRHjIyUOL0Z2dkzEzeew4vlzVCPrg+FyiBFZIdzsFudn+OefCxaKktdvfQB1Q9isSQ
         2uGA==
X-Forwarded-Encrypted: i=1; AJvYcCWt4fkllmyMGRJTD5mpLrKqRBFGL7wKn2R1WRVhiozVvClTVCNq7LEOtD9Ph3jrh/UFX0IOIFodqtylQBUFllACUp98NQ==
X-Gm-Message-State: AOJu0Yz/bOf2G9dq9/CzfESHAIPC9HVueQfYMW/vGU5yJb+k/5FrUMT/
	/yJKFWt4iqlLVd10mkXO+sH2dEu/+QzA/zOGICsW/2T3I+C/vkyOp6wfhyHxJqkR6k2KqKzVF2k
	2wL1DhlubbgK8f5gH5lDO17CmcUY=
X-Google-Smtp-Source: AGHT+IGCbxoTKZ4bOpJ0NuQ44hnBKOxxfPu1MixKOmIoyzvzOz5POT6RBTncFKN+6XooqZ0a78zMqu/soFwu9eCbIz8=
X-Received: by 2002:a17:90b:1018:b0:2c9:8b33:3195 with SMTP id
 98e67ed59e1d1-2ca35bdfce6mr914225a91.4.1720480073380; Mon, 08 Jul 2024
 16:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f80acb84-1d98-44d3-84b7-d976de77d8ce@gtucker.io>
In-Reply-To: <f80acb84-1d98-44d3-84b7-d976de77d8ce@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jul 2024 01:07:41 +0200
Message-ID: <CANiq72mgTiOsnnLUP-JewoFsScV668WstP0bP2Lj+LGxd7L3sg@mail.gmail.com>
Subject: Re: Plumbers Testing MC potential topic: specialised toolchains
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, yurinnick@meta.com, bpf@vger.kernel.org, 
	Sasha Levin <sashal@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guillaume, all,

A couple of comments on the Rust bits for context.

On Tue, Jul 9, 2024 at 12:10=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> Then Rust support in the kernel is still work-in-progress, so the
> rustc compiler version has to closely follow the kernel revision.

I wouldn't say the reason is that the support in the kernel is
work-in-progress, but rather that `rustc` does not have all the
features the kernel needs (and "stable").

In any case, the version pinning will soon be over -- we are likely
going to have a minimum in v6.11:

    https://lore.kernel.org/rust-for-linux/20240701183625.665574-1-ojeda@ke=
rnel.org/

We are starting small, but it is already enough to cover the major
rolling distributions: Arch, Fedora, Debian Sid (outside the freeze
period) and perhaps Testing too, Gentoo, Nix unstable, openSUSE
Slowroll and Tumbleweed...

So, for some distributions, the Rust toolchain for the kernel can
already be directly from the distribution. So maybe it doesn't count
as "specialised" anymore? (at least for some distributions)

Of course, I know that you include cutting-edge too :)

> The current state of the art are the kernel.org toolchains:
>
>   https://mirrors.edge.kernel.org/pub/tools/
>
> These are for LLVM and cross-compilers, and they already solve a
> large part of the issue described above.  However, they don't
> include Rust (yet), and all the dependencies need to be installed
> manually which can have a significant impact on the build

Rust is there thanks to Nathan! :) Please see:

    https://mirrors.edge.kernel.org/pub/tools/llvm/rust/

Cheers,
Miguel
