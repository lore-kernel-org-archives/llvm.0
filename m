Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197AB356A23
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 17:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015522; cv=none; b=lcPfkJPUBKSUomGZj5fmmOGibtb6RhclzKRLQ3KCAMBiLasPOHLLy+xILcoGowa6ikdeYKDRzlgApxoOR0EyR3bLhQnGWsRDCnaeQhLs7xPRpkoL4zN+faZy27Vl/T/QFZUUbuvVqjklc0Ug2qDX1AWwsNHD5i/99yaYOICl6Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015522; c=relaxed/simple;
	bh=ggi8jKbRdmabJUwV6NmEcKObVFOv0ejco0g4Rvym3UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/9KWxcS0ZBWTA8AbN7jIo+oW0nFsfa52s4AQco2Nlk9arln74ilDDImHAYEoflYPHvqC9HmywxTvDElX6mfzF8BqkP7rc/IfgkIYDTZ+fHY589fNTvvIlbzkCc5RO0YL5P4/EKcx7GZfOJuqNWIgRRlV7hbFM15AvlHZS4e53g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=jO/iRI/N; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="jO/iRI/N"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4dx9jC3p7sz1XLy7D;
	Wed, 21 Jan 2026 17:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1769015517; x=1771607518; bh=xOSMgvHqNwU0THiBfH0FmkSk
	3FZgDqjg5jEtH0WfoE4=; b=jO/iRI/NBJB1dZrd1i/Tlxy5uXxrIJuiIuM7v9oO
	LXdhb0fhq7YfG96JTLc/VMz73hUwuzhx1FDlK3xd08L8L0iHEEA5h0mqDWMxgV9n
	uutjIf91adPNDeI1FIZU4S6Uf49d0AUrk/+zaE3aP3QAP2bjoXc++eglgAFGaFAD
	gdnd++80bzWNGIVO21TRPrHkoYjJBrPV0Waiw0SgEC8Q1qkG+qQX6o/iieqf7ova
	cdBIiecRlT0KuGKjYwmx7L/HsLxXx+U2cd3PFVJ/nQgqiaHP+NJZ6oyrrqI9YOJG
	GEheOw9+EnJ+Tue+hegmZI9XuRYXz5cnoa+9Ivkp3mFusA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id NvO2nETZMzNK; Wed, 21 Jan 2026 17:11:57 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4dx9j61MYbz1XM6JS;
	Wed, 21 Jan 2026 17:11:53 +0000 (UTC)
Message-ID: <2bd8f6cd-463c-45cf-80b3-5b9d123afb61@acm.org>
Date: Wed, 21 Jan 2026 09:11:53 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 2/4] locking/mutex: Add context analysis
To: Peter Zijlstra <peterz@infradead.org>, elver@google.com
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org,
 tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
 longman@redhat.com, hch@lst.de, rostedt@goodmis.org, llvm@lists.linux.dev
References: <20260121110704.221498346@infradead.org>
 <20260121111213.745353747@infradead.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260121111213.745353747@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/26 3:07 AM, Peter Zijlstra wrote:
> @@ -565,6 +574,8 @@ EXPORT_SYMBOL(mutex_unlock);
>    * of a unlocked mutex is not allowed.
>    */
>   void __sched ww_mutex_unlock(struct ww_mutex *lock)
> +	__releases(lock)
> +	__no_context_analysis
>   {
>   	__ww_mutex_unlock(lock);
>   	mutex_unlock(&lock->base);

"__releases()" annotations should be added to the declaration of a
function only instead of the definition, isn't it?

> @@ -824,22 +838,27 @@ EXPORT_SYMBOL(ww_mutex_trylock);
>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
>   void __sched
>   mutex_lock_nested(struct mutex *lock, unsigned int subclass)
> +	__acquires(lock)

Same comment here and below for the "__acquires()" annotation: I think
this annotation should be added to the function declaration only.

Thanks,

Bart.
