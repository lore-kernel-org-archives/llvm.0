Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E2B290D89
	for <llvm@lists.linux.dev>; Tue,  6 May 2025 04:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746505257; cv=none; b=XV/WXfP3HY2vzAWr7RxETmyIGOU0YVWOHiT7+bfRCvJH6yEgH0oyWuWTnaq6negURCDnz9VuKar2uYSIlgKcXXFRw08lfQSpRsSIAFUEjGd/hE1DG4XNHEsgzMfbBGD2Szl8ITboVHaV3yIb1pQwd5RQGk0TQQsp48PgJuuUIUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746505257; c=relaxed/simple;
	bh=pVQZNl61BvTNMC1esM6gOKyNfzv4TGbo0558he8/HRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g8TNKkP9bQBY3CHctyNoi7qX0sVxS6uzMLHLcytpCPwo/OcnTvbO0fgAoP0t5N8nRy7CpXy2zCuyjicdGDBuyG2Uco9dSAwY1EBqlc+0q/UBo7QbJh3JBr9ss8v9Am/pa8oYxIB1Bcxl8JiK0MXliU4QJJPSMr3V0pkLwoeH0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqaERNki; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqaERNki"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5b2472969so568380685a.1
        for <llvm@lists.linux.dev>; Mon, 05 May 2025 21:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746505255; x=1747110055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2vwoI4ctvg3OUvLdvQxgV4/ndZjYjci/lNS6bduvXMU=;
        b=KqaERNkiSQvZWO5bPt0gzsnQL0gvbDFSSPRCvVdGqUaXYkX8ERYUppmQnxl/efC2Hx
         D3YfdPT6L/8l0+kyagPEiDDi8ndFqNMNUMKFJWqE+L4IdJO6r6la2xtMs4NPLHXa2mQs
         TC5OkhRvrT1wj7D+0Un7Y+YXjfpQisV02VamPpmqgHsI2IXGHDZFQ0/XWNzC8kimXJGJ
         S32eWRDIOIN3pkxOw8cK3bGPeM73OjGXGgY/dlk773QRhmYLvetA5D3hPnU82aU+lbBC
         wtR9jRKEbn+KYYSAZznCbJGBEZCax5kf9BZMyvP+RXuNG0Zn46llBFjzYKX9UuSMGDUq
         G74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746505255; x=1747110055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vwoI4ctvg3OUvLdvQxgV4/ndZjYjci/lNS6bduvXMU=;
        b=T+bdJJc1/MnCCp8QzRdnZNn2fvFy2Eq6Gh6AMlP7q4uDfaMY0UrQqt9fBHqTjqviVl
         uwnJb/YLE7juG54B7VJA8b9K1SD4IkGWuvI6tv78eaJykhNvLL+aEKeEoG+28MmH0D8L
         HGjzjNSQOn7dbxHziTUIBtSEEJ8JvXyW/v/J57pOaLsO3xg0MzGVUPHM7toBNmG6ZpQS
         ZPVsT4hrY6abCbp9jTX9+6Pl92Kggqv/wH7bM8QqSP8+cM2FBV+W9jUBCxAg12Wmmz4z
         GnlzqvM/6YYonkM3npA36oTmEcJRlarB5uAZkUKOjzEBag6rml7F9DbhEemQK8DSSswA
         W7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJtmkyXolNEcGHS8hNsFs/yFKP7XuVS1TNP6Rt6MtOJ13Ffxt9m3kdVRGD9RZV5hjruo7t@lists.linux.dev
X-Gm-Message-State: AOJu0YwVr114KXQ9I7F6msIo52h0OfHzMm4Br9pftD1U7q8Q4qYQzttC
	XZJMAqMqfUmU/y0dvP1xjk9kKThQySCMLkXG0LTzDTbEMYjj4v6P
X-Gm-Gg: ASbGncsrYVv8EcdHntnvC/mOM08TOyHodNbeW+JDhFR9pHhO0xmWdJZ2ZEiQGq2+dwX
	pwpmPNtrjkRMz/HoItHdE1hhMqzQWET7pjBaIa8Aqd5xNZAWY1d4r+5V5i1vHW708H2AltlK1HO
	RSG/ty1JeuczlURU9MZXGioHL+3ZTwe4zhk6AfUynfiQdf4J773azIMb7wuutohO8XVk0WLrbHn
	6mOGSz0GLVUBF9CVEjVNnqe4rY6Bx1M2ckecfAXST+V7AYbeDEKvno5IX8DaVExidxJgyt0xfBI
	CdCXrm9cTyuEJ+SJff0d/q4fJY/zd9umkXkFFU4VpvyMdzbRDpuiv9QOLDPBiLwcMcGD5+CYRdh
	0x+XDlDaB+Vz41hXZ5ANWHfEX3s2o39B8IQ6C1jwEbQ==
X-Google-Smtp-Source: AGHT+IGwl87cjwXD/cO79soYsrh6cmHduAmn7pJJ5ISqhoSUJea19smragW3V2V7XhCUgTzGmZcZeQ==
X-Received: by 2002:a05:620a:25d2:b0:7c7:9349:e468 with SMTP id af79cd13be357-7caf110ca55mr187986485a.12.1746505255050;
        Mon, 05 May 2025 21:20:55 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad242b587sm658820885a.77.2025.05.05.21.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:20:54 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 118361200068;
	Tue,  6 May 2025 00:20:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 06 May 2025 00:20:54 -0400
X-ME-Sender: <xms:JY4ZaOEwSHx5BzvoujiuLvZIzlAaqKAsSVAlbHAMSIdoLuSRwh7TTw>
    <xme:JY4ZaPURCTxeM3nKhYV-JlEIgxly0z0PI9QIc7VXz_iC8C8pvJMhKu2PjJywXw5K8
    d0CpsF3fGqIgSSb3w>
X-ME-Received: <xmr:JY4ZaIIbO7HEM7u4QS25CSrBGkjcd4AjVpFWiNPAsKaE7yDw4dEoeg2y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeftddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefgteffhfehjeegtdduieffudetfeehgfegudej
    udfhieefgfeigfevueduleduffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehm
    ihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghp
    thhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnhgrthhhrg
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghr
    shdolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglh
    gvrdgtohhm
X-ME-Proxy: <xmx:JY4ZaIHunO3AWp01r831dn7NLQVL2JQ743CjUNKljkIz3ZyIeUym1Q>
    <xmx:JY4ZaEU3SSNY04NUqooPMUWj6HRy6AChETyoXldGl7jFr4QuaIlXXA>
    <xmx:JY4ZaLMiVxgdRGlXkXKIzt3MCg2_02Y5jlVS82XAuhsGFqMYrruHYA>
    <xmx:JY4ZaL0p6E89xHG_ZshofMEL1-vKjtyhfXI4qp8xmHC8eEFDdM4jbQ>
    <xmx:Jo4ZaFVgRgQqthH0Byfbph5VmnpB2oEtIraNAEhdqFaTjlrHopDlwO6_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 May 2025 00:20:53 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [GIT PULL] [PATCH 0/3] LOCKDEP changes for v6.16
Date: Mon,  5 May 2025 21:20:46 -0700
Message-Id: <20250506042049.50060-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ingo & Peter,

Please pull the lockdep changes for v6.16 into tip. I'm sending the
changes in patchset, but I also created a tag and the pull-request
message in case you want to directly pull. Thanks!

Regards,
Boqun

The following changes since commit 35e6b537af85d97e0aafd8f2829dfa884a22df20:

  lockdep: Remove disable_irq_lockdep() (2025-03-14 21:13:20 +0100)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/boqun/linux tags/lockdep-for-tip.2025.05.05

for you to fetch changes up to b3eec4e26ada8a71c40147b45026d2345f3b6ae3:

  locking/lockdep: Add # of dynamic keys stat to /proc/lockdep_stats (2025-05-04 11:03:02 -0700)

----------------------------------------------------------------
Lockdep changes for v6.16:

- Move hlock_equal() only under CONFIG_LOCKDEP_SMALL=y
- Prevent abuse of lockdep subclass in __lock_acquire()
- Add # of dynamic keys stat to /proc/lockdep_stats

----------------------------------------------------------------
Andy Shevchenko (1):
      lockdep: Move hlock_equal() to the respective ifdeffery

Waiman Long (2):
      locking/lockdep: Prevent abuse of lockdep subclass
      locking/lockdep: Add # of dynamic keys stat to /proc/lockdep_stats

 kernel/locking/lockdep.c           | 76 ++++++++++++++++++++------------------
 kernel/locking/lockdep_internals.h |  1 +
 kernel/locking/lockdep_proc.c      |  2 +
 3 files changed, 44 insertions(+), 35 deletions(-)

-- 
2.39.5 (Apple Git-154)

