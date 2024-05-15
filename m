Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA76F79C2
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 01:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715735308; cv=none; b=WbFh1Y1fDy9ogMLYB2R4ZGPSDzlhowG2kcZKGTdcrxtL0D9eTSDXPBijoDyEVk3pn2fUmq7zud8I1xuEk+jGTIMn8b+Cm6qna4iNv8DXGHjgeTV1oRrJu6eLfUEwt5nVX+F6cizLoiubWqkkDHXwiUqQX/m2G0BnOBdKWlxRKms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715735308; c=relaxed/simple;
	bh=t2dCvEvmxqBF0ZoMYUDGqTs5EjeSqTmU/jcy4IIDLtA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hS4ionRcvgMhp3aqbR2nuAoGuODUxqMTOmcJ3ZbNDTJj87LMFrRTrBQcmTlmlET/yPwtagLEkXrIFxF+adaeZvjej7haixGOilzpGerfbjBsDiXBT4retxZnYjE/YfQ9XNYOU6y5uX2XYi74S/27KxCiHrk3WXK19+oaj1kAa+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2ZTR1yl; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2ZTR1yl"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-620e30d8f37so5248913a12.2
        for <llvm@lists.linux.dev>; Tue, 14 May 2024 18:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715735306; x=1716340106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXX3A8fyv3exTOOEj1HA+TNTB0ha+l87+h6npCAFwJc=;
        b=S2ZTR1ylEQ0RYL+6ZZQ4W1WNXL5gZyY3l3AnRYf+3YG/ugxjrTSvIXyMhVzHyRzSqm
         4DZXmRDccDaBTM7lLcp3k76ZwAi33xAPAzCVuxSO2y6+aEmSqaRjgJ02z1gbtLeuA0im
         LZeLhgXOTn4wOstiuYEgC+OxEIUFvYxsIpNEvBqkY47evxUVDy9U3AWI8cgwjSqNeVau
         gl0YQLV1hFYSvmXw6H2GiX/IEOKab00ibihGegDpE2Z5v9B4cLqrJhPYu+e3pxl/yIYM
         P7IjYY70BiXtI4lGx8+P+xj0ZipKo/BYmepKtURgPqc5w/5oVpVUK+raWTUVFGoGAHVQ
         mp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715735306; x=1716340106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXX3A8fyv3exTOOEj1HA+TNTB0ha+l87+h6npCAFwJc=;
        b=P0BSuEPTnBdpJqik3Xz+KoY1WBKU1O37y7rlY8l64QClpey2rE+CRcLpfSV8eT+05s
         uxTTO327Jxx/TjrXXPP0TXj3wjXWDzwJVDIgGwH+d7CekNM8Zcr0Ufo95D1S9KdyVyq6
         TcNChw3qLySt/bVX8Ax30EomOTF2wh7KrI9n64DKc03BLpRAs6w2uw2j2shJpfLxGnTr
         bROTLtvCBOQDBE5hvQuqkVAirn091uQWGaCeYKIRxlMf0sMiBa+Bve7Qqw1di3Co81R4
         WAbDqhLdyunxlyVQxZ456SAebUABcnW8dNuFjQ6NhHFPLqVkpHZCPimUiuW4J5f4K05e
         bnqA==
X-Forwarded-Encrypted: i=1; AJvYcCVpM/1Y46Onh9bbgfJYoFepLfa8kqiqbvAmwYqKmMiSKKOdnSejEpSUEpu3Xi4T3MubAX8okfcbxAwjuG9seX5uYiwtCg==
X-Gm-Message-State: AOJu0YxConmodkOn8qbFgzJzGlr2NMRCfbp/UnF/l7LgaFGRohboPWTW
	AdfSN3zfW7Z1bAfZCcdWg7jHCf62jwga7ycb5JpFf+SNk1G0LlFb
X-Google-Smtp-Source: AGHT+IGFGFFgGkdH0CfKcsVIy30aMwXWQ4riCJ1NMUSAw2aaesIFFlQ9ymwftNpa5+tkUkCey8lYcQ==
X-Received: by 2002:a17:902:f681:b0:1e3:e093:b5f0 with SMTP id d9443c01a7336-1ef43d0adadmr197215775ad.8.1715735305981;
        Tue, 14 May 2024 18:08:25 -0700 (PDT)
Received: from server.ucalgary.ca (S0106f85e42401d5e.cg.shawcable.net. [174.0.240.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d16cfsm104973325ad.18.2024.05.14.18.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 18:08:25 -0700 (PDT)
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
Subject: [RFC PATCH 3/4] selftests/binderfs: Macro argument 'fd' may be better as '(fd)' to avoid precedence issues
Date: Wed, 15 May 2024 01:08:04 +0000
Message-Id: <20240515010805.605511-4-xandfury@gmail.com>
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

Change the macro argument 'fd' to '(fd)' to avoid potential precedence
issues. Without parentheses, the macro expansion could lead to
unexpected behavior when used with an expression having different
precedence levels.

Example Code:

    #define CALC_SQR_BAD(x) (x*x)
    #define CALC_SQR_GOOD(x) ((x)*(x))

CALC_SQR_BAD(2+3) expands to 2+(3*3)+2, giving 11 as the incorrect
answer. Enclosing with parathesis CALC_SQR_GOOD(2+3) sets the correct
order of precedence and expands to (2+3)*(2+3), giving 25 as the
correct answer.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 .../testing/selftests/filesystems/binderfs/binderfs_test.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
index 4a149e3d4ba4..d5dba6c1e07f 100644
--- a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
+++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
@@ -30,11 +30,11 @@

 #define close_prot_errno_disarm(fd)      \
 	do {				 \
-		if (fd >= 0) {		 \
+		if ((fd) >= 0) {	 \
 			int _e_ = errno; \
-			close(fd);	 \
+			close((fd));	 \
 			errno = _e_;	 \
-			fd = -EBADF;	 \
+			(fd) = -EBADF;	 \
 		}			 \
 	} while (false)

--
2.34.1

