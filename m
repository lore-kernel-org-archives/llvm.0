Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E442F30
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:43:06 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id h5so5183269plf.7
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 11:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fQEW/lPQ6xfHE8z4NalMYFGcFuJD2YWjzJ3BRVmyjX4=;
        b=LtDtw1Mu1QaThn5L7q9eGcDr/OkqkP4Yz2bLSdJllDcnWEeDAPFBsGkEX4JcRo+vFw
         xPnTLroTxnNJphORWThfAlhHDDi+CJ2y93lKWGEyIkyCjDNSFc+cp10LeVOV2nHPlQWI
         xlRT3LQepq3Re0yj766Rn7ODZTJi0wje6Aps8cqrUwqUaPF3RlpjiLKlAPvLvy/mSfHz
         ZqY0bHuyzw7BRysyG5lnvfO/WSITOZ2arLJ9WlP/KfsD6SRYLQ/Rvo0I/ZbDHLnD0BnW
         CpU7442ppE198PC7Lez+vyF1aOWeuXa1FmLAG1qBQocaS/VI2spsWsJGOg+RfpEV6/58
         igHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fQEW/lPQ6xfHE8z4NalMYFGcFuJD2YWjzJ3BRVmyjX4=;
        b=A3TL9z4KDq+kPFnLm8UlFBsTIYlHKsSqkjpmxMHBXjOZCf16b5MrWVmT6UARG1gnef
         2vzyOYGScR8tKnEu3r6wld4uNmwhq75ym6CN5BeuHLeLIBY9ttiWc/zuiZSqNevVVCk+
         09GhTj0UedVGu1msCCPSdICGlCRTj10M0xnFgYfcwPdwCsiUlHEQWDtsjvNYYMh3Jn9k
         UQgWVYCPt3xl7hzZkLy2DvuOQUv7C+lgpaGfSIIF0zlQdrjIeS6Akq3tPHA82OiAetSd
         vLnbFQLBzTcNXJTeWXah7MToAUgATBy83puRCmskxRUNjRMaX7D6oQCqCdtG7gBGwKKd
         FzEg==
X-Gm-Message-State: AOAM532ptx+Lr7m7jkgi1NtE3XFQsWyCul5pDS8JWlmPfjyUse0kqU1f
	883g5xyj42h1JXoTjS9L/4fFqadXIoMacNyHHxMh
X-Google-Smtp-Source: ABdhPJyj88oCapvSqhQbCjXfNFcN+y+jnlhdujAJTp+yixW38jgW1DX5+1i7Bzl0OCZ+w5lDgMBX9OBbEIYHZMvMI8o=
X-Received: by 2002:a17:902:ec89:b0:153:f480:5089 with SMTP id
 x9-20020a170902ec8900b00153f4805089mr3627171plg.166.1647542585558; Thu, 17
 Mar 2022 11:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213122.2352992-1-morbo@google.com> <9053a28a-0cc5-a35e-b613-c63689b9f8f7@infradead.org>
In-Reply-To: <9053a28a-0cc5-a35e-b613-c63689b9f8f7@infradead.org>
From: Bill Wendling <morbo@google.com>
Date: Thu, 17 Mar 2022 11:42:54 -0700
Message-ID: <CAGG=3QUmOg8KY9tkD744USFJ5Gd3He_Nzh6rz7=cUApeRvonQA@mail.gmail.com>
Subject: Re: [PATCH] nfsd: use correct format characters
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Chuck Lever <chuck.lever@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-nfs@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 16, 2022 at 11:09 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi--
>
> On 3/16/22 14:31, Bill Wendling wrote:
> > When compiling with -Wformat, clang emits the following warnings:
> >
> > fs/nfsd/flexfilelayout.c:120:27: warning: format specifies type 'unsigned
> > char' but the argument has type 'int' [-Wformat]
> >                          "%s.%hhu.%hhu", addr, port >> 8, port & 0xff);
> >                              ~~~~              ^~~~~~~~~
> >                              %d
> > fs/nfsd/flexfilelayout.c:120:38: warning: format specifies type 'unsigned
> > char' but the argument has type 'int' [-Wformat]
> >                          "%s.%hhu.%hhu", addr, port >> 8, port & 0xff);
> >                                   ~~~~                    ^~~~~~~~~~~
> >                                   %d
> >
> > The types of these arguments are unconditionally defined, so this patch
> > updates the format character to the correct ones for ints and unsigned
> > ints.
> >
> > Link: ClangBuiltLinux/linux#378
>
> Please make the Link: more complete, such as a URL/URI.
>
Done. I sent out v2 of the patch. Sorry about this oversight!

-bw

> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> >  fs/nfsd/flexfilelayout.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/nfsd/flexfilelayout.c b/fs/nfsd/flexfilelayout.c
> > index 2e2f1d5e9f62..070f90ed09b6 100644
> > --- a/fs/nfsd/flexfilelayout.c
> > +++ b/fs/nfsd/flexfilelayout.c
> > @@ -117,7 +117,7 @@ nfsd4_ff_proc_getdeviceinfo(struct super_block *sb, struct svc_rqst *rqstp,
> >
> >       da->netaddr.addr_len =
> >               snprintf(da->netaddr.addr, FF_ADDR_LEN + 1,
> > -                      "%s.%hhu.%hhu", addr, port >> 8, port & 0xff);
> > +                      "%s.%d.%d", addr, port >> 8, port & 0xff);
> >
> >       da->tightly_coupled = false;
> >
>
> thanks.
> --
> ~Randy
