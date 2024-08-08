Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 4C31A156220
	for <llvm@lists.linux.dev>; Thu,  8 Aug 2024 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723119842; cv=none; b=Yc0PLLa1youBwm169JhGnRwOkRt3Ks1R2Tz6DMQO7iHddwV9zQcjfwxT3BRVhOM9HLNyW72oULca/3Y4PKkFQziGeCIJsM5CcI303QRGT4uToc9BTyVER2QQEJ/+v7mvbx/BPp0csh/QW5qnaO8UGDniskdBCy9Qy3sSUGk5dTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723119842; c=relaxed/simple;
	bh=SXys11+xLoBsHco0MZl/A5tIPMtTS+9EsXL6IR3Hvxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NsB/4KSsSbvTtVZ/YQscSWw9J2kGevCsjQMn9Gdrw+G+nqDfIcbsNKdcPr94aB30vw4QjHJg344OezYva7wf1bC3JtWaxjjPGtyBz+HlhISNCpj7u8a4KWIaeEPGtRTqbUtWNQ2Q7DdJ2zpGR7l/xfV7XR/6LMf0ImZMgwBYbOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id C603B60C7B26D;
	Thu,  8 Aug 2024 20:23:45 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: sfrench@samba.org,
	pc@manguebit.com,
	ronniesahlberg@gmail.com,
	sprasad@microsoft.com,
	tom@talpey.com,
	bharathsm@microsoft.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] smb/client: avoid possible NULL dereference in cifs_free_subrequest()
Date: Thu,  8 Aug 2024 20:23:32 +0800
Message-Id: <20240808122331.342473-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker (scan-build) warning:
	cifsglob.h:line 890, column 3
	Access to field 'ops' results in a dereference of a null pointer.

Commit 519be989717c ("cifs: Add a tracepoint to track credits involved in
R/W requests") adds a check for 'rdata->server', and let clang throw this
warning about NULL dereference.

When 'rdata->credits.value != 0 && rdata->server == NULL' happens,
add_credits_and_wake_if() will call rdata->server->ops->add_credits().
This will cause NULL dereference problem. Add a check for 'rdata->server'
to avoid NULL dereference.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/smb/client/file.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index b2405dd4d4d4..45459af5044d 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -315,7 +315,7 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
 #endif
 	}
 
-	if (rdata->credits.value != 0)
+	if (rdata->credits.value != 0) {
 		trace_smb3_rw_credits(rdata->rreq->debug_id,
 				      rdata->subreq.debug_index,
 				      rdata->credits.value,
@@ -323,8 +323,12 @@ static void cifs_free_subrequest(struct netfs_io_subrequest *subreq)
 				      rdata->server ? rdata->server->in_flight : 0,
 				      -rdata->credits.value,
 				      cifs_trace_rw_credits_free_subreq);
+		if (rdata->server)
+			add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
+		else
+			rdata->credits.value = 0;
+	}
 
-	add_credits_and_wake_if(rdata->server, &rdata->credits, 0);
 	if (rdata->have_xid)
 		free_xid(rdata->xid);
 }
-- 
2.30.2

