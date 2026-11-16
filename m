Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846887;
	b=NYTHpdFYBSj8r73HTG1VMEl/irPwCUe3TE0Yqwg6KQsIkxvm6M3us8bgtnvU8oD++ud+
	 plA633+rYuF2xbzovSibWXCT7CtjdW9G6/s4t+ysxdumuGpTbN9zVTY9viY7FLy6SaIdA
	 iwMrdeEocIFgTpNLElYLEbx7DlGeNTS57LyspwYdb1y8hfeQVYBcduTtr39IzXxDxvEKR
	 27rNWau0EppZrvzuWkSA+vw4X3tptRW7JqazYA8olnZqB8ixsIQSYMj8K6JH6Sn9H344w
	 Crch/GyOwzFQkXxowIIjSGX3/Ad52Zbrk9iYq4rKcK442cRl/pxgdl+3kUuF/RdisPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=bRR41yEqa6ED7wcFnLkHHjGdtWQWZVmiHqvVGG30lGkGoefvTs7mE18eZtJvw7I6xNlz
	 Xq9cGZavYHeW4+wUHSH4IXPcLo8C75A9VqhyAnfEY3ti3ZPYLtUCvvCtA11JbWtLe164j
	 TnwKwXOD9nizJWP94EIDkzjf61pajby1E3+FNA050X01YNc5xk1zLdU2KtfqIqMkEBHIr
	 F4uNgm7Jj7O2FYVpLqev1OF80vIR+HlcfFdWFfkdgoc8k5QAkBfznzcHn5YkvTI2RsbRY
	 HHILDv3jQU69ipMAXJbmgdVzuauMiC9yWZKJMdMMUM82zuQezfH3SkNY63GA6xRpVJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWSIQCl1;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE908606A8AC
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE908606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWSIQCl1
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2022534f8f.2
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846885; x=1795451685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=MWSIQCl16LpOxy8Lyg4vgr9R8+DCN12ofZtYZv4R6SGo5T5M96LFUGoJf/XIic1i8f
         kPHhUQsDoNvxEdIojuR85Ju42R+IhYExKozx75yLwcp68kpVNEaGDd8gQFTpDltH5CYb
         oweGh9a9mtezdTxETpg6HMVASq6NCw9CWi7acrCSQUR4fHDrsRnhYv8WTHtM+oD5ux1k
         hBrWa0v4mthWOiB320AHpfkv6VeqmWulubs92hPeU8cpyPN/NSXlhf7HicPiWi2y+yjy
         uGniFArtff5FZD3ytoTcrFT+4+urMCdy8JMNSgVPSaZK+joq3K+L2iOJ5wbuu3arxpQa
         ESPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846885; x=1795451685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=LZL1WMTTEVn7IPA3WkZpeswIEAqAPxbmLnnRYUDKYL3mc2nhv90R82kk5OA5u1VnW2
         BiPOj4D9LFZCaht8jmiKq+Y7wplfkZlS0S/SSUVL2hq8hpu6U2fruqblkRe0xLj7oqSY
         4hWqUrYncci7mGICC1RJAhCf69EsCRPQK1Am18eS4KiPmN0nyaCC3E+gfk7wOSitH6jn
         kxDlPPChT5ptv6Juv80ulZNW4Xa0Mtt9tNsMOKZQxj47+4gyl4tDTPGS4163ZbmCPCa1
         f/de3WhXb4H6aDOauqMQ85nVVLHZjLIGg3ioJK/VnoHvyOPiPTVWJSCFIwb8+lGU5ZtX
         TQaQ==
X-Forwarded-Encrypted: i=1; AL+hErEiZDwEOyQfuq1KLGn7+Pd/3w5Bi2QNqg5FsB6XUzLYVvvJx8lV6DmOPe0opbDmjO9zs9al@lists.linux.dev
X-Gm-Message-State: APuU4Z+pXglKtDcJsFbe2VLydZ8TdcqDn+Oa+90IK3cFlXARZ0zWRTSe
	GYg19PX4xMtDINFPAqbqZ+GmPosvQC1C1gpkKOUsKYLv/O74F4dNAA12
X-Gm-Gg: AZFdTZeCnz5BPOVCcJ3lsDl+wwfLW78cw6YFSaHbStN0hxBqHR1hfred0mOSwv01j9f
	Xd8bq3YLDlNufOMvI+PqzjHq5oqasJNve8rTIuJXU+RMj0bcjDwprUNpdOk9ow0DIDRwpKwW9Rq
	NXGNClrISSJ1uPt+DWiXPJ/FGIeHy+3BUyyJChcGfe3ENlOygo5A1gPdBlzwWbeFzPfLY/CNmHG
	f4u2z6NLqPfJlaUBuiT2a1JgSNVGgJx5GnX8k68IOWxhDuBrJ4dBFQBQMNjNQribIBlzCgGr1kK
	HDWHm+/rmv8PXtU2L6YOsCnDPUYAXdPKjhuY03sWAgEaCb78JbWnqV836Ar3L0whQ/FZlqcDsnT
	uQqor60lTsWWkGbXS0Qgndmd3KbABLLbhM90thWULGp8Z3m8qvxCQmP5EHnJqBebbj8rcU1LTXr
	TDu4RN57jSOQYyc6jpvKjvFHzdB/jNoq+eWI34TrmIaZ1gxQjdyHSrA/Io6TqwOIlX+QIlLztJa
	lkDqg2MCGdyvPBFuZknHyoiuJmXhgJOSQJHyj6QIPB1+HEGWNZ4qVX/ggC/hsk4lOiBxJaAvzya
	2mt5xN1jr+VeQyDhyEdghncpZACE/p5EX4qD9JPElsUay+043Mlm9fBGWhjsgtn3e2NKW1UFahl
	3tIN7qHaRfeNB84Xca3qydgVWAe1AxBfd5A==
X-Received: by 2002:a5d:5f05:0:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-49c6e4a344emr23224419f8f.5.1794846885071;
        Mon, 16 Nov 2026 08:34:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 16 Nov 2026 17:33:55 +0100
Message-ID: <20261116163412.551438-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

