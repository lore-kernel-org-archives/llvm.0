Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7E03D77
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 22:09:03 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id e4so35548ljb.13
        for <llvm@lists.linux.dev>; Tue, 31 May 2022 15:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zWlLDjn8/4W4ntBv+o1Od3JuYjF6btG4WNnGzsI36yw=;
        b=IKHI2dejgyftlbdjsFTfFoHITHjSnAOxwD9js1qS/uigKcj4u5cGgok7Ag+LU8zORl
         RaHiVTb+Xwe22KqNgHFGLScZZ3g6ilQ8ixj7JPTr3zWVKEhTJxeCQromJdVWCN+XfgXI
         rmo5eGSG/SYDUrRqN1Z4i+CQEbsmG9AnvLDhan0NfPTfHVug47UBQUpVsGxwL1VIphI/
         QTaGk2e30dGTx7a2vs6E4J6m4ILskPXAps/SlkyyPBuVY9VLNO3kTx9SpNe4tiyRMbmc
         bmJ+KTYruA8wOBE+Em7qoAwYwFuG1HqXMu1R7gbxqBAltkKtQpLA/XIxexKOAMVHT4n2
         9vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zWlLDjn8/4W4ntBv+o1Od3JuYjF6btG4WNnGzsI36yw=;
        b=pQw9LhK0pbOxJ+awnOTkP2uwHlx5m+OmBf7ZKRToR2eGCRzKR8gwb7t6q9B917SMtV
         2y+D+dWuEjgdOzBNbobJNRc6SYWNon5Iuh4CbnMkbpqv755qOhNgeVuOSiM1rjukAtjc
         W2fcQeYcVLcPUzcBXuC2lIKwQXKBWaoLuRdtTdHEjok2bg9DKKHf2WZcNi7D6KLz/Ofz
         vidPGim0WyZNMTB1f2f8tzIjDxYxwnjENoz9FJ1sh5ehVhaSF0IvCz02MhdmEuANrOA7
         KcQpUGLqBhZJJTGjuMCoVmtbZKTivO1UqbA0OND+ROQvr+0WyVAlkzc18sm/X83PcMBi
         hhsA==
X-Gm-Message-State: AOAM533R0UAL2P1i+1R0kE5isy8R4H1plAW5xTVzWg2ZpjrE15QcynC8
	uluD78+OtDeARavy6Ky6H5FCOqCN0Z+TpnmDUnbrSQ==
X-Google-Smtp-Source: ABdhPJzYLbxMehiXCrUfUjsL0pdvtolkZKiSmTujycK02Fq36HdGiHd6Tm0RRTrJeu6i03Ub5TiaDg6HQSVhigkTExQ=
X-Received: by 2002:a2e:6d12:0:b0:253:e3b9:a56e with SMTP id
 i18-20020a2e6d12000000b00253e3b9a56emr28977673ljc.103.1654034941643; Tue, 31
 May 2022 15:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGZ=6K8wudbS--3z+JpKTsL_dfM-8Co7NwViRo0i3t2EZg@mail.gmail.com>
 <Ym2qdHAB6BMMlegB@thelio-3990X> <CAEQFVGZB6eAetmt1kk+TYbGxpfrDut37DEO_-1HECqM6FEERww@mail.gmail.com>
 <CAEQFVGby3Q1mf1GGJwkFyAgaq38NvVAMx6tQM+9LO+HE8Z8Z8A@mail.gmail.com>
 <YnhbOpXHT8k+g9Qu@dev-arch.thelio-3990X> <CAEQFVGYSV=boBYGHfJLis8ayftzNPJy1UYgeEEQLuNb0hSfhjg@mail.gmail.com>
In-Reply-To: <CAEQFVGYSV=boBYGHfJLis8ayftzNPJy1UYgeEEQLuNb0hSfhjg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 31 May 2022 15:08:50 -0700
Message-ID: <CAKwvOd=c=9xbzg0CjGxNnHtu3BOatWpe0gYQU7TWw0rkjwCCxA@mail.gmail.com>
Subject: Re: arch/x86/entry/entry: RFC on recent kernels building error with
 llvm 11.0.2 internal assembler
To: Mauro Rossi <issor.oruam@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, luto@kernel.org, 
	Chih-Wei Huang <cwhuang@android-x86.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 29, 2022 at 10:52 AM Mauro Rossi <issor.oruam@gmail.com> wrote:
>
>
>
> On Mon, May 9, 2022 at 2:07 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On Sat, May 07, 2022 at 02:19:00PM +0200, Mauro Rossi wrote:
>> > > > Alternatively, you could apply the hack that Nick inserted into Android
>> > > > for this issue if upgrading your toolchain or turning off the integrated
>> > > > assembler is not possible:
>> > > >
>> > > > https://android.googlesource.com/kernel/common/+/e58f084735b8abf744d61083b92172ee23d45aae
>> > > >
>> > > > I really do not mean to sound dismissive or rude, I apologize if it
>> > > > comes off that way, but we have worked quite hard to avoid inserting
>> > > > unnecessary workarounds, as they are ultimately technical debt that can
>> > > > be hard to manage over the long term.
>> > > >
>> > > > Cheers,
>> > > > Nathan
>> > >
>> > > Thanks a lot Nathan
>> > >
>> > > It is definitely the clang version 11.0.x which is not updated in aosp
>> > > Android 11 production tags
>> > >
>> > > I will use Nick's workaround which works since only lsl %rax, %rax is
>> > > currently happening
>> > >
>> > > Many thanks, problem solved
>> >
>> > Hello,
>> > I'm back again because I was assuming that Nick's workaround was working ok,
>> > but I have found that ARCH=x86_64 i.e. 64bit built kernel is causing
>> > an immediate hard reboot at initrd execution,
>> > just after hitting [ENTER] at grub/efi menu.
>>
>> It looks like there was a follow up fix for that workaround, maybe that
>> resolves this issue as well?
>>
>> https://android.googlesource.com/kernel/common/+/cc7f7a84191f5defc2ea4633eeea4acb4486b549
>>
>> > ARCh=x86 i.e. 32bit kernel binary is not affected, but is Nick's
>> > workaround targeting 32 bit kernel builds?
>>
>> No, the file that the build error originates from (entry_64.S) is only
>> built on x86_64.
>>
>> > How do aosp android-mailine kernels avoid this instantaneous hard reboot issue?
>>
>> That hack was reverted once the toolchain was upgraded:
>>
>> https://android.googlesource.com/kernel/common/+/ff0216d09fd31802537f2d1702ec2f3e9be73aa3
>> https://android.googlesource.com/kernel/common/+/3c2c8d8f7f2639e319212d10cb8df5bd13098dae
>>
>> Cheers,
>> Nathan
>
>
> Hello,
>
> sorry i still have the issue when building with hack "ANDROID: x86: entry: work around LLVM_IAS=1 bug in LSL"
> I'd just like to understand why I get instant reboot in 64bit kernel built with LLVM_IAS=1

As Nathan noted, I messed up the commit "ANDROID: x86: entry: work
around LLVM_IAS=1 bug in LSL". Please see:
https://android-review.googlesource.com/c/kernel/common/+/1521061
https://android-review.googlesource.com/c/kernel/common/+/1560152/

If you're using an older toolchain, you'll need just the first. If
you're using a newer toolchain, you'll need BOTH (or none, including
dropping "ANDROID: x86: entry: work around LLVM_IAS=1 bug in LSL").

>
> I searched for the places where #include "calling.h" is used
>
> utente@utente-3TB:~/r-x86_kernel/kernel$ grep -r \#include\ \"calling
> arch/x86/entry/thunk_64.S:#include "calling.h"
> arch/x86/entry/entry_32.S:#include "calling.h"
> arch/x86/entry/entry_64_compat.S:#include "calling.h"
> arch/x86/entry/entry_64.S:#include "calling.h"
>
> Probably the hardcoding done in the hack is impacting some other asm target built in 64 bit kernel and causes a wrong X86 instruction , is there a way to refine the #if to avoid that problem while still building with LLVM_IAS=1 ?
>
> Thanks for the info
> Mauro
>
>


-- 
Thanks,
~Nick Desaulniers
