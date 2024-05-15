Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59845CAC
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 01:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715735302; cv=none; b=nXhsDitatiy5so9yjsgDBDlyXQegz6R8QpNSUndOQIRm2ZFqD2dZ2HBoFfQQdTeDJIk/p0wTuNppJPhALNyINmty4YVDp7Vqp0y1Tpk1ApNYw7Y8R+tR9SbK6BQBDbD5MGZIXsfwsnhy68P1fYDmdgv4zbT8bVmpvU8mccC92wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715735302; c=relaxed/simple;
	bh=D69ZLC8/gjwZxvU+Y4nvOh9+wCwb1dUPhipLaDHJTd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P3J8TFH9WkiNIlzNtMgpcii4KyNa320nf2J0eLQDKDHmqeGQY/r45pxNsrSvLepmZuDyH43ZEzzFlJormBM5YT+UMnZgmaPp6MF3qXK8nm/mdKUYg3VCJokR2yZNMdTx+5SRbxeJtgwz7qcf65LtFcE/KJWbjVFhsL00RE4xAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lm0kAwuN; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lm0kAwuN"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-61aef9901deso4534732a12.1
        for <llvm@lists.linux.dev>; Tue, 14 May 2024 18:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715735300; x=1716340100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oEOuUmrraVajZP9NumOJGczPjev4TG6biSN92z3lk0k=;
        b=Lm0kAwuNcz969Z3lf+aZqlugkni3Y1ZIFf9Ou1pE0gu7FqVw5X76KHt/WSBT/z1qDE
         UzxTquEA8smiye4wRJXJxHMQGXiL+1Q5mPtgXZlF0H5SfqxyQnm7p+TEfb9vYMgNp5Vu
         13f9mmlEqo6KS0eJTFgGRcNXqp0GVuovMxrnT8IIgUC5/yxpS087XfdnAqsuoljsi3ar
         7BFPATFGHmXbPKf9eOwykltHVj3f9wOUt2XZKVsPdSdUSSvX0TrQnJXvEtEZRwRZyW8i
         W//P+4IUNTzO9yXAIUEmHkqcsZ+vHMRxntreFiR6UV3OXPC+DjDHKemG4iTdhGSS+Bdq
         Zt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715735300; x=1716340100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEOuUmrraVajZP9NumOJGczPjev4TG6biSN92z3lk0k=;
        b=Ns3YRdca8osDvaoTonxs4xIPd0j1zVzCoXf9oQteXp1MlSKuGWkabm8zBldhTdA7GO
         y/VCx0hj7cW0JAOtJbc+ZmI6+0nCOrKAgMSPTBQ/CnAQ+8Rak9P7MHxj+401yiq8ICji
         zGef0CcbVXYAXAsqWiaKpopyQZ4EbeFimQzgvl+UkgfLRv37Hwlkz9qBE7R91nv3qCfa
         oilBG5ufBf/ri3aswR5Oot9KpFiLZS26+FlHc0gS54SHcxcchRh6Kdo/8DkM1eqn/4sw
         dpHqcN+swSQ48OJe3hVXzeI424vATNcTmNPxtWvt9eYEYlX9KUAfG7c6mwEiwlh75WZR
         1C5w==
X-Forwarded-Encrypted: i=1; AJvYcCWFduUTgDPV1J6ifiIa9fPXP2wXlGdKVPX48gLCy9dfVz46O80KuYd2epQz4iFPaT8SKDkgjrOPdDgywMD8XqnF3BdiRg==
X-Gm-Message-State: AOJu0Yw7uxl1psGAPLm73Al3ezjJFeMY5s7NE8DKEjm5kaTAEymy+VTf
	nwDivXReMhfyTDqiC8C6XdLx/DKSoR6N+NxQuMCDez7iUdITIkO2
X-Google-Smtp-Source: AGHT+IEf/8xYnuiJOOGb2Sge2zyvi8v+F5kXfA+0Ec6yoRGy+k/BnTYqMYRzAU13OsIYlFSS1N9lgA==
X-Received: by 2002:a05:6a20:43a7:b0:1af:fa18:76f7 with SMTP id adf61e73a8af0-1affa18795amr7375050637.39.1715735299986;
        Tue, 14 May 2024 18:08:19 -0700 (PDT)
Received: from server.ucalgary.ca (S0106f85e42401d5e.cg.shawcable.net. [174.0.240.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d16cfsm104973325ad.18.2024.05.14.18.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 18:08:19 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [RFC PATCH 0/4] selftests/binderfs: Fixes to binderfs_test
Date: Wed, 15 May 2024 01:08:01 +0000
Message-Id: <20240515010805.605511-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

My name is Abhinav Saxena. I am a graduate student at the University
of Calgary. This is my first patch series for the Linux kernel. I am
applying for the "Linux kernel Bug Fixing Summer Unpaid
2024". Apologies in advance if I made any trivial mistakes :)

This patch mainly includes issues reported by checkpatch.pl.  The
changes include:
- Running clang-format on `binderfs_test.c` to fix formatting issues.
- Updates the macro close_prot_errno_disarm macro.

Testing: I tested patches on my local machine (ARM64 ubuntu) with
checkpatch.pl and running the selftests.

Best,
Abhinav

Abhinav Saxena (4):
  run clang-format on bindergfs test
  update close_prot_errno_disarm macro to do{...}while(false) structure
    for safety
  Macro argument 'fd' may be better as '(fd)' to avoid precedence issues
  add missing a blank line after declarations; fix alignment formatting

 .../filesystems/binderfs/binderfs_test.c      | 204 +++++++++++-------
 1 file changed, 126 insertions(+), 78 deletions(-)

--
2.34.1

