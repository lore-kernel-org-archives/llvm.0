Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589613AA53
	for <llvm@lists.linux.dev>; Mon,  5 May 2025 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746452681; cv=none; b=FsRyPAdRAqFPcGYE0Db/C0f9IX/9lActXu2ima9mbq05fOjOPBM7NcOsp3Vr89IAQerjIbqpyLr71DA3kKoh0qlEOIBUYC9Er3sEGem9eACK18JDk02DsdTg5cDKd/erka5LWP0nXTZlE7ELeQnB96Gu2d9ceNXFUpQBHSnXfIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746452681; c=relaxed/simple;
	bh=6QvOvRZ/UbJMoeXSAGC96rle7AjVbTvBrmnBuUaYf68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lg8rRaWC54MpbVMo0NUE9kY/RQUqkGPrac+gPZv5WR4lwX2xnlkOQS2I1u2eYoNK+pINYGxpGNcv0El/T9Pg2aRR//vE4nKnrfEGuIf3wXBYzD6g47pOCGBnqGjTUmWni7WS+VLm5+xx935SuJo74G1kQ+7ENVO96N3kDzYqiTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WmOUjkp2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WmOUjkp2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30572effb26so4122051a91.0
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 06:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746452679; x=1747057479; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5kdmoNVQsFUVQTwbN99dic1kL41z+dsPAJ4dCN1KXOY=;
        b=WmOUjkp2rjBjlhyoXxQE+kQFoROFadaPr1xOkHERTUyBMv+Dun3ryFCSLrfOGH22eJ
         pQgVAcQ3GSJup10mCmHdqxrSjaGxT2mxdTjVJMPLYGjNVdILNoe964nN0ajqv5LDoUNs
         z0n8nP1mruIigkuf0n9AqxheCz6BaVPUFhgE1+ge6R+avRnPElTQ+rNEcIeILinjx0dR
         V96yr5+JmqFtKz4eRkrFukB+O4FSYcTePbratOzVn9DwJie8Z++hq+TNE+/RYLyv6AhS
         f1lyXNKU2DergUUXEXFSbrK1aDz1499c55aZvlT9aDXccvpP7DQZ70YIuheM/GZFGfoB
         nzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746452679; x=1747057479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5kdmoNVQsFUVQTwbN99dic1kL41z+dsPAJ4dCN1KXOY=;
        b=m9S9xnk4WY4Ul56O9x7O/SWXSay84dX+tRTu6jlTr49D2PQQkDKzZDdagkoKqDRDCs
         cPamRqAvDKUeGKdMS/UseNRC2Vti0rr8uAjD4vmT20hSpltdQqUCFb8dM5ugeSre5+6I
         mlCDv9IfquT6cGjrdHMhXynaIzRYKcFBkK2EFBP88/HUOVwMykMJKOJNHaM/7th6vOZF
         Z2DFBBUaYALPxnu8qMk2yc4UEKx9KU91ioEWMUPVa437MGagMITVWHBBM7c+fbh99yuV
         aScWq2XYczvuUVd8C/gn0Wsp1EKPtgl170mkks6q1+DM9bJ0njOPdFzMDclPYMN6v8B2
         qOHg==
X-Forwarded-Encrypted: i=1; AJvYcCVvziB4/n+AV+gLuwvWOu0M9du97Z2FWgWMgNgbPXASoLHhrluRt9sMcDA4mpxTGO7W8wi9@lists.linux.dev
X-Gm-Message-State: AOJu0YzjLeINnibX0juR8Ej1rkKYVanFnwkoMsjNYU53DNAR//Rq+dGH
	5YYrQ6NsM5KndNAJwOJxFf6dLe75SIVZtMFx/+iQJFU1oIri5A8X00zUV4CevIah4vh+jJNaZIP
	77qwDlznNxqZK11Ey6ZHWQQxB4raXwTWMHAa5
X-Gm-Gg: ASbGncuKVMpg3yob/QsJsvF+cKJkB7LeNisCZ8wwVSzNWSIRcL20XOUSRCIXddH6Unp
	8dX2hfT++7Sj3H+fIa1t2GRngusfZws6Ds0VKkEUSgeknZ3kJxdnkxqr4v+Gg7PowKisKYY7v/X
	j9/wiE6cGafMnUim7QskCX32s7T1pNxOSDih2ke5FQlJ6/PctTgAHL
X-Google-Smtp-Source: AGHT+IH4SDdrgJH/FtIz5aeqL7ez9i18S6l2SrxSxbmU1fmlnWmrTrBModPKlAVnmRmQ6xD60Cl5qdGHyjSc3yUk/8M=
X-Received: by 2002:a17:90b:4c12:b0:305:2d68:8d91 with SMTP id
 98e67ed59e1d1-30a4e622226mr19074154a91.28.1746452679338; Mon, 05 May 2025
 06:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
In-Reply-To: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 5 May 2025 15:44:02 +0200
X-Gm-Features: ATxdqUFs6K5fsi07mj5QPnDApYO8Y4Qv6bhjBbyuo9NyPdbmUWE265bDD9qpTfw
Message-ID: <CANpmjNPRgUz9oX0H8kza2sB847Bai4rLtqfOnUSLmqt2Zm_pqA@mail.gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
To: linux-toolchains@vger.kernel.org, llvm@lists.linux.dev
Cc: aaron.puchert@sap.com, Aaron Ballman <aaron@aaronballman.com>, 
	Peter Zijlstra <peterz@infradead.org>, Bart Van Assche <bvanassche@acm.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Mar 2025 at 12:47, Marco Elver <elver@google.com> wrote:
[...]
> 1. Re-entrant acquires: rcu_read_lock(), preempt_disable(), etc. are
> all re-entrant locks. My proposal is to introduce an attribute that
> can be added to "ACQUIRE(..)" annotated functions to indicate they are
> re-entrant. Release-count needs to then match acquire-count to fully
> release a capability.

FTR, reentrant locking support is taken care of:
https://github.com/llvm/llvm-project/pull/137133 (should land soon).

But I think we need at least #2 (basic alias analysis) as well for
things to become tolerable for the kernel side. And that one looks a
bit harder to implement in Clang, so it'll be a while.

Thanks,
-- Marco

> 2. Basic alias analysis, e.g. when storing a pointer to a lock in a
> function-local variable. [Complaint in:
> https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.org/
> -- quote: "Fix the analyzer instead."]
>
> 3. Ability to refer to locks in returned reference/pointer. For example:
>     struct foo *ret_lock_struct(void) ACQUIRE(return->somelock);
>     struct foo *try_ret_lock_struct(void) TRY_ACQUIRE(1,
> return->somelock); // locked if non-NULL
> I expect this also requires basic alias analysis to work so that
> assigning the returned pointer to a function-local variable and then
> later use in an unlock function works as expected.
>
> More complex requests:
>
> 4. The ability to deal with conditional locking with return values
> that are not just true/non-zero and false/zero. A concrete case here
> is that a lot of functions return error codes, and if the error code
> is < 0, no lock is taken. If the error code is >= 0, the lock is
> taken. [ Source:
> https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.org/
> ]
>
> 5. Better control-flow handling. Basic understanding of conditional
> locking, which is explicitly ruled out in:
> https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#conditional-locks
> - however, if there's some way to even get basic support, would vastly
> improve things for the kernel.
[...]
