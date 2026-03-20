Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB435BDA5;
	Fri, 20 Mar 2026 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019915; cv=none; b=uEPZCI+16IM63ax82XkUcJ9jYK5/GZFViPrZtuA4xTUpmiV6AV6FvMkXUyC/Z3lAm7KA4mDcvOa9e+O8WYIqGJ5WWEKcT2qnfwADSh9Qnup2fSA59QvJhJaYaiBhmizcPVIf2RcwLY/k1vx/7eOg4UE8YS+houIYJ19QaVxPltA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019915; c=relaxed/simple;
	bh=S29HBR0Hz0DVZko3Rdj2fO4bO47STz9iDGPW+Bata38=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tx+8JBEyX72CLJMAWP3B46pX4ahW+HVkoKz7+S4viTH0BBaZ2kbVRxYwIH2rJ7HFHV3UCQqGFTmleWRf5jkxpAEPI4C6M9nXGWmDLHiG3xEXkxxDpx2/NLfeDJVPvfXvAdujocU/qhqwEQPgRP4zgJG+tr/HoGn++D+K0atiSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVWrkiVp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVWrkiVp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738CEC4CEF7;
	Fri, 20 Mar 2026 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774019915;
	bh=S29HBR0Hz0DVZko3Rdj2fO4bO47STz9iDGPW+Bata38=;
	h=From:To:Cc:Subject:Date:From;
	b=tVWrkiVpnr0N6sSwBRRIMOc58ADVqH7UEcAxf6hyPu27A5RBzIKJUgsUPYtdZjjhg
	 hzg7p1zMnZ69Km1ly3TOriPpWblRKuFfspkeYLYyjexNcNF2dHwhUBZce1zhlp3Akk
	 smZdenOlCXjR5UXnUrw4Ls2yHz/3pnxekZganc5L0c3jX3F/+3bPdLZTAK+6MihfUs
	 DnHyr2myTSDuUt5rdTNcfB/m6TFNYbw7beQLq5VVRxoMKIArA43WiIf1HgACOmyoyM
	 gsdlfeVBcSzO2Uf7h7EF5TGvqxbgY+pUcunTOyLZSxVRwZQ+ivGt4V46fXWNdrrAxB
	 vJ+RHTj94JajQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] media: qcom: camss: avoid format string warning
Date: Fri, 20 Mar 2026 16:18:24 +0100
Message-Id: <20260320151828.3456863-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang-22 warns about csiphy_match_clock_name() taking a variable format
string that is not checked against the 'int index' argument:

drivers/media/platform/qcom/camss/camss-csiphy.c:566:44: error: diagnostic behavior may be improved by
      adding the 'format(printf, 2, 3)' attribute to the declaration of 'csiphy_match_clock_name'
      [-Werror,-Wmissing-format-attribute]
  561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
      | __attribute__((format(printf, 2, 3)))
  562 |                                     int index)
  563 | {
  564 |         char name[16]; /* csiphyXXX_timer\0 */
  565 |
  566 |         snprintf(name, sizeof(name), format, index);
      |                                                   ^
drivers/media/platform/qcom/camss/camss-csiphy.c:561:13: note: 'csiphy_match_clock_name' declared here
  561 | static bool csiphy_match_clock_name(const char *clock_name, const char *format,
      |             ^

Change the function to use a snprintf() style format string that allows this
to be checked at the call site.

Fixes: 0727615fb975 ("media: qcom: camss: Functionally decompose CSIPHY clock lookups")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 62623393f414..78a1b568dbae 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -558,12 +558,16 @@ static int csiphy_init_formats(struct v4l2_subdev *sd,
 	return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
 }
 
-static bool csiphy_match_clock_name(const char *clock_name, const char *format,
-				    int index)
+static bool __printf(2, 3)
+csiphy_match_clock_name(const char *clock_name, const char *format, ...)
 {
 	char name[16]; /* csiphyXXX_timer\0 */
+	va_list args;
+
+	va_start(args, format);
+	vsnprintf(name, sizeof(name), format, args);
+	va_end(args);
 
-	snprintf(name, sizeof(name), format, index);
 	return !strcmp(clock_name, name);
 }
 
-- 
2.39.5

