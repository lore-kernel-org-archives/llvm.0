Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA74E9C36
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734327; cv=none; b=DzCEVZRFX/SVIkYlDovskN2qTwGW9PO9oTGJRml8l98f5GL5R9JElchUuYASfWFTRVW7Y8NYgNHbORyymnmFU7saSK7yZvTQ+4BCh9ekf6mY4gcuZ+b2NpItwjvRWras34T5HFo9bFEheJremvy1DGjGO9SrxgThc62pZw0hXgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734327; c=relaxed/simple;
	bh=XEU3X6TrPs6UzvTqsbHKRzxHg0PLadxing8itj7f4nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtF4XVld3I+C63gA/XZmoe2ZnmGcVNgUQFuo/HUgw8Yu30W/ga+iE3td4LNSx0if6OD0cvBXtQXqyN9++jNykHMC9iuH6U4hu/fbY0syFTOqYNysy5SyMDuJXG4Y/0WjR9ZK9WI/LV9Zpw78wM62i0m0+5LsdRtIVfWUHyBrZVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ga6r8bVy; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ga6r8bVy"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b7be8dbabfso614107e87.2
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 05:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789734321; x=1790339121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfR3YrnGEF1eVDtqqFJbMom6dYue/Q5AxIRNa4I1fXg=;
        b=ga6r8bVyhwQLR5XhGt4TUkBXDu4Jw9SiO6UAKegTpppQYQxwNcPeTFKuKMli9ieIbs
         fVBgyvQneAXV/vSan+D11nUP5BY02QKvyKi4JF9hWv5yQLUjQA0pt7NlJweZ3Cs2VuA8
         dnL81ZzdfGa5sNQAAgUQ9AwUaYHeeCscVjG5VnMkrT83/wSFr7c699czQ75puZ94crsG
         alkXfe9/yk0T/6ruyBjvX5MOx2VIudtck+N0LQWoLhxoR7B1HAQVlpW8zY0+/ewzJsp1
         wwKMDvqpollU65uBH12ZRPC6koN/qX2VuxzTn+crmlXqRFQQHh06NmDpqtfN7RQlVpiN
         u7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734321; x=1790339121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfR3YrnGEF1eVDtqqFJbMom6dYue/Q5AxIRNa4I1fXg=;
        b=tjRqxrnddBHV41W9z0Or8O1n/gWVG2+g5vqP6RdenLX5XILfGCc/h1rDgDMzot25zH
         drwop69HIWSyyoNfQrh9wqXe0Mio1ssdVJ8HC8MxBkeUAOIoc9bDoTNtJq+8tzDhLdZ9
         J3nA3AB4aT2y3ZsCXG66yOxqYwu9i+/+a3Hlyz+35jLVW8GxzRzpfaz5uOwSk43Lg0em
         YTZ5YmIrbkScyrPW3geAFzuW68KIAH1qwa+jEqQCehlZwWH2Iq6IwPIaXiv7sZJr2Fjv
         PUQv+L40/AKCqNPvJcBVFtDF01uyiOPvGLTswRJyQs2a7lCBaz5bWGkujFYfTa2hlIB6
         QdTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWdzkQ5aMbae7FAFCyqlJPDEwExFleSCZKCMToqcf5oTRdH3eHJNYmiO8hQYfv3MgGG8Pt@lists.linux.dev
X-Gm-Message-State: AFuF++kfyH2No+3hIS5zusJmMz+umin5YqMcpGeNQpwQwxEHuxljohUJ
	LL/uwLrCibd7ya5j37RnXe/1yJa8F1s8gbZIEttkJZ1CHDlo5W6zuzdj
X-Gm-Gg: AYBFou2AM0uEt3e7DjNJ/aPzT5UOuRoiLDlfChKHAdCVmM7nliwwK2tJiAHX+nBNM1e
	XAox2hne7AWN+btJTACerciZU5P3ox6tbpz2CFWmNxuzvWMQcr91Y1XYSLyu3xucF9YiU3TEgDI
	VWdybNOrJI+oMqI5Iunv3j/U2nnQK4xwpXMtrw1zRsAdlEbOHfX3ZF1txhcuZBf8gbHRFhajJMQ
	XpDtS4mLHNOoVpo3172npsNOgVjzQs5gscxoIh/v4CBLDfKkWjfDxgPLp045JDzy7LIrjsuyRlz
	F5H6mJJpMck06i/OS0dROcKvFg1/Fi5ceLclK5iTE1BkbXaGLtoKbB9qWxSJPfXsbYp0iuV8ik+
	bAf4APNDC1LzCUJuddx0UHakLttqIx5B6639tNiIKsKxeWorwAdBnWmK2mvgg2GMcgrZkn6DVSd
	on9AZe1El86TDZSzAqxFZSoyKDdX1MUBfFxg5pfqhpd8mlDUVziXMQq6Qp6K5u/dFNKCjIo8QjW
	Jhn6TD4KlIlo1f6H4DKI/CnpYUKXjq1U93DfQVJv10gigbHn5zhmgyZD/ISw31gPIbNvQ==
X-Received: by 2002:a05:6512:3baa:b0:5b6:4ae:3ff7 with SMTP id 2adb3069b0e04-5b8c18449abmr695430e87.31.1789734320670;
        Fri, 18 Sep 2026 05:25:20 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c270ea53sm398549e87.12.2026.09.18.05.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 05:25:19 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 01/10] iio: pressure: dps310: fix CFG_REG bit definitions
Date: Fri, 18 Sep 2026 15:25:08 +0300
Message-ID: <20260918122517.377565-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918122517.377565-1-zoone.rupert@gmail.com>
References: <20260918122517.377565-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver defines them as BIT(4), BIT(5) and BIT(6). Per datasheet P_SHIFT
is bit 2, FIFO_EN is bit 1 and SPI_MODE is bit 0.

Only P_SHIFT has a user. dps310_set_pres_precision() sets it at
oversampling 16 or above, so with wrong bit the result register is never
shifted and stops matching the scale factor compensation divides by.
in_pressure_input returns -ERANGE at oversampling 16, 32 and 64.

FIFO_EN needed by FIFO support later in this series.

Fixes: ba6ec48e76bc ("iio: Add driver for Infineon DPS310")
Fixes: d711a3c7dc82 ("iio: dps310: Add pressure sensing capability")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 45bdb8c7670f..35260b399390 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -50,9 +50,9 @@
 #define DPS310_CFG_REG		0x09
 #define  DPS310_INT_HL		BIT(7)
 #define  DPS310_TMP_SHIFT_EN	BIT(3)
-#define  DPS310_PRS_SHIFT_EN	BIT(4)
-#define  DPS310_FIFO_EN		BIT(5)
-#define  DPS310_SPI_EN		BIT(6)
+#define  DPS310_PRS_SHIFT_EN	BIT(2)
+#define  DPS310_FIFO_EN		BIT(1)
+#define  DPS310_SPI_EN		BIT(0)
 #define DPS310_RESET		0x0c
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
-- 
2.43.0

