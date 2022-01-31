Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9452C9C
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 18:22:49 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id w27-20020a9d5a9b000000b005a17d68ae89so13813247oth.12
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 10:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=5vGwoTC1e4kUUVS5mywGbNPZbTA57tIfGZpAbVJZdPc=;
        b=uPAa/sk2IOzeJCHeNYiZWThya96U6MZM4TNQ3W7xElP3WnOciW2NWRUaZxJqVc/BWD
         SL9+Z0BaL2cO27liA1EJhEw4sAE9ciMh8O+O4iz/CJqfzFRMEHGzU+1OOZ5WFXzR/YE+
         g1Q8GfZ4Hpqk2ocPtEBaUT3M8xpubQ9wvpghAK6NWnS0MkjnNLfCK55fLZFBoSyXYCnP
         tdF07TqTEznFa0zfc2THo6oHqjc6ZackuizbICp61oOu6IHX6qQ5K3OycwutEP6Fv99c
         X34D8BlZb6UKTusYwwckqKWB+lmWP1YmTeOEbtEUUsy+0rEg1FJl/gbV3AzZWoYGZkhC
         VCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=5vGwoTC1e4kUUVS5mywGbNPZbTA57tIfGZpAbVJZdPc=;
        b=RIvjf9vwLB7IiYnjAHTntzGOpxOJHUUpedIcPCcC/1RfYeWaEpwDG6Bsn4m8ky7mQq
         qHuocbyApExjqAW5uC0KnnzbaY1sVQTLY+9ybBJaxKCtIyt02RCbQQ9E5OFKNKXvw0/b
         mkR4bdwDRB9vh8dtGfDo4+OEky4gNm/heghoDeDC75lj8qCgfvp++473nwj9KkI1AYHg
         Jocl06coWIns3G+RgQJVOsT/zVew8+SO+RUxALjPefBa5NjXBjkSIkymcxOnJ6EDRLVo
         xGv/oHurfYvQvAtAkdv0vM16KPToPPQou8kqXbcwkzdrFENjTTVpsITZeN8eGxw6t1+w
         AAww==
X-Gm-Message-State: AOAM530aDoHx+zU0I6NxfweLMp6j2it3b6mXdj6uVfAlFXmN3GDLd4ak
	f9kAnI1OBOBa1Pmf7cbQuEImfQ==
X-Google-Smtp-Source: ABdhPJyFkngoaC74FUTn3EaXxXFZljpAATvXAlAMBERI5eghY/B2TUgZRyyVHgs4KNqPSAnjGDqyIw==
X-Received: by 2002:a9d:1f0:: with SMTP id e103mr9137176ote.234.1643653368677;
        Mon, 31 Jan 2022 10:22:48 -0800 (PST)
Received: from fedora ([187.36.236.204])
        by smtp.gmail.com with ESMTPSA id m14sm1003163ooj.22.2022.01.31.10.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:22:48 -0800 (PST)
Date: Mon, 31 Jan 2022 15:22:42 -0300
From: =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>
To: gregkh@linuxfoundation.org, tj@kernel.org, viro@zeniv.linux.org.uk,
	nathan@kernel.org, ndesaulniers@google.com, willy@infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3] seq_file: fix NULL pointer arithmetic warning
Message-ID: <Yfgo8p6Vk+h4+YHY@fedora>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Implement conditional logic in order to replace NULL pointer arithmetic.

The use of NULL pointer arithmetic was pointed out by clang with the
following warning:

fs/kernfs/file.c:128:15: warning: performing pointer arithmetic on a
null pointer has undefined behavior [-Wnull-pointer-arithmetic]
                return NULL + !*ppos;
                       ~~~~ ^
fs/seq_file.c:559:14: warning: performing pointer arithmetic on a
null pointer has undefined behavior [-Wnull-pointer-arithmetic]
        return NULL + (*pos == 0);

Signed-off-by: Maíra Canal <maira.canal@usp.br>
---
V1 -> V2:
- Use SEQ_START_TOKEN instead of open-coding it
- kernfs_seq_start call single_start instead of open-coding it
V2 -> V3:
- Remove the EXPORT of the single_start symbol
---
 fs/kernfs/file.c         | 7 +------
 fs/seq_file.c            | 4 ++--
 include/linux/seq_file.h | 1 +
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 9414a7a60a9f..7aefaca876a0 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -120,13 +120,8 @@ static void *kernfs_seq_start(struct seq_file *sf, loff_t *ppos)
 		if (next == ERR_PTR(-ENODEV))
 			kernfs_seq_stop_active(sf, next);
 		return next;
-	} else {
-		/*
-		 * The same behavior and code as single_open().  Returns
-		 * !NULL if pos is at the beginning; otherwise, NULL.
-		 */
-		return NULL + !*ppos;
 	}
+	return single_start(sf, ppos);
 }
 
 static void *kernfs_seq_next(struct seq_file *sf, void *v, loff_t *ppos)
diff --git a/fs/seq_file.c b/fs/seq_file.c
index f8e1f4ee87ff..7ab8a58c29b6 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -554,9 +554,9 @@ int seq_dentry(struct seq_file *m, struct dentry *dentry, const char *esc)
 }
 EXPORT_SYMBOL(seq_dentry);
 
-static void *single_start(struct seq_file *p, loff_t *pos)
+void *single_start(struct seq_file *p, loff_t *pos)
 {
-	return NULL + (*pos == 0);
+	return *pos ? NULL : SEQ_START_TOKEN;
 }
 
 static void *single_next(struct seq_file *p, void *v, loff_t *pos)
diff --git a/include/linux/seq_file.h b/include/linux/seq_file.h
index 88cc16444b43..60820ab511d2 100644
--- a/include/linux/seq_file.h
+++ b/include/linux/seq_file.h
@@ -162,6 +162,7 @@ int seq_dentry(struct seq_file *, struct dentry *, const char *);
 int seq_path_root(struct seq_file *m, const struct path *path,
 		  const struct path *root, const char *esc);
 
+void *single_start(struct seq_file *, loff_t *);
 int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
 int single_open_size(struct file *, int (*)(struct seq_file *, void *), void *, size_t);
 int single_release(struct inode *, struct file *);
-- 
2.34.1

