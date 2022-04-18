Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976A80F;
	Mon, 18 Apr 2022 13:46:06 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k22so18633242wrd.2;
        Mon, 18 Apr 2022 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yoyp44JzkHGTT8ZqJq8l6tDNGuUOI937tn9ZpUzw9Wk=;
        b=gh/1az9LTsIQ8Waf71s3RlA7yMXX3Mse3hATc2/up5VvELAIhgtHel3pbElJrsVo2Z
         ekz2AFEXacg2HIbAA2Fp1xbsgwpbyk0bAfqoC2FOK0P62HXf9rb8Zmo7vAj1LTpS3iEj
         Ixi6t4b9Pd20eV09JXiONq1W46dNqBFKz4bhgiWiBdq2AVyq4uzV/BH3bEucMunsQkiF
         E8kaThovYTKQQnqJ4dxlKqjbJUWNMkNR497vhYUMVd3zuW+G4AoI9Gz8tzqCZOLjjWk1
         De79kUsuZqELYp1BmokBLWJ1QBrvDibANF6ZLTZEaqs49XeQBlZVX0ADsMUjKf2KtgH2
         iUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yoyp44JzkHGTT8ZqJq8l6tDNGuUOI937tn9ZpUzw9Wk=;
        b=RIjEq+k/d83Oiow3jsbdVLY+Y7yenP5L1xQUUKIJ1pT3BUOYCR3IylfkRtvgOZGl1P
         rrpy9Uxe6SmUFJCnkSJiSrzQTQl/8pWMLdu2LfGELl6SJoFwPZGv+olZxWlDg9/4+bsf
         POYhwffHfvuaAD10T/FWvzuwMDeYsATQko4CsN09GG6PxXWQ+ESP4f5xdCLohrk2IC05
         eIU/UEuxWuB9vCZT3SxNFzLLJQlVq2CHYYWVhkUOGdtwfKVCXlR5nV5hiBTrETSqEC2D
         F9BUCgyE04tMM1Ul+mujijJCus/gy7rugYL98pjGVtOPEekpdU1PxIhR1j36jUp6Bwet
         i2rw==
X-Gm-Message-State: AOAM533sbHPRltha19wvJMzgOqvLJwv0WtoB+u08vO50pdEhIhfU9Iz4
	ZUs0HNyjyHkstDPDrt2Sv0s=
X-Google-Smtp-Source: ABdhPJxAVkklnnI5HFoDgPCIommVtr6wdWI7ulYdjfDzlnh9LUgLfiMDzA4l6bYkJLTgZA9t1un9QA==
X-Received: by 2002:a5d:67d2:0:b0:207:a5cf:c14d with SMTP id n18-20020a5d67d2000000b00207a5cfc14dmr8421376wrw.365.1650289564671;
        Mon, 18 Apr 2022 06:46:04 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id v11-20020a056000144b00b0020a9c02f60dsm1835302wrx.50.2022.04.18.06.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 06:46:04 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] staging: iio: ad2s1210: remove redundant assignment to variable negative
Date: Mon, 18 Apr 2022 14:46:03 +0100
Message-Id: <20220418134603.81336-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable negative is being assigned a value that is never read, it is
being re-assigned later. The assignment is redundant and can be removed.

Cleans up clang scan build warning:
drivers/staging/iio/resolver/ad2s1210.c:502:3: warning: Value stored
to 'negative' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/iio/resolver/ad2s1210.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/iio/resolver/ad2s1210.c b/drivers/staging/iio/resolver/ad2s1210.c
index 74adb82f37c3..c0b2716d0511 100644
--- a/drivers/staging/iio/resolver/ad2s1210.c
+++ b/drivers/staging/iio/resolver/ad2s1210.c
@@ -499,7 +499,6 @@ static int ad2s1210_read_raw(struct iio_dev *indio_dev,
 		ret = IIO_VAL_INT;
 		break;
 	case IIO_ANGL_VEL:
-		negative = st->rx[0] & 0x80;
 		vel = be16_to_cpup((__be16 *)st->rx);
 		vel >>= 16 - st->resolution;
 		if (vel & 0x8000) {
-- 
2.35.1

