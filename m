Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162AA78664
	for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 22:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706652380; cv=none; b=awhzrWfRyOhzHlDQwZxi4MLGEoRq8eUIFtM6KPouChvAtxpB+NBk5WGvkbcy+D0xQICBx0RcYijslYohqVz2dRv+iefZtlK7WDO1KjObWjDsdV+P4n27AJfJ5EGzCFqdv28M7RM4htTq8z2kzsJRoWkaDuPSb8e7q9UPMAYO1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706652380; c=relaxed/simple;
	bh=mjbhQQsJHZNHQElAJyka1am+OsaRRifuj4xn9QRfLGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l8NEfrPsLCYQ03ewSKnsw0SBjao/+ylHCXhcrw93ahnBCA6hDitEWPwI7FVkagnW5FJW9hlWyFjiNnb3MZgFDGz+FxsO0PPDvZXARN740AhDL4dExYWdBmIdJVbijb9K/+U9SPWiQyEVNDhCsYxLymw0kgDm5eACOD5dmFT20/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l/WhxOKO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l/WhxOKO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6da9c834646so3366044b3a.3
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 14:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706652378; x=1707257178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXEWZ+ijn2Mktyo3GgFFo1opylml2uwjVnLpw+L5S/k=;
        b=l/WhxOKObAfiU4xzrbNfkFP6dnoqy6ykDWqg2U7+w+lHN8BAJ9w4wkiVkPgzCqcRfJ
         Bv/wIfLHKFcroZr6rnoDooQdko0xmhGBRjAiOkZrktsAaZaEGYwGYB70Rn0PvTzbRLtv
         vEAI+75Z2RSTbvnwJpMvoY5UhevtoRv3muukI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706652378; x=1707257178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXEWZ+ijn2Mktyo3GgFFo1opylml2uwjVnLpw+L5S/k=;
        b=cNITmTdOFIp+GqsIyNP3JnJvPsaHXEh/N5XjauON7cMuNmwKwLm+6zBF8zP2OEtghb
         RoR1wVrLcX2csrKZWmm3mwCmRpQgc2dh/3i/KDcCzUlZWWETZppRWd+GGiiMfs5aDU8m
         70qR5XB4Ir8EK4qorZLfWKNTFBpmNl7DrfZsWZHzit+C7BokphBnwHYOde0l64SFnLII
         tUHrCrQMDEsz1XDU8XeFg5IP7wlPYrOoGMhIs+l0hbtCJojuceDGvZP17ja7JAxtXbjg
         voDN6UCrlIBwDAU5tVeBI8d4OdoEb5O0bddJis0Y/1oVt//R8YvJ3a/xTSYF6BJZgz7x
         zA8A==
X-Gm-Message-State: AOJu0Yw/yPzjdZa2C6iMPBQmI66hy7sZCPzlsg517qxUkEaOh6p7H7OA
	K8l/DbadTQG+zNVnz73YhELQsoS+UKtEtTFHjgeX/NjfXEKo4Qbouc0lXSpOCg==
X-Google-Smtp-Source: AGHT+IEd3zXlvSGgZ0mXCE1XjkvID5hcRbGGUrHAh6e87yThPodvIALQNu/8HwwxXls7VIkIq6gj+w==
X-Received: by 2002:a05:6a20:c411:b0:19a:360c:75d8 with SMTP id en17-20020a056a20c41100b0019a360c75d8mr8249397pzb.14.1706652378406;
        Tue, 30 Jan 2024 14:06:18 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r11-20020a170903014b00b001d8dedeb0casm4331642plc.180.2024.01.30.14.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 14:06:17 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Marco Elver <elver@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/5] overflow: Adjust check_*_overflow() kern-doc to reflect results
Date: Tue, 30 Jan 2024 14:06:06 -0800
Message-Id: <20240130220614.1154497-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130220218.it.154-kees@kernel.org>
References: <20240130220218.it.154-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=keescook@chromium.org;
 h=from:subject; bh=mjbhQQsJHZNHQElAJyka1am+OsaRRifuj4xn9QRfLGM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBluXLRXPWpxbxWBABUSnq7LV3ZR63LVVosG/CRP
 5ZzpJGG3mKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbly0QAKCRCJcvTf3G3A
 JsZ3D/47FGhmdQqxJrZ9wW+IfjOj5Z+/JJdT4A88xjMViD8m2y+sZ66ET8cpz0UxvZb8wc5ydbm
 kKGJkwmx2MxOImy/n06QpmWo+Jj6Hcb2x4MhjJrvG7QbIC8no338Da90doAljPBJQardE1fF7BX
 TAwaqrSw+31TcmCP/J6CJ3Zy1M7SMmYp0HdBNg7mIDikbW2FYa3oKBphdZXiLt38fjJJQf2jUFd
 CBKnBPtpk2Q42oSJwkvv0+WZj3zuvoFhIgRyLYf0i9QuXdQFK8IfVBZQi3UUcyJRTHJDYshhaTS
 yfLfrJ6F0nr8PdL9h2/IqewAUyNk+YiE0J1j+Ds70hYy9YypS/JaeNCvKq9n42FWNRatqLbtMEs
 HweyCRNsTPMccrf/ZSHVhW83m0QZP3tZ00lVm3rgNhL2Q/oa/pqerx8fp8YgQ/JgLeRgJt1eK2R
 ino8gJHkQp7HkP+owrvPQZBSFUjFFBc+7ZHhkOiOYDQ/1v7RZHuIH1CYRNyhzUdlSU+QrcgUX9F
 XfRFoAkuBd8qYpVccYsV+1/zKrZDgEW72okrPtTNzp1Rjo+eXk5QFw9bDTl/qo/CClNbY1F0PxT
 LKPYm7R9P1tk0jtAkCFen/ejWNEp8jvYos5ar8T5/53t/xYMN7kEw1Cj4gw2iJwJ5U7ELiklaKW B5/Vgg5InWPF4Aw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The check_*_overflow() helpers will return results with potentially
wrapped-around values. These values have always been checked by the
selftests, so avoid the confusing language in the kern-doc. The idea of
"safe for use" was relative to the expectation of whether or not the
caller wants a wrapped value -- the calculation itself will always follow
arithmetic wrapping rules.

Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/overflow.h | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 7b5cf4a5cd19..4e741ebb8005 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -57,11 +57,9 @@ static inline bool __must_check __must_check_overflow(bool overflow)
  * @b: second addend
  * @d: pointer to store sum
  *
- * Returns 0 on success.
+ * Returns 0 on success, 1 on wrap-around.
  *
- * *@d holds the results of the attempted addition, but is not considered
- * "safe for use" on a non-zero return value, which indicates that the
- * sum has overflowed or been truncated.
+ * *@d holds the results of the attempted addition, which may wrap-around.
  */
 #define check_add_overflow(a, b, d)	\
 	__must_check_overflow(__builtin_add_overflow(a, b, d))
@@ -72,11 +70,9 @@ static inline bool __must_check __must_check_overflow(bool overflow)
  * @b: subtrahend; value to subtract from @a
  * @d: pointer to store difference
  *
- * Returns 0 on success.
+ * Returns 0 on success, 1 on wrap-around.
  *
- * *@d holds the results of the attempted subtraction, but is not considered
- * "safe for use" on a non-zero return value, which indicates that the
- * difference has underflowed or been truncated.
+ * *@d holds the results of the attempted subtraction, which may wrap-around.
  */
 #define check_sub_overflow(a, b, d)	\
 	__must_check_overflow(__builtin_sub_overflow(a, b, d))
@@ -87,11 +83,9 @@ static inline bool __must_check __must_check_overflow(bool overflow)
  * @b: second factor
  * @d: pointer to store product
  *
- * Returns 0 on success.
+ * Returns 0 on success, 1 on wrap-around.
  *
- * *@d holds the results of the attempted multiplication, but is not
- * considered "safe for use" on a non-zero return value, which indicates
- * that the product has overflowed or been truncated.
+ * *@d holds the results of the attempted multiplication, which may wrap-around.
  */
 #define check_mul_overflow(a, b, d)	\
 	__must_check_overflow(__builtin_mul_overflow(a, b, d))
-- 
2.34.1

