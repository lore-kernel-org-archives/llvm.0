Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C946392C36
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 00:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787100481; cv=none; b=DDhvu+5TkZaKizD7Jk5j8ClKp7yVWWIh/lTfQkf5kCG1s847iGYx0VVb1zGUomyh0gJouJTF4776CxAAnWap+vT7zaNHR3djmHbKM9ywYUBIQdpOZ/1pp0n903EqtfiN2I/IrN6qjbFnBxNaqXuh8TomtXbnvHVXn4HXzySPpGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787100481; c=relaxed/simple;
	bh=Kxgm452VQp+wyYxHjcnLvvvr90x+w1jszljdzWFr2ls=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b4cncn0XDrKMNYhCZZJsWOb6YJtMCEQp2ETgPQmuOj1KE3OKUID1tjApS6OeF2RwycGE7BhOmhylAUrO/MzE2UaHJ6U2bUBG7zaBv6P/GVNZaAlZEHyvUA6Gz9TsSQJL9dTufALzVBTXrnL7ko+ILKkt+vzzOCFAfMPYL3IRMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id BACFA92009C; Wed, 19 Aug 2026 02:47:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B84F092009B;
	Wed, 19 Aug 2026 01:47:48 +0100 (BST)
Date: Wed, 19 Aug 2026 01:47:48 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nick Desaulniers <ndesaulniers@google.com>
cc: Matt Turner <mattst88@gmail.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Magnus Lindholm <linmag7@gmail.com>, Bill Wendling <morbo@google.com>, 
    Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, 
    linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
    llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
    Nathan Chancellor <nathan@kernel.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
In-Reply-To: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2608190129040.14132@angie.orcam.me.uk>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com> <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
 <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Aug 2026, Nick Desaulniers wrote:

> > It builds a kernel that boots in qemu and on real hardware.
> 
> Wild.  Where did you even get real hardware? I know very little about Alpha.

 Of course Matt has hardware, he's been an Alpha/Linux port maintainer for 
some 16 years now!  And several of us have some too.  I've got mine since 
2005, and previously ran and worked on Alpha/Linux as early as back in 
1998 while the port was still supported by DEC (and the company existed in 
the first place).

  Maciej
