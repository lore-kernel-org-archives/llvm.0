Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473BE5CA3
	for <llvm@lists.linux.dev>; Thu, 20 Oct 2022 18:06:54 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id p127so485900oih.9
        for <llvm@lists.linux.dev>; Thu, 20 Oct 2022 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mi+Kve2Sq/QUlJWw8rhVBGBmF/oTbCKRhhXKM9X1Rzc=;
        b=EuJfTN8Ldh4nDUxx5bj0nfhX0T8xZXHBdJQy7bkhtBePrWSzYrezsiB+eqh2yzc7V2
         TaDgH/8BAUJ962/8ieEURlCRNtoJFeksroGVsljjbR9DfOCSLLGK0vq57wysmc0D4vJc
         hd9Fd4xkWZMq6113Jj3pB6N1OTPGApbyVVnXh1EJGqBsOEfr6KGBRxREHN19/FVbyM2u
         nLCwWkKVLBtC5kZN8zI2fVNYGVwqx/QMF5KEv8NrdcaNRlugnCtU0AuHgNZyd0hG/DLt
         iAQueZSVBi5ALshrVPCsejYqqk0N+bseBNbHsz/703FnIYN9eKSFFFAjNvxVPdvN1r9o
         jstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mi+Kve2Sq/QUlJWw8rhVBGBmF/oTbCKRhhXKM9X1Rzc=;
        b=WEOYI5TNl0Mln+ygIu2zblhjkpWWjb0KTiwsF5P2OiIxJL6h0EhXLlqoOetEtlcvv9
         A+zcKOo4NB6EjrEERUNfprD5SN/hAZiF+T7g8J3KFvydLfW9EboL+pXUKO+Ya99/Czgt
         iS2uZcmZWxtK2RX5cI3pBtWZLaZ/3VPwcAuOZ6HPOjcm/R9eibR1Gde4HwspR7LC30Qs
         kCiauTiRP9veKjPi/17SjgSj2C72AGN0axiOd+UCGBRajcS7grBC2vPAriq1rkCzanQA
         Zy+GJD0Se/TT6011EkW4Mny7Co/4AnwPkibq0M/bM4KRKBBZHiJx5U9vZAUjBQZzdiJq
         KX2A==
X-Gm-Message-State: ACrzQf30tSSq7FeYh8wYo2LRv+5nZW2fIm1xgpZuZ/puf9kGkM1f4gRX
	BnYWrtenn5dC9z66YEVsLVZ3EIPhipA9sISpkD0=
X-Google-Smtp-Source: AMsMyM7GWcj2MaKJNwbCfkLPk2M2UmNGDecLnLjOnw7HDgY4oKZ8BjHgCu/lrJ81LJoirzuN/JK+5yjb7tHd40fr9eU=
X-Received: by 2002:a05:6808:e8e:b0:34d:7829:135 with SMTP id
 k14-20020a0568080e8e00b0034d78290135mr7890773oil.252.1666289213169; Thu, 20
 Oct 2022 11:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DU0PR03MB8319B83F92372CA86A42C089F3289@DU0PR03MB8319.eurprd03.prod.outlook.com>
 <CABCJKue6M4cXyTP9wgaBx0oZ+5K7sQna9UQF88Pxcknv-kzcMg@mail.gmail.com>
 <DU0PR03MB83196C180979F74ABEEB0562F32A9@DU0PR03MB8319.eurprd03.prod.outlook.com>
 <CAKwvOdncRqrTNqmiDhtkj74V4eU03FBgDr25H4+npwHYgrYQRw@mail.gmail.com>
 <CAKwvOd=7GZfdmtAG2W3Tjo1sPUA0eGnXFpUPWHp-3WJOgVpDEg@mail.gmail.com>
 <CA+icZUWKnw=eKZghzADQRse242dsx1WwGpF0hcSCUby_Wz7=QA@mail.gmail.com> <CAKwvOdnZhtWCExXvTtEB05444CBCXoR1Mo=dq43Qvb8B-pJo=w@mail.gmail.com>
In-Reply-To: <CAKwvOdnZhtWCExXvTtEB05444CBCXoR1Mo=dq43Qvb8B-pJo=w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 20 Oct 2022 20:06:16 +0200
Message-ID: <CA+icZUVhr45pdXQxZox9Rr0mR01fFQwgj8X4LRgj4dGE7tw1OA@mail.gmail.com>
Subject: Re: Update15.x/kcfi to LLVM 15.0.3 (ZSTD + DWARFv5)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Sedat Dilek (DHL Supply Chain)" <sedat.dilek@dhl.com>, Fangrui Song <maskray@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 7:59 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Oct 20, 2022 at 10:47 AM Sedat Dilek <sedat.dilek@gmail.com> wrot=
e:
> >
> > On Thu, Oct 20, 2022 at 7:18 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Thu, Oct 20, 2022 at 9:56 AM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > On Wed, Oct 19, 2022 at 10:44 PM Sedat Dilek (DHL Supply Chain)
> > > > <sedat.dilek@dhl.com> wrote:
> > > > >
> > > > > -----Urspr=C3=BCngliche Nachricht-----
> > > > > Von: Sami Tolvanen <samitolvanen@google.com>
> > > > > Gesendet: Dienstag, 18. Oktober 2022 18:00
> > > > > An: Sedat Dilek (DHL Supply Chain) <sedat.dilek@dhl.com>
> > > > > Betreff: Re: Update15.x/kcfi to LLVM 15.0.3
> > > > >
> > > > > On Tue, Oct 18, 2022 at 4:54 AM Sedat Dilek (DHL Supply Chain) <s=
edat.dilek@dhl.com> wrote:
> > > > > >
> > > > > [ CC Nick + Fangrui ]
> > > > >
> > > > > You happen to know or use the ZSTD cmake-option (see [1] and [2])=
 - came in with changes post-15.0.2?
> > > > >
> > > > > AFAICS Fangrui Song had some patches to use ZSTD debug-compressio=
n with DWARFv5.
> > > > >
> > > > > Unsure, if that combination is now possible in v15.0.3 or is a fe=
ature of LLVM-16.
> > > > >
> > > > > [3] says:
> > > > >
> > > > > [ lib/Kconfig.debug ]
> > > > >
> > > > > config DEBUG_INFO_COMPRESSED
> > > > >         bool "Compressed debugging information"
> > > > >         depends on $(cc-option,-gz=3Dzlib)
> > > > >         depends on $(ld-option,--compress-debug-sections=3Dzlib)
> > > > >         help
> > > > >           Compress the debug information using zlib.  Requires GC=
C 5.0+ or Clang
> > > > >           5.0+, binutils 2.26+, and zlib.
> > > > >
> > > > >           Users of dpkg-deb via scripts/package/builddeb may find=
 an increase in
> > > > >           size of their debug .deb packages with this config set,=
 due to the
> > > > >           debug info being compressed with zlib, then the object =
files being
> > > > >           recompressed with a different compression scheme. But t=
his is still
> > > > >           preferable to setting $KDEB_COMPRESS to "none" which wo=
uld be even
> > > > >           larger.
> > > > >
> > > > > I am interested in the equivalent changes to cc-option/ld-option =
with ZSTD (usable with DWARFv5).
> > > >
> > > > Good idea.  It looks like there's still a blocker to using -gz=3Dzs=
td with clang:
> > > > $ clang -gz=3Dzstd -x c - < /dev/null
> > > > clang-16: warning: cannot compress debug sections (zstd not enabled=
)
> > > > [-Wdebug-compression-unavailable]
> > >
> > > PEBKAC
> > > $ sudo apt install libzstd-dev
> > > <rebuild clang>
> > >
> >
> > Hi Nick,
> >
> > Hehe, yes you need the ZSTD *-dev package on Debian.
> >
> > Interesting:
> >
> > "libzstd-dev: cmake file is unavailable"
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1020403
> >
> > Looks like Clang-16+ is needed as well.
> >
> > The WIP kernel patch looks promising.
> >
> > Please, let me know after your rebuild of clang if it works OK not
> > only compile-tested but also debug-info is OK.
>
> https://lore.kernel.org/lkml/20221020175655.1660864-1-ndesaulniers@google=
.com/
>

Thanks for the numbers and link to Fangrui Song's blog from September
(my chromium had that link saved).

-Sedat-

> >
> > -Sedat-
> >
> > > >
> > > > https://github.com/facebook/zstd/issues/3271
> > > >
> > > > Attaching a WIP patch.
> > > >
> > > > >
> > > > > Thanks.
> > > > >
> > > > > Best regards,
> > > > > -Sedat-
> > > > >
> > > > > [1] https://github.com/llvm/llvm-project/commit/6fba7854a2f0b6b38=
99bb156c1a0c4ae35c96e24
> > > > > [2] https://github.com/llvm/llvm-project/commit/b4840279846e1eea4=
4c3dca575395a90c9d77ca0
> > > > > [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/tree/lib/Kconfig.debug#n315
> > > > > [4] https://metadata.ftp-master.debian.org/changelogs//main/l/llv=
m-toolchain-15/llvm-toolchain-15_15.0.3-1~exp1_changelog
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > Thanks,
> > > > ~Nick Desaulniers
> > >
> > >
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
