Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C363101A7
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616972; cv=none; b=eDrB4/SuYGUcGWbRzkUtuY76zRE7qclXDqL0qloCFUzoMqaKZM5T4cv7Q6xkr8B+ImMIUU2d6605Wzwv1DuGwDak2t1WilwvDICkyO8LnZ5RxWdYCRQXun6ODzfk9QAZ9yuWuI/swvrzwBTaO2o79jsqCphmWkA0EjZE3YtU0Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616972; c=relaxed/simple;
	bh=alQwayR/ZWd66B+tpmSWDGPSW8rFt3k3UXDfeMFYw+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WaoV+S1VonLbzYKtJEAChFigvmOlgPnG0S6//y91txqlKHFt3FX7pwGxtStpwBms0raM0z0mETc00o30PiUQ738JCXtdUSONarhKokIA6giacOjcK+F5weXGJLn7AO1cCsTQ9xk+qmr1+tXjhgpOveOxMmBn46C5lHxHsPy7MsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=jia1Tl8/; arc=none smtp.client-ip=136.144.136.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="jia1Tl8/"
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4gfnp72L2LzkQMbd;
	Tue, 16 Jun 2026 15:26:55 +0200 (CEST)
Received: from [127.0.1.1] (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission10.mail.transip.nl (Postfix) with ESMTPA id 4gfnp63lDNz1g93PY;
	Tue, 16 Jun 2026 15:26:54 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
Date: Tue, 16 Jun 2026 15:26:54 +0200
Subject: [PATCH v3 2/2] phy: qcom: usb-hs: program MSM8x60 vendor ULPI
 registers on power-on
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-2-7d21fb1d1484@herrie.org>
References: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>
In-Reply-To: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Herman van Hazendonk <github.com@herrie.org>, 
 konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781616413; l=5851;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=alQwayR/ZWd66B+tpmSWDGPSW8rFt3k3UXDfeMFYw+E=;
 b=/b1XhJ0CbraycY+Tqc+AHHmn2cMUfL1CyJDU/KGK7BfqW5rdNmVhpiv27GH+FpI2ht5IlY55T
 c/vgAoihMeNBsD8Zz+d952QpKtoV8GdO4NTuCqvWyJJFTkX+kj69dUX
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1781616414; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=bKwldoJ8S7M88lVIxxOm1g6Eugev8VfNz6lpMmlF2RQ=;
 b=jia1Tl8/MzuqTkDxmvHuhVokyi+UgthIAn+hD6GqloGX8LduoXH7Us2gH9l4LRtFlixNbL
 zog9GRrbcjtILjcD/uCNnGYMiYnGalEfdB6xcIofagKz0C6fchUYio8zl5fVJ7NM3PufJx
 mx9jDq5Fx76S9SVcMBTmaFqK+A1GUAu3PTUfhOQ4taeL8JVNC/kLTg/ie1IvtufYdHqA62
 3ZaFBClEYiF3pOzL7YjmqOR20kVe1zJft+MT2scztsIav50cqHUPrpMwhJQkFlUl4ayti+
 tpTIsMG7+6QN27Dx9zhFNl8uBhGOZjgaFDF7mPOM3KPVTRGqJEnoLXLvAXDa/Q==
X-Report-Abuse-To: abuse@transip.nl

The MSM8x60-class PHY needs three vendor-register tweaks for stable
USB operation, which the legacy msm_otg driver used to drive from
board platform data.  A survey of every MSM8x60-class downstream tree
(Qualcomm SURF/FFA/Fluid/Dragon, Samsung Galaxy S2 family, Sony
Xperia, HTC MSM8660 ports and HP TouchPad) shows that two of the
three settings are identical across every board:

  - reg 0x32 [5:4] = 11b: pre-emphasis level set to 20%
  - reg 0x36 bit 1 = 1, bit 2 = 1: CDR auto-reset and SE1 gating
    disabled (the legacy driver inverts these bits, so setting them
    disables the function)

Hardcode those two unconditionally behind the existing
qcom,usb-hs-phy-msm8660 compatible.  The bit-level documentation
comes from the Code Aurora downstream header
arch/arm/mach-msm/include/mach/msm_hsusb_hw.h, which Samsung and HP
both shipped byte-for-byte identical.

The third setting -- reg 0x32 [3:0] HS driver slope -- is genuinely
board-specific (HP TouchPad uses 5, HTC MSM8660 ports use 1, every
Qualcomm/Samsung/Sony reference board leaves the silicon default of
0) and is consumed from the new qcom,hs-drv-slope DT property.  When
the property is absent the silicon default is preserved.

No public Qualcomm documentation describes how the 4-bit slope value
maps to an actual slew rate, V/ns or %; the field is an opaque
hardware control whose semantics only Qualcomm knows.  Boards must
copy the value from their vendor / downstream kernel -- this is a
measured / tuned-per-layout knob, not a derived one.  We program the
4 bits verbatim and trust the silicon to do the right thing.

The writes live behind a runtime flag that only matches
"qcom,usb-hs-phy-msm8660" so the existing MSM8226/8916/8960/8974
consumers are untouched.  They are issued *after*
reset_control_reset() so the values survive the register restore the
reset performs.

Note: HTC MSM8660 vendor kernels additionally write 0x0C to reg 0x31.
The HP TouchPad webOS kernel does not touch that register and USB is
stable without it, so those bits are omitted here until documentation
is available to explain what they control.

Assisted-by: Claude:claude-opus-4-7 sparse smatch clang-analyzer coccinelle checkpatch
Assisted-by: Sashiko:claude-opus-4-7
Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/phy/qualcomm/phy-qcom-usb-hs.c | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
index 98a18987f1be..a7649a09e82c 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs.c
@@ -20,6 +20,14 @@
 # define ULPI_MISC_A_VBUSVLDEXTSEL	BIT(1)
 # define ULPI_MISC_A_VBUSVLDEXT		BIT(0)
 
+/* MSM8x60 vendor ULPI registers (raw addresses, not ULPI_EXT_VENDOR_SPECIFIC). */
+#define ULPI_MSM_CONFIG_REG3		0x32
+# define ULPI_MSM_HSDRVSLOPE_MASK	GENMASK(3, 0)
+# define ULPI_MSM_PRE_EMPHASIS_MASK	GENMASK(5, 4)
+# define ULPI_MSM_PRE_EMPHASIS_20PCT	(3 << 4)
+#define ULPI_MSM_DIGOUT_CTRL		0x36
+# define ULPI_MSM_CDR_AUTORESET		BIT(1)
+# define ULPI_MSM_SE1_GATE		BIT(2)
 
 struct ulpi_seq {
 	u8 addr;
@@ -37,6 +45,9 @@ struct qcom_usb_hs_phy {
 	struct ulpi_seq *init_seq;
 	struct extcon_dev *vbus_edev;
 	struct notifier_block vbus_notify;
+	bool msm8x60_init;
+	bool hs_drv_slope_present;
+	u8 hs_drv_slope;
 };
 
 static int qcom_usb_hs_phy_set_mode(struct phy *phy,
@@ -105,6 +116,41 @@ qcom_usb_hs_phy_vbus_notifier(struct notifier_block *nb, unsigned long event,
 	return ulpi_write(uphy->ulpi, addr, ULPI_MISC_A_VBUSVLDEXT);
 }
 
+/*
+ * RMW the vendor registers to preserve silicon reserved bits.
+ * In reg 0x36 the legacy semantics are inverted: setting
+ * CDR_AUTORESET / SE1_GATE *disables* those functions.
+ */
+static int qcom_usb_hs_phy_msm8x60_init(struct qcom_usb_hs_phy *uphy)
+{
+	struct ulpi *ulpi = uphy->ulpi;
+	int reg32, reg36, ret;
+
+	reg32 = ulpi_read(ulpi, ULPI_MSM_CONFIG_REG3);
+	if (reg32 < 0)
+		return reg32;
+
+	reg32 &= ~ULPI_MSM_PRE_EMPHASIS_MASK;
+	reg32 |= ULPI_MSM_PRE_EMPHASIS_20PCT;
+
+	if (uphy->hs_drv_slope_present) {
+		reg32 &= ~ULPI_MSM_HSDRVSLOPE_MASK;
+		reg32 |= uphy->hs_drv_slope & ULPI_MSM_HSDRVSLOPE_MASK;
+	}
+
+	ret = ulpi_write(ulpi, ULPI_MSM_CONFIG_REG3, reg32);
+	if (ret)
+		return ret;
+
+	reg36 = ulpi_read(ulpi, ULPI_MSM_DIGOUT_CTRL);
+	if (reg36 < 0)
+		return reg36;
+
+	reg36 |= ULPI_MSM_CDR_AUTORESET | ULPI_MSM_SE1_GATE;
+
+	return ulpi_write(ulpi, ULPI_MSM_DIGOUT_CTRL, reg36);
+}
+
 static int qcom_usb_hs_phy_power_on(struct phy *phy)
 {
 	struct qcom_usb_hs_phy *uphy = phy_get_drvdata(phy);
@@ -154,6 +200,12 @@ static int qcom_usb_hs_phy_power_on(struct phy *phy)
 			goto err_ulpi;
 	}
 
+	if (uphy->msm8x60_init) {
+		ret = qcom_usb_hs_phy_msm8x60_init(uphy);
+		if (ret)
+			goto err_ulpi;
+	}
+
 	if (uphy->vbus_edev) {
 		state = extcon_get_state(uphy->vbus_edev, EXTCON_USB);
 		/* setup initial state */
@@ -214,6 +266,22 @@ static int qcom_usb_hs_phy_probe(struct ulpi *ulpi)
 		return -ENOMEM;
 	ulpi_set_drvdata(ulpi, uphy);
 	uphy->ulpi = ulpi;
+	uphy->msm8x60_init = of_device_is_compatible(ulpi->dev.of_node,
+						     "qcom,usb-hs-phy-msm8660");
+
+	if (uphy->msm8x60_init) {
+		u32 slope;
+
+		if (!of_property_read_u32(ulpi->dev.of_node,
+					  "qcom,hs-drv-slope", &slope)) {
+			if (slope > ULPI_MSM_HSDRVSLOPE_MASK)
+				return dev_err_probe(&ulpi->dev, -EINVAL,
+						     "qcom,hs-drv-slope out of range (max %lu)\n",
+						     ULPI_MSM_HSDRVSLOPE_MASK);
+			uphy->hs_drv_slope = slope;
+			uphy->hs_drv_slope_present = true;
+		}
+	}
 
 	size = of_property_count_u8_elems(ulpi->dev.of_node, "qcom,init-seq");
 	if (size < 0)

-- 
2.43.0

