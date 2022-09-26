Received: from condef-07.nifty.com (condef-07.nifty.com [202.248.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EC863A;
	Mon, 26 Sep 2022 09:03:16 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-07.nifty.com with ESMTP id 28Q8vT7j007487;
	Mon, 26 Sep 2022 17:57:29 +0900
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 28Q8vH89029116;
	Mon, 26 Sep 2022 17:57:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 28Q8vH89029116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1664182637;
	bh=vlkbVUYC6luO+m9Ikti3NG43M3VtHm2puQBFVEFsQrY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KY7QXY1dq9zl60QZkjgo2j9B17vAiVIW7LuJ9oTkHb2YImiFCF3pUsOaFC5NNc0YU
	 rIBfQqtacpcxFCU2AihjOyIpNClPgY0ixCMdL4JV1r2gIc18T/zxhdckbLfZwFZmVD
	 dPNpZ/rRZLu4oMo1/oxJxo0yeOqowKjAJZpvrTizOex74idCZZpEYrHOxl6j/2x2dU
	 iiieZbX50Ca58ivODWDy8rU9iRsHXb4OzJX7QSkZTEaGTq5RUdFxe/9o2d6O0a1zyz
	 QP9yMVerbJWlQfT60eRsCf65o4wcc43oXSeFQ+tLGVdRFJJ69OQaZool3qV+t08Yuk
	 Uj7klbYVvXR6g==
X-Nifty-SrcIP: [209.85.167.172]
Received: by mail-oi1-f172.google.com with SMTP id j188so7527663oih.0;
        Mon, 26 Sep 2022 01:57:17 -0700 (PDT)
X-Gm-Message-State: ACrzQf2t62ei4AORRcvxtKN93oLi/RVdonwk5MiGYo2eLLhBX0zD3hsE
	lGy75Xl7vhgk5L8JuNLWLDnDBByfzFaI4uHXfgQ=
X-Google-Smtp-Source: AMsMyM5lTuCqBocFYoR82VLsqcYSHYEXb4vwAWkRiOaytmxxtyxns+2TLiPuEomBdT8w0SIPiBJSgUYqG6rIWeplWQ0=
X-Received: by 2002:a54:400c:0:b0:34f:9913:262 with SMTP id
 x12-20020a54400c000000b0034f99130262mr9358774oie.287.1664182636355; Mon, 26
 Sep 2022 01:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAH7mPvj64Scp6_Nbaj8KOfkoV5f7_N5L=Tv5Z9zGyn5SS+gsUw@mail.gmail.com>
In-Reply-To: <CAH7mPvj64Scp6_Nbaj8KOfkoV5f7_N5L=Tv5Z9zGyn5SS+gsUw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 26 Sep 2022 17:56:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_vgMXAVdmSBV=nrXL5Covd2tMX0weXtst3WoL_JGwsw@mail.gmail.com>
Message-ID: <CAK7LNAS_vgMXAVdmSBV=nrXL5Covd2tMX0weXtst3WoL_JGwsw@mail.gmail.com>
Subject: Re: Any interest in building the Linux kernel from a MacOS host?
To: Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
        "marcan@marcan.st" <marcan@marcan.st>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <llvm@lists.linux.dev>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        asahi@lists.linux.dev,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 4:51 PM Nick Desaulniers
<nick.desaulniers@gmail.com> wrote:
>
> Not sure if this is potentially interesting to anyone but I was able
> to get the kernel building from MacOS my M2 Air with a small amount of
> effort (read: duct tape and bailing wire).  If this might seem helpful
> to anyone's workflow, I wouldn't mind pursuing this (with some
> cleanup, sending a more formal patch set).  Maybe this helps us
> bootstrap or get Linux up and running sooner on these machines?
>
> Take a look at the commit message linked below for the trials & tribulati=
ons:
> https://github.com/ClangBuiltLinux/linux/commit/f06333e29addbc3d714adb340=
355f471c1dfe95a
>
> Thanks,
> ~Nick Desaulniers



I see some efforts in this direction, for example,


commit dd2a3acaecd7abb2d43b09a823cf2e4c967fa2ac
Author: Andreas Bie=C3=9Fmann <andreas@biessmann.de>
Date:   Fri Feb 24 08:23:53 2012 +0100

    mod/file2alias: make modpost compile on darwin again



I do not mind a small amount of code addition.
It may be broken from time to time because there are less number of
developers testing kernel builds on macOS.


--=20
Best Regards
Masahiro Yamada
