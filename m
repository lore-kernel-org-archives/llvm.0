Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348E2647
	for <llvm@lists.linux.dev>; Wed,  8 Mar 2023 06:13:41 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-536bf92b55cso286559007b3.12
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 22:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678256020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiAc6iDNiFMAbN7UHWJQSh1sRq4ZHLyQcfVCvWd6xRw=;
        b=mep4iLM3eL4eFhiOCsS/C/HyLs4cXs6DifeXxcMOrrqxzXDttbjZu2izHtUGbdLycD
         hFA4+52CYusknxCEHXr2mloOTKwyu5QA8F3r9OvIswiOxosDQ4380j4kd+v63LSpZniQ
         1pT0iekZ7dxQQRXNs7gN4ZukO00mYjP/I4rsZq9mWxfdsv67AT5QUWANBSxZTK5lygkh
         gq7Dlt2hjG2JuTLfJMO++9lo3RMfbgTwzfhb7+p+CboPIzvnZJBIHkwLszTwNYdPDUPE
         eZxeVht1nkAUswvVLIApysmhwPgYj09UbTXAsQB3z3iWgNWYLg2Fgkpjf6T/H+6LD7Dr
         Kcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678256020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiAc6iDNiFMAbN7UHWJQSh1sRq4ZHLyQcfVCvWd6xRw=;
        b=z6em0Fr12IgF1Swv+a5La1AAk0kI8s2iVZwcJJi+uJ4OQDlIQh4haTKLCODv6niG0O
         Qdt8MbiFIdIfuevZiHnB8NHzOnopvyOoNMEbIPE88HoazlFAZjTxHpvQZeie+QEbGv/v
         Ts8GDzhq8/zLoiKNFC/DxFiGVNK5bSIgqqQHuHFeZlTWWRy0oOA4+hqi4SWp1kETZzGF
         PmC5Exzz7bZjVlS1RSB7Ugb75SW694khwl0XNWs7DafZMDjN6EsOFCmvkmM5/huiOfPS
         h/5GCr2JHmk+3KYsBeT9GCalZajSxcvBuRnyUS9DEdan/Eb26ZeViJqd5ACekKxDqD2r
         t5/g==
X-Gm-Message-State: AO0yUKX5WlxQDTf0CJ5MXEHqS42/939F5Kk13oykSItZupBM9O+r52uT
	MA8S+CP12ccFSALX8dp9UFzPbDuQCKNPNt0tyUObBA==
X-Google-Smtp-Source: AK7set9UbRfrxNxvgobWGUcgdwtDtWG8t/xs600BkL3DO9PrcoHUe3E4qN7u6XXOYIq6o2g3mGjHmvLGAGNz1IbbWf4=
X-Received: by 2002:a81:a9c8:0:b0:53c:6fda:835f with SMTP id
 g191-20020a81a9c8000000b0053c6fda835fmr10410255ywh.0.1678256019925; Tue, 07
 Mar 2023 22:13:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303231133.1486085-1-eranian@google.com> <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
 <CAKwvOdnRvd5KK01awAyeyt5S36TPPW4_8Z6YL1r4gB-pBrHTbg@mail.gmail.com>
 <20230307113545.GB2017917@hirez.programming.kicks-ass.net>
 <20230307184315.GS25951@gate.crashing.org> <ZAeh8g0nr3IFRSVI@tucnak>
 <CAHk-=whOLcy=oz=gHyoSSEnqc3M-APKFKTtTvA_3wYYPV8L+oA@mail.gmail.com> <CAHk-=whCA4-uc5WV_-68Mpmu-TiSv6fxkSjZ19zzcW9jpSxDvA@mail.gmail.com>
In-Reply-To: <CAHk-=whCA4-uc5WV_-68Mpmu-TiSv6fxkSjZ19zzcW9jpSxDvA@mail.gmail.com>
From: Stephane Eranian <eranian@google.com>
Date: Tue, 7 Mar 2023 22:13:27 -0800
Message-ID: <CABPqkBR_U06L8skMsDXxSXfMptezequzRCxOTELAXxGDK+F+DA@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakub Jelinek <jakub@redhat.com>, Segher Boessenkool <segher@kernel.crashing.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kernel@vger.kernel.org, tony.luck@intel.com, reinette.chatre@intel.com, 
	fenghua.yu@intel.com, peternewman@google.com, james.morse@arm.com, 
	babu.moger@amd.com, ananth.narayan@amd.com, vschneid@redhat.com, 
	Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 1:06=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Mar 7, 2023 at 12:54=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I think the problem is that the <asm/resctrl.h> code is disgusting and
> > horrible in multiple ways:
> >
> >  (a) it shouldn't define and declare a static function in a header file
> >
> >  (b) the resctrl_sched_in() inline function is misdesigned to begin wit=
h
>
> Ok, so here's a *ttoally* untested and mindless patch to maybe fix
> what I dislike about that resctl code.
>
> Does it fix the code generation issue? I have no idea. But this is
> what I would suggest is the right answer, without actually knowing the
> code any better, and just going on a mindless rampage.
>
> It seems to compile for me, fwiw.
>

On Tue, Mar 7, 2023 at 3:01=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Tue, Mar 7, 2023 at 2:56=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, Mar 7, 2023 at 2:03=E2=80=AFPM Nick Desaulniers <ndesaulniers@g=
oogle.com> wrote:
> > >
> > > Sounds like Stephane is going to re-run the internal tests he used to
> > > discover the issue with your diff applied, if you don't mind holding
> > > out for another Tested-by tag. EOM
> >
> > Ack. I am in no hurry.
> >
> > In fact, I'd prefer to just get the patch sent back to me with a
> > commit message too, if somebody has the energy. I don't need the
> > credit for a trivial thing like that.
>
> Sure, then maybe Stephane you can supply a v2 with updated commit message=
 and a
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>
I verified Linus' patch on my test case on AMD Zen3 and it works as
 expected, i.e., the limit is enforced. I had tried a similar approach myse=
lf
as well and it worked.

I think passing the task pointer is the proper approach because we are
in a sched_in routine
and I would expect the task scheduled in to be passed as argument
instead of having the function
retrieve it from the current pointer.

Thanks.

Tested-by: Stephane Eranian <eranian@google.com>

>              Linus
