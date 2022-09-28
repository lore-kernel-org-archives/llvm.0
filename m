Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B47D5381
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 21:04:58 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 28SL4kkE014592
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 06:04:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 28SL4kkE014592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1664399087;
	bh=la5EsbEMHmA/CJNM5Muo6C+Tq1IqrhfhIXVR576yhI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=0xjS+HokgTAU6kykjqgYtjKz0jxmy+3LdP3cMcJHu+q+1xOZwXi+MWzZveVqtgSij
	 37LB4ehOlUx3A9cQPJ7H2KDVud99BZ0BCghRGLbnwilqqLQFFxmFcapYxRK/NwxC/D
	 xtJBFDynJ8HdevSGWcyrCs9eo+iiZDDL43zNnK840H0UIiuL4VFpRJ52VTIUnDKtWD
	 B27y23S3cpsA2z70Jp4nlt4RiXmQS+vkRFE0jGpcbpZCrv0viN3dC22u1YYtsAr1vd
	 F501/9Fz3tzRmswzZMJ/8O72yVFrKuXmb+wBepX2BUHL9IuQh3nvFrIApqI3e9XMkd
	 CmSw1BoBrGkBg==
X-Nifty-SrcIP: [209.85.160.44]
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-131b21245f1so2789631fac.0
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 14:04:47 -0700 (PDT)
X-Gm-Message-State: ACrzQf1ATSamxESYqTHjdtYGt8OPId2DBsQeCvP0ICHgeQhSkkKrw8In
	FU2v1f6C2kWGiKrqj50WsykIAYstmhbGZyNuX14=
X-Google-Smtp-Source: AMsMyM6zUXjs63osdv/4PtoIRZPm5pM0/2GbAXZtQFtkOYhlyrTLkXOA/MyaUldtI41YO3Iyzt+XIGVub+g3qLnneww=
X-Received: by 2002:a05:6870:6326:b0:131:9200:c99d with SMTP id
 s38-20020a056870632600b001319200c99dmr4953220oao.194.1664399086115; Wed, 28
 Sep 2022 14:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220928063947.299333-1-masahiroy@kernel.org>
In-Reply-To: <20220928063947.299333-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 29 Sep 2022 06:04:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNATcD6k+R66YFVg_mhe7-FGNc0nYaTPuORCcd34Qw3ra2g@mail.gmail.com>
Message-ID: <CAK7LNATcD6k+R66YFVg_mhe7-FGNc0nYaTPuORCcd34Qw3ra2g@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Unify <linux/export.h> and <asm/export.h>, remove
 EXPORT_DATA_SYMBOL(), faster TRIM_UNUSED_KSYMS
To: linux-kbuild@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>, Nicolas Pitre <npitre@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        linux-modules@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 28, 2022 at 3:41 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>
> This patch set refactors EXPORT_SYMBOL, <linux/export.h> and <asm/export.h>.
> Also, re-implement TRIM_UNUSED_KSYMS in one-pass.
>
> You can still put EXPORT_SYMBOL() in *.S file, very close to the definition,
> but you do not need to care about whether it is a function or a data.
> Remove EXPORT_DATA_SYMBOL().
>
> In v1, I broke ia64 because of missing distinction between functions and data.
>
> V2 handles it correctly.
> If the exported symbols is a function, KSYMTAB_FUNC is output.
> Otherwise, KSYMTAB_DATA is output.
>



I noticed this patch set is broken in multiple ways.
No test is needed.
(0day may send various reports, but please ignore them)

I will fix the code when I have time.







Best Regards

Masahiro Yamada
