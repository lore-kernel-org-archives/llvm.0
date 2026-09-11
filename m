Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8039B3B1EC7
	for <llvm@lists.linux.dev>; Fri, 11 Sep 2026 05:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103832; cv=none; b=edBmlrznXHARrO8qIBXmtulY71xvvgbZ0iZlaUJ6cIyh/98ranzl1BYraLn6PPaN3MHhWC4C2VxFn0H23VDBKnHcHD1EeePuln3uSBgXj3hmDQrWKwTONTAArJ8trhftp4ZCj70uc4kYWwemX3z4QLf+KehSlZouS4nvP/PmOvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103832; c=relaxed/simple;
	bh=f8fIikIW10N69E8p5c+jkrXr6gtyImvzXshpKnZCeWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4O10vK3PKy5niC695kNyAXQJ3UEP2mMGzxJ8OSaW3bzPd2ggtCJ4BEzsJHtUplSW0Q6KDKW/Tnso2JQhoIp/RUrbATSe4383SAKcjOlzyPWkDknSU50U2iYItsubOdiKrnIUr3AbipeJdtfMEgL9dUXSHd2KJy6Vf7je2s+y1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=KXTKyW7v; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="KXTKyW7v"
Received: from francesco-nb (unknown [185.12.129.179])
	by mail11.truemail.it (Postfix) with ESMTPA id C948022A64;
	Fri, 11 Sep 2026 07:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789103820;
	bh=6cHk0+hnAX9Svvvs+mCcXDWD9wHRA7o3iDSgCfFA1pw=; h=From:To:Subject;
	b=KXTKyW7vyrweoTFKVl3jbpQv2colBXTi8jZtGIQa6s8uV/fgX49ruW8jObGT6YbHn
	 TcBSMohJtTp3biq8c400SoWs8ubmZRA1h3gaQjJ6sKlHefSWCZ1f31aJYVGvvsHC3q
	 EhdcsSTRQx1uxqGMIls6GOyE/Ggwkge3R62zwFVwtbaanhMfVgLT4TfQKKlbSMmKmq
	 4OQXmK4BsOO+E3sq/81k0Mj7aMWMzI37vsj/zFxi9dOsvNkDAw/ubgmdzdLtcY5QJN
	 2B+PoMgWU7z+/aOxu0/Cs2XidbbDWzOhwS/nBbhVheqpYntdBjNpWVSAbKjppgfhIG
	 UX5R8QNggIHQA==
Date: Fri, 11 Sep 2026 07:16:08 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Judith Mendez <jm@ti.com>,
	Daniel Schultz <d.schultz@phytec.de>, Andrew Davis <afd@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Hari Nagalla <hnagalla@ti.com>
Subject: Re: [PATCH v8 4/9] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
Message-ID: <20260911051608.GA5377@francesco-nb>
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com>
 <20260903-topic-am62a-ioddr-dt-v6-19-v8-4-74c650dfdea6@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-am62a-ioddr-dt-v6-19-v8-4-74c650dfdea6@baylibre.com>

On Thu, Sep 03, 2026 at 02:39:25PM +0200, Markus Schneider-Pargmann (TI) wrote:
> The wkup_r5fss0_core0_memory_region was reserved with
> 0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
> AM62P defines the DM code/data DDR footprint differently:
> 
>     /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
>     DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000
> 
> which results in an end at 0x9e608000. For this memory region which
> starts at 0x9c900000 this means a length of:
> 
>     0x9e608000 - 0x9c900000 = 0x1d08000
> 
> Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>

