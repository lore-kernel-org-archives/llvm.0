Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDC4134CC6
	for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 20:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711052935; cv=none; b=nEloXXYMESIK7iaT8FJcISItmEraRy9LqYmhrYJoxDEhdKTNvrV4ePcy4yqyXXM4sq181J2nMuJRX3MpO7qyFBKwINuB/eP6fUWv3JdtEkA1khWzd24se5vYLyCzaWhP2STA2RoA27VKwRtmbS/G5Oht6XUBJb/kK1I3Eel6dHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711052935; c=relaxed/simple;
	bh=40GFHceNhuZI93Iz7b2NAa2Q0jxRvhqelX0yrPTFuak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+5VP369JhTKYxpjMDqAr4karKN6JOiC4Cgs1LCG0wyyuAzkp7cgT/zn5ympQDeT1ONSy3XfmAca4HamWOEGRtjvA5o2voXtPHjNDm7jTqXF5F0K9J3WpBW/cSkxyBDOu6r1FlPAquX1/w/AyaHjTLkN+g/CasxjiWLWyI1Okec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BuarihPB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BuarihPB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512b3b04995so942037e87.3
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 13:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711052931; x=1711657731; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yE7KCSgieOxjgQfKXcfdAqspZIz95OJyVI+TAK+VEjU=;
        b=BuarihPB4pV7R0Xt9oxbhOq4ngsKbch7k7XNNsb93btTp+7i2BFd+42L/8Ab+ZZFIL
         UsKX1r/SVGhmTae3c23hhe2zCE7EGYdi5ep5C8a8E1XqVkIIsNjPng41fYxromVhi278
         Lz9hSXPg7yYQ6V+U0j1CMJKX10JMFxjZSKJCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711052931; x=1711657731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yE7KCSgieOxjgQfKXcfdAqspZIz95OJyVI+TAK+VEjU=;
        b=q7orC8BnAiaAizG1UmB6zpN7l+kabU1alEk934jwUtnK7nZhEH/2jdEM8R1vcJ2YJI
         imLKsVqoJLnXXgwHTD646AoujX+23YdlyvWD7EQB1chgcALlAPApFezjS1lXBFPAjJr/
         EhfAw2W9H6HjYYIWrhDLduEb8pPJs/oO+C7uqB4KuOzRNJu2Is3F0pmI6ahDGWGeficy
         +BmFEr75WY8QqYos9fZ8A6MTJ5fFQly3lcoLLo6K2eytLsWZPz5W4YUZmd1uvGtzhJlS
         rR6TJm/6b2HGpXwPI/5OC6w5NV8GpJbsa0yPyr12YUIBKiuCiWdx7qbbuD/iJVya0LBa
         QcFA==
X-Forwarded-Encrypted: i=1; AJvYcCWmqMP6GvmIY/lcBOH7M7RWKcxYa0W4vz6nqwAjgCoqrzi456ZSQ2PcF8/XxGsB5FA7asDcNT1xy/CJ/3crmNAkD2syPQ==
X-Gm-Message-State: AOJu0YwDptViUhy7ekFsfV5U6WnS0nJoQdrlE2iuzhy08xxKOHRskyQ7
	Cy1nzzBSsEVjGU75xk5HPDq8bshMY7T65LfuLHQbmlf1yLqXgt34IuE28iRfkketJKp5nt/J6SP
	KSDsp9w==
X-Google-Smtp-Source: AGHT+IEs/DUZi9H2PAY6RgzRFIAmzh8olQ3tpNfQ0cB1qywt6RqlD8RsR4F/1b9/cvxBdwC8BQ6Klg==
X-Received: by 2002:a05:6512:3294:b0:515:9652:7f76 with SMTP id p20-20020a056512329400b0051596527f76mr322490lfe.1.1711052931254;
        Thu, 21 Mar 2024 13:28:51 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id m22-20020a50ef16000000b00569a2f698d7sm232532eds.49.2024.03.21.13.28.50
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 13:28:50 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a46cc947929so203062166b.1
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 13:28:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/hxW9SD2JpZK9dpcxtrhMoAU/KpBK0zROy9D38w87L4VJzjHtmAL8+pwNXQrx0Hc9Tlwj17z3bpcvdGxbbR26VUEWmQ==
X-Received: by 2002:a17:907:980b:b0:a47:2333:80b9 with SMTP id
 ji11-20020a170907980b00b00a47233380b9mr430172ejc.47.1711052930287; Thu, 21
 Mar 2024 13:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zfwv2y7P7BneKqMZ@kroah.com> <20240321134831.GA2762840@dev-arch.thelio-3990X>
 <CAHk-=wgGhgkEngBBureLRLKe7mQ-sRhYngUQNvxEUqR9mmc60w@mail.gmail.com> <20240321183006.GA2907026@dev-arch.thelio-3990X>
In-Reply-To: <20240321183006.GA2907026@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Mar 2024 13:28:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLtUZ8StEZAV194t+A_s9boSR-+ShutdAnahYpxkTXJw@mail.gmail.com>
Message-ID: <CAHk-=wiLtUZ8StEZAV194t+A_s9boSR-+ShutdAnahYpxkTXJw@mail.gmail.com>
Subject: Re: [GIT PULL] Char/Misc driver changes for 6.9-rc1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Mar 2024 at 11:30, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Since GCC does not appear emit warnings for newer C features that it
> allows even with older 'gnu' standard values by default (I think it does
> with '-pedantic'?), perhaps we should just disable -Wc23-extensions
> altogether? Not sure how big of a hammer this is, I think this type of
> warning is the only thing I have seen come from -Wc23-extensions...

It looks like adding -Wno-c23-extensions would only work with more
recent clang versions, so it wouldn't actually fix the build problems,
just make them even harder for developers to actually notice.

Oh well. It's not like this is all that common a problem, so I think
we'll just have to live with it, and hope that people don't do that
"label at end of statement" very often.

(I think it's case statements too, not just labels, too lazy to look
up the details again)

                 Linus
