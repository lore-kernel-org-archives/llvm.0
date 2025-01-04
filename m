Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F581D5CC5
	for <llvm@lists.linux.dev>; Sat,  4 Jan 2025 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736024114; cv=none; b=n92PR4wFyLRttd8I6uw78v1EBwIiEv2Gf3Y3gSDR8tHd5n2DFyYUc1cs2HCCoYt19HqVvzQj1L+VhjVlfUDoVgvDYzTzyeTf+TROBEAp3ajI268nJra4qtEsS02nraM7KRXfwAhxLRGmHMts3/0POkSDrAHi3mfS5D757A9KrY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736024114; c=relaxed/simple;
	bh=Xn/kRMOeY30BbZdhigNGOrSGfeTCnFdlp6m/DcAWf0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s34TxnQh5fuAp4G4fHpFEStWqp7dHujNzxBS2SHIz0t9HEHOY3x1PluEnSg5dM/YTrUwQNi/Cus0I3YJ9cp0y+o6mVEuwxi+Li/ahErgycjn2myjDYxHweiIAFO3eguePntb7qr+KXJTkmJw98rvhTIHGlLDdoLwlDLK5YZCKIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LocwfSJU; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LocwfSJU"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d44550adb7so3185663a12.2
        for <llvm@lists.linux.dev>; Sat, 04 Jan 2025 12:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736024111; x=1736628911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDsJNqlpSJNNawMf3Py4v8MhzkVez917T1reSgeDSXg=;
        b=LocwfSJUzgES+aEtUIt6k5+nE68w3iLhx3gFdgD6NPY2As7be/EnQWMY1b7Nbc/nV7
         f5tzb30Sv6PsPDRKgsXYUTk8kSwlBfuYsdOs7ZXOJby+/BZTh/JG5D61OqTIeglCRhsG
         LtCjbbaYkME8bb2d6npqzA/yNavq5IMFn0R19ZcdAyPu7eGJTcfPIa7Vinurok+NGFGu
         gTxsfVtwjyRJ4be3rsGvlT244YOMz4kLZswCvaI40sAY7pMX29TVxGmkqr+OVf40oGE0
         MtXvg6I/E7EfYiuGEgpUQTi9NZW5og/9Z6guGszByjQdNRYPWpCs3j22Mf0MXbC3VZyN
         befQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736024111; x=1736628911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDsJNqlpSJNNawMf3Py4v8MhzkVez917T1reSgeDSXg=;
        b=Lx5injLKrbB6ytBMun7T9pBeT/lR9bdyn2nGKVilhLA22ZnE2tDNTMef8DgnbE2CEd
         vtJlID4UM4fc4hhJap+AN2RMQ0bd46B6krzFq9OsL/PuaBV/j7vVtZXEeWIX7zOGGaHZ
         lD1z/A6i1q42eNXujeGyStUpORh7srN0srzIWsgqy79/HxAlqJFvYlvSJ5DN8dcYs1AC
         5e/jUskPLCOxiAOWMw2rsda+H1PugaTchCYglTdzQTc/5honHN36bCHVp8Ra5NsV9FRD
         YshML2rYUEIVC2Mv61HZ74hLh7T1IkdBBAzE0ts6M3zvVbrYXCrpPM0CACf5rIgKfORl
         S87Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKwY0tNKpq4W/a96x59EfceHQqludYgGDisskt+GfgmZ41K1XcwnZOGroJ0j0f0tSRfmSU@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz/2lBMOSDc8burmhwOhtaXDUGAyveVFSR5Yhx5fuMiuUmthab
	lGtLrry5rRfKwnYnTjDk/KUTeMK8hpa30/JmWVEzJYyfQ3RGDYZJeZtttBChO3o=
X-Gm-Gg: ASbGnctI7ZPBXS8DWiaNfGpBV88IELJ9y5Ie48zpVQrfWw0SzuhqvLu2I99XhmxopLS
	jT+9KgrIRr/qTcE0jDznT8G9+yKv41uCyVwj5YtCFtFocoqc5iBx9PfSckFu05f/HuHCX6ofJS9
	DVyaXtQCWosPPDVJhjGvuaCRqNZHt9xo58YHQv3UpNF8pZl1c6WHHBu1ThllOuOGyRbIqsah+U8
	FZMloNI80nVCf3tqGTrYF/YDtuv8ksmM8Y9bIq+Kw68p6GStOdnzHmK52V7RoseTCyl5EU=
X-Google-Smtp-Source: AGHT+IHWTvEbFyBXzG9e8FsP0ij+GiuUSqKpGVu0O1LuszPhiJHSeY0kaqUmQ0J/IbFid0QVoi6aLA==
X-Received: by 2002:a17:906:7951:b0:aa5:a36c:88f0 with SMTP id a640c23a62f3a-aac3378e312mr1546765566b.12.1736024109719;
        Sat, 04 Jan 2025 12:55:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0eae3a7bsm2050315466b.83.2025.01.04.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 12:55:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] crypto: bcm - Drop unused setting of local 'ptr' variable
Date: Sat,  4 Jan 2025 21:55:02 +0100
Message-ID: <20250104205502.184869-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spum_cipher_req_init() assigns 'spu_hdr' to local 'ptr' variable and
later increments 'ptr' over specific fields like it was meant to point
to pieces of message for some purpose.  However the code does not read
'ptr' at all thus this entire iteration over 'spu_hdr' seams pointless.

Reported by clang W=1 build:

  drivers/crypto/bcm/spu.c:839:6: error: variable 'ptr' set but not used [-Werror,-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/crypto/bcm/spu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/crypto/bcm/spu.c b/drivers/crypto/bcm/spu.c
index 6283e8c6d51d..86c227caa722 100644
--- a/drivers/crypto/bcm/spu.c
+++ b/drivers/crypto/bcm/spu.c
@@ -836,7 +836,6 @@ u16 spum_cipher_req_init(u8 *spu_hdr, struct spu_cipher_parms *cipher_parms)
 	u32 cipher_bits = 0;
 	u32 ecf_bits = 0;
 	u8 sctx_words = 0;
-	u8 *ptr = spu_hdr;
 
 	flow_log("%s()\n", __func__);
 	flow_log("  cipher alg:%u mode:%u type %u\n", cipher_parms->alg,
@@ -847,7 +846,6 @@ u16 spum_cipher_req_init(u8 *spu_hdr, struct spu_cipher_parms *cipher_parms)
 
 	/* starting out: zero the header (plus some) */
 	memset(spu_hdr, 0, sizeof(struct SPUHEADER));
-	ptr += sizeof(struct SPUHEADER);
 
 	/* format master header word */
 	/* Do not set the next bit even though the datasheet says to */
@@ -861,10 +859,8 @@ u16 spum_cipher_req_init(u8 *spu_hdr, struct spu_cipher_parms *cipher_parms)
 
 	/* copy the encryption keys in the SAD entry */
 	if (cipher_parms->alg) {
-		if (cipher_parms->key_len) {
-			ptr += cipher_parms->key_len;
+		if (cipher_parms->key_len)
 			sctx_words += cipher_parms->key_len / 4;
-		}
 
 		/*
 		 * if encrypting then set IV size, use SCTX IV unless no IV
@@ -873,7 +869,6 @@ u16 spum_cipher_req_init(u8 *spu_hdr, struct spu_cipher_parms *cipher_parms)
 		if (cipher_parms->iv_len) {
 			/* Use SCTX IV */
 			ecf_bits |= SCTX_IV;
-			ptr += cipher_parms->iv_len;
 			sctx_words += cipher_parms->iv_len / 4;
 		}
 	}
-- 
2.43.0

