Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB86B7F
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 07:47:23 +0000 (UTC)
Received: from mail-yb1-f178.google.com ([209.85.219.178]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MxDgs-1o5AYL2wSu-00xcVC for <llvm@lists.linux.dev>; Mon, 02 May 2022
 09:47:21 +0200
Received: by mail-yb1-f178.google.com with SMTP id y76so24744436ybe.1
        for <llvm@lists.linux.dev>; Mon, 02 May 2022 00:47:21 -0700 (PDT)
X-Gm-Message-State: AOAM533EN+1BnSpra9Y9y+z3arSGaSYYt+66OS6Ct3bcnqQIrsJQy7eK
	NvnPT7XLQkdutrR60uV28ILUnp9XWvSsEmJMATE=
X-Google-Smtp-Source: ABdhPJzvzGqI6bWE4UdkwqeqxrL9PZ/nfcQMZR/8k8x9UyNwFVHgiYK0IglV6QwDImx9Of0P5VsaeW+hhatlkLlD9uI=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr9450273ybx.472.1651477640521; Mon, 02
 May 2022 00:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202205020811.kEEGO8QC-lkp@intel.com> <CAK8P3a2Cq5oa8e7SAQ-mOGnytEjnOa4esr1gsfsS3ceH+A2f2g@mail.gmail.com>
 <5291f623-6f0d-4cc0-8358-6aea4e8aa667@www.fastmail.com>
In-Reply-To: <5291f623-6f0d-4cc0-8358-6aea4e8aa667@www.fastmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 2 May 2022 09:47:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2UL+g5_ugNYh+eUEBtOpg88qWrKnY_qzNO2WY8A1HfEg@mail.gmail.com>
Message-ID: <CAK8P3a2UL+g5_ugNYh+eUEBtOpg88qWrKnY_qzNO2WY8A1HfEg@mail.gmail.com>
Subject: Re: [asahilinux:asahi-soc/rtkit-sart-nvme 4/6] drivers/soc/apple/sart.c:284:4:
 warning: format specifies type 'unsigned long long' but the argument has type
 'phys_addr_t' (aka 'unsigned int')
To: Sven Peter <sven@svenpeter.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, 
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:omJNp5HaHUj5qRnbEsEUUVK+LyxEq8UQJPZiuC8abb/rADSpl+u
 tAodQ0iBzuhkEz3+f6nGWhtsV3xgtmpZHmkQyq+853Q1rrwPn+OL+IxKGCXN1UK7sm7tQNG
 iCKGLeAA8o+U3ostWkMfXgieictTFZnQV7mALyrbeakr6lHzUajrmF88LSB3Kq9bDmGipVv
 efUp+LRaEvmepr6P+vg/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fQ5fbYtzqos=:fJ3aoByW7dOWSMBb/68tqJ
 A5sNfdeJ5bfqQGzLb9fj5UHSAv/NFVUbmosam7HosqVIvWawxHfbOeCIOIupES8TPSEpqVSgr
 Sv+XsydGix9PcAVdb3zCzZ8lynRSk0T3THprMZe2iuyq2qTy5WjJzwPHNqNN3vHfKfL3QaCGO
 XgvYIXsCr4gihlt3Sm4t/+KR33gQgPgcfG1XuzxKqsJT5dLMEYI95crzrg7IHBmlTyOJ0lWQN
 GD/o4oZ2Ojy1eMw8ZGlN0H7W01/eInES4ieGv5wAo/woJ3mRevzv+MIkxId5jy1JqWL24AugB
 uMREzSt0ppruP2uj+agSduB1nFCZqaJysIp3U6jyLEOoJS1h34yat//hv8HOj4HilBUyroQsr
 QyC0jZ8VbGjoQ8Y1EfNtQiBtnOXyL4kpUfXeZqcyGT4/P2E9Aj5pM/otoFDP5Z2rEkgXD4RMI
 mCFyjPpWrYVPdaa9C+sogGfmfAGdXorRWVuwe36JSsNyAYAw7zHncrQ95dAmfiXMW6HGxT+FZ
 0URX8G4elydgWJNIFFtfMOUUSlJpdyjHWeCg/3UfaE1j1DsDFncsUV4DejwGQpuw9fbO85rXM
 k51RVyhK5X4nwzxh25lgQmg2ATW91Lx6MSAkWcYgFFIzqNgcOHtLrl5iDazOspTV2WcS6Vjn8
 RD+6Ur/lnmO528Il6N86OYFvXi3FY4rf7OL8AsCWOY72vNdoWHWPzxFgkGyElEfJFlAI=

On Mon, May 2, 2022 at 9:34 AM Sven Peter <sven@svenpeter.dev> wrote:
> On Mon, May 2, 2022, at 08:39, Arnd Bergmann wrote:
> >
> > to print a phys_addr_t, you should pass the address by reference and use
> > the special "%pap" format string modifier. I'm not entirely sure if it should
> > actually be a dma_addr_t instead of a phys_addr_t. If the type gets changed,
> > the format string would become "%pad".
>
> I've been using %pa for all other prints in this file since v1 and just
> missed this one for some reason. I'm a bit confused why the bots found this last
> one only now but I'll fix it as well.

You only get a warning for 32-bit builds using 64-bit phys_addr_t,
which is fairly
rare, so you can't predict whether the bots will actually run into this.

       Arnd
