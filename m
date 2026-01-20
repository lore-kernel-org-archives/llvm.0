Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BEC36C59E
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 09:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901749; cv=none; b=fLAxvKBf1LAnfLO//C9Z/OWTHom2wSNcL5WFSAJGOVtrA1Ku4ebqNOXDjtJC1mjsFe64OMFazHMhM9eFQY70Lu9STnyqQZ8YBGAQ3jk2sA6ZLaTqcD8N/R3s/4J6/9UxxbjOQwj3iDTF1coYTW3rkTA3YfIJZmxerEduRPSDVD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901749; c=relaxed/simple;
	bh=wC/hB+7f/T66i5Uj1i2nnMj4/Bruw5mYiaCtk5rSOJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A+liXs7hK9A/XJJvST7GFOGgL2XVofW0FKsLSckG1f7fuwOXerYEHMYRW4Uy789mSxcSmjRgXu6ncm2wYKMzzrf4x3uc8QuhOt18ykTY56UqviYX3zvaatV1se+P9XWlkYih15L4o26rY6zPUZHsatci0U+ML7THz+ZnMnzcFeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ekg534oN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2+eYGi3U; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=ekg534oN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2+eYGi3U; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ekg534oN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2+eYGi3U";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="ekg534oN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2+eYGi3U"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4C0E05BCCA;
	Tue, 20 Jan 2026 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768901745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ox3I2VUjUiyUeykdR5HqhsLvp9X5YEECxdvDNPMt1f4=;
	b=ekg534oNRQ/Er6cRg9OJdDRjzI9L7kXH5IPT9cgllfl7KMrcz1tY0urI/bNGy2j1ezMzVe
	3lcwDKzxk2GHECJUtiiThgktfRajlCtcqA0JmUiTl2xUgbpgNwLziHA6F0GKNQjQ0E4nQJ
	f9BEhPwY6FIB99YyHk9vYxmhbfXFOEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768901745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ox3I2VUjUiyUeykdR5HqhsLvp9X5YEECxdvDNPMt1f4=;
	b=2+eYGi3UPu+RtUafkfoYazRmwm3QkI1+JkL+pLo7cONt6upJY0tYFfvyrBNKDbXE4GnaAD
	vgzYqSVDvKXu4RCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=ekg534oN;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=2+eYGi3U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768901745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ox3I2VUjUiyUeykdR5HqhsLvp9X5YEECxdvDNPMt1f4=;
	b=ekg534oNRQ/Er6cRg9OJdDRjzI9L7kXH5IPT9cgllfl7KMrcz1tY0urI/bNGy2j1ezMzVe
	3lcwDKzxk2GHECJUtiiThgktfRajlCtcqA0JmUiTl2xUgbpgNwLziHA6F0GKNQjQ0E4nQJ
	f9BEhPwY6FIB99YyHk9vYxmhbfXFOEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768901745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ox3I2VUjUiyUeykdR5HqhsLvp9X5YEECxdvDNPMt1f4=;
	b=2+eYGi3UPu+RtUafkfoYazRmwm3QkI1+JkL+pLo7cONt6upJY0tYFfvyrBNKDbXE4GnaAD
	vgzYqSVDvKXu4RCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3803E3EA63;
	Tue, 20 Jan 2026 09:35:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BDFXDXFMb2lUOAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 20 Jan 2026 09:35:45 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 20 Jan 2026 10:35:42 +0100
Subject: [PATCH] slab: replace cache_from_obj() with inline checks
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-b4-remove_cache_from_obj-v1-1-ace30c41eecf@suse.cz>
X-B4-Tracking: v=1; b=H4sIAG1Mb2kC/x3MQQqAIBBA0avErBNUorKrRIjZWBOYMUIE0d2Tl
 m/x/wMZmTDDUD3AeFGmdBSougK/uWNFQUsxaKlbqbQUcyMYY7rQeuc3tIFTtGnehTIyeBdU2/U
 GSn4yBrr/9Ti97wd3v4SiagAAAA==
X-Change-ID: 20260120-b4-remove_cache_from_obj-190fcaf16789
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Eric Dumazet <edumazet@google.com>, Hao Li <hao.li@linux.dev>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4245; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=wC/hB+7f/T66i5Uj1i2nnMj4/Bruw5mYiaCtk5rSOJI=;
 b=owGbwMvMwMG4+8GG0kuuHbMYT6slMWTm++StNF00T2zTpZrrwQ+PXJm4sUTkSuZaZt1PezUm/
 5JrD2By6WT0Z2Fg5GCwFFNkqd59wlF0prLHNA/fjzCDWJlApkiLNDAAAQsDX25iXqmRjpGeqbah
 nqGhDpDJwMUpAFP9K4L9r8i0qbFTxVkczp9sumGweK+6h9pipgOSnBUXo9lND59cUdLfJZy87sL
 r5hPrptYnT26cYehc3nMkO2+hSu1xSf40TZXaJ08y7wlN952/xEPmwrdMq9LsSwb7k+dbq3fNd+
 /i+OGe2e30Zcnz1fPl7R8sfqf6OfnLSrnfR4SncSo33VEx//DdiklYytiidoZS19QXD1/xxbHcy
 Xhpp/u//+AWiYYVaqVKGlM/uUyyfv+5xmx7vEj8tLyiD9a10SXeQax9Zkz8x+b9UZjF/7lFQf0v
 7wIPJYPYeY9z2qM3bA+sVpU/tpk3WI//mCLLfvl3G95uNqneZ1ry1n7DrKoU+8I3Mz/kzrQNazr
 uNXkNAA==
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spam-Score: -4.51
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4C0E05BCCA
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
performs the warnings outside of the fastpath.

As a result the fastpath should be inlined in all configs and the
warnings are moved away.

Reported-by: Eric Dumazet <edumazet@google.com>
Closes: https://lore.kernel.org/all/20260115130642.3419324-1-edumazet@google.com/
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slub.c | 52 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 861592ac5425..1bdb4f73d61b 100644
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
@@ -6774,11 +6770,21 @@ static inline struct kmem_cache *cache_from_obj(struct kmem_cache *s, void *x)
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
 
@@ -7305,7 +7311,7 @@ int build_detached_freelist(struct kmem_cache *s, size_t size,
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

