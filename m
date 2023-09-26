Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6F75683
	for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 07:21:06 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-991c786369cso968293466b.1
        for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 00:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695712865; x=1696317665; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiYeuY+7qYY0k1eAxXgQW3L9mDlFbX6mh7WfKozi0Ws=;
        b=L59iDOMq5IpwLRPMHQ8QTPgSaX9R4m+oI5C/LujkLNo0XLv7Jo2U+kY5yHuvYS2/1A
         rhmZsPoYHjQCfOkjOKYta0lfnOTmh3Krw7E9rwt/P9oJQPcoffqlbpOxCz4a98mC5i+d
         NgNtgfi5WrObfKjT1d8fTEmMqjBFUwT4O+ai3WiFSbuyNZ6NYnrol4SeAKd9/NnN/hgi
         ky2k/zTFJWc3KZ9YXzfl218YacWDgmCBYCdxjcnZVTI5Ztfn1zb4tUr8KIHOfrJyNz+H
         9bHozJ/jfTpjk4WgirealDpnm+k6+zLWUa92xlItR0lRAP6+gIh33hBCC273mlJ7Kq9G
         bLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695712865; x=1696317665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiYeuY+7qYY0k1eAxXgQW3L9mDlFbX6mh7WfKozi0Ws=;
        b=E3fFxcE9wFD5xGp13O0v8KvM7Z/KWZdnjYcekkmQUxQAHaPRjGkZkzzrbvdfrQqWfH
         aZSr7w22ir2+cBHnf8pGVBn0Wl+53NA/uX/rS13voDsFOr8kanaOx0opppACAWNi4Z1q
         5P8ICfmt+pvj2kQE4OWGc4I+EW8718Q7AHH6ZMEt+LGqV9Yw04hOOsn+jFw1ocDNGXvI
         rvcIYckyFoFWqsM8YY5a0dYTnBttfWI8Te+SQLynIuiVKwUX2nNyB3mWUTu6iHk1OL1B
         2CIU0sZreTeB5o0HOxUC6yYkq6lqOZOFTbT7k6JsmFnf23TumnVr5Sy09ERNAvXPKcGq
         6t+w==
X-Gm-Message-State: AOJu0YxXreOph9OlWDp1+dpnH+oUTshQddmcxXPYtnSwDTzbwaM/Gms+
	1icGFz0+PkGiF99FaOPbE1dhNoB6vix2m4CnxgPHdg==
X-Google-Smtp-Source: AGHT+IHQL1RMWkkTVFqZepRkqMbil9xwSosZMjB+FwR5Yqry8TKUtkqXv4QFzwOkOAI5UQrtOdf0etmtWb18xzhxmDY=
X-Received: by 2002:a17:906:210a:b0:9ae:6bef:4a54 with SMTP id
 10-20020a170906210a00b009ae6bef4a54mr7318247ejt.3.1695712864698; Tue, 26 Sep
 2023 00:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230912-kselftest-param_test-c-v1-1-80a6cffc7374@google.com>
In-Reply-To: <20230912-kselftest-param_test-c-v1-1-80a6cffc7374@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 26 Sep 2023 16:20:52 +0900
Message-ID: <CAFhGd8on9_DJUZqT5uKgPzOtJNn99sY3TprcPzD5pm3GmYx8oQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/rseq: fix kselftest Clang build warnings
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping.

Looking to get this patch and [1] slated for 6.7 which fixes some
kselftest builds on older kernels.

On Wed, Sep 13, 2023 at 6:03=E2=80=AFAM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> When building with Clang, I am getting many warnings from the selftests/r=
seq tree.
>
> Here's one such example from rseq tree:
> |  param_test.c:1234:10: error: address argument to atomic operation must=
 be a pointer to _Atomic type ('intptr_t *' (aka 'long *') invalid)
> |   1234 |         while (!atomic_load(&args->percpu_list_ptr)) {}
> |        |                 ^           ~~~~~~~~~~~~~~~~~~~~~~
> |  /usr/local/google/home/justinstitt/repos/tc-build/build/llvm/final/lib=
/clang/18/include/stdatomic.h:140:29: note: expanded from macro 'atomic_loa=
d'
> |    140 | #define atomic_load(object) __c11_atomic_load(object, __ATOMIC=
_SEQ_CST)
> |        |                             ^                 ~~~~~~
>
> Use compiler builtins `__atomic_load_n()` and `__atomic_store_n()` with
> accompanying __ATOMIC_ACQUIRE and __ATOMIC_RELEASE, respectively. This
> will fix the warnings because the compiler builtins do not expect their
> arguments to have _Atomic type. This should also make TSAN happier.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1698
> Link: https://github.com/ClangBuiltLinux/continuous-integration2/issues/6=
1
> Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: Previous RFC https://lore.kernel.org/r/20230908-kselftest-param_tes=
t-c-v1-1-e35bd9052d61@google.com
> ---
>  tools/testing/selftests/rseq/param_test.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/se=
lftests/rseq/param_test.c
> index bf951a490bb4..20403d58345c 100644
> --- a/tools/testing/selftests/rseq/param_test.c
> +++ b/tools/testing/selftests/rseq/param_test.c
> @@ -1231,7 +1231,7 @@ void *test_membarrier_worker_thread(void *arg)
>         }
>
>         /* Wait for initialization. */
> -       while (!atomic_load(&args->percpu_list_ptr)) {}
> +       while (!__atomic_load_n(&args->percpu_list_ptr, __ATOMIC_ACQUIRE)=
) {}
>
>         for (i =3D 0; i < iters; ++i) {
>                 int ret;
> @@ -1299,22 +1299,22 @@ void *test_membarrier_manager_thread(void *arg)
>         test_membarrier_init_percpu_list(&list_a);
>         test_membarrier_init_percpu_list(&list_b);
>
> -       atomic_store(&args->percpu_list_ptr, (intptr_t)&list_a);
> +       __atomic_store_n(&args->percpu_list_ptr, (intptr_t)&list_a, __ATO=
MIC_RELEASE);
>
> -       while (!atomic_load(&args->stop)) {
> +       while (!__atomic_load_n(&args->stop, __ATOMIC_ACQUIRE)) {
>                 /* list_a is "active". */
>                 cpu_a =3D rand() % CPU_SETSIZE;
>                 /*
>                  * As list_b is "inactive", we should never see changes
>                  * to list_b.
>                  */
> -               if (expect_b !=3D atomic_load(&list_b.c[cpu_b].head->data=
)) {
> +               if (expect_b !=3D __atomic_load_n(&list_b.c[cpu_b].head->=
data, __ATOMIC_ACQUIRE)) {
>                         fprintf(stderr, "Membarrier test failed\n");
>                         abort();
>                 }
>
>                 /* Make list_b "active". */
> -               atomic_store(&args->percpu_list_ptr, (intptr_t)&list_b);
> +               __atomic_store_n(&args->percpu_list_ptr, (intptr_t)&list_=
b, __ATOMIC_RELEASE);
>                 if (rseq_membarrier_expedited(cpu_a) &&
>                                 errno !=3D ENXIO /* missing CPU */) {
>                         perror("sys_membarrier");
> @@ -1324,27 +1324,27 @@ void *test_membarrier_manager_thread(void *arg)
>                  * Cpu A should now only modify list_b, so the values
>                  * in list_a should be stable.
>                  */
> -               expect_a =3D atomic_load(&list_a.c[cpu_a].head->data);
> +               expect_a =3D __atomic_load_n(&list_a.c[cpu_a].head->data,=
 __ATOMIC_ACQUIRE);
>
>                 cpu_b =3D rand() % CPU_SETSIZE;
>                 /*
>                  * As list_a is "inactive", we should never see changes
>                  * to list_a.
>                  */
> -               if (expect_a !=3D atomic_load(&list_a.c[cpu_a].head->data=
)) {
> +               if (expect_a !=3D __atomic_load_n(&list_a.c[cpu_a].head->=
data, __ATOMIC_ACQUIRE)) {
>                         fprintf(stderr, "Membarrier test failed\n");
>                         abort();
>                 }
>
>                 /* Make list_a "active". */
> -               atomic_store(&args->percpu_list_ptr, (intptr_t)&list_a);
> +               __atomic_store_n(&args->percpu_list_ptr, (intptr_t)&list_=
a, __ATOMIC_RELEASE);
>                 if (rseq_membarrier_expedited(cpu_b) &&
>                                 errno !=3D ENXIO /* missing CPU*/) {
>                         perror("sys_membarrier");
>                         abort();
>                 }
>                 /* Remember a value from list_b. */
> -               expect_b =3D atomic_load(&list_b.c[cpu_b].head->data);
> +               expect_b =3D __atomic_load_n(&list_b.c[cpu_b].head->data,=
 __ATOMIC_ACQUIRE);
>         }
>
>         test_membarrier_free_percpu_list(&list_a);
> @@ -1401,7 +1401,7 @@ void test_membarrier(void)
>                 }
>         }
>
> -       atomic_store(&thread_args.stop, 1);
> +       __atomic_store_n(&thread_args.stop, 1, __ATOMIC_RELEASE);
>         ret =3D pthread_join(manager_thread, NULL);
>         if (ret) {
>                 errno =3D ret;
>
> ---
> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> change-id: 20230908-kselftest-param_test-c-1763b62e762f
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>

[1]: https://lore.kernel.org/all/20230908-kselftest-09-08-v2-0-0def978a4c1b=
@google.com/

Thanks
Justin
