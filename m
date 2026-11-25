Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645093;
	b=ZEtQL8VThoakzjm6q4x6p4cVXji1eYh1CUtaED8ZqjiwUw1aB4kBAF83o13ojvWjdsir
	 HsNpMYsFKQylJDi/m7LesCEQzWCakBVpjcOYA1ltekYydle1WsJhgAJKKdDXMFfOhKHZ4
	 yiJVXefPXAwjfTgHug8F0iAhKs3A+yRWgnvQ8RgaJMu3Aqkp+uPYzSOXxjmq5N/9LcjLG
	 h3j8KYlDkJodXbwaR2j7ZvWYjTHDvjY0nnVeo+4cCTeE9X3O1ozOM2CSZwfNqiT+YmTfG
	 OvQH6YMdDpK2k1F1k8NOK0S2n3kJ9BKlFTO8n+MX7L1TZpkFW0BlH5gEYmefuGOqSlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VgqpPNqaZ4O4eWgZqdi1XZF/bmVHxvm7Tf4gaCeB8hw=;
	b=5I4fCihuq1HWzDGwlWsB9unewImWPhTw/X/VGm+jj84jMVUeVc6HEw/SSxYefhnbwNC/
	 Z/+dXXvfPe2QzQiEd85zLg78XSjtlYfGErUblDyK7q8keMrwVpug3EYu7o94gWwTpLDxc
	 jT1RUekIYOJL7TP3huTXhk5ZE25eENNTAICq1LWlBHy4AJC9SLVUR6JVkDQiMqToXLE5F
	 1uK9hbj5Od5Q6y5dnVk7o/0j/lNULBCpSUdxaCPtYDW8azOu8WpH//4KUWKSLgOjvcd5k
	 ZsSBaYQP7Xn8O2WfkKtZ08M06aXx13HhtmscimRJYGn3sV8G219had0bdXz6J0GoKaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HsHejouM;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B643606A32C
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B643606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HsHejouM
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6647462eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645092; x=1796249892; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgqpPNqaZ4O4eWgZqdi1XZF/bmVHxvm7Tf4gaCeB8hw=;
        b=HsHejouMzLlua1tkJwSPm3aLNK3KrOayQ6XL0QsWJp16CPyLwMjVeTtXXpMAxM1Wcr
         jOVzptWAtEhVgQvt1MoBOloj3RuH0IZBIoalGhLOSNn++LIHY+XUwPTSGjS3vTGUYUjc
         IrLVg0AkbWRcXwVu3kSOZHX7kEi1AQxXhj2z8QmoVun4BbbfA75xeS/spP1Rj42FQ56X
         2Ovd85BZtbYd3bRzlVCZZETA6tUL8WYoEsWlMaQtsUie/CewNsvWSR/2PSEjpPwew1J0
         CZFPIxSySyQNW4YkYUarenlBcy7cmFJ5xGkUm5Q8o/wnmAMHmj7KBCK9wZDiu+Q2FAgx
         lXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645092; x=1796249892;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgqpPNqaZ4O4eWgZqdi1XZF/bmVHxvm7Tf4gaCeB8hw=;
        b=SUAvsS5XQpm5VSOkdrBDyvzs80hYDbNWfFd6tzVWm/AnB7g1l7IfDqNfeexkR9Lxit
         boFnY8t8sf+VcVUIJXaEvlFykJ6mX6BLjE8Mi9LkzCo7Z08AcDLlEY9j24fVT2zQbOe6
         xrHEdF/3RGF2UO6CqrbJVWRWgFRjQWUslgHfnISp1dex4gqUc/WmFQmhdM74Xre/36rr
         1yeK7tKARPf5j+eLDG5qH6wR9kIKBHA8w15WnnqTP4rdDfWGjmRLBbBEVS2yGMhgPHXe
         rDybPZhoBTfXTPJ3yKlydpejAiIPccR/NhiigEurKM4aWHEtwl+vxeuXfhbykAmD39GK
         b0gw==
X-Forwarded-Encrypted: i=1; AL+hErGj6P5PCIvr/PgM6mYXepbXOkNmzt5Nrw7ar8l1z4rlRDxI/8TqTH/Hqm9nc9Pm3lVVBnsa@lists.linux.dev
X-Gm-Message-State: APuU4Z8u1IMgHsNoF8xvS7RAwpJoAKYwcSnJo51WeGePQPeiY6V1Z0M1
	mCQvkP2Y42g6LrkZtJyDBjNftVlcnHAnAE0UiINMwQBL552eJMcv/8ug3+YYv2HAFM5QNpC+ROg
	yvg==
X-Received: from dyah11-n2.prod.google.com ([2002:a05:693c:83cb:20b0:386:458d:ba4c])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8642:20b0:386:9e22:ca4c
 with SMTP id 5a478bee46e88-3869e22cc7emr17859030eec.35.1795645092222; Wed, 25
 Nov 2026 14:18:12 -0800 (PST)
Date: Wed, 25 Nov 2026 22:17:30 +0000
In-Reply-To: <20261125221730.1421806-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125221730.1421806-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221730.1421806-3-elkin@google.com>
Subject: [PATCH 2/2] afs: Use bitops for fileserver address bitmasks
From: Elkin Cruz <elkin@google.com>
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In afs_select_fileserver(), es->failed_set and set are unsigned long
bitmasks sized for AFS_MAX_ADDRESSES (BITS_PER_LONG). Testing bits via
32-bit signed shifts (1 << j and 1 << i) sign-extends at bit 31 and
invokes undefined behavior for bit positions >= 32 on 64-bit kernels.
Similarly, initializing s->untried_addrs via (1UL << nr_addrs) - 1
invokes shift undefined behavior when nr_addrs equals AFS_MAX_ADDRESSES.

Use test_bit() to inspect address bitmasks and GENMASK() to initialize
s->untried_addrs safely across all valid address counts.

Fixes: da0e01cc7079 ("afs: Fix fileserver rotation getting stuck")
Fixes: 495f2ae9e355 ("afs: Fix fileserver rotation")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 fs/afs/rotate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/afs/rotate.c b/fs/afs/rotate.c
index 490b433e4395..a0d293ed2aa4 100644
--- a/fs/afs/rotate.c
+++ b/fs/afs/rotate.c
@@ -64,7 +64,8 @@ static bool afs_start_fs_iteration(struct afs_operation *op,
 		s->endpoint_state = afs_get_endpoint_state(estate,
 							   afs_estate_trace_get_server_state);
 		s->probe_seq = estate->probe_seq;
-		s->untried_addrs = (1UL << estate->addresses->nr_addrs) - 1;
+		s->untried_addrs = estate->addresses->nr_addrs ?
+			GENMASK(estate->addresses->nr_addrs - 1, 0) : 0;
 		init_waitqueue_entry(&s->probe_waiter, current);
 		afs_get_address_preferences(op->net, estate->addresses);
 	}
@@ -556,7 +557,7 @@ bool afs_select_fileserver(struct afs_operation *op)
 
 		afs_get_address_preferences_rcu(op->net, sal);
 		for (j = 0; j < sal->nr_addrs; j++) {
-			if (es->failed_set & (1 << j))
+			if (test_bit(j, &es->failed_set))
 				continue;
 			if (!sal->addrs[j].peer)
 				continue;
@@ -617,7 +618,7 @@ bool afs_select_fileserver(struct afs_operation *op)
 	best_prio = -1;
 	addr_index = 0;
 	for (i = 0; i < alist->nr_addrs; i++) {
-		if (!(set & (1 << i)))
+		if (!test_bit(i, &set))
 			continue;
 		if (alist->addrs[i].prio > best_prio) {
 			addr_index = i;
-- 
2.56.1.839.g22a8290db9-goog

