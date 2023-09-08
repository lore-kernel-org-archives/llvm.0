Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490A30FA6
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 23:11:16 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-64f3ad95ec0so15266826d6.1
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 16:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694214675; x=1694819475; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDTUvYeB5jGMTHRnOd/srtZWnDGxuAwnUbNTB651Vz8=;
        b=ZRpL4m7liMq2o3pTmuCNEzGKaG5KFlZ5kGEUUKAmnCua+9hBt/9ITho2sFJzS4MsTy
         w4y2hEXcoYY+0KbmfWy8c/kzd9V584fon7zOAhYHn2vWFAGpm+2YKAYOdAJBwSFnld6I
         E82jg12lJZdWcm0704PAMMCahFRnVevO5P5/Hkyin50jfsNfKnTMtv9bkWpLqXuKxy88
         o008pwIYhVwCDbd8rS6otYu3ykR9vF2sjdffMBmiOW5D6Y9TSJoYGPUsBChoABgZI9cl
         glGT/j7CmB3Nrogfj8ftpmK9ghl7VJs0MHo+7l613I5j46NJbVs273ZpNVt8i6djfdHX
         JC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694214675; x=1694819475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDTUvYeB5jGMTHRnOd/srtZWnDGxuAwnUbNTB651Vz8=;
        b=hRW76nFhByCKugBSubP+z9THWKuyE4Z0GCy/TMrowvfvdCiJvzisRvBpzJuxevvz+7
         QUEfUbKnDVpUmPwbgz/kR7MGqcVvi3v7H7qe+AFIJVHtOa6vW2rH6W7f+0QaJifs2NkG
         gVQNNiolBj5DFzIw3SPYbDEo6Kuhqi9pCHQDyBdNsFOFG+nLE7iiPhER8JJUVESb1wrW
         ri5oXX7c3LtdbDEX/ktVnnWHdU0KhSgyjQDmYd22cvljjNcojZN8q5JA+cfJv5nW4xkw
         im+UTilbt3BgFDRHKZMClyKLb+wDwg+FLGds7TPwnNHLCRNuVBk34syQ6cZ9KPp2GRGW
         FlrQ==
X-Gm-Message-State: AOJu0Yyoy6TN9OeEJhLuRde1Q10wT2BtRRvEYLpZf0oEACA2/lagT2ee
	i2485Ru9ugOmGgnMDxc/QtcX3u2w3pjQ9Db3OnN0Bg==
X-Google-Smtp-Source: AGHT+IHBm938huR6rL9KgVhsO0HpRvBrmHcYgSI4aFO+O8kfuGNJWnGlfU8LhNRHyvY74s1J9yVY5FoczX/mhto/ZtI=
X-Received: by 2002:a0c:b2ce:0:b0:647:42dc:78c2 with SMTP id
 d14-20020a0cb2ce000000b0064742dc78c2mr3682354qvf.7.1694214674934; Fri, 08 Sep
 2023 16:11:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230908-kselftest-param_test-c-v1-1-e35bd9052d61@google.com>
In-Reply-To: <20230908-kselftest-param_test-c-v1-1-e35bd9052d61@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Sep 2023 16:11:03 -0700
Message-ID: <CAKwvOdmgh0XJi_at98KNwfPS4=Hq0+vkjT3SzTARZtEMyOx04w@mail.gmail.com>
Subject: Re: [PATCH RFC] selftests/rseq: fix kselftest Clang build warnings
To: Justin Stitt <justinstitt@google.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2023 at 4:03=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
>
> Hi,
>
> I am experiencing many warnings when trying to build tools/testing/selfte=
sts.
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

ah, so __c11_atomic_load is a compiler built in (similar to cstdint.h)
(see the path of the note diagnostic).

Your changes below look correct to me (except for the last hunk.
percpu_list_ptr is already an intptr_t, the cast seems redundant);
does GCC error with your below changes?

>
> I added the _Atomic type in various locations to silence _all_ (10) of th=
ese
> warnings. I'm wondering, though, perhaps the absence of these _Atomic
> types in the first place is on purpose? Am I on the right track to fix
> these warnings without damaging the legitimacy of the tests at hand?
>
> I'd like some feedback about where to go from here and if others are
> experiencing the same issues. Thanks!
>
> FWIW here's my specific build incantation on Clang-18 (49d41de57896e935cd=
5726719c5208bce22694ae):
> $ make LLVM=3D1 -j128 ARCH=3Dx86_64 mrproper headers defconfig kselftest-=
merge
> $ make LLVM=3D1 ARCH=3Dx86_64 -C tools/testing/selftests
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1698
> Link: https://github.com/ClangBuiltLinux/continuous-integration2/issues/6=
1
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  tools/testing/selftests/rseq/param_test.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/se=
lftests/rseq/param_test.c
> index bf951a490bb4..94802aeed2c6 100644
> --- a/tools/testing/selftests/rseq/param_test.c
> +++ b/tools/testing/selftests/rseq/param_test.c
> @@ -356,7 +356,7 @@ struct inc_thread_test_data {
>  };
>
>  struct percpu_list_node {
> -       intptr_t data;
> +       _Atomic intptr_t data;
>         struct percpu_list_node *next;
>  };
>
> @@ -1212,8 +1212,8 @@ static int set_signal_handler(void)
>  /* Test MEMBARRIER_CMD_PRIVATE_RESTART_RSEQ_ON_CPU membarrier command. *=
/
>  #ifdef TEST_MEMBARRIER
>  struct test_membarrier_thread_args {
> -       int stop;
> -       intptr_t percpu_list_ptr;
> +       _Atomic int stop;
> +       _Atomic intptr_t percpu_list_ptr;
>  };
>
>  /* Worker threads modify data in their "active" percpu lists. */
> @@ -1240,7 +1240,7 @@ void *test_membarrier_worker_thread(void *arg)
>                         int cpu =3D get_current_cpu_id();
>
>                         ret =3D rseq_offset_deref_addv(RSEQ_MO_RELAXED, R=
SEQ_PERCPU,
> -                               &args->percpu_list_ptr,
> +                               (intptr_t*)&args->percpu_list_ptr,
>                                 sizeof(struct percpu_list_entry) * cpu, 1=
, cpu);
>                 } while (rseq_unlikely(ret));
>         }
>
> ---
> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> change-id: 20230908-kselftest-param_test-c-1763b62e762f
>
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>


--=20
Thanks,
~Nick Desaulniers
