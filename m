Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035B52570
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 17:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649354061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CK9Z5mVDe4mgBGspYQzzn8gJDiHvz3qCsQ86FE3l+us=;
	b=WFuKJUxC/QlIZxFskVRYmxu/ZS2lQvl5tt7F6EJ7aDHBFaMVjdZ6+UsOM4SYQi9XlAJp+Y
	BjDOQRe0otrRrQf1HGPg/PwQt1YnRW1JcwzrYtgZvT7OPZZebXMPECTtLHMNzZjFuthFLM
	n51XWYJeAyDcaf+m9KOEEIYkTgQTDTs=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-wKcF4bW-PvynTDA0e60osA-1; Thu, 07 Apr 2022 13:54:13 -0400
X-MC-Unique: wKcF4bW-PvynTDA0e60osA-1
Received: by mail-pj1-f70.google.com with SMTP id x3-20020a17090a6c0300b001cab7230b41so3920184pjj.9
        for <llvm@lists.linux.dev>; Thu, 07 Apr 2022 10:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CK9Z5mVDe4mgBGspYQzzn8gJDiHvz3qCsQ86FE3l+us=;
        b=ONxwwWnjKpzOHQ2ec1qJdEvVeunc4BbSNPd6lBgz12+a6yRV3vWAvo8H4Flh9iLX24
         VxXyoHk4wHbm7uv1iaXUc3c9+J49Vl8CuA7v4WvfGzfXm/NTRwOXRCostBvkwsLeKpSL
         j7UjWr45Y4Sj562ZJXprjea9tyGdXas27VXQufn4if+H5Coc16ceX5VbkaBCfjqqwIlw
         HlupK3sOwFQg8RgVOkG4juxrA5CaOY0PA8nb7DBmwPl2b0LapD5h/cvIbJMXfMSpc0b5
         OXGK9Cqdtz0QRN4Q+ASurfHLcGBnww+8CfJ5iXk8iKreYtH7FIRGdr0Ic0xTmLp+U0BJ
         xQ2g==
X-Gm-Message-State: AOAM531apHIuxxzXE2RJk/3/YDQKuX5YcOB8yt+gD6V/1Ge6izETMnn1
	FVYTTMMQ8eHLtptcKPbSq127wkCMNbex6Ldsh+MW54yuO0bag02F0OBcuesrbUt/RK0LgsVkk7A
	tcUwsJNTQERRZTw==
X-Received: by 2002:a65:6b92:0:b0:39c:c97b:1b57 with SMTP id d18-20020a656b92000000b0039cc97b1b57mr3129948pgw.517.1649354052365;
        Thu, 07 Apr 2022 10:54:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY+f9QwoacEBY4kuGoqYuYwACBfLXX9MLBnkeSnGdArm5ggb+OlgU6GsrW0+ANYwvG2th5MA==
X-Received: by 2002:a65:6b92:0:b0:39c:c97b:1b57 with SMTP id d18-20020a656b92000000b0039cc97b1b57mr3129928pgw.517.1649354051960;
        Thu, 07 Apr 2022 10:54:11 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id d8-20020a056a00198800b004fab740dbe6sm23439873pfl.15.2022.04.07.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:54:11 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: pkshih@realtek.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] rtw89: ser: add a break statement
Date: Thu,  7 Apr 2022 13:53:49 -0400
Message-Id: <20220407175349.3053362-1-trix@redhat.com>
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

The clang build fails with
ser.c:397:2: error: unannotated fall-through
  between switch labels [-Werror,-Wimplicit-fallthrough]
        default:
        ^
The case above the default does not have a break.
So add one.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/realtek/rtw89/ser.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw89/ser.c b/drivers/net/wireless/realtek/rtw89/ser.c
index 25d1df10f226..5aebd6839d29 100644
--- a/drivers/net/wireless/realtek/rtw89/ser.c
+++ b/drivers/net/wireless/realtek/rtw89/ser.c
@@ -394,6 +394,7 @@ static void ser_idle_st_hdl(struct rtw89_ser *ser, u8 evt)
 		break;
 	case SER_EV_STATE_OUT:
 		rtw89_hci_recovery_start(rtwdev);
+		break;
 	default:
 		break;
 	}
-- 
2.27.0

