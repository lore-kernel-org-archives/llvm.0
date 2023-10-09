Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76A18E24
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r0KDW2IY"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d815354ea7fso6369458276.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876791; x=1697481591; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3F7gnNpkmZUAErgbCdtUAHzB9Tx2qchcvlKXuBK3uQ=;
        b=r0KDW2IYxXZuhqWy+MoJMs24+trtv2cDjmA5RoNSEuNcLxB7WAMojqruerswOk+dCW
         vbHwhsKaKXdcjZKSIRr9e0m6X8MrVXEWxjrgMGvZ2twlw/ZbryBrn5EHdUlFzUd2LNmk
         cvQbPe8MdlPHrtjuRyVTwcJkcCy1ubrcKk8tI06+45Xf7loI7zYyci3Qc0rPqWMI8U2R
         OrsFHID0ub5dVgfXVenMaUNnEhuIroeGfpq/2ItPPdCxEPLvbsYaG4ABXZH3iPzoRw+K
         +M0rB0pfJbCaHodxkfy9/KexQcftetoC6PfC1lOpffhTy9uw8OqLy0Lf7iOTXs6oco+f
         4cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876791; x=1697481591;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3F7gnNpkmZUAErgbCdtUAHzB9Tx2qchcvlKXuBK3uQ=;
        b=EKtUItWK7ALAf5zRbnLqOSXZEplt+kdGFLiqhXXb8CiwyEb+qWBkMSiUeyGTBgq/S3
         O/wFHfmF14Q8WEtpcsY3qLcdR+n7WHHbxhxlWlI4BuXhjqGBd5Qj2I+UWPLu2x6dj/6e
         25/ZJeBzFW2s/R+Qd/7XmCAbUTX0jE4c/gcOltGB72uDn9YiJxThqFeRrr5bPd4xFgQf
         lhn49YKljX/iOL/OH84wvb2PplctmHQoKtCtLYaZ33rdI4wEfhwpb6J26qfw/JzCwZDy
         F4hTgfu39sld8GF7EclOyef3eicCA0x4uCvnDvvAIr1yEox25ptDFEmfiKLCatylfs7e
         LNbw==
X-Gm-Message-State: AOJu0YzECRZOyxBnh7natzzaBJsKb65QJoZOSMv1hTI81QOUPMMDwITb
	umaAwVDaNwVw4qPncwDQEjLDCozSdNxV
X-Google-Smtp-Source: AGHT+IFJYyKzaVJZa6OL3+dH3Iw7A/PwN/dNbmHDZ9SeFI6LX4XiAP/rf39SS/umzU7lUH+6FV2vZLeRvyST
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a25:f816:0:b0:d84:e73f:6f8c with SMTP id
 u22-20020a25f816000000b00d84e73f6f8cmr234275ybd.6.1696876791493; Mon, 09 Oct
 2023 11:39:51 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:12 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-12-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 10/18] perf hists browser: Reorder variables to reduce padding
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ming Wang <wangming01@loongson.cn>, 
	Kan Liang <kan.liang@linux.intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Address clang-tidy warning:
```
tools/perf/ui/browsers/hists.c:2416:8: warning: Excessive padding in 'struct popup_action' (8 padding bytes, where 0 is optimal).
Optimal fields order:
time,
thread,
evsel,
fn,
ms,
socket,
rstype,
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/ui/browsers/hists.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/ui/browsers/hists.c b/tools/perf/ui/browsers/hists.c
index 70db5a717905..f02ee605bbce 100644
--- a/tools/perf/ui/browsers/hists.c
+++ b/tools/perf/ui/browsers/hists.c
@@ -2416,12 +2416,12 @@ static int switch_data_file(void)
 struct popup_action {
 	unsigned long		time;
 	struct thread 		*thread;
+	struct evsel	*evsel;
+	int (*fn)(struct hist_browser *browser, struct popup_action *act);
 	struct map_symbol 	ms;
 	int			socket;
-	struct evsel	*evsel;
 	enum rstype		rstype;
 
-	int (*fn)(struct hist_browser *browser, struct popup_action *act);
 };
 
 static int
-- 
2.42.0.609.gbb76f46606-goog

