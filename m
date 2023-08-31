Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08968F57
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 17:59:44 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-64b98479a66so5942696d6.0
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 10:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693504783; x=1694109583; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNeP4faEGIz+O2zm8651gblNuDZ+xOh/vxbaqfxrNIc=;
        b=5jBF4PMNwMmCddbTtFHofOrOZk92Vf3/1EMfN/W214MYPjaPWflwptCl3z3fXjXVGy
         1kd4+soJIwK72CJTaPP3kS50JNh9o5hKzxT0wyQoIlCZ/5WN07M+TiHrpSjiIZPDBU36
         Ti9nXs0OvB2WMkc3hIbcrCs2Qgh3kLo2Ocm1no1Da34KDiHt1IjdB+etseR1O5cSwKNl
         /AieKkvqd1xEamzbCMKZKcfvQ/IueI+fIDvnrvXMDBW547ZoiolgyX6QYB4EbJbH/6lx
         Q5x1iLzjn36NQJuT0HVjkhLy+SUkHqiIVbKcQ0S2HyYegzi43WMdvmGXa283eGkecFOo
         v6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693504783; x=1694109583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNeP4faEGIz+O2zm8651gblNuDZ+xOh/vxbaqfxrNIc=;
        b=VYHtRqj8o0DoialL697hNN0xOnfI4K7zvOj34IYnKDqv9MPpKa7WaICJOE42Um9ea/
         oRVA7TlUpU3ZSexp7LvwQ+H0CUWNhl0OJbmockFo5LWsoiKUpuhYtE6IowVSoJ2de5IL
         jKfyWA77PklhB4omNsVAtuo+PgDp1tAJTlWn3Bpdw4vzK0jhi6ZqC/CmEdwsqY2FFmAu
         HmmsuPWwXsHqoaaqprUSkoyLGJasL0PeG0mzH67BogsJ5n+ARsqM0qrPXR/BrZOdK4Hg
         5GtA3cPbZC7xlkfVjKJoLQqRTjSRyeRKn8WriEKs3lF51JwTFlSGMU07uzebWxWvAo6f
         VlZQ==
X-Gm-Message-State: AOJu0YxqmDNIY0cxt0ArN5iSO4J6jwS8970DP4sHyRFhkw/P6obcvIFw
	yAZY/gVXFYEdpvSJhYtkcVXBSEAqiUPw1Bh0WTgmKw==
X-Google-Smtp-Source: AGHT+IEaDoyGI3Gv4xWUfglkRLjOd+ls/Xqa6cKvsq9/l8oygJeF83su+BptjWiIyVoeNHCzqgi4DvktnYxVB0X3nmM=
X-Received: by 2002:a05:6214:4b94:b0:647:1c0f:5b8d with SMTP id
 qf20-20020a0562144b9400b006471c0f5b8dmr3303733qvb.21.1693504783330; Thu, 31
 Aug 2023 10:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230825050248.32681-1-andy.chiu@sifive.com> <ZPDIQEVaEJHXR5IW@google.com>
 <20230831-resize-spherical-4f46639097b8@spud> <676f392a-12bb-b9ce-0b69-7d27261eaf33@leemhuis.info>
In-Reply-To: <676f392a-12bb-b9ce-0b69-7d27261eaf33@leemhuis.info>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 31 Aug 2023 10:59:32 -0700
Message-ID: <CAKwvOdnGy_R_C3KsjMZ0+1+r0hVcqKrw9yDOUJuK=CCYL18gNg@mail.gmail.com>
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Conor Dooley <conor@kernel.org>, Andy Chiu <andy.chiu@sifive.com>, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, greentime.hu@sifive.com, 
	guoren@linux.alibaba.com, 20230816155450.26200-4-andy.chiu@sifive.com, 
	bjorn@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Qing Zhang <zhangqing@loongson.cn>, Baruch Siach <baruch@tkos.co.il>, Rolf Eike Beer <eb@emlix.com>, 
	llvm@lists.linux.dev, nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 10:50=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 31.08.23 19:17, Conor Dooley wrote:
> > On Thu, Aug 31, 2023 at 10:05:04AM -0700, Nick Desaulniers wrote:
> >> On Fri, Aug 25, 2023 at 05:02:46AM +0000, Andy Chiu wrote:
> >>> This patch add back the ptrace support with the following fix:
> >>>  - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
> >>>    conflicting with gdb's NT_RISCV_CSR.
> >>>  - Use struct __riscv_v_regset_state to handle ptrace requests
> >>>
> >>> Since gdb does not directly include the note description header in
> >>> Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
> >>> sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent futur=
e
> >>> conflicts.
> >>>
> >>> Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
> >>> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> >>
> >> Hi Andy, this is causing an instance of -Wunused-variable. PTAL.
> >>
> >> Please use the following tags on the fix:
> >>
> >> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> >> Closes: https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11f=
d@mx.google.com/
> >>
> >> Let's see if I can get the regzbot tag correct; first time trying it.
> >> #regzbot introduced dbe46b094026
>
> Nick, thx for trying, but FWIW, that's was slightly off, but there might
> be a easy workaround. To explain for anyone that cares:
>
> Due to that '#regzbot introduced ...' regzbot will consider the mail
> with the "#regzbot introduced dbe46b094026" (e.g. the msg from Nick with
> the msgid ZPDIQEVaEJHXR5IW@google.com) as a report for this regression
> and thus look out for patches and commits with a tag like this:
>
>  Closes: https://lore.kernel.org/all/ZPDIQEVaEJHXR5IW@google.com/
>
> Which is kinda correct, as your mail *is* a report about the regression,
> so some developer might use this. But in this case that's not what Nick
> wanted, as there was an earlier report that was even specified. But
> well, that might make it easy to fix, as we could simply tell regzbot
> about the duplicate.

Ah sorry about that. I tried.

I'm still unclear on what I should have done though.

Should I have replied to
https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@mx.google.c=
om/
with that same regzbot tag that I used instead?

> Nick could have done that in his mail, but I can do
> it in this one was well (as it's a indirect reply to the report from
> Nick that regzbot track) that 64f03ea1.170a0220.d3dbf.11fd@mx.google.com
> is a duplicate of ZPDIQEVaEJHXR5IW@google.com:
>
> #regzbot dup-of:
> https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@mx.google=
.com/

Thanks for cleaning that up; sorry for the mess.

>
> Let's see if this works. I haven't used this much, so maybe something
> might go sideways; but in theory this should work and then regzbot would
> do the right thing. At least normally:
>
> > See <20230830203754.24940-1-palmer@rivosinc.com> for the fix.
> >
> > That has you gave regzbot prob won't be stable though, branch needs a
> > rebase to add missing SoB tags from its committer.
>
> You mean the commit-id of the change currently known as dbe46b094026
> will change? Ughh, yeah, that's unfortunate and something regzbot is not
> yet prepared for.
>
> Hmmmm. Haven't had this case yet, as regzbot until now is not used much
> for -next. Not sure how to best handle that. Sure, regzbot could notice
> "the commit formerly known as cafec0c0 is now now c0c0cafe, as the
> subject, author, and modified files roughly match" -- but I'm not sure
> if that's a good idea, as developers like Conor might integrate simple
> fixes like the one for the problem at hand during the rebase. So maybe
> at this point it becomes "some human needs to look into this and tell
> regzbot what to do". :-/

How about if someone drops a patch after it's been reported to
regzbot?  Is there currently any way to instruct regzbot to "forget
about the previous report?"

Perhaps that's only a common workflow in -next.
--=20
Thanks,
~Nick Desaulniers
