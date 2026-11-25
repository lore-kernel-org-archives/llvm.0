Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645130;
	b=c7yNLOJV5VJPsoVlw/pLqZ7snQuEQuzNA1GrVkdmzTZsBB3BaRfVnKUcPn9TtxLhRLgJ
	 1jVPdeH/RTAMrH3iGdJeHslsHfMdiozqrE5weyWrsMi8OasND5MZ/5IEDfP4xtpMe7u8v
	 ntaG0i9GWjplat/iijzif9OzFXQId0LILJx/qq2MbiGULgdFnoUPdx2umYI3yAv33sl+t
	 Qh/m3gc7pc7hskcYaWFTFPeOSA5sFa0/0kh7WwAfRwSzkL31fGKTw4YX4i/NtvK6bRujy
	 q+y36dUDFQGNoWq9qpSNjNpWc2R0m8tVduFiK3S9V65BDyOE/0kj0UxeqKu3XmWcjrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=u2+GtbAzliCVLY4qt9XkKEEOn7y3no8jVdjlKGtflhg=;
	b=1f8GqeyxZ1kf9k7ID6N0/GEyMQC7l9hVC/zzFggJKHY6XC6/+8Har7sGETYg+f6Uki8Z
	 xx6egdNwgVkVKOk1VevigsFQ8Q1ZlHzV/ELQoCmm7EATIEx3zEtJOIFVFj84u7oqHR0Qj
	 T1+cRJL3lfmD/axMxdAD36h09OMFp0lorCAEeG+UiJ5AoMdwBZEqywIeMVNK4cunA8YWd
	 6actjW73PkV7O6BKgqHnd1JBupPjdu13oZD2YBSA9ErDl2VIemo6XnaH/KCGfeLnq4csT
	 EFpteamac3WBeQPfdcdplUdCEDzPykxmemKOiOMPDCy+XiwBzDDxUepz85gO7MJ7Nfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="p/dVNtpp";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8AA606A31E
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC8AA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p/dVNtpp
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so9493803eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645129; x=1796249929; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2+GtbAzliCVLY4qt9XkKEEOn7y3no8jVdjlKGtflhg=;
        b=p/dVNtppy9GCqwAoPn3/M6aLv2yPpoGLT9hRhMKNBceKBjODqveqIwCK2v5Lj6bw5y
         +e5F2WW27ALM+ivo2qwC9Cubtd8BHUR/Lu8LMDHtn971vLKnpuRXoSRlGrHi1nAuLWqO
         sfjOt3nSJ61k/vXyDv1t4tcE//xff0N8vpR1Pmzuxi3QBnaKlGDachwoAhz5Gf73S7S1
         UEogcH4Q/mejfYGtbas71PaCQtXKuK65g//FcZlcSJzDUeCSMYU1XPgRBmfVbK0RMUns
         z19cSZbbcK/tBxfCVeeuapl4qtwW7HbzEwDSGauvWzZmDvyCWrHX5ZE6lU/y6TljYlUx
         PSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645129; x=1796249929;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u2+GtbAzliCVLY4qt9XkKEEOn7y3no8jVdjlKGtflhg=;
        b=AWWOINYIjbvVHXQ4E1WZ08UAMN1vGEewXhNsYK1zvPJzs4fI+pZJcjxwl+ZXC1StSl
         Kw4dEyncpaVBmDTSM0e+DRfPCj/w11ZbHQE2iOK6LFGx6rNA3PXjJGiRxkdKmfCF96eJ
         GQ0q/ygah/hvZdQ9SG5/7UZ/ryWBLeO/k+sRhfCYfnRkN00jUPhxYTcsuEnb36F5k2ST
         BUR5d84E0FJAI7oE6+JpYoUt7q04n7Q9DbmbjmURJxuupIn2F61efxF2Z4mDvZbjteRs
         5k3qnj/ebKhh3ygM+lP4GsCNma7hhIf3Zgp01OPdDlYR+Bo4/vjHb59mtYGl1hdDm8Yv
         O9lw==
X-Forwarded-Encrypted: i=1; AL+hErFpgf3/zvuj83cknzmOcU6AEF1+Rgw6/d+/IimTj1cCyxUqS5g9gO3jCJXHJ8nRlLctNKrC@lists.linux.dev
X-Gm-Message-State: APuU4Z/7gI82AaxMvW2RdFQEAomKvmG286XxYgp1rW07drXSOS9pgvN8
	XLBicQ+mG+jhJ2G7rpaZPWPygVNk7KK5sF0ZfRYV3q9zfIS4nd7QulWA1qK2qsMSVh5RNabMZ4L
	ugw==
X-Received: from dybla7.prod.google.com ([2002:a05:7301:1a87:b0:381:610e:404b])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8948:20b0:386:b08e:4b7b
 with SMTP id 5a478bee46e88-386b08e4e93mr10610272eec.29.1795645128820; Wed, 25
 Nov 2026 14:18:48 -0800 (PST)
Date: Wed, 25 Nov 2026 22:18:12 +0000
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
Message-ID: <20261125221812.1423319-1-elkin@google.com>
Subject: [PATCH] nfs/blocklayout: use div64_u64() for chunk_size in bl_map_stripe()
From: Elkin Cruz <elkin@google.com>
To: Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In bl_map_stripe(), dev->chunk_size is a 64-bit integer (u64) decoded
from XDR. Passing dev->chunk_size to div_u64() silently truncates the
divisor to 32 bits, causing division by zero if chunk_size is a multiple
of 4 GiB and silent miscalculation for other values above U32_MAX.

Use div64_u64() to preserve full 64-bit division by dev->chunk_size,
and reject zero chunk_size or volumes_count upfront in bl_parse_stripe().

Fixes: 5466112f0935 ("pnfs/blocklayout: Fix a 64-bit division/remainder issue in bl_map_stripe")
Fixes: 5c83746a0cf2 ("pnfs/blocklayout: in-kernel GETDEVICEINFO XDR parsing")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Note: Liu Chao posted a patch on 2026-10-16 checking !chunk_size
(https://lore.kernel.org/r/20261016041139.2292455-1-liuc63@xiaopeng.com),
which is not yet in linux-next. This patch additionally fixes the 64-bit
truncation in div_u64() (which still divides by zero for non-zero multiples
of 4 GiB) and zero volumes_count. Happy to rebase on top of that patch if
it is already queued.

 fs/nfs/blocklayout/dev.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/blocklayout/dev.c b/fs/nfs/blocklayout/dev.c
index 00462e6affb1..8c7af13d45d0 100644
--- a/fs/nfs/blocklayout/dev.c
+++ b/fs/nfs/blocklayout/dev.c
@@ -274,7 +274,7 @@ static bool bl_map_stripe(struct pnfs_block_dev *dev, u64 offset,
 	u64 disk_chunk;
 	u64 disk_offset;
 
-	chunk = div_u64(offset, dev->chunk_size);
+	chunk = div64_u64(offset, dev->chunk_size);
 	disk_chunk = div_u64_rem(chunk, dev->nr_children, &chunk_idx);
 
 	if (chunk_idx >= dev->nr_children) {
@@ -536,6 +536,9 @@ bl_parse_stripe(struct nfs_server *server, struct pnfs_block_dev *d,
 	u64 len = 0;
 	int ret, i;
 
+	if (!v->stripe.chunk_size || !v->stripe.volumes_count)
+		return -EINVAL;
+
 	d->children = kzalloc_objs(struct pnfs_block_dev,
 				   v->stripe.volumes_count, gfp_mask);
 	if (!d->children)
-- 
2.56.1.839.g22a8290db9-goog

