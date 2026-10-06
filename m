Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A736149EC79
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303063; cv=pass; b=Ql6S8oQb1dWoplPlef1x1Hsi6w74Syn/6Tg1+oPtR20l6zJ/z4FLdlAHmDxFfE9cVH/rLuwi8R1Ia4BnTR0cDFmM30i323teH8jB+l9O/twcl5NsUqjYaUnFXIol+f7VAJW1ZvG/QpjBOYL4u9crOk839h7jy59ClR5OT/lCAoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303063; c=relaxed/simple;
	bh=9WCkiE19cbtAuYYQ4uqsh1anpnBBbEDR9fWCfux10TA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWIj73w5/S8D7/HpO77967TkblxGhyqVOiVVZ5q4iDrkGQVTEpPqapCjVtC+Elx005PBQRSEoD7ZNsi8KWA4D4LODwFE6UcJepi8ZOpHyqTFkaHNVnwRtOflywU9cC6s7pAQ/RJHKtdAFeurkYP8gj6H+facq2zFl6n5RMozcZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FGgYpAIZ; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FGgYpAIZ"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-885cf67963eso9928937b3.0
        for <llvm@lists.linux.dev>; Tue, 06 Oct 2026 09:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791303056; cv=none;
        d=google.com; s=arc-20260327;
        b=mihAAGxuZI2XZAXnptuZcCqe4LU/76WE4L/plc7mCkEx5JKfrjZg5nETVUO9oGigSR
         bDc+96oU3+8WR6DYBaCdZMD+X6kJa3RrkIAz3cXxgW/u01aj84TNnVHYCYJ/z5Ps0hbZ
         bBiLS0ePmEMSbCdNAjuXSY7Ru1uMpJqnTlmU7ONwYxSuGvmtJtCJG/ZeK5RCf7QnmtXB
         Gx8pGXB6ODcIHbhshPRo91dXgiUPQUIy/1GmMzyKLdPeGITcQnBBRZvq8ML1YAuzxSr9
         r5058czDiQHXnbEuTwj1UzoNSkghSNKoV3WIjOa8IxCsxDnx7pjeIwHjDDzD8vxsXsYg
         XfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bfR6JmlAO4hB3DVN/nKPNuuxv4ZNwhQvNLDvwEb4/Vk=;
        fh=niXmNiFwb3m2rZjcV/MTmmRIoZgvCnfmBbj/E6jTrjQ=;
        b=hfWNvPIIjIaL23PmGJqkEUPWdFUgDeu8HUUZmXUcr3S7Au9dkN/jfx0G3SBUkTopdB
         xBegTkwAmrCABAMZJ+/xqIBqaRbGvb1UcqGFahZOZ/cVyGJKqzSDCbj9snOac6Dn84wU
         0OumvbjEuP9QXEVNMgwd9Shl67kxrbpZm0j8+rLbWa+V0nwait29VYF7EMYV7rAurUZK
         qT6Fj1JMMCKyKUul3vYDP7DSoK+zBlSvOJkBh3ZMyETLcEC1kgNYwACtKppbaSqhfqld
         pM6kRZDaM5S9VGktmvMzNFa3GxJ0KekAH3R1IUwYVyy8+oPsJKsbT96tdgX9IusezyvO
         PijQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791303056; x=1791907856; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfR6JmlAO4hB3DVN/nKPNuuxv4ZNwhQvNLDvwEb4/Vk=;
        b=FGgYpAIZdTLS4qW7DAnQeqPpDBkVq8yxh0hbv8ZOV3cseTWb6pxe1ox4nWRqaTK7am
         7xAg/QhkqT858Rw6BW/7Oc/ZeQyL6NvqJQOzAuSGC+M+gKjmIjFc7MatUOFhZLSX0pbz
         EmjCrRzjK2rNC7Z8qRvUp17AE5IPBSCwFOxEjtEZCOMLxc/663Ge8smcBcDULOMvOb5f
         SI9Q+0+7ECLyV+ReYNBoYMsverEqW5nVnP9rWPTDIfZ/50EULFrS2hfsJ+LTzxwZObKo
         0yl5movdzHGxIXy2ZGUw5NfMFam3UV2rHDRJYRkwdUnHowjz51l6NPYpUfhyoq2YJzWC
         bNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303056; x=1791907856;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bfR6JmlAO4hB3DVN/nKPNuuxv4ZNwhQvNLDvwEb4/Vk=;
        b=OudHk14xoUbrfzAWhXp9VrXcGmScXDHFoRipQ2w9wXvH0edZqbeDEW1AYW63GPWAfy
         axflXqf5y0l4paT6kRaxu8Q8vCIiq1IJXIca4SE3uIPgxCw5l98foXsofc++1c83s8P8
         4uJsMytoHEvcdsdLFZQbmenbMI30H+8xYqpGVp54XyUYopUNc+w/HkDgac0PnGC+7ZYx
         KGjQdqvLej30zyPgzlxj3WKcx+/MLMM1clfgeOu5SpEhTuOFzFSOmgcdY1wGetXuYGgG
         /eqEm3DjqZxjUqY8CA65GgTavJjRv/RNkwpIyClSU8O2mGUf8Gqj+80QExM+PKpnJcoi
         kyXA==
X-Forwarded-Encrypted: i=1; AKwUvBw30/+WkYsIMkV4cxXlSxj3mjno9FGitwNJ+2U0TU+PQBfdwbFhmVICKx0kO765lMKEPoBu@lists.linux.dev
X-Gm-Message-State: AFq9FYIQIk7NMeE/edvTuaYQyUbdcKVtKdv/6/U2HmrpR6uAoBwWPALk
	Xp2SIkIyN9Eo8EnOVkdHozUGOs4NmzFSZcERtuMrVUGdT3c80IxUCJnqACK3G4da8r4Uxsg8+17
	59GBwSf7PLpqywo/z76JqnjoDMz/O6rBslSJbhFrL
X-Gm-Gg: AYBFou0M8Y1LnXLwqGWeTPKO3FvknwReOdzn6acb35PraNKCwdvgrg+aV6pPrmVfLQj
	i5PCKxOJcag4TPtDGeztPTWdiAdXlyVDmGEiofTiNhELExTlP9irAWSs1V9llpf87jkZn1XEa5f
	rhifs+ZbFaVPAg8SIW6P6X0TIRJ4Ukq3gCHTJkdctOfK4il65v+KOxPsbmyOMt5MftH33mcRYPC
	G6pfgil/cknqEw0typnLFrD05n4iMttoI/KR2Kp7hCg8tecvz/OoT4Wm+uzdpjPq0qjMhbYghl+
	7//kY6+AhPSPpG++Hu/wqm45HZxWgCLG1mhRmH0dDsq4DHZl15LMXw==
X-Received: by 2002:a05:690c:5302:b0:8a8:7e5a:dc2f with SMTP id
 00721157ae682-8b04f40f097mr9171807b3.12.1791303054779; Tue, 06 Oct 2026
 09:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <00ed0b57-ad05-4c5d-b152-7c81df94b23a@app.fastmail.com>
In-Reply-To: <00ed0b57-ad05-4c5d-b152-7c81df94b23a@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 6 Oct 2026 18:10:17 +0200
X-Gm-Features: AclHuK_OeB6Z7-eCIUVq_1RabrgIKOGeEVPLb2q2UdMqE46rpsfhYWgMuA5UU2w
Message-ID: <CANpmjNOaykC4McAj=gZghqPSQc9aGBP_CjgKmp3n2yjeJTxDSA@mail.gmail.com>
Subject: Re: [PROPOSAL] Replace gcov and kcov with llvm-cov
To: chuck@wolber.net
Cc: kasan-dev@googlegroups.com, nathan@kernel.org, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, oberpar@linux.ibm.com, ardb@kernel.org, 
	arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	dvyukov@google.com, hpa@zytor.com, jinghao7@illinois.edu, 
	johannes@sipsolutions.net, jpoimboe@kernel.org, justinstitt@google.com, 
	kees@kernel.org, kent.overstreet@linux.dev, linux-arch@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, luto@kernel.org, 
	marinov@illinois.edu, masahiroy@kernel.org, maskray@google.com, 
	mathieu.desnoyers@efficios.com, mhiramat@kernel.org, mingo@redhat.com, 
	morbo@google.com, ndesaulniers@google.com, paulmck@kernel.org, richard@nod.at, 
	rostedt@goodmis.org, samitolvanen@google.com, tglx@linutronix.de, 
	tingxur@illinois.edu, tyxu@illinois.edu, wentaoz5@illinois.edu, 
	x86@kernel.org, peterz@infradead.org, sashal@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Taras Madan <tarasmadan@google.com>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 17:14, Chuck Wolber <chuck@wolber.net> wrote:
>
> Stemming from some hallway track conversations with maintainers at LPC
> 2026, I propose replacing gcov and kcov in the kernel with llvm-cov.

I know the origin of the discussion, and wanted to chat, but I guess
that didn't happen and instead we get this proposal. It would have
been good to understand the requirements of users of gcov and kcov
(more below).

> llvm-cov instruments at the AST which enables precise mapping back to
> source code regardless of optimization level.
>
> We have a set of patches [1] that implements kernel based llvm-cov. They
> need to be updated and some additional patches are required to address
> some stubs that are missing noinstr annotation. But otherwise I should
> be able to send a full set of patches (including taking on the
> maintainer role) to remove gcov and kcov and replace it with llvm-cov in
> fairly short order.

The hallway chat was supposed to figure out if there's a way to bridge
some of the gaps, but jumping the gun like this without having
addressed the requirements of kcov users does not make any sense at
all.  As for gcov, llvm-cov was designed as a better replacement for
gcov, so that makes more sense.

Ok, well you made me untangle the most important differences between
kcov vs. gcov/llvm-cov below so we have it for the record.

> If there is a desire to take this in pieces or implement other
> intermediate steps, let me know. Otherwise I can generate a monolithic
> set all at once.
>
> [1] https://lore.kernel.org/lkml/20240905043245.1389509-1-wentaoz5@illinois.edu/

llvm-cov is generally useful to have; llvm-cov is closest to gcov, so
that might make sense to replace.

KCOV, however, cannot be replaced by llvm-cov. KCOV isn't a coverage
reporting tool for users, it's a low-overhead interface for fuzzers
(syzkaller/syzbot and many others). llvm-cov has no equivalent of:

- per-task and remote (kthread/softirq/USB/vhost) coverage collection
(to avoid polluting coverage with concurrent tasks);
llvm-cov counters are global and polluted by everything else running;

- ordered PC traces (edge signal) and comparison operands (TRACE_CMP);

- performance: a per-task mmap'd buffer reset with one store, vs.
reading/resetting
megabytes of global counters after every program;

- GCC support (we may want to keep at least one GCC-supported coverage tool).

It's also UAPI (include/uapi/linux/kcov.h), with existing users.
syzkaller heavily relies on KCOV's features above to achieve good
performance and coverage; there's no reasonable way today to migrate
to anything else.

As-is, NAK on removing KCOV. Consider replacing gcov with it.

Thanks,
-- Marco
