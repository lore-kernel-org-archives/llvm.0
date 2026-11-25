Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645163;
	b=VE3OUh9xWxv1+NcbFn0Owxqpb4WbK2dXtCI2nif5macowA7onnGB9SQGyODK4++OF9wS
	 hWqkj1ju7zL1bgNHQk6//0zRgNbtkJuV7j1EkLe6MkelIFCv/8sKZ/n9lPmKK8SNuaaI/
	 cl4q5FdFN5ea0/1oZy2+wsbGlTpAowERpM4haSqFceyMOgnwG1cffNTn77jSFYNpM/jNE
	 PaBZJKg9E4db9RpC8t87PtUIf64DECv9EChWlH0pONoIZKG7bPHVbJFrpbSrUnPu8gy/O
	 yXaEthypBbdDa7KcuBClDCTvYDo4cqBpnvkE5DuDYsehwBj7kHZApxzK+Pt6FhubTgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/mM0J1a71Wn6f8VLov8bY8YKxe1QvMRR/3m9TE5bYfk=;
	b=1Xbppeh3ho6Z+A5W40QPWvjE5sWn9lL3aqlXYXCM5VYr5Q+kOf4WJOsWQzNaZ2DLf4n5
	 U6QfHkCKzD5rcS6TBeRnCowN/QsPiSKrfys2+VVoN0y8qAXmazxa4alTmdyLt5+W/Gmh1
	 Ji6OCqMF0HaCNGDOxEiDrbdjhxATZdUJLEqzgNj+6tJ9slTXsT0NWBSNN/I+iEdCFjNCK
	 Z0tfjDT43+TXlwkeYqxA7QuO2kaPqioL1zptYn+AXooEdYFUHKsRizQdEcuJKd7zH1rlU
	 wRJ2ELjQDoVPvoJKBPkxgx7/4ABcCd+T2NBmFTPSyDwKt3tq+9TWy5OfvY0/+aUkLQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="IMuAQ+N/";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6B6606A326
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F6B6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IMuAQ+N/
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a65fca25so5298881eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645162; x=1796249962; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/mM0J1a71Wn6f8VLov8bY8YKxe1QvMRR/3m9TE5bYfk=;
        b=IMuAQ+N/PpPOSOPUdYz8vSwclL1Ri5F8fgt2VVggtubZaKTgDNQzPLhfMR5mhelQv7
         HBI5FiDB3agX/NZgI0uElvFRJLLozOc22VErvJy6WtoqD5hFA7nxHzE+UHwrbS+xZhMj
         bPA0XKKWDnr8nsvOj3e7Lu63n/pS/rybHZxO0biBA2exl77y23CpF4SLxpzH3J/wFjov
         fD50wDXrRyV0bPoCrVZ1UOKs9bsjKQbz7vA99hwa2CWwkZC1gxEhrQVhpQzVwcgPu4aD
         J8NzSm9Bou/VC/S4D0QYeKbiyQ8pdhVr7LOo+8CNYa6y3JSN5mvu2d6RwrrtadwugSLk
         H57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645162; x=1796249962;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mM0J1a71Wn6f8VLov8bY8YKxe1QvMRR/3m9TE5bYfk=;
        b=PGkQOH3G+qnMgoL6yvArueBXSqnh2sAdp9DAoCBmBfm4N0m5Fz7nEKk4AMBFEZ3uk/
         55QupM+4Z5afUUP3WYsoyLUV18JuVEYkRmgy6HpyWAce4FnikOvjT8Kp1Ihx4VNpCmji
         FlL82RGoQgs+1e4p1fLZQ/YN3d7Xu87wUFUsSnE6c3s3mCJVtEdCJ0D5qfupDBb8OtKu
         4d2lpZGaoifDtnWQmghKfs8XHwahJFhN8zbRVWyUftZ0u6ovRo1xdt0XwHyk18bbIHct
         hnqK5u6gJjAQv9C4WDb5S5TIEaa3YcsQkFwIGDrFl+sp67FQFP6IspI0krPWrEM7VyM4
         sWBw==
X-Forwarded-Encrypted: i=1; AL+hErHUq1gdv9tZ1NYZ6QzGoowDvg1d3FIs9H6MFJBogEp2bEpGthi0XDQmJKWRXiEavnJX39Ug@lists.linux.dev
X-Gm-Message-State: APuU4Z/J9Nhi7R+Ps7ZYjlOqZNoDAlTdMCdgMWgH55APBQVvCl+tl2a+
	arzi0WZjSFaMWfMUz9AShftvcKcLQlZU0/fPJejgUtPDjVCucHmERCrxeeIRAM7BGwIIotClHYg
	7wA==
X-Received: from dycmb5-n2.prod.google.com ([2002:a05:693c:20c5:20b0:369:fc78:c914])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8955:10b0:386:9cae:abef
 with SMTP id 5a478bee46e88-386bf39f8b9mr6889141eec.36.1795645161387; Wed, 25
 Nov 2026 14:19:21 -0800 (PST)
Date: Wed, 25 Nov 2026 22:19:11 +0000
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
Message-ID: <20261125221911.1425213-1-elkin@google.com>
Subject: [PATCH] mm/huge_memory: check VMA end bounds in insert_pmd() and insert_pud()
From: Elkin Cruz <elkin@google.com>
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

insert_pmd() and insert_pud() only check that addr lies within
[vma->vm_start, vma->vm_end) without verifying that the full PMD or PUD
mapping fits below vma->vm_end. On a VMA whose end is not PMD- or
PUD-aligned, inserting a huge mapping at the tail straddles past
vma->vm_end.

Require vma->vm_end - addr >= HPAGE_PMD_SIZE in insert_pmd() and
vma->vm_end - addr >= HPAGE_PUD_SIZE in insert_pud().

Fixes: 5cad465d7fa6 ("mm: add vmf_insert_pfn_pmd()")
Fixes: a00cc7d9dd93 ("mm, x86: add support for PUD-sized transparent hugepages")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 mm/huge_memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e167c9ea4609..683f0c68d6b2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1630,7 +1630,8 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	spinlock_t *ptl;
 	pmd_t entry;
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
+	if (addr < vma->vm_start || addr >= vma->vm_end ||
+	    vma->vm_end - addr < HPAGE_PMD_SIZE)
 		return VM_FAULT_SIGBUS;
 
 	if (arch_needs_pgtable_deposit()) {
@@ -1771,7 +1772,8 @@ static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
 	spinlock_t *ptl;
 	pud_t entry;
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
+	if (addr < vma->vm_start || addr >= vma->vm_end ||
+	    vma->vm_end - addr < HPAGE_PUD_SIZE)
 		return VM_FAULT_SIGBUS;
 
 	ptl = pud_lock(mm, pud);
-- 
2.56.1.839.g22a8290db9-goog

