Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798CD1C687;
	Wed, 21 Aug 2024 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724254977; cv=none; b=fOP6AHdDqjPozSCcUsN56Vl9GstRJAnAUMyCaBQWkl2u70hdksjf8ANE9ouK39yXnct1GsSFe1jIJKi6BfqgsqClABxTmT8FDA3u2dkqXjpPtqINzIeV0jCirq2JZwTfU9QTaNaqcMRs/3lNLYavjqW4/adEmC7GcVfMNtH6vKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724254977; c=relaxed/simple;
	bh=tha8q4djsO71G2VO1EuBFgNNostKbeHe0o10iY5cylE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MSONx3/xxnGADU9dzsWrWfUuWJ6XRp44YA/c+dhwBFFAmnpA6UqwIJqnUtJawkJ7XjulqZQiA/DRTxabC7NW6G+C7t9DthbaLY0yHGIA0UcXfnDkJ5e3tpLUZIXNn7r0y0KjbaozwtpqY3i0gOTV2WarZvLVevfQ7i4z/GGQoe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7pOv/fW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7pOv/fW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6AA6C32781;
	Wed, 21 Aug 2024 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724254977;
	bh=tha8q4djsO71G2VO1EuBFgNNostKbeHe0o10iY5cylE=;
	h=From:Date:Subject:To:Cc:From;
	b=n7pOv/fWLIDFduFXmk77W0ztJ7Hi5M9t1bWm8Jev+99cijg8kmkCkVrQ3wp+c5o8k
	 OsCvc+/9To5k2J5JlZQm3ikmuBZXMAZLvrby4ACWRCOE7GYbST7Fl5E1EPFkJ/xqkw
	 ZsuuBQqIDQAgCsIujlvlIxzLuCVrojRfH5YwD10c5CrTiOK4kp0CX1mVy67DbmuCWQ
	 BZTZXbhrBqOLgWiZOWlNHFGZhJntlHSy2t0AvbyqqgaMmRt3A5PUQc6vBxGV4mccQX
	 ugU9XOYUanBQtvQ60Qwg4XtdEpKggOHcShyGeI/IUO3SbhJoVw98wdeAgsvd+Oizqe
	 naeyguuUPJMMg==
From: Simon Horman <horms@kernel.org>
Date: Wed, 21 Aug 2024 16:42:50 +0100
Subject: [PATCH] staging: rtl8192e: remove set but otherwise unused local
 variable iv32
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240821-rtl8192e-unused-var-v1-1-08b9e869260e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPkKxmYC/x3MSwqAMAwA0atI1gaaIhK9irjwEzUgVVIVQby7x
 eVbzDwQxVQi1NkDJpdG3UIC5RkMSxdmQR2TwTtfOPaEdqxMlRc8wxllxKszpKp01AsVzAyp3E0
 mvf9r077vB6NXCpdlAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-staging@lists.linux.dev, llvm@lists.linux.dev
X-Mailer: b4 0.14.0

Remove iv32 from rtllib_tkip_get_key() as it is set but otherwise
unused.

Flagged by allmodconfig W=1 builds with gcc-13 and clang-18.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
index dc0917b03511..31eff306e8aa 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
@@ -638,10 +638,7 @@ static int rtllib_tkip_get_key(void *key, int len, u8 *seq, void *priv)
 	if (seq) {
 		/* Return the sequence number of the last transmitted frame. */
 		u16 iv16 = tkey->tx_iv16;
-		u32 iv32 = tkey->tx_iv32;
 
-		if (iv16 == 0)
-			iv32--;
 		iv16--;
 		seq[0] = tkey->tx_iv16;
 		seq[1] = tkey->tx_iv16 >> 8;

