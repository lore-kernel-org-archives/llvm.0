Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2C1E98EF
	for <llvm@lists.linux.dev>; Sat, 17 Oct 2026 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225891; cv=pass; b=lo/zi3aUSXT0O0XqUFAI3jT1qLP+VoKxHIUtbO/MvTAwzCpJSwAcbmTPj35V62S6QwB3nA4xEgiBKrAtizLTH7wQo6d5X7q9UUnOgadwEOAIbUU2nvc3M7eUJrpz1HBth9nDvmoCv/Qlel9cFhnPPo9dDTFx0G6ZQzXap+AfkaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225891; c=relaxed/simple;
	bh=2hvL9G0iUMxU+dx34qh/lZYVi9WfhKgM9zRxemLC0CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCLkbg3EcvZEC4+JV3swHUcc3GI30uNadFXXx4ft8XOewuQvLMwRmCpIzLcjZbWFMXpJfrdXqdX4MPXwl8QfmJ8HP3KTYLKhfhu89cMAHdDIWc1NEagC8Jt39IXi+O1WVCkn5cNv7xoK7vxf2sk+mSbKqhI7kKsO0TkuLWKzWug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSl5O5Zt; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSl5O5Zt"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso658684a12.1
        for <llvm@lists.linux.dev>; Sat, 17 Oct 2026 01:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792225889; cv=none;
        d=google.com; s=arc-20260327;
        b=S7vu2b+LHT1abkMTykPCtNESgHxjNwkpcS3elynndJeZ1OJ7JbCCK0QGDcjxBmS6EG
         07DsmzVCxVi7glqa3ku3OEoZJXCdXAJdHvjDKriWVa2aljziZ7bqUfygpcD9iUo2rkjV
         eRuFTPr78C+G02FA8sA6klknRLQQh/IqCRwZ76UIlOZyBPFkr4QibUjAldOj6YJw3EMx
         /PeVao/E3C8vgWvXMrYDyaCsquwgcJYM6lDXItkRPpTokSW0+h53LcAXIwrEQRwphjAx
         9MA74Y1czotKAWwxq1oqYfnkWxq1kBgZibPkTG76x81d/ST0OujvxmQxiG9mQhEC8kTE
         zdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VEum+lArOfGjD+3/r6eLfaoLMgK2123Y1ak1ZUBNHUw=;
        fh=Mv5xLIfwLzon8ZNSiAgZ6NaeO/E1w186QWxjNqEIXNM=;
        b=L6UjKanAFVKF5UgZ1SzAl/61g/YDYJ7yyyShYdepNghh5Aab+djQHvZv8CMM4Xlwuj
         7JcAc4S4ExDReYRHd4EgsALgEHsltl6X/noHkDpNWJ26JBRVLv04dpDVD5EKFSP4cw6s
         sfqA6//UTf79JHPnYB60HxvVCUvQaWvWSQ1IlrvPbsgX0pJAQGzxSZSe3r+tK1KH9Bua
         bnGqkGKn29qIIYO2Za/tEa+H/LnySdiQP9WDt2FynjEW6BLUe9rjQi9zOO6eCQXTFQWm
         YaOpW5ggtPx0WYirrW8EWmhOj442NW+wjxpJpUpDU+l5/hdepYtjSl9Pm2/n1pZbQ9/p
         e2Pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792225889; x=1792830689; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VEum+lArOfGjD+3/r6eLfaoLMgK2123Y1ak1ZUBNHUw=;
        b=lSl5O5ZtWaiRPjH0oMxolSE16uI4csGBMuyezW6VTOBxi/iw/VVhbq6q060lTAB8yH
         6y5ZCFgEpiJOW+GEOsmOmcI6Q3OPESkmp+KipWPeWZ4rDTmqo4OWaojbt4FDJmJn1B39
         r7SkWGWwBIApNlCWVK6qCD6ERQDWAZBeEPx8Vh9eoRe/ZJxzixhVhkrdXodiK6Erq6de
         bvFgl6pGzEQT7cZpT+5fUYcKcdvUgual0wTIDVRDbclEpWijSxT13h8y6Lh62abTAR2n
         24OrlktujSJFmLp2tW13K9kpzCeb7+MKYQ2BILK8++UK8aGn6qd3osNOqDsPk2eSHruT
         tHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792225889; x=1792830689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEum+lArOfGjD+3/r6eLfaoLMgK2123Y1ak1ZUBNHUw=;
        b=es8/QM0M8gAWqmGWwXnMI6NmTicx9wdZLC9gVnxg097kUcfXLoC4ntUf9PdrQCNtWX
         BIoFq6JeWE+cN9QgvfDOUcGaiMBAEGIuG8t5XQ5wcWPoq5yIcgTwkaiS90hIXn6NNlzA
         U+RCBi7eaOmmQR89pPG6SKjp4yOsJWJdMhNXgikGn2oTm1WMqPCVgxPhfuhZEYWZX8X3
         5MkW1FbdFpgEd+bbUoY0HV1DQah/7SRhU3kA5DzWnAlD376Ck3fjWycJ57UoBKR/8spM
         LxNjpK8YlQGHC7yctj7K6GSeRqodvxgND5sAcU6DQy7j1UcUM4hx9EBfo+7HyxrWnb9c
         94FQ==
X-Forwarded-Encrypted: i=1; AKwUvByDQP3Z/18uT3ZFgDY/Yz2jhAmmivQbk0r7LM6cB80NtXG+XkPPuroaY8c5IQyVNWdCvhBY@lists.linux.dev
X-Gm-Message-State: AFq9FYIAVVQm4N95MxV5YgHNPy/4+utsr5XpAhZ1qHQxDAvgvprbGMOR
	6mkWkznm29yFzt+AeCyLg9u4ynA0K90raMN86faG0qU2hjSW5fzqFXbC56UdbmqLdMb18v2a/hN
	9+9ITi6staPe2cGjfCLIVKtaCZsTGG3I=
X-Gm-Gg: AYBFou0zQycob9UY1dswlAdz0z/45nurxmOxPTL6Ez1qrhOilx6gJ3lW0drTaO852hC
	JW3ai7INilcMLS+S46v4N97OHq40AOimmx03sj/9XJSGxxmY7wkbAwxQ8ZKYkfJiO8HDY25Pkh6
	xBJh+6RFWiX24VkzDolwHgoZFfz8P0+o96Q5jvsphiWa8EM4fExHNqRTNfjeS5YDZURq2pITbHj
	/q7FCER1WuKWoZvhHKrt3Pvsx0z/KWpoahOymlOSLNiSCWKwHquzMPBjCq/QzYjcNk047OmiG4R
	YlC3v1xNcrmWvJCxOfETvCP6xoMujtXgRnTES0TfjSGKTaIZNTu8inZfBeu/29sXo7sJ/R6qHy0
	SDHB/opZAhJGAlnfiR2znjnSGHSxEbuzaabTZ
X-Received: by 2002:a05:6402:13c4:b0:6b1:d2ee:392f with SMTP id
 4fb4d7f45d1cf-6b3a81a7587mr1047248a12.25.1792225888276; Sat, 17 Oct 2026
 01:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015135752.17028-1-vngocvan@gmail.com> <20261016012148.GD3329673@ax162>
 <CAJavoFk+zgySyNps5tuKmntmvuAyev=kKL640TFrfCc-njeWBw@mail.gmail.com>
 <CAJavoFkpO29P_oD_YLBkkp6_k080mN-ctRPXSvB+oj_-vpcR0w@mail.gmail.com> <20261016-fast-lyrical-frigatebird-dcd303@l-nschier-aarch64>
In-Reply-To: <20261016-fast-lyrical-frigatebird-dcd303@l-nschier-aarch64>
From: Van Vo <vngocvan@gmail.com>
Date: Sat, 17 Oct 2026 15:31:16 +0700
X-Gm-Features: AclHuK-zaTCBGyUNvXbb2Bqdj4_ImmceC6g3HmNzsMzh7zeoqvdlAmSTAUd-ze0
Message-ID: <CAJavoFnW4qF6biAyzL1dtf=ErNmbK87zG8nhCwR6ggqiFw8Z9g@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for modules
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, masahiroy@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

> So, if I get youre reply correctly, the issue this was not discovered
> "in the wild" but can only be reproduced by manual use of
> gen_compile_commands.py.

Yes, that is correct. I found this through code inspection and reproduced
it with manual invocations, not from a failure in an existing workflow.
My later test with Kbuild-generated artifacts was to validate the path
handling; it was not a failure through Kbuild's compile_commands.json
target.

While looking for earlier reports after your reply, I found Omer Zalman's
RFC dated 28 September 2026 [1]. It describes the same failure with -d,
an absolute modules.order path, and .mod paths resolved from the caller's
directory. The author also used a fixture and explicitly had not tested
that invocation against a real kernel build. I only found this RFC during
this follow-up search, after submitting my patch.

There is also a real project wrapper in DRBD that invokes the generator
directly with -d [2]. It scans the directory without passing modules.order,
so it is not evidence of this particular failure.

I do not currently have a report of this failure in a real-world workflow.

[1] https://marc.info/?l=3Dlinux-kbuild&m=3D179063910090741&w=3D1
[2] https://github.com/LINBIT/drbd/blob/6d3787572ac95313afe7d139df7b24d589a=
00a6b/misc/gen-compile-commands.sh

Thanks,
V=C3=B5 Ng=E1=BB=8Dc V=C4=83n

On Fri, Oct 16, 2026 at 8:42=E2=80=AFPM Nicolas Schier <n.schier@fritz.com>=
 wrote:
>
> On Fri, Oct 16, 2026 at 01:25:33PM +0700, Van Vo wrote:
> > Hi Nathan,
> >
> > > How was this discovered?
> >
> > This came from code inspection of standalone use of -d with an explicit
> > modules.order argument, followed initially by a constructed reproducer.
> > It was not a failure encountered through Kbuild's compile_commands.json
> > target.
> >
> > I have now reproduced it using real Kbuild-generated artifacts from
> > 0fcb05b72344f40806cbe810de8872f1698bf053 on Linux/aarch64, with Python
> > 3.11.13 and GCC 12.2.0. This was a partial lib/ build with CONFIG_TEST_=
LKM=3Dm.
> >
> > The following uses a disposable source tree at that base. The guards
> > prevent overwriting an existing output directory or result file:
> >
> >     (
> >         set -eu
> >         test ! -e out
> >         test ! -e outside.json
> >         test ! -e inside.json
> >         make O=3Dout -j1 allnoconfig
> >         bash scripts/config --file out/.config --enable MODULES \
> >             --enable RUNTIME_TESTING_MENU --module TEST_LKM
> >         make O=3Dout -j1 olddefconfig
> >         make O=3Dout -j1 V=3D1 lib/
> >
> >         outside_exit=3D0
> >         python3 -B scripts/clang-tools/gen_compile_commands.py -a ar \
> >             -d out -o outside.json out/lib/modules.order ||
> >             outside_exit=3D$?
> >         printf 'outside_exit=3D%s\n' "$outside_exit"
> >
> >         inside_exit=3D0
> >         (cd out &&
> >          python3 -B ../scripts/clang-tools/gen_compile_commands.py -a a=
r \
> >              -o ../inside.json lib/modules.order) ||
> >             inside_exit=3D$?
> >         printf 'inside_exit=3D%s\n' "$inside_exit"
> >         test "$outside_exit" -eq 1
> >         test "$inside_exit" -eq 0
> >         python3 -c \
> >             'import json; assert len(json.load(open("inside.json"))) =
=3D=3D 1'
> >     )
> >
> > Kbuild generated lib/test_module.o, lib/test_module.mod,
> > lib/.test_module.o.cmd and lib/modules.order under out/. Both .mod and
> > modules.order contain lib/test_module.o.
> >
> > The old script's invocation from the source directory fails with:
> >
> >     FileNotFoundError: [Errno 2] No such file or directory:
> > 'lib/test_module.mod'
> >     outside_exit=3D1
> >
> > The same artifacts work when the old script is invoked from out/:
> >
> >     inside_exit=3D0
> >
> > The successful invocation produces one JSON entry for lib/test_module.c=
.
> > The patched script succeeds from the source directory and produces an
> > identical entry. The old script also fails with absolute paths for -d
> > and modules.order; the patched script succeeds with those paths too.
> >
> > Only the standalone generator invocation is outside the build directory=
;
> > compilation itself runs under out/. This is not a full kernel build or
> > a boot/runtime test.
>
> Thanks for the detailed reproducer.
>
> Quoting from Nathan:
> | How was this discovered? This cannot happen within Kbuild because this
> | script is always invoked from within the build folder, so was it a
> | manual invocation or something else?
>
> So, if I get youre reply correctly, the issue this was not discovered
> "in the wild" but can only be reproduced by manual use of
> gen_compile_commands.py.
>
> --
> Nicolas
