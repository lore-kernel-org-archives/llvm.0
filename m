Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0D410792
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 21:58:51 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so133883pjb.1
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 13:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678226331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iOhf16yBRlTqpgU2xhQ0C0E2y1FmHsBFKjMtFiPcqY=;
        b=jyPFABP0iq67dhiNelpg0gcKI68C81QtJN99IxQNCdbDw1Dl3mR6UglI4waySu+AaA
         R9rYlKxcqmRFIXfVdWuH69JglgjnH/RHmZJQjtAT2ZUBCrzNQ5ZbYTLL5q3UxxYvWRBs
         nq27YbkXIh9vZeARLzKdgy9kbQnpl58dz+rlcxQ79ZMIhNFikAnOIcVLU0hK1qClrwYT
         Ukjy251AvVgXfN2YUpnGH5/o31KDq6yvlnqiryouGYrYlAlQt9YR0PfKj2cbQXdaFhDv
         8XOkhsyoSUEyEtaTR8at7D3TdQ0MSdxuOrFDVNA2UXD2VzZ35GmKxxLLTFeuP8TDwxF9
         an3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678226331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8iOhf16yBRlTqpgU2xhQ0C0E2y1FmHsBFKjMtFiPcqY=;
        b=LrsYCbAe+hNGFjyXXVev4RO0PqYnGcziLIPpw6aBxEPCW6EJ7UeOA+V4mkE94/8kRZ
         wl9MV2HW9Aw2fixBq3NdxOKPUNeoISGUYsn2/w77eRExeiyG83RUwVwKDJ4Yk2/NVooX
         gdCTtPyBeejvCVSYNHmNz/zWG/hSSOkijzKMyas7K0ukDPxjh+/8L0w9oXXAy0gZBnAc
         NyLH4+8V9ldONYqpkw06GqBKPBMdAe/NJtGHGQV0vpuaw7rk6pY8K91GWV3ENXZwZ3Vw
         z3s3P+8jNNMQYvL99q4KepQLWZ065i1nRE8JhkVvZtK+OP9FmhqXByv0BNmD3VCZsy68
         qrLA==
X-Gm-Message-State: AO0yUKVctdR6SvpboXjSfxbLmcCSbwUVUb/9BBDhKU9rQOFO4GuyaMCq
	t2CCs535HArtPrCXOI0NVelU4qdccTk5FWsBFRS1Dw==
X-Google-Smtp-Source: AK7set+x/KTztFG24s7NOV/+Lsi388WnW3JQ8NmFTLQhBS7lZJKThP/yskEKi/aK81KfU8aOgZTY1nUa9FYCxuYANCg=
X-Received: by 2002:a17:90a:f10b:b0:23a:6ed6:7817 with SMTP id
 cc11-20020a17090af10b00b0023a6ed67817mr6026857pjb.5.1678226331109; Tue, 07
 Mar 2023 13:58:51 -0800 (PST)
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
 <CAHk-=whOLcy=oz=gHyoSSEnqc3M-APKFKTtTvA_3wYYPV8L+oA@mail.gmail.com>
 <CAHk-=whCA4-uc5WV_-68Mpmu-TiSv6fxkSjZ19zzcW9jpSxDvA@mail.gmail.com> <SJ1PR11MB60835681E8FE389EC0A1825DFCB79@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB60835681E8FE389EC0A1825DFCB79@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Mar 2023 13:58:39 -0800
Message-ID: <CAKwvOdn9cWJO96mpWAAUh4i37+ED=S5CFKPGP7jO0SdaRumgfA@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: "Torvalds, Linus" <torvalds@linux-foundation.org>
Cc: Jakub Jelinek <jakub@redhat.com>, Segher Boessenkool <segher@kernel.crashing.org>, 
	Peter Zijlstra <peterz@infradead.org>, "Eranian, Stephane" <eranian@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "Yu, Fenghua" <fenghua.yu@intel.com>, 
	"peternewman@google.com" <peternewman@google.com>, "james.morse@arm.com" <james.morse@arm.com>, 
	"babu.moger@amd.com" <babu.moger@amd.com>, "ananth.narayan@amd.com" <ananth.narayan@amd.com>, 
	"vschneid@redhat.com" <vschneid@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 1:35=E2=80=AFPM Luck, Tony <tony.luck@intel.com> wro=
te:
>
> > Ok, so here's a *ttoally* untested and mindless patch to maybe fix
> > what I dislike about that resctl code.
> >
> > Does it fix the code generation issue? I have no idea. But this is
> > what I would suggest is the right answer, without actually knowing the
> > code any better, and just going on a mindless rampage.
> >
> > It seems to compile for me, fwiw.
>
> Beyond compiling it boots and passes the tools/testing/selftests/resctrl =
test suite.
>
> Tested-by: Tony Luck <tony.luck@intel.com>

LGTM; reloading of current becomes irrelevant now that we're reusing
the existing variable `next_p`.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Might be nice to tag this for stable.

Cc: <stable@vger.kernel.org>

And credit Stephane who did a nice job tracking this down and having a
concise reproducer.

Reported-by: Stephane Eranian <eranian@google.com>

Perhaps relevant links

Link: https://lore.kernel.org/lkml/20230303231133.1486085-1-eranian@google.=
com/
Link: https://lore.kernel.org/lkml/alpine.LFD.2.01.0908011214330.3304@local=
host.localdomain/

Consider reusing parts of Stephane's message from the initial Link above?

Thanks for the patch.

---

While this issue was specific to the usage of `current` (implemented
as a macro that uses `this_cpu_read_stable`, I wonder if we might hit
issues again in the future (at least on x86 using the "p" constraint)
in code that:
1. uses this_cpu_read_stable to access a per cpu variable
2. updates that per cpu variable
3. uses this_cpu_read_stable to access the variable hoping to get the
new value rather than the old.

I guess that this_cpu_read should be used rather than
this_cpu_read_stable? Maybe we can beef up the comment in
arch/x86/include/asm/percpu.h to warn about this? The sentence about
get_thread_info() being a user of this_cpu_read_stable() seems
outdated/due for a refresh?

Is __switch_to the only place that should be updating current?  Are
there other variables other than current that might be afflicted by
that 1,2,3 pattern I mention above?

current_top_of_stack() uses this_cpu_read_stable() for instance.
Perhaps there could be a caller that measures the stack depth, grows
the stack, then rereads the wrong value?
--=20
Thanks,
~Nick Desaulniers
