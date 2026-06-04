Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ECE3A383C
	for <llvm@lists.linux.dev>; Thu,  4 Jun 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569206; cv=none; b=p/v4PxUyu3bxHYf6dUg/ukTgO+r2d6WHO+gVaG3l1gFgCvofaNG9T9qB8otlBpa1QgKOKmnt2Wbh4Gc6pKtIgLctup/HdDYgVF7sxVw1Mu+jMrnUGSoYRKFZbk75j3O2pTJTUHXWs/yotZ+eHOB04CryyLkQBRzAMTQ9+y0J9PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569206; c=relaxed/simple;
	bh=ARcek2FIaoN1gTuInpg1/4ZJULjYq1Im45gBx1yBdUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HNibTzzACllI3oFiHRItZ7iGmXRqKsjlybBCtstuEuQSzqpUBPP3oCVokbxeOnAhkKvCThQKkIvtp0csEz0ihQjh0Qb2+YnNArZrjEg2Pk16wHOyWYE+Fr8uzNP/kPQoUAik4W80zha4ofGh9aPEQlF5kzyPvGvUkgo4as4j8SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5EyzVLa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5EyzVLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780569204; x=1812105204;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ARcek2FIaoN1gTuInpg1/4ZJULjYq1Im45gBx1yBdUA=;
  b=N5EyzVLarzItA/vD+OOWmNoEBtWtytecy5Es/X9CWCkHeCSb3xxQpD+m
   lMCcu9WraocAd6xNo3U5JKHicPx8sZU3sBhx92X+Oywv4/7itZTJyyOG2
   K4KzVLmCfPadN76+VAlO+kbQPGOowaSPpUU5vyt0pMIKI8EAvO7q6RbQC
   RO02evCnmUocrfrIPWXJIXvJJUE++1MymcZ7UpWu5kydvLMK9c9pCmlfu
   +o1Yl9IpQ9qWEb/KYt/Sfvd+VfAmRdXNGgd4mdM2WpkMJcv6O68ese7KR
   jr+a0Jb2ilb/+m8zikno3ALS1DsmPA2hysCspaeGHP1NrLcru39MLE01c
   Q==;
X-CSE-ConnectionGUID: H2PjznuTQziTFY1iWwYblA==
X-CSE-MsgGUID: 8v5pWuojQVGgyjFTjPLPLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81575557"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="81575557"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 03:33:24 -0700
X-CSE-ConnectionGUID: espMLuuITu+n3FmkWvssWQ==
X-CSE-MsgGUID: 0hhHHvCzQ4SxsxpNvJhPOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="241536848"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jun 2026 03:33:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 81A7C98; Thu, 04 Jun 2026 12:33:20 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	codalist@coda.cs.cmu.edu,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jan Harkes <jaharkes@cs.cmu.edu>,
	coda@cs.cmu.edu,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: [PATCH v1 1/1] coda: Remove set but unused variables
Date: Thu,  4 Jun 2026 12:33:19 +0200
Message-ID: <20260604103319.342158-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clang compiler is not happy with set and unused variables:

  fs/coda/upcall.c:115:27: error: variable 'outp' set but not used [-Werror,-Wunused-but-set-variable]
  ...
  fs/coda/upcall.c:577:20: error: variable 'outp' set but not used [-Werror,-Wunused-but-set-variable]

Clean up the unused variables and associated unused code pieces.
To make this happen, introduce a new UPARG_NO_OUTP() helper macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 fs/coda/upcall.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/fs/coda/upcall.c b/fs/coda/upcall.c
index 3438119b5dcf..3ed04d758322 100644
--- a/fs/coda/upcall.c
+++ b/fs/coda/upcall.c
@@ -66,6 +66,13 @@ do {\
         outsize = insize; \
 } while (0)
 
+#define UPARG_NO_OUTP(op)\
+do {\
+	inp = (union inputArgs *)alloc_upcall(op, insize); \
+	if (IS_ERR(inp)) { return PTR_ERR(inp); }\
+	outsize = insize; \
+} while (0)
+
 #define INSIZE(tag) sizeof(struct coda_ ## tag ## _in)
 #define OUTSIZE(tag) sizeof(struct coda_ ## tag ## _out)
 #define SIZE(tag)  max_t(unsigned int, INSIZE(tag), OUTSIZE(tag))
@@ -112,11 +119,10 @@ int venus_setattr(struct super_block *sb, struct CodaFid *fid,
 		  struct coda_vattr *vattr)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
 	
 	insize = SIZE(setattr);
-	UPARG(CODA_SETATTR);
+	UPARG_NO_OUTP(CODA_SETATTR);
 
         inp->coda_setattr.VFid = *fid;
 	inp->coda_setattr.attr = *vattr;
@@ -161,11 +167,10 @@ int venus_close(struct super_block *sb, struct CodaFid *fid, int flags,
 		kuid_t uid)
 {
 	union inputArgs *inp;
-	union outputArgs *outp;
 	int insize, outsize, error;
 	
 	insize = SIZE(release);
-	UPARG(CODA_CLOSE);
+	UPARG_NO_OUTP(CODA_CLOSE);
 	
 	inp->ih.uid = from_kuid(&init_user_ns, uid);
         inp->coda_close.VFid = *fid;
@@ -235,14 +240,13 @@ int venus_rename(struct super_block *sb, struct CodaFid *old_fid,
 		 const char *new_name)
 {
 	union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error; 
 	int offset, s;
 	
 	offset = INSIZE(rename);
 	insize = max_t(unsigned int, offset + new_length + old_length + 8,
 		     OUTSIZE(rename)); 
- 	UPARG(CODA_RENAME);
+	UPARG_NO_OUTP(CODA_RENAME);
 
         inp->coda_rename.sourceFid = *old_fid;
         inp->coda_rename.destFid =  *new_fid;
@@ -303,13 +307,12 @@ int venus_rmdir(struct super_block *sb, struct CodaFid *dirfid,
 		    const char *name, int length)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
         int offset;
 
         offset = INSIZE(rmdir);
 	insize = max_t(unsigned int, offset + length + 1, OUTSIZE(rmdir));
-	UPARG(CODA_RMDIR);
+	UPARG_NO_OUTP(CODA_RMDIR);
 
         inp->coda_rmdir.VFid = *dirfid;
         inp->coda_rmdir.name = offset;
@@ -326,12 +329,11 @@ int venus_remove(struct super_block *sb, struct CodaFid *dirfid,
 		    const char *name, int length)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int error=0, insize, outsize, offset;
 
         offset = INSIZE(remove);
 	insize = max_t(unsigned int, offset + length + 1, OUTSIZE(remove));
-	UPARG(CODA_REMOVE);
+	UPARG_NO_OUTP(CODA_REMOVE);
 
         inp->coda_remove.VFid = *dirfid;
         inp->coda_remove.name = offset;
@@ -380,13 +382,12 @@ int venus_link(struct super_block *sb, struct CodaFid *fid,
 		  struct CodaFid *dirfid, const char *name, int len )
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
         int offset;
 
 	offset = INSIZE(link);
 	insize = max_t(unsigned int, offset  + len + 1, OUTSIZE(link));
-        UPARG(CODA_LINK);
+        UPARG_NO_OUTP(CODA_LINK);
 
         inp->coda_link.sourceFid = *fid;
         inp->coda_link.destFid = *dirfid;
@@ -407,13 +408,12 @@ int venus_symlink(struct super_block *sb, struct CodaFid *fid,
 		     const char *symname, int symlen)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
         int offset, s;
 
         offset = INSIZE(symlink);
 	insize = max_t(unsigned int, offset + len + symlen + 8, OUTSIZE(symlink));
-	UPARG(CODA_SYMLINK);
+	UPARG_NO_OUTP(CODA_SYMLINK);
         
         /*        inp->coda_symlink.attr = *tva; XXXXXX */ 
         inp->coda_symlink.VFid = *fid;
@@ -440,11 +440,10 @@ int venus_symlink(struct super_block *sb, struct CodaFid *fid,
 int venus_fsync(struct super_block *sb, struct CodaFid *fid)
 {
         union inputArgs *inp;
-        union outputArgs *outp; 
 	int insize, outsize, error;
 	
 	insize=SIZE(fsync);
-	UPARG(CODA_FSYNC);
+	UPARG_NO_OUTP(CODA_FSYNC);
 
 	inp->coda_fsync.VFid = *fid;
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
@@ -456,11 +455,10 @@ int venus_fsync(struct super_block *sb, struct CodaFid *fid)
 int venus_access(struct super_block *sb, struct CodaFid *fid, int mask)
 {
         union inputArgs *inp;
-        union outputArgs *outp; 
 	int insize, outsize, error;
 
 	insize = SIZE(access);
-	UPARG(CODA_ACCESS);
+	UPARG_NO_OUTP(CODA_ACCESS);
 
         inp->coda_access.VFid = *fid;
         inp->coda_access.flags = mask;
@@ -574,7 +572,6 @@ int venus_access_intent(struct super_block *sb, struct CodaFid *fid,
 			size_t count, loff_t ppos, int type)
 {
 	union inputArgs *inp;
-	union outputArgs *outp;
 	int insize, outsize, error;
 	bool finalizer =
 		type == CODA_ACCESS_TYPE_READ_FINISH ||
@@ -584,7 +581,7 @@ int venus_access_intent(struct super_block *sb, struct CodaFid *fid,
 		return 0;
 
 	insize = SIZE(access_intent);
-	UPARG(CODA_ACCESS_INTENT);
+	UPARG_NO_OUTP(CODA_ACCESS_INTENT);
 
 	inp->coda_access_intent.VFid = *fid;
 	inp->coda_access_intent.count = count;
-- 
2.50.1

