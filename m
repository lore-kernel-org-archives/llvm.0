Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97E63D61
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 19:40:38 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id m3so18546595lfj.11
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eo+NI/ZY6vwsGX0YbjboRUexcl2mfDPwhfiG8UnYnwk=;
        b=BnS1v48fprKmSRXFjcrnsMCOkSZvYZQKHkA3LVRLp/DQnYYFla62uXIfXJRAbLMigi
         bFCZxlifzHg0dE0dAEH4xtBlMhLSpHZdPD89nlH9F7pdl3UwkeWWhnSQ/WTlG5C7cq9x
         p3SeW6+eqS57A/bUxi4swECZhDIttG9TD9X6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eo+NI/ZY6vwsGX0YbjboRUexcl2mfDPwhfiG8UnYnwk=;
        b=x6Rj6MZ7M20oNewaVxVpqtQhj1slaBidbY//96xsP5UeCWkeWds92eRT1knxtZmG2J
         dQp7MQV2Eht6XVRCOcVgO5ev5hGnU8A/kydVQMDeqzDJWjmyVgjm8LslDhSPLv0GUMQg
         RZFEvIF11apxsLWY7yJWUBVVgxc+fyJ4i6RIEmctAdbp8A/GVaG57aBxyW3nKFRtpABt
         +Mgh5vzUgTgz0GNplXuXjAjZ0UMIQ9E5jjhhe0ZRaKJK1lp87fTJhUEbiSkQCckQbyQl
         5v8wTbr0CPIaaBZ8q07/j6HieU5d1B9ulsQGW4VqSFd8aOMlrp4ZvmZwkrYr+YddgxHz
         vVMQ==
X-Gm-Message-State: AOAM533iq0Jik6Zz1sLjIDi3TG/z0uBF1+/CaYmVbSFJg3OP98EeAaZg
	0o/tle4Dt2lvWIhffZZRsEDQQllr7dGayjGOWas=
X-Google-Smtp-Source: ABdhPJzhe7lVSZDU8E958ueGwHDN7EVlU1Xb9ZBLYLJhv41OcaeSiyP6xCAhShKEIAikD3lRCDkyJw==
X-Received: by 2002:a05:6512:e9d:b0:44a:1169:7f89 with SMTP id bi29-20020a0565120e9d00b0044a11697f89mr12848703lfb.215.1648323636534;
        Sat, 26 Mar 2022 12:40:36 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id g22-20020a0565123b9600b0044a20eb26dbsm1149369lfv.253.2022.03.26.12.40.35
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Mar 2022 12:40:35 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id h7so18596359lfl.2
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:40:35 -0700 (PDT)
X-Received: by 2002:ac2:4203:0:b0:448:8053:d402 with SMTP id
 y3-20020ac24203000000b004488053d402mr12881072lfh.687.1648323634830; Sat, 26
 Mar 2022 12:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203251443.9BBADFD98@keescook> <CAHk-=wjeGc-BjkDWTYkXzyQu-vf9EEujuT-6=U7Od0DvCUfb8w@mail.gmail.com>
In-Reply-To: <CAHk-=wjeGc-BjkDWTYkXzyQu-vf9EEujuT-6=U7Od0DvCUfb8w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Mar 2022 12:40:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wid1da7CONOA4ia++vKe5pCFda6gwdafjFP4HXJQcjcsA@mail.gmail.com>
Message-ID: <CAHk-=wid1da7CONOA4ia++vKe5pCFda6gwdafjFP4HXJQcjcsA@mail.gmail.com>
Subject: Re: [GIT PULL] FORTIFY_SOURCE updates for v5.18-rc1
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, George Burgess IV <gbiv@google.com>, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 26, 2022 at 12:29 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Because if all the compiler issues and warnings have been sorted out,
> it sounds to me like the compile-time side could/should be done
> unconditionally if there are no runtime downsides.

.. or do the existing compiler warnings for the builtins already cover
all cases, and the only reason the fortify-source code has
compile-time warnings is that the option takes over the builtins?

So maybe there's no upside to the fortify-source code for that case?

              Linus
