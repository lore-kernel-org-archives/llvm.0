Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0694433CC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 18:12:38 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id va17so22862503ejb.0
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ptF8zHni/dtF/nc99e0aS7F9CBaQ1NQmrwLtsXW03QU=;
        b=WLyD2pZm7WFWV0QaL0PhAfQSRcvuRbbKAWfzp1L7fMHys2t+qnoQAujZpKmy7i4Hhv
         OeS9xnhrwrCer82ERIEdi2LUE9/IB8xAlXaEaWaRXVw7iWZ0kNrPKgRDvocxsD8X4Bn7
         dLiwoFzF7lf0mSE7SpIhYQeAsWlCShpDHVRVQNzS2mJwndt/XRktR35mJ3ADGYJqLODd
         GrHLf/NGUToOBm5kJGfyBPjsvp/aR44wz8YCKlzZuWmuZMKm6rHsGuMiXCgp+Vg81d/E
         nt3gkczcL8UN0W8DWf9Aeo43rqMjwJI6l4oJM5ox9KyN2lL0JCrOPKb3ZxOKzkIxGWiX
         yefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ptF8zHni/dtF/nc99e0aS7F9CBaQ1NQmrwLtsXW03QU=;
        b=DPbWil2d8hdD+VEMt0V4FB8l9AD9IDVbiGeqIbnOjQrNwnveXliZebhrrMmEZJjXLX
         so/xM/KaFBbmIFU8ehD89k4bQo8hvL2BV8rZ+2fo9D9SoJvojufTC/zifh/uafpvktMT
         gzDajBcu+KKOM47Jsy7lrk2H3c6Duh7UaPPbZ2jtFgMT1ZHFtoSWu44duQjQ79Dm1Mml
         kMIjy3JHXOT2FH4qI7UU3R5L6/L5NbSETAImNOm6xvWZNDzjljgFS8E6wcMP7jAU/imT
         uaAZwd0wdmXBT1N6gOy/dHLalnC5ErNdm32qhwIlhi5iOB8F/qSXxp04889n9PmUsX07
         mMeA==
X-Gm-Message-State: AJIora/I7tcKLkdGMiLkbBU/RWS/wbcp10HH3KTkxzOTIrhFG4WBvgLK
	O/f79bmfB6HMGAEGmJrKeEkD2H9pMGR0E1Lbz2dg2Q==
X-Google-Smtp-Source: AGRyM1tIpFXGKwBA7g7NTk2J12W2l8iAubFWg76YY8MRePclnJ0eaSkzPB7GUnwn/AKCeVfwy6FfRlgnPdtXqEaRbAo=
X-Received: by 2002:a17:906:844d:b0:72b:307d:fb52 with SMTP id
 e13-20020a170906844d00b0072b307dfb52mr27243273ejy.182.1658167957169; Mon, 18
 Jul 2022 11:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220608223539.470472-1-justinstitt@google.com> <YqJYrImC3Bk40H1H@dev-arch.thelio-3990X>
In-Reply-To: <YqJYrImC3Bk40H1H@dev-arch.thelio-3990X>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 18 Jul 2022 11:12:25 -0700
Message-ID: <CAFhGd8qTc-=Fjw2LZW4HYJtVyizkLhYRyv-TYLd1ji-9oR9EdA@mail.gmail.com>
Subject: Re: [PATCH v3] include/uapi/linux/swab.h: move explicit cast outside ternary
To: Nathan Chancellor <nathan@kernel.org>
Cc: Justin Stitt <jstitt007@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

Any chance a maintainer could take a look at this patch? I am trying
to get it through this cycle and we are so close to enabling the
-Wformat option for Clang. This patch fixes over 50 warnings and
there's only a handful of patches remaining until we can enable
-Wformat.
