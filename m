Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D04B32861B
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 17:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018143; cv=none; b=r4VSZPVCp2cQ9eRJIQCXMZst1FAWP5Jrh8gNU5pp9/3etf7GH23FPfEn/tPzqtP7RYB6BnYz+6MVVYSN4LUjJiQ4CKszGuh47yfwn4sGZ1v6OHC23dzW4taFAPL0ufpVm7aqjb6sk6iFVF4wq+RrJ96+iN87yw15kEWNDD0p+BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018143; c=relaxed/simple;
	bh=hE0W8+pL1k5UFNacctIPgXh91tMEVWKlz/pMVy6MXgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhcCek7+4E4HcO4jjc06yAnWWEUWFT71jW5PebluCAZDLRTHsfxjks2BbktdFPXNs5s07WKOh7wepjOoucIPsO5HWKG3DdgoCDHwIU6xy8T73gocnQ5RJk67GvgVHDqKNvdI7nONB1yNwNE11/kQgm4M81XibJWUywc18RzMArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=oZLGlds6; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="oZLGlds6"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4dxBgc05xczlhH0g;
	Wed, 21 Jan 2026 17:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1769018137; x=1771610138; bh=hE0W8+pL1k5UFNacctIPgXh9
	1tMEVWKlz/pMVy6MXgM=; b=oZLGlds6a9+s4eBIIFjp5GgK/HWeCJ42kRXCfDyi
	+4XInGqLoiQfPYR5YQRa6fM9Ojz5EtR1iFwYL+sNzWN7wj9eOeWiQZMKVPhYrjpn
	/yeBMnQrfeyyHW2teymucIg3T9hZ3dMLtgROJZCqWWALu20CCaXv033tisGbWn6K
	j9f2zt1CyfhuEMjirmWH0rgmvuc0gYVyZB4HM4G+KOh2dM6eBvunxsRri9l1BDS+
	9uGglAXmzKbUMw9UdFNmfx3Sf7O9gyGyjlNbNM0ZVUArQhQ2Fq7Bghdj7WOwh/Xt
	OVuvLrMQBoEBisxZXubKLD7fhKCmDVPyHvUF4T1ocBWCyA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id NxPxqWvh0pkC; Wed, 21 Jan 2026 17:55:37 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4dxBgV6RwFzlh1Ss;
	Wed, 21 Jan 2026 17:55:34 +0000 (UTC)
Message-ID: <88eb6e92-446a-496b-a27b-a50e4ceb57eb@acm.org>
Date: Wed, 21 Jan 2026 09:55:33 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 1/4] compiler-context-analysys: Add __cond_releases()
To: Peter Zijlstra <peterz@infradead.org>, elver@google.com
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org,
 tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
 longman@redhat.com, hch@lst.de, rostedt@goodmis.org, llvm@lists.linux.dev
References: <20260121110704.221498346@infradead.org>
 <20260121111213.634625032@infradead.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260121111213.634625032@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/26 3:07 AM, Peter Zijlstra wrote:
> +#define __cond_releases(ret, x) __releases(x) __cond_acquires_impl_not_##ret(x)

Since we have __cond_acquires() and __cond_acquires_shared(), how about
also adding a __cond_releases_shared() macro?

Thanks,

Bart.
