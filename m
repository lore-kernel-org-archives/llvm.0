Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2B53B28
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 14:22:06 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id lw4so7621075ejb.12
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 06:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TKbGn4VnF077K/SNeC7jeA3ji+PgaLkDsV1uHuyFEfY=;
        b=fMCq3oJKasAOWtpeLVeqCXkK0BfuPeMwW6ID7eddz+BiIEjdIGBx+QMb2Rwiy7u6zC
         FF9EHKhjOBvuJb0HNkSoagqHn7e1Wd4wMYcVlXcLEDrRpAq5s4AtlccEhFsHmavLbQji
         lQicA5GQ4gceDNgEzhk1k7qBVcv0+8SFhko4adSuKdcmgcqvQfuHOG+yTwySBgHgidI5
         ehDDLTsdvSESJ4pSX+eNrveJaPF2kpwWXUiZXsClRvUy8Q9L56qxIboJQpsAHovYCmoF
         BT8V7UegXGkcEOhKqexxf42jeeDprq2CRYAleWdRN9iUjGtrzAClxuwhwph9oD3Ht5/I
         nOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TKbGn4VnF077K/SNeC7jeA3ji+PgaLkDsV1uHuyFEfY=;
        b=MPa8v9T/z/5uWMhpBkyUuwAOHaZNGfqagcVyAg0GktO7dWERXSTGPJCKHoOGuTJzDS
         fujy7YlNDMkSuf9LA2FhXvnVgqZECp68QbTK4Opo8mIvGI4QdxzIfFCjihTj0ksDLk+z
         88NsD78JrGTPHJGc2lOm13dcD3u4q/Z4ahugGYJN0tIebNL5j5YtTmQK0ggIemQmaDIp
         R+Ym6uQnUUDJ8cPuLJsI9SJV2iuCiLOyD2PKQEWJIRb+eoNraTevr04t4c4SJ3nugXqT
         tMvuUc5spSdaq8czUQUkqBoTotT8AkckGcFebWYkLVkipqHcs/e4RYAnfWWE6lKMw1bw
         VAYA==
X-Gm-Message-State: AOAM533B/E4L4FSfBs1l4sMNDrm9+aTGjBXiBBj5Jm2zNHWfneNG5zVs
	HVe8VIlxYfOk84t5Ygkj/EQ=
X-Google-Smtp-Source: ABdhPJzHeZ1hq4tKV6RQC0asfUmX6vcSGs/AyrEZloRCSL1Vm0if9C3k5Ms1jH8RgaG5n8S6RYs+WA==
X-Received: by 2002:a17:906:c282:b0:6ce:369d:3d5 with SMTP id r2-20020a170906c28200b006ce369d03d5mr2584779ejz.425.1645107724616;
        Thu, 17 Feb 2022 06:22:04 -0800 (PST)
Received: from debianHome.localdomain (dynamic-077-001-066-240.77.1.pool.telefonica.de. [77.1.66.240])
        by smtp.gmail.com with ESMTPSA id a13sm578436edn.25.2022.02.17.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 06:22:04 -0800 (PST)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Serge Hallyn <serge@hallyn.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Austin Kim <austin.kim@lge.com>,
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/5] selinux: drop return statement at end of void functions
Date: Thu, 17 Feb 2022 15:21:29 +0100
Message-Id: <20220217142133.72205-5-cgzones@googlemail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217142133.72205-1-cgzones@googlemail.com>
References: <20220217142133.72205-1-cgzones@googlemail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Those return statements at the end of a void function are redundant.

Reported by clang-tidy [readability-redundant-control-flow]

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/hooks.c          | 2 --
 security/selinux/ss/conditional.c | 2 --
 security/selinux/ss/ebitmap.c     | 1 -
 security/selinux/ss/mls.c         | 1 -
 security/selinux/ss/services.c    | 2 --
 5 files changed, 8 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index dafabb4dcc64..1e69f88eb326 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3284,8 +3284,6 @@ static void selinux_inode_post_setxattr(struct dentry *dentry, const char *name,
 	isec->sid = newsid;
 	isec->initialized = LABEL_INITIALIZED;
 	spin_unlock(&isec->lock);
-
-	return;
 }
 
 static int selinux_inode_getxattr(struct dentry *dentry, const char *name)
diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
index 2ec6e5cd25d9..c46c419af512 100644
--- a/security/selinux/ss/conditional.c
+++ b/security/selinux/ss/conditional.c
@@ -566,8 +566,6 @@ void cond_compute_xperms(struct avtab *ctab, struct avtab_key *key,
 		if (node->key.specified & AVTAB_ENABLED)
 			services_compute_xperms_decision(xpermd, node);
 	}
-	return;
-
 }
 /* Determine whether additional permissions are granted by the conditional
  * av table, and if so, add them to the result
diff --git a/security/selinux/ss/ebitmap.c b/security/selinux/ss/ebitmap.c
index 61fcbb8d0f88..abde349c8321 100644
--- a/security/selinux/ss/ebitmap.c
+++ b/security/selinux/ss/ebitmap.c
@@ -359,7 +359,6 @@ void ebitmap_destroy(struct ebitmap *e)
 
 	e->highbit = 0;
 	e->node = NULL;
-	return;
 }
 
 int ebitmap_read(struct ebitmap *e, void *fp)
diff --git a/security/selinux/ss/mls.c b/security/selinux/ss/mls.c
index 3f5fd124342c..99571b19d4a9 100644
--- a/security/selinux/ss/mls.c
+++ b/security/selinux/ss/mls.c
@@ -156,7 +156,6 @@ void mls_sid_to_context(struct policydb *p,
 	}
 
 	*scontext = scontextp;
-	return;
 }
 
 int mls_level_isvalid(struct policydb *p, struct mls_level *l)
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 2f8db93e53b2..6901dc07680d 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -529,8 +529,6 @@ static void security_dump_masked_av(struct policydb *policydb,
 	/* release scontext/tcontext */
 	kfree(tcontext_name);
 	kfree(scontext_name);
-
-	return;
 }
 
 /*
-- 
2.35.1

