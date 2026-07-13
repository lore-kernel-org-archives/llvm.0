Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D732B981;
	Mon, 13 Jul 2026 16:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958783; cv=none; b=W15EcwX+vzWDdiR6WIfRSjNSQO9SfIv2GN0d0pOfxnCeX/tNr4TCB95LHmmQ0DdjkB14itdMHUyyFHMfx2JFxLgBXxCZI2Egr6WLBv0v2LczkGWb521LyI6e6ndAyBlvxqj3u7G/OUfjqMcnZDPBRnh8uHJv0PyrY5rOiCoQE74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958783; c=relaxed/simple;
	bh=VyCf2KO3b6BZYv6zXvqnRCAJZI1xlPZ+/BE0FaM/Vpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gp1/LbU1odYcjabt3xwrgurc7nka7s3CJJ4dEfeYlWmsUl9UiZjIseRCMsLIUJtJ7/rm5QYucCamS06kMGFhuBXWjh6xpEt+3+64SVRfBw8jlar4aiUfZssiRYQbe9bncNNwCOjJOTs5OoRujN3HwxjefLQdm1Xmgy8qEbco+aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgOVBnsJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgOVBnsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918FF1F000E9;
	Mon, 13 Jul 2026 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783958779;
	bh=8sREOdH2a2htYhcoNY3FO6500dVHGW+aOExsdSBP7gE=;
	h=From:Date:Subject:To:Cc;
	b=kgOVBnsJV/dzCfiLkop7Aq9syK9dQdA70XrI4DJC1Uqb6pK9jFZStKHzBo4Gz7/lT
	 Byaxq+Ql6E8kvCJYEw/bj9U0e/NDu3Trewz7NUOI3IopWrhE/fGXAo4R0mXjwPdEmP
	 RPuO7LIrcab2csfcciRBQI4AngQeraN/a3vIhTeQb7iVqyhhWC0EqqMAaCr2Zxjks1
	 W0AmZJPpvjzSYw4uLewLCTJc62WK9PLa2bM+mukey1mHDuD0utWA8YIXqtRprQs6TA
	 9Ag//sSrR67/UKEyGUQI6c9qLGCm/7E4OYmPONqSe9YrsDPWfPN7niluRKSZXq11zZ
	 hKJpDrIiut+Fg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 13 Jul 2026 17:04:04 +0100
Subject: [PATCH] ASoC: simple-card: Fix clang build
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-asoc-fix-simple-card-build-v1-1-671ad44ad1a0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHMMVWoC/yXMywqDQAxA0V+RrBvwOaK/UrqIM1EjvphUEcR/d
 1qXBy73BGUvrFBHJ3jeRWWZA5JXBLanuWMUFwxpnJq4TDIkXSy2cqDKtI6MlrzDZpPRocmLlrO
 KTOEIwmD1HML//P15rFszsP3+jnBdN6VqZr5+AAAA
X-Change-ID: 20260713-asoc-fix-simple-card-build-645fe39a65da
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VyCf2KO3b6BZYv6zXvqnRCAJZI1xlPZ+/BE0FaM/Vpo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVQz4/MVwdaq8f9O/hjxaWf64/Xrhg2RFyzK2a
 ujeJsxik7uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalUM+AAKCRAk1otyXVSH
 0K+DB/4vxj9i7xC0UXsBU76vso9/590QJ3b1SdNmWUK9yPYjI9L5wJaAjmaI3gdSIrLQQOlqKPQ
 IB5SsWxfW79LSOLXABuC2ZqkRb/sjHz647yh3o9Q+A5QUG+Ut5ubv2wOV56olS1BJSso9lgc1nY
 IAVfMEAIGxRMXv6yP4lfPmQpqzrpkN/7qTqhuC4r9PMnMfMq+A63T49Tb0PmIculP2NNhNIAzHB
 kIiwkLkEv6onwq8E+B3JrrYN+lNeZQZuXTi6jDV81+IH6waWLj1SUnqYcHw7doX6wVkG8HcsoBo
 uoHG+7rTxzQfJKV+S1mehJtxd6wBEqRFqqmO58UKjU+zkBwZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Jumping over the allocation of the link_info for a missing dev breaks
the build:

/tmp/next/build/sound/soc/generic/simple-card.c:676:3: error: cannot jump from this goto statement to its label
  676 |                 goto end;
      |                 ^
/tmp/next/build/sound/soc/generic/simple-card.c:679:20: note: jump bypasses initialization of variable with __attribute__((cleanup))
  679 |         struct link_info *li __free(kfree) = kzalloc_obj(*li);
      |                           ^

Fixes: 7f20b9b05b3a ("ASoC: simple-card: merge extra method into simple_parse_of()")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/generic/simple-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index abfbc9fd7c6d..6e98e973e525 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -673,7 +673,7 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	int ret = -EINVAL;
 
 	if (!dev)
-		goto end;
+		return simple_ret(priv, ret);
 
 	ret = -ENOMEM;
 	struct link_info *li __free(kfree) = kzalloc_obj(*li);

---
base-commit: a5ee3180a2a7bbbd84af70ef98283b3f3e6a821e
change-id: 20260713-asoc-fix-simple-card-build-645fe39a65da

Best regards,
--  
Mark Brown <broonie@kernel.org>

