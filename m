Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1417F8
	for <llvm@lists.linux.dev>; Sat, 24 Dec 2022 05:07:02 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso10406239pjp.4
        for <llvm@lists.linux.dev>; Fri, 23 Dec 2022 21:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MerBzVDlT2AxTGjJiUrWBD5Md5Tk3n59Vk5ImxwXZUw=;
        b=LuPWVyPcDY0EeHN/nGKZuUeGquteYaywGByMKD5ut+p5GzAd+xNezTANybUYOf65n+
         StuU9hvICsB555Omglz9zFn0Kkgg73dbXNlSFhK3HGCWaxErBHoN87qieoEz2jlrOiDm
         QgrpIpieLaTSzw/epFZQWsX+IDzW4E9iXzAMpRHb3gRfXWtch0nwRkNo8C2m1XfeSmcH
         zHUOEsM1ij+aGF9VIf5jjxGn+FZpW2sRjgILtSNbyaJwJNXfK8WUm/QEEBiMva8qNoj3
         mBsxZ9miHW2tuV/JMbUOb25KCZ9qDDb5eGaQAwNuXtit2H0OcFRYglpitXpW+bSOgMwO
         BEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MerBzVDlT2AxTGjJiUrWBD5Md5Tk3n59Vk5ImxwXZUw=;
        b=CcacFP7I2tr7j6Vr/aLux/TNDIk5VJVcIC/bkp8T9zyYbf3ExEJx0VshnQOS5cp9d2
         wC6CJGcCfS5bq7I48IqlO4GFY+8lZ01pJnvJ3+Zq0ZijmO93X81TWwVlWCclMH9RHiPH
         yDTabFiQErw45iFAg/oi1wvXRtEmvgahMx4fCOzQae+Asp5FkmzQUHXdDa9sauiQcfrh
         Uqcwm7izH4oNmh35kpB/V8Qj3pYH0rDy3nmkycPzA+dSwFL9UVHPcsP1S8j+O8ETbKQE
         Jb2U9SDG2MMkODo4qb0V4RnUXwToUXQmUirgTgbekyNiSETGA9mx8UAMH2OfvcRdylPY
         bF6A==
X-Gm-Message-State: AFqh2kqoKVnliwY74FX20qPMViRlVEWNv9jh4dXrHeWuH5bzO5ldLg5K
	74VNpFytspTOMRKKcM2uhTY=
X-Google-Smtp-Source: AMrXdXsZtp9AqKjq6BpzEAsNEm6lScSUcD2f478RcYWvw4R0eKX6CDPbvS+bZir8i+n3Vc7kKonZog==
X-Received: by 2002:a05:6a20:2a9f:b0:a4:ac45:8a68 with SMTP id v31-20020a056a202a9f00b000a4ac458a68mr18826392pzh.11.1671858422139;
        Fri, 23 Dec 2022 21:07:02 -0800 (PST)
Received: from localhost.localdomain ([191.101.132.84])
        by smtp.gmail.com with ESMTPSA id q6-20020a655246000000b004468cb97c01sm3065499pgp.56.2022.12.23.21.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 21:07:01 -0800 (PST)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	akpm@linux-foundation.org,
	geert+renesas@glider.be,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH linux-next] lib: Dhrystone: initialize ret value
Date: Sat, 24 Dec 2022 13:06:40 +0800
Message-Id: <20221224050640.64427-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize ret value whenever 'if' condition is false in dhry_run_set.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Dear Developers:
When I invoke make bzImage LLVM=1, clang complains followings:
lib/dhry_run.c:61:6: error: variable 'ret' is used uninitialized whenever 'if' condition is false

Fix above complain by initialize the ret value.

Thanks
Zhouyi
--
 lib/dhry_run.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/dhry_run.c b/lib/dhry_run.c
index 31a1d442e4a0..be86e5126c29 100644
--- a/lib/dhry_run.c
+++ b/lib/dhry_run.c
@@ -64,6 +64,7 @@ static int dhry_run_set(const char *val, const struct kernel_param *kp)
 			return ret;
 	} else {
 		dhry_run = true;
+		ret = 0;
 	}
 
 	if (dhry_run && system_state == SYSTEM_RUNNING)
-- 
2.34.1

