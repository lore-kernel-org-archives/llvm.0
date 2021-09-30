Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00C63FD5
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 23:32:54 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id v19so5295094pjh.2
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 16:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4kRmuKUrahG9seIEHQB8p6vrb39NQ+GV6pMPjXiJNGs=;
        b=HGL/KZ0jqmCjgbTC6ZXynflpAz4V9xD4Mrxgfi7Kn0MHTJWTnskxqDkMvms2lZGIBX
         whpqyazTpy2WtYvPuYsK9Rl1plz9CEAHbe6bojro555WymT5Ktlnf71IzZvSWMtvXF8y
         RVJC3FRFGCejSZhDyqDruGQDzPijplhH2aIjJP9b30rhYFo3YI9uX4VrtJ1W5OsoD4A1
         Vx8c7TahhZJPzOTU/Frqsve3jdPPj4a0Yv08b57EKla0aymni0laUlX1x6dqRTKzozLD
         CzP31LoWH9QzHqbvJkkI1pVHyAVR9qCaodFSUAyka1kYpV162lBAL0LrXsz9unCiycis
         oXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4kRmuKUrahG9seIEHQB8p6vrb39NQ+GV6pMPjXiJNGs=;
        b=BzHiZ/Erc8Hr1ova/jWR1tTVVP+ySKqAehwM4vBj6D03jNLV6N/euquAnY6wYYMTKF
         qUKHNdaRowAnQckeh1fwBj8V02nVRloTtH7M7dLs4jWYPDOtsRZJacUMmkn0b3Jr+h4Q
         1KBEij/fgj6EqbzQsVxlaRASvIX+rKzI2EsBWpETWKJaiA5okm16vAJbU87jj74Es+7F
         PoRSO8ewYN1rDgRdOC3dfailutVArJZwC97GztxIZk2MPos4la03+aJpUKEWivDBoJLn
         IBJ7ZaOzPgTjyf40NhWK8qgG08XJp8/EMcwy6d8GDwFvM+pXku3WRKaa8GwuwccE9bw5
         5FLQ==
X-Gm-Message-State: AOAM532KkqTBNkCRRf93jlJSO50x6mF3cU7nN+SK5VyS5fLzGv82FHBN
	9E/h7EojBbsr72W+T0N5DmRF0Q==
X-Google-Smtp-Source: ABdhPJysrpFMMVhFfdW8pGBLGHU+1+GLI5ELLB1RDK4HzOKTh0AU6VhWr2DYdGsWszQCpgnuITTLGQ==
X-Received: by 2002:a17:90a:4091:: with SMTP id l17mr9552554pjg.138.1633044773874;
        Thu, 30 Sep 2021 16:32:53 -0700 (PDT)
Received: from google.com ([2620:15c:211:202:c01d:f023:c9b5:66e8])
        by smtp.gmail.com with ESMTPSA id b12sm4063267pfp.5.2021.09.30.16.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 16:32:52 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:32:44 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
Message-ID: <YVZJHNchx9LZz//v@google.com>
References: <20210929225850.3889950-1-ndesaulniers@google.com>
 <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
 <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>

On Wed, Sep 29, 2021 at 05:18:49PM -0700, Nick Desaulniers wrote:
> On Wed, Sep 29, 2021 at 4:28 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Or, like in at least the early_get_smp_config() case, just make it be
> > marked __init, so that if it doesn't get inlined it gets the right
> > section?
> 
> In the case of early_get_smp_config(), that's what Boris suggested:
> https://lore.kernel.org/lkml/20210225114533.GA380@zn.tnic/

Sorry, I misremembered the above thread. That's what *Arnd* had suggested.
