Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710433205
	for <llvm@lists.linux.dev>; Fri, 27 Jan 2023 16:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674836963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ofwRew2DOV3Mw1UeLOQ6Q9TuhNax0SYEuuABf3JrtUw=;
	b=bWoqCvt34D0VuCPQqWj9l2Vx3g+nED3IiuqHEYgfOVZnrzd9FL/24oKWXwqjLKqIlSTmP9
	v/E9LGevbqVn5Vd//Pb6h1YJR+pSXVqVJP42VuDjaAqIavOYpQ8DTdtDNQQaoRJVAOtI0h
	sqHgIIrsjLSDXslpqUkl3+FzkLnLIUY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-Iyy45G0NPQepPGVuh3sUXg-1; Fri, 27 Jan 2023 11:29:19 -0500
X-MC-Unique: Iyy45G0NPQepPGVuh3sUXg-1
Received: by mail-qk1-f197.google.com with SMTP id c18-20020a05620a269200b0070d0f35e15eso3265161qkp.12
        for <llvm@lists.linux.dev>; Fri, 27 Jan 2023 08:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofwRew2DOV3Mw1UeLOQ6Q9TuhNax0SYEuuABf3JrtUw=;
        b=i5kkZDB/eGVz0CENCyuimmW7qdOKdH0LctMiTm12E5BTB8yXW+3g251VSSzNGsFDLM
         btKRsK/nci9SwBFkM5GAhORvqlimjFHRAFLNM1jk1ITIelsHkgkTY4diNN12L93+/O0H
         82NWcuXKJdaaWejPpE4LCL+zezP7B5QJ/x/S8cNe+nwpJmIkmfH5DyuD+K77VPRDaxYj
         bOdYae47VZdgwg+u5Ua7Ussjvf+TsiqnWPziBePF8BiBfeQkgCqsbuMxUNLdCXUFxQ3a
         3z+zHLi4D9hwF357tUe25PFb0SRl9rrj9ouQfuArJ/FLH5G+yt56qt2bjHYrNo6E5uSa
         rjhg==
X-Gm-Message-State: AFqh2kqZsNZ3XUv1HEe9m7SoXInuuWhEClqUQa/q7yEntCNWAoBMqsf+
	SM/A0kcvdYf98XMi5O++Sg3WR3TnoyeQ5oY0N/4FF1BT0b10z+q/avbUuOCYNQgMpEF+W3XgeDi
	/C27cuOrZirZIDg==
X-Received: by 2002:a05:622a:1dc4:b0:3b6:3b60:e0 with SMTP id bn4-20020a05622a1dc400b003b63b6000e0mr53812675qtb.31.1674836959130;
        Fri, 27 Jan 2023 08:29:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtSLiyiygJZmi9ZkzaLEmBS5d2N0ilOPyqt8mtEc3xpMVZWdQMbtMS/3H1lhJAlOqqr0nPJ2g==
X-Received: by 2002:a05:622a:1dc4:b0:3b6:3b60:e0 with SMTP id bn4-20020a05622a1dc400b003b63b6000e0mr53812657qtb.31.1674836958905;
        Fri, 27 Jan 2023 08:29:18 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id y4-20020ac85244000000b003b6302f2580sm2917033qtn.22.2023.01.27.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:29:18 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: jack@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] udf: remove reporting loc in debug output
Date: Fri, 27 Jan 2023 08:29:06 -0800
Message-Id: <20230127162906.872395-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang build fails with
fs/udf/partition.c:86:28: error: variable 'loc' is uninitialized when used here [-Werror,-Wuninitialized]
                          sb, block, partition, loc, index);
                                                ^~~

loc is now only know when bh is valid.  So remove reporting loc in debug output.

Fixes: 4215db46d538 ("udf: Use udf_bread() in udf_get_pblock_virt15()")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/udf/partition.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/udf/partition.c b/fs/udf/partition.c
index 92765d2f6958..5bcfe78d5cab 100644
--- a/fs/udf/partition.c
+++ b/fs/udf/partition.c
@@ -82,8 +82,8 @@ uint32_t udf_get_pblock_virt15(struct super_block *sb, uint32_t block,
 
 	bh = udf_bread(sbi->s_vat_inode, newblock, 0, &err);
 	if (!bh) {
-		udf_debug("get_pblock(UDF_VIRTUAL_MAP:%p,%u,%u) VAT: %u[%u]\n",
-			  sb, block, partition, loc, index);
+		udf_debug("get_pblock(UDF_VIRTUAL_MAP:%p,%u,%u)\n",
+			  sb, block, partition);
 		return 0xFFFFFFFF;
 	}
 
-- 
2.26.3

