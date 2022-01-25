Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3A2C82
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 14:14:51 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id j23so58029277edp.5
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 06:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pip/ynndQDsKYwfFpC0FwgQbF11giMSuPMZqW57FgsY=;
        b=JhfKOo/i4Fe29ouAHZzU4+psdXV+0xA48c4c0lvpjN5WMKYJJ1LcpUFH5mRwD/ZRvQ
         wvE6vzkVnOsGWq9JOsLOIXLLrFDFT3hkyQgl+JIlgo3AZNqeHOopkcKOVkJ5PnE6XuXf
         teiZd1ZKMEQ3XJoMu9QBD6j0jXIo2OsJ9S/MofgHPhH6/kuNOjumhQ5eDMh3feiGa96L
         DpyGP3sdFR2cNlxbUO/fNEt4GTJz5QU4HJw19lRM0hAH990jvl5YspsZW5KtAHdE14TG
         PjxBFZReLu0F+gs/kY0nBnlCLMiq6tu5jXp5k9TqI0+aDv6p7AEK5U1yK+PnF1IkFulQ
         ofTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pip/ynndQDsKYwfFpC0FwgQbF11giMSuPMZqW57FgsY=;
        b=Ye68vsRD0Drt2YlQcFcki8ndXCoCNhWJQUa6CkByHHxYUPeqs1RM9WGC5X4QxWdiHg
         I1nsHalH37fLGld6TtnU4Xkr1cKoNA7rUXyJSw+o0I04lH0IpSoU11rZdBgBRNJPceqr
         LHKY6ANbgVNRZQ7lHFKsFA8JW8INH1NgBrFm5sDQUiF7UfXTsgAIidji8b2Tbk8btNNx
         If6ZHS2aAZFqN/j10VaP6RsJUQfdA5Le/xOZkuND3HUaxeWreot1leRdHVbye1ZUNJeW
         S1yOv3I+8n1hm8F00kS7isjkecDbc9HcCl0G59ArnZb0G5hO0BXUChL3QkRW84ylhvjB
         mTlw==
X-Gm-Message-State: AOAM533djOc4jGZq1b9KPMsirYYCt5PCRqC9qPr2kbm+/2/0K+8Zptqu
	VdDDK5yuc0h7aJOmm5ZgMMs=
X-Google-Smtp-Source: ABdhPJz2vAlFtIVwKW+yQfoJzKfPoR9YkgY+Wx8tpFHbshf2R4FZ/56EvcY6WDsY3muCdewvaf0v/g==
X-Received: by 2002:a17:906:7c4:: with SMTP id m4mr16557083ejc.655.1643120089679;
        Tue, 25 Jan 2022 06:14:49 -0800 (PST)
Received: from debianHome.localdomain (dynamic-077-010-144-044.77.10.pool.telefonica.de. [77.10.144.44])
        by smtp.gmail.com with ESMTPSA id lu44sm6292929ejb.145.2022.01.25.06.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 06:14:48 -0800 (PST)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Xiong Zhenwu <xiong.zhenwu@zte.com.cn>,
	Tyler Hicks <tyhicks@linux.microsoft.com>,
	Serge Hallyn <serge@hallyn.com>,
	Austin Kim <austin.kim@lge.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/9] selinux: declare path parameters of _genfs_sid const
Date: Tue, 25 Jan 2022 15:14:12 +0100
Message-Id: <20220125141422.32655-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The path parameter is only read from in security_genfs_sid(),
selinux_policy_genfs_sid() and __security_genfs_sid(). Since a string
literal is passed as argument, declare the parameter const.
Also align the parameter names in the declaration and definition.

Reported by clang [-Wwrite-strings]:

    security/selinux/hooks.c:553:60: error: passing 'const char [2]' to parameter of type 'char *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
            rc = security_genfs_sid(&selinux_state, sb->s_type->name, /,
                                                                      ^~~
    ./security/selinux/include/security.h:389:36: note: passing argument to parameter 'name' here
                           const char *fstype, char *name, u16 sclass,
                                                     ^

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/include/security.h | 4 ++--
 security/selinux/ss/services.c      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index ac0ece01305a..6482e0efb368 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -386,11 +386,11 @@ int security_get_allow_unknown(struct selinux_state *state);
 int security_fs_use(struct selinux_state *state, struct super_block *sb);
 
 int security_genfs_sid(struct selinux_state *state,
-		       const char *fstype, char *name, u16 sclass,
+		       const char *fstype, const char *path, u16 sclass,
 		       u32 *sid);
 
 int selinux_policy_genfs_sid(struct selinux_policy *policy,
-		       const char *fstype, char *name, u16 sclass,
+		       const char *fstype, const char *path, u16 sclass,
 		       u32 *sid);
 
 #ifdef CONFIG_NETLABEL
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 8e92af7dd284..5a7df45bdab1 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -2875,7 +2875,7 @@ int security_get_user_sids(struct selinux_state *state,
  */
 static inline int __security_genfs_sid(struct selinux_policy *policy,
 				       const char *fstype,
-				       char *path,
+				       const char *path,
 				       u16 orig_sclass,
 				       u32 *sid)
 {
@@ -2928,7 +2928,7 @@ static inline int __security_genfs_sid(struct selinux_policy *policy,
  */
 int security_genfs_sid(struct selinux_state *state,
 		       const char *fstype,
-		       char *path,
+		       const char *path,
 		       u16 orig_sclass,
 		       u32 *sid)
 {
@@ -2952,7 +2952,7 @@ int security_genfs_sid(struct selinux_state *state,
 
 int selinux_policy_genfs_sid(struct selinux_policy *policy,
 			const char *fstype,
-			char *path,
+			const char *path,
 			u16 orig_sclass,
 			u32 *sid)
 {
-- 
2.34.1

