Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D802D168
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 18:00:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id v6so6349764wra.8
        for <llvm@lists.linux.dev>; Thu, 06 Jan 2022 10:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=KH/5CZlMg+I8xF9E0KPfffa/yZmV4klBlXkrigbroQE=;
        b=P2ufOTU3NizbjqaLC36CCjWcTBd/i7Y7i3g8Obnh05EqojL7yZ2Woe+OhXX3U5DwGU
         cj3GDUPq6LOac+Ob/93+ENzaUNVpevYtmWy9W6dlUA595gYPHOy/ZidW+lAEj4GBTjmF
         AvDN6NNAygB4dCl57xuFdtyMZH3ghzHhBhYX9+lzFsjdMFFVVHBJzfXEKBP9OfjLE0nl
         nALAuAi0buaa4IzdrURcyf9Pdm54Jm7DDZW0U13q3HQ1z/ObNiNrRudZBl5EmOknVqAB
         clkOjIZ7F0gi7V9dHr8pGfPNyu7KLlI1Wm4mnpzIPp/KE81k+/rbEc4Tp0FpIg8bEX1a
         NKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=KH/5CZlMg+I8xF9E0KPfffa/yZmV4klBlXkrigbroQE=;
        b=FWMzPICk7OsvXAA7j+5E8o/a1Mo9TnLWEfg+myPPo3yf2pKq0aEPnt+vcFUgo0oN0B
         BZUApIs4Gg/tfI+zm4L+hVg+BZNCogF7H+Ht7U8ha9C+p5faCs0duRIcASCebtHO4kLx
         QV2x7XZ0crpp6eXXn8DT1yC6Rul2y7CPJLDaci/fI/cO5ffKfuPZBPFgsflLlCEajTnd
         uvarEgPkovuhJdmEZAkI93oIi07IRTtShdRAFPydCMFwPWaYQ/DizTObce/T7XdXHzI6
         NloEhkoxwx+S0cR+QxTjgQqMco6ftCpiYwgDOojP1wy8rfwWtvjmNUJLb//DYoiQGYgi
         6WGw==
X-Gm-Message-State: AOAM530oOyq379QY/Pq47zMNu0anv/pxiR09QfkKsFvqItEULRGsetr4
	JtT7Or8WeiDGx+DcHGWTa46lhA==
X-Google-Smtp-Source: ABdhPJy+PPr5p/dCzhk7f7rAy7nTtDHTBJJaUpU/LQz9+0rumgeY6Y+Glng7WUCnRbAyhZLR/XE7IA==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr3025890wrm.537.1641492013099;
        Thu, 06 Jan 2022 10:00:13 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id l17sm5876483wms.24.2022.01.06.10.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 10:00:12 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 6 Jan 2022 18:00:11 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <16541504.9774.1641492012616@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by linux: mm: simplify try_to_unuse
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9773_1973969292.1641492011956"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-release-arm-next-allnoconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_9773_1973969292.1641492011956
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: mm: simplify try_to_unuse:
commit a1d1774f68ae83a47e9183f0ca5c0d1ce017eb9b
Author: Christoph Hellwig <hch@lst.de>

    mm: simplify try_to_unuse

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
553
# First few build errors in logs:
# 00:00:44 mm/shmem.c:3993:5: error: conflicting types for 'shmem_unuse'
# 00:00:44 make[1]: *** [mm/shmem.o] Error 1
# 00:00:44 make: *** [mm] Error 2

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
567
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-release-arm-next-allnoconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-next-allnoconfig/3/artifact/artifacts/build-a1d1774f68ae83a47e9183f0ca5c0d1ce017eb9b/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-next-allnoconfig/3/artifact/artifacts/build-78239336b3458a1651eb6a6204b15190c125102a/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-next-allnoconfig/3/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-next-allnoconfig/3/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-a1d1774f68ae83a47e9183f0ca5c0d1ce017eb9b
cd investigate-linux-a1d1774f68ae83a47e9183f0ca5c0d1ce017eb9b

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-next-allnoconfig/3/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-next-allnoconfig/3/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-next-allnoconfig/3/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach a1d1774f68ae83a47e9183f0ca5c0d1ce017eb9b
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 78239336b3458a1651eb6a6204b15190c125102a
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit a1d1774f68ae83a47e9183f0ca5c0d1ce017eb9b
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Dec 30 20:29:51 2021 +1100

    mm: simplify try_to_unuse
    
    Remove the unused frontswap and pages_to_unuse arguments, and mark
    the function static now that the caller in frontswap is gone.
    
    Link: https://lkml.kernel.org/r/20211224062246.1258487-9-hch@lst.de
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Juergen Gross <jgross@suse.com>
    Cc: Dan Streetman <ddstreet@ieee.org>
    Cc: Geert Uytterhoeven <geert@linux-m68k.org>
    Cc: Hugh Dickins <hughd@google.com>
    Cc: Konrad Rzeszutek Wilk <Konrad.wilk@oracle.com>
    Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
    Cc: Seth Jennings <sjenning@redhat.com>
    Cc: Vitaly Wool <vitaly.wool@konsulko.com>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/frontswap.h |  7 ----
 include/linux/shmem_fs.h  |  3 +-
 include/linux/swapfile.h  |  1 -
 mm/shmem.c                | 33 ++++---------------
 mm/swapfile.c             | 83 +++++++++++++----------------------------------
 5 files changed, 30 insertions(+), 97 deletions(-)

diff --git a/include/linux/frontswap.h b/include/linux/frontswap.h
index 73d7beb44f2b..a9817d4fa74c 100644
--- a/include/linux/frontswap.h
+++ b/include/linux/frontswap.h
@@ -7,13 +7,6 @@
 #include <linux/bitops.h>
 #include <linux/jump_label.h>
 
-/*
- * Return code to denote that requested number of
- * frontswap pages are unused(moved to page cache).
- * Used in shmem_unuse and try_to_unuse.
- */
-#define FRONTSWAP_PAGES_UNUSED	2
-
 struct frontswap_ops {
 	void (*init)(unsigned); /* this swap type was just swapon'ed */
 	int (*store)(unsigned, pgoff_t, struct page *); /* store a page */
diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
index 166158b6e917..e65b80ed09e7 100644
--- a/include/linux/shmem_fs.h
+++ b/include/linux/shmem_fs.h
@@ -83,8 +83,7 @@ extern void shmem_unlock_mapping(struct address_space *mapping);
 extern struct page *shmem_read_mapping_page_gfp(struct address_space *mapping,
 					pgoff_t index, gfp_t gfp_mask);
 extern void shmem_truncate_range(struct inode *inode, loff_t start, loff_t end);
-extern int shmem_unuse(unsigned int type, bool frontswap,
-		       unsigned long *fs_pages_to_unuse);
+int shmem_unuse(unsigned int type);
 
 extern bool shmem_is_huge(struct vm_area_struct *vma,
 			  struct inode *inode, pgoff_t index);
diff --git a/include/linux/swapfile.h b/include/linux/swapfile.h
index e06febf62978..809cd01ef2c5 100644
--- a/include/linux/swapfile.h
+++ b/include/linux/swapfile.h
@@ -9,7 +9,6 @@
 extern spinlock_t swap_lock;
 extern struct plist_head swap_active_head;
 extern struct swap_info_struct *swap_info[];
-extern int try_to_unuse(unsigned int, bool, unsigned long);
 extern unsigned long generic_max_swapfile_size(void);
 extern unsigned long max_swapfile_size(void);
 
diff --git a/mm/shmem.c b/mm/shmem.c
index aadc4aefd9b4..0ee5dbd96cdc 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -36,7 +36,6 @@
 #include <linux/uio.h>
 #include <linux/khugepaged.h>
 #include <linux/hugetlb.h>
-#include <linux/frontswap.h>
 #include <linux/fs_parser.h>
 #include <linux/swapfile.h>
 
@@ -1147,7 +1146,7 @@ static void shmem_evict_inode(struct inode *inode)
 static int shmem_find_swap_entries(struct address_space *mapping,
 				   pgoff_t start, unsigned int nr_entries,
 				   struct page **entries, pgoff_t *indices,
-				   unsigned int type, bool frontswap)
+				   unsigned int type)
 {
 	XA_STATE(xas, &mapping->i_pages, start);
 	struct page *page;
@@ -1168,9 +1167,6 @@ static int shmem_find_swap_entries(struct address_space *mapping,
 		entry = radix_to_swp_entry(page);
 		if (swp_type(entry) != type)
 			continue;
-		if (frontswap &&
-		    !frontswap_test(swap_info[type], swp_offset(entry)))
-			continue;
 
 		indices[ret] = xas.xa_index;
 		entries[ret] = page;
@@ -1223,26 +1219,20 @@ static int shmem_unuse_swap_entries(struct inode *inode, struct pagevec pvec,
 /*
  * If swap found in inode, free it and move page from swapcache to filecache.
  */
-static int shmem_unuse_inode(struct inode *inode, unsigned int type,
-			     bool frontswap, unsigned long *fs_pages_to_unuse)
+static int shmem_unuse_inode(struct inode *inode, unsigned int type)
 {
 	struct address_space *mapping = inode->i_mapping;
 	pgoff_t start = 0;
 	struct pagevec pvec;
 	pgoff_t indices[PAGEVEC_SIZE];
-	bool frontswap_partial = (frontswap && *fs_pages_to_unuse > 0);
 	int ret = 0;
 
 	pagevec_init(&pvec);
 	do {
 		unsigned int nr_entries = PAGEVEC_SIZE;
 
-		if (frontswap_partial && *fs_pages_to_unuse < PAGEVEC_SIZE)
-			nr_entries = *fs_pages_to_unuse;
-
 		pvec.nr = shmem_find_swap_entries(mapping, start, nr_entries,
-						  pvec.pages, indices,
-						  type, frontswap);
+						  pvec.pages, indices, type);
 		if (pvec.nr == 0) {
 			ret = 0;
 			break;
@@ -1252,14 +1242,6 @@ static int shmem_unuse_inode(struct inode *inode, unsigned int type,
 		if (ret < 0)
 			break;
 
-		if (frontswap_partial) {
-			*fs_pages_to_unuse -= ret;
-			if (*fs_pages_to_unuse == 0) {
-				ret = FRONTSWAP_PAGES_UNUSED;
-				break;
-			}
-		}
-
 		start = indices[pvec.nr - 1];
 	} while (true);
 
@@ -1271,8 +1253,7 @@ static int shmem_unuse_inode(struct inode *inode, unsigned int type,
  * device 'type' back into memory, so the swap device can be
  * unused.
  */
-int shmem_unuse(unsigned int type, bool frontswap,
-		unsigned long *fs_pages_to_unuse)
+int shmem_unuse(unsigned int type)
 {
 	struct shmem_inode_info *info, *next;
 	int error = 0;
@@ -1295,8 +1276,7 @@ int shmem_unuse(unsigned int type, bool frontswap,
 		atomic_inc(&info->stop_eviction);
 		mutex_unlock(&shmem_swaplist_mutex);
 
-		error = shmem_unuse_inode(&info->vfs_inode, type, frontswap,
-					  fs_pages_to_unuse);
+		error = shmem_unuse_inode(&info->vfs_inode, type);
 		cond_resched();
 
 		mutex_lock(&shmem_swaplist_mutex);
@@ -4010,8 +3990,7 @@ int __init shmem_init(void)
 	return 0;
 }
 
-int shmem_unuse(unsigned int type, bool frontswap,
-		unsigned long *fs_pages_to_unuse)
+int shmem_unuse(unsigned int type, unsigned long *fs_pages_to_unuse)
 {
 	return 0;
 }
diff --git a/mm/swapfile.c b/mm/swapfile.c
index df5930ccd93d..82342c77791b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1923,8 +1923,7 @@ static int unuse_pte(struct vm_area_struct *vma, pmd_t *pmd,
 
 static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 			unsigned long addr, unsigned long end,
-			unsigned int type, bool frontswap,
-			unsigned long *fs_pages_to_unuse)
+			unsigned int type)
 {
 	struct page *page;
 	swp_entry_t entry;
@@ -1945,9 +1944,6 @@ static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 			continue;
 
 		offset = swp_offset(entry);
-		if (frontswap && !frontswap_test(si, offset))
-			continue;
-
 		pte_unmap(pte);
 		swap_map = &si->swap_map[offset];
 		page = lookup_swap_cache(entry, vma, addr);
@@ -1979,11 +1975,6 @@ static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 		try_to_free_swap(page);
 		unlock_page(page);
 		put_page(page);
-
-		if (*fs_pages_to_unuse && !--(*fs_pages_to_unuse)) {
-			ret = FRONTSWAP_PAGES_UNUSED;
-			goto out;
-		}
 try_next:
 		pte = pte_offset_map(pmd, addr);
 	} while (pte++, addr += PAGE_SIZE, addr != end);
@@ -1996,8 +1987,7 @@ static int unuse_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 
 static inline int unuse_pmd_range(struct vm_area_struct *vma, pud_t *pud,
 				unsigned long addr, unsigned long end,
-				unsigned int type, bool frontswap,
-				unsigned long *fs_pages_to_unuse)
+				unsigned int type)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -2009,8 +1999,7 @@ static inline int unuse_pmd_range(struct vm_area_struct *vma, pud_t *pud,
 		next = pmd_addr_end(addr, end);
 		if (pmd_none_or_trans_huge_or_clear_bad(pmd))
 			continue;
-		ret = unuse_pte_range(vma, pmd, addr, next, type,
-				      frontswap, fs_pages_to_unuse);
+		ret = unuse_pte_range(vma, pmd, addr, next, type);
 		if (ret)
 			return ret;
 	} while (pmd++, addr = next, addr != end);
@@ -2019,8 +2008,7 @@ static inline int unuse_pmd_range(struct vm_area_struct *vma, pud_t *pud,
 
 static inline int unuse_pud_range(struct vm_area_struct *vma, p4d_t *p4d,
 				unsigned long addr, unsigned long end,
-				unsigned int type, bool frontswap,
-				unsigned long *fs_pages_to_unuse)
+				unsigned int type)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -2031,8 +2019,7 @@ static inline int unuse_pud_range(struct vm_area_struct *vma, p4d_t *p4d,
 		next = pud_addr_end(addr, end);
 		if (pud_none_or_clear_bad(pud))
 			continue;
-		ret = unuse_pmd_range(vma, pud, addr, next, type,
-				      frontswap, fs_pages_to_unuse);
+		ret = unuse_pmd_range(vma, pud, addr, next, type);
 		if (ret)
 			return ret;
 	} while (pud++, addr = next, addr != end);
@@ -2041,8 +2028,7 @@ static inline int unuse_pud_range(struct vm_area_struct *vma, p4d_t *p4d,
 
 static inline int unuse_p4d_range(struct vm_area_struct *vma, pgd_t *pgd,
 				unsigned long addr, unsigned long end,
-				unsigned int type, bool frontswap,
-				unsigned long *fs_pages_to_unuse)
+				unsigned int type)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -2053,16 +2039,14 @@ static inline int unuse_p4d_range(struct vm_area_struct *vma, pgd_t *pgd,
 		next = p4d_addr_end(addr, end);
 		if (p4d_none_or_clear_bad(p4d))
 			continue;
-		ret = unuse_pud_range(vma, p4d, addr, next, type,
-				      frontswap, fs_pages_to_unuse);
+		ret = unuse_pud_range(vma, p4d, addr, next, type);
 		if (ret)
 			return ret;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
 }
 
-static int unuse_vma(struct vm_area_struct *vma, unsigned int type,
-		     bool frontswap, unsigned long *fs_pages_to_unuse)
+static int unuse_vma(struct vm_area_struct *vma, unsigned int type)
 {
 	pgd_t *pgd;
 	unsigned long addr, end, next;
@@ -2076,16 +2060,14 @@ static int unuse_vma(struct vm_area_struct *vma, unsigned int type,
 		next = pgd_addr_end(addr, end);
 		if (pgd_none_or_clear_bad(pgd))
 			continue;
-		ret = unuse_p4d_range(vma, pgd, addr, next, type,
-				      frontswap, fs_pages_to_unuse);
+		ret = unuse_p4d_range(vma, pgd, addr, next, type);
 		if (ret)
 			return ret;
 	} while (pgd++, addr = next, addr != end);
 	return 0;
 }
 
-static int unuse_mm(struct mm_struct *mm, unsigned int type,
-		    bool frontswap, unsigned long *fs_pages_to_unuse)
+static int unuse_mm(struct mm_struct *mm, unsigned int type)
 {
 	struct vm_area_struct *vma;
 	int ret = 0;
@@ -2093,8 +2075,7 @@ static int unuse_mm(struct mm_struct *mm, unsigned int type,
 	mmap_read_lock(mm);
 	for (vma = mm->mmap; vma; vma = vma->vm_next) {
 		if (vma->anon_vma) {
-			ret = unuse_vma(vma, type, frontswap,
-					fs_pages_to_unuse);
+			ret = unuse_vma(vma, type);
 			if (ret)
 				break;
 		}
@@ -2110,7 +2091,7 @@ static int unuse_mm(struct mm_struct *mm, unsigned int type,
  * if there are no inuse entries after prev till end of the map.
  */
 static unsigned int find_next_to_unuse(struct swap_info_struct *si,
-					unsigned int prev, bool frontswap)
+					unsigned int prev)
 {
 	unsigned int i;
 	unsigned char count;
@@ -2124,8 +2105,7 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 	for (i = prev + 1; i < si->max; i++) {
 		count = READ_ONCE(si->swap_map[i]);
 		if (count && swap_count(count) != SWAP_MAP_BAD)
-			if (!frontswap || frontswap_test(si, i))
-				break;
+			break;
 		if ((i % LATENCY_LIMIT) == 0)
 			cond_resched();
 	}
@@ -2136,12 +2116,7 @@ static unsigned int find_next_to_unuse(struct swap_info_struct *si,
 	return i;
 }
 
-/*
- * If the boolean frontswap is true, only unuse pages_to_unuse pages;
- * pages_to_unuse==0 means all pages; ignored if frontswap is false
- */
-int try_to_unuse(unsigned int type, bool frontswap,
-		 unsigned long pages_to_unuse)
+static int try_to_unuse(unsigned int type)
 {
 	struct mm_struct *prev_mm;
 	struct mm_struct *mm;
@@ -2155,13 +2130,10 @@ int try_to_unuse(unsigned int type, bool frontswap,
 	if (!READ_ONCE(si->inuse_pages))
 		return 0;
 
-	if (!frontswap)
-		pages_to_unuse = 0;
-
 retry:
-	retval = shmem_unuse(type, frontswap, &pages_to_unuse);
+	retval = shmem_unuse(type);
 	if (retval)
-		goto out;
+		return retval;
 
 	prev_mm = &init_mm;
 	mmget(prev_mm);
@@ -2178,11 +2150,10 @@ int try_to_unuse(unsigned int type, bool frontswap,
 		spin_unlock(&mmlist_lock);
 		mmput(prev_mm);
 		prev_mm = mm;
-		retval = unuse_mm(mm, type, frontswap, &pages_to_unuse);
-
+		retval = unuse_mm(mm, type);
 		if (retval) {
 			mmput(prev_mm);
-			goto out;
+			return retval;
 		}
 
 		/*
@@ -2199,7 +2170,7 @@ int try_to_unuse(unsigned int type, bool frontswap,
 	i = 0;
 	while (READ_ONCE(si->inuse_pages) &&
 	       !signal_pending(current) &&
-	       (i = find_next_to_unuse(si, i, frontswap)) != 0) {
+	       (i = find_next_to_unuse(si, i)) != 0) {
 
 		entry = swp_entry(type, i);
 		page = find_get_page(swap_address_space(entry), i);
@@ -2217,14 +2188,6 @@ int try_to_unuse(unsigned int type, bool frontswap,
 		try_to_free_swap(page);
 		unlock_page(page);
 		put_page(page);
-
-		/*
-		 * For frontswap, we just need to unuse pages_to_unuse, if
-		 * it was specified. Need not check frontswap again here as
-		 * we already zeroed out pages_to_unuse if not frontswap.
-		 */
-		if (pages_to_unuse && --pages_to_unuse == 0)
-			goto out;
 	}
 
 	/*
@@ -2242,10 +2205,10 @@ int try_to_unuse(unsigned int type, bool frontswap,
 	if (READ_ONCE(si->inuse_pages)) {
 		if (!signal_pending(current))
 			goto retry;
-		retval = -EINTR;
+		return -EINTR;
 	}
-out:
-	return (retval == FRONTSWAP_PAGES_UNUSED) ? 0 : retval;
+
+	return 0;
 }
 
 /*
@@ -2577,7 +2540,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	disable_swap_slots_cache_lock();
 
 	set_current_oom_origin();
-	err = try_to_unuse(p->type, false, 0); /* force unuse all pages */
+	err = try_to_unuse(p->type);
 	clear_current_oom_origin();
 
 	if (err) {
</cut>
------=_Part_9773_1973969292.1641492011956--
