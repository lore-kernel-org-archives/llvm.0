Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B043B14B4;
	Sun, 13 Sep 2026 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789279976; cv=none; b=sGzqyRtg28BF+aM74jWojeOnw03ZIdEsPjuMW+bKOME5A88JRCMV2imcMLl+hDaywY9nhEOFiZBXHCCK6qRIgDJnIEPym37yRJPbGnkawDlFec4qO4mzqDbgCS15sH9/dda6nZhXrOMlyLZypzQhCGpdEZswHBYsC/PZzg6QMqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789279976; c=relaxed/simple;
	bh=hlRAfz052thwIwNAZA77TLcD4d+HAFAJUCMq+2ACYrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6FuRCmiKx6fzPUtasHdxmMV5loTIIQ17bgyFtJXO/9B53d4GxVijJllWQAQv4hH60uBy/l6hSKFkMDul5vbI+D7q5c4utY7DveUUa3CtTp5rg4wdebisLsihJcSGoiiPnUayi8da0mHBsz5rZndorQPaVaZRo4ixPp8TSbl4+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6vlzCgQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6vlzCgQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5801F000FF;
	Sun, 13 Sep 2026 06:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789279973;
	bh=QSyp8ho+krENqcCqtD8mgyjv4BFYhN5HZH/k2CfA1Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e6vlzCgQxDcz90hMbxxtPxhE5h6HGH8zwsWBdGGRaKLvrFT+nIe8nz3ZvQRB+j7F2
	 x6SOK8+qlefol7r0HAOcQWmBJEC6aIMfI8WXFk7+3Z3etJo5jO2wcsJgM1npW0I9AH
	 lcpJCt5Gl+64CUja4L+jhQ9M/6vwlJafenyvM5Y8Ske2LFD8eCPZca6k+EGpMt5E+6
	 P5r9ba03wrq81uEUp4+x2E3YEuNJOJsDcsWfov8CaNctjBKq0Cr+4V6LN+5xsvdfN4
	 7Mm2vwZwLAPOEGMAnGhnzyb6xav268b2VIhPzWTkflt5UNbdOgPPyB5fWev6MdgSCF
	 i0/nqVEdriAJQ==
Date: Sun, 13 Sep 2026 11:42:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v3 0/2] phy: qcom: usb-hs: MSM8x60 vendor ULPI init
Message-ID: <aqY-4ExEFebqU0ZP@parshuram>
References: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616-submit-phy-usb-hs-vendor-init-seq-v3-0-7d21fb1d1484@herrie.org>

On 16-06-26, 15:26, Herman van Hazendonk wrote:
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

Hey, this fails to apply for me, can you please rebase on phy/next and
send

-- 
~Vinod
