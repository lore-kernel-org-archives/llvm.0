Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332E2C11E2
	for <llvm@lists.linux.dev>; Mon, 22 Dec 2025 16:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422174; cv=none; b=ihUyLtdxE8vb35yx6fnD0qqrePwh8Jt10OsrL7UQ+uTkgGTpyIgZqLLyXL3ZFLRmoIN0MlXfq3+/wX63nEbF6aLQb3NuRYN45TttqyCXdpReLzzxUWg6gRWwfcJg5eMXxNapcSdaP0Gfqs42E2H3jlXf2IjaCpGLp8QDociiP50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422174; c=relaxed/simple;
	bh=uHCtXyk+QeDYWx6FYrKpt8TBQA4HduB+6BbofOvZbwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHpC0VJAS6jg9JliLmjuTMbpOejq5RapOZVbTTVcoWXjQAq0Xu9dDTZ/jWtg4dd76AdImb3Pcn3O7OcT9Wu2+UT6os7Ll1iR0PsMeWQvSFit5ORQJT7NpJSAtzwZKuNcMntY9MfgPotWRrTEdCurMDMwXNsezfBcA1fJO66rll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwgfRB12; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwgfRB12"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso5900726b3a.1
        for <llvm@lists.linux.dev>; Mon, 22 Dec 2025 08:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766422172; x=1767026972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHCtXyk+QeDYWx6FYrKpt8TBQA4HduB+6BbofOvZbwo=;
        b=VwgfRB12EXp1pHIomY00ImMrDG9uALMfHxYvGFk62eUtP7mlKuu8odBagrykU9wuPt
         Mvrf4W3xS01c34WcasOoKm55TP4aFBrTDwzfolLcY7a2aIfmSinBLudvO5KJB+nVDTTY
         bRjSMsk8LIcxzaLsteDljYEVNIbSuYi/wfaEgDBS79RjblfErv4vq/Q40Y8qAWGsGSBP
         yVFbyUpXzBLnieYKS+hdTZHlTsWNoKQuwHuYOnDmmWLB8gr1U79kOEcja2caFkiQHAVQ
         c/RFwtu52MJZrUrbcS7JjkvxUeVRcMaZV56GCrQYMvt5jQk8kx5ZZhLLSQrJAePHdBGn
         6hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422173; x=1767026973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHCtXyk+QeDYWx6FYrKpt8TBQA4HduB+6BbofOvZbwo=;
        b=mFTeaaRYZ806sXQw4BBjBfIrSwAvZjZ4KHZ98iMpyo7nmYxnFGwhkzHHZFrYDkbEyI
         Mz4d7Ei6abZGVNj2TvlP7jKV0dofocnDHehTX+5y3PAb7d1ShN4jBbIBqp1SEmaQi0Eu
         8GboASeXA1DMSd9VTjFMH7FjvnuHYYDrxRO8d/L+zzzqWq8zqjjRksnrSSBy9sBg2Cjl
         sYHhuTkSRwjRKd/rzLH7KEhw2cyRi+wIaMr7j8NXOAihqTnFZUs36+UvZXTETb8TTG0Y
         O7CQvLBu8Ixz6KhvmPQU1kvXVH1R0lk27TnPH95jawM2+9+l7gcovle9oSrchIHDx/+Y
         oylg==
X-Forwarded-Encrypted: i=1; AJvYcCUYabHkNVihQrWHJGHYsOLauOyRTElux2+tzBKup3kbKX1sXXHtXaNLRGWb95xhAvf6o9U0@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1lxJDLtz+EGt+z5dnd2LC8dvZ/CwIAW+jbbEkOvgsSGnmIgk6
	dOHnJ7S2aPVmfnFsA9mkFRG3oQvbSJkAmhWuq7wCKLnO8RMnYdr7b/u7
X-Gm-Gg: AY/fxX5liHbuz1NHi/LN64lAsa965t/8W+9Pck2VxWgQiuNHd0Y7TEiHR/ehhJDJdBG
	reFCWcl/zLku0h4sE4hVjt8SRIqpKclUf+MrhJSofr3nVaodreykUT+TNuVOz3RchqeLoW88g7J
	YNA/mBzUABTU7XptfA7+qJw/VOOZrqrJNRd4Z5ry5O2QMlBporv9+ewht6hQJI5zCphH3msPcrk
	03d8L1PMLsCYSrFIJ2HGgJT9l8TOELv6XNY40EBz4lKrZk0zP0jno9W7w28ZC71y+bVOep0tRUX
	7R9WVEt6WH8EWy2mXb0xD3/+IN6kEZCzTaG/dEdIY04JCVNmxHb4ccjEwIP6ir8K2Zvu4zyhrwC
	LcM+z28cf6F+xOcv1aF4+VTeycbfOEGINgPgWtOkrgUFfBf/hHp2yenmxZ4dLtJorrdMEuSat66
	rM+DxagUKUGGToB+JSpnO7Ip6dXfFr7YTPC1iz8cNMbQ==
X-Google-Smtp-Source: AGHT+IE1kSobyivF21U2b11KGtxcCjvRi7p3rr+R+RS7uDCxpPw8QK+rjeZvOZXB1HHavY3ezNQDyA==
X-Received: by 2002:a05:6a00:600c:b0:7e8:450c:618d with SMTP id d2e1a72fcca58-7ff664806c2mr10273618b3a.36.1766422172494;
        Mon, 22 Dec 2025 08:49:32 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a93b441sm10813272b3a.9.2025.12.22.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:49:32 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: peterz@infradead.org
Cc: acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anshuman.khandual@arm.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	david@kernel.org,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	irogers@google.com,
	james.clark@linaro.org,
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
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	riel@surriel.com,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	x86@kernel.org
Subject: Re: [PATCH v5 3/3] sched/core: Make finish_task_switch() and its subfunctions always inline
Date: Tue, 23 Dec 2025 00:48:15 +0800
Message-ID: <20251222164815.485-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251214191307.184897-1-qq570070308@gmail.com>
References: <20251214191307.184897-1-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Peter Zijlstra!

Could you please help review this patch? The content and testing of the
patch should be sufficient now.
Link: https://lore.kernel.org/20251214191307.184897-1-qq570070308@gmail.com

Thanks very much!
