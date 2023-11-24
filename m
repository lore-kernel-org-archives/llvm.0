Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C3A33095
	for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="bO5lK5IV"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cfa5840db3so4676355ad.2
        for <llvm@lists.linux.dev>; Fri, 24 Nov 2023 07:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1700840640; x=1701445440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meBAQ3i5bzteTDjsadEVqP3IdyNZUBxruoeAMf+7W4k=;
        b=bO5lK5IVRf7j302MqLyk+DJVgYPL4ifuysxyEs/QtdpsphHvmPLnkdE2QE1S3rttuS
         PfvF+vgqdT2R0AJDknFWlsS2SY8fSwY0h792M0Fc2ljzasr+fp57VxgUVxwe9KMATkj2
         BEwv4dH3mrBY1uVAwxGtxSVPiSPCkPHaUa8DkTzCBS1PF64ef13RlpTZtepvf7CTFOX2
         TgcBgtzJU8LHFIfB/QleaNOL7VMI0QXD9e/aoCdLZqIPDenauyvQNJWqbYBQxtIvKR7W
         TjZB0SMg4IBVyZvgM0/FYQ5229pZ8BNLfp+ZS7MaO8/If4sFo8DPzrCqoEIkZMk04JtJ
         mKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700840640; x=1701445440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meBAQ3i5bzteTDjsadEVqP3IdyNZUBxruoeAMf+7W4k=;
        b=PhH6jm2jAl2Kvy6uRNoYIp3Paz976nAWcqozPXTKmH8+tefa5lx3gVg1tmS0FP/+Eo
         I7TbmpKzrGa/ekfWeqxzE2trwqToFRosxrXS8iwoXpk6PtzSl3YzuFXjFAwk09OV2WEA
         qKeZ/5enzIe80e0cPYpEs+7YbwXBjbyhxQq2dy46obNe9cH4SQGr+W/nyGweHXxRjbfv
         ras39ZOEeV5yTmM1qT0/RlMMpzynIwbrFsyBMolvymTIySNo2v7Jw6Qc3FxCWu/fMtP3
         KXSAubwTiU2uYeD84cFogcI2/yPj77x7TQZk9qRRPJxVWXLQQlayW7q4B5ZIinIoDjF8
         x7zQ==
X-Gm-Message-State: AOJu0YyYG2FlY/HspkYDf2Z6O8RyDMmzRjJKp6qPwY+1AbwQFQV/ZHPq
	rW2JOelvu1TRD1cDI/gMWvBESg==
X-Google-Smtp-Source: AGHT+IEI/gV9/wjUMlivgVIkBGWHfGfGb1pfZNnDlb9nUwelvrY0VHUqAQAEdEhIc9BPVn6KNayM2w==
X-Received: by 2002:a17:902:e752:b0:1cf:6aae:5998 with SMTP id p18-20020a170902e75200b001cf6aae5998mr4296165plf.0.1700840638351;
        Fri, 24 Nov 2023 07:43:58 -0800 (PST)
Received: from rogue-one.tail33bf8.ts.net ([201.17.86.134])
        by smtp.gmail.com with ESMTPSA id g6-20020a170902740600b001cf9eac2d3asm1919743pll.118.2023.11.24.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 07:43:57 -0800 (PST)
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
Subject: [PATCH net-next 4/5] selftests: tc-testing: cleanup on Ctrl-C
Date: Fri, 24 Nov 2023 12:42:47 -0300
Message-Id: <20231124154248.315470-5-pctammela@mojatatu.com>
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

Cleanup net namespaces and other resources if we get a SIGINT (Ctrl-C).
As user visible resources are allocated on a per test basis, it's only
required to catch this condition when (possibly) running tests.

So far calling post_suite is enough to free up anything that might
linger.

A missing keyword replacement for nsPlugin is also included.

Signed-off-by: Pedro Tammela <pctammela@mojatatu.com>
---
 tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py | 2 +-
 tools/testing/selftests/tc-testing/tdc.py                 | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py b/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
index dc7a0597cf44..77b1106b8388 100644
--- a/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
+++ b/tools/testing/selftests/tc-testing/plugin-lib/nsPlugin.py
@@ -78,7 +78,7 @@ class SubPlugin(TdcPlugin):
             print('{}.post_suite'.format(self.sub_class))
 
         # Make sure we don't leak resources
-        cmd = "$IP -a netns del"
+        cmd = self._replace_keywords("$IP -a netns del")
 
         if self.args.verbose > 3:
             print('_exec_cmd:  command "{}"'.format(cmd))
diff --git a/tools/testing/selftests/tc-testing/tdc.py b/tools/testing/selftests/tc-testing/tdc.py
index c5ec861687b6..caeacc691587 100755
--- a/tools/testing/selftests/tc-testing/tdc.py
+++ b/tools/testing/selftests/tc-testing/tdc.py
@@ -1018,7 +1018,11 @@ def main():
     if args.verbose > 2:
         print('args is {}'.format(args))
 
-    set_operation_mode(pm, parser, args, remaining)
+    try:
+        set_operation_mode(pm, parser, args, remaining)
+    except KeyboardInterrupt:
+        # Cleanup on Ctrl-C
+        pm.call_post_suite(None)
 
 if __name__ == "__main__":
     main()
-- 
2.40.1

