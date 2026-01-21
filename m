Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3506C345753
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 06:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768978646; cv=none; b=fr/9k8UdI+4Z6LVwU+k31XKfCsFhZZf7CCLzjnpW/1K2px5NAhZlbkrANnzpgwMS9b+Q4pyE+gqEkpB/BgChi8JzoAVyWkkXWhzgthuLqDX91asVAE7kt9NX17Ufn/RwYJP7KWtK9RMHiy4G9dLi8x0zImC/QXzBUps+ZE/vl6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768978646; c=relaxed/simple;
	bh=15RYzhWLTEfcvtbEHKriVBTM8eBckeJmwTj2wXFUVKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FARQF8AJTKr9EsSoatY2B+HYdmlZd0OAvRNTaPBw0WbxN7zj3hBvA8nlSWR3gIO0bsfnAbio8mo2UOCJq/KOU5Om2mdd0DhCONAC9WGFYVZfwIE6rPisbCmefDx59vZFOY5jri3YABaXpZdRFNWBXA+obhZU7qhYlCOwDG5Si+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cUI9pn3n; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=LtaYqiOp; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cUI9pn3n; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=LtaYqiOp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cUI9pn3n";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="LtaYqiOp";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cUI9pn3n";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="LtaYqiOp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3960E5BCCA;
	Wed, 21 Jan 2026 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768978640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F2hV8Ptre9CxhtsWmxv63EQlnGTxB6W6LapKB5FH07U=;
	b=cUI9pn3nKjJKaX/2oqP2ioLEjYaq0DnhuStUmV5y9AYoIxb7U4roSXqtM8sP+sB5DndRhk
	JwtLuNGladv3JLqWStebq3cMdLHx+DdQ59gEUACaz9DZBqniQdMo5A3U9uILilAbVbRuJ9
	JpqC1uxCE7ZgCtEydhARfWs9PZ8W4sg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768978640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F2hV8Ptre9CxhtsWmxv63EQlnGTxB6W6LapKB5FH07U=;
	b=LtaYqiOpfp6zAANu2TdOQF5I7kziKq8HsDaJLp3WH/jvzXFUeBI8dS5l587mfPdMwwvx1P
	/UwfJrftpuryolDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=cUI9pn3n;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=LtaYqiOp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768978640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F2hV8Ptre9CxhtsWmxv63EQlnGTxB6W6LapKB5FH07U=;
	b=cUI9pn3nKjJKaX/2oqP2ioLEjYaq0DnhuStUmV5y9AYoIxb7U4roSXqtM8sP+sB5DndRhk
	JwtLuNGladv3JLqWStebq3cMdLHx+DdQ59gEUACaz9DZBqniQdMo5A3U9uILilAbVbRuJ9
	JpqC1uxCE7ZgCtEydhARfWs9PZ8W4sg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768978640;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F2hV8Ptre9CxhtsWmxv63EQlnGTxB6W6LapKB5FH07U=;
	b=LtaYqiOpfp6zAANu2TdOQF5I7kziKq8HsDaJLp3WH/jvzXFUeBI8dS5l587mfPdMwwvx1P
	/UwfJrftpuryolDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2779F3EA63;
	Wed, 21 Jan 2026 06:57:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wiJhCdB4cGl6JQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 21 Jan 2026 06:57:20 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Wed, 21 Jan 2026 07:57:10 +0100
Subject: [PATCH v2] slab: replace cache_from_obj() with inline checks
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-b4-remove_cache_from_obj-v2-1-7213d36b89d5@suse.cz>
X-B4-Tracking: v=1; b=H4sIAMV4cGkC/42NQQ7CIBBFr9LMWgyDTbWuvIdpCB0HwaTFgBK14
 e5iT+DyveS/v0Di6DnBsVkgcvbJh7mC2jRAzsxXFv5SGZRUnUQlxdiKyFPIrMmQY21jmHQYbwJ
 7aclY7PaHHur8Htn615o+D5WdT48Q3+tTxp/9I5pRoDDEO0ktMpM9pWfiLX1gKKV8AXZlhH++A
 AAA
X-Change-ID: 20260120-b4-remove_cache_from_obj-190fcaf16789
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Eric Dumazet <edumazet@google.com>, Hao Li <hao.li@linux.dev>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5211; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=15RYzhWLTEfcvtbEHKriVBTM8eBckeJmwTj2wXFUVKw=;
 b=owGbwMvMwMG4+8GG0kuuHbMYT6slMWQWVJzJ12rmbxVfrLxpwbkNSV5Kl8ODYouceTp+LJ983
 2JltUdBJ6M/CwMjB4OlmCJL9e4TjqIzlT2mefh+hBnEygQyRVqkgQEIWBj4chPzSo10jPRMtQ31
 DA11gEwGLk4BmOoaZQ6GGWUv1ix4ETE/s+/Ci2fnf7xqma98kefc77dP30o8fHLiSc59i0MN/u9
 nvUg79UX7+LG0931syuctf2j87phzZoqUQvP8jYl35u0+wlTVtFyr9S3DLb3Tr2smKRfk2pfHKk
 W+OOduOZdD66Nd6691hwXaHr83LWSKXjuN7fObqIsfewu/mn4J02a7qLF41pGu1O23pI3uuuioh
 p9a9J3x3EGDSZ5C/VxTzwSF5+TpWD3i2jpZXuOntVR5QMa9rGkpKTyTLnMe7o8o7V/zqf4Sk+e1
 lWzlqj2M8720s9vNbyo+EVhgGrU6jfuVabKtzkapF1suC2qWPV4h4CI1wVBz73S5TpMFByqaCnz
 2idkJAAA=
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spam-Score: -4.51
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,oracle.com:email,linux.dev:email];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3960E5BCCA
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Eric Dumazet has noticed cache_from_obj() is not inlined with clang and
suggested splitting it into two functions, where the smaller inlined one
assumes the fastpath is !CONFIG_SLAB_FREELIST_HARDENED. However most
distros enable it these days and so this would likely add a function
call to the object free fastpaths.

Instead take a step back and consider that cache_from_obj() is a relict
from when memcgs created their separate kmem_cache copies, as the
outdated comment in build_detached_freelist() reminds us.

Meanwhile hardening/debugging had reused cache_from_obj() to validate
that the freed object really belongs to a slab from the cache we think
we are freeing from.

In build_detached_freelist() simply remove this, because it did not
handle the NULL result from cache_from_obj() failure properly, nor
validate objects (for the NULL slab->slab_cache pointer) when called via
kfree_bulk(). If anyone is motivated to implement it properly, it should
be possible in a similar way to kmem_cache_free().

In kmem_cache_free(), do the hardening/debugging checks directly so they
are inlined by definition and virt_to_slab(obj) is performed just once.
In case they failed, call a newly introduced warn_free_bad_obj() that
performs the warnings outside of the fastpath, and leak the object.

As an intentional change, leak the object when slab->slab_cache differs
from the cache given to kmem_cache_free(). Previously we would only leak
when the object is not in a valid slab page or the slab->slab_cache
pointer is NULL, and otherwise trust the slab->slab_cache over the
kmem_cache_free() argument. But if those differ, it means something went
wrong enough that it's best not to continue freeing.

As a result the fastpath should be inlined in all configs and the
warnings are moved away.

Reported-by: Eric Dumazet <edumazet@google.com>
Closes: https://lore.kernel.org/all/20260115130642.3419324-1-edumazet@google.com/
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Hao Li <hao.li@linux.dev>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
I'll put this to slab/for-next. Thanks for the reviews!

Changes in v2:
- Add a comment and mention in the commit log that we are leaking the
  freed object also in cases where s != slab->slab_cache (Hao Li)
- Link to v1: https://patch.msgid.link/20260120-b4-remove_cache_from_obj-v1-1-ace30c41eecf@suse.cz
---
 mm/slub.c | 56 +++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 861592ac5425..fd915ea95121 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6738,30 +6738,26 @@ void ___cache_free(struct kmem_cache *cache, void *x, unsigned long addr)
 }
 #endif
 
-static inline struct kmem_cache *virt_to_cache(const void *obj)
+static noinline void warn_free_bad_obj(struct kmem_cache *s, void *obj)
 {
+	struct kmem_cache *cachep;
 	struct slab *slab;
 
 	slab = virt_to_slab(obj);
-	if (WARN_ONCE(!slab, "%s: Object is not a Slab page!\n", __func__))
-		return NULL;
-	return slab->slab_cache;
-}
-
-static inline struct kmem_cache *cache_from_obj(struct kmem_cache *s, void *x)
-{
-	struct kmem_cache *cachep;
+	if (WARN_ONCE(!slab,
+			"kmem_cache_free(%s, %p): object is not in a slab page\n",
+			s->name, obj))
+		return;
 
-	if (!IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) &&
-	    !kmem_cache_debug_flags(s, SLAB_CONSISTENCY_CHECKS))
-		return s;
+	cachep = slab->slab_cache;
 
-	cachep = virt_to_cache(x);
-	if (WARN(cachep && cachep != s,
-		 "%s: Wrong slab cache. %s but object is from %s\n",
-		 __func__, s->name, cachep->name))
-		print_tracking(cachep, x);
-	return cachep;
+	if (WARN_ONCE(cachep != s,
+			"kmem_cache_free(%s, %p): object belongs to different cache %s\n",
+			s->name, obj, cachep ? cachep->name : "(NULL)")) {
+		if (cachep)
+			print_tracking(cachep, obj);
+		return;
+	}
 }
 
 /**
@@ -6774,11 +6770,25 @@ static inline struct kmem_cache *cache_from_obj(struct kmem_cache *s, void *x)
  */
 void kmem_cache_free(struct kmem_cache *s, void *x)
 {
-	s = cache_from_obj(s, x);
-	if (!s)
-		return;
+	struct slab *slab;
+
+	slab = virt_to_slab(x);
+
+	if (IS_ENABLED(CONFIG_SLAB_FREELIST_HARDENED) ||
+	    kmem_cache_debug_flags(s, SLAB_CONSISTENCY_CHECKS)) {
+
+		/*
+		 * Intentionally leak the object in these cases, because it
+		 * would be too dangerous to continue.
+		 */
+		if (unlikely(!slab || (slab->slab_cache != s))) {
+			warn_free_bad_obj(s, x);
+			return;
+		}
+	}
+
 	trace_kmem_cache_free(_RET_IP_, x, s);
-	slab_free(s, virt_to_slab(x), x, _RET_IP_);
+	slab_free(s, slab, x, _RET_IP_);
 }
 EXPORT_SYMBOL(kmem_cache_free);
 
@@ -7305,7 +7315,7 @@ int build_detached_freelist(struct kmem_cache *s, size_t size,
 		df->s = slab->slab_cache;
 	} else {
 		df->slab = slab;
-		df->s = cache_from_obj(s, object); /* Support for memcg */
+		df->s = s;
 	}
 
 	/* Start new detached freelist */

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260120-b4-remove_cache_from_obj-190fcaf16789

Best regards,
-- 
Vlastimil Babka <vbabka@suse.cz>

