Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116029;
	b=WiN3mFCxBjBpyhY6kYH0nGbwqiNCgBCp3LCeYnAuoJli0LJc5u+eXyxSVQJQR1zWOICc
	 +N5/FGYjauqA2o5eCYQfPxExhR8HEnMIAx3HUcTiXQt4YSs8iinc9NWP0QG3p8Ih5RuME
	 0VAqabmS2QPnKi/H9Ch06zydMiI2h00DBsIE0Yz+0IhdbZA1Du0lA/A+y0YjuEt8ElNwx
	 epBwYKxIHZUJFWPDSsGZUvnDwTBizQ7IPVNI0YuDK7WeosTzXlpy1bKmGat1xD93zdVNX
	 SLMrbA32z8dJ7dL1EHAAbN8od2U0YkfUBgJPuMgH3BWy+3uMIycPxqbewfb+G0XH4Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I9tKrbL54EVqcIFPPtB7uxrxNAXJtibM80HAzpUcWLM=;
	b=XyF+uaN30ztpuffw7x3Od3cdf4yC9EdZKpNrzyUqUZiO3YWl/fOzOfI27qXqmtguQ5Ja
	 ZYDVPxuStJ2TkQnL/mAwu5FQlnNvdG5nb1+FQvmnfZp0468AMQ975tfAt60nud1j1lff/
	 PNxNuUgIXdVA8jjsLAMCGF2J+tgjKFfQqmbL8E9wji6QNkvsfrvB5toVD48usHbKtjAtP
	 UV3cThqGYnxRXsLoYvq80e0LEsI52ZsVh8Cg7S10gBaN7kPLv8HbHSztDABty4M60TYcd
	 G/qVbaBan5qz/F5vXJMTvm7B78zA3X8sJb1OvjXrZklg7O895zrdTZheGMTBXPPNZ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDMuZQm7;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C54606B83E
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C54606B83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KDMuZQm7
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so879570f8f.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116027; x=1793720827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9tKrbL54EVqcIFPPtB7uxrxNAXJtibM80HAzpUcWLM=;
        b=KDMuZQm7yMNIvTVgxNRRdinZMID7rRYdKKGzA9JGmojav2X7IdLu5VWHZdtfMr1MbQ
         VcDs9gqyirzp54++oovGGayx0mCJkFo6BBBtTacSyszwlEW7F0P4pDAcMyQ74W+iD56V
         f36vlOV2pgAkzKUO5aiTggUwSVMS2l++3S52EDVG6SSKQNHLv7YSoBJC/3MVcx3INMxP
         +JApc1T2D2N1bLBwGbv5oiztrPqmhReh64P6U3X97dUZAPJSKFlsc2aZN9JstjXKJGts
         BNxlbWdIM8dUBxsdATcEyTq82Q5JGKVCYIofcHuxUhxtYqtIx0oHqRibc2p/ClhsFvvJ
         E09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116027; x=1793720827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9tKrbL54EVqcIFPPtB7uxrxNAXJtibM80HAzpUcWLM=;
        b=1ZyNO82yV3nsFrE1STz1dXiULKaj2Nt+vxbROt6cVKovJYU0RKyO/yiu67jjkxX0/y
         QOJ5Sa/0RBBljwe+rfRNsgGBFLsB5W2j6Jd0wv4FyCSFnryp94dPt5nXfbjUi0MEUIT+
         yxKFq6Bml7mWZC6CB4FQ3P2j4gAclB0gA1cZUVBiaEgeHo7j+zv26pQLDMqlCAU50C4q
         /EwYu1M5zklqqryDFd42RSyNDYihMeQiClZ0P6GP2sjG2qE02wwq2UEwvwnZbPp26EaF
         gLVLckfN94o1OizUV0/PTxu//g1TUggIckjXnR9rbnu7scWqyZO6iKuMGI+yFA9wMk7/
         D0tg==
X-Forwarded-Encrypted: i=1; AKwUvBy5Zm8DaGhM04fJRtCm5XdZp4SvDbfE84J8b/Nmjpzvi1R9+Lg/LqJ4dyu5vwkAi34J9MGK@lists.linux.dev
X-Gm-Message-State: AFq9FYLO5FKtmeLHCXuOgYE4RHvjh+IbyNANwqrjXmUk2warbTV8Vya4
	tDP87NGnymBw2zuHI71Vsw/BeDpd7w0pZ/tw5nbjocgLia7Wg69IIlun
X-Gm-Gg: AYBFou2r0TKUQEGqo414JvRhHsw5qIq3b84RppZ/h2ZUMdFD+IUA1fZKI02QIKAfqCJ
	RxQPVY5iFdeD09+PVtl5FyYPSv7Uy74vTYqxtYtTUtDl5fvbifpb4JnmxvjH9fEAejakd/gtzEi
	9rrSZZPcu2KiFyPFL45wNhywIHpzV6qJjWkojXxc+qSkCIQVyv7hJPnuwGzwisJ3MH6/o4NeMfd
	Z0wl/N1Pqnjs535BkcBFBTiDYuG63lvoBuKo95Dor181wvwm15sP696Dlj+lEgYqprcM/titiiF
	ZN65/GWkSVnm9C+a+ckjob92uPtHbMMMc1z4F3c/fBNM+SZYg0DO+QcJOdT1xwVZyHV6KGm2zeT
	ae/ksj2P9B2OdVt1FgjDRPhA+BgnDPlMaFmgF7/6zNapmpJcP6duu/9hmqAbazJr+wi/QOwsEhy
	wT2XIG2j6K9tv3MI6E7+N0vFL3OxCsnrloVzanM7ZHaXbKw5GChwPCi0HT4sVMRMkQRAn4vwFKi
	jZ0gw2lIwthgNjjT89kI56+HhqWegjqQdGn4B8MjVwqN/1NaoiD9pehdGqbFb+jiToZmqN51f7I
	w7QfM+2UkUZNcM4xdNQEY2k8ajomCbMssHoVMGyWLELmURLGSlx/pCVu5yQn6hul8v8/uJsika+
	t9zCp6ztfYGZRa4uBihRtUZWAhPPeMrl+lmpuig==
X-Received: by 2002:adf:ebcd:0:b0:48e:4ad2:32e0 with SMTP id ffacd0b85a97d-48e55a5a8bemr4605062f8f.29.1793116027147;
        Tue, 27 Oct 2026 08:47:07 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm23845574f8f.21.2026.10.27.08.47.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:47:06 -0700 (PDT)
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
Subject: [RFC PATCH 06/14] KVM: guest_memfd: Report the size of holes in export lookups
Date: Tue, 27 Oct 2026 15:46:41 +0000
Message-ID: <20261027154649.91571-7-griffoul@gmail.com>
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

A lookup reports a hole as a single page, so a consumer walks a large
private or unbacked range one page at a time, and cannot map a large
hole with one entry, e.g. to a scratch page.

Report the largest aligned hole around the page, up to the order the
caller asks for. The search checks one half-block at a time, so it
costs about one lookup per page of the hole it finds.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 virt/kvm/guest_memfd.c | 48 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 015f6657c386..1c5826c5384e 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1417,6 +1417,48 @@ static int __kvm_gmem_export_lookup(struct inode *inode, pgoff_t index,
 	return 0;
 }
 
+/* Does no page of [start, start + nr) have a frame to map? */
+static bool kvm_gmem_export_is_hole(struct inode *inode, pgoff_t start,
+				    pgoff_t nr)
+{
+	unsigned long pfn;
+	pgoff_t index;
+	u32 attrs;
+	int order;
+
+	for (index = start; index < start + nr; index++) {
+		order = 0;
+		if (__kvm_gmem_export_lookup(inode, index, &pfn, &order,
+					     &attrs) != -ENOENT)
+			return false;
+		cond_resched();
+	}
+	return true;
+}
+
+/*
+ * The order, up to @max_order, of the largest naturally aligned block around
+ * @index that lies inside the file and has no frame to map.  Each step checks
+ * only the half of the larger block that does not hold @index.
+ */
+static int kvm_gmem_export_hole_order(struct inode *inode, pgoff_t index,
+				      int max_order)
+{
+	pgoff_t npages = i_size_read(inode) >> PAGE_SHIFT;
+	int order;
+
+	for (order = 0; order < max_order; order++) {
+		pgoff_t n = 1UL << order;
+		pgoff_t first = round_down(index, 2 * n);
+
+		if (first + 2 * n > npages ||
+		    !kvm_gmem_export_is_hole(inode, index & n ? first : first + n,
+					     n))
+			break;
+	}
+	return order;
+}
+
 /**
  * kvm_gmem_export_lookup_pfn - The frame behind a shared page.
  * @e:         The export.
@@ -1424,7 +1466,8 @@ static int __kvm_gmem_export_lookup(struct inode *inode, pgoff_t index,
  * @pfn:       The frame.
  * @max_order: In: the largest order the caller can map.  Out: the order of
  *             the naturally aligned block around @index that is contiguous,
- *             shared and of the same @attrs; 0 for -ENOENT.
+ *             shared and of the same @attrs or, for -ENOENT, that has no
+ *             frame to map at all.
  * @attrs:     The GUEST_MEMFD_PFN_* attributes of the block.
  *
  * Takes no reference and allocates nothing, and may be called from the
@@ -1438,6 +1481,7 @@ int kvm_gmem_export_lookup_pfn(struct guest_memfd_export *e, pgoff_t index,
 			       unsigned long *pfn, int *max_order, u32 *attrs)
 {
 	struct inode *inode = file_inode(e->file);
+	int order = *max_order;
 	int r;
 
 	if (index >= i_size_read(inode) >> PAGE_SHIFT)
@@ -1445,7 +1489,7 @@ int kvm_gmem_export_lookup_pfn(struct guest_memfd_export *e, pgoff_t index,
 
 	r = __kvm_gmem_export_lookup(inode, index, pfn, max_order, attrs);
 	if (r == -ENOENT)
-		*max_order = 0;
+		*max_order = kvm_gmem_export_hole_order(inode, index, order);
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_gmem_export_lookup_pfn);
-- 
2.47.3

