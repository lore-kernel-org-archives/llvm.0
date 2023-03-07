Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF8F10790
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 20:54:28 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id a25so57854827edb.0
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 12:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678222466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1a1wUr/c8UneDltFnq/GcX6Q8fOFZMqB2rkkJLxpEA=;
        b=XIJJTVgIT+AVhBOORg7yRYeI94BowK63iVir8mAZ8dd7IJRr1kxxTM8r1A0dkkcIE/
         G2IHRZXSRBMADyL28L1EjIefgh02/aKVGYh1ynqHtaDhlBFdvSJz9O2AozSFFUyoimr4
         Szehtqu3fuXj4o6ZYzAW7ICW+oJSEmorrYJtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1a1wUr/c8UneDltFnq/GcX6Q8fOFZMqB2rkkJLxpEA=;
        b=EYj3oYaEZo/vPcD/XMdk0pdUeEuyTreyfvRiiryW1FJPDczzMREPME5LV6mczkxN6x
         PGs+B1HifDHEpvnbScoJTlGinKSziFNqlR618DeBViCitND2w4q8h9AH0Ft+K8LsWlGj
         0OVNf22v4CELhT6h+KUvBGEz285TfQAH3F+jDgrHAnzCpqyN1HbZvFMt6efOknOZ/fJQ
         DldX/aB3fO7T4MmOglnnUXEzAUFiE81OWRbc6JyAGPkCADn7aI95MWhMBdDG0ljZ0aAc
         IlEjFYB9Bstim/m/9QUq/p1Df3sSBTWTSoaaSa6QPx6ulJElpEHOXnhnNn8HITfdiNxQ
         lUdw==
X-Gm-Message-State: AO0yUKXKZ/QTyTTRyOFL1hhXusvZb6CnwReZ6MURDc0p/GezccNL/KVf
	HHdzLxIxFPuD0VVlrYEbNvRty3PpyRhf6ToOEBfg9mhf
X-Google-Smtp-Source: AK7set+LC0raT529BlZRSNri0eTfYKH3XwiJZvhYgFhcLzWaG4jGQ2+hNknSVwAP6B9x0PCUCxsBXA==
X-Received: by 2002:aa7:dd0b:0:b0:4af:81f1:5ae4 with SMTP id i11-20020aa7dd0b000000b004af81f15ae4mr15420354edv.15.1678222465778;
        Tue, 07 Mar 2023 12:54:25 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id h7-20020a50cdc7000000b004bc15a440f1sm7315521edj.78.2023.03.07.12.54.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 12:54:25 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id cw28so57643871edb.5
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 12:54:24 -0800 (PST)
X-Received: by 2002:a50:cd94:0:b0:4c2:1a44:642e with SMTP id
 p20-20020a50cd94000000b004c21a44642emr8987314edi.5.1678222464569; Tue, 07 Mar
 2023 12:54:24 -0800 (PST)
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
In-Reply-To: <ZAeh8g0nr3IFRSVI@tucnak>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Mar 2023 12:54:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=whOLcy=oz=gHyoSSEnqc3M-APKFKTtTvA_3wYYPV8L+oA@mail.gmail.com>
Message-ID: <CAHk-=whOLcy=oz=gHyoSSEnqc3M-APKFKTtTvA_3wYYPV8L+oA@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: Jakub Jelinek <jakub@redhat.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Stephane Eranian <eranian@google.com>, 
	linux-kernel@vger.kernel.org, tony.luck@intel.com, reinette.chatre@intel.com, 
	fenghua.yu@intel.com, peternewman@google.com, james.morse@arm.com, 
	babu.moger@amd.com, ananth.narayan@amd.com, vschneid@redhat.com, 
	Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 12:43=E2=80=AFPM Jakub Jelinek <jakub@redhat.com> wr=
ote:
>
> Are we actually talking here about "p" constraint or about p/P (x86) modi=
fiers
> (asm ("%p0" : : "i" (42));)?

In this case it's actually the "p" constraint.

And the "percpu_stable_op()" thing uses it exactly because it thinks
it wants the "I don't care about data dependencies in memory, because
this memory location doesn't change".

Of course, that "this memory location doesn't change" is then always
technically a lie. It's exactly things like "current" that obviously
*does* change in the big picture, but from the context of a particular
_thread_, "current" is a fixed value.

Which then causes problems when you use that "percpu_stable_op()"
thing from within the scheduler (generally without being *aware* of
this issue at all, since the use is hidden a few macro expansions
down).

I think the problem is that the <asm/resctrl.h> code is disgusting and
horrible in multiple ways:

 (a) it shouldn't define and declare a static function in a header file

 (b) the resctrl_sched_in() inline function is midesigned to begin with

basically, the actual scheduling functions should *never* look at
"current" at all. They are - byu definition - changing it, and they
already *know* what both the "incoming current" (aka "prev_p") and
"new current" (aka "next_p") are.

So any scheduling function that uses "current" is hot garbage.

In this case, that hot garbage is resctrl_sched_in().

I do not believe this is a compiler issue. This is literally just a
kernel bug, and that resctrl code being very very wrong.

              Linus
