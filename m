Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254103B28
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 14:22:02 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id f17so9976211edd.2
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 06:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8lKeT6/UwWXU+14STiDc02KgAuvLL0ArwI0Frgd9EJw=;
        b=FlvAtUwO9YvUfW2tiTjSUFjqP6r5Zvow5Jf60Yn1lt0jY6ng0M96E1qBVauRtVuYeQ
         /G63Z/9GUdt5oPZ7aDya7mYs97HHt7vcsg/2ypUnTof0zuocG5es4bPh43yeNObQztOR
         XaIMtzSw6kqgbKxLvSWLsM9rzl5GaWJUwzBH0cn04sbluPY+w4WGlGvDR3Qv5E/Hl/RE
         1L9M5mrIsgRbQas2XI0lF0Xu8aAsPp32O3HvTsRmT0SyuSFhQZ9pHQ4V52ttJSgKz45D
         oZJVHYa2nsxdtXMk+xhF4EZkok2vqBEdC24bmZje5mcfRnYHsS28rd4k/Iw8XTaNC8yE
         WREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8lKeT6/UwWXU+14STiDc02KgAuvLL0ArwI0Frgd9EJw=;
        b=OPojAD1PunmPTMEMuI6CwYsydySucVe9vTWeVL6YBA5TEQ2iFlazvO2rOK5hGLNBBo
         6L7O3MDGjPf5fHX76xenE+EGCJweu7p9SWxqpz5q88LyAJ9ztElc4lO82YePLI3IJUCR
         fer/K2tAnJVhVIDPk8lp5l/UNe50gykUSkZ+QaxT48YjdMVH2mvBf1PdhKB+4V3NoEDE
         zaoKdfTh41aFyAliDA9czxjv0G64tbVNJzXojC28CvVX/c6p1VkaUpu73rldXvB7sGMM
         yK1/NbSCGbA+JIUJlhT2YyFoC/YovNR3EbTkdHYvQoJcjD2k/35j0RakUzPfGlegIL6M
         neQg==
X-Gm-Message-State: AOAM53153GqS++VKm9pDTSinafXdC1EI9xT9aqt6zpvhiKkw9yv1REyQ
	+1+6pvSm2yiEf0zzQtqWcI8=
X-Google-Smtp-Source: ABdhPJzQF8YqRKaRzhqpB/+RKXKTS92zdI9LaCldl/gjxDCST/Q7SYVtCA0jA3ko98w0KRBRVpcFjA==
X-Received: by 2002:aa7:d594:0:b0:410:ef84:f706 with SMTP id r20-20020aa7d594000000b00410ef84f706mr2767662edq.347.1645107720447;
        Thu, 17 Feb 2022 06:22:00 -0800 (PST)
Received: from debianHome.localdomain (dynamic-077-001-066-240.77.1.pool.telefonica.de. [77.1.66.240])
        by smtp.gmail.com with ESMTPSA id a13sm578436edn.25.2022.02.17.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 06:22:00 -0800 (PST)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Serge Hallyn <serge@hallyn.com>,
	Austin Kim <austin.kim@lge.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 5/5] selinux: drop unnecessary NULL check
Date: Thu, 17 Feb 2022 15:21:28 +0100
Message-Id: <20220217142133.72205-4-cgzones@googlemail.com>
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

Commit e3489f8974e1 ("selinux: kill selinux_sb_get_mnt_opts()")
introduced a NULL check on the context after a successful call to
security_sid_to_context().  This is on the one hand redundant after
checking for success and on the other hand insufficient on an actual
NULL pointer, since the context is passed to seq_escape() leading to a
call of strlen() on it.

Reported by Clang analyzer:

    In file included from security/selinux/hooks.c:28:
    In file included from ./include/linux/tracehook.h:50:
    In file included from ./include/linux/memcontrol.h:13:
    In file included from ./include/linux/cgroup.h:18:
    ./include/linux/seq_file.h:136:25: warning: Null pointer passed as 1st argument to string length function [unix.cstring.NullArg]
            seq_escape_mem(m, src, strlen(src), flags, esc);
                                   ^~~~~~~~~~~

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/hooks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 1e69f88eb326..ac802b99d36c 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -1020,7 +1020,7 @@ static int show_sid(struct seq_file *m, u32 sid)
 	rc = security_sid_to_context(&selinux_state, sid,
 					     &context, &len);
 	if (!rc) {
-		bool has_comma = context && strchr(context, ',');
+		bool has_comma = strchr(context, ',');
 
 		seq_putc(m, '=');
 		if (has_comma)
-- 
2.35.1

