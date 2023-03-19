Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ECCE4C4
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679234077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SE+hbc2PpdOm6jFmUnfn7gxJd8fzcxI50vFrTMNLyGw=;
	b=f1qZUFzHp0BV5ToSlXszxGK4ktnkttboYritS9WxMw/rRXP2xJsqL3wK/Fff+TukcPkiI4
	l76tWrcbDrwBI0tesx9ZJH1oBLUgQqoqJuVOdK6xs2chV1Cqa5dk8DigeMyNiUZejvhHEO
	kqsSGYisMRo1Jy73A9ESm45Yspi4pRA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-yBVj28HxMa2RX9td5fMCiA-1; Sun, 19 Mar 2023 09:54:35 -0400
X-MC-Unique: yBVj28HxMa2RX9td5fMCiA-1
Received: by mail-qk1-f199.google.com with SMTP id 206-20020a370cd7000000b007467b5765d2so593809qkm.0
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 06:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679234075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SE+hbc2PpdOm6jFmUnfn7gxJd8fzcxI50vFrTMNLyGw=;
        b=F/QzsIJ7g+nRlK8OL1XJUqw1+s3i8SDGb2B+KUdTPlSouDMVfu9bETaoSCvLNMSJAG
         MYuQaAzydFe3DXAwn7SyUh7agX9OYpVnAvAeCQRDa1fGIEBVCeMsPRX9lSxPhb0g0Ds7
         86tFyif7QIziWyvIf4HuBtiNUvnsPTl1OTJ8wyO6Wv9uWciQRyWgGILiYjeem6lbm+cf
         3FgfOkLsuqsAY/3pjKrVycaCwFxh8KhMm5vQ/bz3IVwxbpKZYY9mwSwGySXO0HtMJOda
         /q6uL+cnpn7v24bYS6364zpl60EVaUGsAuTXuZXrXG4W87+OIY7SDxA2LDbcsyQiZhi1
         /2/w==
X-Gm-Message-State: AO0yUKX7jrimGQlRDvVf0vyEwOY3qnKOyLLUaoKAtAOpkmazM2JTxB5E
	WOS9ELvTwyHZVeHqp/0YoXvt9Ehx9ymT7nAKcvpuskSw8326z/WhoAJH51CMdX3Houex9J/APlb
	XPeuT8PS0IIQy5w==
X-Received: by 2002:a05:622a:1387:b0:3bf:daae:7ee6 with SMTP id o7-20020a05622a138700b003bfdaae7ee6mr22103380qtk.18.1679234075263;
        Sun, 19 Mar 2023 06:54:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set/SUf1dS9D3NGgKWgB9272dqTQaCIgVClcOcHUMHiPQbfT/rPxkVqzfjAoOoL29N2AJV31JPQ==
X-Received: by 2002:a05:622a:1387:b0:3bf:daae:7ee6 with SMTP id o7-20020a05622a138700b003bfdaae7ee6mr22103366qtk.18.1679234075026;
        Sun, 19 Mar 2023 06:54:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id x26-20020ac86b5a000000b003bfa2c512e6sm4859344qts.20.2023.03.19.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 06:54:34 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: stas.yakovlev@gmail.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ipw2x00: remove unused _ipw_read16 function
Date: Sun, 19 Mar 2023 09:54:18 -0400
Message-Id: <20230319135418.1703380-1-trix@redhat.com>
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
drivers/net/wireless/intel/ipw2x00/ipw2200.c:381:19: error:
  unused function '_ipw_read16' [-Werror,-Wunused-function]
static inline u16 _ipw_read16(struct ipw_priv *ipw, unsigned long ofs)
                  ^
This function and its wrapping marco are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/intel/ipw2x00/ipw2200.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
index b91b1a2d0be7..dfe0f74369e6 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
@@ -377,19 +377,6 @@ static inline u8 _ipw_read8(struct ipw_priv *ipw, unsigned long ofs)
 	_ipw_read8(ipw, ofs); \
 })
 
-/* 16-bit direct read (low 4K) */
-static inline u16 _ipw_read16(struct ipw_priv *ipw, unsigned long ofs)
-{
-	return readw(ipw->hw_base + ofs);
-}
-
-/* alias to 16-bit direct read (low 4K of SRAM/regs), with debug wrapper */
-#define ipw_read16(ipw, ofs) ({ \
-	IPW_DEBUG_IO("%s %d: read_direct16(0x%08X)\n", __FILE__, __LINE__, \
-			(u32)(ofs)); \
-	_ipw_read16(ipw, ofs); \
-})
-
 /* 32-bit direct read (low 4K) */
 static inline u32 _ipw_read32(struct ipw_priv *ipw, unsigned long ofs)
 {
-- 
2.27.0

