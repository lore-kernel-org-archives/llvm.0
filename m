Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956FF18131A
	for <llvm@lists.linux.dev>; Sun, 23 Jun 2024 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719162368; cv=none; b=unB0qN8zn6NNMuFPo/xiGafzjSdmdtUcCqX9hcI7omKD7rFbNrAr4komJS8ndevPcIvovwLxKyovrGxMfYZLK8+hPdcvmXhN0QmV+kGb4lETvtV8bcc/qb1k0g2ZsWx3/dJaVKZB+YK8TN68wZF7mJ0SnNhuIQfuWlLGa3itpw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719162368; c=relaxed/simple;
	bh=45LdDu3bOcCKbhXgg4h83UgXbR3JletssymwhGumCDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPfSJKwvjS7eHLKs+dus/dnHyb9O3nwy/ztrdQ496DDakjLW66oDWFbY0ZgIT1Be4M3pyaAN0RHRw7xP0iBtpAAkDkl1N1yys7vZH7KxNy6PFVQuu3/NIsEThen8guKBhiNTUM6KAr4xGOujOn4Ohrkb9Me+8KMjNoU6aTugDYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MfgzB2aN; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MfgzB2aN"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ec58040f39so9836551fa.2
        for <llvm@lists.linux.dev>; Sun, 23 Jun 2024 10:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719162364; x=1719767164; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J2lcMIrHytzsqZNd1SmlAzfYjjTDrAQdmPKhyqoEJj8=;
        b=MfgzB2aNYPdPciglRwpSJQaeZxHHS+7ky01y9yVDPfZXxOXLSN0NAjDU12t+QWetR1
         lAjggrY6lD0xkb7yHbw2rk72AsoeJP/yvvdkPiyhFmFTnilWLkBdR8yZl2AdcWWkW/+O
         PbeJRFd5tSgJ3D58IEjtQNCUdWQjY+/tZnoRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719162364; x=1719767164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2lcMIrHytzsqZNd1SmlAzfYjjTDrAQdmPKhyqoEJj8=;
        b=MbUG7CeTSeyOZHgHLzcfmFWgJnQRC4dNZfiVxP6YfDjVuyC8Qiyqos3OSVXF/zSDmw
         2Z9JL5Rnx8bHMRBYxVjwvrY959JkW1bI2MWAqmsoT51wpSYa6D6zpAmYd2wHDj4gylaI
         07dlynGiMm0mliqlTfwfZDusVoyYt5to1UcK9kjIcw+08QIppAdrGhoG9TZY7aWX2BRD
         kRGFD57vq4Y6BE0pVS4H/QCa8pTzhiW2jO09RnOrvFMpx50uKmYZ+PIjR6EYUrQYYSnB
         KT008THHqvt4NWAFgJ3r4YQ/rfAk29atXZe6VH6wzOiQ16W4MKmFb0MqhkpdaXUgrA+M
         MPfw==
X-Forwarded-Encrypted: i=1; AJvYcCVo89ubJYv89cidg2fZojMHtCcQyccdge4GXbDVyThAaxhiyBeW6MWa8mWJi4ZRBZSvcP5P6jRWrGq0iI1spV4RCljFkw==
X-Gm-Message-State: AOJu0YwMTYrWXpq6uRfIt/j6lcM0hJf8UDfwxRdP0yGdyBsns2ftzq5h
	bw+gKmSsyBhf/MqgYFCkie0/8EY2YYy9kiRO8pTzCXqsMhlm2/og45DnPmMTcnx2B47AKVWV11t
	gdELGTw==
X-Google-Smtp-Source: AGHT+IEvr1HeJssUJ9fjoai+WHKMkaWUeEJ31fkSlSvfb+OylXvieYNZQu+xm8eAuPV845OlapuysA==
X-Received: by 2002:ac2:4258:0:b0:52c:dac0:7993 with SMTP id 2adb3069b0e04-52ce063e74cmr1862782e87.8.1719162364582;
        Sun, 23 Jun 2024 10:06:04 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce6ac66b8sm51727e87.107.2024.06.23.10.06.03
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 10:06:03 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec58040f39so9836371fa.2
        for <llvm@lists.linux.dev>; Sun, 23 Jun 2024 10:06:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJ7HGGlRBFjK4xFU7T316TdI423F/OxzVPMe8lGvM06RF4eE2HgmCNwwzkx7Sn09sUHLYcRR6CEI60C1Sm+x9yEJ/rPA==
X-Received: by 2002:a2e:3101:0:b0:2ec:1cf1:b74c with SMTP id
 38308e7fff4ca-2ec594cfe8fmr16692871fa.32.1719162363025; Sun, 23 Jun 2024
 10:06:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240620181736.1270455-1-yabinc@google.com> <CAKwvOd=ZKS9LbJExCp8vrV9kLDE_Ew+mRcFH5-sYRW_2=sBiig@mail.gmail.com>
 <ZnVe5JBIBGoOrk5w@gondor.apana.org.au> <CAHk-=wgubtUrE=YcvHvRkUX7ii8QHPNCJ_0Gc+3tQOw+rL1DSg@mail.gmail.com>
In-Reply-To: <CAHk-=wgubtUrE=YcvHvRkUX7ii8QHPNCJ_0Gc+3tQOw+rL1DSg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Jun 2024 13:05:46 -0400
X-Gmail-Original-Message-ID: <CAHk-=wiBbJLWOJxoz7srMPtKcN7+9cEh79fzf8GKXTJyRdk=tw@mail.gmail.com>
Message-ID: <CAHk-=wiBbJLWOJxoz7srMPtKcN7+9cEh79fzf8GKXTJyRdk=tw@mail.gmail.com>
Subject: Re: [PATCH] Fix initializing a static union variable
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Yabin Cui <yabinc@google.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Jun 2024 at 12:51, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I *hope* this is some unreleased clang version that has this bug.
> Because at least the clang version I have access to (clang 17.0.6)
> does not seem to exhibit this issue.

Hmm. Strange. godbolt says that it happens with clang 17.0.1 (and
earlier) with a plain -O2.

It just doesn't happen for me. Either this got fixed already and my
17.0.6 has the fix, or there's some subtle flag that my test-case uses
(some config file - I just use "-O2" for local testing like the
godbolt page did).

But clearly godbolt does  think this happens with released clang versions too.

            Linus
