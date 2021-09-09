Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B98E72
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 00:13:53 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id b200so30696iof.13
        for <llvm@lists.linux.dev>; Wed, 08 Sep 2021 17:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u/oNyUzVDcvaYcpDh9wmrylwNICdOwMu/2YDLPmGpIY=;
        b=qz63LbSJJsuJtmyjrkE3D/8rI6hdOS0JHCJTfxLDv2cZ14JotrnFgqbZVAohleOrHi
         ghmHQvT3IonWSlFIYxTkyBE+87CmPJhh0oKL6I1k5NV5/M5Wth7QILaf73R4PWL8SVFt
         sVCfrMADxbAqwi+PDZZCWKr0qDPhRbG0sK+mdffoPjnhE6W+QchY+da8kmHrJRuSY+Tg
         sluIhYjJJ4Ke7O3OkBPyb4Yw/DM4DiRd7wFsBT8AmFzHcUzcvQLNN53GDuyoz+z5uoOn
         XgkcA8O7XnNbGIMctBOo/BKLGCr+pAUBDQWUTdVXeMkI5V3j0R7fWJJK5Hc6ZInj/om/
         uGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u/oNyUzVDcvaYcpDh9wmrylwNICdOwMu/2YDLPmGpIY=;
        b=d+AeSmR6Fd14zB7TML5l+KtBd60l6hcbSY3gM+W+HdKgTBf7M0odsbxFz9roB/eyTj
         TCBE+8djcadnZxyHol9dYnQQuU1qPJc+ZRNcL4hfFFMWKcDfU1kJIyuIUbBkjFVGf4Od
         PI4yRJQMvxWzjoQt5gntrW1ymWRrwiyG5vP1w0NSzribvMEZ0JjQYPyRx6IVNcb4McDB
         S1C1f2q/tea4uQlcaK3l9v03dd3zH+ciG/fgqdRDZCbwnvdqNS5s6YZWKAN9QvZP48yJ
         P1NyqU7+k4FOYQVhjkrbhSfZ2Sd4Euamvi/DYzZJiyLTXnCJeSCJHo49dozIfSZqJuwZ
         DlYA==
X-Gm-Message-State: AOAM531yLiOA4musYEw9aGlC9ZZCDGLYpPfEVbohIIBbNqdWsUBAnLGI
	6RCvih6vykf/jxhaF6JVW9/IUN+XXl/eWjkDBWM=
X-Google-Smtp-Source: ABdhPJxXnIrbyiyXQS2l6IB2elzke3/RP7HKSNs3rsH+0XGKvDYLboosLPBvZQbKIL/fLEtmVhBWhOxmf/dkoRm4rHE=
X-Received: by 2002:a05:6638:4122:: with SMTP id ay34mr191161jab.131.1631146432540;
 Wed, 08 Sep 2021 17:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210908234751.GA8052@kernel.org> <20210909000141.3136241-1-ndesaulniers@google.com>
In-Reply-To: <20210909000141.3136241-1-ndesaulniers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Sep 2021 02:13:41 +0200
Message-ID: <CANiq72nwzPt2zx-m8Cbi8-GAztknEefVDVM4VGhOFyUvagcukQ@mail.gmail.com>
Subject: Re: [GIT PULL] Compiler Attributes for v5.15-rc1
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marco Elver <elver@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Nick,

On Thu, Sep 9, 2021 at 2:01 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> What about
> https://lore.kernel.org/lkml/20210802202326.1817503-1-ndesaulniers@google.com/
> (modified to mention clang-14 rather than clang-13)?

I would like to have that one in -next for a couple days before making
the PR. Since we are in the merge window too, I decided to send the
one I had in the queue first.

Cheers,
Miguel
