Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67C723AA
	for <llvm@lists.linux.dev>; Sat,  2 Jul 2022 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656776362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W8c1SlBUxYM10s99ei02CiGdLvmIh2XzeBEOuTV4Qx0=;
	b=DguW85NjAy2G9pBYQLphd9AtI2PiVZQsm7Z7H8gSNbU3gQ4WTwj7LXKWn1ZOlTRQXLpvjg
	3Lj5DMu8leLFu1CriYhY9kwkX9Xt+k6x47KLCBosd0CAPtUsmjFZgJlENyZHWC/E9C8Rko
	hpJZrntri6/8BXjIIWTOh2+lZAcYWL4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-1slIqS4PNcKPfvh92ySc8Q-1; Sat, 02 Jul 2022 11:39:14 -0400
X-MC-Unique: 1slIqS4PNcKPfvh92ySc8Q-1
Received: by mail-qt1-f200.google.com with SMTP id f28-20020ac8015c000000b003183eca483bso2821989qtg.2
        for <llvm@lists.linux.dev>; Sat, 02 Jul 2022 08:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W8c1SlBUxYM10s99ei02CiGdLvmIh2XzeBEOuTV4Qx0=;
        b=TuJedFk1gbL/lUsCqw6IhAhIuUdYAypc3zFk8b2RPCgq+GiCPrSOqfwLmw1FCA5eeE
         N8a5nMUdLyuYZtecCboUBCj3EjNNiATJdtYzRLUsvsi3uG9ZVdIWhqpKpwnb1vLejqWp
         TmPr3AwKmC3CT0QTlfqN5xmm0RR+DICzVJJbvwXdPuxhjT4NyNolGYhhuYut22D6A0kA
         YPkM5LsEIuK5ARXS7w5uYKR6T2B0sKmM41zbHv7Gq1eZ1g6/7BJ9k/YVXkckaSEPmYxo
         zeHyrPMhUcOMpInlDshI7HbNgKhJzShoUT8rM3MgmdTTVFPq68eSNQauHwlbLvL8BOk8
         mDVQ==
X-Gm-Message-State: AJIora99Y9uHqMsne3hpAvfRrMTZavpP0akljztkey5a7so1otIxqxWU
	Vd5eX4VbOPbcaEzabCj6pcmC0Y41OvIX/OoFS+Aa8/XHrSqN6ZJIVhZucbSlzTE+ReAE78wEQIS
	2bJDLnvuIgYmVOA==
X-Received: by 2002:a37:4549:0:b0:69f:556c:4e38 with SMTP id s70-20020a374549000000b0069f556c4e38mr13936447qka.202.1656776353549;
        Sat, 02 Jul 2022 08:39:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s4kMDCJkO3l6rc/tzkcDONaBzbN/O5Ul2p3pH701RTsQYUDroNVnzGAdCYv5GPNqp46q1+Vw==
X-Received: by 2002:a37:4549:0:b0:69f:556c:4e38 with SMTP id s70-20020a374549000000b0069f556c4e38mr13936437qka.202.1656776353290;
        Sat, 02 Jul 2022 08:39:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id x9-20020a05620a448900b006a708baa069sm14569688qkp.101.2022.07.02.08.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 08:39:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com,
	kherbst@redhat.com,
	lyude@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/nouveau/bios: set info only when the return is not 0
Date: Sat,  2 Jul 2022 11:39:04 -0400
Message-Id: <20220702153904.1696595-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang static analysis reports
drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c:68:17: warning: The right operand of '*' is a garbage value [core.UndefinedBinaryOperatorResult]
        switch (!!data * *ver) {
                       ^ ~~~~
A switch statement with only a default should be reduced to an if.

If nvbios_pmuEp() returns 0, via the data variable, the output info parameter
is not used.  So set info only when data is not 0.

The struct nvbios_pmuE only has the type and data elements.  Since both of these
are explicitly set, memset is not needed.  So remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
index b4a308f3cf7b..49e2664a734c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/pmu.c
@@ -64,12 +64,9 @@ nvbios_pmuEp(struct nvkm_bios *bios, int idx, u8 *ver, u8 *hdr,
 	     struct nvbios_pmuE *info)
 {
 	u32 data = nvbios_pmuEe(bios, idx, ver, hdr);
-	memset(info, 0x00, sizeof(*info));
-	switch (!!data * *ver) {
-	default:
+	if (data) {
 		info->type = nvbios_rd08(bios, data + 0x00);
 		info->data = nvbios_rd32(bios, data + 0x02);
-		break;
 	}
 	return data;
 }
-- 
2.27.0

