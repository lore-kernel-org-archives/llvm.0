Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06433E3
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 17:16:48 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-bb15165ba06so4892020276.2
        for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686676608; x=1689268608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjLD3Z65AFUlnzGeDipyFAWU3jGU3OlZnyaKrjFl94c=;
        b=NJTC1I0w/bhJorLtWaQfWlvAtWyxNzM902NoozV2bocuew6IVQusNLYYsR92cHHh34
         unbOiMyrOlD3s/F94VX5GDu2SQjvEyrkkCVvXZv0vCl4WevU6AQ6ZIdMUFLUnckMLnKh
         1ggPVAdvsGV89dZLvZbdqcXLIhViqBG+eUvpfVmtpd9FUKi9KXDDsKu/A6ecBlK9bfFY
         U+GH0IuIyae8Z6r5rUNf6HTxjNB2s069SP7thqFKZP/qBRTz2uFWG6P8hHn/f7Y3ASQv
         h2+ET2Kjlc0MKvm5SWLSQbwT3w/z/0VybpT8padCUx9s5AgwciSPlOi/v4GahA52YR5P
         jKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686676608; x=1689268608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjLD3Z65AFUlnzGeDipyFAWU3jGU3OlZnyaKrjFl94c=;
        b=Ei0Lw87uprtlMMrXWjEde1A9Efem4rDb2nKSUDeaYefuPN8C4k8tCnd03pBpUku7CC
         JyzmxLPi8Ju5xAeZVGeOSDV8BWnCRy5mHgsSmgrje9/jcteVsP8rJKmg1XaPLSWmwMBh
         RPhwWUYgf8X1mdZ+ng+axvgbQ2eFdL9LENPnn98iZ4mO/V1vOjUiYkqLcaEcf/9nSdB+
         W1etF6oov0N4XatC7eaSEyPp6dLhL7E3oQ7STXuB5pChKrlE25E5J8swqfJd+MolC3rH
         kVJxL1S3lZkFA3z+tTrdPzc/e7UxUGMbDmuofreobpWBS1w5c7BcuPi54xwOZ/TWWqvm
         gHTA==
X-Gm-Message-State: AC+VfDwQrdL2I8zTtZtTD0ZD+VdI3pO0qs09yFiv8aOz7dsbLo0jj496
	pUAflrY3T7YA7tm//q9lhqEIEkv+qAORMbvJUuY=
X-Google-Smtp-Source: ACHHUZ51FK9fEEG9Y7UGxjZoDZTvO/ng3orwCtq1nFE6ZDFpN49YC8tIKpnu/txR4noRhPPPOhU9rPNQ8Cv9H8lanlM=
X-Received: by 2002:a25:8ca:0:b0:bc8:c035:cf4 with SMTP id 193-20020a2508ca000000b00bc8c0350cf4mr1912446ybi.17.1686676607731;
 Tue, 13 Jun 2023 10:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org> <20230612093537.614161713@infradead.org>
In-Reply-To: <20230612093537.614161713@infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Jun 2023 19:16:36 +0200
Message-ID: <CANiq72mTjNzLhfhax761CPDUHj=zC6qa6i3hobMWYaCvmgBAJQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/57] locking: Introduce __cleanup() based infrastructure
To: Peter Zijlstra <peterz@infradead.org>
Cc: torvalds@linux-foundation.org, keescook@chromium.org, 
	gregkh@linuxfoundation.org, pbonzini@redhat.com, masahiroy@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu, 
	catalin.marinas@arm.com, will@kernel.org, vkoul@kernel.org, trix@redhat.com, 
	ojeda@kernel.org, mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com, 
	dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, paulmck@kernel.org, frederic@kernel.org, 
	quic_neeraju@quicinc.com, joel@joelfernandes.org, josh@joshtriplett.org, 
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, rientjes@google.com, 
	vbabka@suse.cz, roman.gushchin@linux.dev, 42.hyeyoo@gmail.com, 
	apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com, 
	lukas.bulwahn@gmail.com, john.johansen@canonical.com, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, llvm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, rcu@vger.kernel.org, 
	linux-security-module@vger.kernel.org, tglx@linutronix.de, 
	ravi.bangoria@amd.com, error27@gmail.com, luc.vanoostenryck@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 11:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -77,6 +77,12 @@
>  #define __attribute_const__             __attribute__((__const__))
>
>  /*
> + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.=
html#index-cleanup-variable-attribute
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#cleanup
> + */
> +#define __cleanup(func)                        __attribute__((__cleanup_=
_(func)))
> +
> +/*
>   * Optional: only supported since gcc >=3D 9
>   * Optional: not supported by clang
>   *

`cleanup` goes before `const`, but apart from that, for compiler attributes=
:

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks for bringing RAII/SBRM to the kernel!

Rust also behaves like the `__cleanup__` attribute, e.g. iterating on
a loop destroys and constructs the variables defined inside the loop.
Also breaking to an outer label/scope.

By the way, maybe some of the macros in `cleanup.h` read a bit better
applying `clang-format` to it.

Cheers,
Miguel
