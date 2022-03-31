Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759C5A2D
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 17:34:39 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id m3so385421lfj.11
        for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 10:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uGpI0S583UU/uYnq20CAy/qk3XmWiJWZUHQ3a1WXMdM=;
        b=PYSG8ddN405RCUgLDBXXCtCIC6HpTYluXuPt/057e2V4DclMUqXQwQvJ0zMbZvfFyr
         aAm/PuvMFBfbtSrsvGUc2lHct1QOsEFwfq27OlMtn1ImHgMdPZQFrwWqsuyt4gPuCSgD
         g82mLZH8LMMC4oBTmrxinWyAqshonbOqJAsrcaa69OwwsB3ec8O2SHYBv54oD45/77uu
         qapIbXjqKW3jTv13KLf0DfBWoItNI6OgItAEQI/DRV71d7Ck8pEvzrTrydLLX1/mLUI7
         bg8YVAzg8KBNzs4Awq2Aw6lpjpg/CuTtzqfwQ/mF9qHR5DmVi3EbO38PuKPazR3/a3fO
         m38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uGpI0S583UU/uYnq20CAy/qk3XmWiJWZUHQ3a1WXMdM=;
        b=oKCil8rTfx9CZ5VrozWwY3q9onA+yH6mrTduLCrZUjskSvBNk0zixMeNk56XKXiXT9
         JxO7xARJP/sWlkoDh5TjnXJKe13o+FV5cmX2BtdK+eT5S7T5DdD7nq7DTwF/81CbrRSh
         60KspIZDBBPbix+I5wJeGw6xPvlDu8cfnU3P41OeB2RaAdK9rW7I23X5rTLVllfXNBQn
         +vUOqHsa1DB2abJGSTkctYbKU37i1DUI/InogMQprQ3zmy3Eexezvl70ePgQHS8o9rVO
         C1vAE1iMDqPgacOcq2bYEPM3RtWyRVDAL7TxpwMTnxaVy06tzlbWchU0ultAzGIFCYuH
         nFKA==
X-Gm-Message-State: AOAM5300HGXQrPG/g6ZC6HuSHVg0RpoWIR3bZ73DVo1VwhpsJLMkZGiT
	okxC90kSeGWnD+eyIo1iMYo=
X-Google-Smtp-Source: ABdhPJzoCjHE9997aLT2xV1HstS47RUvZQXYjAqGmUzjBaX4scHX8SyADAAdRpFMv7hEnouPfjryZw==
X-Received: by 2002:a05:6512:3186:b0:44a:c200:61e1 with SMTP id i6-20020a056512318600b0044ac20061e1mr6120837lfe.534.1648748077558;
        Thu, 31 Mar 2022 10:34:37 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id bd10-20020a05651c168a00b00247fe29d83csm2746992ljb.73.2022.03.31.10.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 10:34:37 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/5] selinux: Remove redundant assignments
Date: Thu, 31 Mar 2022 19:33:57 +0200
Message-Id: <20220331173358.40939-4-michalorzel.eng@gmail.com>
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
 security/selinux/avc.c         | 4 ++--
 security/selinux/hooks.c       | 1 -
 security/selinux/ss/services.c | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/security/selinux/avc.c b/security/selinux/avc.c
index abcd9740d10f..874c1c6fe10b 100644
--- a/security/selinux/avc.c
+++ b/security/selinux/avc.c
@@ -1059,7 +1059,7 @@ int avc_has_extended_perms(struct selinux_state *state,
 
 	node = avc_lookup(state->avc, ssid, tsid, tclass);
 	if (unlikely(!node)) {
-		node = avc_compute_av(state, ssid, tsid, tclass, &avd, xp_node);
+		avc_compute_av(state, ssid, tsid, tclass, &avd, xp_node);
 	} else {
 		memcpy(&avd, &node->ae.avd, sizeof(avd));
 		xp_node = node->ae.xp_node;
@@ -1151,7 +1151,7 @@ inline int avc_has_perm_noaudit(struct selinux_state *state,
 
 	node = avc_lookup(state->avc, ssid, tsid, tclass);
 	if (unlikely(!node))
-		node = avc_compute_av(state, ssid, tsid, tclass, avd, &xp_node);
+		avc_compute_av(state, ssid, tsid, tclass, avd, &xp_node);
 	else
 		memcpy(avd, &node->ae.avd, sizeof(*avd));
 
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index e9e959343de9..f792835b3fb6 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -6487,7 +6487,6 @@ static int selinux_setprocattr(const char *name, void *value, size_t size)
 			goto abort_change;
 
 		/* Only allow single threaded processes to change context */
-		error = -EPERM;
 		if (!current_is_single_threaded()) {
 			error = security_bounded_transition(&selinux_state,
 							    tsec->sid, sid);
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 6901dc07680d..802a80648c6c 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -2980,7 +2980,6 @@ int security_fs_use(struct selinux_state *state, struct super_block *sb)
 	}
 
 retry:
-	rc = 0;
 	rcu_read_lock();
 	policy = rcu_dereference(state->policy);
 	policydb = &policy->policydb;
-- 
2.25.1

