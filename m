Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9AF34B1A6
	for <llvm@lists.linux.dev>; Wed,  4 Feb 2026 17:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227043; cv=none; b=C4RAT8nRg/CQhBVHXpMAHyDHnWgpPgNF4ejINEdmzDjR/PnxkN4LvZgrLrID+j4kEPC2BgUu3YFCYT5PonnRNEMqxbm2R4uF5mH1wf01nbMuWSCAhWm7eXukjyXylcuIuxISns84gdR6L0z7evma3fMCssN2ZGPBRiypq/iU42Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227043; c=relaxed/simple;
	bh=Jj65CgVvQwIN+K4kvUk6fe/kRjjhmiiDmhy59uo9eG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8F4uE3unLiCsihFSpixgNis6YDLGLnTjLrAd4KOQBeAbVPz3JZFADzVnr4lrpJW2NjuWxi6smENnWn3jRvVTl/zqXGlH1x/6XHA6uuYRGw+bZVsORgIp7G+khJQx29fMT6lYnylz+Z5E2550nfnMdMVuBh86ICzoB76c/r8QAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=aXDgUcN8; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="aXDgUcN8"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4f5nlk66FRzlh1Vj;
	Wed,  4 Feb 2026 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1770227040; x=1772819041; bh=Jj65CgVvQwIN+K4kvUk6fe/k
	RjjhmiiDmhy59uo9eG0=; b=aXDgUcN884Izlw58iZfoEnJuPuuvcuy1dQNLBXJ7
	wgq72X5w8I/wnqElmiKWHRlF/gQMwtGBYvvmak2nsZIBvYIJuXsa+ShsNTAp3uXr
	65o5B7kgf/B9Cf/JTt8H3PEV5H6P22eUYzQCg1IM/176zS8F0MbLPy/rK1TUADdf
	lj+74nOy6ANKlkiNcHG43OGpT6dOJKdJtptAX6oxZuEI7SFXkDs7TzymVW9gQb2q
	oTEsh1rFuvvngD2xzTrkPyXZy4gllJCxjLpGqGleYltNE7KkPgsOyeXAOqOI2pBz
	4x+K3T3PXqMZBkCtgceJp3ByV636Cy1vASq/p54Md1PKoQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id WukhywjaN0po; Wed,  4 Feb 2026 17:44:00 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4f5nlf4dtlzlfvq4;
	Wed,  4 Feb 2026 17:43:58 +0000 (UTC)
Message-ID: <1b7e8dd5-7bcc-4d91-9183-2ea0147f051e@acm.org>
Date: Wed, 4 Feb 2026 09:43:57 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH tip/locking/core] locking/rwlock: Fix
 write_trylock_irqsave() with CONFIG_INLINE_WRITE_TRYLOCK
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260203225114.3493538-1-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260203225114.3493538-1-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/26 2:50 PM, Marco Elver wrote:
> Move _raw_write_trylock_irqsave() after the _raw_write_trylock macro to
> ensure it uses the inlined version, fixing a linker error when inlining
> is enabled.
 > [ ... ]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602032101.dbxRfsWO-lkp@intel.com/
> Signed-off-by: Marco Elver <elver@google.com>

Has it been considered to add a Fixes: tag?

Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
