Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD123921D1;
	Tue, 13 Jan 2026 17:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326483; cv=none; b=kIsijbh7diYASCXkXnoADbXAUEECHyVg6v7myz836k8nsoCGkcpK/5ZEaRaqMf3ExjI3bGlFioD1D+OtF+AqilO6M3b1e9i13ExxXgYeFYbAvqliUILyIiE2Cs2wNlFamX4wWhasIl9MWiqUw+Zahf2JeZBPa0QbNTc3gqkmOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326483; c=relaxed/simple;
	bh=fho/6LES9b2wOoZ4zL2IQJlpYc+Ky63LIbZXUvbTdWc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=RPJczIOVW8zyPZwQHhNOfXPGNeusDsxn0F0c4eyTu3iCTChmYA7O9c21ujgmhefYb/44ikoBsdhWefUEN0SGocmxHpQBtJ9EySu1Cjyjsn4/05wMOwvN8JUAzBi1aKrVGokNdn/8DsXaSeTVHr8+ijwYcO8ggUIOiU7gK9zZrGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OpGZ3yss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OpGZ3yss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A041FC116C6;
	Tue, 13 Jan 2026 17:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768326482;
	bh=fho/6LES9b2wOoZ4zL2IQJlpYc+Ky63LIbZXUvbTdWc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OpGZ3yssRspFyzKe0wuuKWibepGV8CX9QpjqywYEBNasl/uWFX18DeVp3G2Owc6z6
	 9s5Vnyaf+U+EUIR8hehPDgyxDJJHqv8hb/VrNs7ZAJdOupkJbpsWYjVzqTmB6PMqpS
	 LSzs87KxCwNNwy2CPBrpYr3ut8OxuiXJDMs5onxk=
Date: Tue, 13 Jan 2026 09:48:01 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Petr Mladek <pmladek@suse.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 77/129]
 arch/loongarch/net/bpf_jit.c:1322:7: error: call to undeclared function
 '__bpf_address_lookup'; ISO C99 and later do not support implicit function
 declarations
Message-Id: <20260113094801.d3c7b9d327959c6bcb8f4db6@linux-foundation.org>
In-Reply-To: <202601140159.I4b0kwpE-lkp@intel.com>
References: <202601140159.I4b0kwpE-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Jan 2026 01:37:38 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   01c8de771f4a779caac5d841b1cb2207ac23330a
> commit: 0f1766dc93f077061bf42cc6222bb2ade96422a4 [77/129] kallsyms/bpf: rename __bpf_address_lookup() to bpf_address_lookup()
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260114/202601140159.I4b0kwpE-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140159.I4b0kwpE-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601140159.I4b0kwpE-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/loongarch/net/bpf_jit.c:1322:7: error: call to undeclared function '__bpf_address_lookup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     1322 |         if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
>          |              ^
>    arch/loongarch/net/bpf_jit.c:1322:7: note: did you mean 'bpf_address_lookup'?
>    include/linux/filter.h:1378:5: note: 'bpf_address_lookup' declared here
>     1378 | int bpf_address_lookup(unsigned long addr, unsigned long *size,
>          |     ^
>    1 error generated.

Thanks.  Presumably this:

--- a/arch/loongarch/net/bpf_jit.c~kallsyms-bpf-rename-__bpf_address_lookup-to-bpf_address_lookup-fix
+++ a/arch/loongarch/net/bpf_jit.c
@@ -1319,7 +1319,7 @@ int bpf_arch_text_poke(void *ip, enum bp
 	/* Only poking bpf text is supported. Since kernel function entry
 	 * is set up by ftrace, we rely on ftrace to poke kernel functions.
 	 */
-	if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
+	if (!bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
 		return -ENOTSUPP;
 
 	image = ip - offset;
_

