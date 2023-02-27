Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A7374;
	Mon, 27 Feb 2023 00:41:23 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 16so2575796pge.11;
        Sun, 26 Feb 2023 16:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbCPVQtiESRrldU5N97vl2jVTNR3CI+lTkLJPv/JlxY=;
        b=FIhL7WvMTJJI0MvKC8BuE83lhEBcgqpFgltetQFkUhlFharmOUhsjX1gsyTSdrgqvf
         gnb4RP6bIYIRXKe0E+ZVZ5IOVqkA2LE1FSRRm02NN3rVGpgjjKnLEjjOTUIEwBoy5JF8
         +67Nap3EZcr6sqPx4V5JPbV2LjFrwBbOXG0vCbKIzStdQT5uh8ZWYzlrtW3rB15B5r9G
         ytNrKbDYwLHLv8GcKsdfIaha3HJlcQ6m4BL/ndv5tFi1+u3YNOc/+163gnbgr0LjpFJy
         KdecQpTvJ6H2r0ZlDGfibheaxRX2wRtYdiEH9FT8nOjqez4P8d0QJHCEaOQgb81s6BaK
         jw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbCPVQtiESRrldU5N97vl2jVTNR3CI+lTkLJPv/JlxY=;
        b=lbWV3unnXyEYGykss0X59FTPWEUS3PGFceaKYoNS4IgnM4bbT06KmA+bGZupnKPgHn
         o00SfWexcOKYSueAiHDylEwx3+QLu+eusJ1bgD+0tqtgG8kwwI1P+gg0ZUinuLIi6aqw
         Lwg4OLpVn4Jh6IAItV8hxNurjre1s5katReB3WVEWblcrED9PnMXGUKRf8isOIk+ekw6
         5GxKvPz6fAtsx2NsDG2w7dQ9MG9fdBt6qacO3hVtLYbyCVpsR4bCtr6/h1rPm3JJC7B+
         zOelHRWffiOVXoVpqO0U+6YOFDiLiTuBtS9HvRB7VxbgEpb/5gaZ6cOP1NeYV1wztla5
         zWAw==
X-Gm-Message-State: AO0yUKWQ9Eyk7qSfLh3aEzyhUfo2tzwqcxPmeMJcGMYa3dnxMj7Uxwty
	M7QGPy1O/iFvX1tD9sejJ8z16+U/0Yd4J4Jw
X-Google-Smtp-Source: AK7set/9dfT1kX/+D9/ExaK6VxhqfV4WwZG/fOXQiLyvCUAHB5NX4ks34kXfo7q0J0zbGORvDjXr5g==
X-Received: by 2002:a62:1dd0:0:b0:5e0:316a:39ce with SMTP id d199-20020a621dd0000000b005e0316a39cemr9681985pfd.27.1677458483279;
        Sun, 26 Feb 2023 16:41:23 -0800 (PST)
Received: from passwd123-ThinkStation-P920.. ([222.20.94.23])
        by smtp.gmail.com with ESMTPSA id l12-20020a62be0c000000b005da23d8cbffsm2951023pff.158.2023.02.26.16.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 16:41:22 -0800 (PST)
From: Kang Chen <void0red@gmail.com>
To: lkp@intel.com
Cc: agross@kernel.org,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	konrad.dybcio@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	ohad@wizery.com,
	void0red@gmail.com
Subject: [PATCH v2] hwspinlock: add a check of devm_regmap_field_alloc in qcom_hwspinlock_probe
Date: Mon, 27 Feb 2023 08:41:16 +0800
Message-Id: <20230227004116.1273988-1-void0red@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202302270034.DqtDwv49-lkp@intel.com>
References: <202302270034.DqtDwv49-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_regmap_field_alloc may fails, priv field might be error pointer and
cause illegal address access later.

Signed-off-by: Kang Chen <void0red@gmail.com>
---
v2 -> v1: add missing parenthesis and switch to use PTR_ERR

 drivers/hwspinlock/qcom_hwspinlock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 9cf186362..dee7bb5ea 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -197,6 +197,8 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 
 		bank->lock[i].priv = devm_regmap_field_alloc(&pdev->dev,
 							     regmap, field);
+		if (IS_ERR(bank->lock[i].priv))
+			return PTR_ERR(bank->lock[i].priv);
 	}
 
 	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
-- 
2.34.1

