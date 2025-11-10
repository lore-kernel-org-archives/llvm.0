Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253A11487F6
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789421; cv=none; b=tcRNIFq9eptbudnAxpHkNRZpor+GmM8wZrCYiqO+5bJlcc7jpf+wr2PQXTjAghjikFEQvgW0CByypjGtoXdpAOxWrRSBFe1M2Jt3VQg1ebf6QJyzjaUbLvYBdOXgSWeXvEVzxySFD1RUEW0aHrxUa3wQIbsOHuG0aflLNqRx0Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789421; c=relaxed/simple;
	bh=lJGQMZvZZc4KMFQn1KPcnjNaqLnQgvkqHDsdmDw6EPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgjKKThP5qxbDB1kOiU8j6F7GrV3Vj145vwx1xAnNDY25KdltT7RdwYssD8orsb378DsMiaxtvsgOkCvSEYjFK5C8RgakhL9XxCgixh76KKl+yiawrwLXCONO4sUW6G5E3ZEoeHK4UjRmf9HX/Kc2ntOJ3Z9mLieA9/f/kB0Ohc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SigXPevX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SigXPevX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2980d9b7df5so12097125ad.3
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 07:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762789419; x=1763394219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLAK+1utwDQJnW79jqnXsBU1gEdDxofO6NOCNqDBYAA=;
        b=SigXPevXQpajThoxurp4vIuSn8sA4G+muP4JIzNDjt+MkRhGpZm8m/YrH0FZuLNOoD
         5A5tHbBpQCBM3EVTG2A1D6vDugMVSr6fUm4vCR9xLSkpkGPA/o1Vu4qIWKtvZceEZ53Q
         McNH0AthASIZPLqAavrOJoreoVSPuQmY2kySBCPTlkzytDAo27b1NUouQ7e1wZ6JdtHV
         oUNdW+WVeYWw8c5ZmQ14XY9hcEKfeWWr3WfBiUN/pVkdqOpqcyb63JWGlmWWarO+Lfyg
         XLxMPi3VfA2q2bTpmIP8DLD2yVBQWm1OD3XTFcnllb0yZJPFWb7dgp+qcFORzDkyfzrj
         u5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789419; x=1763394219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLAK+1utwDQJnW79jqnXsBU1gEdDxofO6NOCNqDBYAA=;
        b=SDg9lmNnhr/XdzfarW1Xi8yAmoar9UinYsJMYAZqbe7Bac9aaye04a+sFrPPMEwIlG
         6xSc45d1r+Km7xYxU2wIkr6Tuz/GnLzFFVlVz5uKyu26Kx9W+V7wEN24xc6IUs66BtC5
         y338pkV2mvH4GLGZSbbmt7C8tgqnqSnR/p4Nj8gRZNKMr1TGu4/3B22crHM+WUYsZQDR
         h4F96rvtTeQlExN24y8h0spElp8gUttwsRVk4Fk9B6sAjO7hf/lozgUjIaiTviMWAefP
         An/rGpBs5yGy6GKITmwVmSEtIB1q8mkuy84DlcyiebT2Gl9CDZBMMxWMEMcb+JcyXwNW
         sKCw==
X-Forwarded-Encrypted: i=1; AJvYcCVfU5FD/IiFcuAxQMRK6nUYU3FjD+iXgB+e8QcWjraN+uWm5kmzub0+6f7UF/lbvytmRITU@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+IDDPYu3qY8Sms5rlnDokVbxQo7asLoRhdB9pf5sCnYfrrr5Q
	TRubawRdq/GnZk2ImsGIYCK/ty/JvRxH3jqaRMbuRcH/tXyIDBrGmNok
X-Gm-Gg: ASbGncujbPK5j/YIH0tb9xp7ncOrviMxNhsiw1eUmoBkZUb3+nOr2F4rulj6adDUD/f
	4qx6cSF0ogoRLLXTDD3GCk+RD4/E8Zf4z1Pp3NsKOrxY0hHRjZpQMc9ZNJ3Yi9Ex5DKoat3cwLx
	IOo9sfcdNa+jZUv4UD5LWd92Uhh2FKl/pj9wFSWKEbA87lKj4E/4uKkQ9ofzSzuI4HfwOJWTskr
	S/RiwtL9S+/Y83VPlEGVNe0qTZb99A9GT9cyWKofuvKeabEHSyYkQHTq+PJ3BmhXt1JA6Jr2feU
	VxG2Vgc8EJ/yQNasA3njA1Y3I8/UJIXtchgOI6lAI/kF7tFcEwtKISUNnCDa8/3PJNHqi0NRXnl
	zb8sJ/mXxmlWpx4GdQ6mhk3T1/RAVG6PeGc5PGFoaatggdlEDMwXYWi3A5V/FDe8dtGxu7ZNmeD
	m9kbeAYvvicaVHMS5PeMzmV0o2oPDo0Y90yFo=
X-Google-Smtp-Source: AGHT+IFhicyH9W7Mg5DiwE8MVpN4/er0oaakdgICmjAbGBgQnJD5pAHwQ51RtSmFFQvyQKJ0R4B9cg==
X-Received: by 2002:a17:902:ea09:b0:269:ed31:6c50 with SMTP id d9443c01a7336-297e5408bbdmr106752805ad.10.1762789419238;
        Mon, 10 Nov 2025 07:43:39 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297d6859a92sm101566725ad.88.2025.11.10.07.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:43:38 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: arnd@arndb.de,
	david@redhat.com,
	tglx@linutronix.de,
	segher@kernel.crashing.org,
	riel@surriel.com,
	peterz@infradead.org,
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
Date: Mon, 10 Nov 2025 23:43:01 +0800
Message-ID: <20251110154301.1930-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <a034a57e-d9f1-4c56-87f0-e9126246849d@app.fastmail.com>
References: <a034a57e-d9f1-4c56-87f0-e9126246849d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 09 Nov 2025 18:35:23 +0100, Arnd Bergmann wrote:
> You can mark the caller as __attribute__((flatten)) to force all
> functions to be inlined into that one if possible. I don't know
> if that would be helpful or desired here though.
Thanks, you made me aware of this attribute for the first time, it is
really a great attribute, and it has been already added to the kernel
public header. However, it's rarely used in the kernel, which I really
think is a pity.

Perhaps, I can try adding this attribute to some hot functions in
another patch. For this patch, I think this is sufficient. There are some
cold if branches inside `__schedule`, __flatten will inline the function
calls in this part of the code, which may cause some unexpected
performance degradation.

>     Arnd

Xie Yuanbin
