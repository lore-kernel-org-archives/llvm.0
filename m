Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21933C7
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 18:26:59 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id 5so5607944lfp.1
        for <llvm@lists.linux.dev>; Wed, 06 Apr 2022 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s9MSEQiGX4w+Gj5Hnf9X/GdnyPnaA8vq0dsZaIRkOhs=;
        b=UQCbCU83Jyh/KNEJVyGoQ+9c4hJBtLu8phhkHqJDRycLQLAI2EyeA25FYBmbQRHO2Y
         Z0ZxINFDbMU88OM8HgA68CT46ralIOVViXkjujP7Gon1Vr0UQ4MZeRbxAMxMy3aKjVU9
         f/c0n7+QwKFXLQMBCLViGPD7mwTswWu90kSvz4Kr6DLBKJpW5bPBizRw3t9WGeS29uq5
         2h7JAYAF/e9RewvUQbkKLZQIdeJ9vatIp7QgY1474dQwPlMqP/ixDG7FiOR93P5bWcxJ
         wM2ESOMcH+4h0rVav4WDSWTk6h+P287KoTQJlOe1fOR2nIyPPZYtdw2kMtE6DZN+kC2X
         uL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s9MSEQiGX4w+Gj5Hnf9X/GdnyPnaA8vq0dsZaIRkOhs=;
        b=zh/Sh0kgQKwxZ/U0z36yO1VaIdzRlu+Oz5p+pbbfK2oIwcznKIPRFELxS3YWf+3FDV
         XB+BCOf216cjj9ZPlm2tvc8bQ+H159z5dj4otSqtNrTcz//2og/HgfybAQACV1wMbgZZ
         IsbvpiBVm8BjteT5NzYcwBRDN0OIs2tnw+B+AWEDhiVVfMLnFl/4Ov8Y4jF8lsKTU1ah
         cThS0pUvw/oG5M6HDo5/tZQjg+gP/3innVL0ghGEPon1JpSbfnZf1qbtE7r5vxkOnbmT
         73sVLDXYP7lS0A88StcQXE0BfS3tF7hb1vULP8lC7/9AHCz8saIzk5CiaknVWR6vWRo5
         E0MA==
X-Gm-Message-State: AOAM533sepZtj+1LWL872cX97qgSbo7w5abUg9XPWvtLDSJkldgvQ8Sl
	SoymkGNb77bm0JdJwIx8ZO8LM57ZGHj9+enNFpWH2w==
X-Google-Smtp-Source: ABdhPJyaBCLeg4EwMtCtiJce4VSVnmDIgx5OuJNHxvpobGEbby9DmFxO6zVAqFq14QJEfG8XCrb7qg3gzewMjUTWhyQ=
X-Received: by 2002:ac2:5dee:0:b0:464:f074:ba73 with SMTP id
 z14-20020ac25dee000000b00464f074ba73mr129429lfq.392.1649269617073; Wed, 06
 Apr 2022 11:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000008dae05dbfebd85@google.com> <7108f263-5cda-d91d-792b-d3f18b63c6d7@redhat.com>
In-Reply-To: <7108f263-5cda-d91d-792b-d3f18b63c6d7@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 6 Apr 2022 11:26:45 -0700
Message-ID: <CAKwvOd=-4S1nV=qa3CGNPTAMOv9fGYZsh8hQPXDH1MpowYDX=w@mail.gmail.com>
Subject: Re: [syzbot] upstream build error (17)
To: Paolo Bonzini <pbonzini@redhat.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>
Cc: syzbot <syzbot+6b36bab98e240873fd5a@syzkaller.appspotmail.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, jmattson@google.com, 
	joro@8bytes.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, seanjc@google.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, vkuznets@redhat.com, 
	wanpengli@tencent.com, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 10:33 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 4/6/22 18:20, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    3e732ebf7316 Merge tag 'for_linus' of git://git.kernel.org..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=10ca0687700000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=eba855fbe3373b4f
> > dashboard link: https://syzkaller.appspot.com/bug?extid=6b36bab98e240873fd5a
> > compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+6b36bab98e240873fd5a@syzkaller.appspotmail.com
> >
> > arch/x86/kvm/emulate.c:3332:5: error: stack frame size (2552) exceeds limit (2048) in function 'emulator_task_switch' [-Werror,-Wframe-larger-than]
> > drivers/block/loop.c:1524:12: error: stack frame size (2648) exceeds limit (2048) in function 'lo_ioctl' [-Werror,-Wframe-larger-than]
>
> I spot-checked these two and the stack frame is just 144 and 320 bytes
> respectively on a normal compile.  This is probably just the effect of
> some of the sanitizer options.

Yep.
$ wget -q https://syzkaller.appspot.com/x/.config\?x\=eba855fbe3373b4f
-O - | grep CONFIG_KASAN=y
CONFIG_KASAN=y
https://github.com/ClangBuiltLinux/linux/issues/39 (our oldest still-open issue)
-- 
Thanks,
~Nick Desaulniers
