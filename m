Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2272566
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 12:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679488140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/RmaCdFiflknr5F/EzALZWl8EQAEMlohlo+Bq/6n784=;
	b=Mj8ociXFfTjBg2nuSt6ayckqj5PVKL2CyF8i8RxiDh6LIJ/s684sz/xxKCBp++SqCx+Ktb
	ZlOCDaUwbwH4bh3GBMD7TIn0TJwP8w7E3MbXsDM6zY7YYym7OBG4UlNn7YadkDxZqHfuyp
	SQfMjdRUvbFXoHPA7KrivXolCUx+G1c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-AEF8axZuM92qp7OcufD_ew-1; Wed, 22 Mar 2023 08:28:58 -0400
X-MC-Unique: AEF8axZuM92qp7OcufD_ew-1
Received: by mail-qt1-f197.google.com with SMTP id v7-20020a05622a188700b003e0e27bbc2eso5834861qtc.8
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 05:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679488138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RmaCdFiflknr5F/EzALZWl8EQAEMlohlo+Bq/6n784=;
        b=zddL0pCJbUzVlsHoZcrh8TRmMTfQ0P8zY2HQhur0bb6ySPj1T5wnMuF7xUlucVrnas
         MVanFRAbW0QPtOVcfW59SW9lGBbUIPGlQMHDtpXmO+f4CvA+VQ3SItLQi3TVkzezWsUm
         uwmSQhQ2s3/MoL1IMkMNNpNxptMw08+xJvJLqFNIRWhWL9OjHUVdSlQMAg7UlXOnCv9a
         k0HV76iLSeRc5Sc6PmIzcIUBzblN00GvVaN5w+/AV63lsIwUVYoG/kn3hFINWKDyK4r6
         oUw0HCUO5uR9L5xQm5IREPvuAZ3vG13ZVGqYUgRQWq/fVaI7qGnZGzGOVzNCWKA88NeN
         gCUA==
X-Gm-Message-State: AO0yUKUD/gssyzL4Z9mx2t183DhuubDoimPey9u8POIonvftIYRZv87L
	FgAxlj2u38c0f2VbFKxk9i3U69fln1ZFAkUeO3cChWnHNMo3ccOysS9772oCG4yTtACVhvQcAD8
	Xdza3ggDsZh8InA==
X-Received: by 2002:ac8:7f8e:0:b0:3bf:d9d2:484f with SMTP id z14-20020ac87f8e000000b003bfd9d2484fmr5698837qtj.11.1679488138427;
        Wed, 22 Mar 2023 05:28:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Gcxx8GdV/OeVtTOhHQR7MlyYiQ1UjJcEDEFgxn3029wWSBoOMbr8ofWD/oxpFcUXsweisow==
X-Received: by 2002:ac8:7f8e:0:b0:3bf:d9d2:484f with SMTP id z14-20020ac87f8e000000b003bfd9d2484fmr5698812qtj.11.1679488138211;
        Wed, 22 Mar 2023 05:28:58 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j13-20020a37ef0d000000b00729b7d71ac7sm11174245qkk.33.2023.03.22.05.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:28:57 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ath10k: remove unused ath10k_get_ring_byte function
Date: Wed, 22 Mar 2023 08:28:55 -0400
Message-Id: <20230322122855.2570417-1-trix@redhat.com>
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
drivers/net/wireless/ath/ath10k/ce.c:88:1: error:
  unused function 'ath10k_get_ring_byte' [-Werror,-Wunused-function]
ath10k_get_ring_byte(unsigned int offset,
^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index b656cfc03648..c27b8204718a 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -84,13 +84,6 @@ ath10k_set_ring_byte(unsigned int offset,
 	return ((offset << addr_map->lsb) & addr_map->mask);
 }
 
-static inline unsigned int
-ath10k_get_ring_byte(unsigned int offset,
-		     struct ath10k_hw_ce_regs_addr_map *addr_map)
-{
-	return ((offset & addr_map->mask) >> (addr_map->lsb));
-}
-
 static inline u32 ath10k_ce_read32(struct ath10k *ar, u32 offset)
 {
 	struct ath10k_ce *ce = ath10k_ce_priv(ar);
-- 
2.27.0

