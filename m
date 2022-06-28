Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69113238
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 12:27:51 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v9so1858469wrp.7
        for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tb0t65jsbHJl74LbXn7xY7xw4eMs9qTMATyi3JCBvfo=;
        b=U9my8jxUxg/O9/IM764HdUfoUJ1/0PxPY/DxLNTodgfsYi3V5aQYKxoNv4C8F0QnMb
         AhZ4UNDxOAr9aFw2ia2bXMBqXD85gflBsiu+PE4A7D1Yl8/7m6U/b8wd6mtPzKHEvjpP
         JNGgiB6zkj9JfswjNmwlMy16fZOMMXkDPvR+YoeWvU/+mi0Rja8j49tv6IvZlswnd9IU
         GxAJfsKibmF1vZSMv3bZ2vpXH7t9fsE7zFlWLU7ESHp1kscg46v70TFaeElCNQC0KJaH
         ZlC4LPGJ3u1HrhVgY28KdpW99YFobfyYkFRPzK/O2BlOlQ2IWB1QZSuGhLak8iosgf0V
         wG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tb0t65jsbHJl74LbXn7xY7xw4eMs9qTMATyi3JCBvfo=;
        b=vlXRiw7LNGU/qCozGSV+/iWaIb/w6JH2pLZ/ZzsYxQ6XK7DIfUD0yQ5vShlRa8ynla
         UtgA7Z9idAQp+m0eC6C7CXycAFgX2n5o5i7CRWjQ0nFpRF9pgGLo8/XXPaFZdoBqgiLr
         VwXffiqn98vKNgFXorczLJTLl1LnBVg6tHNcVVn/S6uCTBL+NTbQXOA1fED11+sOoXRs
         hWxJQ2gQv31V1/QXEnfllzoOQDWa+0UQiUIVYH09EvHLrpqwje5f0aHblM9awTcUO1EB
         o74FitrghYrvFmuK0h0BbAGiuc1fyGQxjl3AY9Wu9T7mT5uycdqtcIoRvDHavA2jN1jy
         tCIA==
X-Gm-Message-State: AJIora/c2pXg3Ejl5Z3bnAPnOSgRfRgYdJ/Wd/YXyBeFl8CnDUf8eD1o
	itBuzJisZvv6Ev1r/l8pXYbRNQ==
X-Google-Smtp-Source: AGRyM1sEgEQCWJLYG0thDMOLQ9G5zPwdAxURojB8U7z+FJm4KwwTAVmermo6VcLaUomfdQ3hiIRTgQ==
X-Received: by 2002:a5d:4251:0:b0:21b:885b:2fcc with SMTP id s17-20020a5d4251000000b0021b885b2fccmr17944898wrr.52.1656419270152;
        Tue, 28 Jun 2022 05:27:50 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0039746638d6esm17184212wmb.33.2022.06.28.05.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 05:27:49 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Makefile: Enable clang-tidy and clang-analyzer for gcc builds
Date: Tue, 28 Jun 2022 13:27:40 +0100
Message-Id: <20220628122741.93641-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628122741.93641-1-daniel.thompson@linaro.org>
References: <20220628122741.93641-1-daniel.thompson@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is now possible use clang-tidy and clang-analyzer even if your primary
compiler is gcc. Remove the checks that prevent gcc builds from using
these tools.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Makefile b/Makefile
index 9ea6867aaf9c..0afef56d8203 100644
--- a/Makefile
+++ b/Makefile
@@ -1901,17 +1901,11 @@ targets += $(extmod_prefix)compile_commands.json
 
 PHONY += clang-tidy clang-analyzer
 
-ifdef CONFIG_CC_IS_CLANG
 quiet_cmd_clang_tools = CHECK   $<
       cmd_clang_tools = $(PYTHON3) $(srctree)/scripts/clang-tools/run-clang-tools.py $@ $<
 
 clang-tidy clang-analyzer: $(extmod_prefix)compile_commands.json
 	$(call cmd,clang_tools)
-else
-clang-tidy clang-analyzer:
-	@echo "$@ requires CC=clang" >&2
-	@false
-endif
 
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
-- 
2.35.1

