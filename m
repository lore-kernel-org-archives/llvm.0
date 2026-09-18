Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206B3B059E
	for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723150; cv=none; b=B3Xlk+0MrSWdpGGQp9XyaE8/H4SXZLJ8ty8fNiNZ03xs1fyUJrH7oYm6MwiNcy66/0Frd6c+nqHaue0JR0TbF+pEP4WwtiGpuknSa4+PwsjjgCC967vG/7j5c8kXHC6zWZ5GoZGYIZhvez0I6Y7qbJ+lS7BohwVrzYc6xJ+2MTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723150; c=relaxed/simple;
	bh=Bw9T9kPoDvx3jWedb2GuXmBKbd8nnRyCUqGqNMfPoNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7dEGaM7P8RwOFHizYD+AUWslRiwsNnhFhJGTObxzMNGyWZ1RxH7usl5u7vIL7OpqVJ60FjQJnu6jTxMMpFd51OlImrfSFetgHsdLezt9LZK+Z85L56KUgDJTssECkQTzDf+EvT9V/xeZdrZyS9XTwH1uxpvLKRKMwefHHj3YqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NjGO+7AI; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NjGO+7AI"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so408390f8f.0
        for <llvm@lists.linux.dev>; Fri, 18 Sep 2026 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723144; x=1790327944; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHpblPyGPvzLFJJQPED7TjfXg7mj3B+pu1lqZzx1RFk=;
        b=NjGO+7AIZD+M4liWf5njCLH9I5bainJPhFqo2tif95zaRh8decjHXIJK1134IjT5BW
         p8rRQjbtPiOBKZBJ7j5dYl3ZsmKQ9Y0EvfhgzSbL+OZC8saGOr3laGGahVi9RZTRUtjE
         actodC44eVRnAlki/0CrgtbagOo8btTt+xnM28FSdylhPJWYEWK/Tvkr64m2ELF7uYDM
         cNj5ODK1VSgWAoYGjbuypa1Lp97mPg/vmV6MbiqUi/L8DT2PgCgnRtYwUkQZrf8sx+Gp
         8I6J/aWoFnlGt00yCdrO62jK6DFBbTCH6+NXv9LGl1GmCYVsrsJz9QOiZ6lh7mONM25v
         rsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723144; x=1790327944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHpblPyGPvzLFJJQPED7TjfXg7mj3B+pu1lqZzx1RFk=;
        b=1+L8BbSNcVN1guHP9+wK/1lLXPDWWQmqROrdKNRNUrllaZgOQ8vRoxr/FQDh9b0+eH
         /qZeTQmKVdUiX4piD6Z6shMAiIBDiRv4K4D8q1XHVHSjIMKPTPEO+G3b4rOFS1URcKo2
         YvCn0G20H873JowwBO3ggU3qeQ34ajeR1mdM7p+4vb9xqC2+PV01hS/ayUjjY2mI3K5I
         IWfN3Pc8p+Od+az4slrWpefr88GfIdqu9aaLcJpvC4Ez0TVdHcEfYYCauu6dq4BHzpN9
         swAwoht/3/XtBQxFHr987ZG7zTbQvaSIYnCwf8hIAf2ks9sWEVdFrq8g5Fu+d5adl4HE
         oTqw==
X-Forwarded-Encrypted: i=1; AKwUvBzczmziCc6Gh4T4pUkYwfD6Ay7ZVBDQeEUhlltl5wYd8He2YS59r/k8QVSpFzLJaUrIlRMZ@lists.linux.dev
X-Gm-Message-State: AFuF++mOS1Htd4ZBCJe40qq7XfsNQeR8l0J61PPBfwdPxSnghpKVuDr3
	ka+eQFqo1jBbVK+t0YxDUs57+BfRi9S2/NI5rI8qQlBktpDvu/YcDjilFK9+ZMgPmNc=
X-Gm-Gg: AYBFou0SeQwUHuAVf9Kb0g4cjwcRdYWNS0kLBNwR0RWxTfCFXsAV5OILSs6qJW6vrTy
	979wKKWD/4cjaf/x1YSnsmIdxGu5UcBzj14ILrVcfH0bdKEc8p5tOq3ajyx8mVPeu5kxTY/3VAv
	z6z/IaO4xelRz8aqknJWMWt1123WQL6PoFJLElTKyAbsvRkc/ebaX3PFLkjer6uX50pANOrKjBo
	SBrobdmGyjyKuMwt1zSbgzr6cmYLhd25SfgG99hzHAos6LZSOcAYtVdY0D4/78PT49pJHE3wTBH
	WGMCGp/o3OBBXojBOIsVLBizWCtHdwQoSCWn7zPcmUM6baObUfN18GovLyxsSgj9VFxdm9rbqUK
	qh5icfD9uFDBnX/PPET89YRiIVUvwyVFbv8SfKnL0/yIjFz8OBWHhx1JWoWhjHvk/UA1OXpYqPC
	WIvG4quS3b3Q1Xj8djozN0Oya3W7L/IWeCPxN51ODlieM1tcg0kAgZdogatVLRg0e6+fI=
X-Received: by 2002:a05:600c:4505:b0:49e:84bf:6121 with SMTP id 5b1f17b1804b1-49fc56dac58mr22897685e9.13.1789723144132;
        Fri, 18 Sep 2026 02:19:04 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d4b9ecsm38524255e9.14.2026.09.18.02.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:03 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:48 +0200
Subject: [PATCH v9 4/9] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-4-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
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
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Bw9T9kPoDvx3jWedb2GuXmBKbd8nnRyCUqGqNMfPoNQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jBe7CzRZcpRcuvewa1x5NO164+TseMH5R0Q7Ha2VV
 zpuM+3qKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgIn8FWJkeCgslX5SN1vQ9cPG
 jve+i0P3M/e/3TFTI/f/HAPXL7vWsjH8jw7+OF2esbPB4q5za5es4Bpl+4SnRxZtllqSrc3topf
 HBQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113..8a5ff5c45757 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 	};

-- 
2.55.0

