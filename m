Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D81423A72
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 21:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029385; cv=none; b=kBEpRJsg43bHzZEZaoqzmu/8q4d2w/wMNEgapCGg4FlYXe8G/QPM2Jh3dpUEFVuG4b/YQmS+5bIHBdfMIaBv02nZ4ZNypLFffdGrZj6saw0G3gLuyVVBxs+CvA/twQIXtjNXiIB3c3bqJDGLutreOqoCkb/qM619/TmnHSf1nCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029385; c=relaxed/simple;
	bh=UxPDFJbsRRdm0+UgfFGz229O6Kb1x2xtHblx/063QiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpZbBLp/qdd40y8irU82VNgf6q3oOK6CadhcOhPkOqdShaam+EKRfZ0jl4WLyx1DGZFWz1bOi4zxBcOQw2aMz1gxn2Bpa4KVHhxNHPiN/NmEh+saU1BBTTxKj35d+RCbbvh37OWV0aQ3ku33lTaWx10w47H5WpXueoTyHpMJ6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=kBEEKGHw; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="kBEEKGHw"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4dxGqq32mvzlh1T2;
	Wed, 21 Jan 2026 21:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1769029380; x=1771621381; bh=EjBriW7Gr+YzTwv1rwPj2Edr
	JPtUC6QcP0cOpLyHJy8=; b=kBEEKGHwQbCHMoYZg8w+bLweJJP7atQLVE6wYjJF
	5ksZmUb2MyuwUjehDzpoAZgx8OZpkbdtOTqiXeHU7v8J0AfownOtJ/Jaw3jDygnp
	cGxNdgCcnk52KHfXHUmRwcCirUUmzJSUyAeEfoUMxMtuVRTwvYxFJd/4fC1j40tC
	WUlAKphODsVTdFxQIdwVEhKa9cU7Abax2BcscA9M8+qhAyL3eZfW0o3UjhNb4z6T
	vzTDS43nhUGOGpK+XGuY9+OgiFUxEck7NNWoQBQosC8lpFWuOGyzgF8Q0sCOTnkF
	nFgxDQjwiK+5H6ch8y4Z+gMIbq0n0EDJFyu+UbQM6ijgJQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LXWKCauO-NzG; Wed, 21 Jan 2026 21:03:00 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4dxGqg3p6czlfgPY;
	Wed, 21 Jan 2026 21:02:55 +0000 (UTC)
Message-ID: <515968cb-ce32-48df-b6da-794b4a80c0a4@acm.org>
Date: Wed, 21 Jan 2026 13:02:54 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 1/4] compiler-context-analysys: Add __cond_releases()
To: Peter Zijlstra <peterz@infradead.org>, Marco Elver <elver@google.com>
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org,
 tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
 longman@redhat.com, hch@lst.de, rostedt@goodmis.org, llvm@lists.linux.dev
References: <20260121110704.221498346@infradead.org>
 <20260121111213.634625032@infradead.org>
 <88eb6e92-446a-496b-a27b-a50e4ceb57eb@acm.org>
 <CANpmjNOBJ12xUY9+tXx5ezFoFqo4BU4SLK7xofMGexvGNQR7tA@mail.gmail.com>
 <20260121190240.GL166857@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260121190240.GL166857@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/26 11:02 AM, Peter Zijlstra wrote:
> Right, this was an on-demand thing. Lets add it when it becomes needed.

Please take a look at vma_start_read() in mm/mmap_lock.c. I think that
it needs a __cond_shared_release() annotation. From the documentation
block above that function:

  * IMPORTANT: RCU lock must be held upon entering the function, but 
upon error
  *            IT IS RELEASED. The caller must handle this correctly.

Thanks,

Bart.
