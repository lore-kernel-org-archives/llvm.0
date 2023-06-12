Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083431F18A
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 16:25:54 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-977d6aa3758so828004166b.0
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686587153; x=1689179153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/KCMaMkVpL2TvKmUhvddPCRbVA7+Ro9TFJ9/0bVSYQ=;
        b=KwbZsZJP1D2EQ+avK78in3jPsDZpolkW+2f9nYUY4kFPoaRvHYskpg1gSAMN6C4vhM
         FEOTMldWgFJ57NtR5u+eWHa/Yekznf7GPk29gIPgt2Chl7Maw6M835jQJ7grkRJQ8Q02
         ZrV/wka/qjL+/huUGCk+OpXQULhcGNUAJZT7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686587153; x=1689179153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/KCMaMkVpL2TvKmUhvddPCRbVA7+Ro9TFJ9/0bVSYQ=;
        b=QXnNJ2ToTGe0xAnrMsLmf8FJkTWUHL5cXQhtGg2FvAeovHt3fGYH62Yy1twyQ4FHCQ
         9Eg5TI9PVHsch3gHY3Qfpc17rZHOkHG1mDKowqYHX04k2rb9LHDInkekdknw+CsNiDc+
         p01ob+rjj35ui4UpzSp3e+IZiPMaSvDQIg9MGA537Bev0h0SDZeoCKnAO/+vcYsN4Yvi
         lvFelAcc8uNWPDrQc0Ui27qE8S8O5RAd4Q6MEfywM8ZWTTXj12eqMn+TcT7Rfc4q8yWe
         pZWZ3yJCylCpuah52lfyRfPq288aGpdxGef9cBchafNulnVl/82R3KlUJS4GuEAdTwcr
         dNFw==
X-Gm-Message-State: AC+VfDw5vVRv+fL5E4zxoU7FMAC7DUA/aFjqzrGPeasx0ytLvUsUM67d
	Prn2+RM+mYj7HBc1Rb5q6hwXKvbQK3jWZCJJ4OHO/Rc8
X-Google-Smtp-Source: ACHHUZ7meesats7OdweIsw5nkKdbGLDygPrHX+ZGalRQHLeR6BeCRGRWsnWnSQd26PxiKRMG9dzQEg==
X-Received: by 2002:a17:907:318e:b0:978:6a95:512d with SMTP id xe14-20020a170907318e00b009786a95512dmr9687001ejb.11.1686587152986;
        Mon, 12 Jun 2023 09:25:52 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906601400b00977d3fb2a7dsm5387428ejj.76.2023.06.12.09.25.52
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 09:25:52 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30fbfd517baso1016683f8f.2
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:25:52 -0700 (PDT)
X-Received: by 2002:aa7:d14e:0:b0:50b:c3f0:fb9d with SMTP id
 r14-20020aa7d14e000000b0050bc3f0fb9dmr5534541edo.41.1686586776585; Mon, 12
 Jun 2023 09:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org> <20230612093541.598260416@infradead.org>
In-Reply-To: <20230612093541.598260416@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Jun 2023 09:19:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh6JEk7wYECcMdbXHf5ST8PAkOyUXhE8x2kqT6to+Gn9Q@mail.gmail.com>
Message-ID: <CAHk-=wh6JEk7wYECcMdbXHf5ST8PAkOyUXhE8x2kqT6to+Gn9Q@mail.gmail.com>
Subject: Re: [PATCH v3 56/57] perf: Simplify perf_pmu_output_stop()
To: Peter Zijlstra <peterz@infradead.org>
Cc: keescook@chromium.org, gregkh@linuxfoundation.org, pbonzini@redhat.com, 
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com, 
	nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org, vkoul@kernel.org, 
	trix@redhat.com, ojeda@kernel.org, mingo@redhat.com, longman@redhat.com, 
	boqun.feng@gmail.com, dennis@kernel.org, tj@kernel.org, cl@linux.com, 
	acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, namhyung@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org, 
	frederic@kernel.org, quic_neeraju@quicinc.com, joel@joelfernandes.org, 
	josh@joshtriplett.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev, 
	42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com, 
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, john.johansen@canonical.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, llvm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, rcu@vger.kernel.org, 
	linux-security-module@vger.kernel.org, tglx@linutronix.de, 
	ravi.bangoria@amd.com, error27@gmail.com, luc.vanoostenryck@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch looks completely broken to me.

You now do

                if (err =3D=3D -EAGAIN)
                        goto restart;

*within* the RCU-guarded section, and the "goto restart" will guard it agai=
n.

So no. Sending out a series of 57 patches that can have these kinds of
bugs in it is not ok. By patch 56 (which just happened to come in
fairly early for me), all sane peoples eyes have glazed over and they
don't react to this kind of breakage any more.

                Linus

On Mon, Jun 12, 2023 at 2:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7977,7 +7977,8 @@ static void perf_pmu_output_stop(struct
>         int err, cpu;
>
>  restart:
> -       rcu_read_lock();
> +       /* cannot have a label in front of a decl */;
> +       guard(rcu)();
>         list_for_each_entry_rcu(iter, &event->rb->event_list, rb_entry) {
>                 /*
>                  * For per-CPU events, we need to make sure that neither =
they
> @@ -7993,12 +7994,9 @@ static void perf_pmu_output_stop(struct
>                         continue;
>
>                 err =3D cpu_function_call(cpu, __perf_pmu_output_stop, ev=
ent);
> -               if (err =3D=3D -EAGAIN) {
> -                       rcu_read_unlock();
> +               if (err =3D=3D -EAGAIN)
>                         goto restart;
> -               }
>         }
> -       rcu_read_unlock();
>  }
