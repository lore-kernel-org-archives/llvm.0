Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95C2136A
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 19:46:30 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-65299178ac5so6302347b3a.1
        for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 12:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686685590; x=1689277590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxeuPCO3GTvztmCaqFwBCrXNFMyoav37TQYPe5N2X2Q=;
        b=ZXwqdQSU/HiRRBmiMo0Q4BulnluPAh2ryLShUC8dzGZsPXV27BS3mYaNw52krhQxmi
         FDxiku3oDSIq7ETXuQ8zuIR6vPTTTiy5Uh+q09OiBHP7jNeYHGe8a87/wG4jR/UkKFXO
         m0LB4L/wA3k4VB+TGrW72v2AVbhniQkqNzr60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686685590; x=1689277590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxeuPCO3GTvztmCaqFwBCrXNFMyoav37TQYPe5N2X2Q=;
        b=V7OAfAsaepjzX/dzNp2DWAugiwddPCbCOoQ3AQdeD19j6jXRuxvwU4Nc6CYHvXI3EW
         CapaQ2/u3A73wJmvQDga8plyPa2m9xvZiy2vKZmuZbagKcLESy3gtA17iPScEVgMQQbs
         mO4RmyxqKHoLOC6M0oEmYi9nnwQw/GkBbM/2fkmQmmhJjp3h2ZDKJ6hM1EhngA6ppvPG
         0WzOdap9GKcbMD+3CoCjzu6e2mLvl+iZn3bzwUTFBuBOF7RDIMNTWDzgxmH9hdJQWx3k
         UuoLlaatx2cP4A4F0b0tIfTVsy7WmXyZc8R7R40Xe1TNda2pbys+Rq8bKJ67VWHUOO30
         pdcQ==
X-Gm-Message-State: AC+VfDwgrbV5WB8GjDY6wpD70jfiAB1RFcsM/HO3q8qw5jVQAE7Xo7Or
	BahvT2euzCUzrU48huwwE/B4vg==
X-Google-Smtp-Source: ACHHUZ6QoZj2j2xT9o9l+b/vey3qhd/bc3/I4+Ocqnd9vF/NQr0hTxNETlXiC+nwqY+RoRXFVuAZCA==
X-Received: by 2002:a05:6a20:3caa:b0:11d:2764:d9c1 with SMTP id b42-20020a056a203caa00b0011d2764d9c1mr2948441pzj.51.1686685589976;
        Tue, 13 Jun 2023 12:46:29 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y185-20020a6364c2000000b0053f2037d639sm9749233pgb.81.2023.06.13.12.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 12:46:29 -0700 (PDT)
Date: Tue, 13 Jun 2023 12:46:29 -0700
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
Subject: Re: [PATCH v3 03/57] locking: Introduce __cleanup() based
 infrastructure
Message-ID: <202306131244.E8DF4CA166@keescook>
References: <20230612090713.652690195@infradead.org>
 <20230612093537.614161713@infradead.org>
 <20230613105522.GU4253@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613105522.GU4253@hirez.programming.kicks-ass.net>

On Tue, Jun 13, 2023 at 12:55:22PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 12, 2023 at 11:07:16AM +0200, Peter Zijlstra wrote:
> 
> > --- /dev/null
> > +++ b/include/linux/cleanup.h
> > @@ -0,0 +1,167 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __LINUX_GUARDS_H
> > +#define __LINUX_GUARDS_H
> > +
> > +#include <linux/compiler.h>
> > +
> > +/*
> > + * DEFINE_FREE(name, type, free):
> > + *	simple helper macro that defines the required wrapper for a __free()
> > + *	based cleanup function. @free is an expression using '_T' to access
> > + *	the variable.
> > + *
> > + * __free(name):
> > + *	variable attribute to add a scoped based cleanup to the variable.
> > + *
> 
> 	no_free_ptr(var):
> 	  like a non-atomic xchg(var, NULL), such that the cleanup
> 	  function will be inhibited -- provided it sanely deals with a
> 	  NULL value.
> 
> > + * return_ptr(p):
> > + *	returns p while inhibiting the __free().
> > + *
> > + * Ex.
> > + *
> > + * DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
> > + *
> > + *	struct obj *p = kmalloc(...);
> 
> That should obviously have been:
> 
> 	struct obj *p __free(kfree) = kmalloc(...);

Okay, good. I noticed that too. :)

I also didn't see any users of the kfree helpers (maybe I missed them?)
Maybe add at least one conversion just to have an example conversion for
it too?

-Kees

-- 
Kees Cook
