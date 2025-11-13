Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F5337BA4
	for <llvm@lists.linux.dev>; Thu, 13 Nov 2025 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763031793; cv=none; b=I7KW0Ps+1u0+14OlEHdHbTQpOMaO7bZ4YwVmXHaJRA9wwQzJKXeAXk7fpDhHqLVhXKcx3KE5gdjXyHgRLqu05jasaLN92Pn7lmpnFiJ/uO4rCMjCl7nBK0svEDSF04ISIuDRzKtjBHJCCB/z7hZLt4Wfmw79X9LLCyUPh0diYe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763031793; c=relaxed/simple;
	bh=/cKN1EDDwxjht3NnFiE/uLPr7VcrNdhZ1SW6uQPT/kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNUVChMYnh8aq3y0hQ39QqcxK0Rt7RHHYVRbNvvtvmOFhHraCZObERoqI/0Kab2gIe7SPPKKsiMLA6Tl6kUNIar0MY9BgI9liNdFZ4CAHVz1FC3bhdtbcJYa2iLSK/U60266oIqEf8Mxqkn2hGG3WwKSPIUJaVJ2Dl1AHVpNoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUkAr8zv; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUkAr8zv"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso407924a12.2
        for <llvm@lists.linux.dev>; Thu, 13 Nov 2025 03:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763031791; x=1763636591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cKN1EDDwxjht3NnFiE/uLPr7VcrNdhZ1SW6uQPT/kU=;
        b=JUkAr8zvSi0K9KIljg20MOuC6JLIgaQ14fV44wNNteLHSkyLK4mTlL+Y5rM0m2Ap/L
         mCO2ZeVOivkKQbNc0Ffmap/8JrGoqeKqZWcRQjIq1qtCTDmcYdTkkMz4gGS3lIw5Ra51
         wF8wZiovpeXUaPD/W0N2aNudGE5YnrjvB4WqcC2yaEpXR+zwQCv9EjVswKsGmIpZAN3T
         peWxOFBnvk6VtjV/10flzCD/bL4HUIqOgE0LDm/ogNrwbWqK/fpSoyvFYHbjAk7aZziX
         UIQhXLWfQHmmfx9A8V8JqiqSWDEaXE7ZrjGOW/DXZ3g1fia31UeCDKSg0hpz4pRX10J/
         s9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031791; x=1763636591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/cKN1EDDwxjht3NnFiE/uLPr7VcrNdhZ1SW6uQPT/kU=;
        b=DWQ+B7r02kYzMw3p7NxRxi5h9cKNmZGDFV24H2dcY03gQ+SvEI3CupZbnvtK7PDhyL
         wEWo/1IlPAOY/TjraOCTqltO/B15grMb8frEW/+TZGkznZzf3oca/cLVR3S2X7o74AfL
         5DzS/jMkCTnglp2pnD77WhszJdMLrf3E2/G2wt507bdn2LrUCuaGh7mwo1OkN1BLTMNo
         5SlM42OreURyPMABIJ26XR4RXLvAFl2WQ4Yc3DJTBBpKdktrkHo61p8Q1iLfZXrcT+ZK
         obmDyz+LoeZujBViHRjgWELG3yWquk/VNRZPGbm6IT1V3mFqoWHGL6h02f5iCTIb+wrv
         OaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb/Glyik5HbBTWTwXEMQS6/oKmTBRXi0u61OSTCqK4JtGtuP2yOUY3SvnyMSv3UUdvmyLJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+oGO4yPlTc8jpTaqZpn+4GFDNFnY3BXDGhWjkAoSfXx3yL6xB
	FlUwjx8cYKgtIn76iKZB5Dftr3tT8lbX/okt5li89ncPuVR6OU4NqIJk
X-Gm-Gg: ASbGncsBek7xQsaG4f3sIgIVvzlyy2NP9FKCKsL8MW4xivIooqqmGtayJSmR23/5bll
	XhdDTCHzKpXSWZeYhIcrIiaE3H/jgtejQ2lGLuvx/gShP1qIwao/J+Y8BS0/Nr5WmjWNPmM+Ygl
	hq9naeYXuVvGArgclp2uEq0Sx5+s8k4BMAHNMMCELNnTe+Eu+hgNe2Wzx4XitnWQdU2AUJhyml0
	OIs1NjS+5GY2fSsiF1Vcozw4Sa9O7arMCu2/jSmDP7yVMMapBrQPDYD0KIg6/FnId7/WyXWOmcs
	fmT+Spy0KaU4rphilqk0RjjtPFly3zi7ImJHcHgSPAHxEyCdolj1ElugTF0UeEIZF+Gr11NE28q
	/yxtqKaEFWpFUbd9rKguwxFmFOeqSrLFrKLLk8WuVZvJHfwO7HHK+Z1sGGuDIILLxBxI/ROrUWQ
	H9yUihL8Un1T8tuAyM564qQgEe
X-Google-Smtp-Source: AGHT+IGTrsN1hzBjRmhe38pf5EQcIYNA2LTSuiXM2QFdlDo95u5VGbYJOeAKPxxp1waIKqvLyyQ7Tg==
X-Received: by 2002:a17:903:8cc:b0:298:46a9:df01 with SMTP id d9443c01a7336-2984ed23fcemr89013665ad.3.1763031791060;
        Thu, 13 Nov 2025 03:03:11 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c242003sm21657015ad.24.2025.11.13.03.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 03:03:10 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: qq570070308@gmail.com,
	riel@surriel.com
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
	lkp@intel.com,
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
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	segher@kernel.crashing.org,
	sforshee@kernel.org,
	sparclinux@vger.kernel.org,
	svens@linux.ibm.com,
	tglx@linutronix.de,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v3 1/3] Make enter_lazy_tlb inline on x86
Date: Thu, 13 Nov 2025 19:02:46 +0800
Message-ID: <20251113110246.57703-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113105227.57650-2-qq570070308@gmail.com>
References: <20251113105227.57650-2-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Rik van Riel!

I fixed a build error in this patch, could you please review it again?
Link: https://lore.kernel.org/20251113105227.57650-2-qq570070308@gmail.com
Thanks!

Xie Yuanbin
