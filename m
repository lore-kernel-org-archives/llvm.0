Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264441;
	b=yqJzvM8BW7q5tsLUDSE/P9Idgiro9dpaUGiMcTuhEs8t4SHqgS5bkVaN8MZqxM8CYf8u
	 yLWJu6TAooH4SGv01XFWsMiXcHXNoxERlnk98rrc2/TBH5+vfnNBVE1jZ21qGC7wnnqy3
	 41yrQaQCUw+krz1j8jDP8qE5D31qudCrPtC96kQrrhWA2lh/8XMOVClpZzfJcSwZ5O9pi
	 MuaMulwtpHq06KNwT/zz0UyTCEBV4vdkLzHYIsvW9Wb+cRQccUfeprNBqOgidO/HnJmZi
	 fuHDZpOdMXeCLo5qnUdl2tT6I+QFPH3JtDxUbrRXh3mq5Eb2idav1LPWpSI99b6n86Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264441;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qGdtTk9XqIILVzAf480BTGGOJcF8Zi4YrhwrdVI2WYs=;
	b=YYqaj4g65RF8OH4Dxl0zYJPkZslDy7ctPMtUVSm7QboMUkNOkTtUt4bGQFouRX3z9wXS
	 E8Ig8ah3q2M9yV7LvrFHNp0sZNVZbAry8YyDtX5rxYmpL6Kpuv+lPDgUZow9Jg0E4tFHC
	 vGIZy8RapGKgkvrKo3dbp/TEEc2589vnJJthfL0YI/c1IRHdyvkKNPvtwQ7wrBgxsMI9R
	 tGHLuQGbIjLiKZwdVXlcSRx1qeavo/1n/4DVsLCM0p+Z2Gp4D9YLXkaQMtY6gCYt8e7aB
	 QIGmtUGvZVZfrFscpUS3CRpLIzI8t52Sj7U5xzWHnJ+L1JtmKoC30GBPHXN9Fp1fQ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SA4aygek;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2AC606A320;
	Sat, 21 Nov 2026 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SA4aygek
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B284C1F000C0;
	Sat, 21 Nov 2026 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264440;
	bh=qGdtTk9XqIILVzAf480BTGGOJcF8Zi4YrhwrdVI2WYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SA4aygekgDvnxsiGmOpBj5G5yaukbaRZY1uVdvgfEuVlGVQ5VmvyoBqANlgSd9Iyp
	 HFPKgZ61+CcxuiPWMHQ4evqiYe96qK1JNAGru4jhjQ+fOk2ELfDh8V5BX7BYx05TzW
	 6LqvIS8pQC8AJ9ygUd+omcCFxAfXTw8Ct72UVPqKHYurXm4yqZSzpw+koi7eN5o+1V
	 i+xb5bSxqRuFsD9RcrU6NlI7KVW0Jk8XkDBUQRgc+INhb7qCO5Ll2O3/bse/z/lHGs
	 TMF78sUnSgIJMG7rrhBO342ceoUdEGy10jRlERZeHRwjg4DvjaLXiFeigSVMcvU79K
	 AyBrgccMQUINA==
Date: Sat, 21 Nov 2026 13:33:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, ath12k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH ath-next v3 06/15] wifi: ath12k: add initial Wi-Fi 8 hw
 params and init helper for QCN9575
Message-ID: <20261121-blazing-accelerated-monkey-41cfba@quoll>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-6-9875d2a3953f@oss.qualcomm.com>

On Wed, Nov 18, 2026 at 01:45:29PM +0530, Madhavan Ganesan wrote:
> +		.hw_ops = NULL,
> +		.ring_mask = NULL,
> +
> +		.host_ce_config = NULL,
> +		.ce_count = 16,
> +		.target_ce_config = NULL,
> +		.target_ce_count = 0,
> +		.svc_to_ce_map = NULL,
> +		.svc_to_ce_map_len = 0,
> +
> +		.rxdma1_enable = false,
> +		.num_rxdma_per_pdev = 0,
> +		.num_rxdma_dst_ring = 0,
> +		.rx_mac_buf_ring = false,
> +		.vdev_start_delay = false,
> +
> +		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
> +					BIT(NL80211_IFTYPE_AP) |
> +					BIT(NL80211_IFTYPE_MESH_POINT),
> +		.supports_monitor = false,
> +		.supports_cong_ctrl_max_msdus = false,
> +
> +		.idle_ps = false,
> +		.download_calib = true,
> +		.supports_suspend = false,
> +		.tcl_ring_retry = false,
> +		.reoq_lut_support = false,
> +		.supports_shadow_regs = false,
> +
> +		.num_tcl_banks = 0,
> +		.max_tx_ring = 0,
> +
> +		.mhi_config = NULL,
> +
> +		.wmi_init = NULL,

Why do you add NULL assignments, which are not even correct because
immediately in next patch you remove them?

Adding code which you remove is clear sign this is wrongly set and
confusing code.

Add complete features or code, not somerthing which you know that it is
incorrect.

Best regards,
Krzysztof

