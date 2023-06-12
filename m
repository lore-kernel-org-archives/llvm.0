Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C459522D
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 18:56:38 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f62b512fe2so5799651e87.1
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 11:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686596196; x=1689188196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yhv8xsO6/cG6/37ib7eGERu4MLsFMvugXkXspF4Zlg=;
        b=BQ66SffTkiwLponLu2M0sKvRSdcsOXbamK3UKhI+a7RLU2rMKkthYacV1ugb2b9RiE
         zGUtZDxY8FH/08VJXv2yJYmZ0igHh0gLxENvYJM+EjiA6Rmiqs5C2vXi+fpqNcBdRhJq
         5eguFpArP+NPXWSY0yvkTTh0BeA5ENQBmhw5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686596196; x=1689188196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yhv8xsO6/cG6/37ib7eGERu4MLsFMvugXkXspF4Zlg=;
        b=edK2M8Ju8fvilX0uW0GSsLUjnMAicDadrrX1nLKnjUehLOnloPFQf61wzPRcqfDQo/
         YHXgYHIKz8ohz9nwi6er7AP9rKcZwS4DvLPHjDQU7rrJSSM7ouQx2D14TVaOx87cWxPY
         9lIPemGxqAVtZEmMEeRAPvnW93mvY1gUuzxVWxp3CHJcVaKzo99ClcmkhwDzRVtTuFGa
         IvlUt01R8XQ3owCuSg4hirB/mmYncVAHQocwYnzzRdFqS3A7mHuAjPvD+3/snexSHzxm
         tHJyLpIkzfQ1GUCnDXcvd/+R8ZeKpISTRhnrKYXjDUqxuKpgXZ6ZCiY9+S7x2m47JNjp
         J+Vw==
X-Gm-Message-State: AC+VfDypdpaeA1YsheMyJHhv7nHZpbQj2yoQFQqI+v+qOB/CTVPr09zp
	alBE61E6WDxHjsPc6Sk47Z/76nuPVXemERCfzWec/3tM
X-Google-Smtp-Source: ACHHUZ7zY3zGqoQbr/SJRKCq0LWvdpMrFMMP8HbepMXMANs106j077o5WMA9dGSrZCxctQfLAB57OA==
X-Received: by 2002:a2e:b0cc:0:b0:2ac:8262:322a with SMTP id g12-20020a2eb0cc000000b002ac8262322amr3219885ljl.13.1686596196187;
        Mon, 12 Jun 2023 11:56:36 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id g19-20020a2e9cd3000000b002b22a697f32sm1488624ljj.125.2023.06.12.11.56.35
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 11:56:35 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f61d79b0f2so5792578e87.3
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 11:56:35 -0700 (PDT)
X-Received: by 2002:aa7:d841:0:b0:516:b182:4e58 with SMTP id
 f1-20020aa7d841000000b00516b1824e58mr5590497eds.32.1686596174182; Mon, 12 Jun
 2023 11:56:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org> <20230612093539.895253662@infradead.org>
 <CAHk-=wgPtj9Y+nkMe+s20sntBPoadKL7GLxTr=mhfdONMR=iZg@mail.gmail.com> <20230612184403.GE83892@hirez.programming.kicks-ass.net>
In-Reply-To: <20230612184403.GE83892@hirez.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Jun 2023 11:55:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgaSkM4fjdP9dcdXQpLLjxW43ykgLA=FgzyHpyHayz8ww@mail.gmail.com>
Message-ID: <CAHk-=wgaSkM4fjdP9dcdXQpLLjxW43ykgLA=FgzyHpyHayz8ww@mail.gmail.com>
Subject: Re: [PATCH v3 33/57] perf: Simplify perf_adjust_freq_unthr_context()
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

On Mon, Jun 12, 2023 at 11:44=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> I tried this before I used it and variables inside a for() loop have a
> scope of a single iteration.

Whee. Ok, that surprised me. But I guess that I shouldn't have found
it surprising, since the value doesn't survive from one iteration to
the next.

My mental picture of the scope was just different - and apparently wrong.

But thinking about it, it's not just that the value doesn't survive,
it's also that the "continue" will exit the scope in order to go back
to the "for()" loop.

I guess the "goto repeat" ends up being similar, since - as Ian Lance
Taylor said in one of the earlier discussions - that "__cleanup__"
ends up creating an implicit hidden scope for the variable. So a
'goto' to before the variable was declared implicitly exits the scope.

Ugh. I do really hate how subtle that is, though.

So while it might not be the horrible bug I thought it was, I'd
_really_ like us to not do those things just from a sanity angle.

                 Linus
