Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99D33FF
	for <llvm@lists.linux.dev>; Wed,  8 Feb 2023 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675871714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7sUnVzlMx2m7Rm8oB22gZPkorcr5iVWMwlElG24lMuQ=;
	b=bXuMHlRaFmTVlv2qmyqju4Df1ueMDMXlSI+GaHjqDkkr7E9QAVSQ+g6XlXHcP9WNjpCFuS
	P9X/g94zgTOoQVr1BxOku4zd8i5m+Elk3p5OyT+dBHEaJmwemRX6r4PEt1YBJa4eteFFcF
	bdc35KyxOOZKTaakat2AIXoN2yxzdUk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-9Wx6d9vNPomJkng1NPXLug-1; Wed, 08 Feb 2023 10:55:05 -0500
X-MC-Unique: 9Wx6d9vNPomJkng1NPXLug-1
Received: by mail-qt1-f198.google.com with SMTP id x16-20020ac87ed0000000b003b82d873b38so11033475qtj.13
        for <llvm@lists.linux.dev>; Wed, 08 Feb 2023 07:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sUnVzlMx2m7Rm8oB22gZPkorcr5iVWMwlElG24lMuQ=;
        b=G35lhucVDwCTenutJXDbf+4LBTlfsfwqPUpMqEhpPFi58+DrnZi1pxZq6eWHFy0OKp
         5CsF10SO4J78o2il7+hzHXpgcBHxdo7AVz3EMpVi5tY+kJkrAbw5QorlsIR+X4XZ31WB
         Ms0YryqGwYIJbjbzkisiC5UxOY4JcoTk/jVYi16gzrutWyBYVhuu+X2Lz98a+IMsAS1R
         ofTE4+U7M6dSJ3AkwiQiRofjG+J2bvp44w/PN1BK0XmRA7PH9FfP1UxzwPu6o0dRaQJ7
         g4EVrAVDw8e4xXvvrx5PoFgqk7ydMSh4kIuwfuRizYv4lOb7Df+aoBhtGZjnGChVSIPr
         sKDw==
X-Gm-Message-State: AO0yUKUusDUhlqNpfRtLrBvbv4tPihj0qRM0y29DzR1nQNM4/dTFpLQE
	5lGJU9g08bqRBPWBFT7YqskZ+JRmkbWs5Tdj++9PNZ0Vtk9C4vddz/tRjuA/mbT+CoOIwQtmTHp
	HJXV1i9QLpi+/Bw==
X-Received: by 2002:a05:622a:5ca:b0:3b9:c08f:219c with SMTP id d10-20020a05622a05ca00b003b9c08f219cmr13508072qtb.29.1675871704836;
        Wed, 08 Feb 2023 07:55:04 -0800 (PST)
X-Google-Smtp-Source: AK7set862iDAv82HIBQc08b5kthNBVKLMTR0KXzZsKi+mk6XsGXu9KCp2Z6GeLeI1VsYZYW5IjQWMQ==
X-Received: by 2002:a05:622a:5ca:b0:3b9:c08f:219c with SMTP id d10-20020a05622a05ca00b003b9c08f219cmr13508050qtb.29.1675871704525;
        Wed, 08 Feb 2023 07:55:04 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id s9-20020a05620a0bc900b0071aacb2c76asm11841896qki.132.2023.02.08.07.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 07:55:04 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: ogabbay@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	kelbaz@habana.ai
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] habanalabs: change unused extern decl of hdev to forward decl of hl_device
Date: Wed,  8 Feb 2023 07:54:50 -0800
Message-Id: <20230208155450.1941608-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building with clang W=2 has several similar warnings
drivers/accel/habanalabs/common/decoder.c:46:51: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
static void dec_error_intr_work(struct hl_device *hdev, u32 base_addr, u32 core_id)
                                                  ^
drivers/accel/habanalabs/common/security.h:13:26: note: previous declaration is here
extern struct hl_device *hdev;
                         ^

There is no global definition of hdev, so the extern is not needed.
Searched with
grep -r '^struct' . | grep hl_dev

Change to an forward decl to resolve these issues
drivers/accel/habanalabs/common/mmu/../security.h:133:40: error: ‘struct hl_device’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
  133 |         bool (*skip_block_hook)(struct hl_device *hdev,
      |                                        ^~~~~~~~~

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/accel/habanalabs/common/security.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/security.h b/drivers/accel/habanalabs/common/security.h
index 234b4a6ed8bc..d7a3b3e82ea4 100644
--- a/drivers/accel/habanalabs/common/security.h
+++ b/drivers/accel/habanalabs/common/security.h
@@ -10,7 +10,7 @@
 
 #include <linux/io-64-nonatomic-lo-hi.h>
 
-extern struct hl_device *hdev;
+struct hl_device;
 
 /* special blocks */
 #define HL_MAX_NUM_OF_GLBL_ERR_CAUSE		10
-- 
2.26.3

