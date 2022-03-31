Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EDAA2D
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 17:34:23 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id q14so674848ljc.12
        for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 10:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tYr4+A2I2sUXVhAjEZBjGiVViPde2R3/QXl/MeRC92k=;
        b=nFEALaQDRJK+KYEsH461dOhzve4fxNfkmMgo2fIBhtDhWjGq0/3pAHjjbmI72dHdKd
         E57CD6qP4N+xshQ6kiTp0V++2vdUEE6yPY+Lwfte6OlmKHuxAP0q4xR8onHZKKbRjnyP
         1X4KLDGOxDAYU8dswNf3x1cXwqYWocH9gPc1Hvgl1js90EDGvkt97oi23edz7BpbetBc
         sBWMo38844VINbgHx5UjWdVta1PoZujZiteBXWSTNYc/+tZW4hFV21oX9M56nu4AhLrX
         ZrAsBxU+N+9XQcFK+nJ8pFa0AIAxNdNlpljSex+gsfl34KTktL8AqKESMI4eXWvY9WEv
         /vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tYr4+A2I2sUXVhAjEZBjGiVViPde2R3/QXl/MeRC92k=;
        b=NobHycdUigZDf00mBlLOzJ9nAuSoaKXEWRUJAZMaUuUlnzNzRPEsF/Mlq0/IYSr9QN
         sEzdsvbj7RxWTkd/fjJYHc0iIttee2Rp/BtfMMF0O2T/wK1zpHd/izjJetipwvpnRU8k
         s8pSk2x75nC2NkMxbr8u1M2mISUr6rc2rTq3VaIE1QTCjrh8mo7HQFQ9v7Pof7vOaQMS
         G9U+zG2zuACe4TiOaoT3zy6CmsNUkMvM5IeUBaKC4EW9Pfih59SdinGkA6yRYB0DJBTF
         VBqWIxWt/dl48NeTwzfaVN9eVpSSXAHI7UKCLA/Rl4dqBvsjJU3JxafzhjYDck1gtHnL
         4osg==
X-Gm-Message-State: AOAM531GozgIB3m+K7YMF0PoEHl9LeyQOCLPqgqM0afBs6F+WDS9Fzxd
	mQ4YqyeKrEDY/KWJzbxPcIM=
X-Google-Smtp-Source: ABdhPJzWR7AdVufxiLU93gc6byk6FCl+NoBdPVzob1NRulTJGAMUnxBz1CXzXgQEFQo/gHGjPZU+cg==
X-Received: by 2002:a2e:9003:0:b0:24a:c3a5:849c with SMTP id h3-20020a2e9003000000b0024ac3a5849cmr11159595ljg.68.1648748061620;
        Thu, 31 Mar 2022 10:34:21 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id bd10-20020a05651c168a00b00247fe29d83csm2746992ljb.73.2022.03.31.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 10:34:21 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/5] apparmor: Remove redundant assignments
Date: Thu, 31 Mar 2022 19:33:54 +0200
Message-Id: <20220331173358.40939-1-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
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
 security/apparmor/domain.c | 3 +--
 security/apparmor/label.c  | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index a29e69d2c300..77724acd9d8a 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -627,7 +627,6 @@ static struct aa_label *profile_transition(struct aa_profile *profile,
 {
 	struct aa_label *new = NULL;
 	const char *info = NULL, *name = NULL, *target = NULL;
-	unsigned int state = profile->file.start;
 	struct aa_perms perms = {};
 	bool nonewprivs = false;
 	int error = 0;
@@ -661,7 +660,7 @@ static struct aa_label *profile_transition(struct aa_profile *profile,
 	}
 
 	/* find exec permissions for name */
-	state = aa_str_perms(profile->file.dfa, state, name, cond, &perms);
+	aa_str_perms(profile->file.dfa, profile->file.start, name, cond, &perms);
 	if (perms.allow & MAY_EXEC) {
 		/* exec permission determine how to transition */
 		new = x_to_label(profile, bprm, name, perms.xindex, &target,
diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index 0b0265da1926..ce9ae9b6b303 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -807,7 +807,7 @@ bool aa_label_replace(struct aa_label *old, struct aa_label *new)
 		struct aa_labelset *ls = labels_set(old);
 
 		write_lock_irqsave(&ls->lock, flags);
-		res = __label_remove(old, new);
+		__label_remove(old, new);
 		if (labels_ns(old) != labels_ns(new)) {
 			write_unlock_irqrestore(&ls->lock, flags);
 			ls = labels_set(new);
-- 
2.25.1

