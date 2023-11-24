Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC383172B
	for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 15:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="HJQp++4V"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cf7a8ab047so15736505ad.1
        for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 07:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1700840630; x=1701445430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=em900Y8e2LU3XRCCvv0FDkDi7n3dBJKfbFWfFC6kde4=;
        b=HJQp++4VuDCT/24XWIYH7skkpASrFjuK+R4Kk6Y3IVe9EFTWCO7Y8xzVs7OSzM+huL
         U3vizsBZK/bdH5cXsMDEVaaLlX1OpdVvpo+gNGb6dS8LRPFtde5QnDoX9A7Tj8HdYgZ2
         m0VAgtNoIkvW0DezCbU5OEatT5kYPmVV8S5efDVrDoYyxOqflEo2ZBV9uMEGH8uuC9IY
         sUhcGDlMDLuc3wy5PG3wQZbmHzrp2gLzM0sQOBGqgU5x1XSrWP2JES7o9egaOi9Xkv68
         7SHkaQTzI2wfxmkiDyNqWCUgaHAOgM2Lt1vosR+QVH3daGbo4ssGtllrJXw/J88YzUI2
         RPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700840630; x=1701445430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=em900Y8e2LU3XRCCvv0FDkDi7n3dBJKfbFWfFC6kde4=;
        b=sLX2L9zwwo/5fe/EBvxjLSJGIFU2HICtRTxAVHPVvWJTE/qOts70c9F7iTUxMIOznZ
         hsqBeVgOBLQ2ZQpfWspb7XObjlggi+5/XGxF8sUN87VOom4uiwfyr/9xdAuYcbLN5MD2
         nu60SHa9F3sX5EA0t6wPpDRfP3YfQ9pV8Hu9YeVrh6KRH+qvDAH5HINev1YZLOc3ioN6
         afkwdsSjiRTnYSyNl41dIQsb5MDDNPY6VXR1wt7lHCz99peWbqqXR5PZiBbJjox8K5Vk
         IfT01kWattqQ3liby5j9eWDIksIU7+/peumdD/lZWHljFsKn4aVw27KGjy4jMSHD3zUY
         oqgQ==
X-Gm-Message-State: AOJu0YyudUpIYvuW+1WShNdaCDRzXCf6UNOxHW4JbVX8WeOCDiQC/yHZ
	POENS3NWapbetVI4ZaH0hx0IZg==
X-Google-Smtp-Source: AGHT+IG0IVo5gbTJiAwdNes86R04nbY78iq46TZ/OBOFdNhXqvu3+DDy8kv81uFwc6TOrj3smBh/nA==
X-Received: by 2002:a17:902:d303:b0:1cc:2f70:4865 with SMTP id b3-20020a170902d30300b001cc2f704865mr3218515plc.26.1700840630674;
        Fri, 24 Nov 2023 07:43:50 -0800 (PST)
Received: from rogue-one.tail33bf8.ts.net ([201.17.86.134])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b001cf9eac2d3asm1919743pll.118.2023.11.24.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 07:43:50 -0800 (PST)
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
Subject: [PATCH net-next 2/5] selftests: tc-testing: remove unnecessary time.sleep
Date: Fri, 24 Nov 2023 12:42:45 -0300
Message-Id: <20231124154248.315470-3-pctammela@mojatatu.com>
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

This operation is redundant and it's not stabilizing nor waiting
for anything.

Signed-off-by: Pedro Tammela <pctammela@mojatatu.com>
---
 tools/testing/selftests/tc-testing/tdc.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/tdc.py b/tools/testing/selftests/tc-testing/tdc.py
index 669ec89ebfe1..c5ec861687b6 100755
--- a/tools/testing/selftests/tc-testing/tdc.py
+++ b/tools/testing/selftests/tc-testing/tdc.py
@@ -497,11 +497,6 @@ def prepare_run(pm, args, testlist):
         pm.call_post_suite(1)
         return emergency_exit_message
 
-    if args.verbose:
-        print('give test rig 2 seconds to stabilize')
-
-    time.sleep(2)
-
 def purge_run(pm, index):
     pm.call_post_suite(index)
 
-- 
2.40.1

