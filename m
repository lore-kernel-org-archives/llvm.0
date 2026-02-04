Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8C38F23F
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770191634; cv=none; b=Y764XBkJXBEt01VaF2d6lI6nhD8DhHvYqjLIJxUBGaUB5nXbe+Vezr2IeFjRCNaq6s3b1AR5KSShrDjHfwlG6fEsMqTguMW61tJl/Sr+itKUBAueI1OBRh1QnVdsi4duOjFH7oUPltWk0QTqvAQ+t/AF2IPIrPCpvWq3Wc+6LM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770191634; c=relaxed/simple;
	bh=7cZ6HiSRjuEKB5bZIASAJ3Z8DQJZXLetTR4Cvay0McY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7owcfw2ZHyuXa290GGshHBzdTPtXAzNH/V6vPwrf13fKyFJu9siWdgl7vqbONCNqMxnLlsWtZHfUcwVnEbFtEp99MIkcOsFnLOxFlVBVP1qDREIZZtuVpTg2nnWy5JGA+mZfkAPPTd+M+M5lx7XpD36s9bzvS1f44CyyJhC8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56646a34c18so2472708e0c.0
        for <llvm@lists.linux.dev>; Tue, 03 Feb 2026 23:53:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770191633; x=1770796433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUrzN4N8aYs+z308MZb4l8llcH3n7fe5n2tW6I3BKIA=;
        b=GHb1QYtU79D8BE34Zh9xaUtwFYBDEeuhdQ++XLk1UxgqP/It+l3TZe3jq032P11jH8
         +CxJ7AVnzRXu5w8iI+6FD1QSHcfyb6hIciK6J+nnActsxNr1N3k9AUzHs/cankGwtsID
         vk/Ob10k4UY07F4CiQCc/Cj3XJvftAMV3yclIEAwPM60nOcMhN7IFtMekCirfxrjVoFk
         wMnyhyviq5PHCX6/3mNcgZ6s/8neOr0z/Lz2Anf5VQsQZCRrE+xc0hgLpIuHATY9vu5d
         ERwt3zR7FxJYqy6wimhlDFQjtvK1c8vXozo2sejAc0wBWkVVslfSDDsDFFdnhEIamG6Y
         EvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZHFeFeU09LQrE2rf+/58+aLPD3aFbssUbLd2Yp2XvKOpR6IXYh1y/pyeY76snwgglYgfZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzMoUm6TdZHJe+YVqLEa+qMLwv6viQ8gXdnhx2ir61RWXrbdhaf
	9UHghc4tQ5L0xeiWnu2wBnXGdBrrvnVuTC4zhaylGsLwtPKjA6Op594NiVhtGpHFBG8=
X-Gm-Gg: AZuq6aJhLLjA+lZaLLs+qto4rlj8P6nL6At5bb8Rwl/0XRn1EZpGQrx1Xmx7IU4OfLl
	ADGmKJ9m7wT8aIGQv3SCrUd0pWtR9ygYtQtQX5kZi1HJPo//LCzUr700WCF6lsYwdOw9I9FxdJy
	ipQ4O5Vu5pcXTGZBPW5pwBqHinGBAO5xkusG3ptM/87EOg6UJ98rCfLsHUKU5A/LSVBvh+MZadT
	Sq/m6HDMlEwmquDTx67VWZLzco7ymIp88CKgGTn9rPOS0np3N52wqj/lCwyDJJjL55P6md/9FMD
	lywDkanSXtZ49fe0jd4W6seXvQzyY2r8w++kP/bdYUTF88lVR1OzJ0EjuuIufZiXaldbn1zceA/
	mtlxbThLbpHeLAl2YjTXme8Cv1Sji9rNywLLyfjGtZwfP3h4dYHSciuvUB2sA4r1F9/KYY6mI9Z
	pltkAvBKESvRoe+Rm4LHEorwl7jyuF0xm4A1xs2bjeEyQd0pSKpUE1tPVLVuoPWoY=
X-Received: by 2002:a05:6122:c8a:b0:566:26ce:546b with SMTP id 71dfb90a1353d-566e80b5991mr659528e0c.11.1770191632831;
        Tue, 03 Feb 2026 23:53:52 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-566e81d80e1sm905028e0c.13.2026.02.03.23.53.50
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 23:53:51 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56646a34c18so2472687e0c.0
        for <llvm@lists.linux.dev>; Tue, 03 Feb 2026 23:53:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTXzOcbeE326hcCSfqfrXnEazzMnQUHaojhuAES9nt55tq787PvUdH6WHDvlS0s72IL5CW@lists.linux.dev
X-Received: by 2002:a05:6122:6595:b0:55b:305b:4e2e with SMTP id
 71dfb90a1353d-566e8153055mr741014e0c.21.1770191630187; Tue, 03 Feb 2026
 23:53:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204010415.2149607-1-andriy.shevchenko@linux.intel.com> <aYKcNds-XsVLRjcC@smile.fi.intel.com>
In-Reply-To: <aYKcNds-XsVLRjcC@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Feb 2026 08:53:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZx=2-y_OSjCkxmXo-3YjGjU0aH89puTcL0rmvw7E-Eg@mail.gmail.com>
X-Gm-Features: AZwV_QjQQaNbz3sSm5Ca5G7xDhKtEIlhGsB9AygKTcUaIrP4KhihNxn7cOIyG98
Message-ID: <CAMuHMdWZx=2-y_OSjCkxmXo-3YjGjU0aH89puTcL0rmvw7E-Eg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] sunrpc: Fix compilation error (`make W=1`) when
 dprintk() is no-op
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Wed, 4 Feb 2026 at 02:11, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Feb 04, 2026 at 02:04:15AM +0100, Andy Shevchenko wrote:
> > Clang compiler is not happy about set but unused variables:
> >
> > .../flexfilelayout/flexfilelayoutdev.c:56:9: error: variable 'ret' set but not used [-Werror,-Wunused-but-set-variable]
> > .../flexfilelayout/flexfilelayout.c:1505:6: error: variable 'err' set but not used [-Werror,-Wunused-but-set-variable]
> > .../nfs4proc.c:9244:12: error: variable 'ptr' set but not used [-Werror,-Wunused-but-set-variable]
> >
> > Fix these by forwarding parameters of dprintk() to no_printk().
> > The positive side-effect is a format-string checker enabled even for the cases
> > when dprintk() is no-op.
>
> Note, the alternative fix is to add __maybe_unused all over the place.
> With pros and cons I consider my approach better.

Definitely.  I tried something similar a few years ago[1], but ran into build
errors from the robots, and gave up due to lack of time.

So for the principle:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ah, my local tree still has the following fix I never sent out, and still
looks suboptimal:

--- a/fs/nfsd/nfsfh.c
+++ b/fs/nfsd/nfsfh.c
@@ -105,9 +105,11 @@ static __be32 nfsd_setuser_and_check_port(struct
svc_rqst *rqstp,
 {
        /* Check if the request originated from a secure port. */
        if (rqstp && !nfsd_originating_port_ok(rqstp, cred, exp)) {
-               RPC_IFDEBUG(char buf[RPC_MAX_ADDRBUFLEN]);
+#ifdef CONFIG_SUNRPC_DEBUG
+               char buf[RPC_MAX_ADDRBUFLEN];
                dprintk("nfsd: request from insecure port %s!\n",
                        svc_print_addr(rqstp, buf, sizeof(buf)));
+#endif
                return nfserr_perm;
        }

[1]  https://lore.kernel.org/a93de2e8afa826745746b00fc5f64e513df5d52f.1697104757.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
