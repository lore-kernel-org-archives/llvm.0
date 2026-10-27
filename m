Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116024;
	b=U1j2bNTNa+1SFIyfLesI3ibiZM9/bsX0aPCJVBvlby5AeyPmnEGSQRUyiumvoLy/zRta
	 LxMiOeLQxXrCiFSdIqatFF393v2PA0AywbJQHfda07pR8VBXsC64Uk16bl/6cwoG/vZ32
	 w0ljccfZL+Mpo48ObOGJPbUwTojN1jD/KsrlBrI8Du9M4mZxIa7anTuKxQyeQYbHhTdzX
	 BJcBhDGNVL2QH9F43fvRQr3iVi+TsVB3w5yKsykN/OHpOpA7ccVPt5SA4uVLB/rlgbd5L
	 qJiaLZMkuM3+x/wjW0P7NoNVTwzPFMkfBGsfdyoZ68giz5fI1gWEb06mnXk2wWJfctg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c+t2RCt7p+zsicFUGs0SiXsBnjjHZ+TU2eQo8OoRVfQ=;
	b=xEDtaZNUWMuBJMZRxQRbROxbU+Ij3ohBCUeJgBY4j7bxaab0vu+Hw49iIiX3heBJ+rRO
	 g6/A9aDnVX7rDHqAPR4ebKg080rjd9D3ppkL/2Q1HNUx2ejD2AIfpf//50iQwCJxd3zn6
	 +7L3+jz1tXa+jAGp2Zu24i5hKUfE718gEGGktlbGpDGR77oaEtfonTuj6UVSZveFy0iFv
	 wq/A7UqeqoR1NoInt3PBMT3rfR3WwplB++JtpwQmeMVODfgkl6TKpkQC6uQddLQimM48e
	 VE8cws9KBufOyktHcsxbWEVCBIgX4zVfIUHcI4io9sRDZE1GjUy59djp+2ftbOJg+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9KQG1j7;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D94606AB4E
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D94606AB4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9KQG1j7
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c5358fc28so3887427f8f.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 08:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116022; x=1793720822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+t2RCt7p+zsicFUGs0SiXsBnjjHZ+TU2eQo8OoRVfQ=;
        b=D9KQG1j7mv8+iCpb9G+fEzsJ4jT6gjrEvE8ZsgoJHq19GmO/TRSjHmUfzmmlkJDh8z
         wxWQXlPq5S2p206xwr4gjlx1L23uDbflonLkvcI2uAWXyyIJef7g8PNld9gL18k3cwJS
         QsP0AdjuDNisUz1hn5DAG0MECRFGxKSLqWoOO5dUkFe3HboT9KENhKrAq1qk2x2a+aeD
         2hRinS/q2VX7nvoalToEKMNL19k+tA1FrTZP2n5GaGlQEFUEUvuPQy/LQOQ2IlrF9OOB
         G7FUhmWgOUxostXO1Hn3UaDv7OxKgLnUG3SGv8c5k3ShIv63Sm/qguYWaUokfcI4kf5o
         q4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116022; x=1793720822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+t2RCt7p+zsicFUGs0SiXsBnjjHZ+TU2eQo8OoRVfQ=;
        b=nf3l+EDVhUnOC1romfqUd1itzvF94eMoIDpavs8OrXiwYlDVizVZnZgTyOf/6gb+iJ
         n5BTY/bHSweY0o8PoJi6FMuPgjO3HbibJkMo5X5kxHmotrJ7qTB2yiRCgvwvakJXvbHl
         qq4QHutUcsEL1pb9NREztYIWOXG6rBzD/sLFCYpzPw0UfpmdWP04yK8jKLy94f8AmxCj
         6z3Hb5IhHB57BBSkHh0sYerYEyTuT5Mp/MpKioOr1gkVNXtUPAFg4nsMRuTMVXpAx1/x
         lfYwRLqagA6bBbDZ4ueJLDL5U57i6KMm7yxULkF5tZRSQI9neW9saUX6yyzXpl7uN0r5
         0Icw==
X-Forwarded-Encrypted: i=1; AKwUvBwnJEVloZAEGKvJh9T1/G+kpRlzJUyN2sQfQjWejdAy6QzDgE1xY2LEMuoQuSBBkIN5J6ZL@lists.linux.dev
X-Gm-Message-State: AFq9FYJaFhACR9sv2C7gSQzhdcNb1ekLTY5rqmWs1KcMBOWY/TIUT8U/
	SxzvayDPi4YPw5NfM0HINPjzi6hRuDVv78S5U/DPHk+1rPVMv/bMsWx7
X-Gm-Gg: AYBFou0HlBq2yuVwmH5pict4V5/dZCQCaNJb0D5XYbtkpLiT1Vn+n2Ee4++mJK9dMaV
	392QsnqTqOoMI2z3wyuAIaQTsgRw1hHrC+a7ymSLlJ1Qod4McbAY28L4ueaJoRAC2DYGaxQ740W
	2PM4zS2RgOs3rj9r3UKJrIEnBot3U3OswmxiG9ZxKAnp5IXUeBEFTxzvDBqwGy1wheDMd6LYR6F
	daVgbiBooSOA0dXlwwc1aKPH0tF0vz8ruHsihmFErA+2oUJROIy/oY1knISVltOzlDQtaMAkmhS
	0BgB5F8JBSuxCceV3yUVcPj46iKAXlAdeTVgXMtm/4wb0kstsA3jUCWkH9KqEVOA/irbKORPaAG
	Nxsj5ncm5YKrlXFw1b+UUu0WzLxQKAKbKvc2YF/QnuST/TDMSUvGBbKMBejbhaXnDih34bR17Ah
	ZwB3u+DK15PfsK5yzJpwZZB4hO28D228z2gMSbXLgHoJzIJVMNSo9DjS+o/7dwdgFa32RA+15zd
	P+PNEhQX9zDtDb138OMnHfK3AiqW3lTQ7Exvpzn7wrvHZ4hUxlRNmOhyj7UdRp3g013eLOCyt8C
	Hp6dJLNe5LxOZeFFkVWEueaMbqi0oSJJZpTjKVQdOCPgTvEhF5DCWsvtlwlCPIUgxva5fyOmxQb
	ajooI2CaUV8Cc0B3jJJFZWnYhB0gMOLcU345y6A==
X-Received: by 2002:a05:6000:469c:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-48e3eb9161fmr12046915f8f.36.1793116022012;
        Tue, 27 Oct 2026 08:47:02 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm23845574f8f.21.2026.10.27.08.46.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:47:01 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	iommu@lists.linux.dev
Subject: [RFC PATCH 04/14] KVM: guest_memfd: Keep truncated folios until the exports are updated
Date: Tue, 27 Oct 2026 15:46:39 +0000
Message-ID: <20261027154649.91571-5-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027154649.91571-1-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fred Griffoul <fgriffo@amazon.co.uk>

A punch hole frees the folios it truncates at once, but an export may
still map them, since it holds no reference: a device would then write
into freed memory.

Truncate a folio mode range batch by batch, holding a reference on each
folio until the exports are updated, so that a folio goes back to the
allocator only once no device maps it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 include/linux/guest_memfd.h | 28 ++++++++++++++--------------
 virt/kvm/guest_memfd.c      | 30 ++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/include/linux/guest_memfd.h b/include/linux/guest_memfd.h
index fdf7f8404d6c..ba3eebb1ed1a 100644
--- a/include/linux/guest_memfd.h
+++ b/include/linux/guest_memfd.h
@@ -89,14 +89,14 @@ static inline int kvm_gmem_revoke(struct inode *inode, pgoff_t start, size_t nr_
  * A subsystem that maps guest_memfd pages, such as iommufd, can neither pin
  * nor fault them.  It attaches to the file, looks up the frame behind each
  * shared page without taking a reference, and guest_memfd calls its update()
- * whenever what a lookup returns for a range may have changed: conversions and
- * memory failure.  update() makes the consumer's mappings of the range match
- * what a lookup returns now: a frame, or a hole for a private page or a page
- * without a frame.  It may be called for pages that did not change, and for
- * ranges that do not follow the blocks that lookups report: the consumer may
- * then remap whole blocks, also outside the range, e.g. to merge them into
- * larger mappings.  A consumer that can fault may instead only remove its
- * mappings of the range.
+ * whenever what a lookup returns for a range may have changed: conversions,
+ * punch holes and memory failure.  update() makes the consumer's mappings of
+ * the range match what a lookup returns now: a frame, or a hole for a private
+ * page or a page without a frame.  It may be called for pages that did not
+ * change, and for ranges that do not follow the blocks that lookups report:
+ * the consumer may then remap whole blocks, also outside the range, e.g. to
+ * merge them into larger mappings.  A consumer that can fault may instead only
+ * remove its mappings of the range.
  *
  * Until update() returns, the frames it replaces stay valid, so a consumer
  * may switch each mapping to its new target in one step; once it returns,
@@ -104,12 +104,12 @@ static inline int kvm_gmem_revoke(struct inode *inode, pgoff_t start, size_t nr_
  * that needs memory to apply one, e.g. to split a large mapping, reserves it
  * beforehand.
  *
- * guest_memfd calls update() with its invalidate lock held, exclusive when
- * pages convert and shared on memory failure, possibly with a folio of the
- * file locked; so update() may only call kvm_gmem_export_lookup_pfn().  Under
- * the shared lock, updates may run at the same time, also for overlapping
- * ranges.  The consumer holds a lock across a lookup and the mapping it
- * installs, which update() also takes.  Lock order:
+ * guest_memfd calls update() with its invalidate lock held, exclusive when it
+ * takes frames away or pages convert and shared on memory failure, possibly
+ * with a folio of the file locked; so update() may only call
+ * kvm_gmem_export_lookup_pfn().  Under the shared lock, updates may run at the
+ * same time, also for overlapping ranges.  The consumer holds a lock across a
+ * lookup and the mapping it installs, which update() also takes.  Lock order:
  *
  *   guest_memfd invalidate lock
  *     consumer lock
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 81031483a1f1..65a951fa49c2 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -424,7 +424,7 @@ static void kvm_gmem_invalidate_end(struct inode *inode, pgoff_t start,
 
 /*
  * What a lookup returns for [start, end) may have changed: exclusive lock when
- * pages converted, shared on memory failure.
+ * frames were taken away or pages converted, at least shared on memory failure.
  */
 static void kvm_gmem_update_exports(struct inode *inode, pgoff_t start,
 				    pgoff_t end)
@@ -437,6 +437,32 @@ static void kvm_gmem_update_exports(struct inode *inode, pgoff_t start,
 		e->ops->update(e, start, end - start);
 }
 
+/*
+ * Truncate [start, end) of a folio mode file.  The exports map the folios
+ * without references, so hold the folios until the exports are updated.
+ */
+static void kvm_gmem_truncate(struct inode *inode, pgoff_t start, pgoff_t end)
+{
+	struct folio_batch fbatch;
+	pgoff_t next = start;
+	unsigned int i;
+
+	folio_batch_init(&fbatch);
+	while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
+		pgoff_t first = max(fbatch.folios[0]->index, start);
+		pgoff_t last = min(next, end);
+
+		truncate_inode_pages_range(inode->i_mapping,
+					   (loff_t)first << PAGE_SHIFT,
+					   ((loff_t)last << PAGE_SHIFT) - 1);
+		kvm_gmem_update_exports(inode, first, last);
+		for (i = 0; i < folio_batch_count(&fbatch); i++)
+			folio_put(fbatch.folios[i]);
+		folio_batch_reinit(&fbatch);
+		cond_resched();
+	}
+}
+
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_RECLAIM
 static void kvm_gmem_pfn_reclaim(struct gmem_inode *gi, pgoff_t start, pgoff_t end)
 {
@@ -499,7 +525,7 @@ static int __kvm_gmem_revoke(struct inode *inode, pgoff_t start,
 		if (put_pfn_range)
 			gmem_provider_put_pfn_range(GMEM_I(inode), start, nr_pages);
 	} else {
-		truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
+		kvm_gmem_truncate(inode, start, end);
 	}
 
 	kvm_gmem_invalidate_end(inode, start, end);
-- 
2.47.3

