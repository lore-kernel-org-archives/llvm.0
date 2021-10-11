Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55002C81
	for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 17:31:31 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id y26so77426600lfa.11
        for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OT203vnjB7/zUlFzlItVKI17MBCGdyaAlk+HzafniWc=;
        b=Irz3Tcxj1xe1q8LLa/BtO916dIui2Sq+1sBTNiyk8aBXvZyEOJt03BLDAGjpvrBrZD
         1UUz4TersnrZsmjO89yk4htL/czSDG5g9yiJMsHxYmCH7qnbqyK2E36v12Ab0NAuwvxY
         UYwcu/4VzzK9WVS96I4YX4MliKGpFXCnT7qgbxTVFHH/UxZ6AKxbo09QhVLOOI5q/DC0
         GJh+OWEd/TM+v/NbMcNlogrxda5KuUu43gt2/Ij5BVYW3E27d82umUin+p8eSDPWJu9r
         YZ+BsTP0cQjBSA+7Cyiee//LpdupyUMR7NtzhHVaZP9qPYpLdCdd6ZiGyAtHv5qsmhlJ
         u77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OT203vnjB7/zUlFzlItVKI17MBCGdyaAlk+HzafniWc=;
        b=13rgYaIElp8G1EyIpVSKmY5z42Kgz4GB2do/GTIe8wT//Ctn2rrZb7C6+fbj128v2c
         n6FJNHVRtdgwM1Gu4emAheMAadOicFsSPiAlvZFjJDL7US8o+rNxZZUK6HbNsTeC+QzL
         VL9i4lb3HObfAcUavBNWaQ5OvHZM+o4GDO8rsqo1G04rWGoBbmKw7oOFXq6H9n8t2ydG
         RbYzqYVO0t0jmgzmoueQFU3mgDva8tm6jYd0GMXLPCBt7lY8F3J+ENmfhe9uA1+kZkEF
         l4t8GgI3e3asmpng+TqVxFll0/OcTyZb/PBYXHuHUGCRz4YgOZ8yaHDY1uYCUxZnRTrH
         jvPw==
X-Gm-Message-State: AOAM531CJ4pyzob34vyVm761SDfhWqWJnyOX3rYv7Q8zTpJxLnXEHXjU
	0aPoVQQloQw5TvDe/hJim819vUQJTX0KBC7fI3yTWQ==
X-Google-Smtp-Source: ABdhPJyzVgthy6KpGM2XZvlREfCX58/w84OF82adREJoZf1l+wVrm5xDU7/iQQLFAjCAgnWrfdkUyBj6bLAZXFjApdY=
X-Received: by 2002:a2e:461a:: with SMTP id t26mr24899757lja.198.1633973489480;
 Mon, 11 Oct 2021 10:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuqwJD5bFO74vG6Mvbbt1G8rxzd_NDHg-gtOZ6rPjeu3A@mail.gmail.com>
 <YWQLUd+BQ1Cc88HG@osiris>
In-Reply-To: <YWQLUd+BQ1Cc88HG@osiris>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Oct 2021 10:31:17 -0700
Message-ID: <CAKwvOdmrqqqMRLuJ3VLk5K+3Z=qaAbuYkMAo=u1UdfjX=7muAw@mail.gmail.com>
Subject: Re: clang-13: s390/kernel/head64.S:24:17: error: invalid operand for instruction
To: Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, Jonas Paulsson <paulsson@linux.vnet.ibm.com>, 
	Andreas Krebbel <krebbel@linux.ibm.com>, nemanja.i.ibm@gmail.com
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev, 
	linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alexander Egorenkov <egorenar@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"

+ Nemanja


On Mon, Oct 11, 2021 at 3:01 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Mon, Oct 11, 2021 at 11:47:42AM +0530, Naresh Kamboju wrote:
> > [Please ignore this email if it is already reported ]
> >
> > Following s390 builds failed due to warnings / errors.
> >
> > metadata:
> >     git_describe: v5.15-rc5
> >     git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >     git_short_log: 64570fbc14f8 (\"Linux 5.15-rc5\")
> >     target_arch: s390
> >     toolchain: clang-13
> >
> >
> > Fail (2861 errors) s390 (tinyconfig) with clang-nightly
> >   @ https://builds.tuxbuild.com/1zL35IUSGhDGeVuyIrAp7eyzEUi/
> > Fail (2861 errors) s390 (tinyconfig) with clang-13
> >   @ https://builds.tuxbuild.com/1zL35Hn7wjErKsLDM6zAgh27BYJ/
> > Fail (4112 errors) s390 (allnoconfig) with clang-13
> >   @ https://builds.tuxbuild.com/1zL35HR60hSFvBmAcYJvKHm8Lko/
> > Fail (4112 errors) s390 (allnoconfig) with clang-nightly
> >   @ https://builds.tuxbuild.com/1zL35DTlrX9qRGCtGqgtmmMDjnQ/
> > Fail (23048 errors) s390 (defconfig) with clang-13
> >   @ https://builds.tuxbuild.com/1zL35DE2KWQUPxbbXeTbwIJaWXS/
> > Fail (23045 errors) s390 (defconfig) with clang-nightly
> >   @ https://builds.tuxbuild.com/1zL35EgeQfWQDXDupp4itkUO5At/
> >
> >
> > Build errors log:
> > ----------------
> > arch/s390/kernel/head64.S:24:17: error: invalid operand for instruction
> >  lctlg %c0,%c15,.Lctl-.LPG1(%r13) # load control registers
> >                 ^
> > arch/s390/kernel/head64.S:40:8: error: invalid operand for instruction
> >  lpswe .Ldw-.(%r13) # load disabled wait psw
>
> You need to pass LLVM_IAS=0 on the make command line on s390 since
> commit f12b034afeb3 ("scripts/Makefile.clang: default to LLVM_IAS=1").
>
> LLVM's integrated assembler doesn't seem to work well when compiling
> the kernel for s390 yet.

Dunno if you folks have cycles to work on it, but if you do, we have
just a handful of bugs left in Clang's assembler (or kernel source
issues) preventing us from assembling the kernel with clang for
SystemZ and PPC.

s390:
https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22%5BARCH%5D+s390%22+label%3A%22%5BTOOL%5D+integrated-as%22

ppc:
https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22%5BTOOL%5D+integrated-as%22+label%3A%22%5BARCH%5D+powerpc%22

I'm happy to hop on a call to discuss these more.  We have all other
architectures working here, in the sense that if we can build them
with clang, we're using the integrated assembler by default.
-- 
Thanks,
~Nick Desaulniers
