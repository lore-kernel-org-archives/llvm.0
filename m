Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C852D480E
	for <llvm@lists.linux.dev>; Mon, 15 Dec 2025 13:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804225; cv=none; b=EkbhdozDblhUKm+/XnKiaDb2slmC9t45QhjXNphlSh4FV5x5ngMiMhcWe2RcO6wchuTlgJB86AHrJal/2Pntf+Ob4clm64DYWtLyY62fDy45GbPxwvdFEBjNC7sc1mfKngN7CEmEqRv2PNciYAZfcMhwMCLM3R70arqnj/Uz+jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804225; c=relaxed/simple;
	bh=BM/PVPr4BUoxQ98yubiOVvCOB+UxL8diHIpcrjRnF1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnePyMDe99WqvjIx8pYKWMxags0Bx49ZZLO0V0WdpDTnDIL606QozoovyNbdg7LidOImGmt+9GOMbqUZfsmuK1excYunccwRgl3kx6ICaiB4prdC9XX/dr2TgFfjC08vhNqzYsEUKozjXJpQDc0WiV4ADsoJj+QfEICfwUqHwCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6A9fzxF; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6A9fzxF"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b9387df58cso5160171b3a.3
        for <llvm@lists.linux.dev>; Mon, 15 Dec 2025 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765804224; x=1766409024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BM/PVPr4BUoxQ98yubiOVvCOB+UxL8diHIpcrjRnF1s=;
        b=M6A9fzxFmgZk6SQ6KWoAZtymspuoLkLsCUvr31M1A+erQPPNWzXD9d878vKitC8kGL
         kWP2SxySAypuQ738lq1oouW2MmOKSu6YrdY8A1OOFSj1Yan6YovqOLA/khyEOqAfPcek
         ZTMF/gZ4h7LuK5mwltIucmU8yyY61a1GSRO/wxjO+RpZS1Fk4dE+BDRqZsAewjqmwxYX
         eIhHOX7fM1h910YclTk26z4GWher9IAvPbE0/Cb+/ft8qNopx7o2Pl/VKIHxWzWjyocl
         ICl3agxSNd7f02qKDA8GUeEIkPyw+efD/83nmZbuO6fMmaZZjyFrGuRvKCyK3B0wn2u+
         EadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765804224; x=1766409024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BM/PVPr4BUoxQ98yubiOVvCOB+UxL8diHIpcrjRnF1s=;
        b=iIzztzGVkQIZKI0/vXFWqN6lcs8qR244gH1MKfcVqz1DaSl0TgIk+/HkDDvK8tKRAI
         2vO0VOWuwrTfYX2rAm7HE/agWokkyERGi1VY+6t3pOXebm2KuZqrCpvwuS6lIygBL6tO
         1oyKRxMv0CFfReRybLRhJ/yH82BLNyEer/rWC+0LIxZJlywYKr8A4IF42C5JZ88GYn1g
         d829xYpVHh360hVw//MBWOMxZ6cB++mcAV+0Sk2Lc5DiEIIjLuvaM651DeC2k+x6y/bC
         lrxTvM4zJwFTmh5qVnKFT/91HJLAHTU2YRWgEoRZoITGoqRfpdTFAEQYmJgIP5S73V6m
         p5MA==
X-Forwarded-Encrypted: i=1; AJvYcCWGYUDdabgK9q9oBKJuA026std9rlTvI/cHHnbd8jBbiVXtoRYyiI6BEuOsmTdWkmnmNb/E@lists.linux.dev
X-Gm-Message-State: AOJu0YwXjZT0C1ucPArfzgxwS34iXGS2a8F70MYBV5edvOJh6O46X0ae
	ngaNG2tsKPfw2ZC9i2vppkqlgjxxkx6+YZ8sMyza5TIUjGg/mMoCWqgG
X-Gm-Gg: AY/fxX72Jvmw6mgYhxr5XzDDjjIcBP3CMFUOtKC9D5B4FRmFusLAwL4zf9DDpWznvcq
	teI+a2m12B8ckd8FR09rn+1PE0V/d3TfGO9zyNdk6NO1rREOkJyVNRYjFs0abg/DIdEaWcOGNqt
	lciYR1Ae/NTDvSFRg3LoeqJkolB0mc3bY//Qdz4Y7W/M73/6Mkwc/EGPzSsaGcqSMVmOdAInekW
	+e42FVsWOP6DfPFYrgcAdq2eX3Wlhm6yImMT3uOxb0/OE55K33o5rA6eT9TwmFQhzxVelVM0FUu
	NDD+RlejXUi2evCKIJcAXUw3J7LLIBrHYA0HwsfU7fACNkClrkz5vITrhBIEPnMraCxC8f/AnAU
	CDhMRI66DRgt4jAoachxa0Ol3j2rLobvpbBa022Xe7NpWmeVgeQKdKk+NhNC56YRaMEYIVJGJS+
	yFLcoGP6A09DKW9DgZ2QK9+RsDYMtfGbw=
X-Google-Smtp-Source: AGHT+IG3VwDpkA1WmQaMbo19+RTJgzIpgUIvYpPpKARDCY4wBFScDx5yKp0n9nH8m2HxqssodBKlAQ==
X-Received: by 2002:a05:6a00:b904:b0:7b9:d7c2:fdf6 with SMTP id d2e1a72fcca58-7f6679326b4mr10674588b3a.24.1765804223544;
        Mon, 15 Dec 2025 05:10:23 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c22848a7sm12761222b3a.3.2025.12.15.05.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 05:10:22 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
	david@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	akpm@linux-foundation.org,
	acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anshuman.khandual@arm.com,
	aou@eecs.berkeley.edu,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	irogers@google.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 0/3] Optimize code generation during context switching
Date: Mon, 15 Dec 2025 21:10:01 +0800
Message-ID: <20251215131001.1021-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251214190907.184793-1-qq570070308@gmail.com>
References: <20251214190907.184793-1-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is some additional testing information that needs to be
supplemented:
1.
On Mon, 15 Dec 2025 03:09:04 +0800, Xie Yuanbin Wrote:
> 2. Testing config:
> x86-64: `make x86_64_defconfig` first, then menuconfig setting:
> CONFIG_HZ=100
> CONFIG_DEBUG_ENTRY=n
> CONFIG_X86_DEBUG_FPU=n
> CONFIG_EXPERT=y
> CONFIG_MODIFY_LDT_SYSCALL=n
> CONFIG_STACKPROTECTOR=n
> CONFIG_BLK_DEV_NVME=y (just for boot)
>
> arm64: `make defconfig` first, then menuconfig setting:
> CONFIG_KVM=n
> CONFIG_HZ=100
> CONFIG_SHADOW_CALL_STACK=y
>
> arm32: `make multi_v7_defconfig` first, then menuconfig setting:
> CONFIG_ARCH_OMAP2PLUS_TYPICAL=n
> CONFIG_HIGHMEM=n

The above is the config for performance test, when testing for size, the
config is: `make x86_64_defconfig` first, then menuconfig setting:
CONFIG_SCHED_CORE=y
CONFIG_NO_HZ_FULL=y
CONFIG_CC_OPTIMIZE_FOR_SIZE=y (optional)

Enable CONFIG_SCHED_CORE and CONFIG_NO_HZ_FULL to test the modified code.

2. When testing with Raspberry Pi 3b, in order to make the test result
stable, the CPU frequency should be fixed. In detail, setting in
config.txt:
```config.txt
arm_boost=0
core_freq_fixed=1
arm_freq=1200
gpu_freq=250
sdram_freq=400
arm_freq_min=1200
gpu_freq_min=250
sdram_freq_min=400
```

Thanks!
