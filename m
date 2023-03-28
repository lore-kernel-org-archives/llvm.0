Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B756363
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 00:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679961987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oVSllWMtZWdtDUnZueS3ZITI6/5YaR00xl6fOWFPgxw=;
	b=SgVIBcykwFgtl1+mK4S33Y6OfAiaNAKWtMIRnZJAhUzroxSMGGEYDBUahXxxKMkreuYBR+
	Vt7TQ4ffBQjTOz7bag+X7ZTeJSl8jAjGHlh+7/tugOXELcwMZNsWBypCchEkXSmO74o+ak
	BVx+vWCbQtgwIgmtD0/BUvEo7uChgW8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-GSz6PHEqOqmQRludcqSq4w-1; Mon, 27 Mar 2023 20:06:24 -0400
X-MC-Unique: GSz6PHEqOqmQRludcqSq4w-1
Received: by mail-qk1-f200.google.com with SMTP id 72-20020a37044b000000b0074694114c09so4795680qke.4
        for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 17:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679961984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVSllWMtZWdtDUnZueS3ZITI6/5YaR00xl6fOWFPgxw=;
        b=PzkibAi+QocY7/MZ+orshvTjhcd+4hG0FyqL/2O7bTwf8Sw/mPifQdp+KLZ9hXIvYP
         HG4cSHOEtB5duphGKsuCw06eZuv5nR6uasSMz5qs8ItIJ75VwEdpZWBUhCbKWAXh7yEQ
         2sHg9YxjQpPRaX6yT2PCJVtpwZbiZ9VKfkm0mhf5pqVLHlrYOpR5NZnBBibvsVHZHPI4
         +E5nfGwA+CRUlp53Z9olQJ037D+ENQBu8daAxqXKHJ3ug+E5H9XKhoR+fMpU1HTjq22W
         SlMTajK2NbQrxJBHKQXZ0UCzgRTzy5EeYYR4HD4g0Tt/oPeL+QUvvw1u49XOfPS60xlj
         ao9A==
X-Gm-Message-State: AAQBX9ehk+zCb9U1o55VK9/xIErOEoACJcvXHSNni7QC/JmD3xxZDbIv
	xZpzcd6ag2OVWjT26rfzezUgAkvpHa5b7GhbXbGu+2vbv1B5t26pKDoLImUXQzen8lMy9i2kw+Z
	e5IUYQTSPEMU2paLfoNbQsg==
X-Received: by 2002:a05:6214:27cc:b0:5af:3a13:201f with SMTP id ge12-20020a05621427cc00b005af3a13201fmr20749282qvb.37.1679961984163;
        Mon, 27 Mar 2023 17:06:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350bosbW29PT8iFMSLN0sbn5umQV3b5UqmtN5qZQaOtgas+0CV3b7wBzisKLHjUrsN/FUDALfvg==
X-Received: by 2002:a05:6214:27cc:b0:5af:3a13:201f with SMTP id ge12-20020a05621427cc00b005af3a13201fmr20749256qvb.37.1679961983880;
        Mon, 27 Mar 2023 17:06:23 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id q21-20020ac87355000000b003e387a2fbdfsm7130695qtp.0.2023.03.27.17.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 17:06:23 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mtd: lpddr_cmds: remove unused words variable
Date: Mon, 27 Mar 2023 20:06:20 -0400
Message-Id: <20230328000620.1778033-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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

clang with W=1 reports
drivers/mtd/lpddr/lpddr_cmds.c:409:31: error: variable
  'words' set but not used [-Werror,-Wunused-but-set-variable]
        int ret, wbufsize, word_gap, words;
                                     ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/mtd/lpddr/lpddr_cmds.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index ee063baed136..3c3939bc2dad 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -406,7 +406,7 @@ static int do_write_buffer(struct map_info *map, struct flchip *chip,
 {
 	struct lpddr_private *lpddr = map->fldrv_priv;
 	map_word datum;
-	int ret, wbufsize, word_gap, words;
+	int ret, wbufsize, word_gap;
 	const struct kvec *vec;
 	unsigned long vec_seek;
 	unsigned long prog_buf_ofs;
@@ -421,10 +421,7 @@ static int do_write_buffer(struct map_info *map, struct flchip *chip,
 	}
 	/* Figure out the number of words to write */
 	word_gap = (-adr & (map_bankwidth(map)-1));
-	words = (len - word_gap + map_bankwidth(map) - 1) / map_bankwidth(map);
-	if (!word_gap) {
-		words--;
-	} else {
+	if (word_gap) {
 		word_gap = map_bankwidth(map) - word_gap;
 		adr -= word_gap;
 		datum = map_word_ff(map);
-- 
2.27.0

