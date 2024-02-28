Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0E515DBC4
	for <llvm@lists.linux.dev>; Wed, 28 Feb 2024 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709141973; cv=none; b=W2xdhr7GAUxRtuZMlOBa5LSG9PM23YEc4nqR7nv0v8gPOlKgrPgTHSOr4hEkjqv4FJBXgQLRxvY4Lu/u/IoZgLV3rILuDPO2aU7earunlmQ4d6vHVsZ2JWdA/G2NKNUhddCSBRuKLMffAeKEYb2+PaZy1ZrgItK6VZugDl9AKIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709141973; c=relaxed/simple;
	bh=QC8X8RLJg/EcMAAM6B4fCWDSCW+dwBVTLUthDex9rDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/7hIj9IMHOGYJDtDV8wKM9NCDfCfQUIuNAJPHh1uHrHBS7TfdCX52kIxJFXx+Sn8IPM9YQrmW2EGAlwt0suAMa+2wlwlQs+WNlWw8HmozXFWUy0PVwozMj3+F525pvYavUlMycYMh5KONRJAgfR6YRTurtmYauHa3kYHY26K/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SQBI6dpp; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SQBI6dpp"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29a2545a1e7so3821320a91.2
        for <llvm@lists.linux.dev>; Wed, 28 Feb 2024 09:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709141971; x=1709746771; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NODDRAJhqWW7+B+ilVMpkZpvr1dJVh6fzecoPQ05aGY=;
        b=SQBI6dpp9tMkjwoYFonhNLU9g7SUA7D2qZW249Udp7rDBcaHJ/9CE8fWoUG8k59SMo
         0UxD2whusaJ96tUHWgJZWkRXuGJA70XLt2LmhFQUJOQikMgO+TuEn+x7rbkXJDHm50T+
         7afnVMZCScLbnQL4GT2Zu+djtVop+zKko3rIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709141971; x=1709746771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NODDRAJhqWW7+B+ilVMpkZpvr1dJVh6fzecoPQ05aGY=;
        b=OSH94zPFpAyh5EXc9p4bW4hjmmDLN9APCIHmRl21tB49dnkjREySPm+npJukFWGWi4
         eLcyG9UJ86MShmlK6QZOHXBH8AfsTLwxEeWr9bhxb4zUN7bFvqIos+APk2sp41/IjR3L
         JDy/bn2eCrNAUCeGn9KWcZOIN3pRsEhq+juphw0hG81uz75Cio7Pp8ERZbzZ9Jjzlu7x
         UqlHA/2EnjLtorAYyORj9O3UiOKCiFiRmdwYwpYVxHozbyNa0hzFZdpriJvBfhl4oQBa
         8YCkpIeKzKbcqtaJjEAyuBENHTm/3/S9BxNDj/3ucR7lJqRKH5PbO6sXExeKuP6vSKou
         FUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPQ8fyvNEp4NLR3bTuwJuDT8cbzSsRGyMTPmDDOLTqVM+kjWp3qTGZcrhsyz73Q1mT0QPI73OnEfVEtYcSayrGm5OIUg==
X-Gm-Message-State: AOJu0Yz2Tn8CDipb6ELzwC0oYmWIVhj/OpStr0p+BIwsgJBC0By2jlnx
	tGrjnVqPZ0cZz1wMwH99GtHe6N6dk2hAnKIQPOGyxGMjWvjBAUZKVoZhMZ4cpw==
X-Google-Smtp-Source: AGHT+IGp/woc+TexLF/WvhjGKbASp59EBqxFySULqYfcyiys7bw1alzskx50yFi4SAk3a5wWSI6Icw==
X-Received: by 2002:a17:90a:cf8a:b0:299:58af:c873 with SMTP id i10-20020a17090acf8a00b0029958afc873mr400790pju.10.1709141971163;
        Wed, 28 Feb 2024 09:39:31 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id sz3-20020a17090b2d4300b002961a383303sm1953273pjb.14.2024.02.28.09.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:39:30 -0800 (PST)
Date: Wed, 28 Feb 2024 09:39:30 -0800
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Arnd Bergmann <arnd@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Clang __bos vs loop unrolling (was Re: [PATCH] ALSA: asihpi: work
 around clang-17+ false positive fortify-string warning)
Message-ID: <202402280925.5B709A60F@keescook>
References: <20240228140152.1824901-1-arnd@kernel.org>
 <87msrkhcz6.wl-tiwai@suse.de>
 <1265517d-b98a-4ec6-9215-10cd988ff78f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1265517d-b98a-4ec6-9215-10cd988ff78f@app.fastmail.com>

On Wed, Feb 28, 2024 at 04:03:56PM +0100, Arnd Bergmann wrote:
> My first thought was that clang warns about it here because
> the 'u16 adapter' declaration limits the index to something
> smaller than an 'int' or 'long', but changing the type
> did not get rid of the warning.

Our current theory is that Clang has a bug with
__builtin_object_size/__builtin_dynamic_object_size when doing loop
unrolling (or other kinds of execution flow splitting). Some examples:
https://github.com/ClangBuiltLinux/linux/issues?q=label%3A%22loop+unroller%22+

Which is perhaps related to __bos miscalculations:
https://github.com/ClangBuiltLinux/linux/issues?q=label%3A%22%5B__bos%5D+miscalculation%22+

-Kees

-- 
Kees Cook
