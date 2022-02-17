Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E443D38DA
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 14:21:57 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id hw13so7626743ejc.9
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 06:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uzAjuvuRezKyO/SVp83DwWN6oZxDOTQaXqLmt6YXjzE=;
        b=LHvSh8IaM6IhY+1/xnC7+iup0QTMkQxAnANF1Cg2sZM4XoogiBvEJSzrFxgaqKLHOe
         lRreAZvNDUMFfAo5Pu/7jLYCUV8jlEFa4+eCGqtU+NIOuX/kUExBEd+f4Z+LZGSKe0cN
         pU2P3cyppD2X6JkObg6kl52ZfZ/Ob5zHJnZlJ2z3yY+BJ5NiRcRRs2c2LUJyPmDiJjBv
         C8z0NQqMgsPagkxrAJjMtmCRhmqPHAEYkYKj0FCSRYkxydFwyJNXAOqnP+U7N2hN7cSX
         Vz5btmgnKObw7jMlGvxzRgfjp8kNsBfILB1B51ywokK1KSwWNq2644WzOh+zws/HptwS
         2xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uzAjuvuRezKyO/SVp83DwWN6oZxDOTQaXqLmt6YXjzE=;
        b=scP3OhTIEGjZWpTOFKaA34CUnLntPCCZYvU8WHKM/U7+2h2Emz7yuF89YSfW4Hg8RR
         xBaj/5RxxOwOm0cEZCYsz6DiHmM01YvqiAb+ZAZ14kC26cj32URrzFxIAR3hGqKKFFBC
         9yoSssiACy+Q2Pp2Oi8cbQR50Y8meiwDQ4TnH1sICyXlafpsYARLLl+wG7G2PQ2lpiO1
         tkvFDy8FMscGJFhcEKCSmrrv8HPZzNU84XxqP25+TGjAcZOWLhSxV5z/uttqPWj0A4Iq
         lk/iRyD7ZEA8c4aZ6SH+f2ZdNVVB0GXZbSihKBHZgIK2bPQUXZYNpmTfRi/bJqEk0yhl
         LOkA==
X-Gm-Message-State: AOAM53130cb6UPh/eLycOi2d5Hb/WdN8j+POMICrURy4Cd/Zt69xo9+B
	ljTpENj9NTBNasnTTBBuy04=
X-Google-Smtp-Source: ABdhPJxG9vIvZ6Wb0ffgnDvshkhUw4k6RsPKnE9YL7PdUc/nsZqTnNlQBPe5tektEvwu/gC1POUfPA==
X-Received: by 2002:a17:906:7711:b0:6ce:51b:a5a1 with SMTP id q17-20020a170906771100b006ce051ba5a1mr2464110ejm.610.1645107716221;
        Thu, 17 Feb 2022 06:21:56 -0800 (PST)
Received: from debianHome.localdomain (dynamic-077-001-066-240.77.1.pool.telefonica.de. [77.1.66.240])
        by smtp.gmail.com with ESMTPSA id a13sm578436edn.25.2022.02.17.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 06:21:55 -0800 (PST)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	"David S. Miller" <davem@davemloft.net>,
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Austin Kim <austin.kim@lge.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/5] selinux: declare data arrays const
Date: Thu, 17 Feb 2022 15:21:27 +0100
Message-Id: <20220217142133.72205-3-cgzones@googlemail.com>
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

The arrays for the policy capability names, the initial sid identifiers
and the class and permission names are not changed at runtime.  Declare
them const to avoid accidental modification.

The build time script genheaders needs to be exempted, since it converts
the entries to uppercase.

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 scripts/selinux/genheaders/genheaders.c          | 2 ++
 scripts/selinux/mdp/mdp.c                        | 4 ++--
 security/selinux/avc.c                           | 2 +-
 security/selinux/include/avc_ss.h                | 2 +-
 security/selinux/include/classmap.h              | 8 +++++++-
 security/selinux/include/initial_sid_to_string.h | 9 ++++++++-
 security/selinux/include/policycap.h             | 2 +-
 security/selinux/include/policycap_names.h       | 2 +-
 security/selinux/ss/services.c                   | 4 ++--
 9 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/scripts/selinux/genheaders/genheaders.c b/scripts/selinux/genheaders/genheaders.c
index f355b3e0e968..5f7c0b7d9260 100644
--- a/scripts/selinux/genheaders/genheaders.c
+++ b/scripts/selinux/genheaders/genheaders.c
@@ -15,6 +15,8 @@ struct security_class_mapping {
 	const char *perms[sizeof(unsigned) * 8 + 1];
 };
 
+/* Allow to convert entries in mappings to uppercase */
+#define __SELINUX_GENHEADERS__
 #include "classmap.h"
 #include "initial_sid_to_string.h"
 
diff --git a/scripts/selinux/mdp/mdp.c b/scripts/selinux/mdp/mdp.c
index 105c1c31a316..1415604c3d24 100644
--- a/scripts/selinux/mdp/mdp.c
+++ b/scripts/selinux/mdp/mdp.c
@@ -82,7 +82,7 @@ int main(int argc, char *argv[])
 
 	/* print out the class permissions */
 	for (i = 0; secclass_map[i].name; i++) {
-		struct security_class_mapping *map = &secclass_map[i];
+		const struct security_class_mapping *map = &secclass_map[i];
 		fprintf(fout, "class %s\n", map->name);
 		fprintf(fout, "{\n");
 		for (j = 0; map->perms[j]; j++)
@@ -103,7 +103,7 @@ int main(int argc, char *argv[])
 #define SYSTEMLOW "s0"
 #define SYSTEMHIGH "s1:c0.c1"
 		for (i = 0; secclass_map[i].name; i++) {
-			struct security_class_mapping *map = &secclass_map[i];
+			const struct security_class_mapping *map = &secclass_map[i];
 
 			fprintf(fout, "mlsconstrain %s {\n", map->name);
 			for (j = 0; map->perms[j]; j++)
diff --git a/security/selinux/avc.c b/security/selinux/avc.c
index abcd9740d10f..020985a53d8f 100644
--- a/security/selinux/avc.c
+++ b/security/selinux/avc.c
@@ -668,7 +668,7 @@ static void avc_audit_pre_callback(struct audit_buffer *ab, void *a)
 	struct common_audit_data *ad = a;
 	struct selinux_audit_data *sad = ad->selinux_audit_data;
 	u32 av = sad->audited;
-	const char **perms;
+	const char *const *perms;
 	int i, perm;
 
 	audit_log_format(ab, "avc:  %s ", sad->denied ? "denied" : "granted");
diff --git a/security/selinux/include/avc_ss.h b/security/selinux/include/avc_ss.h
index 88c384c5c09e..b38974e22d81 100644
--- a/security/selinux/include/avc_ss.h
+++ b/security/selinux/include/avc_ss.h
@@ -18,7 +18,7 @@ struct security_class_mapping {
 	const char *perms[sizeof(u32) * 8 + 1];
 };
 
-extern struct security_class_mapping secclass_map[];
+extern const struct security_class_mapping secclass_map[];
 
 #endif /* _SELINUX_AVC_SS_H_ */
 
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 35aac62a662e..07ade4af85ff 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -2,6 +2,12 @@
 #include <linux/capability.h>
 #include <linux/socket.h>
 
+#ifdef __SELINUX_GENHEADERS__
+# define const_qual
+#else
+# define const_qual const
+#endif
+
 #define COMMON_FILE_SOCK_PERMS "ioctl", "read", "write", "create", \
     "getattr", "setattr", "lock", "relabelfrom", "relabelto", "append", "map"
 
@@ -38,7 +44,7 @@
  * Note: The name for any socket class should be suffixed by "socket",
  *	 and doesn't contain more than one substr of "socket".
  */
-struct security_class_mapping secclass_map[] = {
+const_qual struct security_class_mapping secclass_map[] = {
 	{ "security",
 	  { "compute_av", "compute_create", "compute_member",
 	    "check_context", "load_policy", "compute_relabel",
diff --git a/security/selinux/include/initial_sid_to_string.h b/security/selinux/include/initial_sid_to_string.h
index 5d332aeb8b6c..915283cd89bd 100644
--- a/security/selinux/include/initial_sid_to_string.h
+++ b/security/selinux/include/initial_sid_to_string.h
@@ -1,5 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-static const char *initial_sid_to_string[] =
+
+#ifdef __SELINUX_GENHEADERS__
+# define const_qual
+#else
+# define const_qual const
+#endif
+
+static const char *const_qual initial_sid_to_string[] =
 {
 	NULL,
 	"kernel",
diff --git a/security/selinux/include/policycap.h b/security/selinux/include/policycap.h
index 2ec038efbb03..3207a4e8c899 100644
--- a/security/selinux/include/policycap.h
+++ b/security/selinux/include/policycap.h
@@ -15,6 +15,6 @@ enum {
 };
 #define POLICYDB_CAPABILITY_MAX (__POLICYDB_CAPABILITY_MAX - 1)
 
-extern const char *selinux_policycap_names[__POLICYDB_CAPABILITY_MAX];
+extern const char *const selinux_policycap_names[__POLICYDB_CAPABILITY_MAX];
 
 #endif /* _SELINUX_POLICYCAP_H_ */
diff --git a/security/selinux/include/policycap_names.h b/security/selinux/include/policycap_names.h
index b89289f092c9..51da36e37d21 100644
--- a/security/selinux/include/policycap_names.h
+++ b/security/selinux/include/policycap_names.h
@@ -5,7 +5,7 @@
 #include "policycap.h"
 
 /* Policy capability names */
-const char *selinux_policycap_names[__POLICYDB_CAPABILITY_MAX] = {
+const char *const selinux_policycap_names[__POLICYDB_CAPABILITY_MAX] = {
 	"network_peer_controls",
 	"open_perms",
 	"extended_socket_class",
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 7865926962ab..25c287324059 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -99,7 +99,7 @@ static void context_struct_compute_av(struct policydb *policydb,
 				      struct extended_perms *xperms);
 
 static int selinux_set_mapping(struct policydb *pol,
-			       struct security_class_mapping *map,
+			       const struct security_class_mapping *map,
 			       struct selinux_map *out_map)
 {
 	u16 i, j;
@@ -121,7 +121,7 @@ static int selinux_set_mapping(struct policydb *pol,
 	/* Store the raw class and permission values */
 	j = 0;
 	while (map[j].name) {
-		struct security_class_mapping *p_in = map + (j++);
+		const struct security_class_mapping *p_in = map + (j++);
 		struct selinux_mapping *p_out = out_map->mapping + j;
 
 		/* An empty class string skips ahead */
-- 
2.35.1

