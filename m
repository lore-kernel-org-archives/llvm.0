Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33D11701
	for <llvm@lists.linux.dev>; Thu,  2 Nov 2023 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="B9zxhzPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1698930675; bh=iimX/kLhw22pUAk5YM3oconl2JgWnoW+ih0JCvrR5kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B9zxhzPTMQB8MG+el+u7U5ptRbfndUWWIFIi1xh/S0c98tbhtDOsT5WwkP7Tmp3k3
	 IaaPMA4wQvEPeAi3DeBoDOnvlz5ikgnPjDgaQD7EHl8H1RTsDENaZCXp2Pt/f8Kgfr
	 NCpYOL7wmafcaYRK7Zszy5470l1rfoArs5afgn08=
Received: from pek-lxu-l1.wrs.com ([111.198.228.56])
	by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
	id E9B3F2A7; Thu, 02 Nov 2023 20:58:27 +0800
X-QQ-mid: xmsmtpt1698929907twvne5no5
Message-ID: <tencent_164A247533766D667C3D873798968236C409@qq.com>
X-QQ-XMAILINFO: MZ4XH1L85f1rzSSYbTc6Jmj3pIeX/e0nh52tuTKTWijZUhCRZoyyuhrJPV3g0g
	 PeDpwzmwCmdXceSCdNxouaqMr9wn1aQ/AvJia5q0hnMavia94qovowR7CiH+wRmA/YAGX+V60XAy
	 ZlaBu0CgLjV6doxTIZ2lN0zRhZ87wI7D4kpM9XQW1okYfpzaOaLbY3/u9X77ol2Qj1hJFRWkK8O2
	 imefKs7QnvNq0wHe889TrhNTfmpM44UXhCoFNatq0b2+X8gZ/UdFlaKqOjCu425JoiiosHZ2/UKd
	 weBHTl1+/sYEzrJ6y40PBStnMONk4PwKwY2Via2jCu9zAK86TSx/oGfVPOqqbxqq0tMii6SIYPL6
	 bYiJSVUiEuo7r10uXxhr/S13f+FR9o9Z8BtJolEP8IYjS1NsKhR4dK3PCEw384wZlDAwPHXixnUF
	 tuJDtKJlM0JHpvFCr+tEFwH0bneGT8Heo12vDTpmxHh1VUJGvYIUs3it5Te1EHu0H4UF/peX2kIz
	 Bzp49nwj7mYqpeYVegyJ87eKjlrVUzzqmlW9J6AitwMUXS8iWv4Ct9flzL3k0k9d2n2qoI9h7CMF
	 J9DTAgorCb+ydAuzhmtjB7+I8Te4ZIQxeudEza38MSMFjhXtBt9Xqcg9RspEyQDq2pGyqUWZmVbI
	 8bE6EMnISE9swW0+Z0YB1rh6npGupJVKFe6FcJfxuHCqIe45N6Amb5WLKQNJTn4483AU6RhzXu7Y
	 gzxAuQiVSUZ0fEMhtJfe8VMxdFb39OOQi7d4dYZZrYSxh5wJ0dc3Hrzm+ztBXRoEW5swKHBHJJ9p
	 nAQ9FtKUQxzZ2nPFqpVICpmGDDiraDmg6x6s73k34a11/1zFLXfdwb8gtsYHtILqSCjuwqZ0PexN
	 laPyscX+OiXKzNQRjw3wYoP58DloGiS0D9J1G6O8zaipZXCWkTjuHw/L0soJsiKjiY9HQiaXlVYY
	 T5ZFECDPw5MN0h9zYQQw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: riel@surriel.com
Cc: akpm@linux-foundation.org,
	eadavis@qq.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	mike.kravetz@oracle.com,
	muchun.song@linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	trix@redhat.com
Subject: [PATCH] mm/hugetlb: fix null ptr defer in hugetlb_vma_lock_write
Date: Thu,  2 Nov 2023 20:58:28 +0800
X-OQ-MSGID: <20231102125827.253432-2-eadavis@qq.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <3382634358afa9b95dc4f6db8a53a136d4b9e9cb.camel@surriel.com>
References: <3382634358afa9b95dc4f6db8a53a136d4b9e9cb.camel@surriel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When obtaining resv_map from vma, it is necessary to simultaneously determine
the flag HPAGE_RESV_OWNER of vm_private_data.
Only when they are met simultaneously, resv_map is valid.

Reported-and-tested-by: syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com
Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs")
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 include/linux/hugetlb.h | 5 ++++-
 mm/hugetlb.c            | 1 -
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 47d25a5e1933..14babc602f14 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -179,6 +179,7 @@ struct address_space *hugetlb_page_mapping_lock_write(struct page *hpage);
 
 extern int sysctl_hugetlb_shm_group;
 extern struct list_head huge_boot_pages;
+static int is_vma_resv_set(struct vm_area_struct *vma, unsigned long flag);
 
 /* arch callbacks */
 
@@ -1265,9 +1266,11 @@ static inline bool __vma_shareable_lock(struct vm_area_struct *vma)
 	return (vma->vm_flags & VM_MAYSHARE) && vma->vm_private_data;
 }
 
+#define HPAGE_RESV_OWNER    (1UL << 0)
 static inline bool __vma_private_lock(struct vm_area_struct *vma)
 {
-	return (!(vma->vm_flags & VM_MAYSHARE)) && vma->vm_private_data;
+	return (!(vma->vm_flags & VM_MAYSHARE)) && vma->vm_private_data && 
+		is_vma_resv_set(vma, HPAGE_RESV_OWNER);
 }
 
 /*
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1301ba7b2c9a..97ea782dfba6 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1033,7 +1033,6 @@ __weak unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
  * bits of the reservation map pointer, which are always clear due to
  * alignment.
  */
-#define HPAGE_RESV_OWNER    (1UL << 0)
 #define HPAGE_RESV_UNMAPPED (1UL << 1)
 #define HPAGE_RESV_MASK (HPAGE_RESV_OWNER | HPAGE_RESV_UNMAPPED)
 
-- 
2.25.1

