Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEA87A
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 00:06:35 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31332df12a6so77588307b3.4
        for <llvm@lists.linux.dev>; Wed, 08 Jun 2022 17:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rWmXg+4rcMcMBm2s7YjpkCcdd6M/TYiOX6qHnnqhyKA=;
        b=XkDvHxg+l2pqP3tUpPa58TwUKa05NcHTh5rKdyaGOQmzJQmB087nmkq6wgL6e+SNSj
         YezaKK2Ngjf2oyEKZdCkOkKQoz5DRHYAlxWGSou39iNNyetkG7ZHRdUjnRBbJoJFUj/u
         oxD1AJsylzkyygyCGZu8bl7IcvM82z9V3zntDKSdk6H0cC5Q7kCbbOlaOMWFUNofU2Rf
         hKd4csBqWt2cr52DKZumxU9EfAKqEyhB6Ksh9HyiAaUL8EtglJ9Fr7j5d+BYtxDnpX96
         A9YyZNI3c2WIN9FOoZEv1ABNuINhTqIqN9kGXzJMjVhO3qfYW1+u82Vg4cBba8cusKU4
         Uxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rWmXg+4rcMcMBm2s7YjpkCcdd6M/TYiOX6qHnnqhyKA=;
        b=iovwwnYKziShcPffLilaCVKJz2QIdNq4nKcPiTX61h4LeKn1cqTnf1SeIOdcZetvmI
         gRK9o/joxOPn5fH+BeZeLpfA0PsTXxpgqOKlOH+HMBNtBMP1kp3tIH28sMtYD9FcjvqO
         edYiR31E1Kci8HsZjljxJArJ9ExyxMP77hCS2m4f8AL7xurxCf2/5rBiOT1TcEzjkS7u
         0fjJ2X/v2unyhrb3S5VgoxCqTHUVIov571ZK80v7cDoNksODgHti9rGUk8veU+s5XwBC
         IUru2QIJdGqJ0stfFtPcGOti6vzegZ/SRKYZItpS6rnGgMAR2LDmVOAKbSRCIrH5/T8c
         fqRA==
X-Gm-Message-State: AOAM533ExpF53WDegbB1QFpQmbF9H87hnfHEVqO3bjLRNdP+4VUHvNDR
	B5HRvUtBgkpGBEL602tgUcPORQwgEJk+pGzaOh8mpw==
X-Google-Smtp-Source: ABdhPJycg/VezgHOfXrGTsDTYajapWp9fPNJzHErESk4GuOmkrZZOMqTUdYdU0DF7IL5AGUlMcqg+z2tDRU4Ec0d+9E=
X-Received: by 2002:a05:690c:b85:b0:313:2fee:a601 with SMTP id
 ck5-20020a05690c0b8500b003132feea601mr13521777ywb.243.1654733194645; Wed, 08
 Jun 2022 17:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122170301.764232470@infradead.org> <20211122170805.338489412@infradead.org>
 <6ebb0ab131c522f20c094294d49091fc@overdrivepizza.com> <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com> <202202082003.FA77867@keescook>
 <9ea50c51ee8db366430c9dc697a83923@overdrivepizza.com> <20220211133803.GV23216@worktop.programming.kicks-ass.net>
 <Yh7fLRYl8KgMcOe5@google.com> <CAFP8O3JdYoMeF75XHCWue3fYG02W_95VGCU6AN+DYPj9F75kqw@mail.gmail.com>
In-Reply-To: <CAFP8O3JdYoMeF75XHCWue3fYG02W_95VGCU6AN+DYPj9F75kqw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 8 Jun 2022 17:05:58 -0700
Message-ID: <CABCJKueigY+oJ0HTV_YXKcTZG35ACxPE_YpKp_ZURgzxNYQ4WA@mail.gmail.com>
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
To: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Cc: Peter Collingbourne <pcc@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Kees Cook <keescook@chromium.org>, X86 ML <x86@kernel.org>, 
	hjl.tools@gmail.com, Josh Poimboeuf <jpoimboe@redhat.com>, andrew.cooper3@citrix.com, 
	LKML <linux-kernel@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 8, 2022 at 10:53 AM F=C4=81ng-ru=C3=AC S=C3=B2ng <maskray@googl=
e.com> wrote:
>
> Hi Peter,
>
> On Tue, Mar 1, 2022 at 7:06 PM Peter Collingbourne <pcc@google.com> wrote=
:
> >
> > Hi Peter,
> > One issue with this call sequence is that:
> >
> > On Fri, Feb 11, 2022 at 02:38:03PM +0100, Peter Zijlstra wrote:
> > > caller:
> > >       cmpl    $0xdeadbeef, -0x4(%rax)         # 7 bytes
> >
> > Because this instruction ends in the constant 0xdeadbeef, it may
> > be used as a "gadget" that would effectively allow branching to an
> > arbitrary address in %rax if the attacker can arrange to set ZF=3D1.
>
> Do you mind elaborating how this instruction can be used as a gadget?
> How does it look like?

With the offset of -4, the je instruction here can be an indirect call
target because it's preceded by a valid type hash at the end of the
cmpl instruction. If we change the offset to -6, only the ud2
instruction is a potential call target in this sequence, which will be
less useful to an attacker.

> The information will be useful to the summary of Sami's KCFI LLVM
> patch: https://reviews.llvm.org/D119296

I'll add more information about the X86 preamble to the description.

Sami
