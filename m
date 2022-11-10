Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A753382
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 19:01:15 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id h193so2530493pgc.10
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ4iusZn3r+L1hT830DTYjpIyjYe1oSN3vop8euZ9js=;
        b=dX+k1YnOeAISPqobM+n+g0B46aJ5fAG0J2icXb75RVgG7m4M4JAPreDmVp9TF/QWCx
         SIYxqYixGj5DCJ6xRMUmqee0H6CdlOFz6QrWkpC8hOaHc43jy0B+bY2R7jhmFP6IOUjQ
         ZBCWl4wpzdiWXhB5fM0kK+rNoQ+eN33Dr39xn2rBc+htjyWsMzNQsbm4wgHWFhPbAp9v
         kjNlUwAYLJ5lAupS13Ed36qmjFUCvJki24AMPeH8mwZk+ryLrqd+XSY53Gjpge338tAM
         focXQhiB6s1N7m5+FGGICce46iDvv5MvpJfmOwJmmMcNN8wX2F0frI8KoPt4xc8vsFOS
         do/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQ4iusZn3r+L1hT830DTYjpIyjYe1oSN3vop8euZ9js=;
        b=sye1pymEhfU1lzlmoTiwd35Hkxgb/K+WgHusGcFpBi5o8W0TROC1TlRgAYWZ4WvegP
         2VzJXutvLKHp6BgYMnZBsu2k1vOWkgCuyBazY2xjXhFo4MBnGFpc0FnwIql5rK62BbQv
         rR6zsjNydVeq42dEPbPq2lxv2YYk5+4Zy8w0eby5cDNwcPBcy05/qPsJyCj71s7KZY3z
         6JoAT8a6+NiMYgh9HWqV6/5vUrMbDqI5OjKTR5qXbo3RGjzeOhkRxgGcXeYCQQDcTZ6v
         QNldfkxDBce/vhioKZHnt5Rctg+glOG+I+PYTC4GRfGA7plajeb5wdX0zlgx4H/xQ7WC
         2P5A==
X-Gm-Message-State: ACrzQf3KPMGq8TbqDG8/K6Tjx429BeJTEseCpvM5i4wQsBVNEzwUyTc3
	oowCo4n4A8G6UEbwI2eZwSwQhvn81UkOOlaJLEhHxw==
X-Google-Smtp-Source: AMsMyM6cMvQ+CdiTjFykH6PT7aBlUZq2UXynv4j2dxgS4TWMNFM/mgc0MVvi+yNwuV9l3w/SgxLXb/1R37Erlf0LIZw=
X-Received: by 2002:a63:586:0:b0:46f:75bb:cfc4 with SMTP id
 128-20020a630586000000b0046f75bbcfc4mr3099016pgf.403.1668106874281; Thu, 10
 Nov 2022 11:01:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr> <20221106095106.849154-3-mailhol.vincent@wanadoo.fr>
In-Reply-To: <20221106095106.849154-3-mailhol.vincent@wanadoo.fr>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Nov 2022 11:01:02 -0800
Message-ID: <CAKwvOdmN2==9tG0fxRO8K-eAJudeemaKUuhJEAuGHc=P8GpGwA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] x86/asm/bitops: Use __builtin_clz*() to evaluate
 constant expressions
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	Yury Norov <yury.norov@gmail.com>, llvm@lists.linux.dev, Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 6, 2022 at 1:51 AM Vincent Mailhol
<mailhol.vincent@wanadoo.fr> wrote:
>
>  #ifdef CONFIG_X86_64
> -static __always_inline int fls64(__u64 x)
> +static __always_inline int constant_fls64(u64 x)
> +{
> +       BUILD_BUG_ON(sizeof(unsigned long long) != sizeof(x));

Thanks for the patches! They LGTM; but why do we need this BUILD_BUG_ON here?

> +
> +       if (!x)
> +               return 0;
> +
> +       return BITS_PER_TYPE(x) - __builtin_clzll(x);
> +}

-- 
Thanks,
~Nick Desaulniers
