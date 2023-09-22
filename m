Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734834447F
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:54:39 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6910ea9cddbso2084300b3a.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405279; x=1696010079; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IjeaV73hiIttYIrl5ELxFpexeQoEM56r8iWVxqTuQ5U=;
        b=a/gXlDV5qdbgOpgIa+3soflniYyg3rXX+xctJ/Twh8whcnoLLwxJTNnyAUaubNYQdh
         3VQu6iToNkurSyQw8FYyH15UzzqOQ+hjxbTPf9uOrzKfoF76LXwlC9H4ZkZCEJt6o3WM
         CyW8jYyoUh/ql4dGpxVpFOcykdQvlnJKFDnmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405279; x=1696010079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjeaV73hiIttYIrl5ELxFpexeQoEM56r8iWVxqTuQ5U=;
        b=VbrOCshJii2MyqanF4OPT+bAPBFtLwi/NtXqSH0VQps99VdMzB9/3EwgTsuOQa4lBy
         NxOb3czIUwX2N/b5cp59zis5hbzvRH/B19h7MBnfNkzzjIMLbx90kSnPraTq1d3tLRYB
         zoPnSaDIlj5cbQ8lnWU/zqVqNdYSdvVN/cWtoRYQn+GZG4LUXIIPfYJsOYlJOWL+lW/U
         gWGYo+5AxJkt779iiRLUbv6+OeDZFs1QAbSN6bszgC7mDWgV+NxuW6nd3cDLu7nmFVkb
         C7biLWQ2cqmhVYYhyb8/BvlidmupwY9KiOPU+qqxws8MmkXIVxLZLc/E0wB72ScSlYWI
         6rjg==
X-Gm-Message-State: AOJu0YxmJtKba3sYsjmKOcOfa8k+O/qBdzjcQ2XqQGFn+ms/CP6f+FoA
	tDBrBupT+skunPcfOZE8OnftxfNhzaCQa7WY5DP7Yg==
X-Google-Smtp-Source: AGHT+IHR5DLHlAeeoZk+sHs9Kb4LlO3DRZvk0xSprFEwkdqeU0Cx16wif7KblQwQ5V62iXm93hIcYw==
X-Received: by 2002:a05:6a00:2e8b:b0:68f:f741:57a1 with SMTP id fd11-20020a056a002e8b00b0068ff74157a1mr213789pfb.7.1695405278835;
        Fri, 22 Sep 2023 10:54:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f15-20020aa78b0f000000b0068fece2c190sm3458942pfd.70.2023.09.22.10.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	platform-driver-x86@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] platform/surface: aggregator: Annotate struct ssam_event with __counted_by
Date: Fri, 22 Sep 2023 10:54:37 -0700
Message-Id: <20230922175436.work.031-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=keescook@chromium.org;
 h=from:subject:message-id; bh=T+Zr3XTl8UeXAf4xTZbY2EHoO0SlibCfAP1NuiNTWSw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTdfq2Mz6uuhqmtzfnfg1vj97+JF1Hg/qqop
 +JwlT8D5B6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3U3QAKCRCJcvTf3G3A
 JpoyEACg+ayR4fFaWv6vAB3d2B+WBwdtg4B8DiP1WncRmwCPqBiztrC21miRe7lLEDE2UklgyOx
 PduUHkVhaYeFRLawXsRDLwgFqNXykv5uD28potGGRWp+CJI+jxz7cbwO9d9P4EKNkqZiyIVe1T7
 0uBJI+D/u69nR22ukFy36hxV5tXpLQvE+fU1RL+aspMbseJ60vj/jcDZ0GSYxMWT0UUPgsSUTLw
 Z6q9BwnLJDgFOpu3iUjPIlfWebKYQSBgSu6UUiyxsqas20/R8nxbHf8eB3QWvLF1YU4AMb5wJX4
 P/1RH2ZzTqV/biVWdGCMqcosrw/dnGRiPL/2jkn7ilNfe4hS265oaBsBi7Ufgsia/5eMRkRILL5
 YClvrIczbBrRyVxhEVjGEyRvtU5tXctwHR4ttx33tlk757l0m5kWBwrffVRwXlJP47Vuj13Lfk2
 3PCS9WmNPjvSPqd8u/91V+0+QJifuf+8KGd8zW40biiTd3HPHhcXL5ZBBmQqxs6aUq1HayKEu9j
 52zVqoAm0XHA1s/2cB1xNQoUlF/d910cvrK9gZTAUclWMUdI2JQ6j7b0QlJWDPUhtHU/LaOhbda
 lEi6F8d1IWD/7NGwOStb2so96w7SstbIDfpJiBhm3VuI9qJuOrXoBpG3vKUxPXfSJ4bKZVdHgxX
 tW/IFkU LyR9VPRg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ssam_event.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Maximilian Luz <luzmaximilian@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/surface_aggregator/controller.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/surface_aggregator/controller.h b/include/linux/surface_aggregator/controller.h
index cb7980805920..5b67f0f47d80 100644
--- a/include/linux/surface_aggregator/controller.h
+++ b/include/linux/surface_aggregator/controller.h
@@ -44,7 +44,7 @@ struct ssam_event {
 	u8 command_id;
 	u8 instance_id;
 	u16 length;
-	u8 data[];
+	u8 data[] __counted_by(length);
 };
 
 /**
-- 
2.34.1

