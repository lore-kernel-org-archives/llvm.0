Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7225E135A6D
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708108309; cv=none; b=rmqJbrVuEIX1UcoV0rFgTloqSXc50kOn+dEA2b60rhhdwCBFniuneDjRCeP5CLHyOkquHe1Qy3v/sFkjFtPF2zZu8WmH83+9VKkpyofsgCW8OQ5j02YlpgKVxj8l9DsO1JavJis7Daz/ReTH1I2zyImbdCXkUJPb4M7JMpap2wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708108309; c=relaxed/simple;
	bh=BdbG0yYlQpcAJTV+cb1BRObS/3sDHMAKLat6xu5MQUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PgazQosYf2uLBI0HUYVo5tU2YljT/ngqeYpGGqxdmlI3T9YK7fsGrMvydSOX3qcvdUIl9/obKAZ5ZlIXtpc0OJ5igUJL2/C+upoBp5vJf5uRbnsoBsO5sdM4CinlUjtI58lGh7VP2FEzPLj4EsR+kvFKFVlGzaCIgp1Uf2GEsRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=RvseacXH; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="RvseacXH"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6861538916cso13080376d6.3
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 10:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1708108307; x=1708713107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgoJ2Cj2+UUPtAnwZcQw+JcHc1DVxxL4Tm75yla0jg4=;
        b=RvseacXHO0BeeLS0SO4n8HHGXdEk+JuRiyKGlez2Hdth+m0nycOU3dL5Shng/6saeo
         x5f+NhvuSPiScRRonj3/de9KzAXiG+08kRo1kZf7RHjzFbyyhtccF2j/3mov5kLmB7tQ
         RZGbNdVKQ/6XYIQ3UixFigXom8FNfuTlcsZy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708108307; x=1708713107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgoJ2Cj2+UUPtAnwZcQw+JcHc1DVxxL4Tm75yla0jg4=;
        b=YDmeo2+TDuJUTWL7mzwFbHLhno46FC6EjybzBfOlF27YeEuyQ3KZyG0I1c44Y084Xq
         AlQxMiDXvFCGIQZa/VzLc0PJlENhHPSkQ42clNf1sU+1cgLwt4dS/MEqTJMGMbc+hKn3
         e+e13ECz739BcD+tY3Go8f/fLX/P1tqmcdQmg2pw1CFDeEkqQR4jPBlf01gJLpwG4Qc0
         3Y2CBnn1u8rjJqFBk901A1Qy69QCCkDrgLTfovTiuGXySNlrBm24FLJw74xmWJXygQVU
         ztgoYogCIABqGqr36wxWxTFimoUCuynBvpdm9WEVxueLVjKsaD1WdzZjI/8QQsJMZZ74
         Wmhw==
X-Forwarded-Encrypted: i=1; AJvYcCVVWueCRZci6Xk79iER8M107/5q2Ty9KqH2lucKapDdPSQsHh7YsheiL2boZ+i/epzKdTwmIkak3TElf5qMlUR50CLBzA==
X-Gm-Message-State: AOJu0YzYy/G1kdW1MPJjPteQI4hUcMngjpl/xB/jFuKssuETKiwt2jIa
	d5uqX4hN6iD3OOi08RLtghTtbIP6dSl33tDMni2Ti6YIcO3dQdYvANwkif+wOTg=
X-Google-Smtp-Source: AGHT+IEgm/Rt03+CeLnQ0S8r32mOvp7WezqLoTo4VJlM/CGcCwSRr9+Ve15KD4TNaat1Fb+SopCMdg==
X-Received: by 2002:a0c:f0ce:0:b0:68e:f036:f5dc with SMTP id d14-20020a0cf0ce000000b0068ef036f5dcmr5456748qvl.15.1708108307279;
        Fri, 16 Feb 2024 10:31:47 -0800 (PST)
Received: from joelbox2.. (c-98-249-43-138.hsd1.va.comcast.net. [98.249.43.138])
        by smtp.gmail.com with ESMTPSA id nd13-20020a056214420d00b0068cdadb5e7esm159722qvb.31.2024.02.16.10.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 10:31:46 -0800 (PST)
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
Subject: [PATCH 05/10] sched/debug: Use unsigned long for cpu variable to prevent cast errors
Date: Fri, 16 Feb 2024 13:31:03 -0500
Message-Id: <20240216183108.1564958-6-joel@joelfernandes.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216183108.1564958-1-joel@joelfernandes.org>
References: <20240216183108.1564958-1-joel@joelfernandes.org>
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

