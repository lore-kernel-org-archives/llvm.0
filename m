Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40C7136A
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 19:43:05 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b3a9eae57cso24947735ad.1
        for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686685385; x=1689277385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=++RlJEGBoYZZIYZsRHYoBMeQspkNZr4R3QmKZH+3SVM=;
        b=H1q3jvV/pyh4iAygQto1xdexTU/nOQVTmlJXFt1V1I4T+zRrPD02k1089dAsxc1QZm
         waIS8XBlYOTH6cQJ3o3yQVaXu3IFlTlHBQEFUUYp9JEwAcf9n+cAWiIML/6H11PZcjZA
         keWtPgaY06BYpTYNOkXy5KeusVGGvYattkCMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686685385; x=1689277385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++RlJEGBoYZZIYZsRHYoBMeQspkNZr4R3QmKZH+3SVM=;
        b=SdPig/xXsZ+qEhCRtiovW0+iTIXZZuoBZVlAks8J6OE+6LdAz2ViGpB5usXFDeqmaq
         7AikKA4JZ4fpeZ52jqo3hWoxuHWIU/zA3N/FwZ0ZBtUchi1g4T6uEhTyRC6rllk4GHGu
         iQIRTkoBsyvkYfsJZ4WIND6bQGmISMNTBnEGNHDEegdgFJOhA47GM7Lrfyo/NsM/v7Bh
         b8+T9e9cqSvR6Mr6NfxFc7PJyPXcGXv3BjEXncElFRDcldd5swPYnsBQEybX5WySOayl
         QW2cxMaXOnXAtO3tya0LByJNDw8s38wx45QcbLDwkvDScsvYNxW+1G6U1MpkI0WEdXXA
         CXcA==
X-Gm-Message-State: AC+VfDzpZ0ZLUA1i8VebBdkK8WNnbjor2fzfr2iAlqg/yWS3b2y/pOR8
	bZvPoWahQIgV94QE4ZrrSwfdsg==
X-Google-Smtp-Source: ACHHUZ5K6eRjoeJmG56eUTKIiERD67E62TvQWKzLdYNBGkqzE1DRXsi0Qjm+hqShi0dhC4jE+A9sEQ==
X-Received: by 2002:a17:903:2284:b0:1b3:de1d:1ce9 with SMTP id b4-20020a170903228400b001b3de1d1ce9mr6725776plh.25.1686685385007;
        Tue, 13 Jun 2023 12:43:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jj21-20020a170903049500b001b3d0aff88fsm4291856plb.109.2023.06.13.12.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 12:43:04 -0700 (PDT)
Date: Tue, 13 Jun 2023 12:43:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, masahiroy@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, nicolas@fjasle.eu, catalin.marinas@arm.com,
	will@kernel.org, vkoul@kernel.org, trix@redhat.com,
	ojeda@kernel.org, mingo@redhat.com, longman@redhat.com,
	boqun.feng@gmail.com, dennis@kernel.org, tj@kernel.org,
	cl@linux.com, acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
	joel@joelfernandes.org, josh@joshtriplett.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
	42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com,
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
	tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH v3 28/57] perf; Simplify event_sched_in()
Message-ID: <202306131242.99E9B4A@keescook>
References: <20230612090713.652690195@infradead.org>
 <20230612093539.537454913@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612093539.537454913@infradead.org>

On Mon, Jun 12, 2023 at 11:07:41AM +0200, Peter Zijlstra wrote:
> Use guards to reduce gotos and simplify control flow.

Typoe in Subject: ";" should be ":"

-- 
Kees Cook
