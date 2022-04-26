Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D97E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 19:24:05 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id v1so19889930ljv.3
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 12:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kw+XI2lMK5ZbblqYNOVAos7HIY90lqSf4MYTznBEb3U=;
        b=iCfrKgbSIXT/w2djHA0elcarjLrlx8yjdd1ZpCw7MB3cQrPNWt9tVN0Kp5CnkMlsAn
         t5qD4HvX6Oceg5cDkiNGktyLTtCrqcUGjP1cJeqPWqvsNrFLA+KfHtO7JJHx0SNDs04Y
         6w87FWCxlDmezkpkaUADcNBiTzqGQvERQvDDn1Bs2KzhPAuN5TMzyxMRVQ/+23pKQ8sJ
         EwqZfVZHIycMQ7+Az3RZDOrf+iPC7Hqap5TiNRa3pdt+QEuzhBqjfhPp+/YMmQOOMjoU
         aJNq38dxA4YNc4q2xBdEEHFp00kFm2yNy7QwNXJIrukvohQavCT9oYvm7/biA5XETS5/
         ZV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kw+XI2lMK5ZbblqYNOVAos7HIY90lqSf4MYTznBEb3U=;
        b=sTp/auk/vwzcXcPNZTIQpia3e17aHLPEmvO7qFyb1RG9hZPMIGdMrkoXCZdIE+RDLs
         4I6uv8FciWSLso2pAg5Q69Oys54jEP27wnb4s8Kl899NMo46JrwokQE7bjWPe015l80x
         Gw+bFX77iHb8aL10QRbwNOkWwr7XmQDSjU+QMRuMjn+Yfu2a+7sGydeHqF4IPjVWXJfb
         ZYpS5WXDn6rCPc7yjzDOqMhn1ufXYBooRnOp6yw/rJdmGhCew0Cnfc6e1A1BObPTsvmA
         qsiVRZOUw1HqtZpeIzNxf2/xWRfdjJpqz1bQv91aSXmxp+965sSkIIsBldJoibPic1/v
         UeyQ==
X-Gm-Message-State: AOAM5307NcPwj2YzlPclu3PrMJHUi2xxAa2itSZEmY3Iopi4D/PFA/Kl
	Z4y304G8UoYPYpQ1KZ8L8C2Q9rFNtEt7xQa9r1RnzQ==
X-Google-Smtp-Source: ABdhPJxBDiT3yusjHDz+A2Wpuv5aAgyHybolTpRf4sW+vV7PvYcp2sSX7A7qSUhQP+GBI7sd3JfgM10zsYGOMfapPcg=
X-Received: by 2002:a2e:9b57:0:b0:24f:12ea:fd26 with SMTP id
 o23-20020a2e9b57000000b0024f12eafd26mr6583324ljj.352.1651001043251; Tue, 26
 Apr 2022 12:24:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com>
 <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
 <CAK8P3a2vHuRB1vkjVkKaNxr3Ptfv3UBS0scsShQPxY46_xh9kA@mail.gmail.com> <Ymg43Ed/Sg8szdKq@dev-arch.thelio-3990X>
In-Reply-To: <Ymg43Ed/Sg8szdKq@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 26 Apr 2022 12:23:51 -0700
Message-ID: <CAKwvOdkvg+jKVqetfrNPn5yNCxfZYHAhu2Cvc+dGLFG3+kOGUg@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mauro Rossi <issor.oruam@gmail.com>, 
	Chih-Wei Huang <cwhuang@android-x86.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Mark Brown <broonie@kernel.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 11:24 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Tue, Apr 26, 2022 at 02:21:16PM +0200, Arnd Bergmann wrote:
> > On Mon, Apr 25, 2022 at 9:13 PM Mauro Rossi <issor.oruam@gmail.com> wrote:
> > > I have checked also with kernel-5.17 and the same build error is
> > > happening also there, so it is not due to commit 34737e2698 ("uaccess: add generic
> > > __{get,put}_kernel_nofault")
> >
> > Ok, that's good to know, thanks for checking! I suspect the problem is
> > using a slightly too-old prerelease build of clang, where the released
> > clang-11 build had the asm-goto-with-output feature enabled.
>
> Correct, the build failure can be reproduced with tip of tree LLVM if
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT is manually disabled, such as:

That begs the question though; not all supported versions of GCC have
asm goto w/ outputs. Why is this not an issue for older gcc versions?
Perhaps it's because clang is validating inline asm constraints in
dead code again? I thought I had fixed that in
commit 158807de5822 ("x86/uaccess: Make __get_user_size() Clang
compliant on 32-bit")
in v5.9-rc1.

I don't know why `=a` can't be used, yet.
void foo(void *a) {
    asm("":"=a"(*((unsigned long*)a)));
}
Compiles w/ -m32 just fine.  Perhaps creduce is needed.
-- 
Thanks,
~Nick Desaulniers
