Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A34E2C82
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 14:14:58 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id c24so60971068edy.4
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 06:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aiRyUdK+Th3jYryTsLsyc7X3KP1ePUO9wmCn+4PrUBo=;
        b=Z+8iOa0upC3i/zyphaOtyFRqvXOAh4xIReWOwanfDLcuBAi9U1bHB31LDIKeD9OPGu
         gq2oeKrW+7VQK8NmgvhpZuhu3XPitQYBpLWY4ibNBPlcaw6bK15M2x6buZZOEHDi0oUc
         4ZV0//Q4kqfuFm5ZNq0f+FTRS4JsnPBjCCdrOpJ6GU3zL2FsD2fR0Yqgq2mAx3hnVPac
         tq4K8ItBgto3JVoG9jk6nnK8w6e1zRoNMC8k9l71Pe6BzcHwe3x0ftMQry6DVles3tzc
         YFdCl2ynVfEE/R+ZzlaMRgi3gZVBBXSmEKqYYZbtCXWlyFyxotNLpRhS6/PJIOjlNT8J
         t3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aiRyUdK+Th3jYryTsLsyc7X3KP1ePUO9wmCn+4PrUBo=;
        b=laFS9yf1YY7cKZG46j2MfFvHyXUS+pLbhe4NTguPGu7YptXlFTY+Q91/SF4Uf8QbpN
         f1MXABD71g8DRDw7A747rgExxxmvyBs1jBei+5jH/csSBAiKM6IzKuDdeM8kS783N85r
         zkUy2dN8eM7eWx6bUgITpfEEAtKy/c6gC1UuXRXQK3uLen9gY3yscY+ovVhRwA+P9WT4
         8VZzBfqCcy3Wd9JYqvn2imVc8EU351FQJYyUTRKrPETHmXFjhdMPIB35rhYFGXwBDc5H
         g1s2VJg9zpXOcplPmmZn7qFpLTi/G9QydFtAOqGdVZ8qVvNBcemhVYDCTviVwFk6ObGt
         82lQ==
X-Gm-Message-State: AOAM530AsnwD6/mPOhrbqumkT8q81TYFUIHrm8AqKwlVuyMNG+9L0cQO
	Cyjh/sezZrlB3f9hbVAXkXY=
X-Google-Smtp-Source: ABdhPJzS+btJYf02Pr9DsYD4BhgRElcRbIqG+uBOD9x2GfMkuiaz6UX+pzcgEH7AEyad2bdXwMQO7A==
X-Received: by 2002:a17:906:f85:: with SMTP id q5mr17103251ejj.232.1643120096662;
        Tue, 25 Jan 2022 06:14:56 -0800 (PST)
Received: from debianHome.localdomain (dynamic-077-010-144-044.77.10.pool.telefonica.de. [77.10.144.44])
        by smtp.gmail.com with ESMTPSA id lu44sm6292929ejb.145.2022.01.25.06.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 06:14:56 -0800 (PST)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>,
	Serge Hallyn <serge@hallyn.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 5/9] selinux: drop cast to same type
Date: Tue, 25 Jan 2022 15:14:15 +0100
Message-Id: <20220125141422.32655-4-cgzones@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125141422.32655-1-cgzones@googlemail.com>
References: <20220125141422.32655-1-cgzones@googlemail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both the lvalue scontextp and rvalue scontext are of the type char*.
Drop the redundant explicit cast not needed since commit 9a59daa03df7
("SELinux: fix sleeping allocation in security_context_to_sid"), where
the type of scontext changed from const char* to char*.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/ss/services.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 5a7df45bdab1..2f8db93e53b2 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -1452,7 +1452,7 @@ static int string_to_context_struct(struct policydb *pol,
 	/* Parse the security context. */
 
 	rc = -EINVAL;
-	scontextp = (char *) scontext;
+	scontextp = scontext;
 
 	/* Extract the user. */
 	p = scontextp;
-- 
2.34.1

