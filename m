Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77E57C
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 12:29:01 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gh9so15762880ejc.8
        for <llvm@lists.linux.dev>; Thu, 08 Sep 2022 05:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7dRk9pBI5B1q8gO6htnwPNQ2BvS29UtsmknF76ufuHk=;
        b=oj2PGjnjL6Y6SmZ+t3p5xlfW1YV5IKc9PErJZ4yhVAR10QX2F4rkEnF3Clo/VX1f3V
         nJq1nD/qFAgadREhfuQVPR4iv+UBGj1sc2mdGpzBVb5G/SYQjYux9XcB/w6aqe6WDCE0
         xjmHG8i+0STNGRwTFgJLBbSgckZEjeNyEbX3t5Tb7LkXVwMd0eP3132fvI0OiKGG3tAs
         dHObQiiCpw805VACm6gVbw/6XAuUVWm+WLs2hDvZ1A6iZ/Y9z0ZIwV74F3VblU9mnRsE
         wzzmPD/8vKdV9lpL9iJpnh/rz7u/zKUG+hIZ2+nJ4ZemhG2NGuq3jhvn3P2BEP3CWLf6
         qRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7dRk9pBI5B1q8gO6htnwPNQ2BvS29UtsmknF76ufuHk=;
        b=w3fGXOH6xWkDUpzt1TFSa32GEoDr/OZUb8S8yZGi3lzOO0MZ7ua/PvrkZqKveCzyRG
         x7UzJ89m37HOWJ7nYIG4MDX5ws/UljBeHVn08Kz9dznZfkNxAmnE6L9Q6opj2AbXO+sq
         ImDAFzEpLbrbUM0fFdz6mwmIrlfdlwqc1g4XJ23TjOahJFPp4KWARXA3+h9Qg0dG7sdc
         zsW6hn0FksoEfwIU570EZEqVf1kS+sAXDQHFrHLOHsF9iKuZiYa/4TCo99iTTnl8GZaY
         MWsPSyPwwU+u6EldT53i6IuWCPeXr2paW4jRUALU2tXPCPiclmFOZ6kOLJDY7Qn6FgjD
         Uo4g==
X-Gm-Message-State: ACgBeo0r9tljxOH+SKAy4CM38EgNFH3N4Js57+qUVrIsWoA8Co8ayy9J
	kQ3HqUVhYoJeouhcZLg5JTgxoJpS6wnQRrHEYkIwkg==
X-Google-Smtp-Source: AA6agR6vmvEZ6v3jZYLmrq3taOiHh0yfRJ13CbqEW2VDYbIMndg4hnOCQLUKfP2tMIk6h/uHhV0N9c8VLUuNV3sZo50=
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr5983110ejc.208.1662640140026; Thu, 08
 Sep 2022 05:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209032354.b0SHaeQe-lkp@intel.com> <YxdcIGcQ+fB9G2qN@dev-arch.thelio-3990X>
In-Reply-To: <YxdcIGcQ+fB9G2qN@dev-arch.thelio-3990X>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Sep 2022 14:28:49 +0200
Message-ID: <CACRpkdZ29j9rzv5XkKvSKw-o4nzL7oAPdhhpfbOBTqPiSC9KUg@mail.gmail.com>
Subject: Re: [arm-integrator:virt-to-pfn-v6.0-rc1 21/24] ld.lld: error:
 arch/powerpc/kernel/vdso/vdso32.lds:244: unknown directive: static
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 6, 2022 at 4:41 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> + Linus
>
> This shouldn't be clang/ld.lld specific

Hmmmm dunno if it is related to the compiler, I have fixed up the patches
I am working on in this branch and pushed it again. Maybe I fixed something
about the powerpc, don't remember.

I am essentially using the build robot as compile farm, I don't have the
resources or time to keep all crosscompilers around neither machinery
to do all these compiles...

Yours,
Linus Walleij
