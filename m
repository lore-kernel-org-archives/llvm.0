Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE74A32
	for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763219400; cv=none; b=MQJUmziJ4Ge90StjlC6ToczXrZfaaVEkfvNpPG/eiGpsapVw6Gp3BlHaDgxWY6Gp7a9w5LyS8d/V7EDomYWoH0ltWl8eUyjXiHPmUdbh7iGTvdAMdM4NVLyGHb3uNbtBEo13XbA5V+Zzi4Czy+MM9eb3c/T1UPQtm1tzIlp5+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763219400; c=relaxed/simple;
	bh=9SA9SEdpJyHPt8tsp4kccmbvrFG5gu2WIbEuJq7mvJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SegHE2ha/+8X+YlgJ0qX9xnXM0d0/Y6ACqm3x2dQrChuYY+V315ebd0einPOSDD7InaNDPTlhADC75Bvp+Yk0HCPjoY7S7UV4kFeXi1UHF8DSSXDfdZXH4Zu/aSkG8pf3N0fwDpp3Flmt6rN6FWSOacPGUGhlS3n0PfgSR6kv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZNjZnby; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZNjZnby"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso3740139b3a.2
        for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 07:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763219398; x=1763824198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SA9SEdpJyHPt8tsp4kccmbvrFG5gu2WIbEuJq7mvJw=;
        b=YZNjZnbynWjAbNWVCAh/Nd9EzWl4JISkzUFvWt6J34Z+3L4KN32d2Xf1G+ws++57R2
         UCbRFTadJf1Tx0h97WqGa8yfzrIbd2iJj83oZx2MbqXgUC9jlQVY9zFrjJ8UbGhHnbaI
         s+s2CVX+F0JHM+qgn6WmKYsKvts0i5LRHrbLj+0W8a676+0PcmvhfJPkn6rGEWCVTtsv
         C+Ql53guthIHUvb/dZV7NUaU5QCD4vX94ykq+b0iKDqOFoSz+pyleIT6Ssgs0xrWpdzT
         34SPh2Tf+Bx7QTENdRrN53qMaEhBSv3aKwV/T+X07GA6KfpZN7mxydyEEX9Dnz3/fh2T
         qrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763219398; x=1763824198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SA9SEdpJyHPt8tsp4kccmbvrFG5gu2WIbEuJq7mvJw=;
        b=V9LsSJdC1XqVPeFTkqOVEVJ/FpRUXdH/OsXuLITVt1dFUiBoe2cPIt2Mc9wWhg0iVZ
         8P8bDembE60FJzyCDii7HjN47m21M+Fo1Iilj5vtjdRLoIA7sYcPoXCbCTuthQWX+V1N
         1hu0zet7srdlSmgSNtjnzVNvydjz3+Qnu6FWHMtcxIdYoLSUUt7sCr7S4TKVVbIXT0Ny
         0FlO1wmj9PqfIPwAQVNNfJl9F+NwBlIWk0Hh2q4v+YvbKmeiesqtqlY258vzgvc8w6Hh
         Ow6b33roKS4f9w/hxa+BM+dzhvCXprc7fdyCA9rM6P9rJ+Z8wGRto9ZsQz0zVGhTmbWG
         6Mow==
X-Forwarded-Encrypted: i=1; AJvYcCXNO4wTQAcm/OUxGlVg8H0BLS848g8Y6ECVxiZ5I0+KIRPUSpWakk5UN7THvQ/Fjt/rhham@lists.linux.dev
X-Gm-Message-State: AOJu0YwDbG1IB/RWDddYiJPYwxUID5wFfwIyhByvWDfOGU6TE3MsDGNB
	SKlCIxdh87QKTXdb8XzW5v1772pg9vsfJictbXGSAerW08qF02zymLU1
X-Gm-Gg: ASbGncsw9HuQTrMq1Ff+z/MK0C6btmFg2tUVnKTvvl+pUia1ygh2xvWRDNJysV7KSUh
	hem33uNbRKehm+BVH2hRvEDAGquocl0Vivq/RWSP++tJ87ZxOaXurFkT5FhhX1ENZ1jiYNqBDbu
	qI/BwaXkX/x/qVk+EXlVqh+j61xjSy1uDUaFnJqsIdb+PN1GlpIcs6mh9Gp+GaRI/mB+gX7GZE/
	zSYl1f+aT+nczhdYmQT4qnSjQFe5MK4J1RU01ds0HIE2eWrcxfvzUyCcAol+bL62P1FKGc7/uK5
	n13s4BpILjW0VhXIYTtd8CeYxiKYvZDcdId48eGdZjJro0vMYLcaqFHNDGlmd1PimkRDBlEYdqZ
	+qyeH1DIvm8tHBc6Mnwe+bZyeyIzLegiggpSO5DFADxkOgzdU2SDraL/5Oa/+d4lIYjtSYkoAOf
	GzEWRccT7jRBmUVfVVGAO/xl4nTUHNxsae6KY=
X-Google-Smtp-Source: AGHT+IHWcY+GtYxvT2QkvWrdoG6nA29trQIRuLrsD8pNdWPYP/nxv4eW9O/LAvnZtRfQqFwuGVp1RA==
X-Received: by 2002:a05:6a20:a109:b0:34f:c83b:b3f6 with SMTP id adf61e73a8af0-35ba2598aebmr8896833637.43.1763219398046;
        Sat, 15 Nov 2025 07:09:58 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm8266986b3a.69.2025.11.15.07.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 07:09:57 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de
Cc: aalbersh@redhat.com,
	acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	andrii@kernel.org,
	anna-maria@linutronix.de,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	baolin.wang@linux.alibaba.com,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	brauner@kernel.org,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	david@kernel.org,
	david@redhat.com,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	james.clark@linaro.org,
	jlayton@kernel.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	llvm@lists.linux.dev,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mhiramat@kernel.org,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	oleg@redhat.com,
	osalvador@suse.de,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	pjw@kernel.org,
	qq570070308@gmail.com,
	riel@surriel.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sforshee@kernel.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v3 3/3] Make finish_task_switch and its subfuncs inline in context switching
Date: Sat, 15 Nov 2025 23:09:28 +0800
Message-ID: <20251115150928.649-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87346gbd04.ffs@tglx>
References: <87346gbd04.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 14 Nov 2025 21:00:43 +0100, Thomas Gleixner wrote:
> What are subfuncs? This is not a SMS service. Use proper words and not
> made up abbreviations.
>
> Again you mark them __always_inline and not inline. Most of them are
> already 'inline'. Can you please precise in your wording?
>
> This really can go into the comment section below the first '---'
> separator. No point in having this in the change log.

Thanks for pointing it out, I will improve it in v4 patch.

>> After `finish_task_switch` is changed to an inline function, the number of
>> calls to the subfunctions (called by `finish_task_switch`) increases in
>> this translation unit due to the inline expansion of `finish_task_switch`.
>> Due to compiler optimization strategies, these functions may transition
>> from inline functions to non inline functions, which can actually lead to
>> performance degradation.
>
> I'm having a hard time to understand this word salad.

I think the description is very important here, because it explains why
it needs to make the subfunctions as __always_inline.
Where is difficult to understand specifically? Please point it out,
and I will improve the description in v4 patch. Thank you very much!

> What means (rdtsc)?

This is a high-precision timestamp acquisition method in x86.
The description here is not sufficient, thanks for pointing it out, I
will improve it in v4 patch.

> So the real benefit is observable when spectre_v2_user mitigations are
> enabled. You completely fail to explain that.

What kind of explanation is needed here?
```txt
When spectre_v2_user mitigation is enabled, kernel is likely to
preform branch prediction hardening inside switch_mm_irq_off, which can
drastically increase the branch prediction misses in subsequently
executed code.

On x86, this mitigation is enabled conditionally by default, but on other
architectures, for example arm32/aarch64, the mitigation may be fully
enabled by default.

`finish_task_switch` is right after `switch_mm_irq_off`, so makeing it
inline can achieve high performance benefits.
```
Is it ok? Thanks very much!

> bzImage size is completely irrelevant. What's interesting is how the
> size of the actual function changes.

I think the bzImage size is meaningful, at least for many embedded
devices. Due to compression algorithms, code size cannot directly reflect
to the compressed size.

Anyway, I will supplement the size of the .text section in the v4 patch.

Thanks very much!

Xie Yuanbin
