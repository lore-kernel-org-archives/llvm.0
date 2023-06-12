Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4377C1F18A
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 16:27:50 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so5319006e87.2
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686587268; x=1689179268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQ64AB6vFE2gCnLICKj93uVfxKBboA+BfLd8wCYY+0E=;
        b=GGYYVsoEcCvOtMCbQCEGpMUTlLitinee+4cI9TY/ECPn0E8/1r157Y1iWtRQZ5Cxac
         YySzailK3aA1bQM+Cjs0E12G9OqfTX3Z3pQzA5iBMVhUQanNMp1U2QAnfBSSY2BGgPBq
         0Sf9MB5K4qnDVr0F92Hc/BAulYDYNJRzwbr0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686587268; x=1689179268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ64AB6vFE2gCnLICKj93uVfxKBboA+BfLd8wCYY+0E=;
        b=PTqgXXy4O7gigtnrIdor8iXbxqO8isQjYzNMfsL9D+KrE8JCWfDLW98YrjUtCuIxSm
         oaVcN9rI9IMPwG/FE8Xwh/IsFdFxSRQY/3+1IyFF9P5YJZGst+a7pG2zlXpi2ymtwycr
         yGUmQtfVpKFUky25j3WEUVzw57XRQx0CuIOcmHkxihrmXELiNlJjzxhlz37cPzpgvR5A
         khangvZZZnHeAV7y8G03fK/Bceu9lft2Ntw7PKrreEwWWrjzSWQ1WiDmW3EIVHroJN2k
         xPU5PFtMZUUT6/sqFKW0B5INfWQ0A+/xB0WHaH4WQCsVyNYy1mxrIWRxpVxmtBmH6gfl
         fdIQ==
X-Gm-Message-State: AC+VfDzTsEXJVqHibUZRIYglrB6nSe3zwEyu8RZ+wX6aXwgvd4zcXiCd
	Z3+YKTmuW8EKLLz568N3aB2NM9K2XVHGL0e7bwubMclN
X-Google-Smtp-Source: ACHHUZ6LY8n+cUvuw2Tomt9rASsZD4ADnSUW+yI/Zj+oUu7VBM8wi30xM1N2mB5wsTOuBOnRP3fI9g==
X-Received: by 2002:a2e:88d3:0:b0:2a8:ad36:f8ca with SMTP id a19-20020a2e88d3000000b002a8ad36f8camr3391756ljk.14.1686587267906;
        Mon, 12 Jun 2023 09:27:47 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a13-20020a170906684d00b0096f7500502csm5429349ejs.199.2023.06.12.09.27.46
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 09:27:47 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f732d37d7bso34456945e9.0
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:27:46 -0700 (PDT)
X-Received: by 2002:a05:6402:6d3:b0:514:93b2:f3b1 with SMTP id
 n19-20020a05640206d300b0051493b2f3b1mr5343956edy.40.1686587246075; Mon, 12
 Jun 2023 09:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612090713.652690195@infradead.org> <20230612093539.895253662@infradead.org>
In-Reply-To: <20230612093539.895253662@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Jun 2023 09:27:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPtj9Y+nkMe+s20sntBPoadKL7GLxTr=mhfdONMR=iZg@mail.gmail.com>
Message-ID: <CAHk-=wgPtj9Y+nkMe+s20sntBPoadKL7GLxTr=mhfdONMR=iZg@mail.gmail.com>
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

This seems to have the same pattern that I *think* it's entirely
broken, ie you are doing that

                guard(perf_pmu_disable)(event->pmu);

inside a loop, and then you are randomly just removing the

               perf_pmu_enable(event->pmu);

at the end of the loop, or when you do a "continue"./

That's not right.

The thing does not not go out of scope when the loop *iterates*.

It only goes out of scope when the loop *ends*.

Big difference as far as cleanup goes.

So you have not "simplified" the unlocking code, you've broken it. Now
it no longer locks and unlocks for each iteration, it tries to re-lock
every time.

Or have I mis-understood something completely?

               Linus
