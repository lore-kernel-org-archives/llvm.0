Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E85D154C18;
	Sat,  5 Oct 2024 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728136387; cv=none; b=sz+rXl+UwR2rJTP7/1dr2EdpTXnv7gEEhl40hpf0bzlB7iiIi3o73Pt0z8RmHKcKkxHGfwx8Ct279UoU3QlLgKEmFKpY1JcpPZWeuYv1n03C09K6fSB6eLhLpS5XwTrPUcTOyH9KI8ut+ZY0rc6WBxgJcMDb5u9K28YVIhDkWyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728136387; c=relaxed/simple;
	bh=rVTfpkUt2C6ikOnYg6ariyltWsIP1HzH79tfa+TwsXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJ0i5HIDBm+0BmjZ7CcxLFraKDz2ooPQzr1exa/ar9Z1huOXf/AsFXudJmS9NyB19onRI/abVIhtNkSJ+RpTaR/ONIOZ1lMGQVb8njNeU7aZ9nD9SUuzUaf4hJKExQUMpfoTXyPMV1VIkvRqX2Zdv2tJxoJHMYUOeqCEBVYiTkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=To6M25jF; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="To6M25jF"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2e0d9b70455so2425151a91.3;
        Sat, 05 Oct 2024 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728136385; x=1728741185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juguD7Z4L8Oxo1MbfxKEFZl+Z9cwMrDoIprZ8VE739E=;
        b=To6M25jFNM0HM+R1TWXtz72QWPtxM0baHaNLI3buOswiIyAt6DMFEPFMvS3/teK4TJ
         WVTfr37Z96S6AsfQdnLCuAujCHpN9OY8O3ZogsJODoVSMvpeQmTMXO0t+XDmAbwpETAj
         zVVeGz3J9WG7HBfdXMmNjAKK7rnxtOP35JEHyoekbuyfDhJqGH2Lu0zcafOZnGGKiBAF
         2uCoW1DQTqp3ga5jNYt3PBS8KkXkSHoJljPN2Wzz8JCthaN0fla2NmD2xRBuo1JijstL
         R1J9fuugdjd0SVVByeIqu2G70p1ehGCMvcxXB8hdrzbWDAYn/6QOLWl3CUAAkE1u0I2z
         kTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728136385; x=1728741185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juguD7Z4L8Oxo1MbfxKEFZl+Z9cwMrDoIprZ8VE739E=;
        b=hHcbaiU3Jg1PlGlhlXbw/6VSfpthbqWnpKEWwLf0XUGspCi9/MAcFp2hbLn5E88Pd/
         AEiwg8I2H7bNxL9Wu5+qOAHeLq49JOXTPp1LCqOd+YoKev1lyY8PwxmskjiJ6GP84Hlj
         1moYviHreFhNOczTW98DvfHh43rlSKtHgg/u8kd7+oW1lzMZ3PpR8HQxSXVtSD46JFsR
         m5YOVE2UTvSjOcgN8Qd6/l3fpHC1M57xfS/GqzwA+Uic2D0W9dZuvNhA3Drau/k9jzat
         d9l6ubnzvCNNuOQ3INcxbNnoiMvNdAyiuJCB+ThMlmQSFwhw1X+V9cMlfnu66PBOi3MK
         CLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTGzi3Gztxmtjze7TxAaVwkIepGk7VW8ZnFujJkiC5CelDxCgQgcAAYdQBuUHQeRmhP27l@lists.linux.dev, AJvYcCVvPUApgp3PjWdt24l31jW8zqas3bQ1u+xancHoQC2LaOkXnSbY94OapoOEWXLW5k2q4XI8bZo2Y+VeXFkaYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4/mMU/hT6uxJBi+FVe8T7uMLohSzt/n/bwEzoMHqdVmH4x6t5
	TtmOXQ7237W86nXncnGQUriXWpf4kpfMqGjJ/oUazju4e0j4VJBk
X-Google-Smtp-Source: AGHT+IGKP3FaVPKvS7b/LTqBGjTMHfY676RNAFxhZynxmhsXo6blpWwOYS7eHXelFyjCiQZ5conXMA==
X-Received: by 2002:a17:90a:fd87:b0:2da:6812:c1bd with SMTP id 98e67ed59e1d1-2e1e621f1e7mr6674143a91.15.1728136384824;
        Sat, 05 Oct 2024 06:53:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a74:2681:86c0:b921:7e4f:199e:c149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85d959dsm3576169a91.26.2024.10.05.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 06:53:04 -0700 (PDT)
From: Xiaofeng Lian <1198715581lxf@gmail.com>
To: lkp@intel.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	stefani@seibold.net,
	Xiaofeng Lian <1198715581lxf@gmail.com>
Subject: [PATCH v3 2/2] include/linux/kfifo.h:fix errors
Date: Sat,  5 Oct 2024 21:52:50 +0800
Message-ID: <20241005135250.121964-2-1198715581lxf@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241005135250.121964-1-1198715581lxf@gmail.com>
References: <202410051712.VDmFpiVZ-lkp@intel.com>
 <20241005135250.121964-1-1198715581lxf@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410051712.VDmFpiVZ-lkp@intel.com/

    - Fixed an error detected by the kernel test robot caused by an
      incorrectly passed parameter in the INIT_KFIFO macro.

Signed-off-by: Xiaofeng Lian <1198715581lxf@gmail.com>
---
 include/linux/kfifo.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index 66eb1b8971f7..316b6c019550 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -148,7 +148,7 @@ struct kfifo_rec_ptr_2 __STRUCT_KFIFO_PTR(unsigned char, 2, void);
 	struct __kfifo *__kfifo = &__tmp->kfifo; \
 	__kfifo->in = 0; \
 	__kfifo->out = 0; \
-	__kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp->buf) - 1;\
+	__kfifo->mask = __is_kfifo_ptr(__tmp) ? 0 : __KFIFO_SIZE(__tmp) - 1;\
 	__kfifo->esize = sizeof(*__tmp->buf); \
 	__kfifo->data = __is_kfifo_ptr(__tmp) ?  NULL : __tmp->buf; \
 })
-- 
2.45.2

