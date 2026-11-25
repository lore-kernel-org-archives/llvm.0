Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645089;
	b=IsicECHS63Eqw9B6shmTzaW2LAlXAe8EmDidXjvSC3HRc0BRowUFzjsbrnUeCBdPv7ky
	 qcD8VYAZUzUHYO6BOfSmwWM2BXCkf/a2ZM/o9P2dX6t5FE4T5xfOioE68Gk4QFTFpc9jr
	 RAtgK3IsTRUkzAfmgG3Ym9ejSRP4vMvDQ7h7SEe9JZq7e5y7khIU/dhqzepm8sDyQKQ6s
	 T7FLIOs3XjC89np8SMkkqkmb4B0MPrgIRVGNu5qJkt5NzK5fHqUb7BwD76HCbwaExpL0C
	 cAPJKmDayOeeE+44J6nVlVtrPspGizLx+sNR7HrwD35Go7BYH1pKZ5StLzCjopISFLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=U3rkwBEE+18p3vjfjjwZvFEio3rbC1MDcEEs0NUhNuA=;
	b=PotoPvpDgS79gXqfBEK5KFVl/GP0RxCwYjASawtbkV2BEIHmKEjzOHEx6aDoKtbufWn8
	 T/F9FY15vi+ZY2wkAg4vLf5ujF3zCBWYqw555f0JdYL1Zzn3SsNovJCJt9ZydZISqzTn3
	 gk+mP2saX7pYoEi+VKZGT13lwk4D2E7ske7A3imSMuzSZ4IPe+kqmG6jN6yGHTKuga4Ti
	 wleSXZibNIZLSGxWdUEN0n1UWLZngFHFxTR7So2KSty4fjkSVluCltTCbNy44tkLDo2Na
	 UOQyPBLgjgoooK7IE2ArOhsfR1B0+/Ef00K9LwfBxpQY4SLDEj3hK1kxIXEDA5iVROA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UlYi0oZH;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8A606A330
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B8A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UlYi0oZH
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a65fca25so5297690eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645088; x=1796249888; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U3rkwBEE+18p3vjfjjwZvFEio3rbC1MDcEEs0NUhNuA=;
        b=UlYi0oZHidi2/8Xrm/dh7nqqoaRod9JdsGghmn7rf0QbUFrp59gHo1zH0YaDhuwipk
         JeUD4gNFLgU4AeD+WhFNy/XpJ7LB6wmuuVWY+0OrHsWKGpqCyTVi/8+BGg1TCB/SLeQn
         2vy+fIUvgRwmaG35Wu5raYBRgEzPhXQnsPZmUGu1lXJtNC9AvVuLf0/2nLqAbt7EJR5q
         t2gn9Xl8y7gNbzbmwiS9DYTDR8u/6kIBHFPAL7lF3F2rrkquzWJEx/Zogi4MlxxY6COU
         UNhKsausZgFF1sJS/isKRFK/jesMqICpHc6IMwXtOsnC1XW8m4jWDtDbrauXGgD7sJ8c
         HzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645088; x=1796249888;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U3rkwBEE+18p3vjfjjwZvFEio3rbC1MDcEEs0NUhNuA=;
        b=tWoG5PB1VrwVrn5s25GJwJpH5te9kw1kYWbdNDzfKWU/RNtmd5RXBSHUvj80kpl5eg
         TY0OnG38825YqMoQ0/Coido11CplPUH1R2kbVF8R2Ziq81Ds5ZUIg5BUglEjt1zEOt95
         RBn5wdn6r9hlsYwMAoR3NVTnZrTlx8Yj9xjOVoOjGrw38VH+1Sy3zi1i80jWupednkql
         gj+TxOVbe95G1CG3c3lWNqGHYE7gA9aeFgn12w5ltTmAINfqXRSmvPwo+cJL9mIv1qls
         JDHmzTixG98OmTnQ0mNHU3dbbA2anBy+pPWCxBs6jrjKVDAxCm1DvuXvxnhISWHRPYWM
         yxAQ==
X-Forwarded-Encrypted: i=1; AL+hErEisRgcWbqthFYxhgXY5e4Vo2+69PtbIvvWIahPSeJ+CF7KzOb3yA0Hu5pNuqHD05xY7FJB@lists.linux.dev
X-Gm-Message-State: APuU4Z8BCxLGMeJDQiangKKlQdkwnZlugvCxMcBmiwobl/7Z/SKAcHyf
	hhSLhWxA+FzfaNkDicDhu1EQ5Jzo6ARWciSIt9xCrfzM+Qkq+zNbePzUkvAsSSla6rXp4nP3E5g
	h7Q==
X-Received: from dyblf45.prod.google.com ([2002:a05:7301:a2d:b0:375:861c:512e])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:259a:b0:36e:800a:71fe
 with SMTP id 5a478bee46e88-3856c4b844cmr19042043eec.1.1795645087865; Wed, 25
 Nov 2026 14:18:07 -0800 (PST)
Date: Wed, 25 Nov 2026 22:17:28 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221730.1421806-1-elkin@google.com>
Subject: [PATCH 0/2] afs: fix NULL alist dereference and address bitmask shifts
From: Elkin Cruz <elkin@google.com>
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  afs: Guard NULL alist on restart in afs_select_vlserver()
  afs: Use bitops for fileserver address bitmasks

 fs/afs/rotate.c    |  7 ++++---
 fs/afs/vl_rotate.c | 15 +++++++++------
 2 files changed, 13 insertions(+), 9 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

