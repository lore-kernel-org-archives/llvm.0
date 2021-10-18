Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC592C81
	for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 18:26:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF10C60FC3;
	Mon, 18 Oct 2021 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634581602;
	bh=KI9JuVCbSBSiLAA3FJP117XRg8SfuEvdSqQocdxNHEg=;
	h=From:To:Cc:Subject:Date:From;
	b=GRZhZS/Ht1Xb7xubyx+6ai35HscsNCo27FdQ6TTsCyzfSLm2Io5jb0LNeNi6E9eol
	 1sehiQR5hTq+O8K041bMBurHhTz1ANSDmxB2Rw7AAME7vrg7HSPXXVjVTvzFOq0Z5+
	 JUCF42ptxyvaXGUd8EGS9ejULiyCyk4qLm4hJS9fKwRXJLxgxhDDd/W0QPfgvjS/tS
	 bXPyhYvzvIZbehErtAvcVLruZjxN70jqb5YKIfZAy7AjuG280OS98Qcm264TvRdCId
	 1FzoTU7/mHg2QeQcvbcr4zV7TV6pvkT1J2APha/A7DhFZlB7MYPMb0RER5o2iPpiD3
	 P3yxgSTNiNz0w==
From: Nathan Chancellor <nathan@kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Tor Vic <torvic9@mailbox.org>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix bitwise vs. logical warning
Date: Mon, 18 Oct 2021 11:25:37 -0700
Message-Id: <20211018182537.2316800-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.1.637.gf443b226ca
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

A new warning in clang points out a use of bitwise OR with boolean
expressions in this driver:

drivers/platform/x86/thinkpad_acpi.c:9061:11: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
        else if ((strlencmp(cmd, "level disengaged") == 0) |
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                           ||
drivers/platform/x86/thinkpad_acpi.c:9061:11: note: cast one or both operands to int to silence this warning
1 error generated.

This should clearly be a logical OR so change it to fix the warning.

Fixes: fe98a52ce754 ("ACPI: thinkpad-acpi: add sysfs support to fan subdriver")
Link: https://github.com/ClangBuiltLinux/linux/issues/1476
Reported-by: Tor Vic <torvic9@mailbox.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 07b9710d500e..7442c3bb446a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9058,7 +9058,7 @@ static int fan_write_cmd_level(const char *cmd, int *rc)
 
 	if (strlencmp(cmd, "level auto") == 0)
 		level = TP_EC_FAN_AUTO;
-	else if ((strlencmp(cmd, "level disengaged") == 0) |
+	else if ((strlencmp(cmd, "level disengaged") == 0) ||
 			(strlencmp(cmd, "level full-speed") == 0))
 		level = TP_EC_FAN_FULLSPEED;
 	else if (sscanf(cmd, "level %d", &level) != 1)

base-commit: 85303db36b6e170917a7bc6aae4898c31a5272a0
-- 
2.33.1.637.gf443b226ca

