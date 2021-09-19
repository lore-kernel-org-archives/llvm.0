Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D4B3FC3
	for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 22:28:12 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id t10so52904967lfd.8
        for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 15:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=87U5jnBgAOzelfnajLutsoz1FTU192r3A1UDUcwhN3Q=;
        b=apm0564NHpe0Ij3lCmA/KCORSOLh9QyVZMLHRPO0Sbup7u2dBpAbk7QsK3AeucHqp7
         KGuZkJie2n74JJsQlL+mEGi6Sf6TXQEEPbD3Askdz5c/Rcu4nK8MGVKsznAVoNHfgx46
         rYQh9LFEx7oTAghRL7MJYcG0Y3a9nsS77+5i8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=87U5jnBgAOzelfnajLutsoz1FTU192r3A1UDUcwhN3Q=;
        b=roL/W37DqLsbKCqGcY4Db8W9EPCBD2ehjA8AW/TUaKuz3TB07oyx6ZSmKs89lHrja3
         ssCmn0d/dG3QS8LpuRFE7q32DUGgRSaYmH/a+ssxiX1Jg9yP9Y49cGuDlcuQu8KPw7r+
         kL0iQXJmAKac9px5WWbwacpoVy6fzqOl6onhKi8e3e39RqNJVUtPsrY0JsMwic1I1Fgk
         dr2IF0zpAJ5MxczJ7iL0itRG7PFVOz/cATn+j5Cac84Hde884jR+q7EB7aJH9Gjl7LRF
         tmxEtW4YGtwAfj+3x8J0hu8nmwief1iiI2+Af1PxXNDJmwHAkCD54LISXxJDi6xYfhca
         uM8w==
X-Gm-Message-State: AOAM530evYX6rtK1xSiW2PnsyhT4P6CSVntlZXAHic9m2LiyM6DpbJxK
	rMcwPsNNktxbt5gA6CF0D4nprowHO0sk2bpV
X-Google-Smtp-Source: ABdhPJx+6tlrhjtrb41YCXb0Am/VOVMOEbVBq5f3zDJsm5UwjUc201K48sRk5xinNmWCIRwSAXY0Zw==
X-Received: by 2002:a05:6512:3f13:: with SMTP id y19mr15965449lfa.211.1632090490741;
        Sun, 19 Sep 2021 15:28:10 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id f15sm1517708ljn.120.2021.09.19.15.28.08
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Sep 2021 15:28:08 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id i25so59635941lfg.6
        for <llvm@lists.linux.dev>; Sun, 19 Sep 2021 15:28:08 -0700 (PDT)
X-Received: by 2002:a05:6512:114c:: with SMTP id m12mr17169838lfg.150.1632090487855;
 Sun, 19 Sep 2021 15:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wjRrh98pZoQ+AzfWmsTZacWxTJKXZ9eKU2X_0+jM=O8nw@mail.gmail.com>
 <YUdti08rLzfDZy8S@ls3530> <CAHk-=wgKc5TY-LiAjog5VKNUQ84CSZyPu+FQekMHDar=kdSW=Q@mail.gmail.com>
 <YUeriU9EIJ5hiFjL@archlinux-ax161>
In-Reply-To: <YUeriU9EIJ5hiFjL@archlinux-ax161>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 19 Sep 2021 15:27:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNfaf03Dw78q1qLLZs6G=iJjfo5ZTcnyXgSk3w1tp0yg@mail.gmail.com>
Message-ID: <CAHk-=wgNfaf03Dw78q1qLLZs6G=iJjfo5ZTcnyXgSk3w1tp0yg@mail.gmail.com>
Subject: Re: Odd pci_iounmap() declaration rules..
To: Nathan Chancellor <nathan@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>, 
	Ulrich Teichert <krypton@ulrich-teichert.org>, linux-arch <linux-arch@vger.kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 19, 2021 at 2:28 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Commit 9caea0007601 ("parisc: Declare pci_iounmap() parisc version only
> when CONFIG_PCI enabled") causes the following build error on arm64 with
> Fedora's config, which CKI initially reported:

Ok, so I spent a lot of time trying to figure out what the heck is going on.

And while this is really *REALLY* confusing code, and nobody should
use it, I think the fix is this oneliner:

  diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
  index e93375c710b9..692e964e56b4 100644
  --- a/include/asm-generic/io.h
  +++ b/include/asm-generic/io.h
  @@ -1047,7 +1047,7 @@ extern void ioport_unmap(void __iomem *p);
   #endif /* CONFIG_GENERIC_IOMAP */
   #endif /* CONFIG_HAS_IOPORT_MAP */

  -#ifndef CONFIG_GENERIC_IOMAP
  +#ifndef CONFIG_GENERIC_PCI_IOMAP
   struct pci_dev;
   extern void __iomem *pci_iomap(struct pci_dev *dev, int bar,
unsigned long max);

let me go test, I do have an arm64 build environment for this all, but
for that commit I had only done parisc, alpha and x86-64.

           Linus
