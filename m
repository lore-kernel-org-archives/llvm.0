Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCBD43AB3
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:51:53 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-274b9b3e0e1so1713935a91.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405113; x=1696009913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZILszX4MWtz7bh2TMVWfqmp53JcjPScOVS5QC17vqfk=;
        b=ffsWkr8S0FXcHftdKgqpK6tqb6url0MS2DMNirp1/YgmODlu8ImOyaA7hhatrHrFS6
         Sp1ipoxTlUPckvvSwzaxad/j2irZaVL2C82NKpmTswbDaAGw0PO8RBFzmZ/rSxazEZJ/
         gzD0TSh50Wm+Ttz1SU4hnC1pGG99mi2E/U53s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405113; x=1696009913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZILszX4MWtz7bh2TMVWfqmp53JcjPScOVS5QC17vqfk=;
        b=PkChGJtE18+dECwBvgtIINSnXKFhT6vN/C1SpbZlyeauJnpSiuOo23k3aZrwswVqgu
         641P4oF8LMHH3TnC4WGclN9NRu4zuYMAU23Gn9GTttc9Js1fWAwrzAucnEV/4le7V67g
         cd41lLzPn3p9uwO2vPmh/ebPygApstm4Ytxf1vkH/68KB7kg+UhThRFNxnfW5Yj7lepa
         /SPxIESptb/HrXIO3yxIyOuER7R3+IEeTBhbp3M0I0lzJC3g60iq0I98Uj2cljJh9+wT
         Y6HUGzDxAhGRcpDi24apSSmu3UilpY6Spozc/LjnNsUgo8WSkWjn7xOdCIt7MHlD6x5B
         ddvg==
X-Gm-Message-State: AOJu0Yxh5O1+su4T0AUKHXbN8NldjWw578MkTk1zk6ptED+/Xi+M9DgF
	D4hpX4G3FrM7kFvaymVektWp5Q==
X-Google-Smtp-Source: AGHT+IGJyRN4d5EfONgEzWohOYEXpV8ZyHwIQaIwZgUrXnlaWap5XtP+1N7abHIvI+8NFIgf78FE5w==
X-Received: by 2002:a17:90a:1f07:b0:277:183e:185a with SMTP id u7-20020a17090a1f0700b00277183e185amr407052pja.3.1695405113456;
        Fri, 22 Sep 2023 10:51:53 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id mv5-20020a17090b198500b0027722832498sm76944pjb.52.2023.09.22.10.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:51:53 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Steve Wahl <steve.wahl@hpe.com>
Cc: Kees Cook <keescook@chromium.org>,
	Mike Travis <mike.travis@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Russ Anderson <russ.anderson@hpe.com>,
	Darren Hart <dvhart@infradead.org>,
	Andy Shevchenko <andy@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	platform-driver-x86@vger.kernel.org,
	Justin Ernst <justin.ernst@hpe.com>,
	Kyle Meyer <kyle.meyer@hpe.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] x86/platform/uv: Annotate struct uv_rtc_timer_head with __counted_by
Date: Fri, 22 Sep 2023 10:51:51 -0700
Message-Id: <20230922175151.work.118-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=keescook@chromium.org;
 h=from:subject:message-id; bh=k+Nu3NX5QQ2aJpVbKl87jzPBT9AwnncU9NuJ+rJwak4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdQ3/IWfXym/BBCdmz9yiUCx49Gifs9/mFbU1
 fQjtBKVTPaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UNwAKCRCJcvTf3G3A
 JqAKEACyJ4XXD0xFdoCxlx2T4B9GXHlkr0u0aIlUPFBN3pQD+P3BF5IzIJwgRcoVsqotPdlY/Rb
 wX8bNqO4HGy2JRIm67/oRWnZHaIhamlnh9HrkPLIWDE9xJOWQsvc6s/C2bSFPfQSlumNLC6yl9q
 9yvvYdOuBn9QAX1xEWsHI+uIQ37ZUnFxvQTQ+dAnhXJRTm9T4CDNYs4Ka6Db57dB7DOOLHPiWM9
 8/L84K0X+266nBtXX6Ux21Utcfzx7XbCCUwhJ6SypTPW/gqUiQdvyIw15WnhJoTYMwauzp+W/UT
 SHLxMwOrt8utH7z9acQen3/81bEmaxiofVy6F2ufC4O44RIwFEl7v/RsLxsfn2KSs290t7QaHBv
 WSniGI3Bl7uuhyCpRjCSYs2gppdfZKvcNu5Q0mGxEKay32lJKCjxnjr1tCV0oOBgFdPJ4RzSxqv
 l4Ssrx1TKwTYA8PavonNHCbyYrCqEeuM0wrCUbTW4vGPmRqEJDEWHln9va6TYtNMOstCSaOrIGC
 M+fyocdkfeTtnGViO++fqOgij3SKB4vu73/iBMRv7Kuzho9/d8vSqvIvaYud377MDl5h98k0tHh
 AmHt66ztgM3wW/s9CwFjN3ChnkNnds29tKewAdepJZO2OPp8hTVnD2V2l5d5YBvLTxOWsa06jET
 52pSu6h sWAZ6zbQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct uv_rtc_timer_head.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Steve Wahl <steve.wahl@hpe.com>
Cc: Mike Travis <mike.travis@hpe.com>
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>
Cc: Russ Anderson <russ.anderson@hpe.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/platform/uv/uv_time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/uv/uv_time.c b/arch/x86/platform/uv/uv_time.c
index 54663f3e00cb..ff5afc8a5a41 100644
--- a/arch/x86/platform/uv/uv_time.c
+++ b/arch/x86/platform/uv/uv_time.c
@@ -53,7 +53,7 @@ struct uv_rtc_timer_head {
 	struct {
 		int	lcpu;		/* systemwide logical cpu number */
 		u64	expires;	/* next timer expiration for this cpu */
-	} cpu[];
+	} cpu[] __counted_by(ncpus);
 };
 
 /*
-- 
2.34.1

