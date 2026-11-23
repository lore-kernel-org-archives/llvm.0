Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425180;
	b=fJDx+o5vZh4/5OYfj8+/mbjIVLRQ2HPMRp5/QLWQlDoO5P5TKb8H99Q+288al1q8nRje
	 eHS0Tlq+kqL5BueHBsT2WVM8tpzC7HVUAg2DuQk/cKT8AhlcDhnzf0J3c7vGh1tNLJOBY
	 B8p7Lu6XyoaX4P51QIBwhIRVk17AP+MNzDZ8qM4mto3J0ctJpWXf25h0k5J2FPtsi5m/1
	 Z5klWw4jJVBnoSfT5tOCJNv8qtPC3JmpHR9QWy8TXI0I9j9lvucLvX0w3XQXlIXOISDwK
	 aewfN95CynRZLAUlPbPame/Jop6jxL8pGPSZ5KqnDUsnZUK9fJppYzP5UwC9qWVCZDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425180;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=anejgf3VFZWtxVU9c4AFqaVC3HK4nGCoYvLC+5KHP3c=;
	b=0kSMV0g1Gq8UZjW4YSVDFO4s4GF7yaVTOL1aa5Eyz0cLPUCZgirL5INIPfniyUPlesxB
	 OCRm8ZYwjSXnfkCEfvMuPoq2IEghMxyTB53w6pbJ+tM1+avJtIZ7y5vISjFyifkWsFtIX
	 fbBUjF7wyPi9y9EJmEHFAU7bqHoi/v01EZCl75Wln7zvOKhc4l/qfS81vNfiNNoN18zaJ
	 otWkqceY5u+1XlBWLzToZqQIy5SSlAM9T4Sn7+3HXgdDshlkRCCl4UzXKZ5TSVLpADZx9
	 EKyGAYtXa2fIj3/Ubf0jZMKN+FtJu6bpQc1yu08y4t8G4a5Z4cNxRUiuwOKxhaIlnwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=q8HJt9UK;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5B9606A31E
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 09:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD5B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=q8HJt9UK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795425179; x=1826961179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ryaluqfKzxvo3ZirRDsVv3HcflaLJShT6Mv1EIlFMQ=;
  b=q8HJt9UKY4eirSruXc8JmAA91SndcBVMGVxtJfKKeNOrkKpUbms7t+2Q
   tfHJmPgOz8LL0AOtVKBNxVX6LW1hNQMxLUSM3BE5WNxhQj0niuslvG8WB
   pGSG39bwGRdYsILy//2AvRPb99ZD/hwgWmxDijbWSJdV1mgsjaWE/pWeY
   wFV3eWyjYaoYvrirD1b/cbgIuEQh4yCO9+qtTd1HsJp5HHAHBOUkOBvyY
   0RfEpk2Bb9kHFbdWi1ojtME14NVt7XsuAAOOkC0g+2uQ3TWMpoYJ8ei9X
   oxXq0ITiJ9yq+d7pxANauICKmgsnAz0zwkgEMIMpz9hfXv4UBo77xUlX5
   Q==;
X-CSE-ConnectionGUID: Fw+vHhtMT0KOaRvlRN/wjA==
X-CSE-MsgGUID: F0uCZpcHTkmXmJevVc7tuw==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="65940093"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 02:12:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 02:12:58 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 02:12:56 -0700
Date: Mon, 23 Nov 2026 10:12:56 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Ian Rogers <irogers@google.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, Elkin Cruz
	<elkin@google.com>
Subject: Re: [PATCH net] qed: Fix missing bar_id comparison in
 qed_hw_bar_size()
Message-ID: <20261123091256.ljax5hiuvfpg6kxo@DEN-DL-M70577>
References: <20261119170412.1511344-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261119170412.1511344-1-irogers@google.com>

> When PGLUE_B_REG_PF_BAR{0,1}_SIZE reads back as 0 on older management
> firmware with multi-hwfn devices, qed_hw_bar_size() logs that it assumes
> 256 KiB for GRC (BAR_ID_0) and 512 KiB for DB (BAR_ID_1), but evaluates:
> 
>   return BAR_ID_0 ? 256 * 1024 : 512 * 1024;
> 
> Because BAR_ID_0 is enum constant 0, the ternary condition is always
> false and qed_hw_bar_size() unconditionally returns 512 KiB even for
> BAR_ID_0, doubling the computed GRC BAR offset for the second hardware
> function.
> 
> Compare bar_id == BAR_ID_0 as intended (matching the bar_reg selection
> at the top of qed_hw_bar_size()).
> 
> Found by enabling Clang's -Wunreachable-code on an x86_64 allyesconfig
> build, with AI coding assistant help to audit the warning and prepare
> the fix. Build-tested with Clang; not runtime-tested on QLogic hardware.
> 
> Fixes: c2035eea3e9e ("qed: Correct BAR sizes for older MFW")
> Signed-off-by: Ian Rogers <irogers@google.com>

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
