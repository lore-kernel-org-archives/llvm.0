Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED46DC959
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 20:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679603243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OhYpZ8KzjW1wsLxHwkxEX6G5RCZGyESus86bamUc+qA=;
	b=eHT/mzyGs3FlyF/fzv7v0dRDotVsZluLDcn0JIW+H4IxDF9TuxnCHRZBhbzxYkV8Lb/WvU
	kqWPcDnxvVj8hdaJ6xIpCjTSP4S0aPZZxM/zstRsirx9Oc0ITrAi40Iv10zOjGUEDEQDEF
	+Ak0yS6EPo5/7w77zSZr6KXbJ1kUlQ8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-_VN17-RYOT-a81-hS_paWA-1; Thu, 23 Mar 2023 16:27:18 -0400
X-MC-Unique: _VN17-RYOT-a81-hS_paWA-1
Received: by mail-qk1-f199.google.com with SMTP id x80-20020a376353000000b0074681bc7f42so6866606qkb.8
        for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 13:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679603236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhYpZ8KzjW1wsLxHwkxEX6G5RCZGyESus86bamUc+qA=;
        b=SkmqlzECSwN63LPcjUT1aZt7cbrjNe4HSA0erHLL0zghXeI+O2ir6G85yXxt/Pmynq
         WT0zMMbjB5qvb6Z8v82snJv9GqEE8GzFwyDoBDuGUNQSFlv6cR5HxMejBTp6QjAmKbi4
         L7IrPFLr4b0Tv7CEJKDFCRdQLRQn2I3e3Q0n0gi6Fb7K6Ada89GbsB96UI/vO0nMtwNC
         AhbZjMHbh/EtHEIxKu/oDT498zz7a3gtJQVfMM9F4IyXNHJL9LZR6M42LkKUs4Vc462W
         aC8VVo0gSzJgYItKcLlDIgG0N5hgYHhfZYBJ5+lB4kIiqH9uybW2YAyyTXYbBf5lKfDO
         CHgg==
X-Gm-Message-State: AO0yUKXNSSucGDs+I7RGRo7Yxdea7BU53nRPYNarhMQlF1sz+NYEFGWt
	jZxjJ+JVxH5DYSXy2scq/9GvB0u42FaJ+m1cZqd+tYWG2ifSxDnHYBsM5GPAiVzqNtpLrWLTduJ
	Xc/rmnncpvzpudw==
X-Received: by 2002:a05:622a:b:b0:3e3:87b8:8d44 with SMTP id x11-20020a05622a000b00b003e387b88d44mr1268776qtw.21.1679603236379;
        Thu, 23 Mar 2023 13:27:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set9nfcaOOPG+v24oW8TGCbt1FFZkuvDD8XTlbtr5XxZmlwYWNwjdxerj/TRLmVhphIi/iVJv0A==
X-Received: by 2002:a05:622a:b:b0:3e3:87b8:8d44 with SMTP id x11-20020a05622a000b00b003e387b88d44mr1268751qtw.21.1679603236138;
        Thu, 23 Mar 2023 13:27:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id f9-20020ac84709000000b003e0c94a6af0sm7986298qtp.53.2023.03.23.13.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 13:27:15 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ALSA: hdspm: remove unused copy_u32_le function
Date: Thu, 23 Mar 2023 16:27:13 -0400
Message-Id: <20230323202713.2637150-1-trix@redhat.com>
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
sound/pci/rme9652/hdspm.c:6149:19: error: unused function
  'copy_u32_le' [-Werror,-Wunused-function]
static inline int copy_u32_le(void __user *dest, void __iomem *src)
                  ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/rme9652/hdspm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index fa1812e7a49d..267c7848974a 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6146,12 +6146,6 @@ static int snd_hdspm_hwdep_dummy_op(struct snd_hwdep *hw, struct file *file)
 	return 0;
 }
 
-static inline int copy_u32_le(void __user *dest, void __iomem *src)
-{
-	u32 val = readl(src);
-	return copy_to_user(dest, &val, 4);
-}
-
 static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 		unsigned int cmd, unsigned long arg)
 {
-- 
2.27.0

