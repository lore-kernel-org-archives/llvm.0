Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C7361
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 05:56:19 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4652fcb2ac1so2100961e0c.1
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 22:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686635778; x=1689227778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXoP/SfXeEJ/3wkZUjDn660T9VLgrFL+TBUwgZAoObU=;
        b=XQJf3X4lN8oS49zFBjkLeCLT73gMnReO7VNvzKgh4x2A0oDZ9IfdC8NYH2M8Szouk/
         PDZCIPVMNwVq7DP2Di+oVXbCA6tOA71CKusNoJ/uOW6RLG4qakE4Axeb1w4BvkxS9aAL
         2iPTZu8JAkGDY4O46d6cZ5tCGjjsdA6wOcYQyP4bIcOGjw79G6PmMDaDQ5Y9hvakGjCR
         Vd05hcJxnKUAidAm5oF2X3ndQAwB+vLX2cywNsg/6EsiJ8kulGnV4PSp7XUDa5WC17LT
         kHkabuLodd5woElPKU7ZPlbWIMuNnkpNKsJ8I+fHTyf7O4XvuhN9qUjQVD8deFGEvc8E
         akLA==
X-Gm-Message-State: AC+VfDyA2woVJ/fgp0kZES8RSRS/Mim30cZNSqu3Jjjo2hYlUqjhWdvc
	DmYhCl7r4NKgRmXaR37CUWz9GrA44MiR+JOA9r0=
X-Google-Smtp-Source: ACHHUZ7Cj9u8WTOpvJ3k1N/xhXE9h8rxLIkzVesRwg9r4gsjesfbSe/X67dLrFf1E5Xf3TVgeqrXTm+8Y8tzoGTBqiw=
X-Received: by 2002:a1f:4386:0:b0:45d:5914:80b with SMTP id
 q128-20020a1f4386000000b0045d5914080bmr5911210vka.6.1686635778061; Mon, 12
 Jun 2023 22:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org> <20230612093539.371360635@infradead.org>
In-Reply-To: <20230612093539.371360635@infradead.org>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 12 Jun 2023 22:56:06 -0700
Message-ID: <CAM9d7cjz4cnEgV_oAnTOqyCWXDeD3ECYQFc=Uksct2-HKuFmiQ@mail.gmail.com>
Subject: Re: [PATCH v3 26/57] perf: Simplify event_function*()
To: Peter Zijlstra <peterz@infradead.org>
Cc: torvalds@linux-foundation.org, keescook@chromium.org, 
	gregkh@linuxfoundation.org, pbonzini@redhat.com, masahiroy@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu, 
	catalin.marinas@arm.com, will@kernel.org, vkoul@kernel.org, trix@redhat.com, 
	ojeda@kernel.org, mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com, 
	dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
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

Hi Peter,

On Mon, Jun 12, 2023 at 2:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Use guards to reduce gotos and simplify control flow.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/events/core.c |   39 ++++++++++++++++++++++++++-------------
>  1 file changed, 26 insertions(+), 13 deletions(-)
>
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -214,6 +214,25 @@ struct event_function_struct {
>         void *data;
>  };
>
> +typedef struct {
> +       struct perf_cpu_context *cpuctx;
> +       struct perf_event_context *ctx;
> +} class_perf_ctx_lock_t;
> +
> +static inline void class_perf_ctx_lock_destructor(class_perf_ctx_lock_t =
*_T)
> +{
> +       if (_T->cpuctx)
> +               perf_ctx_unlock(_T->cpuctx, _T->ctx);

Shouldn't it be called unconditionally?

Thanks,
Namhyung

> +}
> +
> +static inline class_perf_ctx_lock_t
> +class_perf_ctx_lock_constructor(struct perf_cpu_context *cpuctx,
> +                               struct perf_event_context *ctx)
> +{
> +       perf_ctx_lock(cpuctx, ctx);
> +       return (class_perf_ctx_lock_t){ cpuctx, ctx };
> +}
> +
>  static int event_function(void *info)
>  {
>         struct event_function_struct *efs =3D info;
> @@ -224,17 +243,15 @@ static int event_function(void *info)
>         int ret =3D 0;
>
>         lockdep_assert_irqs_disabled();
> +       guard(perf_ctx_lock)(cpuctx, task_ctx);
>
> -       perf_ctx_lock(cpuctx, task_ctx);
>         /*
>          * Since we do the IPI call without holding ctx->lock things can =
have
>          * changed, double check we hit the task we set out to hit.
>          */
>         if (ctx->task) {
> -               if (ctx->task !=3D current) {
> -                       ret =3D -ESRCH;
> -                       goto unlock;
> -               }
> +               if (ctx->task !=3D current)
> +                       return -ESRCH;
>
>                 /*
>                  * We only use event_function_call() on established conte=
xts,
> @@ -254,8 +271,6 @@ static int event_function(void *info)
>         }
>
>         efs->func(event, cpuctx, ctx, efs->data);
> -unlock:
> -       perf_ctx_unlock(cpuctx, task_ctx);
>
>         return ret;
>  }
> @@ -329,11 +344,11 @@ static void event_function_local(struct
>                 task_ctx =3D ctx;
>         }
>
> -       perf_ctx_lock(cpuctx, task_ctx);
> +       guard(perf_ctx_lock)(cpuctx, task_ctx);
>
>         task =3D ctx->task;
>         if (task =3D=3D TASK_TOMBSTONE)
> -               goto unlock;
> +               return;
>
>         if (task) {
>                 /*
> @@ -343,18 +358,16 @@ static void event_function_local(struct
>                  */
>                 if (ctx->is_active) {
>                         if (WARN_ON_ONCE(task !=3D current))
> -                               goto unlock;
> +                               return;
>
>                         if (WARN_ON_ONCE(cpuctx->task_ctx !=3D ctx))
> -                               goto unlock;
> +                               return;
>                 }
>         } else {
>                 WARN_ON_ONCE(&cpuctx->ctx !=3D ctx);
>         }
>
>         func(event, cpuctx, ctx, data);
> -unlock:
> -       perf_ctx_unlock(cpuctx, task_ctx);
>  }
>
>  #define PERF_FLAG_ALL (PERF_FLAG_FD_NO_GROUP |\
>
>
