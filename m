Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DCC2C9D
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 23:55:08 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id w188so5459714oiw.13
        for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 15:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sg4haoVhGfqcJy96RZDuqpK7b4znU/XZS/3LD4XsYVA=;
        b=I4rXHfEehYuHdlJpaeZurJZYw5gDLaE799m0bfrKRzkZmzrhNkpxhPechTauENI8sx
         V8goHj+N+YuzZU7iBnEsyJnfVNlUF7uvT8uoO67R0Uoolqaad6WDk5w27mq7JCiOFhcV
         SF44GUvT9mS7pIvXQm3IZ5PU6p6jGEFKT0V+lbbuwWssAdZ3iI38cUdXOUvIVhr8YvjO
         zHhngs5MSQdbe8FejqsIKtkPiQRnDEhw3sBtHaCqixorS0+9tI2sEL4KJDKtDUXEaDx5
         Tyids01cGJQuyeOk7aqWpoj9anotIOolDlxp591zft+bwrYP+6Ia1qUG1nf0UCcXqjYR
         NLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sg4haoVhGfqcJy96RZDuqpK7b4znU/XZS/3LD4XsYVA=;
        b=qFah5XYiZNXTYTJlUun3ZA3JvnazcGVGXwZvlFsfkGzAn9E4VH0XtBQr6xPS6tKQOI
         4/k1ORXWHNK2smh11CK05E9aPrrOrBeUkxZ5dhXlLCtpQRlkEcVbOyvBei/9VMTV6Rf8
         eSYhTUIUcikGbDEyhcJh6gN3n9v21oJ6QUGDDruTYqVc4nw/Wz4on2+VOcvnqXhi06G0
         7Qf+18yz+qNKnFhFT1+0vhxNTxyhQCx040BP/K2ji5Cun8aLbQOMoxBxcXyEEzSpajqZ
         kIrbvlTjUmU2iJowbdbAg5A0+4i+YczwZ5rBB34s3nwzhZoYP6/XAH3onv+B5ituOnjs
         WUgg==
X-Gm-Message-State: AOAM531eBHSG/JUoWlzmuOxOcR82/Jg4m6nwNBCui3zivEIZkbj3yuyd
	GGyCwBnC1VfYs3CTvLfScXF5S491Z2ZeX/A3oyLUQQ==
X-Google-Smtp-Source: ABdhPJy+r8906AoK0fKTATnHiiCVWoA19BvOjlPlJLpsbdB7zRsAFkb/Ek5aDFN2Tx7ZSZSiZpsQlTw7NGn9EQ2mKJk=
X-Received: by 2002:a54:4613:: with SMTP id p19mr1316839oip.162.1642031707215;
 Wed, 12 Jan 2022 15:55:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202201130136.7675O5xx-lkp@intel.com>
In-Reply-To: <202201130136.7675O5xx-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jan 2022 00:54:55 +0100
Message-ID: <CACRpkdb=604wtkcfY_DeSWDj1ojsPm2pZpGVrvVwMjp7=fi2sg@mail.gmail.com>
Subject: Re: arch/arm/mach-ixp4xx/common-pci.c:143:5: warning: no previous
 prototype for function 'ixp4xx_pci_write'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 12, 2022 at 6:23 PM kernel test robot <lkp@intel.com> wrote:

> FYI, the error/warning still remains.

This code is about to get deleted in the next kernel cycle.

Yours,
Linus Walleij
