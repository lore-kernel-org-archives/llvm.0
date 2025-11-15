Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B808E299931
	for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 14:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763215316; cv=none; b=K19nOvlABbTo5Pqv/PYdR7twPT6aC8woycFXm+zDVFCYntHQkQtKBidXfiiCQbD1wXQxbKIYcvyktu8En2ivSbg32OabxUxEZom/wHvuaPBeFUDstcMzhplxH5NluMZsXiHio4xEJa85oSos3CNMZqyJ9FsPoOGZR4Wad8JLs4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763215316; c=relaxed/simple;
	bh=olQBQzbLF3fdlc7j5Y7W4kleJFMfa0UsHIk6o2GsAbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzxfQvy6KCJ1ixUK42z45/Gmz/Idz+vGQ1/uN/gm1ifH7L+0ZyA8vKUdMCy1rLk0av1OO27yi2urq0wzIgILbUrvaYhPDWOqJj3B3sLufhQWtjBrig+wbWo6v/GGHPBilU8qqjnvxJWcQIidl3SI8YT94PpJSZAwNJVheVBX4q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAvI8jc5; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAvI8jc5"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3414de5b27eso2431556a91.0
        for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 06:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763215314; x=1763820114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olQBQzbLF3fdlc7j5Y7W4kleJFMfa0UsHIk6o2GsAbQ=;
        b=XAvI8jc5huPGLIv0sgy/SevsgQdbiDJIFEx40WNILj5JtgwzoPXaKj+ep5QzVZUV/Z
         4pBdRnSK1Rhp24SdLB3iuZ3fXNzU7l4dYoL/7gcyM++LwXbByV43D3iTCtAqFqTfain5
         bAMITeM5xO8H8PWFjBhPDmoGobkGyNZhGi2nE/PYMYzp5GAfbmC7tYqYShf7hDUSVslK
         DVHZ+oe/4opzoIKTFZkwHuLiS69khoy5aqvk2rmoYn1YTXvSNl4TWbW0rSMQtNT+hdSD
         rJcI/WWaV9YvDFMQvTps500ukO6mbR3Q+xGB7TdtiAnLg/mlcT34eQfDQFgX5Z9flerG
         ex1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763215314; x=1763820114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=olQBQzbLF3fdlc7j5Y7W4kleJFMfa0UsHIk6o2GsAbQ=;
        b=XBQdu2fISCkkgY9+waznWmpeYm0HG1EpZnTpKuRvMKxt9RHZ1Fjc9mjkqqp0sj6mQ1
         thm1fthhhWtrp+w5V+kxqmVFrnnHD5NoaJUxVMXw8Va9AtJdI9rlk44hbwxjThj5iMgt
         f86NuWs+X/A7LPCWrT/dzBmzyMxS7rcFqfDsMLcAF9Vkyr/vIn6xX4Jm44ZhCq0H++Wz
         FjfuqDYKnCYbzkj+Qv2aVa8yXq+cdUuQcBRbb1ValDL0yZD/vHiYwNxRSd1GDMrVGjhe
         uCGTfRtPYGkYQzP1a9bMAQH2QM86wCHswejutMSOaFpQpb6vtazcS4NZeLXdlt7yMc52
         rnwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6TMpjfUjt+5dI1ivliU7f9ycVnTZdmHfUdqFF3Z/OPMKcXT5GbQ+vxxlYZEj+oxjjE39i@lists.linux.dev
X-Gm-Message-State: AOJu0YzmQfemPglj/eD+cOUxts9n0mz8OQ9ebLZjMJKyhUW0cy1APRVF
	Wr2VbWVX9arGRgXwC8xEJHxdQqs6PMXgpH/gCKKtJzUl2N7piciZGbLo
X-Gm-Gg: ASbGncsWx3oZLWtAeZ8HM0wQXxh9+QfdDvIhB6/MXRLqEDiJ6SkrntGcMBTDe50/eOX
	frx5MbyAqapolSAjUbdCQDH+Y+qwjhf7CsKWf6uRIiVfIC5+S0qinGDhdt564I0j+Bo0PHDhb3/
	fe4KIV4G4BEXJqwacvr4vyfq96dK3cfVvfQynmAVf23uIJPFcVuZEX+W5VXr+rKtHxZARcdHItX
	b34PrpTRb74C8A+v/KXUlbGolDmAPS25HZWVkg+BvbrOnYqYRdxUEvOkQuGbmg92leBstEXcAir
	y0i+VdSTZDroN2RQli7tInqvdNS5jimzhrwrWecMPCHjeoBpawDBlnzSJ1M+ve+cDkrxF+MAZTD
	VTq0EcWTZzF+v/kzkEYlCqPLbaIhbe09j3sEfnjMb+pIikkm7zDCHcshNMjTR0oXGsK7urPNNNO
	T/e7nbSzsyox3WIHBs3Ak2z8hxZjke73FHKUs=
X-Google-Smtp-Source: AGHT+IG/TnOO0qzjxK2iaqcK1w8zb7Sll+uP2m9bSS0pCypnuHepcTcVoR++oPZWg3RSEvlIe1E8yg==
X-Received: by 2002:a17:90b:1dce:b0:33b:d74b:179 with SMTP id 98e67ed59e1d1-343fa74c2f3mr7051205a91.27.1763215313855;
        Sat, 15 Nov 2025 06:01:53 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37526d91fsm7478366a12.22.2025.11.15.06.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:01:52 -0800 (PST)
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
Subject: Re: [PATCH v3 2/3] Make raw_spin_rq_unlock inline
Date: Sat, 15 Nov 2025 22:01:08 +0800
Message-ID: <20251115140108.543-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <875xbcbdrm.ffs@tglx>
References: <875xbcbdrm.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 14 Nov 2025 20:44:13 +0100, Thomas Gleixner wrote:
> That inline does not guarantee that the compiler actually inlines
> it. clang is obnoxiously bad at that.

Yes, I know it. I modified it to __always_inline in patch 3.
This patch making it as inline to make the context look more harmonious.
Thanks!

Xie Yuanbin
