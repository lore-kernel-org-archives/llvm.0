Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF3947A5C;
	Mon, 12 Feb 2024 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707765579; cv=none; b=CJ5QTqoB0rKbrauMzfnwa0EgI/2xp2vhRk+u5rmMKxQeA66Mb7jDrHTN3V8izrcvlRwRSRMHvoDO6X+hbdb2CkD6RWr7K6twRA1+m52k0WerC56dlPeWGGDlrhiFZj6bIwYyT2Ie5Jzfua0+WWA3Jmc/Q86VjV73rDL3i412Cwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707765579; c=relaxed/simple;
	bh=B55WGqfzVHw8le/HWyqKt2nh3k99aFEENxs6pJxMDRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGx4wzoOuPqwEM+aQR2/67vbORgCXp0/6CHjge7wGnBds0EjetKW25rHDrPxM5iuViR3az2GIA8S0aXca7EVFsAshAhKodyvMqtmRym/wVrlbSM6eGDDzwv5l8I5vt1G97hWtSLYdII6agenIw2PoxWpPjknEtmUzBs8xFnbJq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc75c2c3574so2418156276.0;
        Mon, 12 Feb 2024 11:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707765575; x=1708370375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6GjgFueoDqMOuDA9UzqgtUxPlfanNs+VyQkqEQBDVs=;
        b=T3i7ikd2FzpHYuyDOk2cBmM30SfVLU/65Q97VCcrJEDDcmrz4tId6WSsUvREaoJ3fe
         l2IgxQJdjfw1Qdh9YMds1lrNiJP3GpFWhdkDJe9ACGl6kUESUxzH/PMkE+mbbULAsGjJ
         cTVIHqkKL4TMqOIfdTtOQsUjpxNva/RuEENKLvqJcyky2Y972tAOsftRoCDDCCLZWxrN
         XL9xis8rXA1OueDNrHwFyNgmC/G9E2wekuFSm/y6jiYC0vzK27DqdSTyuB90CZYjzQrD
         ImDsNn360DUaUi5W+r1uh41mekj8C1BbX5+I5xPJxIMspvCSYnN0HP0yqqA8neAQWqcN
         /eTg==
X-Forwarded-Encrypted: i=1; AJvYcCWPE2Qjc/NHOIVj9Q8E6HhFuaDwXxgrOwAEMRqDRQzMBh29qDva5L6tWXa7B6eO/WEE6K1cKXSLZGjm29DGOAPnNHJmXDOGqCvnpauYccq5NT6WDED2Tc/5HkH7bDgfuobF
X-Gm-Message-State: AOJu0YztIkaEYy+ak1/D03pKYJNCAVn3JVp/h7QGqJp0D220KPV89pi3
	Y3In9tT/evNbRX6MloT7fe2CLb8lk7yTnKFq3wTqgV6ihX7yz8QpNn1CP44iYKI=
X-Google-Smtp-Source: AGHT+IH9ikT8TdMdvIKpzREUCNUK0oBxfFuComR8ZUQxMfDTo/Avvs/3HGSvhUr2f6/4PGWQaC0W7A==
X-Received: by 2002:a05:6902:220e:b0:dcb:aa26:50f9 with SMTP id dm14-20020a056902220e00b00dcbaa2650f9mr1693954ybb.46.1707765574959;
        Mon, 12 Feb 2024 11:19:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWacl/3SJy27ydNHBgi5ao3WmC7Lbu3OBM5mFeOC3WvK8PHqyy1y9VQybuIuAM6AzIPcyfDYCCeP39WtMUI3BjosLXWOfyAO4q45ez6hv9fgZmmKmjjq5JmqTyzBy09gtX4
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id b3-20020a5b0b43000000b00dc7472a9f7csm1283594ybr.56.2024.02.12.11.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 11:19:34 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso3465139276.1;
        Mon, 12 Feb 2024 11:19:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrr+3CaUFFX9vyHkPawtCEiYYwSAGNRJuXhiPgBtuZ+socL8r4pqVcL9G1RclmHd+NAPrAOX7o6B5/xpvwlI54+NVAJovxXwr+BTCc57d44VOVh8CVfi5gXJhND1q2sdhu
X-Received: by 2002:a25:bc8a:0:b0:dc2:5674:b408 with SMTP id
 e10-20020a25bc8a000000b00dc25674b408mr5941166ybk.57.1707765574018; Mon, 12
 Feb 2024 11:19:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuRwO6FLZ4do1wR0RdiZh9NGpRLKckQcKN2aAkqBH7k0g@mail.gmail.com>
In-Reply-To: <CA+G9fYuRwO6FLZ4do1wR0RdiZh9NGpRLKckQcKN2aAkqBH7k0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2024 20:19:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUpqSeJ4XpEzrOwVsUs9DgaTkApQmmAHCr8YkfyjbhwDw@mail.gmail.com>
Message-ID: <CAMuHMdUpqSeJ4XpEzrOwVsUs9DgaTkApQmmAHCr8YkfyjbhwDw@mail.gmail.com>
Subject: Re: Powerpc: ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	clang-built-linux <llvm@lists.linux.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Javier Martinez Canillas <javierm@redhat.com>, Geoff Levand <geoff@infradead.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 7:36=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
> I encountered the following build warnings/errors while compiling the pow=
erpc
> kernel on Linux next-20240208 .. next-20240212 tag with clang toolchain.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> powerpc64le-linux-gnu-ld: drivers/ps3/ps3av.o: in function `ps3av_probe':
> ps3av.c:(.text+0x19e8): undefined reference to `video_get_options'
> make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:37: vmlinux] Error 1
> make[3]: Target '__default' not remade because of errors.
>
> Links:
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2cFkli5H02fikrp=
ga6PluAWLAMa/

https://lore.kernel.org/linuxppc-dev/43ed64aa-17b0-4d04-a1f3-a6e13f59a743@s=
use.de/T/#ma2e81d77ee4a708c75d09c4e46904072b3f7b70f

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
