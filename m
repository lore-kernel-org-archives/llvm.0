Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C552EA749;
	Wed,  6 May 2026 04:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778040808; cv=none; b=XvSiQnBeVu4Vm4u7BPbTMvsd8bxzom1mDBvQxh2rTNt+yi36hQ9NDXQf477qVLVsdFwRC3tzSnS4E0A0OPLiX20j8S7HXZpTHVs/lcvt9HGSf6oQtRrKZxMSKZGleX5HYZv6pmVe9cAtM9LMGgn+ciwd0X3iRohs8uuj0Luh3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778040808; c=relaxed/simple;
	bh=fOfCUdT4k1gflvb5hIsCMVgGymtH8VmH4Lz8OsOZn2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l7hwdXRX1kH5We8OsZGQjqDsPn7sB3wLocrCkU4tfHgxB7S1uhzFh2O4EtxylbkIdPnDgay4nQzEuHJgoHIhVSWUnJijLWnkrz6qrOHspd9GI8YWOr0diEXhKZTXM0t/d+H7WGW8bBlnRSVVWqdBpo+yw+kAtyB6rw4hhHZNqok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=n+BVyAPX; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="n+BVyAPX"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4g9MSQ60sbzlfl6F;
	Wed,  6 May 2026 04:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1778040804; x=1780632805; bh=YKfFNWfTGyWDmTW3PZCiqTu2
	ggmKdJ9D7KDVS+JTrUQ=; b=n+BVyAPXUqh4IMgMpLCS8OG4B38gUamsfF+W9ko4
	4jLaO65IhnP84x4MxelwyZBq/cdlRJMQk+Kbgj+fmzKHibQ1rMQtM1ZtC9QiEssQ
	voQSkoitKrs9tKpvKcqKQlXhYiA5XWSy2q0pcdepXLlUwePdbwBY++SPT85TmYi7
	8zQdLwlz+SGrLgXe0Czjx54cNrhXNu0S4I9K3DaiDAuYzW2rH34t9lSr4sRKPmnY
	N+0xQAxyb1OSSdJROB0eghdPH4cGVRx1rwznR848kbJSVOwVurvtLxh4GlS4D/nB
	BO5kKsY+0KqlisW93JA6AfzHTUhZ5UOO3uSSvAPljAWGeQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id NY5SkTzVmUB2; Wed,  6 May 2026 04:13:24 +0000 (UTC)
Received: from [10.211.9.52] (unknown [213.147.98.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4g9MSK3fjCzlfwHS;
	Wed,  6 May 2026 04:13:21 +0000 (UTC)
Message-ID: <f4fce52f-5ce8-455d-bd09-148070b11ac2@acm.org>
Date: Wed, 6 May 2026 06:13:18 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:locking/core 5/5] kernel/locking/rtmutex_api.c:93:1:
 warning: expecting rt_mutex 'lock' to be held at the end of function
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <202605060005.JYWpZXr2-lkp@intel.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202605060005.JYWpZXr2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 6:28 PM, kernel test robot wrote:
>>> kernel/locking/rtmutex_api.c:93:1: warning: expecting rt_mutex 'lock' to be held at the end of function [-Wthread-safety-analysis]
>        93 | }
>           | ^
>     kernel/locking/rtmutex_api.c:90:14: note: rt_mutex acquired here
>        90 | void __sched rt_mutex_lock(struct rt_mutex *lock)
>           |              ^
>     1 warning generated.

The above refers to the code under "#else /* !CONFIG_DEBUG_LOCK_ALLOC 
*/". I will include a fix when I repost my patch.

Thanks,

Bart.
