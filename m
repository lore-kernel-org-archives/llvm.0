Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107882;
	b=EUl3K5uPUhMKJRHUsc17vKXQ3/tyj+pYux+7PblcyTk3oPqPniqn2CpmzZaJJ9c5pMRd
	 vk5OwY/VZPfm80E78dxRyOY4YpwnBp2K6AGccbzn2ESr1fSar7aITCRWAFUIX+9g3cX66
	 X4WHmx+Un5dN+6KfDGAfc5+S7UbnWHxlFOLSDVnCPCphlo3Vh0B1ErErBmasQObqKJh4H
	 dL2cGW3jCRw5XdyqYUjAVQL/zk0Gmilq2/Q0Jqky7bHPCjGp9GbR7NIp0z4lWeFeW2Blt
	 mlmzmxTkOMz6R5NWztYY0bq6XFP8v+utZLad9AfkmqBgKDxlNcTWmD5DeChaqejAjBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=nOpfnyLydw75pNNoS2jndLIyVUsH8pHMIY6wExaOazs=;
	b=SLp5pjdNt+Qx96sAqmaBCbvZVyd7RoTWDIP2Gc/9mfBglOXsDkFNjKio4cQze3cMu08W
	 MEqAixMd121UrcCkYQsRHRWPM24sEA9fZWBIztQ3lMCiQX+TZHu79iJTyTwBMgtI95nlG
	 ImYgAPbSgBQ4SRlEA4Ak9mUfApyv6OpWeoDbLPPd2n1IQCb/Snsxw0DR5uusZTpyt/6/0
	 gtnoJ3Y6FXFQDC7OBmEfeeAgfWn8jpnBVqIGjX2Ga2XdOdibbBIoG4S2W2IvNCr4P4zs7
	 bMMeaBSVHUfYtPH6/HnZyALTIb8ffXqplIuYfT4e+LY/YG3hd9c9Ja1+Mwp3CLs0Uvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mKp/VT3J";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFF860A3804
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFF860A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mKp/VT3J
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso1412514eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107881; x=1795712681; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nOpfnyLydw75pNNoS2jndLIyVUsH8pHMIY6wExaOazs=;
        b=mKp/VT3Jdvq+bryM5Y0mcUzmPgE/ZRmR4ywYhLv2ckWaLj2XcRNqqby5XDJL3FPQiw
         bxHaSNJeOA3e6oAULyzO9RErmoUXN7YP7KBKPMnJ2LbVcZc9uby9wQiQUXcGslV5l7EY
         jbG7ieFFaEuXt5ciAaeSnoeIi/L2qgNNn7RzOspeDovsNX770MEjYJrWV/sbs2jMlfJS
         NRws5ocucMh6zfb5BirY/PXrrLexCkiaPX+aB+KhT/UPkrR0y6eYNAHoQi02RliB/mVi
         Imij3XJlYoEuJE3CfgkhhyLSsfMfJnn58XAk9c2/Bc6+b7vxpCLbkArn8gg6BwgbZUDu
         w7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107881; x=1795712681;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOpfnyLydw75pNNoS2jndLIyVUsH8pHMIY6wExaOazs=;
        b=USLSNtiJ1qtpPJB03tvoZsHWrSZCDB42BC/Jm31l3bo1JzrigK45hrLS3iFmQxR2Qt
         poAGcGG34Th/L8NqdLjHnmcNZZ6lpKcmH6AZEkimaDumREUJ1vWaHALyqwiVs6xBtxNl
         yPo1JcxBCUADytULnAxPtWqpucUHwVVqZ1ixdMb8rwULVaTZaGzprWIeGrlYdbBGHQbO
         H7d4mNubjCr5vOUBqfdit9d5VIk7Jn+MQK/3dZpiHNjXOUbuqivYMrqc7vqC6btjlsB0
         bO1GQ9wee117dd85cRAOgkm4G8WOVNsjUqggsEQUUejeXu/iB8/3RX60besyQFvaJIsA
         5aeQ==
X-Forwarded-Encrypted: i=1; AL+hErGpkO5y1w1YpGNAwJ+axx0Cte3zrioGWSqptIb2KyHym6Eav7v+OXrK+OJXa0VlCDlq4Qwv@lists.linux.dev
X-Gm-Message-State: APuU4Z/m7laaOxr0XpdXDjx/M8y/fT5JCBnhKZ1HSyYxdGdfqI0q8b8I
	wJN+Z4m7LZJ2+bBKiStqSElA7basTlSgu0kkr7XXm7FvxfVIJV2rdhU46+4B62DD5gadEHNxU64
	P0hewrPg5VA==
X-Received: from dlbur6-n1.prod.google.com ([2002:a05:7022:ea46:10b0:196:1ea7:17b6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4502:20b0:152:9e88:daaa
 with SMTP id a92af1059eb24-1b55690040amr238241c88.36.1795107880543; Thu, 19
 Nov 2026 09:04:40 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:37 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170437.1512945-1-irogers@google.com>
Subject: [PATCH] wifi: b43: Use 32-bit signed integers for N-PHY RX IQ
 compensation math
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In b43_nphy_calc_rx_iq_comp(), the intermediate variables tmp, a, and b
are declared as u16, even though the fixed-point calibration arithmetic
shifts 32-bit IQ correlation and power estimates up to bit 30 before
dividing:

  a = -((iq << (30 - iq_nbits)) + (ii >> (1 + arsh)));
  tmp = ii >> arsh;
  a /= tmp;
  ...
  b = (qq << (31 - qq_nbits));
  tmp = ii >> brsh;
  b = int_sqrt(b / tmp - a * a) - (1 << 10);

Truncating these 30/31-bit numerators and ~20-bit denominators to u16
discards their upper bits (frequently collapsing b = qq << (31 -
qq_nbits) to 0 and corrupting the signed division a /= tmp), producing
bogus 10-bit RX IQ calibration coefficients compared to the 32-bit int
implementation in lpphy_calc_rx_iq_comp().

Change tmp, a, and b to s32 so the fixed-point divisions and square-root
input retain full 32-bit signed precision.

Found by enabling Clang's -Wimplicit-int-conversion-on-negation on an
x86_64 allyesconfig build, with AI coding assistant help to audit the
warning and prepare the fix. Verified with a standalone C fixed-point
test and Clang build; not runtime-tested on Broadcom 802.11n hardware.

Fixes: 34a56f2cae86 ("b43: N-PHY: implement calculating RX IQ comp")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index 007940f3996e..7b020e0fcd93 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -4482,7 +4482,7 @@ static void b43_nphy_calc_rx_iq_comp(struct b43_wldev *dev, u8 mask)
 	u32 qq;
 	int iq_nbits, qq_nbits;
 	int arsh, brsh;
-	u16 tmp, a, b;
+	s32 tmp, a, b;
 
 	struct nphy_iq_est est;
 	struct b43_phy_n_iq_comp old;
-- 
2.56.1.708.g77570a6a1d-goog

