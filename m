Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391343859FB
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099341; cv=none; b=H3EnVmchuTNHio7874frpYu28DckgL7k00t06KDZOYy+X9q0Cpt/Ch47X+df44zsoNaTqYhWXp0XDtdhAgCGtj2sxixcSyBdulhx86zlMgAviXcJmw7DcSODmvYqztuubk4PKOdOUglY3HWDyCQDPtuSdoR7VgfOwSIPQA0G+wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099341; c=relaxed/simple;
	bh=yGVdavKRpp1IppEv3D1/VL2shcJrg8SToOHOQ1rmLsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADfCc/pzDU6a/KRhdgkVEnRoebT5rx/D/A2oBGcVHHitm+CEX3eRqGtc/8FWQHwum1ge2K47gtkLwb+mvyhdI+BGJnYLYKKCR6/Vf2Jlp4pR8IFo7MF20AL1UKzV4gotSR8YaRRb+tCOC+WlEcpyOnKhLjj7Aa6Ybu3nCgqA9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Iv3wTx/j; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Iv3wTx/j"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4dxmhy6WVVz1XMFkN;
	Thu, 22 Jan 2026 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1769099328; x=1771691329; bh=gDL6VT3MpLyKdAoFnXvNnond
	4aj4NI4r7HeQXnxqlao=; b=Iv3wTx/jdBTzdHsiFVY9Y2yy7LKi76Vx1A2DOnuG
	c0C1oxpDBS9LPyCRhQ8D0otWngcYPooU+1/+byuY/61/V2vyWm5b3izMCDr7GVg8
	a2r7EJCLFELcjwBQ/5PoVI21qFiLziKmTQ0K4LXCLhmnOC2PQK07BjAmKWsOxeg4
	xoiHpayWJ/fsCGo9DdlnIOEWhNHR+cPtvDH4IfgiH89N24Nq88/XjZJrWM4V7bhR
	FZCFbBZmwlu/MDDOpR1kBIWtUObJ6eCvab4WMdVJEW413+qA3rG5cIEOut1FplFG
	BmA1/TzG6YDTsXfubYVyZyYH6qPhO8/gU5SB1O5nSy3KZg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LB8jfuLAeSbY; Thu, 22 Jan 2026 16:28:48 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4dxmht1N5wz1XMFk2;
	Thu, 22 Jan 2026 16:28:45 +0000 (UTC)
Message-ID: <d399e354-6d42-488e-a0b7-fe8d08b9bf34@acm.org>
Date: Thu, 22 Jan 2026 08:28:44 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
To: Peter Zijlstra <peterz@infradead.org>
Cc: elver@google.com, linux-kernel@vger.kernel.org, bigeasy@linutronix.de,
 mingo@kernel.org, tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
 longman@redhat.com, hch@lst.de, rostedt@goodmis.org, llvm@lists.linux.dev
References: <20260121110704.221498346@infradead.org>
 <20260121192349.GM166857@noisy.programming.kicks-ass.net>
 <e1229c44-048b-4e42-b545-18a8c716b5eb@acm.org>
 <20260122090402.GD171111@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260122090402.GD171111@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/26 1:04 AM, Peter Zijlstra wrote:
> I'm having trouble reproducing :-(

Hi Peter,

With this patch applied:

diff --git a/scripts/context-analysis-suppression.txt 
b/scripts/context-analysis-suppression.txt
index fd8951d06706..1c51b6153f08 100644
--- a/scripts/context-analysis-suppression.txt
+++ b/scripts/context-analysis-suppression.txt
@@ -24,6 +24,7 @@ src:*include/linux/mutex*.h=emit
  src:*include/linux/rcupdate.h=emit
  src:*include/linux/refcount.h=emit
  src:*include/linux/rhashtable.h=emit
+src:*include/linux/rtmutex*.h=emit
  src:*include/linux/rwlock*.h=emit
  src:*include/linux/rwsem.h=emit
  src:*include/linux/sched*=emit

and if I run the following commands:

build-kernel-with-clang allmodconfig
build-kernel-with-clang kernel/locking/mutex.o

then the following output appears:

   CALL    scripts/checksyscalls.sh
   DESCEND objtool
   INSTALL libsubcmd_headers
   CC      kernel/locking/mutex.o
In file included from kernel/locking/mutex.c:22:
In file included from ./include/linux/ww_mutex.h:21:
./include/linux/rtmutex.h:44:25: error: reading variable 'owner' requires
       holding raw_spinlock '&rt_mutex_base::wait_lock'
       [-Werror,-Wthread-safety-analysis]
    44 |         return READ_ONCE(lock->owner) != NULL;
       |                                ^
./include/linux/rtmutex.h:52:56: error: reading variable 'owner' requires
       holding raw_spinlock '&rt_mutex_base::wait_lock'
       [-Werror,-Wthread-safety-analysis]
    52 |         unsigned long owner = (unsigned long) 
READ_ONCE(lock->owner);
       |                                                               ^
2 errors generated.

The build-kernel-with-clang script is as follows (this may not be the
recommended way to build the kernel with clang):

#!/bin/bash
export CC=clang
export LD=ld.lld      # Use LLVM's linker (optional but recommended)
export AR=llvm-ar
export NM=llvm-nm
export OBJCOPY=llvm-objcopy
export OBJDUMP=llvm-objdump
export STRIP=llvm-strip
export READELF=llvm-readelf
make LLVM=1 CC=clang "$@"

Please let me know if you need more information.

Bart.
