Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A45125AB
	for <llvm@lists.linux.dev>; Wed, 13 Mar 2024 01:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710293116; cv=none; b=cFBJF1B2cSoFTSATRm9SWLnZlZvc97jQeK4VmSrZKXmPhbKPORqQdnbm4iWFvA/zi8XUlCNmkhguyuDHEuM8Le8bARS/Fa9VqMUPDWmyEg77ksRpJxfis+Ihu50V0fdW77BrrgsgAN/VIKxPPuMKUDDb/H2eV18WVQXy/BATiu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710293116; c=relaxed/simple;
	bh=BdbG0yYlQpcAJTV+cb1BRObS/3sDHMAKLat6xu5MQUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sP/kog6CMidaRE+e3YTCQWRhuSyB2JXyZW9w+j5cAcumavWtc/4HTXeJf6ojukUhPoMulrSKYg2imb8lmahOUGatYDaoHqIyvUiVWX2/qdk02ilwh2vKhKWDG7uTMlXArT4lixRyK4q5QFbYxZ9R/a45XkXkhSMUFiU4RbAX/bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=rSzFhGXr; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="rSzFhGXr"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-68f41af71ebso4404326d6.1
        for <llvm@lists.linux.dev>; Tue, 12 Mar 2024 18:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1710293114; x=1710897914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgoJ2Cj2+UUPtAnwZcQw+JcHc1DVxxL4Tm75yla0jg4=;
        b=rSzFhGXr15hpD4i8YUIxlhUVaYzHyz+JmpRsKk01C4o8U0ZURa+y5ej+OYM9b6wuE+
         nSx6jBk13KN04+9rpWu13p/8J99eRrgLcG/kNbFoBGa+hOxys2dS29ggMNTXhQRU3gTq
         65u4PsOEO27bxiRIHrpTWHhKAznjq8YXc9O+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710293114; x=1710897914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgoJ2Cj2+UUPtAnwZcQw+JcHc1DVxxL4Tm75yla0jg4=;
        b=f/cECGiGfRH0s5zTMoJP41+pMy9SwusNnjmWTWxiStQtSCC61Jv4s6pBmyvkYJnnAm
         cE8tws3TGco+qYlbWBaxXRt8z86Uxt2fXOgiohe7R3hFIYj9YnrWuAM5/p12zxiIGZA/
         2PcTPTgqz9jDJPIoO3FJfRqAcs0s681apH/8A+gNfsOIHCGjbwqxxA2qOZKup1xxPSP6
         EiR2zfbiSnugGMjKiAu6aomNsutdzW/WyfKZ2X7nedd4ny+7s7iXzPaVBmnnbQMMvhKu
         sjlhXWrskhd7lr5evc/CrfylTdwLTyBhlNWf9HOBfMOfatPgCRNzywR0VHUgNw76l0vx
         9CFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqSwmzzho+ZVfHFk8zEYPLpf8S9qi/VJkVhIWYuhoVbVFNGshZhA5pkbBdVNlqRWUF+fR2o943egvR8dIEGIZ3YBePWQ==
X-Gm-Message-State: AOJu0YzqvGAI3erR9ePNSltyZf5vgCmoBQ1i2tZqXKQB3pt+fCPzgb9w
	QQsVGZ3q6WeKSZ6auL83qRfciNh8z3QJp36g1ABHjJg5CR2+h1+0KPHBrlmAR68=
X-Google-Smtp-Source: AGHT+IGrnT4NaK5dgEfbg6BsheeR1Bp46xKOKlinXlRpGxwicEeQcbXPiAZiOr+R4nhkDUtlf00cVg==
X-Received: by 2002:a0c:ecca:0:b0:690:9a95:d8f9 with SMTP id o10-20020a0cecca000000b006909a95d8f9mr1796667qvq.2.1710293113824;
        Tue, 12 Mar 2024 18:25:13 -0700 (PDT)
Received: from joelbox2.. (c-98-249-43-138.hsd1.va.comcast.net. [98.249.43.138])
        by smtp.gmail.com with ESMTPSA id u9-20020a05621411a900b00690314356a4sm4162132qvv.80.2024.03.12.18.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 18:25:12 -0700 (PDT)
From: "Joel Fernandes (Google)" <joel@joelfernandes.org>
To: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Suleiman Souhlal <suleiman@google.com>,
	Youssef Esmat <youssefesmat@google.com>,
	David Vernet <void@manifault.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	joseph.salisbury@canonical.com,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Phil Auld <pauld@redhat.com>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	llvm@lists.linux.dev
Subject: [PATCH v2 05/15] sched/debug: Use unsigned long for cpu variable to prevent cast errors
Date: Tue, 12 Mar 2024 21:24:41 -0400
Message-Id: <20240313012451.1693807-6-joel@joelfernandes.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313012451.1693807-1-joel@joelfernandes.org>
References: <20240313012451.1693807-1-joel@joelfernandes.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids compiler errors seen with clang:

In file included from kernel/sched/build_utility.c:72:
kernel/sched/debug.c:532:47: error: cast to 'void *' from smaller integer
	type 'unsigned int' [-Werror,-Wint-to-void-pointer-cast]
debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &fair_server_runtime_fops);

Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 kernel/sched/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index c6c0120ff105..2590041696bc 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -516,7 +516,7 @@ static struct dentry *debugfs_sched;
 static void debugfs_fair_server_init(void)
 {
 	struct dentry *d_fair;
-	unsigned int cpu;
+	unsigned long cpu;
 
 	d_fair = debugfs_create_dir("fair_server", debugfs_sched);
 	if (!d_fair)
@@ -526,7 +526,7 @@ static void debugfs_fair_server_init(void)
 		struct dentry *d_cpu;
 		char buf[32];
 
-		snprintf(buf, sizeof(buf), "cpu%d", cpu);
+		snprintf(buf, sizeof(buf), "cpu%lu", cpu);
 		d_cpu = debugfs_create_dir(buf, d_fair);
 
 		debugfs_create_file("runtime", 0644, d_cpu, (void *) cpu, &fair_server_runtime_fops);
-- 
2.34.1

