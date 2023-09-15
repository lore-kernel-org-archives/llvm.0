Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1051A73C
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:05:54 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c39a4f14bcso23347215ad.3
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808354; x=1695413154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n0Hengu6K84ftLWMR961tNpe8ygiAngUSieA27Tmw8o=;
        b=NAlmb5gfedO1rzWg48i6P1Hi7Rjz4XSLMJ01ZXM+F8wZRypaRWGLra0cT8erXl+S5M
         J/I+TGpl8md7nPp0eRzqXXLYF2g7V4kcJd3Y6t/y6IA5kqh0bb+yzAEiEo91nnKpAOmT
         MCTnPnQaBCYWQ7hxqdp0KPZWZ8dHCagL+KeXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808354; x=1695413154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0Hengu6K84ftLWMR961tNpe8ygiAngUSieA27Tmw8o=;
        b=hjPdu0Tx3PZlcZCTchwgaygN7gaZH5PXEkYLAOW+S1njEsrQp50BUPlgaFmB1SGhYs
         5/2/J9pAmEG4gxpapw/i5jLlu2EZdlsxd9ThoznPANOWXllv9Q1RQV9JAeXsw+QUeb+x
         kv7y4JcylhCujjnf6fHwmXB/JLdz/pWk7mdyUH2aH8NSpTL7/cIZK4h263lES2Wo7uDc
         P0l9jTPlV6TSYSzpXCqxNmjPYzRGsBHsqgd6WsFtdD3kv/OMuDKh+pfPNxt1CakPDba4
         tA0UkPZgNtBKtl7jnfnKiVrKhejlFwIZ93U/G7KcKk0fiP/LosQczGc4q2p5EZKPMrsY
         YuQQ==
X-Gm-Message-State: AOJu0Yy/ifwQoQiz0OhhFFZmTOTEOoDtOQhnIHY+k32JwBgzj7IjI3N2
	C8fUg/nvSa308VjGdMixfvFDFQ==
X-Google-Smtp-Source: AGHT+IGq24vrcLOcjpvOgH5ob0qEzwfV+/Rp+So43tNxmidLFVOV8uEa8SaUdpJsq+YRIrMWJWaR2w==
X-Received: by 2002:a17:902:eccd:b0:1c0:ceab:e9bd with SMTP id a13-20020a170902eccd00b001c0ceabe9bdmr2471233plh.25.1694808354539;
        Fri, 15 Sep 2023 13:05:54 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902c3cc00b001b9e9edbf43sm3884947plj.171.2023.09.15.13.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:05:54 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Arend van Spriel <aspriel@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <mbrugger@suse.com>,
	Hector Martin <marcan@marcan.st>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] wifi: brcmfmac: firmware: Annotate struct brcmf_fw_request with __counted_by
Date: Fri, 15 Sep 2023 13:05:52 -0700
Message-Id: <20230915200552.never.642-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682; i=keescook@chromium.org;
 h=from:subject:message-id; bh=weqFhcMmCNEK0MsxB/YQXMpH/1sEF3VWxqr/sIkwvFs=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLkgJxO209fAiikOP4NOLZvvkl0taCniJgeTe
 BfOIErtc2+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS5IAAKCRCJcvTf3G3A
 JuUUEACZ2zaEA8T4Cn+MXQTZsiQW6ccYb+T67EABtpHMJ4cpCBYnDUFObSJdhqyNgTMRDPYL07d
 6fCfLAJQEBKhzzlKriudyRK7RKpMLFXL1/VZ2VshpPpr1+nih8BvG6G95958M/2KzzNfBnJW1K2
 r8ll18pOYxr53JHtE0afMIbVijjDcCmJ1YBnSdSWF4F0qdJSLYxI7tWXmOcanyNTMgVktHRikWK
 lvUS2q72eqNEAM8NTOBfg8watlPpbDk7Dvooq+jYCZe5qCV7FFQOohK4NFaje1Y/AbRCAYw6ItN
 saFM0iOJNyUWDpt0hsG710nZFYvpoGsFkhHBbzqFoySbVFfqhQD5ubDa48yoN0AD0hWntF5IJrk
 VUiGrKP8rXAHmTO0gqMAKbjlDJr2pZez8QZtkVa2K7hgHpabCN7d60rbWvAyjMaba+QZaMY1oBB
 7tHL/Avo/6NdspsNpPVeiFpRU3mDEhjiB6i7fJqblMFndNBs5gywqAYyLtbmMqGKijzhbW3qC+j
 JYb4HUVvToJO7FD3EzJMQQjuNcxjoc5CmlwNJxMYW1gfIwr/Fv/vSnFOMzB9R0yV8fh2xUHjGeD
 sEHOO1E+G+Le0NLFJBX6tKqb451jPjxpTyT3+IpcOopCKnL60hv8UlEjI2U93m+xzsWhbrL2F94
 WI39utA MSfdKWew==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct brcmf_fw_request.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Arend van Spriel <aspriel@gmail.com>
Cc: Franky Lin <franky.lin@broadcom.com>
Cc: Hante Meuleman <hante.meuleman@broadcom.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>
Cc: Hector Martin <marcan@marcan.st>
Cc: "Alvin Šipraga" <alsi@bang-olufsen.dk>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: linux-wireless@vger.kernel.org
Cc: brcm80211-dev-list.pdl@broadcom.com
Cc: SHA-cyfmac-dev-list@infineon.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.h
index 1266cbaee072..4002d326fd21 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.h
@@ -69,7 +69,7 @@ struct brcmf_fw_request {
 	u16 bus_nr;
 	u32 n_items;
 	const char *board_types[BRCMF_FW_MAX_BOARD_TYPES];
-	struct brcmf_fw_item items[];
+	struct brcmf_fw_item items[] __counted_by(n_items);
 };
 
 struct brcmf_fw_name {
-- 
2.34.1

