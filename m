Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB165821A
	for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706602905; cv=none; b=pt9n2pO+EI+zpQzCO6hHL/wstUBu3BFxc/pXgbv+GH/Uk9UunaLdNjqsYGjg5cw/rscWkZl0ihCrtynzVaTBB39fGDxkAcqdCSG1qOWDUlcceiW5KpVXVHQlv1uu9gZvW177QYqpiKZn25s9q3t21Osl9f2NRGfmGGTCBa+BAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706602905; c=relaxed/simple;
	bh=vzOJ7MIfgYgyfL/hKUylv9hySWYji+tiF7KWajMwhy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jF9n0O2xXxn1FdpyYTxITvWxsIhsa4A+r0EHm4LqoOoNMNVf4LJ3/aPqGuJHj1nnvBPEDQj+WBDbZMCGCp8nCLfAJRZzzA7EP8HbAn8+KH78JMQtwsvJvozuC+oTNFcMLmAz3CkIAjc+2i2kSC+XKzI+BZE3P/uLVHnY6U59jyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDE7Oc0e; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDE7Oc0e"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-510221ab3ebso4961116e87.1
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 00:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706602901; x=1707207701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yIcyGkfqTHtjGeoL2bnZkgPZOS4MhX2Z5R4RqAWzaTs=;
        b=HDE7Oc0eN0tTwmqYFXUZRpGWCGj3mIrq9yPD8xhV1qJxNspMXfWdkHGHxawB+GwECK
         u/Y5FDQtN7n5tDkdNq1773Q+s1/JdnmtRQXPXakM07yg+FN8VCrqzsJzDzn9xXXaKrht
         p7rk0A1awnNi8WHCwzS6deZsfHuMluoFPuBIxuy2VSbVWbgfxM3kHqaGLHRovtvIQBOQ
         mDwktA+eWGKWIg5e8LvMHq7LNwFagDUfQKfZl7TBfhTlvNBjKaoumpSsOeD76ujZD668
         bz4UGceRveF5rzleKFP0KYnkx3WiOsJyJtJB0eLrSp3sCSJDDoBRmZ4rWzfWCQTLw3k2
         RJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706602901; x=1707207701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yIcyGkfqTHtjGeoL2bnZkgPZOS4MhX2Z5R4RqAWzaTs=;
        b=ibmXEuMtsjuAue5bGzoEZmetpC9tPr8rSS+tALjP8KJS6qpphwo0jj8fPNHdybVl5w
         uAm4eJXXovWG3qjav2eiAS18nwdf9+rbBQnZK+ok+3iMVM6C/1lrM4gLM8GQ+t1Mns2s
         VJZcs5HkPFGhYsEKo00Jb0eSELuRem1LQVA45at0F7TMvM9Rc0c9lwAfL9xpyMjnpb1p
         sDEAhWVB6f2aSMfP8RLXvfyOWUvazZHPrwozzoYiIPvzD+FxsXWstgzAJTVlvU7vMwzH
         ipVc3D6YP/A7A3Gq3h8OKrWqhrfJSLu51C1tI3CH1u8qlLpCj2CdykKXOvg+vbhD/JFb
         HN4g==
X-Gm-Message-State: AOJu0Yz+iQGnRJTGvrHRAce6H1LYIOy7UqLEDANLfh1UUM5G8y/WlvhZ
	AyX00QRK94nzVdNhXt0/AdQ5Kuqr2UrfY3BZym/jxlciD19/XqxMtbtg0SO80cb0sj8x8/Ic1o5
	xluH4WEc/mSR0jq094K724bVcG44=
X-Google-Smtp-Source: AGHT+IESE0+cClNiN9sibpBZjAzjxFo4QedFjB7438iUR3qWMvYX7ftM/c/O9YFhZ5fh0WLN0I48JtzZYiyoO/EFsHw=
X-Received: by 2002:a2e:2a46:0:b0:2cf:4f98:b45e with SMTP id
 q67-20020a2e2a46000000b002cf4f98b45emr5449003ljq.12.1706602900980; Tue, 30
 Jan 2024 00:21:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUW0GvM1+A3NKDYRrWhW+eXZj7s0uksR75FMCChkAqp_2A@mail.gmail.com>
 <20240129203518.GA1851901@dev-arch.thelio-3990X>
In-Reply-To: <20240129203518.GA1851901@dev-arch.thelio-3990X>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 30 Jan 2024 09:21:03 +0100
Message-ID: <CA+icZUUfmTKegzJhJmxUv_GtUB_cT1x0f04Xvaj=Ym=5ys1XBA@mail.gmail.com>
Subject: Re: CBL issue 1984 - AMD64 segfault during LTO building linux-6.7.0
 with clang-17.0.6
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 9:35=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Sedat,
>
> Good to hear from you as always!
>
> On Mon, Jan 29, 2024 at 12:43:36PM +0100, Sedat Dilek wrote:
> > With upcoming Linux v6.7.3 I wanted to jump into building
> > clang-thinlto / clang-kcfi kernels again.
> >
> > How severe is the bug in #1984?
> > Only hitable with special kbuild settings?
>
> I believe that issue is only hittable with CONFIG_ZERO_CALL_USED_REGS=3Dy=
,
> so without that selected, you should be fine.
>

Hi Nathan,

Hope you will have a FUNtastic 2024!

OK, that is the workaround:
CONFIG_ZERO_CALL_USED_REGS=3Dn

> > Nathan, can you provide a 17.0.x LLVM toolchain with [3] applied?
> > Maybe in [4] - in an unofficial sub-folder?
> > AFAICS, there will be no v17.0.7.
>
> My build framework for the kernel.org toolchains does not currently have
> support for applying patches, it only has support for checking out
> specific upstream revisions of LLVM (for both simplicity and ideological
> reasons). I have considered supporting patching bugs in unsupported LLVM
> versions but I don't really think that is a direction that I want to go,
> at least at the present time.  LLVM 18.0.0-rc1 should be coming out very
> soon, at which point I will build and upload that for testing. If you
> want to stick with LLVM 17.x, the workaround for avoiding that issue is
> pretty simple.
>

Yes, I can understand that.

Applying the patch against v17.0.6 to have
CONFIG_ZERO_CALL_USED_REGS=3Dy buildable means for me a marathon of
approx. 20 hours of building a selfmade LLVM toolchain ThinLTO+PGO
optimized.
AFAICS Debian kernel team has CONFIG_ZERO_CALL_USED_REGS=3Dy.

From <https://llvm.org>:

LLVM Release Schedule:

18.1.x

Jan 23rd: release/18.x branch created
Jan 30th: 18.1.0-rc1
Feb  6th: 18.1.0-rc2
Feb 20th: 18.1.0-rc3
Mar  5th: 18.1.0
Mar 19th: 18.1.1
Apr  2nd: 18.1.2
Apr 16th: 18.1.3
Apr 30th: 18.1.4
May 14th: 18.1.5
May 28th: 18.1.6 (if necessary)

Hooray, hooray - today v18.1.0-rc1.
18.1 - not 18.0 - I think it is according to gcc version nomenclature?

Thanks, have a good (working) day.

Best regards,
-Sedat-
