Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A1C33CC1
	for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 15:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="PdKuq95P"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ce656b9780so14922035ad.2
        for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 07:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1700840644; x=1701445444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxH4h/fUgyjGMKXsAUdrvTbwQh/c4Jyei7tUpRPE518=;
        b=PdKuq95PCZO8c2BRI2J+wxfs/QilcLiNFa8N0iVTCQxj2K1bbbVGyy2VfKToUsyDU8
         8WnaVh8YpRfjlL9ReLzXdZ30H8oLv0qJ7qOSW19CXae3kdjhSON12u/3Js0cTIMQr5tk
         RuJ88XLWpqwoEk7eVJ1WFi03eF/i6ImnnDhU0yjWYaV3ZqsKSbXOGkhy7O8tmijDqMh3
         4VVb9rBMgKtbzsHjHV2WXRHjk+VnVVbV4sWlQMYNKm1V5/PmbIyzwM8JIvz0inmjESNL
         QXShwxCCpJUQ4p8FwU2WMa4mlULC3SCK+pOt1uN178w4ikiogrpWMuZsJvS+KirfK8o6
         LJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700840644; x=1701445444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxH4h/fUgyjGMKXsAUdrvTbwQh/c4Jyei7tUpRPE518=;
        b=YEYaqxEM+GKkH0ejcn7Uv+dYUYkYfTiGHojudYCyPrIRvm9MgU168Ipj+b46yzn/9B
         wtuqLT6csdpvisLvedQGqQemUxtE3IzyTb3vjVhVkvL8K+73vC6mYe4X9ACiJzp4SZzd
         VUnSUKVoSulMwx+b2xd7AjzkjhM4hEKTb7uQwNeiFvBgCqY5Yg7YUyNflEO4ayRtGd1S
         zcnJY1pZ/HkMcqbkkhDktqdV+t9qinF4kNRgSf4SPZyeRsde+oYPSi9DXHzHlGlATIk3
         H2A4q5997mL8ttyLezEPf4omXkesq7nIHfvwz02Yirc6TIvZkTckhTb8vY76R23j5oDR
         QHHA==
X-Gm-Message-State: AOJu0YwGZONWPi5+PHAzsUPxO/pwAp9mvkOFCeIurHT/hdjCreyyT7iF
	mNCSgVVQjy/sshY6CGdBKzBKEw==
X-Google-Smtp-Source: AGHT+IESTfwIV1Y4e9dxiuOb6Fx6zh8dfzPm+t7NgGLnsuKfIve4gS4FKHwaEbYY0Jg2cMPODWHT/A==
X-Received: by 2002:a17:902:7d8a:b0:1c9:ca02:645c with SMTP id a10-20020a1709027d8a00b001c9ca02645cmr2977675plm.36.1700840643802;
        Fri, 24 Nov 2023 07:44:03 -0800 (PST)
Received: from rogue-one.tail33bf8.ts.net ([201.17.86.134])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b001cf9eac2d3asm1919743pll.118.2023.11.24.07.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 07:44:03 -0800 (PST)
From: Pedro Tammela <pctammela@mojatatu.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	xiyou.wangcong@gmail.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	Pedro Tammela <pctammela@mojatatu.com>
Subject: [PATCH net-next 5/5] selftests: tc-testing: remove unused import
Date: Fri, 24 Nov 2023 12:42:48 -0300
Message-Id: <20231124154248.315470-6-pctammela@mojatatu.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231124154248.315470-1-pctammela@mojatatu.com>
References: <20231124154248.315470-1-pctammela@mojatatu.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove this leftover from the times we pre-allocated everything

Signed-off-by: Pedro Tammela <pctammela@mojatatu.com>
---
 tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py b/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
index 77b1106b8388..bb19b8b76d3b 100644
--- a/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
+++ b/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
@@ -23,8 +23,6 @@ class SubPlugin(TdcPlugin):
         super().__init__()
 
     def pre_suite(self, testcount, testlist):
-        from itertools import cycle
-
         super().pre_suite(testcount, testlist)
 
     def prepare_test(self, test):
-- 
2.40.1

