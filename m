Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920359;
	b=HMsJ60y2dNj0lWvxmhy4yxdbXV2sc2f25qfiIzrCc00yJhf39QyXWyV0NmkdFRNxrYps
	 ro/Vqb2TJOLgIVLA2OG+X3k73gfm352bIC7U6vZXTNYa9rHVaehLMSwlHsBoIq/wQqzLY
	 NddS6m+F2J2gXy5bAsm7dbjDdx5YDZb6+Sn3eUVZ6qv8WHGG9b4vPoXdzs1Lh6C/uZyrT
	 K8NNtJWNANLq5jHrxYOAtk/o1Pn4sHxzlXszcQLNzWv8O1FkGeR80ZVuCT7hCZbAKSdTW
	 k5sz2qrl3PLXZwLGW4ew4NYP4G07IQsUomb7ZaVxwC5S7Kt3pQ5y23ECo3ECuByVk3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FZlN4iHbDXpMMqj+PQLfEInqStv2KX2ANmZPpiwXjEg=;
	b=VwsOTMyFLELMyr3SQWnpe56Ff5PBzoyP3X2qebjSEHK5vUB1i8jO1YdjiAQh12lTgPPh
	 Nu5+R+vnqMAMeww4J3oXQDPto1rn3dphtUXNzZzgZ5RYjQ+P5Fk4WExJcNCDj1KWIPr9I
	 feSjPkxSkwZE1ljD6uo7W7S/jsoIJoeiW5rV1STcpYhauQpQ/0wFUvoLI01Hh9khC6Wmo
	 WIi92xlakbliJgpp8A1oFuF/WIZ0EbCKRQku0uZ50ewKqPUpAuzVsxPyzMBhB7NJ++z7w
	 vVOaiS9gA2U6/obpruVVtbNnGPv3bFtDBAjZejWm3dJcoZEHTSrs5PzxgoBrlmiPYQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qu5QbEKW;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C25D606A328
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 23:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C25D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qu5QbEKW
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so191023c88.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 15:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793920358; x=1794525158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZlN4iHbDXpMMqj+PQLfEInqStv2KX2ANmZPpiwXjEg=;
        b=Qu5QbEKWaBSekRf5+LtCRvOzn8SXbd9ToK7p/Vzrk/sRSjdSZF13v1fShRu1W+7XOq
         E6ir/1oGtHHFiZy4d4kj3eagqEeimFlpU38AJBmB2nbAMkhYEKHPP4YhwpjLnV2Sq0Op
         heWhlFblYJUhncRqbb/kEyAO2GMm0B5Gus1kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793920358; x=1794525158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZlN4iHbDXpMMqj+PQLfEInqStv2KX2ANmZPpiwXjEg=;
        b=Ta4LKAbyOFbPWKP+UmyWVoN5CB097wnj61/Pn1p2IE3ktPy6heXIAq4Dp+FxTFTezf
         WHAteIb4aL2FbdFtn8zeWwoTnSr34FIh1Bk7NO+0qG0NhTOT0T05ixhY91tq20k5cXR0
         F1pAIcjYOHHSqFe8XTZZklGF0NUY5J17amTXDhDqqiA1i1VjqTg7bli3pBDQZUELsDEm
         WYLMwdgGQ0d+o4yzQNMzGXl63LFGBL3O66l559zvZqa3N0KyucT/ZNbxc4LKoj3EjHgE
         1Bl/QDE2nsUauNBKpQT5GVFcNsYRLgtypXZcMzo7V3AEOW0z1X2w6j75zJyWcR9Hye+H
         58Yw==
X-Gm-Message-State: APuU4Z9vWNKH6bbRU/P2Gt4YMYZ59Qn4cM+jrlQVDKK/PAICS0kAk67H
	qemxSbMNz5dLAjHNSHRdjqjHb5HPWXyR01Lf56vokv4EgnHWFpJlpmg3cYHZwf0bylG13Q7GsDj
	cwA9ZeOkEWpA=
X-Gm-Gg: AYBFou3Xh0kaH+SP0eTYqmzCvyXXvysSYgiYblV2a+YHMDUNQJf03iiGKJLIBROLCU9
	WDWqzS24y3O2SRVyxsp/2gS9Fm3rOeHxJSWuAlaeM+JFz2Et3eIx5zRJil3qvfbp1nE0yArH/Y1
	q6q+wTQev53wsY9//qlOqcBu2WCwqygldDPVEOANWNXb3igQPUNir/bEDuKp98FWlHOGvKMV7nj
	uJQuSuaybl7hiO3eM9afNj4yfn3Nl+nFvE3gJ/lsRfAHVENPHW3138l+YJtJWRBy2surrSi2gah
	JV1wsYSlo0RKhil97cDKn9aK7ZgV9McH8XGWLa6Frbt9YfHNNgmLp9CbJe9IZy6MvrpEd3sY7Yy
	23ymIUIt4kZII0IwS9WH/Bg2CFlqUNr+h7PygBrT1OvSONaNUd3NeTEb/L7HaZR+7AwBKSLE2XU
	CGAjtVsRUoF2Nyc9Qu8Dv/hnnllWTm+orgQy8KtUQW1N90sSCwsxg36o5xft1i3cTM21y7I3agA
	LFovMB9s02L0F73iN82EftnxeJuqaboIEV8Ot+hjFyqME6EPxdR8/3olisw+KXMRiJhT+pK58y2
	RIqlBckYmu9+Zo1k6+/OjmABTUSOk1G0qBgawbY9w8BFtT2ojBchtSbbVVXwGFrcqpDrFF2l2lW
	ByGMay0SLZ+WTqg==
X-Received: by 2002:a05:701b:2905:b0:151:2e62:fe4b with SMTP id a92af1059eb24-1b25d338dddmr562194c88.23.1793920358113;
        Thu, 05 Nov 2026 15:12:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:57b2:a393:143e:afa7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa5afffasm312961eec.25.2026.11.05.15.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:12:37 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Han Wang <nesthanwang@google.com>,
	Snehasish Kumar <snehasishk@google.com>,
	Nilanjana Basu <nilanjana.basu87@gmail.com>,
	Yabin Cui <yabinc@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
Date: Thu,  5 Nov 2026 15:12:00 -0800
Message-ID: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
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

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
FS-AFDO that degrade runtime performance compared to LLVM's original
profile propagation algorithm. In addition, Profi's min-cost max-flow
solver (applyFlowInference) can hit pathological compile times (30+
minutes or hangs) on certain kernel control-flow graphs when profiles
drift slightly or when combined with GCOV [3].

Pass -fno-sample-profile-use-profi to disable Profi and restore the
original profile propagation behavior that kernel AutoFDO was tested
with. Guard the flag with clang-min-version 210000 since it was
introduced in Clang 21 alongside the default change, whereas
CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
used to probe for the flag because cc-option invokes Clang with -Werror
but without -fprofile-sample-use, causing Clang to fail the probe with
-Werror,-Wunused-command-line-argument.

RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
SampleProfileUseProfi remains false by default in the LLVM backend and
is only enabled by the Clang driver.

Cc: stable@vger.kernel.org
Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
Suggested-by: Rong Xu <xur@google.com>
Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25522aa17c2a71003 [1]
Link: https://lore.kernel.org/r/CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com [2]
Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/Makefile.autofdo | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 57a3aba6ffc2..8754b60ad2ab 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -13,6 +13,7 @@ endif
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  CFLAGS_AUTOFDO_CLANG += $(if $(call clang-min-version,210000),-fno-sample-profile-use-profi)
   RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
   RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
 endif
-- 
2.56.0.455.g6c5a503b38-goog

