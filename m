Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3832C9D
	for <llvm@lists.linux.dev>; Mon,  3 Jan 2022 19:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86082C36AED;
	Mon,  3 Jan 2022 19:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641238200;
	bh=dvokqjLhkAMgI6oTtFnh4DyTIXsiamUElpYSQXUUE8s=;
	h=From:To:Cc:Subject:Date:From;
	b=M/B3lUNqghIAQEaMbF1k9hfF1orFX9D7i6YboiB64pjqUaDSqwcJIcMDEmQ/swGWP
	 LShEv/UsbT7hXHKltgh7lEFMGX7WJN3aa0FNphFNHPEUcNtSgKmf9CPU7FB1QmggWe
	 t2/5Gi7b7jEcGqiycMR441R6fjO/OSdbEloxEnRU5u491TUsvZ2KTkhM25rkM+Pl05
	 e/ZDxrRQsbozt/z8JJpQrMCPpC/L7Yc8YoAm7/7VO4G9ulePg1BfPirzsU9J9b48SN
	 q23EW5cylgFQaICB0H0SnObOkTFBHnKlpcttzTEsyGagRZr15U+GPBluGiQSBWglt2
	 qyKmRkbd6s5lg==
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	stable@vger.kernel.org,
	llvm@lists.linux.dev,
	Anders Roxell <anders.roxell@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 5.4] Input: touchscreen - Fix backport of a02dcde595f7cbd240ccd64de96034ad91cffc40
Date: Mon,  3 Jan 2022 12:29:35 -0700
Message-Id: <20220103192935.3438038-1-nathan@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream commit a02dcde595f7 ("Input: touchscreen - avoid bitwise vs
logical OR warning") was applied as commit f6e9e7be9b80 ("Input:
touchscreen - avoid bitwise vs logical OR warning") in linux-5.4.y but
it did not properly account for commit d9265e8a878a ("Input:
of_touchscreen - add support for touchscreen-min-x|y"), which means the
warning mentioned in the commit message is not fully fixed:

drivers/input/touchscreen/of_touchscreen.c:78:17: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
        data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/input/touchscreen/of_touchscreen.c:78:17: note: cast one or both operands to int to silence this warning
drivers/input/touchscreen/of_touchscreen.c:92:17: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
        data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/input/touchscreen/of_touchscreen.c:92:17: note: cast one or both operands to int to silence this warning
2 warnings generated.

It seems like the 4.19 backport was applied to the 5.4 tree, which did
not have any conflicts so no issue was noticed at that point.

Fix up the backport to bring it more in line with the upstream version
so that there is no warning.

Fixes: f6e9e7be9b80 ("Input: touchscreen - avoid bitwise vs logical OR warning")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/input/touchscreen/of_touchscreen.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/of_touchscreen.c b/drivers/input/touchscreen/of_touchscreen.c
index 2962c3747adc..ed5fbcb40e3f 100644
--- a/drivers/input/touchscreen/of_touchscreen.c
+++ b/drivers/input/touchscreen/of_touchscreen.c
@@ -77,8 +77,8 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	axis = multitouch ? ABS_MT_POSITION_X : ABS_X;
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
 						input_abs_get_min(input, axis),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
+						&minimum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-x",
 						input_abs_get_max(input,
 								  axis) + 1,
 						&maximum);
@@ -91,8 +91,8 @@ void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
 	axis = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
 	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
 						input_abs_get_min(input, axis),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
+						&minimum);
+	data_present |= touchscreen_get_prop_u32(dev, "touchscreen-size-y",
 						input_abs_get_max(input,
 								  axis) + 1,
 						&maximum);

base-commit: 4ca2eaf1d477ce4316989b22e765fb915652b86e
-- 
2.34.1

