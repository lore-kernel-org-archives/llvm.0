Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56C1851
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 01:31:49 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id b21so7366546plz.7
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 18:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Md4huhpYv1cDGpWpaL4nk6AFG7O8XO2LLDYE/HfBOfQ=;
        b=GtXQcOEaSjiHypAGEQP3Oaz4i1QxNHIr/TOWCmkPQwiSlanvLq2mWufPtg1UKhNiN8
         Nz6Qf+4Kzd0oBRkceGQHmeeoj9heetXuSkukKCYCKL57iOmxv0SkAixm+wDJndp/UWsu
         0/nPvNsKTqulkjxjaeT65hlo0iW83UMDv6UCt0lRn+5GYMNWRTr8QD8szKivfBW0T+l/
         UPx56CLpnGDFu+KXqsyK5kjoZkshlqUf/LB/w3MwRZsSPRL9iCFUA028/fRjtdn63U05
         c2k+w92WEYy1ENrWiUJx1Xj4cBVm+GMMouL52RPRnjNJbCKompK9t+XiqsLchnCsVBGu
         wQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Md4huhpYv1cDGpWpaL4nk6AFG7O8XO2LLDYE/HfBOfQ=;
        b=xoeN1zRogyo7oHHeMlRQGj9fIZaJ7S7K0/i8JPsXNEgzI1Cz210v078iw92bXpsabH
         7fDKVbM+npQWcTfcbMn+YmmpLZM4AA9JblV8c5dfjQGODv0NKfGwobyqmPYU1sjb1uBq
         kuV4OCKgLBds02wfcRugn1yI1AOyZT0PiAqD4lvyqOJEk1p9zftMQPbC7hxC4ppcaGdP
         43XZD/y2KSsnumIZFFqZE9PmsRiZpdrIq0D7iCHxb0Flncckf+b6+xmOaODaTakPLftf
         hKHnKAnjD7V63xSzqzP+W7mBVupDzsp1aDWDXDZGON9Jhh87LCkj4ZQf/FY1HKCskb+P
         T9HA==
X-Gm-Message-State: ACrzQf3a/NILXt2fhUkRV+dPP1KQ0Nn1yLpBdb7BIaMqvKyKdlwgSJLH
	JUE3mI/fYRK6DzBifUjUtwQ=
X-Google-Smtp-Source: AMsMyM4TId2/V19iHXuApj/eDS6jK5Ogd41FeWKLsKitiJifNKgGeREKbjG9L+xMlSw6eu2WcgF3TA==
X-Received: by 2002:a17:90b:3b50:b0:202:9e4a:2fdf with SMTP id ot16-20020a17090b3b5000b002029e4a2fdfmr1049333pjb.240.1663810308870;
        Wed, 21 Sep 2022 18:31:48 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id u1-20020a626001000000b0053b9e5d365bsm2804315pfb.216.2022.09.21.18.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 18:31:48 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: acme@kernel.org
Cc: mingo@redhat.com,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	namhyung@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	andrii@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] perf llvm: use strscpy() is more robust and safer
Date: Thu, 22 Sep 2022 01:31:43 +0000
Message-Id: <20220922013143.232870-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ye xingchen <ye.xingchen@zte.com.cn>

The implementation of strscpy() is more robust and safer.

That's now the recommended way to copy NUL terminated strings.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 tools/perf/util/llvm-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/llvm-utils.c b/tools/perf/util/llvm-utils.c
index 2dc797007419..3e218cb8f0ae 100644
--- a/tools/perf/util/llvm-utils.c
+++ b/tools/perf/util/llvm-utils.c
@@ -80,7 +80,7 @@ search_program(const char *def, const char *name,
 	if (def && def[0] != '\0') {
 		if (def[0] == '/') {
 			if (access(def, F_OK) == 0) {
-				strlcpy(output, def, PATH_MAX);
+				strscpy(output, def, PATH_MAX);
 				return 0;
 			}
 		} else if (def[0] != '\0')
@@ -99,7 +99,7 @@ search_program(const char *def, const char *name,
 	while (path) {
 		scnprintf(buf, sizeof(buf), "%s/%s", path, name);
 		if (access(buf, F_OK) == 0) {
-			strlcpy(output, buf, PATH_MAX);
+			strscpy(output, buf, PATH_MAX);
 			ret = 0;
 			break;
 		}
-- 
2.25.1
