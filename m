Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DDC1B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:14:58 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c0c6d4d650so23007735ad.0
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808898; x=1695413698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2adzcEiFT17X0tMOdRHOC+4xSYu7V9ABPtDWz0mCD/0=;
        b=Tcwgf7vw4rD+1FJnY8nsV2YRYMimoL/Fezgtfn+J5N1dmX49G8UDxnVJ052utnDesj
         eS+hF69K+YNLh7+Ad1OWVQBo7gaP1vZHR35qfVfyoA7hKwmZXrqnPqiebUgFBycQ9CT8
         vOy5bEIuZ66dgS3xgjR2XTjUEhakqg8hrMUBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808898; x=1695413698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2adzcEiFT17X0tMOdRHOC+4xSYu7V9ABPtDWz0mCD/0=;
        b=Q+0p6qW1TrIWWKOeBiXUmY5BgJ192x6H1ZxA4rHxvhsSglrM+BbdcPA2FzWftDCNCU
         XGlEpBpB69jxzi303Y7ZIL+EcdQ8J/Yy5VnymOxkXt1UO6s6BWbknJYKZluRs9gMEHC4
         ldoG4Zpby9qdA6pchkYoco7x4Pp0nHrzapBaGQZ+AvdaS3SchUaO5/krt0E6NuiuhxPb
         tLdl/4On0y49lsqJzU0PXKKd0EVLfek3roqkP6XQEj5XD6o3evUBrKN6f+6kxsPPvoay
         HgCsy4lcghKFv4TEPX8CcqhGYzg1KwRtQFKg02KMbUJJcXIo+3+pXyEyPISs3M0iGtuK
         HlsQ==
X-Gm-Message-State: AOJu0YxkoLjuaaIsfUPHRWku3aEfCrgmVs4SGnvOBFGF9lMs9d0f9Yu0
	fR8fRmPL+0d6XXkAYsbm1l24z6xEv3pFnror6lo=
X-Google-Smtp-Source: AGHT+IFl5ZOAgVGqBoYurT+RiGDKwf2m+mMLCPmLDws6lMZeLSgdeHZqG1yi5Xh/qs1zbtBogZWowg==
X-Received: by 2002:a17:902:e882:b0:1bf:11ce:c6ae with SMTP id w2-20020a170902e88200b001bf11cec6aemr3250482plg.18.1694808898073;
        Fri, 15 Sep 2023 13:14:58 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902654200b001c43307f87asm1837631pln.91.2023.09.15.13.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:14:57 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Howells <dhowells@redhat.com>
Cc: Kees Cook <keescook@chromium.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] afs: Annotate struct afs_permits with __counted_by
Date: Fri, 15 Sep 2023 13:14:56 -0700
Message-Id: <20230915201456.never.529-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=keescook@chromium.org;
 h=from:subject:message-id; bh=C30Tpce9LuvDnPhShi9VewRUfa54HHSLTSiinU7ab60=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLtASGYM643odAtTW+2uVzG0JxIaa//Ye+Bts
 GG3+SOU75WJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS7QAAKCRCJcvTf3G3A
 JmQ5D/939BFdVcrl8LsWHb25cdDVwqzcQu0ePiQa21qI3gkIx7d/C8DZ2qrX3QrHPyxnky+ufgQ
 9Zl9fn6bdqHc6imsnBAAkRegAyTuYMtUmp6zi8w2Bzf9dT8r/xuT8GtAkMlo336a7xveH3luRbO
 MTr9lMWq4ZJ3GCh0FTdJmckVsF1hybn6tpSNZL4Y/I+pDLjDduYV0/VAwzRB5SWlre0mug2WBNk
 XgGKTUWr6zml7tQhaxlp2r8rgMuLcQTuwTty++KM6qyaDw4HNfJ5wfSF9UDjeJHS489LFQbaKMf
 JD0csUlqzQK9Azl1Fqed6jTMZL4924e8MnjWmZD7SgMa2mzDlFzDMenajpdoBypMvFqQwQKAXwo
 X4BSZvbaAg22gLUsQHDBNNqKLkhjYfvhE7AvGLCXu+f1m7P0zrjNKuX2YoEnYrj1M+n3+AJCO3j
 ix5OuhOhpXAJNFqJsHsVoS62xM2i4ui5ZpF9HMLGUNANCkwQeTKYk69PXhuZIu0M4aEfDKphuBt
 KMJdwM3G8URutOHI00MxVT7g14ZllYBBq5BmjfNgn8YKUPI+iARkBV+anvIM3LIKGKsU48jFCH9
 2y3kY1IkkyCqw+M212bqRFmBVg18HbLa4Q0zv7sPzuZUf2DdSubfdtYc/RRjRx3oKgnwxo90i8o
 ZlTc3RO ZPK5Fl1w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct afs_permits.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>
Cc: linux-afs@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/afs/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 07433a5349ca..469a717467a4 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -705,7 +705,7 @@ struct afs_permits {
 	refcount_t		usage;
 	unsigned short		nr_permits;	/* Number of records */
 	bool			invalidated;	/* Invalidated due to key change */
-	struct afs_permit	permits[];	/* List of permits sorted by key pointer */
+	struct afs_permit	permits[] __counted_by(nr_permits);	/* List of permits sorted by key pointer */
 };
 
 /*
-- 
2.34.1

