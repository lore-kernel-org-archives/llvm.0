Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DEB2DF9A
	for <llvm@lists.linux.dev>; Tue,  7 Nov 2023 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrBupYsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDC7C433C7;
	Tue,  7 Nov 2023 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699359067;
	bh=h+HWbq1F2NPW0nxN2+Um1YD2SAa9d2WPjiFNzz39+dU=;
	h=From:To:Cc:Subject:Date:From;
	b=XrBupYsh6IlA8OS2V40h3xAvHROdYytW8TsqGUoNBY0WhIouqdP1MLuVkXfDieTZ7
	 9ciJBN3j95fF2a42/+XsJ3Sn0vwkNeqVvcWnq1As7iPQU7s/O7GC2cXjMXBLhxRClw
	 n4GuZ3vOrdxlADrwslbUiBk3rUP+8aBx/7ezJsXU1LZOqdJVK3/tCarFm9tktjBSub
	 mwmdrQVV4REp5xdDn8bRTpEGAhs+9NKW91Yb51tEb3GSxUX8J0HgwK09ZkEQImyczH
	 D4yTjnv9FFLA4mkVFd8F5voXtzHgx9hzQt7yxKShs7NzXl0EtGOpnbNLp/PRRxnNrF
	 dRb0MBIypZznQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
	Kalle Valo <kvalo@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srini.raju@purelifi.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 01/18] wifi: plfxlc: fix clang-specific fortify warning
Date: Tue,  7 Nov 2023 07:10:31 -0500
Message-ID: <20231107121104.3757943-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
Content-Transfer-Encoding: 8bit

From: Dmitry Antipov <dmantipov@yandex.ru>

[ Upstream commit a763e92c78615ea838f5b9a841398b1d4adb968e ]

When compiling with clang 16.0.6 and CONFIG_FORTIFY_SOURCE=y, I've
noticed the following (somewhat confusing due to absence of an actual
source code location):

In file included from drivers/net/wireless/purelifi/plfxlc/mac.c:6:
In file included from ./include/linux/netdevice.h:24:
In file included from ./include/linux/timer.h:6:
In file included from ./include/linux/ktime.h:24:
In file included from ./include/linux/time.h:60:
In file included from ./include/linux/time32.h:13:
In file included from ./include/linux/timex.h:67:
In file included from ./arch/x86/include/asm/timex.h:5:
In file included from ./arch/x86/include/asm/processor.h:23:
In file included from ./arch/x86/include/asm/msr.h:11:
In file included from ./arch/x86/include/asm/cpumask.h:5:
In file included from ./include/linux/cpumask.h:12:
In file included from ./include/linux/bitmap.h:11:
In file included from ./include/linux/string.h:254:
./include/linux/fortify-string.h:592:4: warning: call to '__read_overflow2_field'
declared with 'warning' attribute: detected read beyond size of field (2nd
parameter); maybe use struct_group()? [-Wattribute-warning]
                        __read_overflow2_field(q_size_field, size);

The compiler actually complains on 'plfxlc_get_et_strings()' where
fortification logic inteprets call to 'memcpy()' as an attempt to copy
the whole 'et_strings' array from its first member and so issues an
overread warning. This warning may be silenced by passing an address
of the whole array and not the first member to 'memcpy()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
Signed-off-by: Kalle Valo <kvalo@kernel.org>
Link: https://lore.kernel.org/r/20230829094541.234751-1-dmantipov@yandex.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/purelifi/plfxlc/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/purelifi/plfxlc/mac.c b/drivers/net/wireless/purelifi/plfxlc/mac.c
index d3cdffbded693..87a4ff888ddd4 100644
--- a/drivers/net/wireless/purelifi/plfxlc/mac.c
+++ b/drivers/net/wireless/purelifi/plfxlc/mac.c
@@ -666,7 +666,7 @@ static void plfxlc_get_et_strings(struct ieee80211_hw *hw,
 				  u32 sset, u8 *data)
 {
 	if (sset == ETH_SS_STATS)
-		memcpy(data, *et_strings, sizeof(et_strings));
+		memcpy(data, et_strings, sizeof(et_strings));
 }
 
 static void plfxlc_get_et_stats(struct ieee80211_hw *hw,
-- 
2.42.0

