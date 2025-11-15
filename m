Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401912D77F6
	for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763214927; cv=none; b=lNmGpbxRDj+waisPbVuK1NYNrJYDiJ+fB1XwQtcltwzKy4yUzoHQB5YoMGlXidUwDBGJsvmE84ek9/7N+7CpMgwEbgU+94VqFKcZbgZ/WOg9+JyDV1vlZnXU80qJZW+8QeuXjaceCQC5cDcvdNNQTYeINTCXkhIx/bHe/4zvAI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763214927; c=relaxed/simple;
	bh=y5QUmSKzlS0amBxXurpdk6aXWqflSKro/h9ErGoIjwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRLg7YPbsA7F/NvG+8QpgxSQL5G5dghcWHb+AOxxjrhmYiA3lWfabXrlMkA80GnugYDBwh7LUY4zht+6cqvdI703ENn+MEk47ziuKbVA/5BAUn8iHZGlGr4SNcd0CxbL6/uNUl3BLGzPOzXQ5keYxQ4JofLgtk0ubom0QvZXT3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWiCXpLO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWiCXpLO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3436d6aa66dso3053932a91.1
        for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763214925; x=1763819725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5QUmSKzlS0amBxXurpdk6aXWqflSKro/h9ErGoIjwQ=;
        b=hWiCXpLOcCKQkf7AbrcC6p1sW0c/L7jaEWmmY12jG7Iizgl8B5cXH3/eB06iRutBdd
         SPPvEGDNoHsnzzRWs9rh+akE0TPXE/oFCxe+JJpdGI248ArtmbvQHTQtb4Xu1BePnbS9
         upU7g2qKdBAJlE44zC2/wBYkgqLyLU984lmL9PuOV0eCeb6BQXjH5rOhy/5E/itimZBk
         zbY2raRuKdj1pgZefyVhhbB6l3dft2FW83d+7vKIMMTTLbgTN/NOUPdL42RZMZSjXh8z
         vRQScGkoF8sDFma4YrsducqoiZIx18EUmRgmlKv0gQ0W5yzGWAvw3CfbxjWFelJcq/RB
         BhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763214925; x=1763819725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y5QUmSKzlS0amBxXurpdk6aXWqflSKro/h9ErGoIjwQ=;
        b=j5fpqkPk/6LWCqQle39c5PbsvFp9JTt3IAKMqreAUkuzYaHMrXPl9P0heKhItjLDGT
         Cm01BaQHr5urNr7o7GJ+yhqlBvu4MvtgaMfgHCsBdXqGID+Vf2dc4P6fBggSJiN0QIvX
         0kWub3H53tYNsc5Th6I9rL80+ZOlQBh4qQcU8NKRUkRLZdZm7/jKv8aKlrHZd0iRP5XI
         6pMyYApaz9QsXyq91/5lxJRO6/LWxbGOx9Q0QBxcAbA9FbQtvdOhJtcgGFtvof0rK4xq
         pp6hZDiJqrxzKOTEhQuCeIrxFiAbI9UNm9HJydeCNGIHAhmV5BRWm2F6uHzQOBj2jIGU
         KqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaZbpMBLGa+Gd1/Jiff2I7BXM7rbAH0P+fe3mg80msQveFZXk8HEOzeQlRaO4O9mNrFvNY@lists.linux.dev
X-Gm-Message-State: AOJu0YwuLDNzVGMRNZPaxljSvt1VhO8zqI3ztd5X9+a9ZDOPKpifK1w4
	ANs+6F2XCedNkr/gRg6vofiyqFA0rZJXc/Y1+pXIzJRZg7AnMgRVvyOF
X-Gm-Gg: ASbGncv8vkYjRPgNMgALTJ2RZe4Xfe8UN1O6lLwDJvsKmKmd6ZCMl6ZV0d/PqMr3Ofp
	rxQYfBXir+vbV2FwpG85h8kpcTl90isuLZ6Y1HOUuUtz37IBU+x1g9eHxr1z6nz4Xx7hiXgqBgj
	vevcBSVElS4prQks1nXWi2UbKCLwbZOtgU+Z257ljd5u33Ljx7xeB5xBR6Ce0O14O6tOPj6L4xN
	A1nRdor0NYBasIczNDQt0U5Q1JI5f9NAp0eukm0ph8xe4hmWk8GRHBZUXKhrrbhRUnxs5oXOst1
	0dSQyhNVSQGK1VfQVuA900IvD1pbpuYOI1t142KwwYbYLCytEDhI0TXRvjlTc965mJnz9DyWolO
	iJ8fHexWvFD/3BsWEjuq4KGGIf3z+egBIj7JguhyvK54/h+NHVeCtARPKozqzFzShiHn2hZLfeN
	BSq+8xWufcqXZ3Y6gZOeKuM2g9e3MCi7/Aojw=
X-Google-Smtp-Source: AGHT+IFuTufEP59uKbwpymRKno9yjHG2whmUp7ulswIr3+CxbVVYv/nhc0N014IklbozTKH44HgIGw==
X-Received: by 2002:a17:90b:3503:b0:340:9d78:59 with SMTP id 98e67ed59e1d1-343eab07fc3mr11539361a91.3.1763214925468;
        Sat, 15 Nov 2025 05:55:25 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e071571fsm12590727a91.7.2025.11.15.05.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:55:25 -0800 (PST)
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
Subject: Re: [PATCH v3 1/3] Make enter_lazy_tlb inline on x86
Date: Sat, 15 Nov 2025 21:54:43 +0800
Message-ID: <20251115135443.460-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <878qg8bduc.ffs@tglx>
References: <878qg8bduc.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 14 Nov 2025 20:42:35 +0100, Thomas Gleixner wrote:
> Please use the documented way to denote functions in subject and change
> log:
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs
>
> Also you make this __always_inline and not inline.

Thanks for pointing it out, I will improve it in v4 patch.

Xie Yuanbin
