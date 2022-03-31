Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2F5A2D
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 17:34:42 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id g24so716156lja.7
        for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 10:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O2yUjqyfP6+h+Mes/kvWfMJGMKSWOnhuqw368qWMi+A=;
        b=KtCpp8D//XHdYHlTlc/9tVmnBQuT0b8Nsp16rK9T7MsX/94S/9FjQvlz8ChWz35cLW
         e+9yYcmeao2VYcJHb1EhNJ2xjYbA5TpiOCR9QoKq+FY+sR8HwWpmJExLQxCBCJXkvBMK
         Dxc/ZUx2t9dPIkedXA1H8FkwQMx0ncZYGwY8JTirazwscEjRV9pFe3f1+H0vWGSzXUK7
         qo0L2hVtppzk/tjzlxwmxhdhXHr9eVXtOLFZKlo2BFEtF3aqqUuQgdqCVEiuZf3tPux/
         z/TUDvSiIr1hynrWg2LM+vyI8EKSLgFJjmUQ0lNtTS2t+guNX06kO4z7w+XR6K/wQSq3
         h/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O2yUjqyfP6+h+Mes/kvWfMJGMKSWOnhuqw368qWMi+A=;
        b=FscicOqZLtWhVXnxwbQAR/Y39AqBGHp2gWMlBDXCNUcKxqy1LPGVqlFBLiqvw0TvPu
         M+3InqccCzUAqMvQhdw7ltq6UD3HZar/9ymQGMYr4eOV+t/LNHs/h6mOOSkqxnKcJYIl
         mYESqc7PUb6l0sAiD+cTw/NNJ4LJV2UshGv6kCKlRrUJ5sfL8bvTmyReCtUFxn+jnRgI
         oG+QpyW52O45SHYD6u+fPUR1mV1Yi5NCsJAR9HWinBoVMs2GbxV4JOilLQZynHzI9ndM
         VwPOwfmVjKScBK8Vxs624cGELFowr0Wk3Hh5CUEXuQNtQLvZUrEQZHdllJj0/oQi4cyt
         Dbeg==
X-Gm-Message-State: AOAM5301GJeX4J87RYF+itEJdp2F8IqH8lrQJ4DkvJZSWGXx8qXytJHe
	M07pkcdZGnSfZE+D3x1GKY4=
X-Google-Smtp-Source: ABdhPJwYonmMN1vUChjs1jBBB/Dd7M1us26z7440MKCuJVGcRWRU7iJmG1lNC0cu0ITx+Nn7h29YJg==
X-Received: by 2002:a2e:bf22:0:b0:247:da0b:e091 with SMTP id c34-20020a2ebf22000000b00247da0be091mr11141258ljr.489.1648748080313;
        Thu, 31 Mar 2022 10:34:40 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id bd10-20020a05651c168a00b00247fe29d83csm2746992ljb.73.2022.03.31.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 10:34:40 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 5/5] smack: Remove redundant assignments
Date: Thu, 31 Mar 2022 19:33:58 +0200
Message-Id: <20220331173358.40939-5-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331173358.40939-1-michalorzel.eng@gmail.com>
References: <20220331173358.40939-1-michalorzel.eng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of redundant assignments which end up in values not being
read either because they are overwritten or the function ends.

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
 security/smack/smackfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 658eab05599e..9e61014073cc 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -1192,7 +1192,6 @@ static ssize_t smk_write_net4addr(struct file *file, const char __user *buf,
 			rc = -EINVAL;
 			goto free_out;
 		}
-		m = BEBITS;
 		masks = 32;
 	}
 	if (masks > BEBITS) {
-- 
2.25.1

