Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795321118;
	b=MvDjFT2n4u6boVlpYg/A1lct61tXfcoF1WW4dvhFf1yCcNALhuJ9+uAkFva2/E0AMriy
	 4bLCcxPxiRa+8c5Qh+fL8nZBbyMkfq7mrLE/Ip+6UC25kUej4h85p++YdYLENl5uTCQKh
	 IuwUKQW920thDMebFdXOtrwGI0HAWRBnKH6qMoM/Kf3MjCjnIp9cMgaOFX02aVbSzqxdP
	 sT18TdMXEKoy/HPsjBEikKJg7saEvyKfZCQFOQu6vZz78JEDI/53w+AWvThCGYFpNtFBv
	 ZZkgeEEwpGNXZ/il3060wo8ONTfO5+rczfmINSO8TliYlHzWYbHU0x3mp64mb8wbJjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321118;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	bh=fac/KNOQ0/j/4UQ1Z5/+n3/sT765ULivuStqwVxbL9k=;
	b=kzToeQuErGGFHqz6Re18kQ+GOtgItQI1sEycorHvUq4HMz6MVhsCEY/uLw+zzrZ2a9IE
	 Cs4ZABJtbzUq32I0wLyi/00UluF8acMagHyoH5xo6Box9EmxA4t1lzKJSDtH9iITggqSS
	 60V7wca53SI42m1T/akjsyrmLYHl/6kz47p/0trK9QuCImjWcmPOtc6eISf/ZbFeA/6HO
	 ZeHGY7ro8PI+yUOaugj24VNyxiY3cxNk3EMUCB+eKBLn0ckJqSSrMxqeNrTBHGwLr7tk7
	 u5T8AdV1IhDhbXrG2G8Lg6Z8Oz1SWHMH0aaGGXOJaStJNOlAH5oD4A2wPOnckCyWaNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=qiBWDgIc;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F119D606A32A;
	Sun, 22 Nov 2026 04:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F119D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=qiBWDgIc
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AM4IVzD4554653, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795321111; bh=fac/KNOQ0/j/4UQ1Z5/+n3/sT765ULivuStqwVxbL9k=;
	h=From:To:CC:Subject:In-Reply-To:References:Message-ID:Date:
	 MIME-Version:Content-Type;
	b=qiBWDgIcBii6xnVq2YlT12ur0kx4p2yw16cY2PpejfksEZrtaCLwN2y6Hxppkeb6G
	 ix6I0ApsVuobYcZ5eTCQVMCIKHEcbB5Lv5yXCrRGhGtISkkpARdbLz6aG9lX3QEGMp
	 qWbiaxmDtgvB/gF+PiE3qrZNiMMD/5V3zMHVxJoPyg+Lhm52UrevPxHv8E5kyghIZT
	 76LK8g54cV1nbrxVxtMUz3Oi3cNcPGG8OfaYvLDwrFeB204tsgi5d4/9BOUfasKjAs
	 0DGTUmF3P4+taorhJ3mKCdeu+wiDvV2g0AdApIw4vR+vYuJ6q9iQ4hLikZxOO8eVSE
	 P9pjvSg6GGhsA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AM4IVzD4554653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Nov 2026 12:18:31 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 12:18:32 +0800
Received: from [127.0.1.1] (172.21.40.75) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Sun, 22 Nov 2026 12:18:27 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Ian Rogers <irogers@google.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Elkin Cruz <elkin@google.com>, Ian Rogers
	<irogers@google.com>
Subject: Re: [PATCH] wifi: rtlwifi: Fix octal 024 typo in P2P_PS_OFFLOAD H2C command IDs
In-Reply-To: <20261119170753.1526210-1-irogers@google.com>
References: <20261119170753.1526210-1-irogers@google.com>
Message-ID: <de6975cb-ebe4-4cf0-ba22-5058526691eb@RTKEXHMBS05.realtek.com.tw>
Date: Sun, 22 Nov 2026 12:18:27 +0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Ian Rogers <irogers@google.com> wrote:

> In rtl8821ae, rtl8192ee, and rtl8188ee, the H2C power-save command enums
> define 0x20, 0x21, 0x22, 0x23 followed by 'H2C_*_P2P_PS_OFFLOAD = 024'.
> The missing 'x' makes 024 an octal constant (decimal 20, 0x14) instead of
> 0x24 (decimal 36, matching H2C_8723B_P2P_PS_OFFLOAD = 0x24 in rtl8723be
> and rtl8xxxu), sending the wrong H2C command ID to firmware during Wi-Fi
> Direct P2P power-save offload updates.
> 
> Change 024 to 0x24 in all three headers.
> 
> Found via inspection of H2C command enums during an x86_64 LLVM=1
> (Clang 21.1.8) allyesconfig warning audit; fix and changelog drafted with
> an AI coding assistant. Build-tested under LLVM=1 W=1 (-Werror); not
> tested on Realtek Wi-Fi hardware.
> 
> Fixes: f0eb856e0b6c ("rtlwifi: rtl8188ee: Add new driver")
> Fixes: 21e4b0726dc6 ("rtlwifi: rtl8821ae: Move driver from staging to regular tree")
> Fixes: b1a3bfc97cd9 ("rtlwifi: rtl8192ee: Move driver from staging to the regular tree")
> Signed-off-by: Ian Rogers <irogers@google.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

1 patch(es) applied to rtw-next branch of rtw.git, thanks.

931e49022fb6 wifi: rtlwifi: Fix octal 024 typo in P2P_PS_OFFLOAD H2C command IDs

---
https://github.com/pkshih/rtw.git

