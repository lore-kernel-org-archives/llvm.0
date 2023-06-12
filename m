Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1638EA8
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 16:38:35 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f62cf9755eso5326936e87.1
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686587913; x=1689179913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkQkCR0zK+G1VvzG47ybOhl6nFuB5nGWY9v59LgjCEc=;
        b=TFz7syu073g1TLL4KeZsNwWe7UtqoiPAh7S+IiXwa07W3+rqjKn/Enyh/XB3TkuP4S
         TqB2x8FBNEMLQj1VpMYL5A0l0usDika4psdZfJU7OzYWtTARLtsTHtsmy1KIWkni4ZRV
         AZVkJOdwOkptzTXP/yS253RHdR8qjkwoAwBik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686587913; x=1689179913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkQkCR0zK+G1VvzG47ybOhl6nFuB5nGWY9v59LgjCEc=;
        b=CiQKfc2L58mknvMvtWZoi+Bm8K1E2NKxd/MFlFTuryvERXLh6GeBO5ddYYr7QmUr6H
         zloS/GXjbTOZ7rTP4bPEcvSfWtJ+N97oAUzpi7GQPWYj5oWJoFGwvW+f7Vr0K+tunZl4
         JRDwm124vAM2FxQ5fbOhuF3YZsqine9Q3PfraoY3QNltlAEAXBPSp9mudKKJdKtDBTJF
         D1gtHvLhipVHduQGGfdXENsi5EpW8GNyOg1VxG//Z38d+jLGQ2JDxjvLv3YUNKWWVdOF
         bmMD+jf95QWVZD9iExh0/2EecriWM1M98p2oEE+TrrhenbkOoAmOq8ctM6G7oCPVSn5I
         rtxw==
X-Gm-Message-State: AC+VfDz3KCNj4wsz6I9T+o1hf7lRO+EKUfSIAxI6IBEkffOZwdjCHzE8
	zUkq2a4pCNnziwwzvfDoatrMQAnU/GsjCRj7p8dFz+mX
X-Google-Smtp-Source: ACHHUZ6T9CwbTUoyFhoVWCc3AqM9wWGtDWrWQQWGXEHUaAS4PwAty37/3Teqe9Lohq6rChuVB3I9UA==
X-Received: by 2002:a05:6512:54b:b0:4ed:b061:18ee with SMTP id h11-20020a056512054b00b004edb06118eemr4815762lfl.22.1686587913653;
        Mon, 12 Jun 2023 09:38:33 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id z14-20020a19f70e000000b004eeec1261ecsm1478879lfe.31.2023.06.12.09.38.33
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 09:38:33 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so5336392e87.2
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:38:33 -0700 (PDT)
X-Received: by 2002:a19:e30c:0:b0:4f6:1779:b1c1 with SMTP id
 a12-20020a19e30c000000b004f61779b1c1mr5015246lfh.48.1686587892415; Mon, 12
 Jun 2023 09:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org>
In-Reply-To: <20230612090713.652690195@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Jun 2023 09:37:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3jV+v63RA30eVpjHVyrGmmTF7d3ajdV=1wBU=5OHa=A@mail.gmail.com>
Message-ID: <CAHk-=wj3jV+v63RA30eVpjHVyrGmmTF7d3ajdV=1wBU=5OHa=A@mail.gmail.com>
Subject: Re: [PATCH v3 00/57] Scope-based Resource Management
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

On Mon, Jun 12, 2023 at 2:39=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> These are by no means 'complete' convertions, I've mostly focussed on fun=
ctions
> that had 'goto' in them. Since that's a large part of why I started on al=
l this.

So I found what looks like two patches being completely broken because
the conversion was fundamentally misguided.

And honestly, by the end of walking through the patches I was just
scanning so quickly that I might have missed some.

Let's make the rule be that

 - max 10 patches in the series so that I think they were actually
thought about, and people can actually review them

 - only clear "goto out of scope" conversions. When you see a
"continue" or a "goto repeat", you TAKE A BIG STEP BACK.

Because this is all clever, and I am now happy with the syntax, but I
am *not* happy with that 60-patch monster series with what looks like
horrible bugs.

             Linus
