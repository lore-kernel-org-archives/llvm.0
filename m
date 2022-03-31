Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8AA2D
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 17:34:35 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id h11so753771ljb.2
        for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7qM824sS6qaLgSDzZBkMu0728+GM94bEbKxid0FDaSw=;
        b=ans9cQPDD/Bcxy8c6SvWao1RjIHo6wajUKKZOpjeeOnhiAnXXssLYPDwf/e3M9D5Mq
         Bo69mhH6rhiRYVtrNQV7Lst9UewuihSsjNJe5anLqbcSAGftyWr2LT6h9qVV1nzXz68K
         0QUZ7jfJaldu9N6lMlaTTtYfubkesA9xLlif0NSWBnFzdLFbmtD7Y4oejabNNRkcL+IM
         t2uORsApDGoVOz+FxcoF7xQkgJVFZvBtPLLTG7bPZwvfblT1U1zdbd20sUHZrSyO1554
         aBexCtyS5lKBelKrZ/MPGcbOT9IR4isXNC+au+aFJMfCFTutn4uw8kr8i/dxYkffZC7G
         bXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7qM824sS6qaLgSDzZBkMu0728+GM94bEbKxid0FDaSw=;
        b=JDnfpbrijx7bL5vqQnwcuwsxCtu8Vhl/NDwiOtIWW+QdqT0EZprR4vQUPgSpFmAugd
         0UqlrB22XimBmlqTt3ZgECxYYf6dUnRN4wXhq3FopkYcpdRbYyURoj0f5e1Et46LwRju
         jJeSCOt+HXS/xykfdPvh2Qj1juyE3lqG89Ly1w6LZpwjbSPBbdn6FPaPhafDbUeE/wqB
         gwrUMVgm54yd9cWLRJSE7AhBTU9gvX0hWXV5i8qIm411dWTnzsl0hKQcROyO0/BW/KsX
         NQ3vWrh/zQ0ljFB1YM/FKXN5LRN/gcaMJRWNGlV8/Pk6u9/IyK7PFOr+ogE6jGFVOY0t
         3RMQ==
X-Gm-Message-State: AOAM530lEpQAPO10oJEdoBginHn3vtq47Ck0BdwT5HuumsXaPb2KB2tl
	pOTMg5dLoUYLfu8OGONHTRk=
X-Google-Smtp-Source: ABdhPJzT+D0LszikZlweoZjrGWaHhUe+vXIeV9Rkh43UlrBK+TBFxLpNPv92lCgOKGYSvZduQJEDdA==
X-Received: by 2002:a2e:8189:0:b0:249:7d3a:ceb0 with SMTP id e9-20020a2e8189000000b002497d3aceb0mr10387568ljg.367.1648748073357;
        Thu, 31 Mar 2022 10:34:33 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id bd10-20020a05651c168a00b00247fe29d83csm2746992ljb.73.2022.03.31.10.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 10:34:33 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 3/5] keys: Remove redundant assignments
Date: Thu, 31 Mar 2022 19:33:56 +0200
Message-Id: <20220331173358.40939-3-michalorzel.eng@gmail.com>
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
 security/keys/process_keys.c | 1 -
 security/keys/request_key.c  | 6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index b5d5333ab330..8bdd6410f79a 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -92,7 +92,6 @@ int look_up_user_keyrings(struct key **_user_keyring,
 		return PTR_ERR(reg_keyring);
 
 	down_write(&user_ns->keyring_sem);
-	ret = 0;
 
 	/* Get the user keyring.  Note that there may be one in existence
 	 * already as it may have been pinned by a session, but the user_struct
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 2da4404276f0..ad29023c9518 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -116,7 +116,7 @@ static int call_sbin_request_key(struct key *authkey, void *aux)
 {
 	static char const request_key[] = "/sbin/request-key";
 	struct request_key_auth *rka = get_request_key_auth(authkey);
-	const struct cred *cred = current_cred();
+	const struct cred *cred;
 	key_serial_t prkey, sskey;
 	struct key *key = rka->target_key, *keyring, *session, *user_session;
 	char *argv[9], *envp[3], uid_str[12], gid_str[12];
@@ -506,9 +506,7 @@ static struct key *construct_key_and_link(struct keyring_search_context *ctx,
 			kdebug("cons failed");
 			goto construction_failed;
 		}
-	} else if (ret == -EINPROGRESS) {
-		ret = 0;
-	} else {
+	} else if (ret != -EINPROGRESS) {
 		goto error_put_dest_keyring;
 	}
 
-- 
2.25.1

