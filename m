Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5AC3C25
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GMlksJ5muipLr0Ufss/WSswgj2qownE6HhlJFXhcXlg=; b=cU3oyQGtkEUmxGbWClbMeeelRs
	vxSGpZddseeI1x0D9p03a9XJRKbw6nTfrB31Hag2GhfnMrFSPdMchQt+1BFlWgWQgmazte+xKlODj
	JXye9RT1RqO1iPu3qEFkVvyM8lVE29MbUfQTWv8hsP+cD34n40MHHGuB1D9bwIjPP2gmcZBM/gkIq
	OxIUxnjM4BEouIGZFT96Dc5YA48b2JpFckecUrcM8v0h8Wvv5tUsTIO+MTdqzBvJnnAgAU8dnpu+n
	RwS+ol5fNZGOFwVVd3n+3A6DWd2cQe8kzqsJNafRIkzslKTC7f6DRu2v7NDrRx6xKzRUdEBg9pSwV
	vSiiJTOw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q91gJ-009L6d-2I;
	Tue, 13 Jun 2023 10:55:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A79843002F1;
	Tue, 13 Jun 2023 12:55:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8D05424556032; Tue, 13 Jun 2023 12:55:22 +0200 (CEST)
Date: Tue, 13 Jun 2023 12:55:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: torvalds@linux-foundation.org, keescook@chromium.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com
Cc: masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
	vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org,
	mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com,
	dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
	adrian.hunter@intel.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org,
	frederic@kernel.org, quic_neeraju@quicinc.com,
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
Message-ID: <20230613105522.GU4253@hirez.programming.kicks-ass.net>
References: <20230612090713.652690195@infradead.org>
 <20230612093537.614161713@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612093537.614161713@infradead.org>

On Mon, Jun 12, 2023 at 11:07:16AM +0200, Peter Zijlstra wrote:

> --- /dev/null
> +++ b/include/linux/cleanup.h
> @@ -0,0 +1,167 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_GUARDS_H
> +#define __LINUX_GUARDS_H
> +
> +#include <linux/compiler.h>
> +
> +/*
> + * DEFINE_FREE(name, type, free):
> + *	simple helper macro that defines the required wrapper for a __free()
> + *	based cleanup function. @free is an expression using '_T' to access
> + *	the variable.
> + *
> + * __free(name):
> + *	variable attribute to add a scoped based cleanup to the variable.
> + *

	no_free_ptr(var):
	  like a non-atomic xchg(var, NULL), such that the cleanup
	  function will be inhibited -- provided it sanely deals with a
	  NULL value.

> + * return_ptr(p):
> + *	returns p while inhibiting the __free().
> + *
> + * Ex.
> + *
> + * DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
> + *
> + *	struct obj *p = kmalloc(...);

That should obviously have been:

	struct obj *p __free(kfree) = kmalloc(...);

> + *	if (!p)
> + *		return NULL;
> + *
> + *	if (!init_obj(p))
> + *		return NULL;
> + *
> + *	return_ptr(p);
> + */
> +
> +#define DEFINE_FREE(name, type, free) \
> +	static inline void __free_##name(void *p) { type _T = *(type *)p; free; }
> +
> +#define __free(name)	__cleanup(__free_##name)
> +
> +#define no_free_ptr(p) \
> +	({ __auto_type __ptr = (p); (p) = NULL; __ptr; })
> +
> +#define return_ptr(p)	return no_free_ptr(p)
