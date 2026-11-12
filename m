Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794454761;
	b=ExZOfCNiJQySruCdsbOJ0PLL0AsVZqOfLruO2R+wfAVPlrptXPbnVURGJ//9WqGPC74i
	 AHQdRO8lCekuaMFlOGKdLS97pdxeoVsFI/X0BzxBl1SjrR4vuV+n1yiIInmhpZIcjwY4n
	 ItLu5oAgx2G9Rpr/ZpK3a+trREr1ZeVr/P0TPnN3T/ER6ZSzPqlX2g5s7mkLgrSNNn8c4
	 5DCAYL2Gz3hsjH60s2cr03UutBABylm5wdy6o6dTcW1ajk+dQdcGCkUGHcp3OY0xmAtnW
	 WjumrlWqwg6rmphpoyQ/pYXZAbWQbAVbOxgGbPn79TSbrkElDsru/6ja+GNeVnwlL6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794454761;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer;
	bh=lN/piXhtdPACOa13WtNqIwYIKwldh3lDc6Fab80206s=;
	b=slakr1LZb2Rd0kTWZEu3/ztuPys/fLw9HH/NBGjFo0IplzhSMTwVLpE+48Bah1XrQyBf
	 SpW8cnJV29OoZjzPWw6cFQZnPieOiI2VX+J2S9/5dJdHrfJCUqKiP+ktTzfXwH0xRMHgA
	 2ZktrnR0HNg5VuhpFxlimgdxT9Mf+kDEMxScv3782eMzip4Wjt02QdzAXMUKtiaejnA6B
	 XL9YPoz0ERW52Kc0kCU4hTkOq/nUsWb89xWZe4vb1zvVQvZcrZk2BEu9FSM7eJqW4YA/k
	 fhYEmBSiRR8/jyLt20xbTvWbF3zU76G92BJYCA+soKscubwxiDQLgA6WL0qPrQIo7Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dFuC2xlQ;
	arc=none smtp.remote-ip=91.218.175.118
Received: from mta0.migadu.com (out-118.mta0.migadu.com [91.218.175.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097D0606A321
	for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 03:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 097D0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dFuC2xlQ
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=WagULwVSRwlFPNiHuU3y1792mcFYfBmerRUsHRfoDYc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794454758; v=1; x=1795059558;
 b=dFuC2xlQS0kBW4rA/SkuuSMMjDzLesUOn3lOhPo3LqBgk+ewSOvk5zl+BH684JbONMg8J5CN
 4xRD7QC15enpDveMdaAKmTpkz2+oXbyUIkJa4ZzYbJZ0JQMH6LOyBxA4mXONTZPcf1i5xHKn+rz
 ciEjwSM/JXXx9dRkBFtehcLw=
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id da00386efe8865b5;
	Thu, 12 Nov 2026 03:39:18 +0000
X-Mizu-Trace-ID: da00386efe8865b5
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 11 Nov 2026 22:39:01 -0500
Subject: [PATCH] mm/shmem: drop the second folio batch from
 shmem_undo_range()
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-bug-mm-shmem-undo-frame-v1-1-e50a95b8f9b2@linux.dev>
X-B4-Tracking: v=1; b=H4sIANQ09WoC/x2MywqAIBAAfyX23EIK2eNXooPlantYC6UIon9Pm
 tscZh7IlJgyjNUDiS7OvMciqq5g3WwMhOyKg260UQVczoAimDchwTO6HX2yQmhMr3tSQ2ddC6U
 +Enm+//M0v+8HA8ESc2kAAAA=
To: Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>, 
 Qiliang Yuan <odys.yuan@gmail.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

shmem_undo_range() keeps a folio_batch and an array of FOLIO_BATCH_SIZE
indices on its stack. Removing truncated folios from the page cache in
batches added a second folio_batch to collect the folios to delete.

That grows the stack frame by about 200 bytes, past the 1024 byte limit
of mips eyeq6_defconfig built with clang.

Pass fbatch itself to delete_from_page_cache_batch() once the swap
entries are gone, as truncate_inode_pages_range() does. Undoing a failed
fallocate() only removes the folios that are not uptodate, so remove
those one at a time with truncate_inode_folio() as before.

Stack frame of shmem_undo_range() built with clang 18:

  config                before (bytes)  after (bytes)  change
  mips eyeq6_defconfig             928            720    -22%
  x86_64                           920            712    -23%

Fixes: b97fbd541ecba ("mm/shmem: remove truncated folios from the page cache in batches")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611112032.TMyPU6Rm-lkp@intel.com/
Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
David, this applies on top of b97fbd541ecba in shmem-7.5.misc; please
fold it in if you prefer.
---
 mm/shmem.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 156469423a866..5bcbdd6078a73 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1352,9 +1352,6 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
 	index = start;
 	while (index < end && find_lock_entries(mapping, &index, end - 1,
 			&fbatch, indices)) {
-		struct folio_batch remove;
-
-		folio_batch_init(&remove);
 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
 			folio = fbatch.folios[i];
 
@@ -1366,13 +1363,14 @@ static void shmem_undo_range(struct inode *inode, loff_t lstart, uoff_t lend,
 				continue;
 			}
 
-			if (!unfalloc || !folio_test_uptodate(folio)) {
+			if (!unfalloc)
 				truncate_cleanup_folio(folio);
-				folio_batch_add(&remove, folio);
-			}
+			else if (!folio_test_uptodate(folio))
+				truncate_inode_folio(mapping, folio);
 		}
-		delete_from_page_cache_batch(mapping, &remove);
 		folio_batch_remove_exceptionals(&fbatch);
+		if (!unfalloc)
+			delete_from_page_cache_batch(mapping, &fbatch);
 		for (i = 0; i < folio_batch_count(&fbatch); i++)
 			folio_unlock(fbatch.folios[i]);
 		folio_batch_release(&fbatch);

---
base-commit: b97fbd541ecba5d6640077618e9dfec6f5e71132
change-id: 20261111-bug-mm-shmem-undo-frame-66828e197ad5

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

