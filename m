Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A4C33EC
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 20:55:09 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id q76so11872996pgq.10
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 13:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BdPS+6ovNgbIR6W/BvJieSFy4bz2cMdTMxnCOUR1BJQ=;
        b=bHU4VjAzp8C1M1XvHG68mTOvyMkOTXD8Q8IxxwTh/pA96lQ08ploXyPVuewqneNz7I
         BTQ66bsHXECQh9Ps4JwaMRw3GdAoyRlyvhHlbP2L7nt77gqS2adyofBziaB45Vm2D4Ez
         x0zbBoaGMSU5UEzo8IM1GgUfpoiiajG6cYGco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BdPS+6ovNgbIR6W/BvJieSFy4bz2cMdTMxnCOUR1BJQ=;
        b=Bp75q9P6pEe+8GVMNOxcmUWNl/2WvTuagALa41thBUW6deqooL3y/qE3+WkImXx0/P
         IdtWb/F8g9iUYhpK+UhATT8Zj3epa+M0gtWQ6y91lHdIDdmI0TG22IBA7XZB8OHOmn3Q
         CuhVF04KPJtBIaaaNDBOZn1h80MScx4KEAL/mAaEJXBQkrMQIZELjCmNdwZT32eLxrJe
         WEz+/iucZ4VPB//1q5kukYYtdAJ1AgAgkWzf/S2y9XEAOxkM9rA5dLxQebhLj2DjB3vT
         sBtqgV4i9Dkw3xFJzXFf2r84U93jx2VJ2Qj/iq9ZHzq4Jojfd5+/lFTqgjt+18+pe1VJ
         Piaw==
X-Gm-Message-State: AOAM532egXut1BeUhjT+LsqtaAlnJHBQT0i0Bxb0aKEZ3lWqKATVBirc
	yj1Ceckwsf+4YSOxWI4iT8wjtQ==
X-Google-Smtp-Source: ABdhPJy3MRDXrmUhZUJX+fO+Iudo78mE4XAjOuV5u2/RFaENGy2ohzpd4UwzaRV08TDRJgxybO+Kig==
X-Received: by 2002:a05:6a00:124f:b0:50d:efb8:6afa with SMTP id u15-20020a056a00124f00b0050defb86afamr10587579pfi.14.1651611309415;
        Tue, 03 May 2022 13:55:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z20-20020a630a54000000b003c219c0871asm3933040pgk.74.2022.05.03.13.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 13:55:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Bill Wendling <morbo@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/6] netfs: Eliminate Clang randstruct warning
Date: Tue,  3 May 2022 13:54:58 -0700
Message-Id: <20220503205503.3054173-2-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503205503.3054173-1-keescook@chromium.org>
References: <20220503205503.3054173-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970; h=from:subject; bh=bEl5c+oL0DHs9c0JKOjQVQhGUtntych2+mEKBNpt6+0=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicZaljMui7HM5C2nUhMVbY5QZL7cXs2WS/tnBqO2w QmtevbyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnGWpQAKCRCJcvTf3G3AJj7nD/ 9EN/kMgbEYlp++FHvHW8ma1iM+kP7FMs+DalBiKQfkIeScig0IVM5Q3dbvmXF1a26tX7uVVdilImNn hZvggBQj2ca6FXKUR60ZWvagiS3PrqNy/RdFhO4F29yx6c6gWrFJmsx2c25jJ1sJXp5sx6onOD64Dc eLXJPFVDQrMssMfu9+SQCRfcf3SDsKHcV5PRjOp5aiWqKI9yR6dWUheY3Sa4bsBYn645OAdQI93Z5k kmYosamsbYqGm9Xa2wWXalmB3W9x5Licr6O86aeeCfhuL8q12lrebTGwLo2PwpigLCbIgHrxSqJXIn stPRkOoWqNufv4kkQbewUAitGsMC6vT/2o7MylXDzRnKJujUZQY5wRBekBslXliKHtkxBb6ZGF8RQU fmbUaDHA9aKUMgMVHjzacxPBbJPV7oycgCPiRwbOBOmJNg3sYJQ0Y306ki6v+dOHLcj7wedfcPM0OU uolaHrzpi63qdj96tcn1R6hMdI166zDodVrQQ+NERYFJkdvfL7eSA+a6nfJ1GhI8W7R6HKS7CcJ+Xg Jj+pEWxNzyJ2Ee+WfxBM1qdcLOfVN64qrjDWaK0A6LKoH+NVZUbT5pYEv2eoow+Rll6b+uSLhDaqWX uVOm6X9q1dBcMoZx5a3JgZpzg9B8yHotQF8ovOWc5X15GHixJg4Er4sXOCkg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Clang's structure layout randomization feature gets upset when it sees
struct inode (which is randomized) cast to struct netfs_i_context. This
is due to seeing the inode pointer as being treated as an array of inodes,
rather than "something else, following struct inode".

Since netfs can't use container_of() (since it doesn't know what the
true containing struct is), it uses this direct offset instead. Adjust
the code to better reflect what is happening: an arbitrary pointer is
being adjusted and cast to something else: use a "void *" for the math.
The resulting binary output is the same, but Clang no longer sees an
unexpected cross-structure cast:

In file included from ../fs/nfs/inode.c:50:
In file included from ../fs/nfs/fscache.h:15:
In file included from ../include/linux/fscache.h:18:
../include/linux/netfs.h:298:9: error: casting from randomized structure pointer type 'struct inode *' to 'struct netfs_i_context *'
        return (struct netfs_i_context *)(inode + 1);
               ^
1 error generated.

Cc: David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/netfs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c7bf1eaf51d5..0c33b715cbfd 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -295,7 +295,7 @@ extern void netfs_stats_show(struct seq_file *);
  */
 static inline struct netfs_i_context *netfs_i_context(struct inode *inode)
 {
-	return (struct netfs_i_context *)(inode + 1);
+	return (void *)inode + sizeof(*inode);
 }
 
 /**
@@ -307,7 +307,7 @@ static inline struct netfs_i_context *netfs_i_context(struct inode *inode)
  */
 static inline struct inode *netfs_inode(struct netfs_i_context *ctx)
 {
-	return ((struct inode *)ctx) - 1;
+	return (void *)ctx - sizeof(struct inode);
 }
 
 /**
-- 
2.32.0

