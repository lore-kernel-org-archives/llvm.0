Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A8E72
	for <llvm@lists.linux.dev>; Wed,  8 Sep 2021 20:18:29 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id l18so5475014lji.12
        for <llvm@lists.linux.dev>; Wed, 08 Sep 2021 13:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PyD4yA15+8RHTrr9Rxo1pXG2/0hcjnJyHiRNONMAkgQ=;
        b=pDL4GCHPgd21e9yl6EAzH74YeEVy/dgzOlp3pl2d85VNYOEdHOq48NwWPHmjo4z/MD
         mU0zsayFOq5zeKLC+zalRrKNqVD/yj6YS0JMW2moKo2PDEeSrSQ9OveZB4h+Ufyg7Yr1
         5k0zapVv/hAxuS3VdyE3orapztkCdXbjCinLKDUPALCRQm3Ymd+2cIPAfzbEkWnTf2Nl
         J3haeCv9USXTeSo64Zcx4hZJI43sf7MiHi5YpSnoTn9698pjZDK+FMdGsckKNU/cwOEC
         vmRoiuimmGnAxVpPHdXdnB9npmqAR5BlotVEzf3BU+ikAAvNkPW6h0CrLfZVjTXt21BO
         hMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PyD4yA15+8RHTrr9Rxo1pXG2/0hcjnJyHiRNONMAkgQ=;
        b=Sqkm3zbU41KuxmVAdsQbghoPawNO6aoKVUbpN+S5bA0pTIZSaHKiu79ZnK8CiTsEVT
         P9r9onH7mwI6sDcA5ZkZ2Nb1eNrUvlnk4GS2oFA080ovr9RgUHc2Jf1ODE0y64RCwE9Q
         6ahN0EE7qinM/aYc6leXzIeNj+NS6Gu7gAX7GtvqV99bslvp/fDhifkAJaIOaxWQeVox
         NBw9dBYerroOjIWBd1hDlGEeNLZDeM06cLWBLEr4GrQnQ0ez65PA24PnQFOh2h48RPTD
         wg/jdl3zElwigKn0CyB0sZampi5IPKtNfVLUK//5U2H2PWeTESsmXj/e/A/eTTxWj1JL
         1YPg==
X-Gm-Message-State: AOAM530x9G+M7SodAf0Jv7Rmn70lntamkq12cII96CLdE3+hvM9ayUFr
	+XRNRzUDQU6vFDH64fsPyP210UZW3Pn+t9e7ZbBk1yNt89SOkCDL
X-Google-Smtp-Source: ABdhPJxdFGVRNXEEEcUJQG0zcXkGS93FDt0Km4kZmXjyBL7eewKAvLVqjKOtUEgVqiHI0uDBKGXSMwYeetzsz3I6Zws=
X-Received: by 2002:a05:651c:1305:: with SMTP id u5mr102927lja.198.1631132307267;
 Wed, 08 Sep 2021 13:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 8 Sep 2021 13:18:16 -0700
Message-ID: <CAKwvOdmrR-NRn4X=okbehyxJpOnq9jXGdz8zwyObydB+iPrhYg@mail.gmail.com>
Subject: Clang-Built Linux Meeting Notes - Sep 8, 2021
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(reposting the notes from our every-other-week meeting in text/plain;
probably going to move the show notes to a github repo)

Sep 8, 2021

* Need attribute error warning kernel fixes to be picked up by Miguel
  * https://github.com/ClangBuiltLinux/linux/issues/1173
* __mulodi4 llvm fixes in, need to do kernel fixes
  * https://github.com/ClangBuiltLinux/linux/issues/1438
  * Todo file bug against gcc for mulodi4?
* Switch bit test fixes landed in llvm fixes LTO boot
  * https://reviews.llvm.org/rG4331f19d8b9ac8101d55073834b35814afce4e5a
* -Werror
  * https://lore.kernel.org/lkml/20210907183843.33028-1-ndesaulniers@google=
.com/
  * Sanitizer vs frame-larger-than=3D
  * Stable vs compiler version checks
  * TODO Disable WERROR in CI
* LLVM_IAS=3D1 CROSS_COMPILE landed in mainline
* 5.15 merge window open
* Conf cfps
  * Distributors conf:
https://github.com/ClangBuiltLinux/llvm-distributors-conf-2021/issues
  * CBL meetup 2: https://github.com/ClangBuiltLinux/CBL-meetup-II-turbo/is=
sues
  * LinuxConfAU extended their deadline:
https://linux.conf.au/programme/miniconfs/
  * LLVM virtual meetup (no BoFs this year, let's do a roundtable?):
https://lists.llvm.org/pipermail/llvm-dev/2021-September/152483.html
* Kasan s390 ci coverage added to our CI
* Nearing Github Actions CI matrix limit
* Kees fortify patches (being split into 2 series)
* New mailing list and IRC
  * TODO update mailmap
  * llvm@lists.linux.dev
  * #clangbuiltlinux on irc.libera.chat
* Sami CFI patches
  * https://reviews.llvm.org/D108478
  * https://reviews.llvm.org/D108479
* Bill finding shadowing and scev issues (b/198158061)
(https://reviews.llvm.org/D104741)
* Talk to Miguel if you=E2=80=99re interested in Rust+kernel
* (Nick) tailcall optimizations for fortified routines:
https://reviews.llvm.org/D107872
--=20
Thanks,
~Nick Desaulniers
