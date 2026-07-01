Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6095948C3E4
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909666; cv=none; b=QMoJAKYEVa8+BvNyqM54zcGICS+TFfZrRTgwxhkbxcNBli1hkBwaqL19oNoz3/M4jkNTErEis6ZS3+r0pE9S3HGGpBuYqnrZzF0MymiFA/geqCeBoCwY/njKKxug7CM+vYqvs1vC/q/AFHPuVFXwk81oapJUru0Bj4uHo5Korgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909666; c=relaxed/simple;
	bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PZq9pTvw70WCQTad25xMR6e+hGBr1BTyc1u8GZIXF39qCw19Nd25E5spHeQzgSOUxvkzh/Gow+gNfY7RKStQKl1OBFy7plmuf0xqRRHWOWqhRNZ2BYhPfrsimjK81P2Sc/In9kQ7eSkcbQxblpbBQ2X1CQ28XxZ7XQlepnhnuFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QrozMMnS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QrozMMnS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso723884f8f.2
        for <llvm@lists.linux.dev>; Wed, 01 Jul 2026 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909663; x=1783514463; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=QrozMMnS6gy1mTjfJS+pUmuOQ0fBBczqMyVQepd7N5ru2PWi8uTC9MOHuGVSO7XUWF
         w5PQllbumv1Obg0xgoRXpA5K7Jv+v1o82fOG23afG7UUppdqn+yr86ZgQ2hSW/ffs/oB
         7Lp/wRhrke3lulZ2vr8mJVf9Taq+cywejhTWvZ8pCMxG94LexTsZr4RUEixPPgXTJMgl
         fnhm3145MyjRl44+vorViutkpJzhI258IC1pbMBGsUqiK6In1fHgXFmmRcVyol6Yx2YI
         TRur4reZhIRmed+W6a59gvmfYNcjI8BFJQpI5CAnV8iKAuzHRY1Ifhv0QdGo+SWf/izA
         s4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909663; x=1783514463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7ceLvJFGDWzpb591woUgz7GBOYPJ1IlL6PiiR38W78=;
        b=mmxjDOg3bdtXN3jprmPJV9mX8GC6YZ2fluyBerCh5HNLpJQ9qM9ZoJnmSg4oQ5ikXJ
         R+vP3mHAOO6CbYPjXhCxiFKM5wuq5jcNWtAn9GSR1IwrggcDBaBGxmzW8/1wv7S355mT
         4uWHofcpLj0yzhCTn7QWkoiE3EEZiD9kIuNqV4GNNzVZW1BmE+B2wxo8FG6rctcgDgMR
         9TXC8TMmwN1EA1MH/9MzdyAT8uhNu7wbd+eY5vucy4I4YCLznN07yErRUzsr2YQEZ/uA
         8lqknQQ2ys+IdtotddndZO8ZabsV1PjgQQOAer8mrpBQjEKMVVNKMfnhR0UiGHB5AKWk
         F1pg==
X-Forwarded-Encrypted: i=1; AHgh+RpBj/WhoWcQqHDzANWw4oKwGiSCmSRaKNDhm0RfJfcyfHV5Ox1dUkppICbpHyGjcNFPo2WS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7ZaAG73zYfV8v9d720yFbDHF14H2FFIitlPeGQSnkEyGOZ1Vq
	99D09u60LvoMh5HbuqNByYcNXkdtarWCgEbrhMKwEolKQpHHhqjo1HOrYPJaLTIMpTU=
X-Gm-Gg: AfdE7ckfzxjHT2PDpEnk+F0rPgY5LR7M0Tbifck2VAFG1C1i3auZcH87dGR8rPuWw5H
	Xmohj9H4LHWEOiOJrsS82WN1DscKEoYghQpZaEczHoh/jb5ozBk2Yq2vOe2Djta4xma4V1iXHBV
	jKrLAXF2icbDqmNNPzhkLGqzI24wUc6XorvaZhSXzVNIU9jzDMcaK91KMGzW2GfVv0qhmQ0OL4a
	DuwdzueXxgTeShMQp3b7FGB/hfMOAyFzR1wyMZfO53ui3YeYoOV66B+/bH7DboCPeTZGRAOixbE
	6NY2aXjeAZETx5G39uFbnuMORS2XMtoRYTu5gG+zAq9Otv1q8LTg2VKKMPjMGsEfJGv/zVOo/VQ
	nROZg2eEq5QP3TWCJpmKF0w271y8FDyE5xdVLE9qGmoklotEzmjD8//IQ7p7iqgBZ0hRy5uTvdA
	lwY/nWwfdDpulO48Mbc9NH
X-Received: by 2002:a05:6000:46c7:b0:470:2fb1:3db5 with SMTP id ffacd0b85a97d-477b52962ebmr358057f8f.30.1782909662884;
        Wed, 01 Jul 2026 05:41:02 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194b0sm17422911f8f.1.2026.07.01.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:41:02 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:23 +0200
Subject: [PATCH v7 11/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f
 nodes to pre-ram bootphase
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-11-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=msp@baylibre.com;
 h=from:subject:message-id; bh=vgTU6IpqehS35f26r2q57NqAGrF/RDXF3lubDqCB+Bg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrqOMLZ/SpPQcPUy3F2Rk3LwuqBFyOC34z/l3E1l28
 oVtX+3ZUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABMJmM7I0KZ15LlN4vNVXPvu
 v/t0m2nK6YWn6idE/mLv5npdlaZYXsXw3/vkTmO2mFwRP4V/C6/HMifyveY+mHhfyWKCxflsE9/
 X/AA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 8f7409da83392d2d1f160a9645ef4d68f7aaa1bf..04fcd5115b9d95e6e23c4e43782c06501a0fa601 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -40,6 +40,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
+		bootph-pre-ram;
 	};
 
 	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -89,6 +90,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {

-- 
2.53.0

