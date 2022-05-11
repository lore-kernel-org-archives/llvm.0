Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700B32F43
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 16:03:25 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id k2so2341588qtp.1
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 09:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tiYYIPrNfsroaIStl1mY1+mAqifM3btnd6+4riQ+21g=;
        b=QEiYUSeOrsN7Ddqzx0/RdItPxcoY2FCDRypQKbrHt/pSnjxoQREuVSh9oxvn770uCS
         3Pn3HlXhZ8g6rtWB23oM83q1K3IQTd6+5ADiau6X/kmAE+RueTWmlwIR93kCsk5NZGPt
         iCVNyVcSq3CSjC+/dqnWby5kmW4j7eM4eevpSYmQTeWe3PbCj8hqeG4670dCF6RJmTSQ
         U9QJwaofsov9C+KJrWczTegkMNT+8bNxz9Udds1GfHkrBd5CVlazbHpn+tx0c3tcMzJo
         B+8BAO4MOsV3/W7roPcF+Pa102WqZIiNv9LKMiYiXPvs1EBzMUAc/ZaE4NDjGvC71tJU
         R/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tiYYIPrNfsroaIStl1mY1+mAqifM3btnd6+4riQ+21g=;
        b=M/oKfvuJTOaOofKMxzw4ivIsTaP61n9XR+Eg8iVeaKPoyn3q0ZoRpCZBBxDAS8py1R
         ZescsbC1053T4C2E/dUXoKYcvJ7wLzHGzIlxUqZmYJwYhrDfQc71grDBAnMFvN9xhEJD
         GS6TBExD9/QXeZOeNkeKxNB33dgRMICYCn6Ysb0LEzRMdsKVhAmVsM7weWeYq6Kj8tAs
         p2Fh6jw1Sk2p7+rZKggHoqR70r9WuoFj3H1jl3Pe1Fo9hj8xiuOzfujvB9byEg8ofahO
         AX7+z5B42mV4iBhyCKGanIj0u2A+JcGJNIoOOcxOTyxs2SHiWAKujXuBMXIptEkQAHQL
         A3/A==
X-Gm-Message-State: AOAM5304UXAha72NWXV4sKAsvSuCtywdN81Fmy7TdTNmjm5dyTObP2Ii
	csf1fPkFHasGPPVkmEpx8qijXtkeLU365w22xAQDL/63
X-Google-Smtp-Source: ABdhPJwa3rP2S4eeiw9x1SjiKg1G9GaIg9dCplv/xeYNqI01IntL0LJDWh+o5ZrolbftP/S+xnLqr8gJY15ToPwVpvI=
X-Received: by 2002:ac8:5b06:0:b0:2f3:d6c1:e5df with SMTP id
 m6-20020ac85b06000000b002f3d6c1e5dfmr16251030qtw.535.1652285004204; Wed, 11
 May 2022 09:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220509203623.3856965-1-mcgrof@kernel.org> <YnvdOAaYmhNiA5WN@bombadil.infradead.org>
In-Reply-To: <YnvdOAaYmhNiA5WN@bombadil.infradead.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 11 May 2022 09:03:13 -0700
Message-ID: <CAADnVQLCvjqphpJDkz-5bpJLs3k_PRH1JcwehCRLrWYvsA9ENw@mail.gmail.com>
Subject: Re: [PATCH] bpf.h: fix clang compiler warning with unpriv_ebpf_notify()
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Song Liu <songliubraving@fb.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 8:58 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Mon, May 09, 2022 at 01:36:23PM -0700, Luis Chamberlain wrote:
> > The recent commit "bpf: Move BPF sysctls from kernel/sysctl.c to BPF co=
re"
> > triggered 0-day to issue an email for what seems to have been an old
> > clang warning. So this issue should have existed before as well, from
> > what I can tell. The issue is that clang expects a forward declaration
> > for routines declared as weak while gcc does not.
> >
> > This can be reproduced with 0-day's x86_64-randconfig-c007
> > https://download.01.org/0day-ci/archive/20220424/202204240008.JDntM9cU-=
lkp@intel.com/config
> >
> > And using:
> >
> > COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D1 AR=
CH=3Dx86_64 SHELL=3D/bin/bash kernel/bpf/syscall.o
> > Compiler will be installed in /home/mcgrof/0day
> > make --keep-going HOSTCC=3D/home/mcgrof/0day/clang/bin/clang CC=3D/home=
/mcgrof/0day/clang/bin/clang LD=3D/home/mcgrof/0day/clang/bin/ld.lld HOSTLD=
=3D/home/mcgrof/0day/clang/bin/ld.lld AR=3Dllvm-ar NM=3Dllvm-nm STRIP=3Dllv=
m-strip OBJCOPY=3Dllvm-objcopy OBJDUMP=3Dllvm-objdump OBJSIZE=3Dllvm-size R=
EADELF=3Dllvm-readelf HOSTCXX=3Dclang++ HOSTAR=3Dllvm-ar CROSS_COMPILE=3Dx8=
6_64-linux-gnu- --jobs=3D24 W=3D1 ARCH=3Dx86_64 SHELL=3D/bin/bash kernel/bp=
f/syscall.o
> >   DESCEND objtool
> >   CALL    scripts/atomic/check-atomics.sh
> >   CALL    scripts/checksyscalls.sh
> >   CC      kernel/bpf/syscall.o
> > kernel/bpf/syscall.c:4944:13: warning: no previous prototype for functi=
on 'unpriv_ebpf_notify' [-Wmissing-prototypes]
> > void __weak unpriv_ebpf_notify(int new_state)
> >             ^
> > kernel/bpf/syscall.c:4944:1: note: declare 'static' if the function is =
not intended to be used outside of this translation unit
> > void __weak unpriv_ebpf_notify(int new_state)
> > ^
> > static
> >
> > Fixes: 2900005ea287 ("bpf: Move BPF sysctls from kernel/sysctl.c to BPF=
 core")
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >
> > Daniel,
> >
> > Given what we did fore 2900005ea287 ("bpf: Move BPF sysctls from
> > kernel/sysctl.c to BPF core") where I had pulled pr/bpf-sysctl a
> > while ago into sysctl-next and then merged the patch in question,
> > should I just safely carry this patch onto sysctl-next? Let me know
> > how you'd like to proceed.
> >
> > Also, it wasn't clear if putting this forward declaration on
> > bpf.h was your ideal preference.
>
> After testing this on sysctl-testing without issues going to move this
> to sysctl-next now.

Hmm. No.
A similar patch should be in tip already. You have to wait
for it to go through Linus's tree and back to whatever tree you use.

Borislav,
did you ship it yet?
