Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BD57B
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 23:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A808C340F0;
	Thu, 31 Mar 2022 23:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1648768240;
	bh=NFb+yNIhAxcRdBorraIvjMJj3Pb3rD3DRavPneZciXo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lpAoQc5tibdSPze61eO+ml/nhHrCu7L/Zg0WX7RePjr1D8i8XGzYKWY3sY8MCmZYA
	 Bc5TpEcH2UU/sLbnu0eU9AdfAXm5vNwuEkeVcuxfNkRV8j4P+pb7XPdaYqJZQMrDgj
	 db/uCXp9mbc4kijnsqmFfPgJKeyCF1AO9s6YqVLQ=
Date: Thu, 31 Mar 2022 16:10:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrey Konovalov <andreyknvl@google.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, Johannes Weiner
 <hannes@cmpxchg.org>, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [hnaz-mm:master 29/122] arch/arm64/kernel/stacktrace.c:289:13:
 error: implicit declaration of function 'task_scs' is invalid in C99
Message-Id: <20220331161039.7ea889841228fa36e8387b93@linux-foundation.org>
In-Reply-To: <202203312049.zLjHyetm-lkp@intel.com>
References: <202203312049.zLjHyetm-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 31 Mar 2022 20:59:49 +0800 kernel test robot <lkp@intel.com> wrote:

> >> arch/arm64/kernel/stacktrace.c:289:13: error: implicit declaration of function 'task_scs' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            scs_base = task_scs(current);
>                       ^

Thanks.   Presumably this:

--- a/arch/arm64/kernel/stacktrace.c~arm64-implement-stack_trace_save_shadow-fix
+++ a/arch/arm64/kernel/stacktrace.c
@@ -213,6 +213,7 @@ noinline notrace void arch_stack_walk(st
 	walk_stackframe(task, &frame, consume_entry, cookie);
 }
 
+#ifdef CONFIG_SHADOW_CALL_STACK
 static const struct {
 	unsigned long ** __percpu saved;
 	unsigned long ** __percpu base;
@@ -293,3 +294,4 @@ out:
 	preempt_enable();
 	return len;
 }
+#endif		/* CONFIG_SHADOW_CALL_STACK */
_

