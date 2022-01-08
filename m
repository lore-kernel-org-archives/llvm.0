Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A642C80
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641650883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PocnGmnCbMvgl/mM4UqClsCjrZwW9G0adKzchgFrwe0=;
	b=LNCA0KDbpkdr03Wse0eE8VVY0zl/D8qtrXjQqV/vXlSGmDSxkS4vxjjMi0oouBOqIasBg1
	0AjKke83OnvYiWIwtR2aDNGlRWA05vNohF4TtYSHCRhS7nlVHj+DscoI46+/PDlrZhYqES
	ttGOD8P42il65/NExG0ttdw603Aus2Y=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-6_R3Ga5zNV2BykHdF89JaQ-1; Sat, 08 Jan 2022 09:08:02 -0500
X-MC-Unique: 6_R3Ga5zNV2BykHdF89JaQ-1
Received: by mail-oi1-f197.google.com with SMTP id n2-20020aca5902000000b002c6ee7caa53so6211169oib.20
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 06:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PocnGmnCbMvgl/mM4UqClsCjrZwW9G0adKzchgFrwe0=;
        b=IQuxMcM2w0VqR6oQa6wgX9TFvW2lyFh5cyOeQAYZgikfweVtfyB3bCZSkhgtWFId8T
         8tBnNGbI+u3W+KFrYAq9AuDnvQni+QL6YsaBlRofIrHwVs1A9ilnNINGkga7YJJecnRo
         S0timA3PcIRWAQjRX8xslSvuUvcJClRcJa67mGpZM6r5aVS+0s6qde/sVKFDVths7Oic
         W0IfVdQUCCrgZ3JYuy6x2ivfnellP+ewsiosaijOfKxoJwVXDbAtfnO9pUZgIYLGMeld
         zfM7hLX6Y2h1ykTzCf5qpCwQAlTHgqse8vUdzc/6M3cneeCPCepB2qSeAgm/SU5tyV4Y
         GRrQ==
X-Gm-Message-State: AOAM530eqGgshw8l7EwjoiEHTRVgCJenIf+Lxwf8vEm8evuLSlYhLYSf
	dAqpu+sq/d5GHP4R+EIckNdfQNIkUlYNLDd/6E96hP3XCNXA28w+cwc57e7KLh1d7k4cOAMDge+
	GJePM5Yrq6IkQ7w==
X-Received: by 2002:a4a:da59:: with SMTP id f25mr43483454oou.46.1641650881981;
        Sat, 08 Jan 2022 06:08:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLFcO/UPfE7QdAafOO6wi0ODe4Q/vmKo+QUX+NZH/NVBUk5VTc2tOqw3QSi/spK+bC/u82nA==
X-Received: by 2002:a4a:da59:: with SMTP id f25mr43483434oou.46.1641650881740;
        Sat, 08 Jan 2022 06:08:01 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id i27sm348535ots.49.2022.01.08.06.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 06:08:01 -0800 (PST)
From: trix@redhat.com
To: james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	tanureal@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ALSA: hda: cs35l41: fix double free in cs35l41_hda_probe()
Date: Sat,  8 Jan 2022 06:07:56 -0800
Message-Id: <20220108140756.3985487-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
cs35l41_hda.c:501:2: warning: Attempt to free released memory
        kfree(acpi_hw_cfg);
        ^~~~~~~~~~~~~~~~~~

This second free happens in the function's error handler which
is normally ok but acpi_hw_cfg is freed in the non error case
when it is still possible to have an error.

Consolidate the frees.

Fixes: 7b2f3eb492da ("ALSA: hda: cs35l41: Add support for CS35L41 in HDA systems")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/hda/cs35l41_hda.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index aa5bb6977792c..265ace98965f5 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -476,7 +476,6 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	ret = cs35l41_hda_apply_properties(cs35l41, acpi_hw_cfg);
 	if (ret)
 		goto err;
-	kfree(acpi_hw_cfg);
 
 	if (cs35l41->reg_seq->probe) {
 		ret = regmap_register_patch(cs35l41->regmap, cs35l41->reg_seq->probe,
@@ -495,13 +494,14 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x), Revision: %02X\n", regid, reg_revid);
 
-	return 0;
-
 err:
 	kfree(acpi_hw_cfg);
-	if (!cs35l41->vspk_always_on)
-		gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
-	gpiod_put(cs35l41->reset_gpio);
+
+	if (unlikely(ret)) {
+		if (!cs35l41->vspk_always_on)
+			gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
+		gpiod_put(cs35l41->reset_gpio);
+	}
 
 	return ret;
 }
-- 
2.26.3

