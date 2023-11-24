Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225B131758
	for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="1S+8eFGM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cfa8f7c356so3377495ad.2
        for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 07:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1700840634; x=1701445434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI5gs5undxsY3d7gpx1BT78LGzAvxgEfNmwdo9O1W20=;
        b=1S+8eFGMafDYTBkRAVahiwq/7Y8OHtGENSzZ02eyw7T+8Z65MQHDee8whukPgQTrL5
         m9LidxyOjThfHn2LhllHbLuuOU7sSh0rlv++iotNjglBzsRY72oYOXlb2BkdP0RoDnf0
         8hSO2uVsbV8vNppTzc+6IbQVr5lYeYQOVLJ33Eg9bMKHFB7ZUJwJVQ6BKun+w+26Qxyi
         v4jfRbbU/bypnZX3pjOtNJ7rA3pf8YekSGabzd/HDrrBudjTZKINoa79qtah9oqKU7AK
         4puKBPmJI4L7uT62QlW++LAyXJlPRCVnLzLohP4rqY0JK6QooA5yr6kaTd+jBQ4TXYm9
         0OJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700840634; x=1701445434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QI5gs5undxsY3d7gpx1BT78LGzAvxgEfNmwdo9O1W20=;
        b=iPjSD/n5GGWJIHNVyuOQWnVzOVN3TtfVVtIoXcIua/XyJcXO390hyJUdxKFvIOsk3h
         bhFEskf2atb4+gcLV0CL5QS0xnNAy/1OP8niRtg6QBo98yaiDsAP32eG/mVIir52KzQQ
         Mi3MCQkQCf8BKDomm1LavI5ZncrDmfSPypsm0EM4MmdgdAPgAt6Sy9g5G4gReeGCGAcw
         VHrfFOq4bkfSBShV9F8RzJ4x9bGMdiTrFbXr29r4Ac+rZek5KW7Dh0Un8GPK+tb+DAyR
         n86Zqm0xyLwkbnW2rTItoUvNauCPSF3m7Rijl3FN5D9TZaBXOOIOCDDpwGiS5tiWo6/C
         wTGw==
X-Gm-Message-State: AOJu0YyfEJ6qE4ygX/5hD6wzHe02NmVWTU21qo1a0qEMSCdZbRCW3cYx
	nelEJ4QOasyU9TTh6nxqfqhuqA==
X-Google-Smtp-Source: AGHT+IHjL5+9IkJrkQHCVZiSdxWSDRWph5fyPR/F+l48erJe0XmC6bse9B75u6rGy8t52KT2Qxy76g==
X-Received: by 2002:a17:903:264f:b0:1cf:6584:4860 with SMTP id je15-20020a170903264f00b001cf65844860mr2968301plb.10.1700840634435;
        Fri, 24 Nov 2023 07:43:54 -0800 (PST)
Received: from rogue-one.tail33bf8.ts.net ([201.17.86.134])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b001cf9eac2d3asm1919743pll.118.2023.11.24.07.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 07:43:54 -0800 (PST)
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
	Pedro Tammela <pctammela@mojatatu.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next 3/5] selftests: tc-testing: prefix iproute2 functions with "ipr2"
Date: Fri, 24 Nov 2023 12:42:46 -0300
Message-Id: <20231124154248.315470-4-pctammela@mojatatu.com>
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

As suggested by Simon, prefix the functions that operate on iproute2
commands in contrast with the "nl" netlink prefix.

Cc: Simon Horman <horms@kernel.org>
Signed-off-by: Pedro Tammela <pctammela@mojatatu.com>
---
 .../selftests/tc-testing/plugin-lib/nsPlugin.py  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py b/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
index 65c8f3f983b9..dc7a0597cf44 100644
--- a/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
+++ b/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
@@ -37,7 +37,7 @@ class SubPlugin(TdcPlugin):
         if netlink == True:
             self._nl_ns_create()
         else:
-            self._ns_create()
+            self._ipr2_ns_create()
 
         # Make sure the netns is visible in the fs
         ticks = 20
@@ -71,7 +71,7 @@ class SubPlugin(TdcPlugin):
         if netlink == True:
             self._nl_ns_destroy()
         else:
-            self._ns_destroy()
+            self._ipr2_ns_destroy()
 
     def post_suite(self, index):
         if self.args.verbose:
@@ -161,7 +161,7 @@ class SubPlugin(TdcPlugin):
                     ticks -= 1
                     continue
 
-    def _ns_create_cmds(self):
+    def _ipr2_ns_create_cmds(self):
         cmds = []
 
         ns = self.args.NAMES['NS']
@@ -181,26 +181,26 @@ class SubPlugin(TdcPlugin):
 
         return cmds
 
-    def _ns_create(self):
+    def _ipr2_ns_create(self):
         '''
         Create the network namespace in which the tests will be run and set up
         the required network devices for it.
         '''
-        self._exec_cmd_batched('pre', self._ns_create_cmds())
+        self._exec_cmd_batched('pre', self._ipr2_ns_create_cmds())
 
     def _nl_ns_destroy(self):
         ns = self.args.NAMES['NS']
         netns.remove(ns)
 
-    def _ns_destroy_cmd(self):
+    def _ipr2_ns_destroy_cmd(self):
         return self._replace_keywords('netns delete {}'.format(self.args.NAMES['NS']))
 
-    def _ns_destroy(self):
+    def _ipr2_ns_destroy(self):
         '''
         Destroy the network namespace for testing (and any associated network
         devices as well)
         '''
-        self._exec_cmd('post', self._ns_destroy_cmd())
+        self._exec_cmd('post', self._ipr2_ns_destroy_cmd())
 
     @cached_property
     def _proc(self):
-- 
2.40.1

