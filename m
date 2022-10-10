Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D167320A
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 16:42:43 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id c24so10847984pls.9
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f+X0dPUNTzvXsxSJGYhvGB/UduBVQg8zNVHQH+Kp9jQ=;
        b=eVCfkkkCkVgQuSb4QlPgq/2erp2lpWi8z0RZhA7C/aNm1ryA2KL2HGi2tJdq6mOpSO
         WuXGAjiirI7U10uM01RcSKJh8syoKd80r4J9HjkukfdWHJdmIwxIQuPiFOgB+eIBVopK
         jBeWUolzRg2C11i9Zy4jhkAKGDVPBE+oz3FhXEZ4GYVX20ZlHL6h53UAvoKZm4ckMPkZ
         +DbTFd9cYNC8CSOF4i3zIOg+40YGb8f1lE52HMat42SH/4mOSV0cEPSuPFHx4TwYaegO
         3f346LPCE4dJK9Wc1VYUZ13QEKKdlGshSU8Rilx20RzdPiYfXu6qE8068aTIWcnzOc82
         55TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+X0dPUNTzvXsxSJGYhvGB/UduBVQg8zNVHQH+Kp9jQ=;
        b=xGHJSNbenMfAY06njPHmso5qGE85KBzas3C12qrCUFp+aonqfNIHLqFX+NncZ1vsUC
         ZaKDVwLfF4/24ujEuiMeXLiOUM06cYj8aMQYAcXjSl/AbXhf7tpFizyVhk6JCe7YYsbQ
         5Ro0UAmihhvpn5ddeG8o4g6m6gyYU/f/p2NS61Zlzr2zEnAOzap5Jc0EwNB9bIZknQHr
         8hyrfxwZ2c606E4g4wGBxg7NCwGmrYwGPKkbCyOJD0zv2+HBAK0oza8XXf1REkY4l7Ts
         Z6AZM+9TTNtyI8DvQCT+2Yk4oC8jyBJZP+tcID3SGyqGQ+/iZBPwUmFR703EGAGSMmZp
         VHiQ==
X-Gm-Message-State: ACrzQf20tCFFNz1D1d0yf3TRuSiams4+CSvkOdcNkFqGBrhsCRZ7jj+R
	2nL46zC75sVnAAyAz7Pbcs1Wz0PuBV1tK8bVKRSG8Q==
X-Google-Smtp-Source: AMsMyM5dNVNTY7K3+ncFOHk+OeTpeT8OH00IQspK/gDrewkWzjoXpQQCcmk0OWiDXIO2CGOxDrblgnKbzMTHV98NIUI=
X-Received: by 2002:a17:90b:3a88:b0:209:f35d:ad53 with SMTP id
 om8-20020a17090b3a8800b00209f35dad53mr32777961pjb.102.1665420163240; Mon, 10
 Oct 2022 09:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdkEied8hf6Oid0sGf0ybF2WqrzOvtRiXa=j7Ms-Rc6uBA@mail.gmail.com>
 <20221007201140.1744961-1-ndesaulniers@google.com> <20221010074409.GA20998@lst.de>
In-Reply-To: <20221010074409.GA20998@lst.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Oct 2022 09:42:31 -0700
Message-ID: <CAKwvOdm1yMbUUHGeqnKYBptBEqSO0T4k=sUy5i0Bhy3g41+nDg@mail.gmail.com>
Subject: Re: [PATCH] fs/select: mark do_select noinline_for_stack for 32b
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Xiaoming Ni <nixiaoming@huawei.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andi Kleen <ak@linux.intel.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Eric Dumazet <edumazet@google.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 10, 2022 at 12:44 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Oct 07, 2022 at 01:11:40PM -0700, Nick Desaulniers wrote:
> > Effectively a revert of
> > commit ad312f95d41c ("fs/select: avoid clang stack usage warning")
> >
> > Various configs can still push the stack useage of core_sys_select()
> > over the CONFIG_FRAME_WARN threshold (1024B on 32b targets).
> >
> >   fs/select.c:619:5: error: stack frame size of 1048 bytes in function
> >   'core_sys_select' [-Werror,-Wframe-larger-than=]
>
> Btw, I also see a warning here with all my KASAN x86_64 gcc builds.

Thanks for the report.  That might be another interesting data point;
I haven't been able to reproduce that locally though:

$ make -j$(nproc) defconfig
$ ./scripts/config -e KASAN
$ make -j$(nproc) olddefconfig fs/select.o
$ gcc --version | head -n1
gcc (Debian 12.2.0-1) 12.2.0

I also tried enabling CONFIG_KASAN_INLINE=y but couldn't reproduce.
Mind sending me your .config that reproduces this?
-- 
Thanks,
~Nick Desaulniers
