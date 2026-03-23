Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E013BED3D
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283504; cv=none; b=tNRQ0VuEkcCLiMkiuGFCS+xxWpLSIab1plIJIiQtjXTxManYkwA5uA8V/mGhaX6iEJTIXx780Em45C5RQxUTdFrK5Q4p6yehkuomzDFUVlS/xw2ht5uTnAl3AhpF7d2Hbve3KgLfCK5XeejIbEkgYcqD+tokUXHxowAfkjGciI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283504; c=relaxed/simple;
	bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=jFQDxo40X1CUF9Tmhis0IC8AhHAY/7yJ4OakHeAXEcq5SQ/Ib90jnONyjbN0Ck8EIVIjEh8CsjM73/Ok3k9xrKUJbRnPc5itJ2Ud97lNuBuQn6CRAsitd88YT3ayVQSuTo7al0NFnYQJoPtb4jwLjQT9T87pMlcRLcs845+FxeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tct6w9Wr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tct6w9Wr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so25533245e9.2
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774283497; x=1774888297; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=Tct6w9WrNth2ceLwrAguWwUkC5XAzjbbjdUp+/9h517e2447SRG8htFFBtaEre0qhK
         ZbzNPhuiS+QDKKt/FTknXZg/11dezBxe0JFK5EAGDrSH7J4jqgYmZKgMMvrQ1foMDuJ3
         KGy9cRm8rhdmg9gij8qpZr+qBvrCeI3OeyRqUEwxeLjdDub6z1s8KffaAFfDXWGoOckO
         ea2CYnFBKheoOC2MwTmXWefGTwRWl816rnnMT0Ph2XErkgsesRDuQLjPloFxpdoEqsPR
         7jfaWdp1qgekxgaYtgSwjoXdm1NTfZ8DHltbOzvFoT1eB/iuyL/dntZ9L5DUvn6j3JjE
         KeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283497; x=1774888297;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YequnmNaiUgu1X5AL6Y6SfyDxBw89iVjKvArcY/3kec=;
        b=D1GjrwmfrBt3dNVrQPwQCv8046VIJB46h70mSKPGFnp1PSdTiH9QOoxT+cxpYI//rA
         fPBWW43zYpzKncAJZw19bYc0S7jCU/ID3d/WQ/1yPwtRlfIiFRiydRSMtQbbeH4FhaOr
         3LJUbCNDQf5iId6ny5hO4kQJZtsUTK/IBo3iyEkR/DR3R+RdPdOi9W3ZbJcuWKOs3bE7
         ELiTHZE906AHAl68eiC6eg/EvRVY0GbVi/JKYhJkxopH36HRpND99h5r6bfcYPXjvP3F
         CCbq7yh868OK68y4rUlxxx+UygIBC6y2vVZeWCuHwGbso2s/RtgDC5OTttJjoAvHNoxr
         Ou8A==
X-Gm-Message-State: AOJu0Yw+FThw8ZpnGXxUgaBYxuBnSsWd12b7KNRgtcmnmUYCiAva0gVb
	pwdD3ZM9VfT+lJunF8iRiGvc+Jmn5RIYPdZQD8ixd6t4m03HbbvTSLt8JdZxXoRJc6Y=
X-Gm-Gg: ATEYQzxryfIDylEF0OcKLzhVO6lcO/E42u1f09uRyc5MNUepU9FWANUb8G1L0jKhGVT
	cT//VCEtJ3EFm6oDlWFEb9SxMYBEEFJztulPwKF50gCYncrwV4JOwQroWQs9UlNDMH1ESVJOXAU
	x7luhe7PRAPz5H8smecavjt0eWO3OnhkGf7+s80Ph1k3eQLCE3xvXvYOSwVGVArAA5vg8wu/Oko
	F4McJzmGq+XuLmkqC5hXdbOGAjH4s83jSWhC/mO/jTSrqn5zZmGeuPsPhaCdJA6VU+ORAO1MV1h
	YzXGwXqf1XWyDp5srXkNQIuN+xDH/tTtFM6rXCvjVAuLckro8ohDwh1XEyNki0MrOXKm84LUP+4
	6YBS2N9lNx4GkaNPpbQMmdl8SnWtqh1WnbxCdpfQrBO422EOntEo3orrUUu6erkNiIpXgK7J6B3
	7RLd1RkG0LFyvePtdftP6/HDbgC+X7bUORgM3THxx6rQWekBY2R7HpxPFSmjlQ+Y5Ifw7MJGGzx
	4KDfFK5JFsm
X-Received: by 2002:a05:600c:a4a:b0:486:fe83:8621 with SMTP id 5b1f17b1804b1-486fee1ab20mr149439885e9.23.1774283496632;
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48700377b71sm121384715e9.0.2026.03.23.09.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:31:35 +0000
Message-Id: <DHAB093OVD2G.3IO4C9P3ZI8HP@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "kernel test robot" <lkp@intel.com>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
 <202603222239.JTuBxs7K-lkp@intel.com>
In-Reply-To: <202603222239.JTuBxs7K-lkp@intel.com>

On Sun Mar 22, 2026 at 2:15 PM GMT, kernel test robot wrote:
> Hi Alexey,
> kernel test robot noticed the following build warnings:
[..]
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'
>>> Warning: drivers/mailbox/exynos-mailbox.c:60 struct member 'irq_mask_va=
lue' not described in 'exynos_mbox_driver_data'

Thanks, I'll correct it in the next version. The warning is a bit vague its=
elf
though, the problem is comment that describes the mentioned struct.

Thanks,
Alexey
