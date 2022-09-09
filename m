Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B48612F
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 21:59:53 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 289LxaBF009979
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 06:59:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 289LxaBF009979
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1662760777;
	bh=qJ2xNANFGAA/u/uDw9DaUYVB6Q16K2/fBd9dXrsPcNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r4EwVh2luXtYErjnUICPEoNsg1wkLrw1g7D9ahitEB0HkdC/jYOr3+TjNI/Ck9Zmy
	 l4/VTbJ5zagGGkj7Bu9U6HyZsXsPkrPwZSa9rjU6XE6zyuJiMeVebXObkd7eSPqvRE
	 LVm1cmZceJu3R9Q3ZVj/8IAJWRqbIjrFxCOT50AsRSQ503g3MWI+OyHHoy5Ht0Dk7E
	 iAZISxeMbOq4nQc5H46znlWHTQiL046MscL9UnV9b0XNNuVVcXyd0IdzLz3CS8GDzl
	 bHpM3dTQDwSuUbK5e85Hp+xZE8urta3P6XaXYCb9jU1eIToOAuH8kdilegGPFazJNV
	 XqAIol6DApwYQ==
X-Nifty-SrcIP: [209.85.161.46]
Received: by mail-oo1-f46.google.com with SMTP id u5-20020a4a5705000000b0044b34c2c89cso480688ooa.9
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 14:59:37 -0700 (PDT)
X-Gm-Message-State: ACgBeo1M2d1LPl32VkU62JKkNjQb8X53SpKR5FGmBi7z2syFfMGO/byY
	tKxSLco1h06SWJcBa4jnmbxMLVs6G009h41OCAA=
X-Google-Smtp-Source: AA6agR72P3R97llgZiBPvMKMBd85181rfh9FbVRqi/ZZxrmTbOjBMXr/bhgI9jBCYkdfKfxC2nnzR7CajL6bHAWUM1A=
X-Received: by 2002:a4a:9789:0:b0:451:437b:cc58 with SMTP id
 w9-20020a4a9789000000b00451437bcc58mr5606771ooi.96.1662760776232; Fri, 09 Sep
 2022 14:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907045907.484043-1-ndesaulniers@google.com> <20220907045907.484043-4-ndesaulniers@google.com>
In-Reply-To: <20220907045907.484043-4-ndesaulniers@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 10 Sep 2022 06:59:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNARe+iZBB9OkkpOTGxi+GwTnk8pigjd3KYHR-ZGoyiZEAw@mail.gmail.com>
Message-ID: <CAK7LNARe+iZBB9OkkpOTGxi+GwTnk8pigjd3KYHR-ZGoyiZEAw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>, X86 ML <x86@kernel.org>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 7, 2022 at 1:59 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> cc-ifversion is GCC specific. Replace it with compiler specific
> variants. Update the users of cc-ifversion to use these new macros.



Now, this is independent of the rest of this series.



Can you rebase this on top of Linus' tree
so that you use clean up
b0839b281c427e844143dba3893e25c83cdd6c17

Otherwise, clang-min-version will not get any users.









--
Best Regards
Masahiro Yamada
