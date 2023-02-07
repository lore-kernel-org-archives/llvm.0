Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE2B5685
	for <llvm@lists.linux.dev>; Tue,  7 Feb 2023 17:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC57C4339C;
	Tue,  7 Feb 2023 17:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675791749;
	bh=8LsW8Vk/wm80CoNsekTrZ9hm5TsT/R2+QAciIureH9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PP1OV2Qs8Yjkk+UHV1P+TnLJrohipluZS/y1GKpCMpROSkfXvy2QhllqHCI/QlhnE
	 9xzsnAPi/STSrY4JKnklZhwaapmjxy4x9e50vr5k11A6yKqknI9z/2J+LROjwcoT6J
	 ILeWI1e8STm0L1nGu3k3WmNFXy5bspGchnHYnI6Ek7oaBsVb49LrSUNgmQ2cOYJ8wc
	 U4lPU+4zL7di0gsVWEjxQGLuH6zJuE8Wju6yFsh4m6JHWyv8DrbffNzs7JOvIlxm/i
	 72izjBr/pTZD9SOu6MQTbhTX1TvHkMIRjltd5IdxIWS1g2M480BIXL3WycWTTU8RVV
	 uOETDfNPTk1lw==
Date: Tue, 7 Feb 2023 09:42:27 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: current objtool warnings from randconfig builds
Message-ID: <20230207174227.rimpkz3b3y7m4fch@treble>
References: <9698eff1-9680-4f0a-94de-590eaa923e94@app.fastmail.com>
 <Y+J5ev/R/Sz6nwBF@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+J5ev/R/Sz6nwBF@hirez.programming.kicks-ass.net>

On Tue, Feb 07, 2023 at 05:16:58PM +0100, Peter Zijlstra wrote:
> On Tue, Feb 07, 2023 at 11:25:27AM +0100, Arnd Bergmann wrote:
> > Hi Josh and Peter,
> > 
> > I've updated my randconfig test setup to use gcc-13 and clang-16, and
> > have sent fixes for all normal WERROR=y build warnings, but there are a
> > lot of objtool warnings that remain. I've reported some of them in
> > the past, some others are new. It would be nice to at least reduce
> > the number of warnings either through code changes or workarounds
> > in objtool for any false positives.
> > 
> > Out of 1500 builds, about a third had any warnings, this is the full
> > list sorted by frequency. Let me know if there are any that you haven't
> > seen before, I can provide the corresponding object and config files
> > for reproducing.
> > 
> >     Arnd
> > 
> > 8<---
> > 205 mm/kasan/shadow.o: warning: objtool: __asan_memset+0x2e: call to __memset() with UACCESS enabled
> > 205 mm/kasan/shadow.o: warning: objtool: __asan_memmove+0x48: call to __memmove() with UACCESS enabled
> > 205 mm/kasan/shadow.o: warning: objtool: __asan_memcpy+0x48: call to __memcpy() with UACCESS enabled
> 
> Patch pending here:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?h=sched/core-robot&id=79cdfdacd5b8d1ac77e24ccbc178bba0294d0d78
> ￼
> 
> > 80 vmlinux.o: warning: objtool: ibt_selftest+0x11: sibling call from callable instruction with modified stack frame
> 
> Can you provide details on how to reproduce this?

Arnd, thanks for rounding these up and posting them.

I agree we need to get these all cleaned up, but before we go too far
down the rabbit hole, is there some better way to track these?

Not that I would suggest using an external tracker, but maybe at least
put each set of related warnings (e.g., those having the same frequency)
in its own subthread with the config/compiler info included.

-- 
Josh
