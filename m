Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DACBA34
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 01:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715735309; cv=none; b=a0ttZt2XbtpU4EaYyTczaGNMiUNfFBWTxCGKhVGHHjDKnNfh6XduoJH95bEN5mkmAXIa+LiBFa+1YcnOFwNZ875PuO3QBfGhww7NExCHLsOtPrSgM24mVs2YMac4VknfK3+hp1OzFJ0vS6oNw8X4H5hC3t1Bdh9hrtaMQJWptpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715735309; c=relaxed/simple;
	bh=O4pErUei5BcDdY6rSN5JCE4HW0/7Ee1oOOLQEFOtl8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=frxoAhL56MFbLmnW1Yciq9cQszAtLCVwFVjzLZFQOrrHRVbuZNt/rw0VGJM0gooV7hOQEEZIEghsOdKdsgtGw2LPzHBZnZXFidEpcR2v4KLq2l5iaF3mG8ho91c9GQVDp8FYsluCE7AtMwuzJO6Y3ThKwjn7Wi7Jqoq38WPah2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+WGjqme; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+WGjqme"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f447260f9dso5004891b3a.0
        for <llvm@lists.linux.dev>; Tue, 14 May 2024 18:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715735307; x=1716340107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+ayVbf+QMN56CDy4orfOWD3cBOJ6aQix+a9D8vn66o=;
        b=X+WGjqmee7ztprpS4KYWH7GLYjClNPT1yX9uh2o58yQQLaiaibgf4naAeNFHl5LZB9
         EnBaapmYKZItODpH65vCdEF6MOc0N32e+sISXZTZStEZJxYNFwo3etLrmoyGIgrUM7qD
         adN6hGNVanNkkm+cjbVpr9ujfIt8J/KEfDD26K2I6GshvLjQ/kH4Qye6sP6LzVrM6fJa
         /5puILAwtEhWtYCModjTK9WiSDG4vSusezvUszfHFlWTvK3PAgonD1MAvo5CCoHojoub
         Z0fu4VzHJxa4l7+8VqvNOfZ0ZBxYDISGc0KaRFIuKNMzxkT1OvNwgnngIOejCq7ext2x
         nfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715735307; x=1716340107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+ayVbf+QMN56CDy4orfOWD3cBOJ6aQix+a9D8vn66o=;
        b=Z9IN4yGhB86h2LKj+pLOKjpEt7adcNY0STMtWwJzZ44MOqEq0i0fIvfVmtORSXU/OT
         CXTCwM11pqjwqde5j3ZT7homK4zkMupWE348HWn0ueBItzx3sxmqIfNmXXJAO2mR9u1g
         1FGoiqlS6VWLKrRnUovE7UKozXkqyl25jA6CZPow5O579MeSk4cwJHpArS42Yk2/5kqv
         sHP62D6eklcJG0XS4PzgFiwsMXbXOK9fbAwRrSywUBBwuCr/mygwmV+ChwLie0R8H96Q
         YM6Blrmsm43W7XwT8zy2EXUQvhQ+wf0Lt51V3/Q+msW9YCb+cxoPdfK4PXrbDEv82hDe
         BMWg==
X-Forwarded-Encrypted: i=1; AJvYcCUxvU6/f8dEOMr+7LHfCAwLzl3AEckTCzP6SJUccIFmNNjRF5NhyMiZ5Z9yrh1PxUvSjQaghTBMKEl/pQkhFUGwGwyoVA==
X-Gm-Message-State: AOJu0YywmRRhbuTh2/Ms72T5pWcOio+47lMocAhmABHuGYCxazIo4TLa
	NnIgJJvWV52O1Qdix14RHVzmYYJnwaRStbFFLVJ7wUyNl8bGM7BZ
X-Google-Smtp-Source: AGHT+IH1JPc60P9dzDmwpW3nnKjvovvZmskyzzCFDMuzEZRQdR4tEyhx2/zrtE8LudcXR3vUP4MJGQ==
X-Received: by 2002:a05:6a20:c909:b0:1ad:999b:de47 with SMTP id adf61e73a8af0-1afde1d7b38mr15188336637.51.1715735307307;
        Tue, 14 May 2024 18:08:27 -0700 (PDT)
Received: from server.ucalgary.ca (S0106f85e42401d5e.cg.shawcable.net. [174.0.240.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d16cfsm104973325ad.18.2024.05.14.18.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 18:08:26 -0700 (PDT)
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
Subject: [RFC PATCH 4/4] selftests/binderfs: Add missing a blank line after declarations
Date: Wed, 15 May 2024 01:08:05 +0000
Message-Id: <20240515010805.605511-5-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515010805.605511-1-xandfury@gmail.com>
References: <20240515010805.605511-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a blank line after declarations and fixes some more formatting
issues.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 .../testing/selftests/filesystems/binderfs/binderfs_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
index d5dba6c1e07f..d8a22b62dd89 100644
--- a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
+++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
@@ -433,6 +433,7 @@ TEST(binderfs_stress)
 		int i, j, k, nthreads;
 		pthread_attr_t attr;
 		pthread_t threads[DEFAULT_THREADS];
+
 		change_userns(_metadata, syncfds);
 		change_mountns(_metadata);

@@ -536,11 +537,11 @@ TEST(binderfs_test_privileged)
 {
 	if (geteuid() != 0)
 		SKIP(return,
-			   "Tests are not run as root. Skipping privileged tests");
+		     "Tests are not run as root. Skipping privileged tests");

 	if (__do_binderfs_test(_metadata))
 		SKIP(return,
-			   "The Android binderfs filesystem is not available");
+		     "The Android binderfs filesystem is not available");
 }

 TEST(binderfs_test_unprivileged)
@@ -576,7 +577,7 @@ TEST(binderfs_test_unprivileged)
 	if (ret) {
 		if (ret == 2)
 			SKIP(return,
-				   "The Android binderfs filesystem is not available");
+			     "The Android binderfs filesystem is not available");
 		ASSERT_EQ(ret, 0)
 		{
 			TH_LOG("wait_for_pid() failed");
--
2.34.1

