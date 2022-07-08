Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7165D812
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 23:27:30 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 19so166384ljz.4
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 16:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Oi60uoXzvamvc3/SFoRIFUoo3eDrzVvDd6TkmxROEc=;
        b=eLIcA0wmLBrkZp3xFCD89JHRf3MzzY1K5ZOseLf2l7FsxyK5DEZYcIVMeX/d+KpKER
         RcLpKuJrJQMfTz4LDBMDQMCuZYLw6nfsRCZXgoLtqZn8EoYFiOnEzOEiPe34RdsugaC9
         DVLlB6vSXVef+DVhAEhpFaI4XSiAeLpIjhibeOYxJdGfRQP3u//Y5/7iw8E3MDi/jZTB
         HTWyHH0EVqtHdHaJt8xzJXzKX7nonEXKDdbPuT+SFp1c4j12HMZd23G5PLZ6t0nRQvS1
         dNIdWHL94B6lAEg8zgHC8S+f9q0NxYcNpbjlFQqSMYhWf8jHQdQEHsmMtXIrlLbEeVE4
         VLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Oi60uoXzvamvc3/SFoRIFUoo3eDrzVvDd6TkmxROEc=;
        b=cz4r7J3pKP3J02jra3VmI+qmQsmeHCHAtNzkmTlj7G5bCBU69Kp8UoXIgcA8EI5XKH
         BIyLGDzB5sImfp7pcA27J6Vs0YJJtOc5lucpCh9U1y5uMbAaQHFodnOhwnVud3aQeVm9
         yJbPbcEpYqSX5oUw6RJVU3o9Zdp0unhaVUukqyt6lZ4wPi7VcMkRjRum/PRmbCGHPIN5
         kBZfM1CdB7Wk2kCDMiV5N9qoc4ySu+MHidS1aYwPJrtCiktPmrIDrNo+OBmeETmS7sSF
         s1MyImGHaL22F5CWTHEn0U7BumlWGXSd/7S2Fb2WUx+0Bt75x7C3WTYMu4ZRVq1F5reQ
         OH9w==
X-Gm-Message-State: AJIora9PmV+UHCA4eJtElbfTwmjX0oRQrTxrHZgaFKgGrIAGt1ewXXbn
	2LH7WCbwDbG6wwxg9qgZW5RDL9Z+W7DNM0L4ZQ7OKQ==
X-Google-Smtp-Source: AGRyM1sbMd0h5mqMlOe3r5zsM/tg9DtuIaGzYY2PpvqrczlMjK3CvvTTNq4tPC2fb+KpnIF626wm3H/eHrl36HdX56k=
X-Received: by 2002:a05:651c:2104:b0:25b:f4ed:db93 with SMTP id
 a4-20020a05651c210400b0025bf4eddb93mr3316572ljq.295.1657322848370; Fri, 08
 Jul 2022 16:27:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220707181532.762452-1-justinstitt@google.com>
In-Reply-To: <20220707181532.762452-1-justinstitt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Jul 2022 16:27:16 -0700
Message-ID: <CAKwvOd=YiLPPyXq3Xvwh8+hMfSL1Ak_HE14No5YncbMMyM60Rg@mail.gmail.com>
Subject: Re: [PATCH] net: ipv4: esp4: fix clang -Wformat warning
To: Justin Stitt <justinstitt@google.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 7, 2022 at 11:15 AM Justin Stitt <justinstitt@google.com> wrote:
>
> This is the exact same issue (and fix) as:
> https://lore.kernel.org/all/20220707173040.704116-1-justinstitt@google.com/
>
> This really should have been a 2-patch series but I've been going
> through warnings and systematically fixing them whilst submitting
> patches as I go.

In that case, since Joe had feedback on that patch, perhaps you can
fold this into that patch, and apply Joe's suggestions (sending a v2)?
-- 
Thanks,
~Nick Desaulniers
