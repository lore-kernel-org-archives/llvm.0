Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208FB41E38
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PC4HYrHK"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-578d0dcd4e1so1752014a12.2
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696623462; x=1697228262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cooY0MAMsYVxpLHsEagLhRsMlrOOzAuT6eHluvswwK8=;
        b=PC4HYrHKOwnv2ECoyCukyvox+tBvgYd1vpKGNSS3BtYqnEM/B2Vu0vFUmH5ZDjEvmE
         S5FwIcMh/rNI9QptshjWo1ldpLlsGuArcA/GcU32oCOKymxDTpxPYZQ8I+6W0bCebyHq
         5qwL47LJT74kXhjD0OQfhL/+vqkWhEKpfLEcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623462; x=1697228262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cooY0MAMsYVxpLHsEagLhRsMlrOOzAuT6eHluvswwK8=;
        b=PmeM+NvLga1OZkVsjEnnSfMuamzL72XdzKMzb6gfziZLJk26RWaMqXuOfY3buSWaab
         CvddreNzZ2iaFnY7ZhVNlWGYatD6uxB/eTVl7aVj/eOBvLqNRgKPT1VsMU2RtVCyFzJ/
         ilkkVgTMqPKnUqh3hTkItiozZf7vHgK3DhxJjzo+utzkoQ2CIsfsobRDxv8V33BhbYZd
         AjJMw3yg3KtoaIg99VMd6BjR9jhLKcroDmVOUv80DqhTsIL05vHSdP3OXfUmICSYSQ8B
         dro4ayY9erFAbs9saZs7PMHOLqlYjV3WLjHXwNYV30E6bJcxZzi2sRbHr+Z0yGgaNdz5
         cODg==
X-Gm-Message-State: AOJu0YxM+I/a+FEXdqrNBb45RpKSSCdTVhFMTupq5gbUIdEE10ErUtcO
	n4OmyRXBFkyRKXqzvxHwsYD7yg==
X-Google-Smtp-Source: AGHT+IHUP6fdhxVw5+bU8sj77QbFDalwCdaztMsMP6E3h8cype5SCNuQP6iLgFtkHlOh+mQyspcpdw==
X-Received: by 2002:a05:6a20:2451:b0:14d:5580:8ff0 with SMTP id t17-20020a056a20245100b0014d55808ff0mr10186119pzc.25.1696623462546;
        Fri, 06 Oct 2023 13:17:42 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s14-20020a056a00178e00b00690d7da743dsm122039pfg.161.2023.10.06.13.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:17:42 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] Input: Annotate struct ff_device with __counted_by
Date: Fri,  6 Oct 2023 13:17:39 -0700
Message-Id: <20231006201739.work.350-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=keescook@chromium.org;
 h=from:subject:message-id; bh=92ygPnQr2BZyPQ3qIX2yS3pgGDsopbxEBr/j0bwJ8e8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlIGtjMlnU/pjqbrZ5CQEVQaELCA6A7cLEBqput
 m//g4X/1lmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZSBrYwAKCRCJcvTf3G3A
 JiQMD/9NkmiSLoQomYQqV3clnux5XRRcwkQCUnQAZnkJAHdYIVLMK5g3w1Gc7XWKLgMC4QyP1L7
 qm7X2Q0zgJOqzqHC4/e65i7y3NLIlLMkQitzbAAztC4cri6bE5Np7XWZZpu1EDmK+gvVqf/viMz
 Xl84c2Wv4XvRuO2HwqaTDTwaVyIya28nU1721VSdoUPrfeBEA2zAwVnG4jFMD0JdUEtKfKyCN/t
 GJjwY4uVhB6GeTbSsmOOSUOb22xKpdr4HGSncY2StRh01l00IZ2YPyTgeXqjU6XgSgtN9Y2rbX2
 dkjg3sZsQwrmA1UVgdvxRIvq8TtzUcMQNgJ2fu6y45RuFduGpH/eYAiWEwZsX8iFRD+TFJXUxc2
 0VMqMZVjpQ1pVnjzfx//tJnUb+45Z6xFIVIA4HBt79bUs7uVl6JgjieyisIhDtOPam5hexjlFfb
 /6ZGO/LqrzRVQtHhqWg/I8HB5YSPWM+Q87D7fgJ9wYbgXWywLKmXljVXVACEQqLtrwwDTdiqXwI
 gID029EAX8FW0uWDM+TmLDt71BtNBB7AOGX3GKmx5mJ1HuT4ajqM2JEwxymEOwWGEaH6lhJMtm8
 6F+AXOZf30iAsgKi8sDCgKUl9XSCeZyYVbI8zkK96wUnffwve5N7sNsZyjfAGGUf5teFUvkVOBx
 yymY6Xn lZsWUeLA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ff_device.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/input.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/input.h b/include/linux/input.h
index 49790c1bd2c4..de6503c0edb8 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -562,7 +562,7 @@ struct ff_device {
 
 	int max_effects;
 	struct ff_effect *effects;
-	struct file *effect_owners[];
+	struct file *effect_owners[] __counted_by(max_effects);
 };
 
 int input_ff_create(struct input_dev *dev, unsigned int max_effects);
-- 
2.34.1

