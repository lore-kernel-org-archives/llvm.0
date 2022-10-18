Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B247B
	for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 08:32:57 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id g28so13419101pfk.8
        for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMgE1fyjrJY9vSnvRMz8bHn2yTvJe/km5liUet6OTaw=;
        b=YgTkaHRPQjsBsJNUHrik4HbQBzYewWyJ7ySyGTgdQ8p8w6U6zCfhpcFzjvfV59U62P
         3Da9gAOT1L3WBT5PcqX0ssxUuWmOH60c71ylOkujiiZ20i/VeNuvModSnHqPKb6nc5ZZ
         v/0FB6LL552bfW/aftPKoFJRAHyWo6Sg34ht0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMgE1fyjrJY9vSnvRMz8bHn2yTvJe/km5liUet6OTaw=;
        b=qSbSc9FveeKpNFWmGUDZ8sqXzX0jYEG8vNeiQFqWOY92hlmwkIKBUVUL6ckoqKanX6
         5vofr/ist/dhZGESgsdyUafLHGqkJcyfk7rzjZCpHF+1qJP4+p+NxMXXDLT20FJ4qlc4
         9rzR49lJoFWL/cM8dlsPPRWpmTX3poFCOHd1SPxPxEWbjGMvzL8tGCktY1Ipmopq2zs6
         ua+P4WeMMubQtq29Zi38fJhLautZEEJMAsEOYBGFsHllcNDSKb3HP/3rHfyg1xeANba5
         KF7c5D6kQfXlOAeumKs9GQQGXusnwL8Lwg6SMG1N8acg6k4Porih9jPfl18l5MAAhKCp
         sCIQ==
X-Gm-Message-State: ACrzQf1c9OgS871+DRoQS+CbMOk6wYkrKbfcpVuFo4eO2SelqoRUv9IW
	R0gc8jrfBp4H2zElSmBihh7nzg==
X-Google-Smtp-Source: AMsMyM5vFszCXPViIzTCoQXJeqBBtRWDaVBsj5nCFCpJrmEX5X5wQFGFwCc7yT0rI3q+/X3a4I9Bbw==
X-Received: by 2002:a05:6a00:238d:b0:563:b212:9257 with SMTP id f13-20020a056a00238d00b00563b2129257mr2052202pfc.21.1666081976812;
        Tue, 18 Oct 2022 01:32:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090a1c1000b0020a81cf4a9asm11077191pjs.14.2022.10.18.01.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 01:32:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fortify: Short-circuit known-safe calls to strscpy()
Date: Tue, 18 Oct 2022 01:32:51 -0700
Message-Id: <20221018083051.never.939-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2706; h=from:subject:message-id; bh=TuV6DsCHn4YM1pzSIZxk5kOcXo+TKcB3VVIFFMdDAmw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjTmSy9TMK14Z6uFIMcZ/T8ujj2hXR4Xr/JigD6sMv 42vJH2iJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCY05ksgAKCRCJcvTf3G3AJsPHD/ 9PrjfaHojf06MfJOXnvTmaDU+LsTURln+B94F70PVDLDd2Dav7dKtEGqNxJuG3bEbC6c5oEREbdQXK RrYPH2Wx5O8CtmmUwkaSiYIjjZc5y7Y3CfO2dbjGBNiFYD2jWESj5dkgWJLbibCkVHtiSGIoBO63oE fICz4Gy2XDEfxp+a2fPArCNgKzXW7QU7OBNE/2VdFn6mbVrCJhSZdhOKlS6HOh+IE+ma4n6dYL0IB7 e/MHsdfllNhhxqZa36zBSWiq6fz4DJjUJ4V7z/WQ4Agsj2mjiGVDSTM8MD8SII9Jz4Uh9TJmvnZExd SjY8asnB9rEAS3FXN+DQbm87gFf2jtHZOwOWs6klYMkR6cBtBsJ+OUM+FTzqOtfmlv0IQd47QraSFx Vr8GiqaOY+Pn9G/Rjpb+rjIFeJ4YMiY/lEia9QPmxU36+ML52uBrhAlNe/QsAVCXdBzZ500FRIIu/d uXFSZfQfoYkf8+mTlUo30HujO84nZ/0JVpYarc/JbJLynPuBQPsG0PGCoGJyA2/M3ZBiL8DF20TdXg x5JsNVPwhpcJOklcCegGs7A+kGhW6kvKCxOpEa99xZYzhSy3ozTqvxOY023eMoIcEhAwCeDxVVojFf NnVntHm6jMPdmeR5EH0vHa0d1lMBerG4BgLsbTXcTGmmSVYjBZWvusnKSSKQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Replacing compile-time safe calls of strcpy()-related functions with
strscpy() was always calling the full strscpy() logic when a builtin
would be better. For example:

	char buf[16];
	strcpy(buf, "yes");

would reduce to __builtin_memcpy(buf, "yes", 4), but not if it was:

	strscpy(buf, yes, sizeof(buf));

Fix this by checking if all sizes are known at compile-time.

Cc: linux-hardening@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/fortify-string.h | 10 ++++++++++
 lib/strscpy_kunit.c            | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index aa1a50009632..c473adb55cf5 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -321,6 +321,16 @@ __FORTIFY_INLINE ssize_t strscpy(char * const POS p, const char * const POS q, s
 	if (__compiletime_lessthan(p_size, size))
 		__write_overflow();
 
+	/* Short-circuit for compile-time known-safe lengths. */
+	if (__compiletime_lessthan(p_size, SIZE_MAX)) {
+		len = __compiletime_strlen(q);
+
+		if (len < SIZE_MAX && __compiletime_lessthan(len, size)) {
+			__underlying_memcpy(p, q, len + 1);
+			return len;
+		}
+	}
+
 	/*
 	 * This call protects from read overflow, because len will default to q
 	 * length if it smaller than size.
diff --git a/lib/strscpy_kunit.c b/lib/strscpy_kunit.c
index 98523f828d3a..a6b6344354ed 100644
--- a/lib/strscpy_kunit.c
+++ b/lib/strscpy_kunit.c
@@ -81,6 +81,8 @@ static void tc(struct kunit *test, char *src, int count, int expected,
 
 static void strscpy_test(struct kunit *test)
 {
+	char dest[8];
+
 	/*
 	 * tc() uses a destination buffer of size 6 and needs at
 	 * least 2 characters spare (one for null and one to check for
@@ -111,6 +113,17 @@ static void strscpy_test(struct kunit *test)
 	tc(test, "ab",   4, 2,	    2, 1, 1);
 	tc(test, "a",    4, 1,	    1, 1, 2);
 	tc(test, "",     4, 0,	    0, 1, 3);
+
+	/* Compile-time-known source strings. */
+	KUNIT_EXPECT_EQ(test, strscpy(dest, "", ARRAY_SIZE(dest)), 0);
+	KUNIT_EXPECT_EQ(test, strscpy(dest, "", 3), 0);
+	KUNIT_EXPECT_EQ(test, strscpy(dest, "", 1), 0);
+	KUNIT_EXPECT_EQ(test, strscpy(dest, "", 0), -E2BIG);
+	KUNIT_EXPECT_EQ(test, strscpy(dest, "Fixed", ARRAY_SIZE(dest)), 5);
+	KUNIT_EXPECT_EQ(test, strscpy(dest, "Fixed", 3), -E2BIG);
+	KUNIT_EXPECT_EQ(test, strscpy(dest, "Fixed", 1), -E2BIG);
+	KUNIT_EXPECT_EQ(test, strscpy(dest, "Fixed", 0), -E2BIG);
+	KUNIT_EXPECT_EQ(test, strscpy(dest, "This is too long", ARRAY_SIZE(dest)), -E2BIG);
 }
 
 static struct kunit_case strscpy_test_cases[] = {
-- 
2.34.1

