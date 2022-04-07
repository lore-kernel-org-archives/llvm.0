Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F120F5
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 07:18:48 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-ddfa38f1c1so5441240fac.11
        for <llvm@lists.linux.dev>; Thu, 07 Apr 2022 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kJgVxXTSGUL5Ml3w5PiaRd14nMB9CIKCrHN3GWr0TqM=;
        b=oQ1HJeQCQC5n4qCBU2DXCCVkwUX12Rt3xib0qn1D9v+Vr4OJP2gxh2o4gm5R/pGj9f
         YNvt9HlCxHLgYJLh/EHM6+KGaIBk6MSYamfbSBtIHhzh2goqMEiWIOyyw4DfkwJce0Hf
         vHhrQk1/hob+b4mYT2BFF+mA5rlDRFuTgF7hB1R7osvQcJpe73AVVzQcFY775BWaLB5Q
         nknirBp+4Wbc4rtxd9qahyM0e16+x4spXyVW7tKFpn99qWo3K+PS2yb9Y6f0VSnwZW6X
         hcjv3snZVrQHECdvtqQNfSq1ePlGzIh+xixdGXmaMB4KDihEZhy4A7qyH7i9TOlPMRE/
         kFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kJgVxXTSGUL5Ml3w5PiaRd14nMB9CIKCrHN3GWr0TqM=;
        b=g1wpGFOPjmcaMbCZNNka3+ijX58FygtSE1ESy1GKx1/4jEdX3r84VG+hDj8RQRW+ep
         QEmaYNYT7IEJ7tD9zqde8OZEIL+pVlNlQNU6cbOfNmhAusO9HUkq2pQHMXoPYLLG3+Mz
         BBhd1E2r87FkdUM7GS/TJzmVE7PnK5/eIo9R3HDa2A42+tYwTpXhsBl81GQqaqRvzJzr
         bgRRteFJ05Jq6HDIjkZynFb4feyuu4I3anhqa/W/1ZHXkhCxThkFK6KQI1getAdIJpKW
         R/749CkNR9fHDPTg0w1I3vXb/sQRCLGTNfETYBF7Lh2W6ZoCNgS4MIQnZeE3WqIpDPEs
         8+Uw==
X-Gm-Message-State: AOAM5320XSHIow1vAMAFJ6X8Ct/uHlgeIkRDxv9w4xisai9eYLWYmGAD
	lekuDS9SIdZUOEJQQ5XusKkt/BaXPzJ1BYACCcX9Vg==
X-Google-Smtp-Source: ABdhPJwE5SJa9B0V0BpKDtoeMPTYGxl+ueDIC4EtAGMY2EXeynZBq31t3MsHu4SvzUk6ntBQp+9uCDgpxvmtJSdAuE8=
X-Received: by 2002:a05:6870:d254:b0:db:12b5:da3 with SMTP id
 h20-20020a056870d25400b000db12b50da3mr5773981oac.211.1649315927305; Thu, 07
 Apr 2022 00:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000008dae05dbfebd85@google.com> <7108f263-5cda-d91d-792b-d3f18b63c6d7@redhat.com>
 <CAKwvOd=-4S1nV=qa3CGNPTAMOv9fGYZsh8hQPXDH1MpowYDX=w@mail.gmail.com>
In-Reply-To: <CAKwvOd=-4S1nV=qa3CGNPTAMOv9fGYZsh8hQPXDH1MpowYDX=w@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 7 Apr 2022 09:18:36 +0200
Message-ID: <CACT4Y+ZB4oBVks7hF5shnW8FDH2c6O6UWoLVtyZ1ccp8AJhmcw@mail.gmail.com>
Subject: Re: [syzbot] upstream build error (17)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, 
	syzbot <syzbot+6b36bab98e240873fd5a@syzkaller.appspotmail.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, jmattson@google.com, 
	joro@8bytes.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, seanjc@google.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, vkuznets@redhat.com, 
	wanpengli@tencent.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Apr 2022 at 20:26, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Wed, Apr 6, 2022 at 10:33 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 4/6/22 18:20, syzbot wrote:
> > > Hello,
> > >
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    3e732ebf7316 Merge tag 'for_linus' of git://git.kernel.org..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=10ca0687700000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=eba855fbe3373b4f
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=6b36bab98e240873fd5a
> > > compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> > >
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+6b36bab98e240873fd5a@syzkaller.appspotmail.com
> > >
> > > arch/x86/kvm/emulate.c:3332:5: error: stack frame size (2552) exceeds limit (2048) in function 'emulator_task_switch' [-Werror,-Wframe-larger-than]
> > > drivers/block/loop.c:1524:12: error: stack frame size (2648) exceeds limit (2048) in function 'lo_ioctl' [-Werror,-Wframe-larger-than]
> >
> > I spot-checked these two and the stack frame is just 144 and 320 bytes
> > respectively on a normal compile.  This is probably just the effect of
> > some of the sanitizer options.
>
> Yep.
> $ wget -q https://syzkaller.appspot.com/x/.config\?x\=eba855fbe3373b4f
> -O - | grep CONFIG_KASAN=y
> CONFIG_KASAN=y
> https://github.com/ClangBuiltLinux/linux/issues/39 (our oldest still-open issue)


The issue is due to:

commit b9080ba4a6ec56447f263082825a4fddb873316b
Date:   Wed Mar 23 12:21:10 2022 +0100
    x86/defconfig: Enable WERROR

Marco has disabled it in syzbot configs:
https://github.com/google/syzkaller/commit/53c67432e69b0df4ff64448b944cbffaecec20f4

#syz invalid
