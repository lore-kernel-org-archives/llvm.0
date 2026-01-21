Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F949325484
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 20:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769027850; cv=none; b=gt21HMk/SfaC+YsH9CUYEuBYZCHls3UR59AA1Bw1eVKvC2OlVGAoWix0/sGxREEQu0k8M1b29j/93DW4yLOHuzamOv/OeuosLjMxzB9zc4z2v1Rk1OlNORjetBQB37/AXBQyDuSEyXiO8jjuJNXyssS54A5PMTJWsyictqy7Jfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769027850; c=relaxed/simple;
	bh=FQNLak7ZQF2YfUrau8mmMD+lQw/ks2QhyvukfiJXIKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdF1EympfcYOF9vDuYmpvebWN65x10LQ0N3lqnQmpQRy88iNKsGAt5pgOirrZOEiPwkpTUCm7lHQoTbj9Bqyi2hWR38wuMtHaM8Z3emNkdn+2Z1kyvkG0YfDPqy5i2bmKAFY7EKBs6U+vqZJ7LiGsAWueo25Grlw8ehtkv0L1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=33EENIFN; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="33EENIFN"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4dxGGJ3x4Szlfvq4;
	Wed, 21 Jan 2026 20:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1769027846; x=1771619847; bh=rRijQ2lib8btv9LCLvdYLXu9
	p7OxXJ9f9bG+SjGlbNk=; b=33EENIFNv2ygumukl3ei9YwKwpO2fmmBYf849Iau
	NxAl5abPr1g8wA0NtKRDDW4lRrHpxl2XQVWu1MTlRcKh05FCYHQ9j7EOhkbK/wNJ
	X4OgDHgRpWFt9Oaug/0Xv7ADDV/NReQ7EXvMEAa1bS/QmgFpk4h0wq++taRnIpT3
	NRu3i4DNAa0gy9xPG+tCpnKv49gj7NXVxoxdUOsWPhZF/DtTIcsT00KcpDQ2Eqx/
	OF3swpupnETEkSxJatvzqYfPPwzC1nabv5hl2vX6El0qjp2+GBQhVIrEFNpHaJZs
	60xgP9PR7+z/2cr9W+YUNAHAGz92pBBmoA9arCZT4cb1iw==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id bMlFe0dG_AQe; Wed, 21 Jan 2026 20:37:26 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4dxGGB2zkvzlh1S7;
	Wed, 21 Jan 2026 20:37:21 +0000 (UTC)
Message-ID: <e1229c44-048b-4e42-b545-18a8c716b5eb@acm.org>
Date: Wed, 21 Jan 2026 12:37:21 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
To: Peter Zijlstra <peterz@infradead.org>, elver@google.com
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org,
 tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
 longman@redhat.com, hch@lst.de, rostedt@goodmis.org, llvm@lists.linux.dev
References: <20260121110704.221498346@infradead.org>
 <20260121192349.GM166857@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260121192349.GM166857@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/26 11:23 AM, Peter Zijlstra wrote:
> Pushed out an updated/fixed series to:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core

With CONFIG_WARN_CONTEXT_ANALYSIS=y, CONFIG_WARN_CONTEXT_ANALYSIS_ALL=n
and "+src:*include/*=emit" in scripts/context-analysis-suppression.txt
I see the following error messages for that tree:

In file included from kernel/locking/mutex.c:22:
In file included from ./include/linux/ww_mutex.h:21:
./include/linux/rtmutex.h:44:25: error: reading variable 'owner' 
requires holding raw_spinlock '&rt_mutex_base::wait_lock' 
[-Werror,-Wthread-safety-analysis]
    44 |         return READ_ONCE(lock->owner) != NULL;
       |                                ^
./include/linux/rtmutex.h:52:56: error: reading variable 'owner' 
requires holding raw_spinlock '&rt_mutex_base::wait_lock' 
[-Werror,-Wthread-safety-analysis]
    52 |         unsigned long owner = (unsigned long) 
READ_ONCE(lock->owner);
       |                                                               ^
2 errors generated.

Should this series perhaps include changes for the file
scripts/context-analysis-suppression.txt?

Thanks,

Bart.
