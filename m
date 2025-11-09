Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6D72FFF8F
	for <llvm@lists.linux.dev>; Sun,  9 Nov 2025 17:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762707873; cv=none; b=qtYYtv9+RMGYfucmIdAI8UPGj6FSOsbus3YiYIbSdC/j5a0qOUwFGW7U5UEP/CDWxkOMgnbHPCSSOdH/dYWOSi/TbcxKGAd+Ewg6EDMvk9yH8Uciv5nrfAGvvNcB91Y81ktaPxrYAGIxAymd+um4ULJsf2zulAbbDNDKbEIFIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762707873; c=relaxed/simple;
	bh=4K+T0yvpGk3Q2IrzYuDGX8XEZi6W9MmpXSWX8qogLWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kkzd7z5gbjr/D4ylY2fOMPszDe0f292T00jxtpPlzs+b5RkHSM4Gxi5ctICpg15k4LKhXdGOK964v2/Htw6NZkFnQkY9/L5AEEEY6CeRJizC8GpkoIJN6lz4EsIlXg4GCXUrDD0IBVphMwIoWHYW2P5H6qkC27Mtcnx1zg02tB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPWVgBPo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPWVgBPo"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2982237a3b3so518455ad.2
        for <llvm@lists.linux.dev>; Sun, 09 Nov 2025 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762707872; x=1763312672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K+T0yvpGk3Q2IrzYuDGX8XEZi6W9MmpXSWX8qogLWs=;
        b=FPWVgBPoEPKCvA9GPVHGt0/fjG0KnCCHGvbKqRxr4DOxBgVMosMJRo3hp+0jzY3YOY
         C2cjtmxPP1Ru7OAd6paaiGMriACLrz448U7iU8xF6eRygWUlpr6YMBvHBeEV6Jk6Vi3e
         9QcoW28uEwoXOOS6ckK0f/dm7ioOgZCRVVQe5yeWAtGmvlyA+OHx3OKNc5MvBbWzWqV8
         Wu1RiP+pN/FkjMJZPKqYJ/lyDL0cn1AP9GlpniVVSgHxdIbvp0b+kI3p3NSK8QTyQEQi
         BvgANHM3OLUOYElY94ixPNM/OJ2WwfPtc/SvN6rSw30uSGN1/suXulZffdjCa/dy66cZ
         VMPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762707872; x=1763312672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4K+T0yvpGk3Q2IrzYuDGX8XEZi6W9MmpXSWX8qogLWs=;
        b=YBLm11EEMA0J38JHSZqELFyeMmynYJh5myCR8AB1pHoBCXrXktlsm4KioSEWCCZb4J
         irb0cuetFelTpcz1uOjpPGIjorFWoHJRyVe4iIM21rLT8vkY3BvgLCl07c51XDHFZwrF
         faxQWT1RmEFMRXmed5oNIYy93ZkRKeNu6OxPWOI85RZGnBqmBfKikiJdOzHS/n+nS7LA
         mV2YY3PneZqldg07XaUx6yUg+3+D3sdQAMG/w5Xk8zRjoo/3MDeZQxdu7aDwlw4NbwmD
         EtwyGv+sTvtrhXFnOySLoOF8d5u03Rz9PeJW5pAh2oilxLG+h/mYg+SmMn45fDMTO85j
         bO9w==
X-Forwarded-Encrypted: i=1; AJvYcCUmAu2l3ca58mY/PqwrpuVqGnXhCrWTyM7q6cUS8hLrc+EBRCXHG459XjonjgWvKOMxSZ+v@lists.linux.dev
X-Gm-Message-State: AOJu0Yz08kQYVeDKMDRSWsa3GcVmTHJPLQGYoqnx00vzMjFanY6Gy/y5
	Aq8/SW2jcGtOh44b8kbDvuBJjzQqKAYHrjT3pwcVpMe9+PG1DXyltDkD
X-Gm-Gg: ASbGnctQx5HqugPUrmWxGho7+Wxq4U8DtX5aMYd54D5F7Upt/wQP0eYRHl+/lY+F0SG
	82+7lXFVt19y19jWiBmKVbBouNtWgko6vZwTVowZuuSYUfgJo02QybgE/gfQAkSljVs4NPUqGUO
	1WWMqRwm1v1w5QUOK4+alHY5rOb19WAmNhgSzDzDa5z1fzBz2o90UGD12+YG7EU0oi3Dh6E++j8
	ToM5UAE0NGCMe7I9dSGoUH8QY8htdGWqLbH0xqf5jvSgzrGtKW9L1dD0Ra2YxIhJmg4a4vKEjgV
	NNl1q3rfG2YKaff/i3xOGu22kiUXmOHtLRcnto1JlF9yNGvQRoP1w1UeV91WSYwM1hdo+roCKdn
	1DgonqkOmPY4gomTqXwJMZZTxqqCq5rCw9Gq5xG/ElROnsvE77iyxfbgwUfpkdZHsjADdGwStiy
	ZmiQf8Osdg5bd+/TdltIgMHI8/8A/U0mutb/k=
X-Google-Smtp-Source: AGHT+IEO5xU3ShKvIQJG0EYcsf90e1JVTbxU34yk/YUYIZqWcpmJ8G9BchXReIw1drUaTkP5NUMmRg==
X-Received: by 2002:a17:903:2f86:b0:297:c71d:851c with SMTP id d9443c01a7336-297e56be50emr71705165ad.36.1762707871570;
        Sun, 09 Nov 2025 09:04:31 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968253sm117879105ad.20.2025.11.09.09.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 09:04:29 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: peterz@infradead.org,
	david@redhat.com,
	tglx@linutronix.de,
	segher@kernel.crashing.org,
	riel@surriel.com,
	linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	luto@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	brauner@kernel.org,
	arnd@arndb.de,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	max.kellermann@ionos.com,
	ryan.roberts@arm.com,
	nysal@linux.ibm.com,
	urezki@gmail.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: Re: [PATCH v2 3/4] Provide the always inline version of some functions
Date: Mon, 10 Nov 2025 01:04:02 +0800
Message-ID: <20251109170402.145012-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251109113152.GA2545891@noisy.programming.kicks-ass.net>
References: <20251109113152.GA2545891@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 9 Nov 2025 12:31:52 +0100, Peter Zijlstra wrote:
> There isn't a single function in the entire kernel with an _ainline
> suffix, while there are a ton of _inline suffixed functions.
>
> On top of that, this function was already marked inline, and your
> compiler just chose to not inline them for raisins. Just make the thing
> __always_inline and forget, dont make thing extra ugly for no reason.

Simple test: "Make the original functions as __always_inline" VS
"Add the always inline version of these functions (with _ainline suffix)"

compile as OPTIMIZE_FOR_SIZE: the size of bzImage is same
compile as OPTIMIZE_FOR_PERFORMANCE: disassembly of vmlinux is same

Adding the always-inline version of these functions can provide better
guidance for compiler optimization, but it does indeed lead to more
complex code.
The best solution may be to prompt the compiler to always inline at a
specific calling point through some keyword.
I noticed that there are also people discussing this issue on stackerflow
, but it seems that the current compiler does not have such a feature.
Link: https://stackoverflow.com/questions/14571593

I have no objection to either option; it depends on the opinion of the
community maintainers.

Xie Yuanbin
