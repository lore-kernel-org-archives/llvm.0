Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDF228F1
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679146797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GsfqRJutAPaYkw+mcXHB2f4v7VoNn3nM+/TXvQ7dbeI=;
	b=ih6DP1jmZeIPwWgthO3j9WC47w5Moh2HIDFor7vkFl2r5XJ1cPJvFT7E+gfpCp7PAtl5NV
	cZD0ozgNIK0rLFwOFLbQcDah6dunWfHnI8hi1fuSrh9lSO5l36mWqeVGYdV8zSJGtWa+4j
	bBMt65gqrzK9vSBABkD71uccUYAnnIA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-Y20oBg-TPxymxMMAD46LFA-1; Sat, 18 Mar 2023 09:39:56 -0400
X-MC-Unique: Y20oBg-TPxymxMMAD46LFA-1
Received: by mail-qt1-f199.google.com with SMTP id c11-20020ac85a8b000000b003bfdd43ac76so4030685qtc.5
        for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 06:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679146795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GsfqRJutAPaYkw+mcXHB2f4v7VoNn3nM+/TXvQ7dbeI=;
        b=et9rcjGxNo0UFVNEn/mTsm1iehI/BrTWJCC/1/HDY+F/4HxJ98OA/ShM+VT8K0TJVw
         4hY4eZt66WeCdxm3QpCBir1kqxuLFaXztfzptEfytPwDcwEKrRGuSIKs8a9DgZnz2fwx
         vomEcSjqg/0mmXvbl7AwSgREjY6m9B0Fz7jV3nFZGxZ6TpYMHl114hP/e+DHFJChQe4n
         wSjO14Txua9YtETQ1L+1K7rRfTq4isyw+7TZ9qQ3M/oNAXjzqyIzwI/RXAUJ0ktombWR
         NafDCusePHN9Gco8f0pKKapu9ITTO3WGDOv0vO9w0atkAC7FxPuHRU88OdlDXo4oHZz2
         FSWQ==
X-Gm-Message-State: AO0yUKUzWyMptKrZz1nb56v2gesE9Db13NzvlyxEk6BrZx97lUNDV+u8
	8VcBPQ91e7hcj5lWvCCjRkjfEnCNZlA950sAscY7rzyxR/mGbL58I2eKo3VF+DPKtkjTOd0nx5F
	s33sWE6pV5LwItg==
X-Received: by 2002:ac8:570d:0:b0:3b8:58d0:b4e4 with SMTP id 13-20020ac8570d000000b003b858d0b4e4mr18584483qtw.33.1679146795817;
        Sat, 18 Mar 2023 06:39:55 -0700 (PDT)
X-Google-Smtp-Source: AK7set+8QQWnniMY6gnEIBdfGqTMXXT0qbM1AvQtynJRRUJeJmWSu8y4ycgxOaezT+v9XSCpBKj4WQ==
X-Received: by 2002:ac8:570d:0:b0:3b8:58d0:b4e4 with SMTP id 13-20020ac8570d000000b003b858d0b4e4mr18584464qtw.33.1679146795558;
        Sat, 18 Mar 2023 06:39:55 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o16-20020ac86990000000b003bf9f9f1844sm2999664qtq.71.2023.03.18.06.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 06:39:55 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: anitha.chrisanthus@intel.com,
	edmund.j.dea@intel.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/kmb: remove unused set_test_mode_src_osc_freq_target_low,hi_bits functions
Date: Sat, 18 Mar 2023 09:39:52 -0400
Message-Id: <20230318133952.1684907-1-trix@redhat.com>
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
drivers/gpu/drm/kmb/kmb_dsi.c:822:2: error: unused function
  'set_test_mode_src_osc_freq_target_low_bits' [-Werror,-Wunused-function]
        set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
        ^
drivers/gpu/drm/kmb/kmb_dsi.c:834:2: error: unused function
  'set_test_mode_src_osc_freq_target_hi_bits' [-Werror,-Wunused-function]
        set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
        ^
These static functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index cf7cf0b07541..ed99b14375aa 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -818,34 +818,6 @@ static void test_mode_send(struct kmb_dsi *kmb_dsi, u32 dphy_no,
 	}
 }
 
-static inline void
-	set_test_mode_src_osc_freq_target_low_bits(struct kmb_dsi *kmb_dsi,
-						   u32 dphy_no,
-						   u32 freq)
-{
-	/* Typical rise/fall time=166, refer Table 1207 databook,
-	 * sr_osc_freq_target[7:0]
-	 */
-	test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES,
-		       (freq & 0x7f));
-}
-
-static inline void
-	set_test_mode_src_osc_freq_target_hi_bits(struct kmb_dsi *kmb_dsi,
-						  u32 dphy_no,
-						  u32 freq)
-{
-	u32 data;
-
-	/* Flag this as high nibble */
-	data = ((freq >> 6) & 0x1f) | (1 << 7);
-
-	/* Typical rise/fall time=166, refer Table 1207 databook,
-	 * sr_osc_freq_target[11:7]
-	 */
-	test_mode_send(kmb_dsi, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
-}
-
 static void mipi_tx_get_vco_params(struct vco_params *vco)
 {
 	int i;
-- 
2.27.0

