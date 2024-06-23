Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F768BFA
	for <llvm@lists.linux.dev>; Sun, 23 Jun 2024 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719161518; cv=none; b=ZAmaIbTqFD4zdWKFh9VGOOA0QZIq+ftQm6OjR/N9gbKGDKGijQaZsMmYx5SEBB6PLFjoZqSxMbeqSHGiR9C3YjAQKSWbBoMT7OvotRUEYdaJtfruKPp2GeNfvPplcb2UWIZWJQx+HRDsBPqCF9s1d1ax6L2XKwVug+G0YhcYOXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719161518; c=relaxed/simple;
	bh=NZQyaZf7FOnKMjA4vLphHGmCC8OBy/rwt7kqfFcNkaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qSH1PM9SWsxR+ZyuvLS4kV6SyA/MomySiHH54k92EkWEkbLAcyYQLFiZqiN3WBF3NEiof2flG/v76hhPqb7KUfZaEQP3Hi5lHYG+c381NM3zv8gJA5WVIYix9uEha2aZcK2IfAk6Xz+L3rdUQonQOjI1agH1encM4Fr/9NkJTjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cRhY5DNi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cRhY5DNi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ce6c93103so154440e87.3
        for <llvm@lists.linux.dev>; Sun, 23 Jun 2024 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719161515; x=1719766315; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JZK30fVnygMHCN0lsNw1v+SdKhqY12DdFDA/r56Sx/E=;
        b=cRhY5DNiW7ss9HRuCf91s0dIoLAJPFEbnX0xLvQWpM4cQBEyGIBS3a+jLOmtTwvH68
         VEIDB6sWiGEVnz9mP1D6QyL4PBPcyJYrdqP5IPEgROTPgJcOrHfC5kJMZEUna7806Wfv
         lm6RlKVdk7RKGeAdkVEv9myI/RRNMMOvppRmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719161515; x=1719766315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZK30fVnygMHCN0lsNw1v+SdKhqY12DdFDA/r56Sx/E=;
        b=B+shC9naU0BFGpXaDUEcUHjKVjz0kxzv1yViN51JPo/j90WK1Nh2fyKKjS6ZQDJ+3z
         6SNMKRgpKa/a/WS4yN4VpJNia+a2nyoNQJsBUpVtLnmmoGgav3fgvUaTPnrzIJCfM7h8
         f0la17bPQkyocDJEaqB2K/Nn7ShS0KvkypoGindD31GFGahKqCX90b/OX7xkX9ZcY6jq
         Soif71xISjWTA1ZBdhyRcEK5ZACKTDRF6ETgMiAWD2TY6dEydDPSmLaJ8n36sQCXiTNr
         VRrxj2m409tw2GuwwwG7lW63XuohA5u1W7Kx7Cr//br01fu4ydg1KYSF2HcUAA6vYdOK
         u/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXgUgwhKNcgl1RFG1uxpQkvoAIaT2clffQjoB9fZ0HzvFiHBbtmzHzb67EaOPgb2bQG16F0a61dSC0tL50sQqkFOnXgQg==
X-Gm-Message-State: AOJu0YxrW/uX8D2p3JdsHc/g4oB0NS1hLv02IwbfzxuVaRZwmwTH56ar
	H0GM4UGccKBlJm9zViUedwpmxXyzsHOX7TcmqlR6e5MtLLIwe1DAGUArfqnJaXI/Jr+3obbPJoS
	hvKxQmw==
X-Google-Smtp-Source: AGHT+IGIDzowIqY4hvmACE6kuPsbz/miXDyggQpuB9Mk8oYZKw4GD6RNdQDjKRgjJnpdKSdbfvwlqA==
X-Received: by 2002:a05:6512:3b95:b0:52c:dd94:bda9 with SMTP id 2adb3069b0e04-52ce185c196mr2321665e87.56.1719161514641;
        Sun, 23 Jun 2024 09:51:54 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fe47d40dasm201944866b.7.2024.06.23.09.51.54
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 09:51:54 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57d046f4afdso1797257a12.1
        for <llvm@lists.linux.dev>; Sun, 23 Jun 2024 09:51:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMe7jcJ3VFFuUKftaGt3V4dFw+UCwgF+eUbdHCqJcb90j6UTdjtFTtu7ri3kpzJd/aHv0Uq9Fz5p7TeS5Bs2ZrVoXqHw==
X-Received: by 2002:aa7:da99:0:b0:57d:5d68:718 with SMTP id
 4fb4d7f45d1cf-57d5d6807b3mr89557a12.41.1719161513740; Sun, 23 Jun 2024
 09:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240620181736.1270455-1-yabinc@google.com> <CAKwvOd=ZKS9LbJExCp8vrV9kLDE_Ew+mRcFH5-sYRW_2=sBiig@mail.gmail.com>
 <ZnVe5JBIBGoOrk5w@gondor.apana.org.au>
In-Reply-To: <ZnVe5JBIBGoOrk5w@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Jun 2024 12:51:37 -0400
X-Gmail-Original-Message-ID: <CAHk-=wgubtUrE=YcvHvRkUX7ii8QHPNCJ_0Gc+3tQOw+rL1DSg@mail.gmail.com>
Message-ID: <CAHk-=wgubtUrE=YcvHvRkUX7ii8QHPNCJ_0Gc+3tQOw+rL1DSg@mail.gmail.com>
Subject: Re: [PATCH] Fix initializing a static union variable
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Yabin Cui <yabinc@google.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2024 at 07:07, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Jun 20, 2024 at 12:31:46PM -0700, Nick Desaulniers wrote:
> >
> > Can you also please (find or) file a bug against clang about this? A
> > compiler diagnostic would be very very helpful here, since `= {};` is
> > such a common idiom.
>
> This idiom is used throughout the kernel.  If we decide that it
> isn't safe to use then we should change the kernel as a whole rather
> than the one spot that happens to have been identified.

Again - the commit message and the whole discussion about the C23
standard is actively misleading, as shown byu this whole thread.

The bug IS NOT ABOUT THE EMPTY INITIALIZER.

The exact same problem happens with "{ 0 }" as happens with "{ }".

The bug is literally that some versions of clang seem to implement
BBOTH of these as "initialize the first member of the union", which
then means that if the first member isn't the largest member, the rest
of the union is entirely undefined.

And by "undefined" I don't mean in the "C standard sense". It may be
that *too* in some versions of the C standards, but that's not really
the issue any more.

In the kernel, we do expect initializers that always initialize the
whole variable fully.

We have actively moved away from doing manual variable initialization
because they've generated both worse code and sometimes triggered
other problems. See for example 390001d648ff ("drm/i915/mtl: avoid
stringop-overflow warning"), but also things like 75dc03453122 ("xfs:
fix xfs_btree_query_range callers to initialize btree rec fully") or
e3a69496a1cd ("media: Prefer designated initializers over memset for
subdev pad ops")

In other words, in the kernel we simply depend on initializers working
reliably and fully. Partly because we've literally been told by
compiler people that that is what we should do.

So no, this is not about empty initializers. And this is not about
some C standard verbiage.

This is literally about "the linux kernel expects initializers to
FULLY initialize variables". Padding, other union members, you name
it.

If clang doesn't do that, then clang is buggy as far as the kernel is
concerned, and no amount of standards reading is relevant.

And in particular, no amount of "but empty initializer" is relevant.

I *hope* this is some unreleased clang version that has this bug.
Because at least the clang version I have access to (clang 17.0.6)
does not seem to exhibit this issue.

              Linus
