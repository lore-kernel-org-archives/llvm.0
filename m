Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794940774;
	b=5Zs1O5BTgZIPZxkdy990GZc+/630e8HOTbFw/kH3OX/zK9QjYiwyMSoqTyknDwmAGKqU
	 /e19MhMAbO2e9O3PEipYoZRF+A8uz4JSgqp0FdDls/07DNh20LPTOTq0vbFjJYr2jQfRO
	 HZmi3yNmY7XSWZTdgQw2+lUQO208DYdBfeFA2UAYOiy5CTyxmdmZ82U/hmB+Ye83haJdd
	 rFnJO6ksaIDgaNSybY2kEcW+ii1jfw+LcdzM/ON9r3yuOe+jZ1JFRFyABJsHCHot427sd
	 Xenk/UG4Td9DBBnCXhm0J5lN1FN0OsBzJrbUuu5JgC+OTvJK0mFhQ/n9ZBuPrvn8EHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lncRKJb281LFN/OuiZfN4zyt8y+KUOcywEPbnI0NV+o=;
	b=dTTycgOnBfjP8AqeIFwD24DqmbzsfCAdbiomhwsvBLvsFVFXda2wUt2piYLzlGo33Yku
	 0WATs3JVTF/xqgsTNqVtZEtsrhZbiXV7xCO2eSo2RDA9vzbKsa6UOcClCxyBVngjdnU75
	 X4HbSEtnxWfPFvFJej3elBsnaRJ9OeBWCa4/ZYFp2YYrLmIpZxMyU/rqFlEWwvBQ6svfw
	 CCGZ4BToD8Mb1PxdhFguoxD8172UDGxgHcL44DPAYT95pXGPsf24UikXhg1CtBVL9vM66
	 cwEk5MWJ932CCBtaR0dAmKNiXInXChE+AYK24b4btZMn16JHHiInLLLreEd+5zrQnOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BJMRm899;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90741606A32A
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90741606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BJMRm899
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so43351f8f.3
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:39:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794940768; cv=none;
        d=google.com; s=arc-20260327;
        b=qDp/Gin+1zSQIqeB9+koDazw+YoM6A1ZCqQS9ud54FEcLoBdUlsDqWs4RivjQznPO0
         ysGY3k+ezY1sp+MLq7Lfinga7FKkiCftIkfK+5JuTrOz6fFCjzucuh2DPk5Tp19M81KU
         J32z7T6t/JQYSzhszR+FD6xZy8W1ZRozj1bKmGF0fcBZ0QNg2jHUxvFtw4bZ5PRlFmML
         hSEC0HacD+E6gMI9VWGJk59BWlRRgP0p4vorsSDhxIcX6a1zs+hBX8+CUSG6DcYo+bWx
         NlbTbz69qsQSYCSDou3ciIZSvkz6itlETV4hvnyV+gnjlqzLsKX36yYS7qfKZSAj48MV
         cs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lncRKJb281LFN/OuiZfN4zyt8y+KUOcywEPbnI0NV+o=;
        fh=JFG4Gir2LCR/RDY5WJRVGzosZU0e1223Q2oUA3Gt9eQ=;
        b=d0FDGahXEPCTnrQdxT3/Z36DKOLfhpLtjj0eeQW7MeDw4dnZRdRANK4jYBSzVig0hF
         QcgTcqLgDnsM9njVEw3NAeWTVz+xTIQV8H26Z0SNzCK2YEIBC+EnggenYnPCjy13yVXg
         m36f7ihtjX9/EMnatgOGL/5odbqbSP3UIabQ1Lzek+F8j8HIVoamqUtJjxXRBRJRyucP
         hRDGTWyeu5yeW9RhAgwlOlpfvO8ZYAPIyEFLt+pRUybWPAPjm4jRUxj4pwHf/qk62QII
         YbWXMpsZYAJXfKWYBNkQGhu7Zb6d7foXkGB5yw+nP3iG1p6toAbW5scpHs6NtSZ08eCj
         xOzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794940768; x=1795545568; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lncRKJb281LFN/OuiZfN4zyt8y+KUOcywEPbnI0NV+o=;
        b=BJMRm899lO53ptufGpWOtP9HqIxBf8AqcJbqtqIgAzgLil3H4QvCRTsGWV5h7sikmK
         tThlw4StxhK88PCRrOG0tLkQv3LO0vKC9Er1fe3d5xO+5AfY3eAWnOrI5w7gC593l/pK
         0O6+pHxXVMge9BsfVdpTYvzs5gUIwcbAfwb6iBQpaqncP8oXG/NRCKKXctv7zrByMRCc
         I+HF3Q+uJSddD1ZpM09neEM9Hv8mm7QzvUIOZn1ffzKbDbuB+ShhwNq9r+FseNLouTbi
         /gxwRA2iNE3KBtIFfwaA8u0jRyn4bIypMREzF2rFI5lF+wnZkAUu3GEBONlYQI63IM9v
         gR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794940768; x=1795545568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lncRKJb281LFN/OuiZfN4zyt8y+KUOcywEPbnI0NV+o=;
        b=RsOq2KQJqXre7bl4p87WWpKcoezbvdm90JCDTwzWNZ4pmdhlM0xgWDJ6KC4ooFm9Mp
         eEF9uCnMGARD7oGt/F30ZGu+5qsSjAVBhzK3upbnPhvtb0OVLIz8aKzeJ6pHbbeLw5N3
         EMnMUNZgbMWxBa7thmeTvVhAs+KDb2bnfBCb9+3Vy28VYGbBlY1V+r0Hv7/wbD/mvX1P
         mfg8J7e9UZpFqsv0BA3b566I/zVs5OXhSCDUX0iOt9KzbYXNAGIO2K04+QX27tABfO3F
         xXR2OqF4fHp6ccF6RvanJ6cYXyxXcI3StyzXNtlbi4ZghuvlIWST4kLkZtKe+eiOfHKX
         /Now==
X-Forwarded-Encrypted: i=1; AL+hErF3BY1sArc9QKPVW/Zm5bmho8eM8r8jdXYFKA5w2ZvRFcbHkSe3i9yH9w0G9XJaIO0f8TRQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/6J4OIvMl99MrEqIRUGJ77uZXFbbUe0qSub6WM5bRO2Qc7+n3w
	Ms32yHTGenN8HQ8bGWdHWSlJ+rY4rrFPT5SI2ajJsGXOky4HlgHglojPLadFqHfSjDiKuElflDS
	q0Uh241RXbqQuKJsdBw/Rk3maGpEciTJfkWApYhJ1
X-Gm-Gg: AZFdTZfPPGGiCnlzEIRolzLtfJgnrd7/mP0x3GSYAdL5MnFQ0syH4qWFNw5rckkdYGy
	U6+KDmFmXlTFUyRoYckFmpYbBY+AgGaW/hnCKz9ihsh/YNEa7b/5OnRyy3kmJvSgOSxcKkFnehb
	kZ84jbUZfa9Wf3jEUX1W/yJW04WyZ9LUFEEkyXxmKtBx6mrwTvciGWjtOZpsVTYAjjX89C8RL1l
	DjLu3Xgx47Noj1tFxhIlukgfPms6fcPjMg9RJ9yS8cfi58NRkjGmL2wgeBpoggSjBEgeRqeMr8h
	q0n7bk2VeQKcinQvz+N3uOb6N/6xtDup3j8XCHd9kqfQd6EsmWoVxuorcjYK23XcyMDbYaOc/AE
	XbVlyJVFf9NcZTJ92Z7fqRpTnqsLXdzgLi4jz86zQHcUWPt+ofRv9+R82pIZ+fA5qKXiR22eRFJ
	qnpsFinxb10tI/2IcdXUiEzWHp7z1kWXHnridq2Pw6w2b81dVF1oqwEkes7nx/GA7ZcBHUDEPj+
	KwPl7iXq6Brq2WOgnylP4UwLOSCN20qBiNP7Q==
X-Received: by 2002:a5d:4b41:0:b0:4a3:8b21:51bf with SMTP id
 ffacd0b85a97d-4a63f182f83mr533473f8f.48.1794940767380; Tue, 17 Nov 2026
 10:39:27 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org> <20261117183043.GK1813469@noisy.programming.kicks-ass.net>
In-Reply-To: <20261117183043.GK1813469@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Nov 2026 10:39:15 -0800
X-Gm-Features: Aa3M54pKRYI09jyRw-sTO4FGJp-XI-xiu5wM8zF3drrRidtrcRZTdo0aa8zBllU
Message-ID: <CAKwvOd=9pjhCnreMvoAH_0PegYg60ouaZL=BAjB242bE48J23g@mail.gmail.com>
Subject: Re: [PATCH v2] sched/topology: Avoid unsequenced accesses to jiffies
 in sd_init()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:30=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> I don't speak enough C legal to actually understand the Changelog, but
> the actual change seems daft. Is this really needed?

I would imagine a delta of the disassembly here before/after the
change would make it more obvious (one less volatile access, which be
have arbitrary ordering between initializing other members).

But I guess I'm also curious why jiffies is defined as volatile
anyway? I thought the usual guidance was to use
cast-to-volatile-qualified pointer during access, rather than declare
as volatile?

--=20
Thanks,
~Nick Desaulniers
