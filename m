Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6692797B0
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035472; cv=none; b=sn4d4EHBA+lZScSUz1DJhbW78pDMP2f5CQ+4DnFAeWMXufFmuOG9EwdoTapgGKYrnpUDabKiQdQBqcjLYKsbZ7jZfleDs6/WI95Y6ZDMPWeQMShdxEvhuZLuuqJ/GlAbOr/JWtsU4rU4uwCppqFjAwVmb8VUt8638+ITqL5DFXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035472; c=relaxed/simple;
	bh=3zq+IDnOKZT0hU1YInek2TZNl0fl0bkC+6BhqcfPYRE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nLBh2kA5RfnEUEMLH+9w4R6BGfggDVQp9wx+TGk8hDgg6ImwqQXmWpA9n4KH71Y0uL+C2ClEjK+PvNCATFF9Vr/PvUeOph+ZXpVYlHdTLR63RpxppQbxxK8XtpFXOXjsPp8etCr64pwrEFe3g6/PbDx+V80iPT5HYDjgM7l5xwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IVPWonPF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IVPWonPF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22650077995so1396815ad.3
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035470; x=1746640270; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MH5R01x49/QwgHTF4kBLHXHZXH1w/fu12hpgiU8X9b4=;
        b=IVPWonPFwDtAdoJyhBJEy03z0pZS2cRMsLARTWDwYd0xvT+bJU9A71RljG4MSeoTrL
         gE3sdJ1vyEXXpzoWAubQYz936ctlh/B4NtjEmHPM6LjVsAVfE7HzuIN27BsMP2ItC6hG
         hpG0Aicu2SHKbmhmgEL9KkTEvpKLERuXZPoV5ryjrTNMuSlFQmjqLupPG4F/EsM0vGsn
         sRW947EWIlvJhuDYNiVqbcvdd923/0ALYli9KQg464qEgaJjDqnZnIW4A5DO070BkZLV
         r9ZjhGItmZDyKmZDbconDOjYIh+jJwKqTS5m4+JvEhkpxXhogoqFdjhUiTD774XaBk1e
         MTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035470; x=1746640270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MH5R01x49/QwgHTF4kBLHXHZXH1w/fu12hpgiU8X9b4=;
        b=IGmOBBSDHvpyDjzPT34fi3MWruqDKOj0I8Ay4tnkAc3LFOCuAE9Oo/l+Ou1S3XERdr
         ehwoBczvOhIyFvO97leeJnDpshCwNPSrJUPWeKGtf4YxNARoXO8HdYYwW7+zf+gSNnOr
         spI+lehfMocMjNhb8HjM4Rgc3Wi3sOpHq3TnYuRlGlWCLOW6Yrx7rRrYQ9tWYxZDFTEa
         MZ6TZiTRaIkIihlRU+FMYEL4O8jc9rFMUDRmH4VWDU0vu/J7uX3FlENJ3A/rt7Jd/b7o
         Mm2lZq07jLaWPC1fL5uXFnX7QX5bxTkjibAPxFYpuvHUT4WltSLb2FpWyOLMyPSULS6I
         hdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbB1Tq2Gczip0r/prIhnk4pz4AioSoCs7ZJsSaCr71cOElvzgGxS3IGg+NJtCxPULEIyo2@lists.linux.dev
X-Gm-Message-State: AOJu0Yxrr3PPO+oaPdy/sggU29LO9qAq2W9P5jGvQQYOFcfxpw7ec49l
	VzYici4vpNXKQ0/f80kXJXBVWIYXGzHg3ixLyqdYQ6pd/vWCuNkmVnmJequA8gIzAIfcWP5SsXD
	1uXZW3w==
X-Google-Smtp-Source: AGHT+IEn60x0bx43W5CWnBKmy0OZf6RSYbimZ3i3xC3fCl6DnVc73ipLr6BDAlwtbtQmzWBsuGzN/W9i5K4j
X-Received: from plsl18.prod.google.com ([2002:a17:903:2452:b0:225:e051:fe46])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2290:b0:223:517a:d2a3
 with SMTP id d9443c01a7336-22df34ec0b0mr65059825ad.17.1746035469944; Wed, 30
 Apr 2025 10:51:09 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:49:54 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-7-irogers@google.com>
Subject: [PATCH v2 06/47] x86/insn: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/arch/x86/lib/insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
index e91d4c4e1c16..5fa8697498fe 100644
--- a/tools/arch/x86/lib/insn.c
+++ b/tools/arch/x86/lib/insn.c
@@ -92,7 +92,7 @@ static int __insn_get_emulate_prefix(struct insn *insn,
 			goto err_out;
 	}
 
-	insn->emulate_prefix_size = len;
+	insn->emulate_prefix_size = (int)len;
 	insn->next_byte += len;
 
 	return 1;
-- 
2.49.0.906.g1f30a19c02-goog

