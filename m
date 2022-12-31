Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33AA3209
	for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 17:44:45 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id ja17so17562029wmb.3
        for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 09:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKGVwmg5J1Ql+fiJXPb+1gyrIp6pIUsxPUQhpeTa7cE=;
        b=kVcjcnjVuAmiqvP8lYg9PmM0y1+l+1Uyott5Q46/0z+HvG+a+/ZbMLczaNiOfWRafr
         U3ClLxdkF1sn468QqPW33lhOcize+mIP0EBhRJJITsiv8M591bqe4n+myFSlFnhZHESA
         3XPgZio1FVG+seF0x49fzeIKSDQHl76+ZIPZtYkbb4fn1f4gIsZnfuc6s8tTww/FdjHP
         WJyRA+KKdqoDNBUWp6HWIrcphEe8cBAA+ALUdNqYK+Cz7Ch43N5fHX/Z1Qn3BhnnNIFL
         QdWszvr3DtkPYvr2J70t/rapTdrnq54Yz5FU/XNVBIQVL+QWgg9hHMgN/y1Lu8UBnYC6
         0RDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKGVwmg5J1Ql+fiJXPb+1gyrIp6pIUsxPUQhpeTa7cE=;
        b=wAIM22SOyDq49ovYwP8zQEJTr7gM1v5dmKAqxErgheVTW7gfYtDqJD5NdnTxDIzGeM
         TrZXhXqNs8cetGAzFQpFGAzmx0n46WJfeE7Qgzj88HiPFwsTr0XRVNzIiVpQlW4uGvs9
         XWvzsOHh7m2epSHZOhQf/lizbzXCkgmPJXLwVB0bd+8gyflQFGZu5SC2zZMEIIS3h3K5
         olqTwg1+GeKGY4i0hCLxwhZ4yoX/Eaf+S4LqDv0seQGdolj7EimN2G1TICvp4GGIPPN/
         4T8smsBQS6HWL4z+g3sGD2ihj+SBQaD6b9p/+1+rWPAy2pjI8uHUvFR1X/oEG/SZTD9C
         Ezjw==
X-Gm-Message-State: AFqh2kq3kl16NeH8AG+sd5FazS8Ib8jhVwLdHBdK/Pysw09UeLV0+ThE
	uKY6Q5Wza0bZtYXDfyGPgr8=
X-Google-Smtp-Source: AMrXdXtOafM5UGHzLjN1Yn1s92x0yr1m0tQKluSwnvIJXRy3QMgYLJu9vPM4iCuysf6kS5kZjL2J+w==
X-Received: by 2002:a7b:c414:0:b0:3d6:ecc4:6279 with SMTP id k20-20020a7bc414000000b003d6ecc46279mr25627186wmi.27.1672508683777;
        Sat, 31 Dec 2022 09:44:43 -0800 (PST)
Received: from localhost.localdomain (host-79-56-217-20.retail.telecomitalia.it. [79.56.217.20])
        by smtp.gmail.com with ESMTPSA id d22-20020a1c7316000000b003d9862ec435sm19206066wmb.20.2022.12.31.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 09:44:43 -0800 (PST)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: [PATCH] fs/ext4: Replace kmap_atomic() with kmap_local_page()
Date: Sat, 31 Dec 2022 18:44:39 +0100
Message-Id: <20221231174439.8557-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmap_atomic() is deprecated in favor of kmap_local_page(). Therefore,
replace kmap_atomic() with kmap_local_page().

kmap_atomic() is implemented like a kmap_local_page() which also disables
page-faults and preemption (the latter only for !PREEMPT_RT kernels).

However, the code within the mappings and un-mappings in ext4/inline.c
does not depend on the above-mentioned side effects.

Therefore, a mere replacement of the old API with the new one is all it
is required (i.e., there is no need to explicitly add any calls to
pagefault_disable() and/or preempt_disable()).

Suggested-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

I tried my best to understand the code within mapping and un-mapping.
However, I'm not an expert. Therefore, although I'm pretty confident, I
cannot be 100% sure that the code between the mapping and the un-mapping
does not depend on pagefault_disable() and/or preempt_disable().

Unfortunately, I cannot currently test this changes to check the
above-mentioned assumptions. However, if I'm required to do the tests
with (x)fstests, I have no problems with doing them in the next days.

If so, I'll test in a QEMU/KVM x86_32 VM, 6GB RAM, booting a kernel with
HIGHMEM64GB enabled.

I'd like to hear whether or not the maintainers require these tests
and/or other tests.

 fs/ext4/inline.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index 2b42ececa46d..bfb044425d8a 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -490,10 +490,10 @@ static int ext4_read_inline_page(struct inode *inode, struct page *page)
 		goto out;
 
 	len = min_t(size_t, ext4_get_inline_size(inode), i_size_read(inode));
-	kaddr = kmap_atomic(page);
+	kaddr = kmap_local_page(page);
 	ret = ext4_read_inline_data(inode, kaddr, len, &iloc);
 	flush_dcache_page(page);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 	zero_user_segment(page, len, PAGE_SIZE);
 	SetPageUptodate(page);
 	brelse(iloc.bh);
@@ -763,9 +763,9 @@ int ext4_write_inline_data_end(struct inode *inode, loff_t pos, unsigned len,
 		 */
 		(void) ext4_find_inline_data_nolock(inode);
 
-		kaddr = kmap_atomic(page);
+		kaddr = kmap_local_page(page);
 		ext4_write_inline_data(inode, &iloc, kaddr, pos, copied);
-		kunmap_atomic(kaddr);
+		kunmap_local(kaddr);
 		SetPageUptodate(page);
 		/* clear page dirty so that writepages wouldn't work for us. */
 		ClearPageDirty(page);
@@ -831,9 +831,9 @@ ext4_journalled_write_inline_data(struct inode *inode,
 	}
 
 	ext4_write_lock_xattr(inode, &no_expand);
-	kaddr = kmap_atomic(page);
+	kaddr = kmap_local_page(page);
 	ext4_write_inline_data(inode, &iloc, kaddr, 0, len);
-	kunmap_atomic(kaddr);
+	kunmap_local(kaddr);
 	ext4_write_unlock_xattr(inode, &no_expand);
 
 	return iloc.bh;
-- 
2.39.0

