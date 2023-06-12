Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48A91F189
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 17:44:18 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f61d79b0f2so5686356e87.3
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 10:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686591857; x=1689183857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFrxTaZ+omQeBxjp+PSzN1QlslHiKSQMtm5xmMsMGf8=;
        b=ckjky+OVKDKNy1oVAO91p7RQbUrTGS9lkA+1H5FON+ZtZXVSaCnwa2QjlqaIAUkdEw
         /3pTOcz9DJl5wPSHH8e7BtB7MC6+2y/74jAsEz6pjky+vYp/zZeNCZncVzvGtgDrQHNO
         pRGXoO4uQOjtzHWZGfsGiLYQSO8NRzdo/hoPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686591857; x=1689183857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFrxTaZ+omQeBxjp+PSzN1QlslHiKSQMtm5xmMsMGf8=;
        b=HGYUoXVCAZ4r8yLP1iuBAR8ZX0NI+2Oox8aiPN1jy2htrA+F0hh7VKSTXSTWt5Z+G4
         EV8s0SjAdRpWYNVJSF1dYjeZ/j64pk+9vm9OxLbPlp97kUhmVeqJVKO7A630tjjPoNTS
         UjmEho3DO0IpbU9ZViOBxODzQB3hbIeTcJLof98niRg1zE40MSZiDkJx0ZYUCjKlkuRm
         LhjrTSadyU1OhXRbfjbztHYeVmRqXsg7dCOo/iZf2w0LBuYAsY7FscG6jYjnCRJMNJxQ
         vEKHK9Y4Cgj2GWq0ZyV4IYv4a4CI5EuaCzh4W94iFC0WjIwa9wcAXeW077izHZ945hzi
         Zafw==
X-Gm-Message-State: AC+VfDwzp/yyPhl+sxVsHsbONrbvYg60LznBLgfPQFzwyA6iL55tl3SI
	5DI2MqCuPgXiehkLj1LhkBvC+dhTFmsMbaN6EYn+zM//
X-Google-Smtp-Source: ACHHUZ4/CFPAQhGaML600nz2zF6dmI5EoTZqyv34qMoYLvvyYD6Vn5edV5BII8CS6gYbfaSlApjvGw==
X-Received: by 2002:a19:2d12:0:b0:4ea:e60a:2f5d with SMTP id k18-20020a192d12000000b004eae60a2f5dmr4012942lfj.40.1686591856885;
        Mon, 12 Jun 2023 10:44:16 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id j15-20020ac2454f000000b004f38a139073sm1500201lfm.12.2023.06.12.10.44.16
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 10:44:16 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b219ed9915so54436341fa.3
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 10:44:16 -0700 (PDT)
X-Received: by 2002:a05:6402:399:b0:516:afe9:f6f9 with SMTP id
 o25-20020a056402039900b00516afe9f6f9mr5415434edv.35.1686591835245; Mon, 12
 Jun 2023 10:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org> <20230612093541.598260416@infradead.org>
 <CAHk-=wh6JEk7wYECcMdbXHf5ST8PAkOyUXhE8x2kqT6to+Gn9Q@mail.gmail.com> <ZIdR18xG1jy8WdEp@google.com>
In-Reply-To: <ZIdR18xG1jy8WdEp@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Jun 2023 10:43:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGypJwDLvTVbYENicw85n0gbxO7JXjiv9_a+95Br+UTg@mail.gmail.com>
Message-ID: <CAHk-=wjGypJwDLvTVbYENicw85n0gbxO7JXjiv9_a+95Br+UTg@mail.gmail.com>
Subject: Re: [PATCH v3 56/57] perf: Simplify perf_pmu_output_stop()
To: Sean Christopherson <seanjc@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, keescook@chromium.org, gregkh@linuxfoundation.org, 
	pbonzini@redhat.com, masahiroy@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, catalin.marinas@arm.com, 
	will@kernel.org, vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org, 
	mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com, dennis@kernel.org, 
	tj@kernel.org, cl@linux.com, acme@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, namhyung@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com, 
	joel@joelfernandes.org, josh@joshtriplett.org, mathieu.desnoyers@efficios.com, 
	jiangshanlai@gmail.com, rientjes@google.com, vbabka@suse.cz, 
	roman.gushchin@linux.dev, 42.hyeyoo@gmail.com, apw@canonical.com, 
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
	john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, llvm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, rcu@vger.kernel.org, 
	linux-security-module@vger.kernel.org, tglx@linutronix.de, 
	ravi.bangoria@amd.com, error27@gmail.com, luc.vanoostenryck@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 10:12=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> What if we require that all guarded sections have explicit scoping?  E.g.=
 drop
> the current version of guard() and rename scoped_guard() =3D> guard().  A=
nd then
> figure out macro magic to guard an entire function?

Hmm. I didn't love the excessive scoping, but most of the cases I was
thinking about were for the freeing part, not the locking part.

I agree that explicit scoping might be a good idea for locks as a
rule, but that "entire function" case _is_ a special case, and I don't
see how to do it sanely with a scoping guard.

Unless you accept ugly syntax like

    int fn(..)
    { scoped_guard(rcu)() {
         ...
    }}

which is just a violation of our usual scoping indentation rules.

Of course, at that point, the "scoped" part doesn't actually buy us
anything either, so you'd probably just be better off listing all the
guarding locks, and make it be

    int fn(..)
    { guard(rcu)(); guard(mutex)(&mymutex); {
         ...
    }}

or whatever.

Ugly, ugly.

End result: I think the non-explicitly scoped syntax is pretty much
required for sane use. The scoped version just causes too much
indentation (or forces us to have the above kind of special "we don't
indent this" rules).

> IIUC, function scopes like that will be possible once
> -Wdeclaration-after-statement goes away.

Well, "-Wdeclaration-after-statement" already went away early in
Peter's series, because without that you can't sanely do the normal
"__free()" cleanup thng.

But no, it doesn't help the C syntax case.

If you were to wrap a whole function with a macro, you need to do some
rather ugly things. They are ugly things that we already do: see our
whole "SYSCALL_DEFINEx()" set of macros, so it's not *impossible*, but
it's not possible with normal C syntax (and the normal C
preprocessor).

Of course, one way to do the "whole function scope" is to just do it
in the caller, and not using the cleanup attribute at all.

IOW, we could have things like

   #define WRAP(a,b,c) \
        ({ __typeof__(b) __ret; a; __ret =3D (b); c; __ret; })

and then you can do things like

   #define guard_fn_mutex(mutex, fn) \
        WRAP(mutex_lock(mutex), fn, mutex_unlock(mutex))

or

   #define rcu_read_action(x) WRAP(rcu_read_lock(), x, rcu_read_unlock())

and now you can easily guard the call-site (or any simple expression
that doesn't include any non-local control flow). Nothing new and
fancy required.

But when you don't want to do the wrapping in the caller, you do want
to have a non-scoping guard at the top of the function, I suspect.

                 Linus
