Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977743E4B9
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 12:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997509; cv=none; b=GC8XozS97euxpLhZ7Q8GXtt1OdpMsKLlKRl4jeLLljJC7+VyvtZf5L5cuAQRyXWrTTHRuGsjKTBoWbUHNkeMpm9YyLAHj8hb+KBnIVazwdpDLr4EFCZke9fkjUzeJnCmUGtESkucAJqMMkZQT6HmSV2XLv98jl0HeKZYmxrsS6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997509; c=relaxed/simple;
	bh=5BvH3tNtf3yGwclgsloqehSCFnzEUkv3zWGQ5+wTvn8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hef+xEvI6jIQn5nU9vRh03INrkU5OdtAm6/xZhdksGUINKwRdmBi9iVn61VKCXjonGSW+L8z5QcUf2KqILXTRO6T8lvkyKaP7aBiE3zFT/dCNOyLvBAdDElzSOSlEOmd1JbV7JEKXITL13EEPRHjat0nQg4HLGolZKTQEDxXIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOqIlc5/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOqIlc5/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b67388c9cso7938923e87.2
        for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 04:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768997504; x=1769602304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=HOqIlc5/UlPEY6n7k9VZrK7SXkNkvv98hzDJsirAbqYvUxp7v4Mp+W9W6XUEDRYUmw
         ExgWLvyy4pSR2AEb4KwW63wDIOCGQ6Ckx8/XOYdVZoSB8gm0oXkb/RuMtHH7+8OOfolM
         0gQ+z1NOLSVrClPO4u0N0GkMp66zldRtVx0EG+k05swNa8Zfjf2F1S0SHo0zxf0VaFI4
         bnzIZD68ycg5qVg5w/+2+OL6PocoYmKJCDOyJel5/B4/wC+iHz8g1tITDWH+IQF2lvky
         q8qpYmkRvb02Dv++aVot1PFpMnHUnDQoalY5RazCm+ccUwKsXAvsJkyNsU8B8IL7BJEi
         azIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768997504; x=1769602304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DGCZ8EIP3Ii+3jUlQj/U+neLJaf8YM5JLMcsfoSkko=;
        b=FT4qefglBvGzSHcZKuoMCULjXz7x4VIWvUIJOmctXAEsrNiOcNNTZUF4bQZNtnSNB3
         OBRfmTKq2099kZ7bj2tOs3EyTRFlLSjo7NyosEjsLfYfSgWLOIqdy6b1+WF2MomCLL8x
         VqUqK+UfAH6GrxiWy8Z5sr8ILqXKy3tAb4tnWbjeVjERHTCM5jPpalOsuJwQuw/CvwPs
         l45vDz0Sz9zyDGDevzBkBNYdxXmHf+KJj2QHYDrOMX+OOa2hSUe/0kynMVBvLiBEOSEo
         PFZlGRfY/oVmM7AKpm3A70uI18yMYyrvYecwXRZ+IB6peL8QC7dcd5WuakY8WDuJKWH5
         NkXw==
X-Forwarded-Encrypted: i=1; AJvYcCWxwCDN+jTlqMa17yx/QWOUi4eA097jWgXsdqsX5xxFcmMLzlaTYUAstnqo/+nhc6Q0DpJX@lists.linux.dev
X-Gm-Message-State: AOJu0YwRbzHDqQ0dBWlfWdjDC0Vw55EPRR0iRU90K9WYXsHqjW6JPnPt
	1I3bBu+5LKCkB6UtpLeFPSLysxcvxwUCS5GBuW/GqU8SmoNPx7Rp/TFY
X-Gm-Gg: AZuq6aIR/+i3syF38WEYgea6Cq4sWkeAXmvyBo6SDUqx4jMIsuPkw3RGHor7UZVxKJZ
	/0MHwMlkVhxELXhPrbdLxx/NDG/mhSSyANi6Hq1dJqIwBOp49/d4whVrJVcVvQIBVy3bzLZ2oBY
	WxaOBetbfPhdhiPCsZOD4D+jIXjDSaHbJGf+BWfDl8AN+RFN7HexHFUVPl9Hn0gQF7l3A4eeQZW
	umovmX6AKP7b+VJ3Id9vloSGKPQ3Q0B1qbBQbzS6jFbZYQpTiiy7Ss+F9yWirL9zUxBUDTKzNiR
	OYsthVGjJ+vG2vjEvvUcMnx45x31qDjEs0UdRUaFa4VbEklMVrV9xuc6HfCQc13TQYGGopcUyYf
	p2X3FYYpHEfOPI3ADq7TLfXmTnlfpI08+zfBe7DQW+X5aTAXwD6IlCbNlan6AyHQBZPqZ93RiEF
	08Gnx6JGAjkcZWAneEjxyVFco5yJFz7uQO9UAbd/gaae8TJsmDzfzw
X-Received: by 2002:a05:600c:8b55:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-4801e2fbd61mr238692885e9.1.1768990819461;
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d77besm306630785e9.14.2026.01.21.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:20:19 -0800 (PST)
Date: Wed, 21 Jan 2026 10:20:17 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260121102017.539b5531@pumpkin>
In-Reply-To: <202601210752.6Nsv9et9-lkp@intel.com>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 07:50:16 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Ryan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section  
> 

When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
become real functions.

Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

	David
