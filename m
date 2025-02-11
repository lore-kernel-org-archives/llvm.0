Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BAD26A0CE
	for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 22:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313528; cv=none; b=OPx0bf9ZGvv4ZqG/EZ+EyYkjFtoomanEWo4OOdoHOrUoqcrIK5RbzxqEX9DTGrZPbAaJLKgcKgjqK6tZGBhTLomB61E31iawBIKlo6lmgeYzWQZ+tunzFYQso/uxIjxk56JNR0rAbw0+zUEXae4YTH5rtw+jFAT9/DWzx8UfHCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313528; c=relaxed/simple;
	bh=rB7BxSHW6EtSoabTXOHtfnbpaHJ0cVwUdAN/POuDev0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYRVZd8kp6XIYi++l56sC53zebUU5EkYcr1eV6o65THYGVrwlFp3ggEMJhytr8uSbu1lcpI50zQPtFC0LcNKXlKnj/i2DOAkGtiLLEyDl8YXKoqd98hfEU/RKQLMfioTPtEas9tL44SE22Mt5h1WMAvKnv/TNF+hv/fyMAf4pR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDFumqu6; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDFumqu6"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-46fee2b9c7aso50017451cf.2
        for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 14:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739313526; x=1739918326; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmBWEKaqUFBzqHGnnve5ouXXEJaAw0Livsmfx5tApoU=;
        b=VDFumqu67UvsnAuv6B9iUA4h1Am0lMb8u0QYiznNRS0U+ZS261V4sUm3XrB4govEwE
         RDtc5kAV3LNqlku6qbXZWgwnaCZpG4+q5oIcWNqD1ZYq+sSiQtHjIo/ay0VMg4rJoz+t
         nOwdoamqqhZ30ZXSFUDxwxeiDIVSElmq5tYPGRVOCjpMkRVzSoO2+EgOfzvabA93nI3v
         AZbgWeTaqJhPwwjqkpEzYIH9A9guNBpkcvaYTABuMVCP3Ft43VmsuyVacYu6y+oQMRd2
         4W1fdO+VbKoBvUtlpuX55bng6Lzd07jcTc1dLfMFOwvU9bz5ZaDMxocPO/M74Qa2E2SV
         UWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739313526; x=1739918326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmBWEKaqUFBzqHGnnve5ouXXEJaAw0Livsmfx5tApoU=;
        b=PHfWL6xg050i4+ihNPsen14x5dR70ZF/GnpLgqO/au34mcX6VVOQQWI9I2h7sNnLVU
         H1Q1NJNmwHUI7zX/4GSUjW1moFcLpIL3a34J/qm44A89y250x+cOkwTdTzjwiXLLjmZZ
         7Ik7eI3iRfd9aHnfgGoGrYcpfJ8duD0lENqRtBXmFwJfQ9buBEfVRzQeT6x8XYK6IBNt
         jf2z9JVtkJmG6wvQo626E9Wsim1N3QAzhZh5GFVA7rSyJK+2w3arfRlPTFQW89/y4jH6
         Y08op4LBDVx2/uyGhnCA/8MSvp/YmzAfSo9jK4e9T1t9l+CWELZ8RxcFW68vcCuRLq8j
         jIQw==
X-Forwarded-Encrypted: i=1; AJvYcCUoAOsVl935Pu3dKG6G/hFsElYBlra5BPATWhKsvO6rNlPGzB3faAOIMLrMbExjbBteAotU@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ8xF+bitzqVSJqDfjSnVJpKXeVWwG02sRKKv/bc5hEdmmMt60
	DlwUFhGg9xMdlcph07vS7faMaaOKk/iZ56D+0CBLE7sS6btPxgTP
X-Gm-Gg: ASbGnctRa5O3M12pZCVffQqnxWtd7BKlwCEz83t+71xz/Cdlu0ngOvaLk0T88J2r7II
	TDQXGzoNJbpO8EXFfYBJ/I2Pejr6EFwE6vkuSbnHHIo16BHjVDA34VljklujLB3AU1Xc6M4CMY/
	1J8MjbXlVQclNi9qVFGGlJlWNUp30TEfrBafkHpnTeJHhduJ+JhyzL2/RRVs4y3C1oKazLXklU2
	BfCs2LtpQ+ynJOZaNDB6LWTP0VHBUWQY0/stsz/GHKE6g4mle20il+BqnT73W+fXIaW6IHGrD42
	AHqLYj/nHt93l1M7ho2HmKbtCx4zCHMVzLLKQ5GsqKxa56PP4k5Y7ZSFEvNL752rmaLRN5jPReH
	YGMxcBg==
X-Google-Smtp-Source: AGHT+IEO9AyXzekNhsd8EdtjWApnNbjJdg5zmAFdkNj4BVJjZli/lTN21xPpUXmaP+8WJPWp5aYc3Q==
X-Received: by 2002:a05:622a:5c7:b0:467:8217:aae3 with SMTP id d75a77b69052e-471b070d34emr8123011cf.47.1739313526095;
        Tue, 11 Feb 2025 14:38:46 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44e550783sm51208976d6.86.2025.02.11.14.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:38:45 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 24AC1120006A;
	Tue, 11 Feb 2025 17:38:45 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 11 Feb 2025 17:38:45 -0500
X-ME-Sender: <xms:ddGrZ-7nz1pK_q1szOpi7W3KVQfGB-XsCxtvYKKHSFCUYYnRHFOyAQ>
    <xme:ddGrZ36wQ_AtIwyIEnrzPz9MTqCxGb1HYPIQBXW-9CQ0-HeLOyWL3Jr0oYh4_Wk8-
    KKepFtQkcS5Nh2ELg>
X-ME-Received: <xmr:ddGrZ9ex6wzy9h4GEuXb4Ji6kfd6in0yO8ApFAYVyRCsSp9VB3QMJ5oYwzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegvddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepthgrmhhirhgusehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopehp
    vghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehrvg
    guhhgrthdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprghkphhmse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehshhhurghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ddGrZ7JOOesaVFaui5eNoxq2f3auchwWtsWyE8m66QHx71LpWfYXuQ>
    <xmx:ddGrZyIydsiH7cRzEnKiS0iDVYY7mNhrlOBMcYSFPj6QZ8Nb625riA>
    <xmx:ddGrZ8yAnL9Y1Zxsi6NCcrSk0iHRiQjGbpNH7bQ-TWVsFvnmqdzh7w>
    <xmx:ddGrZ2KwB0gJlijq0EF6JOpuOYid2afthp6lzK_V_SKL7O9MEprt6w>
    <xmx:ddGrZ5byxjJ6W8bf1lypP9hPFBx7z2Cn6VnXABb2jNt_YIezVqI3F1g5>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Feb 2025 17:38:44 -0500 (EST)
Date: Tue, 11 Feb 2025 14:37:21 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] ww_mutex: convert self-test to KUnit
Message-ID: <Z6vRIZk7DsSNooFZ@boqun-archlinux>
References: <20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e@gmail.com>

Hi Tamir,

On Mon, Feb 10, 2025 at 10:59:12AM -0500, Tamir Duberstein wrote:
> Convert this unit test to a KUnit test.
> 

I would like to know the pros and cons between kunit tests and
kselftests, maybe someone Cced can answer that? It'll be good to put
these in the commit log as well.

Regards,
Boqun

> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> I tested this using:
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 ww_mutex
> 
> On success:
> ; [12:48:16] ================== ww_mutex (5 subtests) ===================
> ; [12:48:16] ======================= test_mutex  ========================
> ; [12:48:16] [PASSED] flags=0
> ; [12:48:16] [PASSED] flags=1
> ; [12:48:16] [PASSED] flags=2
> ; [12:48:16] [PASSED] flags=3
> ; [12:48:16] [PASSED] flags=4
> ; [12:48:17] [PASSED] flags=5
> ; [12:48:17] [PASSED] flags=6
> ; [12:48:17] [PASSED] flags=7
> ; [12:48:17] =================== [PASSED] test_mutex ====================
> ; [12:48:17] ========================= test_aa  =========================
> ; [12:48:17] [PASSED] lock
> ; [12:48:17] [PASSED] trylock
> ; [12:48:17] ===================== [PASSED] test_aa =====================
> ; [12:48:17] ======================== test_abba  ========================
> ; [12:48:17] [PASSED] trylock=0,resolve=0
> ; [12:48:17] [PASSED] trylock=1,resolve=1
> ; [12:48:17] [PASSED] trylock=0,resolve=0
> ; [12:48:17] [PASSED] trylock=1,resolve=1
> ; [12:48:17] ==================== [PASSED] test_abba ====================
> ; [12:48:17] ======================= test_cycle  ========================
> ; [12:48:17] [PASSED] nthreads=2
> ; [12:48:17] =================== [PASSED] test_cycle ====================
> ; [12:48:21] ========================= stress  ==========================
> ; [12:48:21] [PASSED] nlocks=16,nthreads_per_cpu=2,flags=1
> ; [12:48:23] [PASSED] nlocks=16,nthreads_per_cpu=2,flags=2
> ; [12:48:23] [PASSED] nlocks=2046,nthreads_per_cpu=3,flags=7
> ; [12:48:23] ===================== [PASSED] stress ======================
> ; [12:48:23] ==================== [PASSED] ww_mutex =====================
> ; [12:48:23] ============================================================
> ; [12:48:23] Testing complete. Ran 18 tests: passed: 18
> 
> On failure:
> ---
[...]
