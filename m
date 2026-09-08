Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D43D284690;
	Tue,  8 Sep 2026 08:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854471; cv=none; b=YbHbjR5onZUIsbZWqTIqrXEulI+MKukjqRzra0EC1CCD4naO43tBrwV8vdHMVkfmuR+34fzIomsaB/yncRgroD//5CukzgLoPRgH5yMm8VuyjSbdp5fX1Hy8lLTTkEt76zCGhPbyEdC68W5nk9JJBNif1qC5WHngHztdsgAmrUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854471; c=relaxed/simple;
	bh=sNQV+csNbzSpw7hFzNuAyUkr/cSxHNTz/jEsDqAXAMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teZvdh9gQiopiSFa0OujhMpJaT4KTVuOs7xEakpOntlayVq6LyQCr6daiylSUQV9DkWpeHGHOVeNIVs/lEAnIV11bf1Qz6ofxybSBViLJ+bXoSO3n6oWHp48+myPPNMYqqvAOGok2gRDtWLPFGyggeH3cMrbPp1jgcLKqCJjzRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLfm4yDe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLfm4yDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92A31F00A3D;
	Tue,  8 Sep 2026 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788854469;
	bh=ZTAso+iJzQQ2v66QiG2+Q5PpjuVHDKzuLvEqX/PALh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gLfm4yDeY4OQvh7gcqebY00CK677SxIW9UFulHLTSp62kuqEEBllPGjSRJKnfx+2e
	 cfV3DADe2pVBxlKxdQN5eQpoNMrXdYhUgsQ2gvGAIZZl4AIoxpREfGSjcdmyrMQULJ
	 vgKf/IaxeN+RsStsrsDfeOsS3XtVN3Hf0IwELpp4nu/zZ1vY20KKCr3oZafvlpBtt/
	 f8BM+W5na2ZVz7rIDeHv9CIw4fyN1DYOBCxrMqelh75dPrtSZU6suPcclrapeuopkE
	 e855ma0iu7cT8RUoc5qBglxpMr/BXYEHoHw/7ewvIl00rsLOgBB4TzCqStOeLkB73q
	 F5+RBAwuBD2AQ==
Date: Tue, 8 Sep 2026 10:00:59 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, konrad.dybcio@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v3 0/2] phy: qcom: usb-hs: MSM8x60 vendor ULPI init
Message-ID: <dlbizaj2j4cfxv64qgktc4s7hesgirk3yy5riqha2sef7jczgj@aetmxz6omq7x>
References: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>

On Tue, Jun 16, 2026 at 03:26:52PM +0200, Herman van Hazendonk wrote:
> v3 (this round):
>  - Re-introduce a much smaller DT binding patch following Konrad's
>    "do we have values for MTP/QRD" question and Dmitry's
>    "qcom,hsdrvslope (or similarly named) property in DT" suggestion.
>  - Survey of every MSM8x60-class downstream tree I could reach --
>    Qualcomm reference (SURF/FFA/Fluid/Dragon/Fusion via
>    board-msm8x60.c on android.googlesource.com), Samsung Galaxy S2
>    family (Q1 / Celox / Dali / generic 8x60 MTP), Sony MSM8660
>    (sony-kernel-msm8660), HTC MSM8660 ports
>    (shooter / holiday / pyramid / doubleshot / shooter_u / ruby) and
>    HP TouchPad -- shows that pre-emphasis, CDR auto-reset and SE1
>    gating values are *identical* across every reference board.
>    Only the 4-bit HS driver slope in reg 0x32 [3:0] varies.
>  - Patch 1/2 adds a single qcom,hs-drv-slope DT property (u32,
>    range 0..15) gated to the qcom,usb-hs-phy-msm8660 compatible.
>  - Patch 2/2 hardcodes the three platform-wide writes in the driver
>    behind the same compatible match, consumes qcom,hs-drv-slope for
>    the board-specific bits, and leaves the silicon default in place
>    when the property is absent -- which matches Qualcomm's own MTP,
>    Samsung and Sony reference behaviour.
>  - The bit-level meaning we *do* have comes from Code Aurora's
>    downstream arch/arm/mach-msm/include/mach/msm_hsusb_hw.h, which
>    Samsung and HP both shipped byte-for-byte identical.
>  - Per Dmitry's request, both commit messages call out explicitly
>    that there is no public Qualcomm documentation describing how the
>    4-bit slope value maps to an actual slew rate / V/ns / %.  The
>    field is an opaque hardware control; boards must copy the value
>    from their vendor / downstream kernel as a measured-per-layout
>    knob, not a derived one.
> 
> v2:
>  - Dropped the original qcom,vendor-init-seq DT property entirely
>    and folded all the vendor-register programming into the driver
>    behind the qcom,usb-hs-phy-msm8660 compatible.
>  - HS driver slope was hardcoded in v2.  v3 promotes that one
>    varying value to a DT property as Dmitry requested.
> 
> Companion TouchPad DTS work (flipping the PHY compatible from
> "qcom,usb-hs-phy-apq8064" to "qcom,usb-hs-phy-msm8660" and adding
> qcom,hs-drv-slope = <5>) will be sent separately with the rest of
> the apq8060-tenderloin DT series.
> 
> On-device validation (HP TouchPad / APQ8060):
>  - Booted with v3 + the upcoming DTS hookup.  PHY driver bound,
>    msm_hsusb HS link came up at high-speed.  No regression vs the v2
>    hardcoded build.
> 
> Build / schema verification:
>  - dt_binding_check DT_SCHEMA_FILES=.../qcom,usb-hs-phy.yaml: clean.
>  - dtbs_check on qcom-apq8060-dragonboard.dtb and
>    qcom-msm8960-cdp.dtb (the two existing in-tree usb-hs-phy
>    consumers): clean.
>  - drivers/phy/qualcomm/phy-qcom-usb-hs.o builds clean.
>  - checkpatch.pl --strict: no warnings on either patch.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
