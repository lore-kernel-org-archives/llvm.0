Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588131;
	b=aKZI8Ghs9u6NGTbyfDwc63FX9B5lt8LdxtVhnLPx8yp5j0UAp/ny4yTRAVDjKbiEp0Y0
	 Gr/Jt9LkU26+W0hnGDuerO2oLZzV2n7t4QUB4TIftmCewd9gKzGIuCYLY69mKhf2glT1q
	 IFEYMegY0BjcPvPK9SCh9O++gXYNV5T8YiNR3sm6P2nJfDIg1sr8LjO0xNKhij3CuZHL6
	 R+HaodU3UdcEJJTXF3PI/zS1AtERGyWG1hckWvCUIs1qiBpvQLy6flinpUeLoA2euD3AO
	 SCZuHDp7cZ8yQEkbQ1yy/K4HCHm5nBnsdUfx2bumvkqyBGF7yewjdbKQAwu02HANNjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Ii0aUK5E1zvYVTunvoPhURf2Mo009cDWRrRFT15CshY=;
	b=D0ck/MM171MAupFpiS/UoNn78UbE58FPSFg14I4yN7ftFKI9EHOvqS+BKPX4dbEPIER1
	 OPwsFg01Z+U0tN4LuC45qa5u4N/MFizEhKRzIYjsfvMQpYeeh5b2kBeUHeC6FyntRPNAK
	 MHzFO0tYbwMcsAuXBsRBYyg+Gk9bfQ4wyHLeB58KcFPd01Dd+J+n5bcVv/AgcsLTX5y+G
	 /iiq5PLRnrpemrM8Uc9B9XTIMXQl0oSwkVB+SAtH3TVWx/MvkGkNC2o2L8oGfkhunQvA8
	 +KiVxebJ9pkDIqhhxSLCahwwQcBbEqgfI7ficvrz4F/H39E1CrITL7vF71Vd9JuG8fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HVdOmJcv;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3733606BC85
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3733606BC85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HVdOmJcv
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1437240eec.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588130; x=1795192930; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ii0aUK5E1zvYVTunvoPhURf2Mo009cDWRrRFT15CshY=;
        b=HVdOmJcvXvz0hKLONI8tNQ1H9zxMc6xE4A0Mi0UAQaWMpINLLk0+6piaA52NbEansX
         lYyhyMvtU2V+u9C7IqXdWDDzx/FtSgf54kb8JcvsumiwyrG3hP/L1nKbN/okIstezGSZ
         peCkLRK4EyGdoBefvQcSPxEH7251hPSwPOMw8e4OPcxcOCFiIsp5NkB2IK60NULj93wD
         jrR3aSB3NLn0vWgSj4W6nAeMo4ZusgEHeeeVYpRXXDkN3lc/RE8DQg3f1qpZDrRfPOGl
         T/Fd0l3h3A1e8412I+lEyO5ZIrT7TsvouwJB1c32dPVP6KmAHEFoBtbapi+ozBKk+e34
         1KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588130; x=1795192930;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ii0aUK5E1zvYVTunvoPhURf2Mo009cDWRrRFT15CshY=;
        b=t3a1zXA3gtmOJvlZ9DGFDyK4MlHDzd46YmKTH8ZGbGvGVBrPhZHDDDfFhKRQd+KoLI
         AVsvoNQXjcpfA4jWMBvowow+qOI+Mz9YffBd3OlE9v03ORaIGnx5tkzUb8ciTyTx4TiC
         0L8i/mhMvAExO8vyj2CCbBp4OWMVouUd8MWXJDbQ044YNf1+qQ1MN5QdmAakxfRl9va9
         pJpxVD9tVXMb1bJfRJ3c7vpykGLEgHZx5q+DW1YJtMJmUdTgb+gYbb/RbLO5w6Foz7+z
         yk+PNLhX3VenjairpOwaX/ut14XzArWCo6ouiR1nEMgO2nLtXYnKj1ypPsgEG9grcREy
         OfAQ==
X-Forwarded-Encrypted: i=1; AL+hErHP1fZlVo1k0WwVZA8Dbf/1ucwhRK1otvqWhVw1WMvZ04b1/OHHnDYe7hCZ4o4bb+Tx3q6/@lists.linux.dev
X-Gm-Message-State: APuU4Z/Ot5orRDlicb3TyDYKvF4cYZUMob9gWHQOYlFamk+9P6lib4SJ
	EBAK2T44/hEZ5uq5gsr2mhh8FsqiW27enf9KtxK3DMaXC1zaluGmsJPki2bzPhICg+lzWnirwl+
	CiJiM1xxbSA==
X-Received: from dycc6.prod.google.com ([2002:a05:693c:60c6:b0:33e:5767:2163])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6407:b0:36d:d7ec:5e3d
 with SMTP id 5a478bee46e88-37967cdd4e1mr2786204eec.21.1794588129561; Fri, 13
 Nov 2026 08:42:09 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:36 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-6-irogers@google.com>
Subject: [PATCH v13 05/21] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 3eb8d095cda0..b50702bac53c 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -Wthread-safety-pointer -Wthread-safety-beta
+  endif
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.1.703.gf848ed807c-goog

