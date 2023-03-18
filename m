Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127CD2560
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679146310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UUlLexOxTlL2rJRhRjOGMCzDKj9OAhc0E+V/p5S5fiE=;
	b=gnainWYg+Ys//IqcskBXPvSAr1n35WJ552LWzn8CiIftpOJiv8UVtq1UulRX1iS2pXj9Fd
	zZ87fBhmgth5ojCdColcULZILAWTq1BTMQr5VSoykEO30fiNE3wiHki3UdqdoN1rMeFdbY
	4vkNIlU2dvP6NwqE+IwyEi11AmkyUuw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-yRFkCN1WMseHAi1hj50TTA-1; Sat, 18 Mar 2023 09:31:49 -0400
X-MC-Unique: yRFkCN1WMseHAi1hj50TTA-1
Received: by mail-qk1-f200.google.com with SMTP id a14-20020a05620a16ce00b0074616159bd9so3724887qkn.2
        for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 06:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679146309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUlLexOxTlL2rJRhRjOGMCzDKj9OAhc0E+V/p5S5fiE=;
        b=G1eqxN0Km7q4ez/OKEKzOdu5iPh/s0YAZWIXHzvISulFGatS568k20K2TO32RS884S
         vgTmVRam4qxC/j/PVM0BQTOr7aN59imm4+UlYYgUp4QmKSzcmGg2X303gQ8KcQ3ko+MT
         nC/t9k5Th9nKAQ/toqrdDFn1lHp4uKmd5fPTdaR2/EaeaTuqQpw6X9fwct63fnTbpc8c
         jXmD2pBoajoaUUefZqLC6OK2/8gcXlg20tcHBwy5sOeIN+wVFxMKs9TlM58rJx6nWziq
         fB8lM7JCkLzs0q7gUnXji3hLi6px8B299RwhqVNc+I9aIWJMWnXrvwtnnFEQTF5tp1/I
         2t5Q==
X-Gm-Message-State: AO0yUKVt+AL2M/6aCIPW1R7NtrCBW4wmTww/rqlUcq729lS4gENb4vyQ
	/KcaCO9Cf/k2DIIb8pCCltinLpSsBXGZyl3Sriti+8XRcwGsWnQM6hXKusUV/ExyNobTBgH6C1F
	j3HGrkmvkAR2yiQ==
X-Received: by 2002:a05:6214:5281:b0:56e:bc62:e151 with SMTP id kj1-20020a056214528100b0056ebc62e151mr46569159qvb.7.1679146309201;
        Sat, 18 Mar 2023 06:31:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set+PZFX2mVoz7k+s6UMIaLaX9bdTOGY4ZLkhjSi2vKRtz+hqyRNo8gymhk+SaWflKTunQ1zwDg==
X-Received: by 2002:a05:6214:5281:b0:56e:bc62:e151 with SMTP id kj1-20020a056214528100b0056ebc62e151mr46569138qvb.7.1679146309006;
        Sat, 18 Mar 2023 06:31:49 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id p16-20020a05620a057000b00746476405bbsm3566936qkp.122.2023.03.18.06.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 06:31:48 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ALSA: ymfpci: remove unused snd_ymfpci_readb function
Date: Sat, 18 Mar 2023 09:27:08 -0400
Message-Id: <20230318132708.1684504-1-trix@redhat.com>
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
sound/pci/ymfpci/ymfpci_main.c:34:18: error:
  unused function 'snd_ymfpci_readb' [-Werror,-Wunused-function]
static inline u8 snd_ymfpci_readb(struct snd_ymfpci *chip, u32 offset)
                 ^
This static function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/pci/ymfpci/ymfpci_main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index c80114c0ad7b..2858736ed20a 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -31,11 +31,6 @@
 
 static void snd_ymfpci_irq_wait(struct snd_ymfpci *chip);
 
-static inline u8 snd_ymfpci_readb(struct snd_ymfpci *chip, u32 offset)
-{
-	return readb(chip->reg_area_virt + offset);
-}
-
 static inline void snd_ymfpci_writeb(struct snd_ymfpci *chip, u32 offset, u8 val)
 {
 	writeb(val, chip->reg_area_virt + offset);
-- 
2.27.0

