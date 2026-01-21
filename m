Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6785734EF0B
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 16:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012852; cv=none; b=OewjBWYCWcjVS4BMtF+cgLNF2gb8LGoNQZIa5BTMPy1Ok1qtPR7VnptYh/VmGUeHVz7jthq0UEnLIJmI8N79irRL1yw2Fi6tAVQqO3rmHbun84ugGmgUCLeQ+XJaQ1y9PIYGccwtXTZR152rrFPFIvwebb3KY+84XqoZYVOqAKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012852; c=relaxed/simple;
	bh=Jj/tYwdXEXUOg64lKr4IrDKHw613UPzJ/qBPeEVnSIo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOcowNBXVJGaKXJuooEOGGDKdyOh3RA3m37+Qu4O+PPdCkqU21ECw085RazlDc+MPspMBwwLGwnPmSVSDFZCQp+IQfAYEnUMqcjKAK791cvxpwu//R1yWl5sj9NZdskmmBjJHCBLh/AzgLE7Gn/+SgkMAYdSDGgncLJQmxBlVWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvvWMH01; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvvWMH01"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-655af782859so11119825a12.2
        for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 08:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769012849; x=1769617649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=KvvWMH017LpZZNMAl+aN3ggx8K3cln+EYZT1Xyl0CD2LGWbkK72n3KFm4bV0WK+qeo
         UwfoyTmre4P+s2Hjrn58b6a0DKvPucPGeRz5koBwIKpQR1zxwOXWZBzACwF6/brkcKJq
         hZSpeObUm3h+WAGGjLo6V/GODeno8L+mioSxpm5VP6OlgIwNY+JNCJcXg/6Gd3jRuQdw
         MRi6VAhm6xmmLAa6IVDf/196fAm46kotkUkmkn2mFe095080Q5N9aYXFUJ4B7rTN9TWO
         dy9bTySn7fSVXujb4SyKA2JbMH/acjzNm04wbNLl1kHbmAe5pRkND9DAAQOcfdidxnDz
         ygXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012849; x=1769617649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MFyGEBMKUH9OPAqYqwZCoqkE5S+eIGaZJE0/gf+bsI=;
        b=tSspFj7R0rtlwnfLXmMbxB+pGv6HnALVJwfQpi5mBPAX5XrRCib8/JchtwdD+PkgqL
         2tLxR/9+KRI/1RLP7kajK2gMIi9vE/xiFcnyoEuL/rhAAFQbK7geiRSz5P/fzMaz/ZC+
         +bU7HfL1z54w2MnQ8moPq1gIS7FeMWm7l/pZHhV2MXGzHVxkv0doJ0/kXUwwqu+q5OZn
         xJQu9CnTQdvt/wyLH2XLVnEO4N1PMxlY0cN+FVXJep+M2VXMa5Ejhy3yX/ux9ZF9bJ/v
         k0a3hu6FTha6xE0lwif0XTyQAv/ZHYRLrZjldAZr+S1gQCPIF0mITDA0s6e3T6cq3/7i
         a8SA==
X-Forwarded-Encrypted: i=1; AJvYcCX85WtEoekKypxPwLLL5xLgWvQAlYIrrFw5Fh8xkfz8/eZ91tqxqoSfZtEWFOdX5tBVISF6@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ5wX+VqDJZA8gpUhXhUQQlT/oWclz0kHsxgpsDjlmSMOG6r1p
	lQJKBaDs+WpJvXSgzCxxKLLbiNlcMlqhSVjCTQj+CTXm1UXIBYfYC6PYWTxCZw==
X-Gm-Gg: AZuq6aJLSwQes7nkk3R+jcAqIAjtnE6xI2yLnWW7LkByCzCM/05YNegMQZY1n55lRrV
	yi4n9yMFRpVf24VNfJEt9d3IS/Q/6K64oB1t1x9MAyYX5S6SxXT0sQ4qSVYB67sJ/uietcEd2hi
	djt4fUF10dVRnI28wIGQhjJkH1ZUOPJqsgk/pXwlGbCp6txz1SmlfE5FFIC/MXDuvIm/Q/bXqRj
	2Bg7zODlDLT4ZIQ9mOmQktrFkF9F0MvJ8+6R8t0PE1z8gkvcU4Yq+qooNcIdslls1wjSJfkNMhS
	yaPceVrYX37Ebyi9Ikr57xlfyh4DqZiqlqytTummQct8SsNY4+jHjBCoREr5KH7usccPAWpqOkc
	K9MJm1AeI+l7bl2BPB8coRjEw7EDu4FVZhqp0qwThvpkFmlG5FHZ/gagZvGe+rMvllyicqwXtet
	KPWLYiPUEBSzuKwlEPkjA2KrtY/DTRHpqw84qZxQnkfrqlRrabg6X5
X-Received: by 2002:a05:600c:4fc7:b0:480:41f2:b212 with SMTP id 5b1f17b1804b1-48042f7e0e0mr38897745e9.25.1769006884109;
        Wed, 21 Jan 2026 06:48:04 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm274897235e9.7.2026.01.21.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:48:03 -0800 (PST)
Date: Wed, 21 Jan 2026 14:48:02 +0000
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
Message-ID: <20260121144802.1287ce3e@pumpkin>
In-Reply-To: <20260121102017.539b5531@pumpkin>
References: <20260119130122.1283821-4-ryan.roberts@arm.com>
	<202601210752.6Nsv9et9-lkp@intel.com>
	<20260121102017.539b5531@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 10:20:17 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed, 21 Jan 2026 07:50:16 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Ryan,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > [also build test WARNING on linus/master v6.19-rc6 next-20260119]
> > [cannot apply to tip/sched/core kees/for-next/hardening kees/for-next/execve]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/randomize_kstack-Maintain-kstack_offset-per-task/20260119-210329
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20260119130122.1283821-4-ryan.roberts%40arm.com
> > patch subject: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
> > config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210752.6Nsv9et9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601210752.6Nsv9et9-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> >   
> > >> vmlinux.o: warning: objtool: do_syscall_64+0x2c: call to preempt_count_add() leaves .noinstr.text section
> > >> vmlinux.o: warning: objtool: __do_fast_syscall_32+0x3d: call to preempt_count_add() leaves .noinstr.text section    
> >   
> 
> When CONFIG_DEBUG_PREEMPT or CONFIG_TRACE_PREEMP_TOGGLE is set
> the preempt_count_[en|dis]able() calls inside [put|get]_cpu_var()
> become real functions.
> 
> Maybe __preempt_count_[inc|dec]() can be called (with this_cpu_ptr()).

Or the code could just use the per-cpu data without disabling preemption.
Usually that isn't a good idea at all, but it can't matter in this case.
Might give a noticeable performance gain, disabling preemption is
non-trivial and/or an atomic operation on some architectures.

If anyone is worried about preemption causing the output be repeated, that
would be (mostly) mitigated by checking that s[1234] haven't changed prior
to writing the new values.
I think a 'not locked at all' compare of two of the four values will
stop everything except two threads doing system calls at the same time
getting the same output from the prng.

The whole thing is very unlikely and there will be much easier ways
to break the prng.
Provided s[1234] are only written with valid values (ie ones which aren't
effectively zero) it will continue generating numbers.

	David


> 
> 	David
> 

