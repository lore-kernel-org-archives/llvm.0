Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78C3D3CF7
	for <llvm@lists.linux.dev>; Thu, 15 Jan 2026 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768500289; cv=none; b=lE9iFeqic+/cOBVptIsH1j5ERqY1nImv0ZcQ0H1Lbt9Pogxt2C6HREku2Mv0gTtpv7MCKyFNu4nCxjMGRxwoSEZt1nDteo9AGmvrj+Oq4vm2cjgOIXuZytPGWUp7NQT8J9LocUANpxPqv7YBn1Wv/+rvF5LeSPbErWvn09AupS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768500289; c=relaxed/simple;
	bh=smvAemNn9fP3b0tn4JQFS54e5iomMzn3ONb2iCGkiGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxlF0D/u+pI2ACeUQ8SYO/4Vk0nvG5OlazpgW2e3ti2Bzstek8nf24Kvg6QZaM7xqwUcOoAHnUmW3diD7vYmrAJTHS7+OR+I/nlcG9lxZBZ5aMGw92j9iwx7xYP/r5sKLfpEQuhmP3YxxyZ/diYd1fYzzGh1RH9lu5T+697MQAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=w88XZ88J; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="w88XZ88J"
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4dsW8n6m4fz1XLwWq;
	Thu, 15 Jan 2026 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1768500279; x=1771092280; bh=smvAemNn9fP3b0tn4JQFS54e
	5iomMzn3ONb2iCGkiGA=; b=w88XZ88JnXLyKuM/wKNdFtV9/OsakVrm3Ri3mbop
	XvnuCwvJ5VoeZAoSlb2GW6O0aRsRdrrtJMVf8uqy1Dxm9Eiwggkw9y3i1xpZf/Lb
	xGh6QnbfUVoADT+d+VYjC+AxmiPsT24X6hIhsYyemUx4W0NFDxjBYKaUoJs1cvGu
	Ui/w1r4siknhuNB43cmYvHLgiKoy8upDXQ1ApNajRNFADmQ2+exRdKbHTfXNYyU6
	0EMQnAhEx11rZP1JL2/JPEIPmZzQwkhH2/75ArZ8iUQmihIOuBJap4ks1SZJopsp
	uJODWNm3Xd3+zVB9jbC88JlbIiUB+Sw/jxHbsDpJ2vEkcQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id lU1G1_26RRf2; Thu, 15 Jan 2026 18:04:39 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4dsW8g1kNHz1XLyhS;
	Thu, 15 Jan 2026 18:04:34 +0000 (UTC)
Message-ID: <6757ee97-6eaf-45d1-8dcf-327932cb8192@acm.org>
Date: Thu, 15 Jan 2026 10:04:34 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>
References: <20260115005231.1211866-1-elver@google.com>
 <c708b1c5-1165-47e6-a93c-54b2928716b6@acm.org>
 <CANpmjNPm5861mmHYMHoC9ErRfbLxmTy=MYwfsGC-YTpgP+z-Bw@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CANpmjNPm5861mmHYMHoC9ErRfbLxmTy=MYwfsGC-YTpgP+z-Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/26 10:58 AM, Marco Elver wrote:
> A corollary of this would be "If tooling can't handle a simple pattern
> of initializing a lock and guarded members, that's a hard show
> stopper".

That's your opinion. I'm not sure anyone else shares this opinion.

If an __assume_ctx_lock() annotation is missing from initialization
code, that will result in a clear and easy to fix error message.

Silently ignoring two classes of real bugs is a much worse choice in my
opinion than requesting __guarded_by() users to add an
__assume_ctx_lock() annotation in initialization code.

Bart.

